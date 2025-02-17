Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 991A1C021A4
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 08:23:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.46916.1739780598393261773
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 00:23:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4143913a06=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H6u0wT008789
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 00:23:18 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44tuaq9c9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 00:23:17 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 17 Feb 2025 00:23:17 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 17 Feb 2025 00:23:17 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V3 1/3] gnupg: upgrade 2.5.3 -> 2.5.4
Date: Mon, 17 Feb 2025 00:23:17 -0800
Message-ID: <20250217082317.3138817-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=QLGSRhLL c=1 sm=1 tr=0 ts=67b2f1f5 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=GwUem0DFAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=LeGuBJyKhUoUA6M27mgA:9
 a=2LqHAbwP_edSDQjV:21 a=r0dl5i_q2XGqDZkti5dn:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: fSiv71T6MI9K0YlcP3Sj_vKG80PK2ktC
X-Proofpoint-ORIG-GUID: fSiv71T6MI9K0YlcP3Sj_vKG80PK2ktC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_04,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502170073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 08:23:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211530

Noteworthy changes in version 2.5.4 (2025-02-12)
------------------------------------------------

* gpg: New option --disable-pqc-encryption.  [rG00c31f8b04]

* gpg: Fix --quick-add-key for Weierstrass ECC with usage given.[T7506]

* gpg: Fix handling with no CRC armor.  [T7071]

* gpg: New private Kyber keys are now cross-referenced using a new
Link attribute.  [T6638]

* gpg: Fix an import problem with keys having another primary key as
a subkey.  [T7527]

* gpgsm: Allow unattended PKCS#12 export without passphrase.
[rG159e801043]

* gpgsm: Allow CSR generation with an unprotected key.
[rG89055f24f4]

* agent: New option --change-std-env-name.  [T7522]

* agent: Fix ssh-agent's request_identities for skipped Brainpool
keys.  [rG2469dc5aae]

* Do not package zlib and bzip2 object files in a speedo release
build.  [T7442]

See-also: gnupg-announce/2025q1/000490.html
Release-info: https://dev.gnupg.org/T7480

https://dev.gnupg.org/source/gnupg/browse/master/NEWS

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-Woverride-init-is-not-needed-with-gcc-9.patch      | 2 +-
 ...nfigure.ac-use-a-custom-value-for-the-location-of-.patch | 6 +++---
 .../gnupg/0002-use-pkgconfig-instead-of-npth-config.patch   | 2 +-
 ...0004-autogen.sh-fix-find-version-for-beta-checking.patch | 2 +-
 meta/recipes-support/gnupg/gnupg/relocate.patch             | 2 +-
 .../gnupg/{gnupg_2.5.3.bb => gnupg_2.5.4.bb}                | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.5.3.bb => gnupg_2.5.4.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
index fcd2528513..6299eb95ce 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
@@ -1,4 +1,4 @@
-From bbf09a439d56ddcae6f641c8f1cf7544e3dd4d6f Mon Sep 17 00:00:00 2001
+From 690faa62529c584cd80c8eaa56210ec1e4a96d7f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Dec 2018 17:37:48 -0800
 Subject: [PATCH] Woverride-init is not needed with gcc 9
diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 6e2f8d6fe6..ed94145833 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From c9cef60c7be6a5cb5a9557117f4d285278cc6f47 Mon Sep 17 00:00:00 2001
+From c9392c615a95c965dd58b0896cb3b87deafc62a4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 6252d57..1da2c6f 100644
+index 23a9101..3e10021 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1911,7 +1911,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1908,7 +1908,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
index 9c87788e80..2d23ca1e66 100644
--- a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
@@ -1,4 +1,4 @@
-From 7c0163fd17b78284495da382023074ee7dd629b6 Mon Sep 17 00:00:00 2001
+From 9f7cf2e4770697c24f8d24ce9f79b8548120bbf8 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:16:30 +0800
 Subject: [PATCH] use pkgconfig instead of npth config
diff --git a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
index 3b4b01721a..fc7d964ec4 100644
--- a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
+++ b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
@@ -1,4 +1,4 @@
-From 24ae21dce9fc7546468580ab37db3bf9559e6efc Mon Sep 17 00:00:00 2001
+From 4d8cc1982273d571b4e80fe981878d0fa5884236 Mon Sep 17 00:00:00 2001
 From: Wenzong Fan <wenzong.fan@windriver.com>
 Date: Wed, 16 Aug 2017 11:23:22 +0800
 Subject: [PATCH] autogen.sh: fix find-version for beta checking
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index b67744419e..1ae8a564d4 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From db9e4933176b7919077120cedb8a8b0a40c2115b Mon Sep 17 00:00:00 2001
+From 917a98f9380d581548f3cbb59428cee3a5c29bae Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.3.bb b/meta/recipes-support/gnupg/gnupg_2.5.4.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.5.3.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.4.bb
index cca4feaf6c..e6a7e3fb40 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.3.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.4.bb
@@ -23,7 +23,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "23128b136aed4e5121e793d1b6c60ee50c8007a9d926c1313e524d05386b54ac"
+SRC_URI[sha256sum] = "f8cb2ac6c9f17f81e3541c62158764910fad5c3a0765e00b398c41a32bc4e0ea"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.25.1


