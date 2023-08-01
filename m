Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A788C0015E
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:41:48 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.7590.1690875704017811941
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:41:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="126655414"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="126655414"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:41:42 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7622DD5041
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:40 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B8032D3F16
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:39 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id C522A2FC8177;
	Tue,  1 Aug 2023 16:41:38 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gmp: upgrade 6.2.1 -> 6.3.0
Date: Tue,  1 Aug 2023 15:41:14 +0800
Message-Id: <1690875687-21573-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
References: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27786.005
X-TMASE-Result: 10--8.220900-10.000000
X-TMASE-MatchedRID: FBE0XpCroJijz0nOeth/yTo39wOA02LhQRlUSJjs8Z8H4DTIEE89jLlR
	DJlAaWLLPwLvC4teLccGf1fvGgsKkTWMGExKAErBCtzGvPCy/m4E9jhJ6ArePEWazpgSzbcPoLe
	GyPisKp3hS2D+Cu5xlgFMzJmZTqOYYr3mRifQt8oapIb9znReA5GAt645FF0SHxWKE4YDWmG8sE
	3bFhYTJiqq0O5S3DJ8Lfwz7bjtDsHc2Rqz++uLDvx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78FH
	rw7frluNIBrw7gT13Qv/zJQ0aiPJpFCdtV6Jf3WKiJEqUFWRggsCSoags4adYByPQdXYSHP06IY
	WN6ouQKuVMLwi6djTxBLu4HBju7GfmpY4OvTCPLZJrfdkZdZ1kLixrsCJ1jTwSC6qIZ5nkmjxYy
	RBa/qJShNCXvA0fw+A/nNPR3f3dw7AFczfjr/7HS5d3XJbz+0Nb8ZNjL/DtGtUpGz6IxN+La9F1
	5Lu9mq2nj3HdFfbWg=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 07:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185197

From: Wang Mingyu <wangmy@fujitsu.com>

cve-2021-43618.patch
removed since it's included in 6.3.0

Changelog:
============
  BUGS FIXED
  * A possible overflow of type int is avoided for mpz_cmp on huge operands.

  * A possible error condition when a malformed file is read with
    mpz_inp_raw is now correctly handled.

  FEATURES
  * New public function mpz_prevprime, companion of the existing
    mpz_nextprime.

  * New documented pointer types mpz_ptr, mpz_srcptr, and similar for
    other GMP types. Refer to the manual for full list and suggested
    usage. These types have been present in gmp.h at least since
    GMP-4.0, but previously not advertised to users.

  * Support for 64-bit Arm under Macos.

  * Support for the loongarch64 CPU family.

  * Support for building with LTO, link-time optimisations.

  SPEEDUPS
  * New special code for base = 2 in mpz_powm reduces the average time
    for the functions that test primality.

  * Speedup for the function mpz_nextprime on large operands.

  * Speedup for multiplications (some sizes only) thanks to new
    internal functions to compute small negacyclic products.

  * Special assembly code for IBM z13 and later "mainframe" CPUs, resulting in
    a huge speedup.

  * Improved assembly for several 64-bit x86 CPUs, Risc-V, 64-bit Arm.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gmp/gmp/cve-2021-43618.patch              | 27 -------------------
 .../gmp/{gmp_6.2.1.bb => gmp_6.3.0.bb}        |  4 +--
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 meta/recipes-support/gmp/gmp/cve-2021-43618.patch
 rename meta/recipes-support/gmp/{gmp_6.2.1.bb => gmp_6.3.0.bb} (87%)

diff --git a/meta/recipes-support/gmp/gmp/cve-2021-43618.patch b/meta/recipes-support/gmp/gmp/cve-2021-43618.patch
deleted file mode 100644
index 095fb21eaa..0000000000
--- a/meta/recipes-support/gmp/gmp/cve-2021-43618.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-CVE: CVE-2021-43618
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-# HG changeset patch
-# User Marco Bodrato <bodrato@mail.dm.unipi.it>
-# Date 1634836009 -7200
-# Node ID 561a9c25298e17bb01896801ff353546c6923dbd
-# Parent  e1fd9db13b475209a864577237ea4b9105b3e96e
-mpz/inp_raw.c: Avoid bit size overflows
-
-diff -r e1fd9db13b47 -r 561a9c25298e mpz/inp_raw.c
---- a/mpz/inp_raw.c	Tue Dec 22 23:49:51 2020 +0100
-+++ b/mpz/inp_raw.c	Thu Oct 21 19:06:49 2021 +0200
-@@ -88,8 +88,11 @@
- 
-   abs_csize = ABS (csize);
- 
-+  if (UNLIKELY (abs_csize > ~(mp_bitcnt_t) 0 / 8))
-+    return 0; /* Bit size overflows */
-+
-   /* round up to a multiple of limbs */
--  abs_xsize = BITS_TO_LIMBS (abs_csize*8);
-+  abs_xsize = BITS_TO_LIMBS ((mp_bitcnt_t) abs_csize * 8);
- 
-   if (abs_xsize != 0)
-     {
diff --git a/meta/recipes-support/gmp/gmp_6.2.1.bb b/meta/recipes-support/gmp/gmp_6.3.0.bb
similarity index 87%
rename from meta/recipes-support/gmp/gmp_6.2.1.bb
rename to meta/recipes-support/gmp/gmp_6.3.0.bb
index 29055492c2..3dbcd68b5c 100644
--- a/meta/recipes-support/gmp/gmp_6.2.1.bb
+++ b/meta/recipes-support/gmp/gmp_6.3.0.bb
@@ -14,10 +14,8 @@ SRC_URI = "https://gmplib.org/download/${BPN}/${BP}${REVISION}.tar.bz2 \
            file://use-includedir.patch \
            file://0001-Append-the-user-provided-flags-to-the-auto-detected-.patch \
            file://0001-confiure.ac-Believe-the-cflags-from-environment.patch \
-           file://cve-2021-43618.patch \
            "
-SRC_URI[md5sum] = "28971fc21cf028042d4897f02fd355ea"
-SRC_URI[sha256sum] = "eae9326beb4158c386e39a356818031bd28f3124cf915f8c5b1dc4c7a36b4d7c"
+SRC_URI[sha256sum] = "ac28211a7cfb609bae2e2c8d6058d66c8fe96434f740cf6fe2e47b000d1c20cb"
 
 acpaths = ""
 
-- 
2.34.1


