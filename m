Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5610FC6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 04:48:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.913.1678855682690283150
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 21:48:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=aqhFR5LS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=243812222e=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32F4m2gZ001509
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 21:48:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=po+hEZvBSBhRJUbJTNPyeFKKehDU80S7kfhxoqV5IUo=;
 b=aqhFR5LSiHk0y/UVdjHmPuz4BevjAWkecso1ZU6Rcc0tGbHVZ9Hl2f+V53mvbEX3lxHC
 oXsvAyZ0sTvnCRZwIKdS83CX2/Z+6BMzM8QdkOJFyOXDy9atl2deqZkOD38dTLJ+scV/
 gVEQyXvkd6mJEAihVmJT0F1q4rbVZKNgmTamRCbQnmXinpOJ754/aibQiQfrVqWbTj+8
 f1mOKLUKGCzTxkCqJm/fyaGbGq5J17ahUd+B1M7tSW5Y7PQ5F9nGerbsO15aOXHQ0g17
 qGo8dy8on2QmLPAKn6mlKHELhevd4E6GOk5bqVHqkpPSnGuloXQeTCiytV8y8BGig0ih jQ== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pb2am06nf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 21:48:02 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Tue, 14 Mar 2023 21:48:01 -0700
Received: from yow-fedora-builder1.wrs.com (128.224.56.212) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 14 Mar 2023 21:48:01 -0700
From: Randy MacLeod <randy.macleod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] openssl: update from 3.0.8 to 3.1.0
Date: Wed, 15 Mar 2023 00:48:00 -0400
Message-ID: <20230315044800.2460722-1-randy.macleod@windriver.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 6Gspn44Kq3VO4cmP64rS_yV9_KiTSg_7
X-Proofpoint-ORIG-GUID: 6Gspn44Kq3VO4cmP64rS_yV9_KiTSg_7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_01,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2302240000 definitions=main-2303150041 domainage_hfrom=7
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 04:48:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178520

From the NEWS.md file:

  ### Major changes between OpenSSL 3.0 and OpenSSL 3.1.0 [14 Mar 2023]

  * SSL 3, TLS 1.0, TLS 1.1, and DTLS 1.0 only work at security level 0.
  * Performance enhancements and new platform support including new
    assembler code algorithm implementations.
  * Deprecated LHASH statistics functions.
  * FIPS 140-3 compliance changes.

Drop the upstreamed afalg.patch:
   c425e365f4 Configure: don't try to be clever when configuring afalgeng

Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
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
index 8771884dda..4ae376d18a 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.0.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c75985e733726beaba57bc5253e96d04"
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
-           file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            "
 
@@ -18,7 +17,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "6c13d2bf38fdf31eac3ce2a347073673f5d63263398f1f69d0df4a41253e4b3e"
+SRC_URI[sha256sum] = "aaa925ad9828745c4cad9d9efeb273deca820f2cdcf2c3ac7d7c1212b7c497b4"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.39.0


