Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB806C77B7C
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 15:46:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.27315.1751471192228143374
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 08:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=927893d721=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5628uR2Y032384
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Jul 2025 15:46:31 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j7c9cha3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 15:46:31 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 2 Jul 2025 08:46:29 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 2 Jul 2025 08:46:28 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH  5/6] xwayland: fix CVE-2025-49179
Date: Wed, 2 Jul 2025 21:16:18 +0530
Message-ID: <20250702154619.3765505-5-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250702154619.3765505-1-archana.polampalli@windriver.com>
References: <20250702154619.3765505-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: xR1tGEIHs-h1rdy0oCLGNYzNOcudqOKj
X-Proofpoint-GUID: xR1tGEIHs-h1rdy0oCLGNYzNOcudqOKj
X-Authority-Analysis: v=2.4 cv=M5xNKzws c=1 sm=1 tr=0 ts=68655457 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=aR16PxjQAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=D31QgfloAAAA:8
 a=srCqXsuJmE3NBOGLpTcA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=zbFvvTOBjyH4ze5LlUjX:22 a=FdTzh2GWekK77mhwV6Dw:22 a=I6paTPn9_Px6ARgSWtWf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEzMCBTYWx0ZWRfX/gqU97Fdci/V Yo9YQUk5/5Mg05TgpnxP4QXEU2Tk3w8OdWv1lraoJnMQlQ+2hnitC6EigKPpCMn1ryN0rXxUvq2 bZlCIiUP3LpRwPOgDoUUbWu5KT7jFHLwgz9SpPT7SwQbNyrDZm3eyaioCjroyQok5EGhZMyMvbf
 jR7cdxqPSlxbc+51zEbu/TZ0ZXLnLELKyFk+gVTkJ7BHQILzH938n/PVZtcAdfmwQnamxU3HkQ/ pfEWLVmUg0BxOLrS+KP+Mcda4MjGxaTo6USXu9N0CNSVsrJ2XtGSO5d2loMAhos0slWeisZWtKo XO+HvCclHelS/8vMVYx0DJQsZRwlNs3qi3fB9Ups8gsLZHI4/d+dIKxT8AhlKatjV3oXl8OQDUx
 HKpWtWIYGkE+m65a+YJf9WFdDQjzjXjuGNs93IlA7OgHkLtknwWOumv2sl2+yziJ8LGqHFR1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=831 suspectscore=0 mlxscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507020130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 15:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219847

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in the X Record extension. The RecordSanityCheckRegisterClients
function does not check for an integer overflow when computing request length,
which allows a client to bypass length checks.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../xwayland/xwayland/CVE-2025-49179.patch    | 69 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-49179.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49179.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49179.patch
new file mode 100644
index 0000000000..48c7ed8c13
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49179.patch
@@ -0,0 +1,69 @@
+From 9d205323894af62b9726fcbaeb5fc69b3c9f61ba Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 28 Apr 2025 11:47:15 +0200
+Subject: [PATCH]  record: Check for overflow in
+ RecordSanityCheckRegisterClients()
+
+The RecordSanityCheckRegisterClients() checks for the request length,
+but does not check for integer overflow.
+
+A client might send a very large value for either the number of clients
+or the number of protocol ranges that will cause an integer overflow in
+the request length computation, defeating the check for request length.
+
+To avoid the issue, explicitly check the number of clients against the
+limit of clients (which is much lower than an maximum integer value) and
+the number of protocol ranges (multiplied by the record length) do not
+exceed the maximum integer value.
+
+This way, we ensure that the final computation for the request length
+will not overflow the maximum integer limit.
+
+CVE-2025-49179
+
+This issue was discovered by Nils Emmerich <nemmerich@ernw.de> and
+reported by Julian Suleder via ERNW Vulnerability Disclosure.
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+(cherry picked from commit 2bde9ca49a8fd9a1e6697d5e7ef837870d66f5d4)
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2026>
+
+CVE: CVE-2025-49179
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/9d205323894af62b9726fcbaeb5fc69b3c9f61ba]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ record/record.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/record/record.c b/record/record.c
+index e123867..018e53f 100644
+--- a/record/record.c
++++ b/record/record.c
+@@ -45,6 +45,7 @@ and Jim Haggerty of Metheus.
+ #include "inputstr.h"
+ #include "eventconvert.h"
+ #include "scrnintstr.h"
++#include "opaque.h"
+
+ #include <stdio.h>
+ #include <assert.h>
+@@ -1298,6 +1299,13 @@ RecordSanityCheckRegisterClients(RecordContextPtr pContext, ClientPtr client,
+     int i;
+     XID recordingClient;
+
++    /* LimitClients is 2048 at max, way less that MAXINT */
++    if (stuff->nClients > LimitClients)
++        return BadValue;
++
++    if (stuff->nRanges > (MAXINT - 4 * stuff->nClients) / SIZEOF(xRecordRange))
++        return BadValue;
++
+     if (((client->req_len << 2) - SIZEOF(xRecordRegisterClientsReq)) !=
+         4 * stuff->nClients + SIZEOF(xRecordRange) * stuff->nRanges)
+         return BadLength;
+--
+2.40.0
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index e150961882..490e1ca05f 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-49176-0002.patch \
            file://CVE-2025-49177.patch \
            file://CVE-2025-49178.patch \
+           file://CVE-2025-49179.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.40.0


