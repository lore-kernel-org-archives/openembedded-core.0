Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F63C5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 11:17:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14132.1749035833287132621
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 04:17:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8250111c01=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5544wnMI017294
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jun 2025 11:17:12 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9t2c9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 11:17:12 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 4 Jun 2025 04:17:11 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 4 Jun 2025 04:17:09 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH  4/4] ghostscript: fix CVE-2025-48708
Date: Wed, 4 Jun 2025 16:46:59 +0530
Message-ID: <20250604111659.3136031-4-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604111659.3136031-1-archana.polampalli@windriver.com>
References: <20250604111659.3136031-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 6FQzt_UizXooMFijCefqRegOcwF6hQn6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA4NiBTYWx0ZWRfX2OEiQD5tWDzb CgLzlDy/o5jaRLY/KXZpZR+1NYj0iFjAUEToHnuN55XIwMKmXQ40BH1sHgyl4GdpqZkwdWbxdrM b37ad9T1kPwsVeOli+9RrPtJyS3N/jvB0oN8hxxEgMBv9AuqiJrp6Im7gFxTRmzPNtwgL7MV2K7
 MYGuyV2yCF/xVwukoTyJrRn4a0sUatuBJxcT72Xp5ukV4yBg3h8TPpivSXdfBs3n9cikFl/dRGR Mxv0Gya7goXXTaZfMCD2qdWdtn2EBX4NGEhMLpjXpmIlPm0vuAmwr+BbKRKbk7yGq1jfiwc/P5F LM/OhsSLddLrIrFFdhlqGCjJdoQ2koRaXUhrO5Fwz3tSSaGu0WUgQWYX/RvoreUrVIeq/2ESjDo
 6dS5MjN8HT58SH83iZUwIBae4T8AJ65Xd/XL6ah3dUVA8zkQzz02P8eoPW1PT0od7X2lCNVz
X-Proofpoint-GUID: 6FQzt_UizXooMFijCefqRegOcwF6hQn6
X-Authority-Analysis: v=2.4 cv=Q4DS452a c=1 sm=1 tr=0 ts=68402b38 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=gDkh9niWAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=slZ_zXfIAAAA:8 a=KSuMTYRfTUycT6UA_YAA:9
 a=lGOMK5oLEwUwZHJ1FuQB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=WUFrAgOMYDQKzGe6rZ6X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=902
 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506040086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 11:17:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217906

From: Archana Polampalli <archana.polampalli@windriver.com>

gs_lib_ctx_stash_sanitized_arg in base/gslibctx.c in Artifex Ghostscript before 10.05.1
lacks argument sanitization for the # case. A created PDF document includes
its password in cleartext.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ghostscript/CVE-2025-48708.patch          | 46 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-48708.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-48708.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-48708.patch
new file mode 100644
index 0000000000..5c8069a4ea
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-48708.patch
@@ -0,0 +1,46 @@
+From 5b5968c306b3e35cdeec83bb15026fd74a7334de Mon Sep 17 00:00:00 2001
+From: Ken Sharp <Ken.Sharp@artifex.com>
+Date: Sat, 12 Apr 2025 10:24:43 +0100
+Subject: [PATCH] Argument sanitisation - handle '#' as per '='
+
+Bug 708446
+
+CVE: CVE-2025-48708
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=5b5968c306b3e35cdeec83bb15026fd74a7334de]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ base/gslibctx.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/base/gslibctx.c b/base/gslibctx.c
+index 2cf5c9dda..40ff984f9 100644
+--- a/base/gslibctx.c
++++ b/base/gslibctx.c
+@@ -1225,9 +1225,9 @@ gs_lib_ctx_stash_sanitized_arg(gs_lib_ctx_t *ctx, const char *arg)
+         case '-': /* Need to check for permitted file lists */
+             /* By default, we want to keep the key, but lose the value */
+             p = arg+2;
+-            while (*p && *p != '=')
++            while (*p && *p != '=' && *p != '#')
+                 p++;
+-            if (*p == '=')
++            if (*p == '=' || *p == '#')
+                 p++;
+             if (*p == 0)
+                 break; /* No value to elide */
+@@ -1269,9 +1269,9 @@ gs_lib_ctx_stash_sanitized_arg(gs_lib_ctx_t *ctx, const char *arg)
+         case 'S':
+             /* By default, we want to keep the key, but lose the value */
+             p = arg+2;
+-            while (*p && *p != '=')
++            while (*p && *p != '=' && *p != '#')
+                 p++;
+-            if (*p == '=')
++            if (*p == '=' || *p == '#')
+                 p++;
+             if (*p == 0)
+                 break; /* No value to elide */
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index e872fbe88c..3b50ac1409 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -73,6 +73,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2025-27835.patch \
                 file://CVE-2025-27836-1.patch \
                 file://CVE-2025-27836-2.patch \
+                file://CVE-2025-48708.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.49.0


