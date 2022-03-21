Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75055C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 22:29:41 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web09.2514.1647901780375670959
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 15:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=jUf9h4/q;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id l8so16745329pfu.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 15:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=telUtB11Dlt0PFx4XFy6rRsdf3/o+EF35esCP0MxyPE=;
        b=jUf9h4/qcBDS8CN+g0Ob4ytRyIMD/KOu3nwAinJke8XiXB2woF91AGPFtwjL861HKs
         wFnwYr5Y5HVsJSaAq7lAiTEoW8txtSi3+js2+zL1ULLDSFiPYuVZzKmTnxmolanlEP3g
         8ntian4TYlz+VMyXT5Iz0sfpDek1QO0aUMKi2KzFBp/HtPFM3vijC8+TtOtEb3Sqoual
         EPC0Nz7/79nFpNzqnqk6M46UoDavt8B3dTryRlqNiLapbNQPQiQ8c7eB+i1/Xke7imOE
         n1uydzAeBazXwISQ9ggQHUJ0gNaCDORQuAUoDD0kS+OYOpeM71Pnpi0pahqBgQ60c8ZE
         Orjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=telUtB11Dlt0PFx4XFy6rRsdf3/o+EF35esCP0MxyPE=;
        b=TBlY1eq4u4N0uF4FaJj76aubzLu/FUo6s0NIiaYAe6slMHbCgE4KYycZHl3PDnz8TI
         k3cEZI4b3yQfuPMoB4BjIjt/TRP/yzcwftz3eNQFn3F830WJXRKyuiT2V+kpItNssRNr
         8MaE+Vjhjdo+tey90vzSUGFNACCJGiTpLqVxSuT0p6qh8andOav8e4Kfc28MrD3DkQFK
         fJYWUyLp5UOyA2AS6oi2mhmVBVNfGVMSsUsqtwBfcvGc8NTKjv5knEVXBBFu0tqgFaoG
         eBfPSnq9okigeVIhQaxLbg+1EwPN0cFiLsJmxS8xCXkdrQxUYhthhoqoNc5LHkRqbOMA
         biEg==
X-Gm-Message-State: AOAM533r03Wol29gKmleSWaylGPqeZShmKTnynOD2lWzVDv7TnCA3Iox
	BxLzP4UBKprPyohH8qDIVim7tcvuBXSC+RA0TCM=
X-Google-Smtp-Source: 
 ABdhPJzOdS5pd8uSFt0A3MwF3Y7lBXz5QiomWzQ3IejiWF1//7dkEdYuH3tPAXANQNQrunoAlHgDgg==
X-Received: by 2002:a05:6a00:1683:b0:4f7:e497:6a55 with SMTP id
 k3-20020a056a00168300b004f7e4976a55mr26173923pfc.21.1647901779328;
        Mon, 21 Mar 2022 15:29:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 k13-20020aa7820d000000b004fa72a52040sm12352649pfi.172.2022.03.21.15.29.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 15:29:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/13] openssl: upgrade 1.1.1l -> 1.1.1n
Date: Mon, 21 Mar 2022 12:29:06 -1000
Message-Id: 
 <4d33b7ce0c50af81a01014a7d7d37c93a041a28d.1647901591.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1647901591.git.steve@sakoman.com>
References: <cover.1647901591.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Mar 2022 22:29:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163519

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Upgrade openssl 1.1.1l -> 1.1.1n to fix CVE-2022-0778:
https://nvd.nist.gov/vuln/detail/CVE-2022-0778
https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=3118eb64934499d93db3230748a452351d1d9a65

This also fixes an evp_extra_test ptest failure introduced by openssl-1.1.1m:
"""
not ok 19 - test_signatures_with_engine
ERROR: (ptr) 'e = ENGINE_by_id(engine_id) != NULL' failed @ ../openssl-1.1.1m/test/evp_extra_test.c:1890
0x0
not ok 20 - test_cipher_with_engine
<snip>
"""

The ptest change is already present in Yocto master since oe-core
commit 5cd40648b0ba ("openssl: upgrade to 3.0.1").

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/openssl/CVE-2021-4160.patch       | 145 ------------------
 .../{openssl_1.1.1l.bb => openssl_1.1.1n.bb}  |   4 +-
 2 files changed, 2 insertions(+), 147 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2021-4160.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1l.bb => openssl_1.1.1n.bb} (97%)

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2021-4160.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2021-4160.patch
deleted file mode 100644
index ff1e807157..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2021-4160.patch
+++ /dev/null
@@ -1,145 +0,0 @@
-From e9e726506cd2a3fd9c0f12daf8cc1fe934c7dddb Mon Sep 17 00:00:00 2001
-From: Bernd Edlinger <bernd.edlinger@hotmail.de>
-Date: Sat, 11 Dec 2021 20:28:11 +0100
-Subject: [PATCH] Fix a carry overflow bug in bn_sqr_comba4/8 for mips 32-bit
- targets
-
-bn_sqr_comba8 does for instance compute a wrong result for the value:
-a=0x4aaac919 62056c84 fba7334e 1a6be678 022181ba fd3aa878 899b2346 ee210f45
-
-The correct result is:
-r=0x15c72e32 605a3061 d11b1012 3c187483 6df96999 bd0c22ba d3e7d437 4724a82f
-    912c5e61 6a187efe 8f7c47fc f6945fe5 75be8e3d 97ed17d4 7950b465 3cb32899
-
-but the actual result was:
-r=0x15c72e32 605a3061 d11b1012 3c187483 6df96999 bd0c22ba d3e7d437 4724a82f
-    912c5e61 6a187efe 8f7c47fc f6945fe5 75be8e3c 97ed17d4 7950b465 3cb32899
-
-so the forth word of the result was 0x75be8e3c but should have been
-0x75be8e3d instead.
-
-Likewise bn_sqr_comba4 has an identical bug for the same value as well:
-a=0x022181ba fd3aa878 899b2346 ee210f45
-
-correct result:
-r=0x00048a69 9fe82f8b 62bd2ed1 88781335 75be8e3d 97ed17d4 7950b465 3cb32899
-
-wrong result:
-r=0x00048a69 9fe82f8b 62bd2ed1 88781335 75be8e3c 97ed17d4 7950b465 3cb32899
-
-Fortunately the bn_mul_comba4/8 code paths are not affected.
-
-Also the mips64 target does in fact not handle the carry propagation
-correctly.
-
-Example:
-a=0x4aaac91900000000 62056c8400000000 fba7334e00000000 1a6be67800000000
-    022181ba00000000 fd3aa87800000000 899b234635dad283 ee210f4500000001
-
-correct result:
-r=0x15c72e32272c4471 392debf018c679c8 b85496496bf8254c d0204f36611e2be1
-    0cdb3db8f3c081d8 c94ba0e1bacc5061 191b83d47ff929f6 5be0aebfc13ae68d
-    3eea7a7fdf2f5758 42f7ec656cab3cb5 6a28095be34756f2 64f24687bf37de06
-    2822309cd1d292f9 6fa698c972372f09 771e97d3a868cda0 dc421e8a00000001
-
-wrong result:
-r=0x15c72e32272c4471 392debf018c679c8 b85496496bf8254c d0204f36611e2be1
-    0cdb3db8f3c081d8 c94ba0e1bacc5061 191b83d47ff929f6 5be0aebfc13ae68d
-    3eea7a7fdf2f5758 42f7ec656cab3cb5 6a28095be34756f2 64f24687bf37de06
-    2822309cd1d292f8 6fa698c972372f09 771e97d3a868cda0 dc421e8a00000001
-
-Reviewed-by: Paul Dale <pauli@openssl.org>
-(Merged from https://github.com/openssl/openssl/pull/17258)
-
-(cherry picked from commit 336923c0c8d705cb8af5216b29a205662db0d590)
-
-Upstream-Status: Backport [https://git.openssl.org/gitweb/?p=openssl.git;a=patch;h=e9e726506cd2a3fd9c0f12daf8cc1fe934c7dddb]
-CVE: CVE-2021-4160
-Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
-
----
- crypto/bn/asm/mips.pl |  4 ++++
- test/bntest.c         | 45 +++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 49 insertions(+)
-
-diff --git a/crypto/bn/asm/mips.pl b/crypto/bn/asm/mips.pl
-index 8ad715bda4..74101030f2 100644
---- a/crypto/bn/asm/mips.pl
-+++ b/crypto/bn/asm/mips.pl
-@@ -1984,6 +1984,8 @@ $code.=<<___;
- 	sltu	$at,$c_2,$t_1
- 	$ADDU	$c_3,$t_2,$at
- 	$ST	$c_2,$BNSZ($a0)
-+	sltu	$at,$c_3,$t_2
-+	$ADDU	$c_1,$at
- 	mflo	($t_1,$a_2,$a_0)
- 	mfhi	($t_2,$a_2,$a_0)
- ___
-@@ -2194,6 +2196,8 @@ $code.=<<___;
- 	sltu	$at,$c_2,$t_1
- 	$ADDU	$c_3,$t_2,$at
- 	$ST	$c_2,$BNSZ($a0)
-+	sltu	$at,$c_3,$t_2
-+	$ADDU	$c_1,$at
- 	mflo	($t_1,$a_2,$a_0)
- 	mfhi	($t_2,$a_2,$a_0)
- ___
-diff --git a/test/bntest.c b/test/bntest.c
-index b58028a301..bab34ba54b 100644
---- a/test/bntest.c
-+++ b/test/bntest.c
-@@ -627,6 +627,51 @@ static int test_modexp_mont5(void)
-     if (!TEST_BN_eq(c, d))
-         goto err;
- 
-+    /*
-+     * Regression test for overflow bug in bn_sqr_comba4/8 for
-+     * mips-linux-gnu and mipsel-linux-gnu 32bit targets.
-+     */
-+    {
-+        static const char *ehex[] = {
-+            "95564994a96c45954227b845a1e99cb939d5a1da99ee91acc962396ae999a9ee",
-+            "38603790448f2f7694c242a875f0cad0aae658eba085f312d2febbbd128dd2b5",
-+            "8f7d1149f03724215d704344d0d62c587ae3c5939cba4b9b5f3dc5e8e911ef9a",
-+            "5ce1a5a749a4989d0d8368f6e1f8cdf3a362a6c97fb02047ff152b480a4ad985",
-+            "2d45efdf0770542992afca6a0590d52930434bba96017afbc9f99e112950a8b1",
-+            "a359473ec376f329bdae6a19f503be6d4be7393c4e43468831234e27e3838680",
-+            "b949390d2e416a3f9759e5349ab4c253f6f29f819a6fe4cbfd27ada34903300e",
-+            "da021f62839f5878a36f1bc3085375b00fd5fa3e68d316c0fdace87a97558465",
-+            NULL};
-+        static const char *phex[] = {
-+            "f95dc0f980fbd22e90caa5a387cc4a369f3f830d50dd321c40db8c09a7e1a241",
-+            "a536e096622d3280c0c1ba849c1f4a79bf490f60006d081e8cf69960189f0d31",
-+            "2cd9e17073a3fba7881b21474a13b334116cb2f5dbf3189a6de3515d0840f053",
-+            "c776d3982d391b6d04d642dda5cc6d1640174c09875addb70595658f89efb439",
-+            "dc6fbd55f903aadd307982d3f659207f265e1ec6271b274521b7a5e28e8fd7a5",
-+            "5df089292820477802a43cf5b6b94e999e8c9944ddebb0d0e95a60f88cb7e813",
-+            "ba110d20e1024774107dd02949031864923b3cb8c3f7250d6d1287b0a40db6a4",
-+            "7bd5a469518eb65aa207ddc47d8c6e5fc8e0c105be8fc1d4b57b2e27540471d5",
-+            NULL};
-+        static const char *mhex[] = {
-+            "fef15d5ce4625f1bccfbba49fc8439c72bf8202af039a2259678941b60bb4a8f",
-+            "2987e965d58fd8cf86a856674d519763d0e1211cc9f8596971050d56d9b35db3",
-+            "785866cfbca17cfdbed6060be3629d894f924a89fdc1efc624f80d41a22f1900",
-+            "9503fcc3824ef62ccb9208430c26f2d8ceb2c63488ec4c07437aa4c96c43dd8b",
-+            "9289ed00a712ff66ee195dc71f5e4ead02172b63c543d69baf495f5fd63ba7bc",
-+            "c633bd309c016e37736da92129d0b053d4ab28d21ad7d8b6fab2a8bbdc8ee647",
-+            "d2fbcf2cf426cf892e6f5639e0252993965dfb73ccd277407014ea784aaa280c",
-+            "b7b03972bc8b0baa72360bdb44b82415b86b2f260f877791cd33ba8f2d65229b",
-+            NULL};
-+
-+        if (!TEST_true(parse_bigBN(&e, ehex))
-+                || !TEST_true(parse_bigBN(&p, phex))
-+                || !TEST_true(parse_bigBN(&m, mhex))
-+                || !TEST_true(BN_mod_exp_mont_consttime(d, e, p, m, ctx, NULL))
-+                || !TEST_true(BN_mod_exp_simple(a, e, p, m, ctx))
-+                || !TEST_BN_eq(a, d))
-+            goto err;
-+    }
-+
-     /* Zero input */
-     if (!TEST_true(BN_bntest_rand(p, 1024, 0, 0)))
-         goto err;
--- 
-2.25.1
-
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1n.bb
similarity index 97%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1n.bb
index 24466e11b1..8538bd5a18 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1n.bb
@@ -18,14 +18,13 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://afalg.patch \
            file://reproducible.patch \
            file://reproducibility.patch \
-           file://CVE-2021-4160.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "0b7a3e5e59c34827fe0c3a74b7ec8baef302b98fa80088d7f9153aa16fa76bd1"
+SRC_URI[sha256sum] = "40dceb51a4f6a5275bde0e6bf20ef4b91bfc32ed57c0552e2e8e15463372b17a"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
@@ -181,6 +180,7 @@ do_install_ptest () {
 	install -m755 ${B}/apps/CA.pl ${D}${PTEST_PATH}/apps
 
 	install -d ${D}${PTEST_PATH}/engines
+	install -m755 ${B}/engines/dasync.so ${D}${PTEST_PATH}/engines
 	install -m755 ${B}/engines/ossltest.so ${D}${PTEST_PATH}/engines
 }
 
-- 
2.25.1


