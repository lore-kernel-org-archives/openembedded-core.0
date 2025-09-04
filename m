Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44FE5CA1002
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 03:40:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.31406.1756957232723086869
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 20:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=evPc9rrm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=134255f852=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5843eMxD2248631;
	Thu, 4 Sep 2025 03:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Mpx0Zt+5CSVpvHGTm0CbYNlSiFFzw+HUn88vTlw7j6g=; b=
	evPc9rrmHL9rj2ieZbVCZbEK9qsJL3lQfsI1cPJ9E8z00kA4Op5SgNOEuHCMI4Cz
	4hQGsS28I4J0vMFOde4UQPg39bdObMoEGPa29IniKOfh/DkGpwM2dAZvKEr7t7Dj
	q58IGZo4Q02Aaz8OhYebwQsy1SjG1mh2Lq/7b5qAJwZZZfrpbAEqtO3ecLaN5cw3
	0UaUivclfxiDWdcmgGFtbDmqsSFxMLWpkC+sQyHc2GXApgKmdL01GLgl/LNSmuWE
	ji2Kbo9EbWwPJuSQ7DCpP/ScxvIhfiUts2+6E5hYw/MhZcjGSGXDYLoKMuLdNwzg
	41U7YkNoJcbeRd0LdqIvmg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48y0ygr2ux-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 04 Sep 2025 03:40:31 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 3 Sep 2025 20:38:49 -0700
Received: from ala-lpggp7.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 3 Sep 2025 20:38:49 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>
Subject: [PATCH v3 1/2] automake: 1.17 -> 1.18.1
Date: Wed, 3 Sep 2025 20:40:38 -0700
Message-ID: <f02f6e325676ac8c17e174e66357fcfd817baf88.1756957117.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1756957117.git.liezhi.yang@windriver.com>
References: <cover.1756957117.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDAzNCBTYWx0ZWRfXxbq+hIb0EWSy
 g3Mk7DBwM/INM2NlqypR+rcxNrw2UqSQ6r1xgsV+Zi0HScAj6Sxm+nVLlufHLL8JESgqOBsgvaw
 vw7qr2AsMD11ZEOEmD9pGFywGpInWXR+ZeRm+Y4DMYmcB9fWyXAErPNHYjBibbEGyiXQVantOCd
 fMWJq90Q9G36C0tpwLS97mIkLzQ4V7Cy39+r4nDdmGlqBHpb3hFwUsmLs2OO9aX170gdJpQEJDZ
 ORkAldJRY0T6yjYpj7CyjSYJlNEn4Urplm7zEmIoPrjJUOd6LRTOT5cKgB9I4OWoavqdHvwv9GM
 ZjmTtWUflF139WEuTyQ6I0vWaFEbShMymyZl3mltlV7Q/hwq3mjZOM4q261WF8=
X-Authority-Analysis: v=2.4 cv=T86MT+KQ c=1 sm=1 tr=0 ts=68b90a2f cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=uPfJ7zb3p7K3iDJ3W7kA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 18nDrDoLs-5bvHn5_Kczs46QWaMQQkFl
X-Proofpoint-GUID: 18nDrDoLs-5bvHn5_Kczs46QWaMQQkFl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 03:40:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222891

From: Robert Yang <liezhi.yang@windriver.com>

* Drop 0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch, it is a
  warning not an error any more, so just drop it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...report-error-when-the-path-of-Perl-c.patch | 34 -------------------
 .../{automake_1.17.bb => automake_1.18.1.bb}  |  3 +-
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta/recipes-devtools/automake/automake/0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch
 rename meta/recipes-devtools/automake/{automake_1.17.bb => automake_1.18.1.bb} (85%)

diff --git a/meta/recipes-devtools/automake/automake/0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch b/meta/recipes-devtools/automake/automake/0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch
deleted file mode 100644
index 5a38feb16c..0000000000
--- a/meta/recipes-devtools/automake/automake/0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 4339a2298a2d486fb4636b72393499b59805edde Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 21 Nov 2024 14:54:37 +0800
-Subject: [PATCH] configure: don't report error when the path of Perl contains
- spaces or tabs
-
-In order to make setting PERL to "/usr/bin/env perl" works well, patch
-configure as upstream suggested, refer [1]. 
-
-[1] https://debbugs.gnu.org/cgi/bugreport.cgi?bug=74453
-
-Upstream-Status: Inappropriate [ oe-specific ]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index 45bf85a..68d3c7d 100755
---- a/configure
-+++ b/configure
-@@ -3514,7 +3514,7 @@ case $PERL in
-    as_fn_error $? "perl not found" "$LINENO" 5
-    ;;
-  *' '* | *'	'*)
--  as_fn_error $? "The path to your Perl contains spaces or tabs.
-+  : as_fn_error $? "The path to your Perl contains spaces or tabs.
- This would cause build failures later or unusable programs.
- Please use a path without spaces and try again." "$LINENO" 5
-   ;;
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/automake/automake_1.17.bb b/meta/recipes-devtools/automake/automake_1.18.1.bb
similarity index 85%
rename from meta/recipes-devtools/automake/automake_1.17.bb
rename to meta/recipes-devtools/automake/automake_1.18.1.bb
index 4cda04e47b..4544f7d539 100644
--- a/meta/recipes-devtools/automake/automake_1.17.bb
+++ b/meta/recipes-devtools/automake/automake_1.18.1.bb
@@ -22,10 +22,9 @@ SRC_URI += "\
            file://0002-automake-Update-for-python.m4-to-respect-libdir.patch \
            file://0004-Add-a-new-distro-feature-ptest.patch \
            file://0006-automake-Remove-delays-in-configure-scripts-using-au.patch \
-           file://0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch \
            "
 
-SRC_URI[sha256sum] = "397767d4db3018dd4440825b60c64258b636eaf6bf99ac8b0897f06c89310acd"
+SRC_URI[sha256sum] = "63e585246d0fc8772dffdee0724f2f988146d1a3f1c756a3dc5cfbefa3c01915"
 
 PERL = "${USRBINPATH}/perl"
 PERL:class-native = "${USRBINPATH}/env perl"
-- 
2.49.0


