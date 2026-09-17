Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF197C982D0
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:27 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1605.1789682907176443558
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=n6a/ikxs;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so589385e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682905; x=1790287705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xvoCvVqKwp0kRbUT0PPavSLMb9czOmuyic7G8fYjwM0=;
        b=n6a/ikxsPy6yMFohKpnARQvGBYWI7hp/jaACZBj5THNPn5XE/gYcMeVNFMKi3LQ5lw
         iKFtlXcOn9a3joqT6vU9SAYRWq3rgEiH97VSbLSrHpqKac/zeFHL+I7KDVyjO3Ekx1kc
         50j2TBBwAcSS5SKGpFkbfuW7V6njO6nCT62TQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682905; x=1790287705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xvoCvVqKwp0kRbUT0PPavSLMb9czOmuyic7G8fYjwM0=;
        b=SiukbHf+PnqNGGKooscY7pHHi96XIQl9aTd51glhGaXb84+4J2ySNI/pHsrcaepmhR
         ZBbiY6Y5hLtXtO2Y83/MtVVuDKF9P/ESIPkblkXLzeguoiYdZ6+cMsJ98ZeiSmbng8Su
         iD6zqjSMiNc2foEECGPCYfoo82fyu0lC4D7XK+rpM1gzSliv9TZkPeCtynpPaHJ6iy+B
         Qsm7IbR2aFYF0Zxf85lSFqr/VKAcLg4B/OFsp0NaWaP1Pfp7yPzmLjtndEHJX2ErsEd0
         GmtuneAZUxtaRrYKL8jjAz31BKHB//1kmGGQvthbCDQh7fPOFQEHVcnTGz+ucwaRHrSy
         P/Qg==
X-Gm-Message-State: AFuF++nrX6SOgPe2Rh2u7OzgY/84c5ps6wi+RODPzRZlGce6vAGiQLdD
	mFgrHGlBRqcZN2HHoHyyedY7kbXNsmnjYcv1gIMlkO3N2aTxf2ZDybj3Sjq7h8Ro8dn56ViE7yS
	EelkaKD4=
X-Gm-Gg: AYBFou0hdxl/1f5BNWrT/KTx4n3rmORUpq63g3GDzworh387lbY/oKEGEGbd7KVn4PY
	Ku9PNgPQ9m1Q8VAop8TceMZ/J5qrA66D8vzqYPvY3IgehHM46snTA4M+/57rRIVjQ2oLlw139um
	xf/9pZKrR6qH59uSRbzBv34FfzqF8IdXjjdJB8IfcmpVmz6sk7CcAwVWV/RkoYDEonIW1zcbn0M
	xygPNtFQiILv3jwYdrqQy6qBS4W30PtNVi9p4Igfq4gw4NCPJLDe98fdFbp/l1OzvWpQnyQd6YR
	84txwUhO82QHvyQPH5RZI35pN8jOtfiT/E4t3ccActw4KjMqwskzEjDaky3ACyGSG3Md7y3zHRh
	rhhMilTBps3wpJrUcVtvBwuJeW9q3z1Dk0o9qBUYT4OQ0mlZQoyWFIf0qhfRuzgk1zUhqLRmBuG
	WdwQmCvWGzSUeazhMhZl8x5UlbA/HUvyIiDxL3LgaGm5Bu/ee5yVYNxRHXCC/C7+R8AZKDp3n74
	p34x7bl4jhzMKR+rdvNrxSN7d0xWmXQYrK3rNxZo+MNbgbQLE2GoLvHwXMmKQYJZcIRA4Putmf7
	Rz/u/59Elw==
X-Received: by 2002:a05:600c:8709:b0:49d:870:7a69 with SMTP id 5b1f17b1804b1-49fc573514bmr6106915e9.12.1789682905338;
        Thu, 17 Sep 2026 15:08:25 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:24 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 66/79] libpcap: Fix CVE-2026-6554
Date: Fri, 18 Sep 2026 00:06:51 +0200
Message-ID: <f2db943cf539d212fcf04c4e68e97c14c15f9e89.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246161

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-6554
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/ff3c83475ac303c6b681c52ad0b6e14795a8e0ce
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpcap/libpcap/05-CVE-2026-6554.patch    | 94 +++++++++++++++++++
 .../libpcap/libpcap_1.10.6.bb                 |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6554.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6554.patch b/meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6554.patch
new file mode 100644
index 00000000000..208225105d5
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6554.patch
@@ -0,0 +1,94 @@
+From ee37e79521d28a04b09f5c37b835ae7955c15e75 Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <denis@ovsienko.info>
+Date: Thu, 30 Jul 2026 13:34:33 +0100
+Subject: [PATCH] CVE-2026-6554: Limit "ja L" looping in pcap_offline_filter().
+
+This vulnerability has been discovered by Kaixuan LI.
+
+The current revision of pcapint_filter_with_aux_data() assumes that any
+"ja L" instruction in a filter program does not jump to itself or to a
+prior instruction that is guaranteed to reach the same "ja L" again.
+This holds for programs that have been generated by libpcap.
+
+However, this does not necessarily hold for programs that come from an
+external source via pcap_offline_filter() or [deprecated] bpf_filter().
+If the interpreter executes such a program, upon reaching such an
+instruction it will begin looping infinitely.
+
+To mitigate this problem, in pcapint_filter_with_aux_data() enforce a
+hard-coded limit on the number of backward jumps per packet.  Ibid., and
+in pcapint_validate_filter() as well, reject the only immediately
+detectable case of an infinite loop.
+
+(backported from commit 63c005c25aeabf1404968add49fc885da3e127e0)
+
+(cherry picked from commit ff3c83475ac303c6b681c52ad0b6e14795a8e0ce)
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/ff3c83475ac303c6b681c52ad0b6e14795a8e0ce]
+CVE: CVE-2026-6554
+
+Notes on backporting to 1.10.6:
+ - The stray BPF_S_ANC_* enum removed upstream in 1.10.7 (commit ff47ba55) is
+   still present in 1.10.6, so the new MAX_BACKWARD_JUMPS define is added
+   alongside it instead of replacing it.
+ - The upstream CHANGES/changelog hunk is not backported.
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/bpf_filter.c b/bpf_filter.c
+index 0178aae5..bc6d149f 100644
+--- a/bpf_filter.c
++++ b/bpf_filter.c
+@@ -70,6 +70,8 @@ enum {
+         BPF_S_ANC_VLAN_TAG_PRESENT,
+ };
+ 
++#define MAX_BACKWARD_JUMPS 64U
++
+ /*
+  * Kernel BPF implementations tend to define BPF_MAXINSNS to 512 or 4096, the
+  * userland interpreter in libpcap is meant to support much longer filter
+@@ -144,6 +146,7 @@ pcapint_filter_with_aux_data(const struct bpf_insn *pc, const u_int proglen,
+ 	A = 0;
+ 	X = 0;
+ 	const struct bpf_insn *pc0 = pc;
++	unsigned backward_jumps = 0;
+ 	--pc;
+ 	for (;;) {
+ 		++pc;
+@@ -318,6 +321,17 @@ DIAG_ON_DEFAULT_ONLY_SWITCH
+ 			 */
+ 			if ((bpf_u_int32)(pc - pc0) + 1 + pc->k >= proglen)
+ 				return 0;
++			/*
++			 * Terminate the program if this is a non-forward jump
++			 * and is:
++			 * - a guaranteed infinite loop because it jumps to
++			 *   itself (exactly the same as in the validator), or
++			 * - a backward jump after many enough backward jumps
++			 *   already made for this packet.
++			 */
++			if ((bpf_int32)pc->k < 0 && ((bpf_int32)pc->k == -1 ||
++			    backward_jumps++ >= MAX_BACKWARD_JUMPS))
++				return 0;
+ 			/*
+ 			 * XXX - we currently implement "ip6 protochain"
+ 			 * with backward jumps, so sign-extend pc->k.
+@@ -605,6 +619,17 @@ pcapint_validate_filter(const struct bpf_insn *f, int len)
+ 				 */
+ 				if (from + p->k >= (u_int)len)
+ 					return 0;
++				/*
++				 * The only type of infinite loop that can be
++				 * detected in this function is a "ja L" that
++				 * jumps to itself.  For this only k == -1
++				 * needs to be tested because the check above
++				 * has already rejected all other values that
++				 * would wrap the pointer equivalently on
++				 * 32-bit architectures.
++				 */
++				if ((bpf_int32)p->k == -1)
++					return 0;
+ 				break;
+ 			case BPF_JEQ:
+ 			case BPF_JGT:
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
index 258a15f5bac..6ca75117e17 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.xz \
 	   file://02-CVE-2026-31912.patch \
 	   file://03-CVE-2026-31911.patch \
 	   file://04-CVE-2026-6244.patch \
+	   file://05-CVE-2026-6554.patch \
           "
 SRC_URI[sha256sum] = "ec97d1206bdd19cb6bdd043eaa9f0037aa732262ec68e070fd7c7b5f834d5dfc"
 

