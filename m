Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8282E77198
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 08:02:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.54899.1736150535722111404
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jan 2025 00:02:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3101b0e108=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5067i3sY028109
	for <openembedded-core@lists.openembedded.org>; Mon, 6 Jan 2025 08:02:15 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43xt70hk6j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 06 Jan 2025 08:02:14 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 6 Jan 2025 00:02:13 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 6 Jan 2025 00:02:13 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] fmt: 11.0.2 -> 11.1.1
Date: Mon, 6 Jan 2025 00:02:12 -0800
Message-ID: <b6a3ea4a7a3c811d7f3f9fa74e11d5001321ecb1.1736150475.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <cover.1736150475.git.liezhi.yang@windriver.com>
References: <cover.1736150475.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: bDRsOMDG5pDTGTjaOYXvrJjmS9gRz6VJ
X-Proofpoint-ORIG-GUID: bDRsOMDG5pDTGTjaOYXvrJjmS9gRz6VJ
X-Authority-Analysis: v=2.4 cv=T/l2T+KQ c=1 sm=1 tr=0 ts=677b8e06 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VdSt8ZQiCzkA:10 a=NEAV23lmAAAA:8 a=XkUYdDwvAAAA:8 a=t7CeM3EgAAAA:8 a=VabnemYjAAAA:8 a=pGLkceISAAAA:8
 a=LLhvlA6kFHVoQmNrmNcA:9 a=22Hr7QaVm-UqefIw97Vx:22 a=FdTzh2GWekK77mhwV6Dw:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxlogscore=764 phishscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501060070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jan 2025 08:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209422

From: Robert Yang <liezhi.yang@windriver.com>

Remove backported patch 0001-Get-rid-of-std-copy.patch.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../fmt/fmt/0001-Get-rid-of-std-copy.patch    | 52 -------------------
 .../fmt/{fmt_11.0.2.bb => fmt_11.1.1.bb}      |  6 +--
 2 files changed, 2 insertions(+), 56 deletions(-)
 delete mode 100644 meta/recipes-devtools/fmt/fmt/0001-Get-rid-of-std-copy.patch
 rename meta/recipes-devtools/fmt/{fmt_11.0.2.bb => fmt_11.1.1.bb} (80%)

diff --git a/meta/recipes-devtools/fmt/fmt/0001-Get-rid-of-std-copy.patch b/meta/recipes-devtools/fmt/fmt/0001-Get-rid-of-std-copy.patch
deleted file mode 100644
index 1b495ea075..0000000000
--- a/meta/recipes-devtools/fmt/fmt/0001-Get-rid-of-std-copy.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 6e462b89aa22fd5f737ed162d0150e145ccb1914 Mon Sep 17 00:00:00 2001
-From: Victor Zverovich <viz@meta.com>
-Date: Mon, 29 Jul 2024 15:58:05 -0700
-Subject: [PATCH] Get rid of std::copy
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport [https://github.com/fmtlib/fmt/commit/6e462b89aa22fd5f737ed162d0150e145ccb1914]
----
- include/fmt/color.h | 11 +++++------
- 1 file changed, 5 insertions(+), 6 deletions(-)
-
-diff --git a/include/fmt/color.h b/include/fmt/color.h
-index f0e9dd94..231d93c8 100644
---- a/include/fmt/color.h
-+++ b/include/fmt/color.h
-@@ -560,31 +560,30 @@ struct formatter<detail::styled_arg<T>, Char> : formatter<T, Char> {
-   auto format(const detail::styled_arg<T>& arg, FormatContext& ctx) const
-       -> decltype(ctx.out()) {
-     const auto& ts = arg.style;
--    const auto& value = arg.value;
-     auto out = ctx.out();
- 
-     bool has_style = false;
-     if (ts.has_emphasis()) {
-       has_style = true;
-       auto emphasis = detail::make_emphasis<Char>(ts.get_emphasis());
--      out = std::copy(emphasis.begin(), emphasis.end(), out);
-+      out = detail::copy<Char>(emphasis.begin(), emphasis.end(), out);
-     }
-     if (ts.has_foreground()) {
-       has_style = true;
-       auto foreground =
-           detail::make_foreground_color<Char>(ts.get_foreground());
--      out = std::copy(foreground.begin(), foreground.end(), out);
-+      out = detail::copy<Char>(foreground.begin(), foreground.end(), out);
-     }
-     if (ts.has_background()) {
-       has_style = true;
-       auto background =
-           detail::make_background_color<Char>(ts.get_background());
--      out = std::copy(background.begin(), background.end(), out);
-+      out = detail::copy<Char>(background.begin(), background.end(), out);
-     }
--    out = formatter<T, Char>::format(value, ctx);
-+    out = formatter<T, Char>::format(arg.value, ctx);
-     if (has_style) {
-       auto reset_color = string_view("\x1b[0m");
--      out = std::copy(reset_color.begin(), reset_color.end(), out);
-+      out = detail::copy<Char>(reset_color.begin(), reset_color.end(), out);
-     }
-     return out;
-   }
diff --git a/meta/recipes-devtools/fmt/fmt_11.0.2.bb b/meta/recipes-devtools/fmt/fmt_11.1.1.bb
similarity index 80%
rename from meta/recipes-devtools/fmt/fmt_11.0.2.bb
rename to meta/recipes-devtools/fmt/fmt_11.1.1.bb
index 5c60921efa..a99a377ad4 100644
--- a/meta/recipes-devtools/fmt/fmt_11.0.2.bb
+++ b/meta/recipes-devtools/fmt/fmt_11.1.1.bb
@@ -4,10 +4,8 @@ HOMEPAGE = "https://fmt.dev"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b9257785fc4f3803a4b71b76c1412729"
 
-SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https \
-           file://0001-Get-rid-of-std-copy.patch \
-           "
-SRCREV = "0c9fce2ffefecfdce794e1859584e25877b7b592"
+SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https"
+SRCREV = "e3ddede6c4ee818825c4e5a6dfa1d384860c27d9"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.1


