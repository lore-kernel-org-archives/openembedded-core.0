Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 566BBCCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 06:58:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9020.1760425126799772552
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 23:58:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jvmamEzR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2382c2f518=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59E5eKkR3727090
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 06:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=0MJPfD5YV2VBIPsEn0oBVB+0oo7TidZ3tftcYO4J/yU=; b=jvmamEzRXEZ4
	0cmyhJwucX2QUhjDrOvWJFJjuU/TuQ6wn/cwjb0Cq0s72iHWsju8NS/MSRg6K3KE
	zUIoAzNN4TZn9D6C19cBhXsPsst9E3itQIRhCiIHoW5+5tapWiA/v6ShgYB1Iy0n
	bDeJYEe3xELsuAvxpwNzi+PPmgTwKd820X8vAX0RSZZZj2HMfCCex9a7rxLjy0c5
	uQKK8zQqrIcffDI+fd3Yp13J2cnzhwwFCnaAnT4QTtZtNBO+Zvs0442HptjwBstc
	m0j6V62cX26wg7/SFueWRzkYJE+RoGTt5cc6FPrIVkZOsTqACYxcPzSmSJLQ7Mig
	fTKNX4kohQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qcewjudh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 06:58:45 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Mon, 13 Oct 2025 23:58:44 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Mon, 13 Oct 2025 23:58:44 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] libgpg-error: 1.55 -> 1.56
Date: Tue, 14 Oct 2025 14:58:41 +0800
Message-ID: <20251014065842.2919308-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251014065842.2919308-1-hongxu.jia@windriver.com>
References: <20251014065842.2919308-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 5hr0ROU6ea5MpwiMfETpF-sb6dnqVaYm
X-Proofpoint-ORIG-GUID: 5hr0ROU6ea5MpwiMfETpF-sb6dnqVaYm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDA1MyBTYWx0ZWRfXxzKX/72jZIaD
 ouxUmJp7xbJ+C97Dinrw9d1j2/NgwidNCB/nSlmbe/JB1majTDHS6mJIrUvJLV1R39FL9j1HKTV
 fdCVGtQJ+Vq9j9ZfHop3bWDVdKgVo/3MYvfLrhxqD6/KVerVFGngIQCnLcczrdQH9SmRruKbfW1
 qHrAMMrM5z4jLl5u+A4O5ClaBktL38/r7Y63b3jts2s8ybmnkYdfNwsBqGIv/SrC7NGpHMKGhnM
 aMTtRgMlAT3BhwKb0QoH1bDFTBV8o+RLGlD1qg6IzboZ995Zj4G66eDHiKkDnLQ6e4yTCCb6uvK
 4vJe3APRFL2rt9sdfVjRd9Re68ciqr+9yVRmL6/PllpYKdQASFWzEJCOa/4xSElG0jiR1GvrCfV
 xz/Wb8ZcuqMD3KXEv/on+ZuFnTtxDQ==
X-Authority-Analysis: v=2.4 cv=M+xA6iws c=1 sm=1 tr=0 ts=68edf4a5 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=btDEojJCkjEMEoxrCysA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510140053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 06:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224811

- Refresh pkgconfig.patch

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libgpg-error/libgpg-error/pkgconfig.patch         | 11 +++++++----
 .../{libgpg-error_1.55.bb => libgpg-error_1.56.bb}    |  2 +-
 2 files changed, 8 insertions(+), 5 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.55.bb => libgpg-error_1.56.bb} (95%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
index dbf728b2de..38c55ad342 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
@@ -1,4 +1,4 @@
-From 3529df77cd20253ce2a9c1962d7a72058a04fd98 Mon Sep 17 00:00:00 2001
+From fdc0b6f84bae7cd6eea18712049da62cdfd5e630 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 21 Aug 2024 20:03:29 -0700
 Subject: [PATCH] support pkgconfig
@@ -20,7 +20,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+), 195 deletions(-)
 
 diff --git a/src/gpg-error.m4 b/src/gpg-error.m4
-index 2d24071..c561725 100644
+index 263f21b..e54ab38 100644
 --- a/src/gpg-error.m4
 +++ b/src/gpg-error.m4
 @@ -15,196 +15,14 @@
@@ -167,11 +167,11 @@ index 2d24071..c561725 100644
 -[ AC_REQUIRE([AC_CANONICAL_HOST])dnl
 -  AC_REQUIRE([_AM_PATH_POSSIBLE_GPG_ERROR_CONFIG])dnl
 -  AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
--  if test x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
+-  if test x"$GPGRT_CONFIG" != x && test "$GPGRT_CONFIG" != "no"; then
 -    GPG_ERROR_CONFIG="$GPGRT_CONFIG gpg-error"
 -    AC_MSG_NOTICE([Use gpgrt-config with $gpgrt_libdir as gpg-error-config])
 -    gpg_error_config_version=`$GPG_ERROR_CONFIG --modversion`
--  elif test x"$GPG_ERROR_CONFIG" != x -a "$GPG_ERROR_CONFIG" != "no"; then
+-  elif test x"$GPG_ERROR_CONFIG" != x && test "$GPG_ERROR_CONFIG" != "no"; then
 -    gpg_error_config_version=`$GPG_ERROR_CONFIG --version`
 -  else
 -    gpg_error_config_version="0.0"
@@ -241,3 +241,6 @@ index 2d24071..c561725 100644
 -  AC_SUBST(GPG_ERROR_MT_LIBS)
  ])
 +
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb
similarity index 95%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.55.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.56.bb
index 7de52314a4..d3cc88f971 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "95b178148863f07d45df0cea67e880a79b9ef71f5d230baddc0071128516ef78"
+SRC_URI[sha256sum] = "82c3d2deb4ad96ad3925d6f9f124fe7205716055ab50e291116ef27975d169c0"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.34.1


