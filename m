Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3123C7EE30
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 21:28:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7306.1750973284316731472
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 14:28:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=827273cba7=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QJUAsN027962
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 14:28:04 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dr14wycp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 14:28:03 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 26 Jun 2025 14:28:00 -0700
Received: from pop-os.wrs.com (172.25.44.2) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.57 via Frontend
 Transport; Thu, 26 Jun 2025 14:27:59 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] ninja: upgrade 1.12.1 -> 1.13.0
Date: Thu, 26 Jun 2025 17:28:02 -0400
Message-ID: <20250626212802.886993-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 8CNc42bKgRzE96DLEi7T3z3XlKpLM_Kg
X-Proofpoint-GUID: 8CNc42bKgRzE96DLEi7T3z3XlKpLM_Kg
X-Authority-Analysis: v=2.4 cv=XYKJzJ55 c=1 sm=1 tr=0 ts=685dbb63 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=jtyxVqDdAAAA:8 a=t7CeM3EgAAAA:8 a=WNB8jfp9XyeuIFYmSg8A:9 a=D0qpmhatDSoHz4RXNCtZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE4MyBTYWx0ZWRfXwRith4CqrwPh PBOGlwUTVRXkUT9giLxqFhNCfSm5zZ5mx53OD9MyieJVUhSGlCKu7mp0mC9mjBk/oDEjxSOGVmr rU+VRa3D/rszUGhpxOWxtHccBi5mWkYVDZW6vXWljxZkUO10tXWbhg18C77QQtiHP3EFmZZvciD
 se1ykqxZIjgqPtdj7ufDhAACWUc41xHGG8HdBVP2RzViO3fevNEy5Kh6Ya3I61VjkEpgCU9z5Jq /mYEOPVAK4tiAbsS/EfIh5cnjBMV51rrCtFNLJbakHvgSMKY7KlRVRqAXxTmXHZSOujZuXY02fF zec++DRuTZC/YRE/YSSRyXBucCcyl905RvAKQzjw8oCk4oAWFgRnwyeE5zpHjXSoN5kJmjZVm7y
 IQ3SYsMuJNZnh33yj0cCj4B0vEQtw2eY4x7+cj6Dp3Bs98/xgKH3r9IjdSwm0fclfpy1hZHy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506260183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 21:28:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219373

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Changelog:
==========
 - Ninja now automatically joins a GNU Make jobserver as a client
   (version 4.4 on non-Windows systems required for "fifo" style) #1139
 - Print exit code of failed subcommands #1507
 - ninja -t compdb accepts a target #1544
 - Support for ANSI (color) escape codes in NINJA_STATUS #713

See:
   https://github.com/ninja-build/ninja/milestone/8?closed=1
for a complete list of changes.

Add tag to SRC_URI as is now required.
Also line-wrap the DESCRIPTION.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../ninja/{ninja_1.12.1.bb => ninja_1.13.0.bb}         | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/ninja/{ninja_1.12.1.bb => ninja_1.13.0.bb} (71%)

diff --git a/meta/recipes-devtools/ninja/ninja_1.12.1.bb b/meta/recipes-devtools/ninja/ninja_1.13.0.bb
similarity index 71%
rename from meta/recipes-devtools/ninja/ninja_1.12.1.bb
rename to meta/recipes-devtools/ninja/ninja_1.13.0.bb
index 5aff82edec..a5fa8f1c9e 100644
--- a/meta/recipes-devtools/ninja/ninja_1.12.1.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.13.0.bb
@@ -1,14 +1,18 @@
 SUMMARY = "Ninja is a small build system with a focus on speed."
 HOMEPAGE = "https://ninja-build.org/"
-DESCRIPTION = "Ninja is a small build system with a focus on speed. It differs from other build systems in two major respects: it is designed to have its input files generated by a higher-level build system, and it is designed to run builds as fast as possible."
+DESCRIPTION = "Ninja is a small build system with a focus on speed. \
+It differs from other build systems in two major respects: \
+it is designed to have its input files generated by a higher-level build system, \
+and it is designed to run builds as fast as possible."
+
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
 
 DEPENDS = "re2c-native ninja-native"
 
-SRCREV = "2daa09ba270b0a43e1929d29b073348aa985dfaa"
+SRCREV = "b4d51f6ed5bed09dd2b70324df0d9cb4ecad2638"
 
-SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release;protocol=https"
+SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release;protocol=https;tag=v${PV}"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 do_configure[noexec] = "1"
-- 
2.34.1


