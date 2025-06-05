Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1398FC5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 03:02:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.35027.1749092549821963981
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 20:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8251f2c3bd=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5552qN6v019453
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Jun 2025 03:02:29 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9q3dc8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 03:02:28 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 4 Jun 2025 20:02:26 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 4 Jun 2025 20:02:26 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] automake: 1.17 -> 1.18
Date: Wed, 4 Jun 2025 20:02:31 -0700
Message-ID: <186484bc29ea5b9bbefd86532a9a403050f46a50.1749092509.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749092509.git.liezhi.yang@windriver.com>
References: <cover.1749092509.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: p_uz5pfsKb-_3S49aoBM9ISDFxl5BbAB
X-Authority-Analysis: v=2.4 cv=X8RSKHTe c=1 sm=1 tr=0 ts=684108c4 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=8jO5rjKrqcU4rLs2z54A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDAyMyBTYWx0ZWRfXx1aN7Ojto6Yf SkYpf+ZUYkwDMu6n9LFWyK8DLjdBKc9jH0JqiHTeb7RbqLX2LMJjg8y0wbj2eFvnZKH93rcUP4o SxJ0BX1BnkgGsam1lnIDmmRTCqtXIvQxKb4qa8sTtqKZQqVL0hJPnGbHXaGaVy574gu10ex97DJ
 xK8ip/ZjlES/Kn58ft4Du97eR7xjZJ2f4RRFTV++AffnVh8JnCGb0GhO6vqe8r2uUZSeaSgmW2L jy0cfO2hIuoEGIkRpxCjA/fUnyrMtkBYtdZT5ucPOgq7Wo8Q9Y8KhiCu0sRSY0DamaQ0j1Y70XV WFyLMdu89QZ3p2Yiz/B6/7WHW2+jGbi7sVrE4h1pUYbGZ3XcxReBwxXaNUECXExqq1WgA2Crci5
 xiipu0Gg2Bi570O338nDVHqsmQRx0fttYTNyP4HeqDjIug2qL/lKQqqhLRV4G4+8Ex7MO0Qk
X-Proofpoint-ORIG-GUID: p_uz5pfsKb-_3S49aoBM9ISDFxl5BbAB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 mlxlogscore=808 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506050023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 03:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217975

From: Robert Yang <liezhi.yang@windriver.com>

* Rebased 0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch
  The previous patch added a ':' before the line to make it not run, but now
  there are multiple lines, so just remove them.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...report-error-when-the-path-of-Perl-c.patch | 27 +++++++++++--------
 .../{automake_1.17.bb => automake_1.18.bb}    |  2 +-
 2 files changed, 17 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/automake/{automake_1.17.bb => automake_1.18.bb} (92%)

diff --git a/meta/recipes-devtools/automake/automake/0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch b/meta/recipes-devtools/automake/automake/0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch
index 5a38feb16c..fd6d8affaa 100644
--- a/meta/recipes-devtools/automake/automake/0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch
+++ b/meta/recipes-devtools/automake/automake/0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch
@@ -13,22 +13,27 @@ Upstream-Status: Inappropriate [ oe-specific ]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ configure |   10 ----------
+ 1 file changed, 10 deletions(-)
 
 diff --git a/configure b/configure
-index 45bf85a..68d3c7d 100755
+index 64b61eb..786aefd 100755
 --- a/configure
 +++ b/configure
-@@ -3514,7 +3514,7 @@ case $PERL in
+@@ -3776,16 +3776,6 @@ case $PERL in
     as_fn_error $? "perl not found" "$LINENO" 5
     ;;
   *' '* | *'	'*)
--  as_fn_error $? "The path to your Perl contains spaces or tabs.
-+  : as_fn_error $? "The path to your Perl contains spaces or tabs.
- This would cause build failures later or unusable programs.
- Please use a path without spaces and try again." "$LINENO" 5
+-  { printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: The path to your Perl contains spaces or tabs.
+-This will likely cause build failures later or unusable programs.
+-Unless you're specifying a full string for a #! line,
+-as in \"/usr/bin/env perl\",
+-please use a path without spaces and try again." >&5
+-printf "%s\n" "$as_me: WARNING: The path to your Perl contains spaces or tabs.
+-This will likely cause build failures later or unusable programs.
+-Unless you're specifying a full string for a #! line,
+-as in \"/usr/bin/env perl\",
+-please use a path without spaces and try again." >&2;}
    ;;
--- 
-2.25.1
-
+ esac
+ 
diff --git a/meta/recipes-devtools/automake/automake_1.17.bb b/meta/recipes-devtools/automake/automake_1.18.bb
similarity index 92%
rename from meta/recipes-devtools/automake/automake_1.17.bb
rename to meta/recipes-devtools/automake/automake_1.18.bb
index 4cda04e47b..9179268c7a 100644
--- a/meta/recipes-devtools/automake/automake_1.17.bb
+++ b/meta/recipes-devtools/automake/automake_1.18.bb
@@ -25,7 +25,7 @@ SRC_URI += "\
            file://0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch \
            "
 
-SRC_URI[sha256sum] = "397767d4db3018dd4440825b60c64258b636eaf6bf99ac8b0897f06c89310acd"
+SRC_URI[sha256sum] = "af6043a5d4b3beef0c48161f4a6936259321cd101a34c1ab0768328515626c8a"
 
 PERL = "${USRBINPATH}/perl"
 PERL:class-native = "${USRBINPATH}/env perl"
-- 
2.49.0


