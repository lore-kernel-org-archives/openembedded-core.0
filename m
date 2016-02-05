Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 919FE7732D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 17:07:36 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 71so415035pfv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 09:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:in-reply-to:references:content-type:content-transfer-encoding;
	bh=+tasAV0+Y2BoS8djS7HR76sBacNOlNLm5BChZtd2xa4=;
	b=deQHIWNBvolFZX7YYfxq2i1yF7sPg/hNAnPpFDZsJXE3F6VtimRqbAPALQ40hKdPrN
	VZN3JSTCjKc8vD5X/pEVUS1ge+BV89RVnAoNjndJCKZoIOR3FElZ199uTSYFVDaL0ibn
	QEbuL6XuEc1xacI+sLw1FbIIAtVsXYOT2GUKBK7yMo6Fg+kRBeeu+8EdLnZu9wsGaici
	xliXmMq6p9WCmL20Eu0KF8M4gHnc0Lx4xfMJeP5FcwQIkigi8YU5nNsuJfxqp814w6xh
	PhSO7TlhOEZKTB6LzQ78uvdTWH6huVQNLaOHlJh3/bVPn/VRNea8XDBHF3JO01HT71W4
	sXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:in-reply-to:references:content-type
	:content-transfer-encoding;
	bh=+tasAV0+Y2BoS8djS7HR76sBacNOlNLm5BChZtd2xa4=;
	b=fbhNo5e1oOx0oEUo0Y8e7vjwUnBBHyMG9oQt0WTEbslZhvpDzJW1lA2eUOs5RFQpbW
	45g+PuUFspnnwryvXvUFDnJULbRSGKrBnpx0zUzI7BzFq/yJgFKN/Jq54NaKFA4QxS7f
	EsHqsR3Kwv9JVWQWuOrVUVw2+i8P50lEq4L8aACcPpV+qAvgvxV0PB+j00JBFsyfbriX
	IiRI1TnzTEiwscqdt+oQtQDoAnKW13s5rBKv8QdvKB0ridFbeYLsieWBiHj/KUiI5rTt
	nbwNFtqBWqr1g4HcgFgbt+T5E+5gM7NxtoZ+1l0L1QcxvEDBIfziH81L5ywAI9dKG3RS
	UgxA==
X-Gm-Message-State: AG10YORxvgrMt4uiKo9ncV90IFDcfAXjWcqbBZ+77vk47fajA/mwXDhpbqZeX9aHK7eFBw==
X-Received: by 10.98.68.212 with SMTP id m81mr21215570pfi.135.1454692057127;
	Fri, 05 Feb 2016 09:07:37 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	tp3sm25783064pac.16.2016.02.05.09.07.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 09:07:35 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Fri,  5 Feb 2016 09:07:16 -0800
Message-Id: <dea50e1fdabad3db115019b1ffe27509b77b4815.1454691935.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454691935.git.akuster@mvista.com>
References: <cover.1454691935.git.akuster@mvista.com>
MIME-Version: 1.0
In-Reply-To: <cover.1454691935.git.akuster@mvista.com>
References: <cover.1454691935.git.akuster@mvista.com>
Subject: [PATCH 2/4] nettle: Security fix CVE-2015-8804
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Feb 2016 17:07:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../nettle/nettle-3.1.1/CVE-2015-8804.patch        | 281 +++++++++++++++++++++
 meta/recipes-support/nettle/nettle_3.1.1.bb        |   1 +
 2 files changed, 282 insertions(+)
 create mode 100644 meta/recipes-support/nettle/nettle-3.1.1/CVE-2015-8804.patch

diff --git a/meta/recipes-support/nettle/nettle-3.1.1/CVE-2015-8804.patch b/meta/recipes-support/nettle/nettle-3.1.1/CVE-2015-8804.patch
new file mode 100644
index 0000000..1d34db7
--- /dev/null
+++ b/meta/recipes-support/nettle/nettle-3.1.1/CVE-2015-8804.patch
@@ -0,0 +1,281 @@
+Upstream-Status: Backport
+ https://git.lysator.liu.se/nettle/nettle/commit/fa269b6ad06dd13c901dbd84a12e52b918a09cd7
+
+CVE: CVE-2015-8804
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: nettle-3.1.1/ChangeLog
+===================================================================
+--- nettle-3.1.1.orig/ChangeLog
++++ nettle-3.1.1/ChangeLog
+@@ -1,3 +1,11 @@
++2015-12-15  Niels Möller  <nisse@lysator.liu.se>
++
++	* x86_64/ecc-384-modp.asm: Fixed carry propagation bug. Problem
++	reported by Hanno Böck. Simplified the folding to always use
++	non-negative carry, the old code attempted to add in a carry which
++	could be either positive or negative, but didn't get that case
++	right.
++
+ 2015-12-10  Niels Möller  <nisse@lysator.liu.se>
+ 
+    * ecc-256.c (ecc_256_modp): Fixed carry propagation bug. Problem
+Index: nettle-3.1.1/x86_64/ecc-384-modp.asm
+===================================================================
+--- nettle-3.1.1.orig/x86_64/ecc-384-modp.asm
++++ nettle-3.1.1/x86_64/ecc-384-modp.asm
+@@ -1,7 +1,7 @@
+ C x86_64/ecc-384-modp.asm
+ 
+ ifelse(<
+-   Copyright (C) 2013 Niels Möller
++   Copyright (C) 2013, 2015 Niels Möller
+ 
+    This file is part of GNU Nettle.
+ 
+@@ -33,7 +33,7 @@ ifelse(<
+ 	.file "ecc-384-modp.asm"
+ 
+ define(<RP>, <%rsi>)
+-define(<D4>, <%rax>)
++define(<D5>, <%rax>)
+ define(<T0>, <%rbx>)
+ define(<T1>, <%rcx>)
+ define(<T2>, <%rdx>)
+@@ -48,8 +48,8 @@ define(<H4>, <%r13>)
+ define(<H5>, <%r14>)
+ define(<C2>, <%r15>)
+ define(<C0>, H5)	C Overlap
+-define(<D0>, RP)	C Overlap
+-define(<TMP>, H4)	C Overlap
++define(<TMP>, RP)	C Overlap
++
+ 
+ PROLOGUE(nettle_ecc_384_modp)
+ 	W64_ENTRY(2, 0)
+@@ -61,34 +61,38 @@ PROLOGUE(nettle_ecc_384_modp)
+ 	push	%r14
+ 	push	%r15
+ 
+-	C First get top 2 limbs, which need folding twice
++	C First get top 2 limbs, which need folding twice.
++	C B^10 = B^6 + B^4 + 2^32 (B-1)B^4.
++	C We handle the terms as follow:
+ 	C
+-	C   H5 H4
+-	C     -H5
+-	C  ------
+-	C   H0 D4
++	C B^6: Folded immediatly.
+ 	C
+-	C Then shift right, (H1,H0,D4)  <--  (H0,D4) << 32
+-	C and add
++	C B^4: Delayed, added in in the next folding.
+ 	C
+-	C     H5 H4
+-	C     H1 H0
+-	C ----------
+-	C  C2 H1 H0
+-
+-	mov	80(RP), D4
+-	mov	88(RP), H0
+-	mov	D4, H4
+-	mov	H0, H5
+-	sub	H0, D4
+-	sbb	$0, H0
+-
+-	mov	D4, T2
+-	mov	H0, H1
+-	shl	$32, H0
+-	shr	$32, T2
++	C 2^32(B-1) B^4: Low half limb delayed until the next
++	C folding. Top 1.5 limbs subtracted and shifter now, resulting
++	C in 2.5 limbs. The low limb saved in D5, high 1.5 limbs added
++	C in.
++
++	mov	80(RP), H4
++	mov	88(RP), H5
++	C Shift right 32 bits, into H1, H0
++	mov	H4, H0
++	mov	H5, H1
++	mov	H5, D5
+ 	shr	$32, H1
+-	or	T2, H0
++	shl	$32, D5
++	shr	$32, H0
++	or	D5, H0
++
++	C	H1 H0
++	C       -  H1 H0
++	C       --------
++	C       H1 H0 D5
++	mov	H0, D5
++	neg	D5
++	sbb	H1, H0
++	sbb	$0, H1
+ 
+ 	xor	C2, C2
+ 	add	H4, H0
+@@ -127,118 +131,95 @@ PROLOGUE(nettle_ecc_384_modp)
+ 	adc	H3, T5
+ 	adc	$0, C0
+ 
+-	C   H3 H2 H1 H0  0
+-	C - H4 H3 H2 H1 H0
+-	C  ---------------
+-	C   H3 H2 H1 H0 D0
+-
+-	mov	XREG(D4), XREG(D4)
+-	mov	H0, D0
+-	neg	D0
+-	sbb	H1, H0
+-	sbb	H2, H1
+-	sbb	H3, H2
+-	sbb	H4, H3
+-	sbb	$0, D4
+-
+-	C Shift right. High bits are sign, to be added to C0.
+-	mov	D4, TMP
+-	sar	$32, TMP
+-	shl	$32, D4
+-	add	TMP, C0
+-
++	C Shift left, including low half of H4
+ 	mov	H3, TMP
++	shl	$32, H4
+ 	shr	$32, TMP
+-	shl	$32, H3
+-	or	TMP, D4
++	or	TMP, H4
+ 
+ 	mov	H2, TMP
++	shl	$32, H3
+ 	shr	$32, TMP
+-	shl	$32, H2
+ 	or	TMP, H3
+ 
+ 	mov	H1, TMP
++	shl	$32, H2
+ 	shr	$32, TMP
+-	shl	$32, H1
+ 	or	TMP, H2
+ 
+ 	mov	H0, TMP
++	shl	$32, H1
+ 	shr	$32, TMP
+-	shl	$32, H0
+ 	or	TMP, H1
+ 
+-	mov	D0, TMP
+-	shr	$32, TMP
+-	shl	$32, D0
+-	or	TMP, H0
++	shl	$32, H0
++
++	C   H4 H3 H2 H1 H0  0
++	C  -   H4 H3 H2 H1 H0
++	C  ---------------
++	C   H4 H3 H2 H1 H0 TMP
+ 
+-	add	D0, T0
++	mov	H0, TMP
++	neg	TMP
++	sbb	H1, H0
++	sbb	H2, H1
++	sbb	H3, H2
++	sbb	H4, H3
++	sbb	$0, H4
++
++	add	TMP, T0
+ 	adc	H0, T1
+ 	adc	H1, T2
+ 	adc	H2, T3
+ 	adc	H3, T4
+-	adc	D4, T5
++	adc	H4, T5
+ 	adc	$0, C0
+ 
+ 	C Remains to add in C2 and C0
+-	C                         C0  C0<<32  (-2^32+1)C0
+-	C    C2  C2<<32  (-2^32+1)C2
+-	C where C2 is always positive, while C0 may be -1.
++	C Set H1, H0 = (2^96 - 2^32 + 1) C0
+ 	mov	C0, H0
+ 	mov	C0, H1
+-	mov	C0, H2
+-	sar	$63, C0		C Get sign
+ 	shl	$32, H1
+-	sub	H1, H0		C Gives borrow iff C0 > 0
++	sub	H1, H0
+ 	sbb	$0, H1
+-	add	C0, H2
+ 
++	C Set H3, H2 = (2^96 - 2^32 + 1) C2
++	mov	C2, H2
++	mov	C2, H3
++	shl	$32, H3
++	sub	H3, H2
++	sbb	$0, H3
++	add	C0, H2		C No carry. Could use lea trick
++
++	xor	C0, C0
+ 	add	H0, T0
+ 	adc	H1, T1
+-	adc	$0, H2
+-	adc	$0, C0
+-
+-	C Set (H1 H0)  <-- C2 << 96 - C2 << 32 + 1
+-	mov	C2, H0
+-	mov	C2, H1
+-	shl	$32, H1
+-	sub	H1, H0
+-	sbb	$0, H1
+-
+-	add	H2, H0
+-	adc	C0, H1
+-	adc	C2, C0
+-	mov	C0, H2
+-	sar	$63, C0
+-	add	H0, T2
+-	adc	H1, T3
+-	adc	H2, T4
+-	adc	C0, T5
+-	sbb	C0, C0
++	adc	H2, T2
++	adc	H3, T3
++	adc	C2, T4
++	adc	D5, T5		C Value delayed from initial folding
++	adc	$0, C0		C Use sbb and switch sign?
+ 
+ 	C Final unlikely carry
+ 	mov	C0, H0
+ 	mov	C0, H1
+-	mov	C0, H2
+-	sar	$63, C0
+ 	shl	$32, H1
+ 	sub	H1, H0
+ 	sbb	$0, H1
+-	add	C0, H2
+ 
+ 	pop	RP
+ 
+-	sub	H0, T0
++	add	H0, T0
+ 	mov	T0, (RP)
+-	sbb	H1, T1
++	adc	H1, T1
+ 	mov	T1, 8(RP)
+-	sbb	H2, T2
++	adc	C0, T2
+ 	mov	T2, 16(RP)
+-	sbb	C0, T3
++	adc	$0, T3
+ 	mov	T3, 24(RP)
+-	sbb	C0, T4
++	adc	$0, T4
+ 	mov	T4, 32(RP)
+-	sbb	C0, T5
++	adc	$0, T5
+ 	mov	T5, 40(RP)
+ 
+ 	pop	%r15
diff --git a/meta/recipes-support/nettle/nettle_3.1.1.bb b/meta/recipes-support/nettle/nettle_3.1.1.bb
index 1fe3461..4a40e9a 100644
--- a/meta/recipes-support/nettle/nettle_3.1.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.1.1.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSERv3;md5=6a6a8e020838b23406c81b19c1d46df6
 
 SRC_URI += "\
             file://CVE-2015-8803_8805.patch \
+            file://CVE-2015-8804.patch \
             "
 
 SRC_URI[md5sum] = "b40fa88dc32f37a182b6b42092ebb144"
-- 
2.3.5


