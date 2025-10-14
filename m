Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5C2CCD187
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 06:58:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9019.1760425124815608406
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 23:58:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Cr/0BL/O;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2382c2f518=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59E5Dg292937678
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 23:58:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=WCDXcclOkSiSesaZZpv/
	Zoc9UyaJXMs0P98stz88yzM=; b=Cr/0BL/OoTolXK7WLpRToV3Dmg6R494GkZ06
	OU8IXQtbYy08+MF/3RvMrGg/aYvx9EG9vvNT1xZhLYmwk4jWGBpFGGLst6a9/S0s
	7HawIQGH/4sl7MD9WNrq3hRupKIlP+n+GxMjNxdacdrnkANyrW/BiTI+2B7wKp3Y
	dqqwhVKOWyxuEU/mPu1AIb9gwGNrFkQNxi6rYb9d+0iS8rrRMYWEmZciLbK4/wp7
	Ke0GHRkxKBjMJan0IhzuQBKc7CysAw0i/neBlcPkoozp+j2Wk5l6aE6O/arq6vOa
	xiiMq4bR0UnhWYwjqJMWPSlBtc5lU+lC98Aiz+33tAj8UZGZoA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qjh1jm8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 23:58:44 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Mon, 13 Oct 2025 23:58:43 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Mon, 13 Oct 2025 23:58:43 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/3] gpgme; 2.0.0 -> 2.0.1
Date: Tue, 14 Oct 2025 14:58:40 +0800
Message-ID: <20251014065842.2919308-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDA1MyBTYWx0ZWRfX7FVfOwlVs69j
 ohVJmb7FQAEd9+RtZ6YJS2n+ZDRDflvvveuSi8ac52HOkN7PQMe3gm8NHV0BgvqeDlU3kh8Mp6h
 q0sJwGIBDhefeBg2fJeBO8FJIGoBq/qZiQ+pNrFPN85w4PrP7ZNs95eL6yyLDS6F5csC9Ez2Lzt
 uwEg9QkAof809+f9HK2WiBidg6SyRb4p/2/uqMs1FHD6I31FuuN5D/U8cil9jerw+Qb7Bv0DCTv
 MqL5ANHd2HS9ifNaYAYd/Tn/t5YXlEImOZMTkuFrlUxR5AWxqDj86Gt+QftlbRna20+aGA3zj2a
 t9qMA3J01IN/8niuyLmO2rU5mi2O3JiExWXafyGGT4v71zVc9Ld2TuwvHfEHAJyNMFfcwinawR8
 bNEjtU+jdTR1pvRdjXRJGg+ewKH4yw==
X-Proofpoint-GUID: 6wE3QVQj_eM9XiQk4y0rp-0ypkxap6WD
X-Proofpoint-ORIG-GUID: 6wE3QVQj_eM9XiQk4y0rp-0ypkxap6WD
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=68edf4a4 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=GjhjpPi7WRqdmPGd4GgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510140053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 06:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224809

- Refresh 0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...uild-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch | 11 +++++++----
 .../gpgme/{gpgme_2.0.0.bb => gpgme_2.0.1.bb}          |  2 +-
 2 files changed, 8 insertions(+), 5 deletions(-)
 rename meta/recipes-support/gpgme/{gpgme_2.0.0.bb => gpgme_2.0.1.bb} (96%)

diff --git a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
index 2a906a6c73..4b8d1ceecd 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
@@ -1,6 +1,6 @@
-From 95d0bae453b2b5a7d25b92d99565d27407fffa1b Mon Sep 17 00:00:00 2001
+From 6ad1ac8c03ae3acc0539fc1566070e2468c7df0a Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 10 May 2019 14:18:04 +0800
+Date: Tue, 14 Oct 2025 14:12:55 +0800
 Subject: [PATCH] Revert "build: Make gpgme.m4 use gpgrt-config with *.pc."
 
 This reverts commit 60828a505a1c74fd34476c181df2a588ea6f9c83.
@@ -15,7 +15,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 8 insertions(+), 46 deletions(-)
 
 diff --git a/src/gpgme.m4 b/src/gpgme.m4
-index 4cfe899..5f689e1 100644
+index acbfc1c..5f689e1 100644
 --- a/src/gpgme.m4
 +++ b/src/gpgme.m4
 @@ -122,24 +122,10 @@ AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
@@ -23,7 +23,7 @@ index 4cfe899..5f689e1 100644
    fi
  
 -  use_gpgrt_config=""
--  if test x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
+-  if test x"$GPGRT_CONFIG" != x && test "$GPGRT_CONFIG" != "no"; then
 -    if $GPGRT_CONFIG gpgme --exists; then
 -      GPGME_CONFIG="$GPGRT_CONFIG gpgme"
 -      AC_MSG_NOTICE([Use gpgrt-config as gpgme-config])
@@ -113,3 +113,6 @@ index 4cfe899..5f689e1 100644
      AC_MSG_RESULT(yes)
      ifelse([$2], , :, [$2])
      _AM_PATH_GPGME_CONFIG_HOST_CHECK
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/gpgme/gpgme_2.0.0.bb b/meta/recipes-support/gpgme/gpgme_2.0.1.bb
similarity index 96%
rename from meta/recipes-support/gpgme/gpgme_2.0.0.bb
rename to meta/recipes-support/gpgme/gpgme_2.0.1.bb
index c6887a0ebd..364147fad5 100644
--- a/meta/recipes-support/gpgme/gpgme_2.0.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_2.0.1.bb
@@ -24,7 +24,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0001-autogen.sh-remove-unknown-in-version.patch \
            "
 
-SRC_URI[sha256sum] = "ddf161d3c41ff6a3fcbaf4be6c6e305ca4ef1cc3f1ecdfce0c8c2a167c0cc36d"
+SRC_URI[sha256sum] = "821ab0695c842eab51752a81980c92b0410c7eadd04103f791d5d2a526784966"
 
 DEPENDS = "libgpg-error libassuan"
 
-- 
2.34.1


