Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9A7FA78E68
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:35:35 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id e13-v6so1318436pff.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=FcrjJ6vqYkwbiMCZXXCcKJ8XuWefYQDIIkPkDfEhxNk=;
	b=pjl4B1TXAeJnWyNk8m8fVdCDnD7rtvVPlS4ow0d77A+cfs3Pe+RqK0jxliq+ylo3CR
	y625+Xs7aWh6NYeg8W8erlJOHvjTK97h2UEkAwaIMLbqsdYdsiZ5VcXkIIysn6DDMQHD
	7yLMhqTWUs/TZ/UkXC/IvPZw1AIvAEqXG742C2su5Ji5GcmpdaoQmrovFliJNP5vu4BZ
	y9W+azi1S4pRLS8cE1LMlRDkfEHOiCCr+zLThhPzxPqUN8QiRGpZxt5hXM11Mdk5WYhW
	IEpTgIXO7PWMKuUh970+e1x7En7b4rbWjnSqLTvXoZ/80trr/Ang0e8x1owDU4VT18rf
	VPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=FcrjJ6vqYkwbiMCZXXCcKJ8XuWefYQDIIkPkDfEhxNk=;
	b=sID0L6qHaIYjrH+Hq6lyJB8rXJwK/aJj+qFL3eHge9B0ciw3fgV9vnI/jx9draglpb
	XskieON+PKlsfbJRtTyjgsAc93UaAq5u5ezKPfwW3BJ9PuXKuNuH47cWgW+7JULtB8S2
	Xo8NfM21Lo9T560WJY2mCOEY4lQddK0f2G+FRg0jV50h+vqY4jG1HS2/CbCoPwWhJft2
	wDHYnZLNMwf3JvG8qGE7oA1RvTEew0pHe11RpQp8COyQPwgEl21B+IurUII3VS7FoYtk
	t7CC0xj1stBfqy2oqwENuGdKr+hEvUoar+ZVR3lihVBq1lNNdUXLwc06/CSEfqMpCIhn
	H+3g==
X-Gm-Message-State: AOUpUlEYpmE3VMK21TDUMRySF7QCGtKwFlueqsOWJq5459ehk8GzRZxh
	7sPpwyA9aJ3IuWPSSsXccDW39orv
X-Google-Smtp-Source: AA+uWPywDOQX9n5lx/SCnId29dZ5nJTCnA2pZoht0gOcIIdcW8H1u5Kgz/eQnlMn+Us3W6xdAKP2sQ==
X-Received: by 2002:a63:735d:: with SMTP id
	d29-v6mr3094665pgn.156.1533742536838; 
	Wed, 08 Aug 2018 08:35:36 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	q78-v6sm8290927pfi.185.2018.08.08.08.35.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 08:35:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 08:35:08 -0700
Message-Id: <1533742522-24357-13-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
References: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 13/27] binutls: Security fix for CVE-2017-15025
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
X-List-Received-Date: Wed, 08 Aug 2018 15:35:36 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.29.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2017-15025.patch         | 47 ++++++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-15025.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index c13cb50..8bd880c 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -48,6 +48,7 @@ SRC_URI = "\
      file://CVE-2017-15022.patch \
      file://CVE-2017-15023.patch \
      file://CVE-2017-15024.patch \
+     file://CVE-2017-15025.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-15025.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-15025.patch
new file mode 100644
index 0000000..ce53159
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-15025.patch
@@ -0,0 +1,47 @@
+From d8010d3e75ec7194a4703774090b27486b742d48 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sun, 24 Sep 2017 14:36:48 +0930
+Subject: [PATCH] PR22186, divide-by-zero in decode_line_info
+
+	PR 22186
+	* dwarf2.c (decode_line_info): Fail on lh.line_range of zero
+	rather than dividing by zero.
+
+Upstream-Status: Backport
+Affects: <= 2.29.1
+CVE: CVE-2017-15025
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog | 6 ++++++
+ bfd/dwarf2.c  | 2 ++
+ 2 files changed, 8 insertions(+)
+
+Index: git/bfd/dwarf2.c
+===================================================================
+--- git.orig/bfd/dwarf2.c
++++ git/bfd/dwarf2.c
+@@ -2432,6 +2432,8 @@ decode_line_info (struct comp_unit *unit
+ 	    case DW_LNS_set_basic_block:
+ 	      break;
+ 	    case DW_LNS_const_add_pc:
++	      if (lh.line_range == 0)
++		goto line_fail;
+ 	      if (lh.maximum_ops_per_insn == 1)
+ 		address += (lh.minimum_instruction_length
+ 			    * ((255 - lh.opcode_base) / lh.line_range));
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,10 @@
++2017-09-24  Alan Modra  <amodra@gmail.com>
++
++       PR 22186
++       * dwarf2.c (decode_line_info): Fail on lh.line_range of zero
++       rather than dividing by zero.
++
++
+ 2017-09-25  Alan Modra  <amodra@gmail.com>
+ 
+        PR 22200
-- 
2.7.4


