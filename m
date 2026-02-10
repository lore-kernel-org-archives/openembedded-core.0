Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8193EA3F18
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 07:10:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15029.1770707445624027233
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 23:10:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=c0XwVbh7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6501c5c083=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A6dUMd1796014
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Feb 2026 23:10:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=69y5Bc95gn9XoZ+6/acmI+aMKnPRiVYPNRXIjGr0UIY=; b=c0XwVbh7Q5YK
	yIoVBQjWpb3JhPz4D0lS0zqD2yhNeAwsR3ITNMdV+2mITXNmit2lbh0uBvEIB9LI
	LWpFn85kVhmJmB9YW51mUp18npkjAFtyC3XIr9rwaOd8MACPGe6cg7l7YLeWvUGn
	tGVfuDCI/v32ZXmoxP8pwNL3Mwha1jUUiXopBAnY9VGVZTXtZo0tbLPoHRE/iXwf
	l8DsQWhOrOwFDcnfgVY6ReKFiDrOujclLZektoL+uFJh5MLQM38M5T2RntZnmBLz
	SdhVPMCZ3Fq8joyQkUAiAAR+Ba9mV7AaWDizWPTlA13SGFPv7rhWq22nYWEanN83
	JwvPDrR4YQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c65sj2m0n-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 23:10:45 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 9 Feb 2026 23:10:43 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 9 Feb 2026 23:10:43 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v4 4/7] glib/python3/acl: Add pkgconfig to RDEPENDS
Date: Mon, 9 Feb 2026 23:10:39 -0800
Message-ID: <bee6177a943034e9e2093cdf8294eca003b709d1.1770707181.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <cover.1770707181.git.liezhi.yang@windriver.com>
References: <cover.1770707181.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: mE4U0cHmjNl7WAaX_nUzLNG_DEYK1XBb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA1OSBTYWx0ZWRfX1cMN3ILZ45q+
 W0huWeSHxqvO0uyBFzbnE4CZU2nJEJahBZhTSLlCJxM5/1b9569uAwz6H0tB+3W8xuo61VIywE6
 /wAS1izsiBnWXN8ZWuNvPkcIRHrZs9Oog16tSfbjyTbt4thguGXc16Ib8hCnbnvLLiSCdSVYIB8
 bhioXJmIWEPlud8jl+DoRyYFlDln7S9YbMFyNWdhZUsrtZrgRdUyTMGJL0Hr6T9/+GZfsC1QfTs
 hO7EAu8Hp6mHV1uY1GRVQzSND6mU+2dGxQR0ZJ3GXKF3Jmdzk+iMGNpKaOBheB6xFGw0O+95QN6
 S6IGDl/hHqBsERE3yKEuPhMZCa2oAVHNVoLhD0QWlXzAZcf6wS8rF0wn5pK2/HsRk8nTjBOlup1
 6lvXCQoq9BI65ocmrTybwbf7LjRedK/2DGvZiav73Jl0pk4ozmntqJrTV9Asda1Hhx1ntPUc7ID
 qYIZ7MvXqVFucioySdQ==
X-Proofpoint-GUID: mE4U0cHmjNl7WAaX_nUzLNG_DEYK1XBb
X-Authority-Analysis: v=2.4 cv=Cpyys34D c=1 sm=1 tr=0 ts=698ad9f5 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8 a=npddxdQffQXCx6DdGT8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 07:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230856

From: Robert Yang <liezhi.yang@windriver.com>

Fixed issues like::
Error:
 Problem 1: package python3-ptest-3.14.2-r0.cortexa15t2hf_neon from oe-repo requires python3-dev, but none of the providers can be installed
  - conflicting requests
  - nothing provides /usr/bin/pkg-config needed by python3-dev-3.14.2-r0.cortexa15t2hf_neon from oe-repo
 Problem 2: package libglib-2.0-ptest-1:2.86.3-r0.cortexa15t2hf_neon from oe-repo requires glib-2.0-dev, but none of the providers can be installed
  - conflicting requests
  - nothing provides /usr/bin/pkg-config needed by libglib-2.0-dev-1:2.86.3-r0.cortexa15t2hf_neon from oe-repo
(try to add '--skip-broken' to skip uninstallable packages or '--setopt=optional_metadata_types=filelists' to load additional filelists metadata)

This is because the rpm 6.0.1 can find the pkg-config files (.pc)
provides/requires correctly now, the rpm 4.20.1 couldn't find that.
---
 meta/recipes-core/glib-2.0/glib.inc            | 2 +-
 meta/recipes-devtools/python/python3_3.14.2.bb | 2 ++
 meta/recipes-support/attr/acl_2.3.2.bb         | 2 ++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 2e15cc7675..3d733e21ae 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -159,7 +159,7 @@ CODEGEN_PYTHON_RDEPENDS:mingw32 = ""
 
 RDEPENDS:${PN}-codegen += "${CODEGEN_PYTHON_RDEPENDS}"
 
-RDEPENDS:${PN}-dev += "${PN}-utils"
+RDEPENDS:${PN}-dev += "${PN}-utils pkgconfig"
 
 RDEPENDS:${PN}-ptest += "\
             coreutils \
diff --git a/meta/recipes-devtools/python/python3_3.14.2.bb b/meta/recipes-devtools/python/python3_3.14.2.bb
index 7481e70e13..7af828684e 100644
--- a/meta/recipes-devtools/python/python3_3.14.2.bb
+++ b/meta/recipes-devtools/python/python3_3.14.2.bb
@@ -493,6 +493,8 @@ RDEPENDS:${PN}-pydoc += "${PN}-io"
 RDEPENDS:${PN}-tests:append:class-target = " ${MLPREFIX}bash"
 RDEPENDS:${PN}-tests:append:class-nativesdk = " ${MLPREFIX}bash"
 
+RDEPENDS:{PN}-dev += "pkgconfig"
+
 # Python's tests contain large numbers of files we don't need in the recipe sysroots
 SYSROOT_PREPROCESS_FUNCS += " py3_sysroot_cleanup"
 py3_sysroot_cleanup () {
diff --git a/meta/recipes-support/attr/acl_2.3.2.bb b/meta/recipes-support/attr/acl_2.3.2.bb
index a405cc2692..1a6c9136e9 100644
--- a/meta/recipes-support/attr/acl_2.3.2.bb
+++ b/meta/recipes-support/attr/acl_2.3.2.bb
@@ -67,4 +67,6 @@ RDEPENDS:${PN}-ptest = "acl \
                         perl-module-posix \
                        "
 
+RDEPENDS:${PN}-dev = "pkgconfig"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.49.1


