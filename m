Return-Path: <m.otto@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E676FC7EE24
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 10:09:11 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by mx.groups.io with SMTP id smtpd.web10.20395.1683886143011449535
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 May 2023 03:09:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@phytec.de header.s=a4 header.b=RR1Ix6jr;
 spf=pass (domain: phytec.de, ip: 91.26.50.163, mailfrom: m.otto@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1683886140; x=1686478140;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GulsItHRSLvyIQHWwkGeVLqlZvp3waQbe42ezmfrWZ4=;
	b=RR1Ix6jrHJnd7SwdRwkqabkuuNIQmeFatqVd36dws9UN8D9qU3arGCPezAuqwXkB
	zqHbF0ty9pMcczZ/Tf0HjgyToSQ0Wl0otHI7WZFAJDraA9TmmwK6EDqN2xl4odL8
	eoIahBGRzxyrghx+jcVG1SJ9jrvC3vsvCQLz6FG4OQI=;
X-AuditID: ac14000a-923ff70000007ecb-55-645e103b05ad
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id FF.EE.32459.B301E546; Fri, 12 May 2023 12:08:59 +0200 (CEST)
Received: from augenblix2.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 12 May
 2023 12:08:59 +0200
From: Maik Otto <m.otto@phytec.de>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone 1/2] openssl: update from 3.0.8 to 3.1.0
Date: Fri, 12 May 2023 12:08:44 +0200
Message-ID: <20230512100845.1243349-2-m.otto@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230512100845.1243349-1-m.otto@phytec.de>
References: <20230512100845.1243349-1-m.otto@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMLMWRmVeSWpSXmKPExsWyRpKBR9daIC7FYOUaG4s7P9+xOzB6nNu4
	gjGAMYrLJiU1J7MstUjfLoErY+rh38wFi+Qqmp/ENzCul+hi5OSQEDCReP2qhamLkYtDSGAJ
	k8SkzWtYIJwnjBInp95nAqliE1CSeDh3NXMXIweHiICexNV/oiBhYQEbicPfDzCD2CwCqhLd
	vW1g5bwC5hK/Xvxlh1ggLzHz0ncwm1PAQuL0uXYmkDFCQDVHfqpDlAtKnJz5hAXEZgYqb946
	mxnClpA4+OIFmC0kICvR+KCNFWbktHOvmSHsUImtX7YzTWAUnIVk1Cwko2YhGbWAkXkVo1Bu
	ZnJ2alFmtl5BRmVJarJeSuomRlBAijBw7WDsm+NxiJGJg/EQowQHs5II79sl0SlCvCmJlVWp
	RfnxRaU5qcWHGKU5WJTEee/3MCUKCaQnlqRmp6YWpBbBZJk4OKUaGM2Ub86Q6JD7FDl5wvG/
	6ekiCYsWTOScvs3iyvKI1s/PFUOO32w0FPNP2iLkxM5V43HR8dnUUzznb2ebzvn67fXxB1dV
	s+4efLW760MOC1v3nv3czKF+T2JszV93GTTWz7gzR3HNVhMBt0LDgC6lorajcg/mrEhasf/e
	oc7GI1Zl0qbZDTenBSixFGckGmoxFxUnAgDLDm2YNgIAAA==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 10:09:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181175

From: Randy MacLeod <randy.macleod@windriver.com>

>From the NEWS.md file:

  ### Major changes between OpenSSL 3.0 and OpenSSL 3.1.0 [14 Mar 2023]

  * SSL 3, TLS 1.0, TLS 1.1, and DTLS 1.0 only work at security level 0.
  * Performance enhancements and new platform support including new
    assembler code algorithm implementations.
  * Deprecated LHASH statistics functions.
  * FIPS 140-3 compliance changes.

Drop the upstreamed afalg.patch:
   c425e365f4 Configure: don't try to be clever when configuring afalgeng

Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../openssl/openssl/afalg.patch               | 31 -------------------
 .../{openssl_3.0.8.bb => openssl_3.1.0.bb}    |  3 +-
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/afalg.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.0.8.bb => openssl_3.1.0.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl/afalg.patch b/meta/recipes-connectivity/openssl/openssl/afalg.patch
deleted file mode 100644
index cf77e873a2..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/afalg.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Don't refuse to build afalgeng if cross-compiling or the host kernel is too old.
-
-Upstream-Status: Submitted [hhttps://github.com/openssl/openssl/pull/7688]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-Index: openssl-3.0.4/Configure
-===================================================================
---- openssl-3.0.4.orig/Configure
-+++ openssl-3.0.4/Configure
-@@ -1681,20 +1681,7 @@ $config{CFLAGS} = [ map { $_ eq '--ossl-
- unless ($disabled{afalgeng}) {
-     $config{afalgeng}="";
-     if (grep { $_ eq 'afalgeng' } @{$target{enable}}) {
--        my $minver = 4*10000 + 1*100 + 0;
--        if ($config{CROSS_COMPILE} eq "") {
--            my $verstr = `uname -r`;
--            my ($ma, $mi1, $mi2) = split("\\.", $verstr);
--            ($mi2) = $mi2 =~ /(\d+)/;
--            my $ver = $ma*10000 + $mi1*100 + $mi2;
--            if ($ver < $minver) {
--                disable('too-old-kernel', 'afalgeng');
--            } else {
--                push @{$config{engdirs}}, "afalg";
--            }
--        } else {
--            disable('cross-compiling', 'afalgeng');
--        }
-+        push @{$config{engdirs}}, "afalg";
-     } else {
-         disable('not-linux', 'afalgeng');
-     }
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.8.bb b/meta/recipes-connectivity/openssl/openssl_3.1.0.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_3.0.8.bb
rename to meta/recipes-connectivity/openssl/openssl_3.1.0.bb
index 82f3e18dd7..b7251cb68e 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.0.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c75985e733726beaba57bc5253e96d04"
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
-           file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://CVE-2023-0464.patch \
            file://CVE-2023-0465.patch \
@@ -21,7 +20,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "6c13d2bf38fdf31eac3ce2a347073673f5d63263398f1f69d0df4a41253e4b3e"
+SRC_URI[sha256sum] = "aaa925ad9828745c4cad9d9efeb273deca820f2cdcf2c3ac7d7c1212b7c497b4"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.25.1


