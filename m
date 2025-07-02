Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08ABFC83F09
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 15:46:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.27314.1751471190359067926
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 08:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=927893d721=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5625uMix023396
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Jul 2025 15:46:29 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j7c9ch9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 15:46:29 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 2 Jul 2025 08:46:27 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 2 Jul 2025 08:46:26 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH  4/6] xwayland: fix CVE-2025-49178
Date: Wed, 2 Jul 2025 21:16:17 +0530
Message-ID: <20250702154619.3765505-4-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250702154619.3765505-1-archana.polampalli@windriver.com>
References: <20250702154619.3765505-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: A9XrBSOhYauoD5p-wyyj5Z2qZTanJbcc
X-Proofpoint-GUID: A9XrBSOhYauoD5p-wyyj5Z2qZTanJbcc
X-Authority-Analysis: v=2.4 cv=M5xNKzws c=1 sm=1 tr=0 ts=68655455 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=aR16PxjQAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=D31QgfloAAAA:8
 a=3wiCy6-QTMpVeIMz6ZkA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=zbFvvTOBjyH4ze5LlUjX:22 a=FdTzh2GWekK77mhwV6Dw:22 a=I6paTPn9_Px6ARgSWtWf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEzMCBTYWx0ZWRfX7c3hC7ejCo9V mWvt5KsWawbf4n9oIRUzben5QAEtl0+h4vzTgumucTLaMHR5LgmUVGghKpXyECTCU2gUNvDd/OH 2NNWaRmnEnCF4Ox1/EcFec9igr8ce8rDy7TXTIuiLG3/V2egfmZpIwJ58lKYqdrsSaIXdRiW04d
 EFBw+3cKi7FwMJV+mTLuqu79TiW2lDkfrfE6SPurvBx3eXpK8eZe/ETgCU1nCcZLFk3dV+1HdVU nWADj7ix+wEo7u0Kplg5i2tKYM323Q70OQjyieRVgizRu1g5t+/kWwsQdmvqVFXeH69r7hzmpnt YNoDvwhBbO5/PXgYHH1jb0UZWyPzxQpHsMAhMAFLerS6QTPBv1VYabkZIIC3kb+mceVxqzObOYg
 6i54utbX1EgOV9J6WzxVC+lMJQ6pstFrIHob0yaH+dsnKxRY1C9IaC3hnhLegcOsyfCAxO3i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507020130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 15:46:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219846

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in the X server's request handling. Non-zero 'bytes to ignore'
in a client's request can cause the server to skip processing another client's
request, potentially leading to a denial of service.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../xwayland/xwayland/CVE-2025-49178.patch    | 50 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-49178.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49178.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49178.patch
new file mode 100644
index 0000000000..5ef2fea1c9
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49178.patch
@@ -0,0 +1,50 @@
+From d55c54cecb5e83eaa2d56bed5cc4461f9ba318c2 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 28 Apr 2025 10:46:03 +0200
+Subject: [PATCH] os: Account for bytes to ignore when sharing input buffer
+
+When reading requests from the clients, the input buffer might be shared
+and used between different clients.
+
+If a given client sends a full request with non-zero bytes to ignore,
+the bytes to ignore may still be non-zero even though the request is
+full, in which case the buffer could be shared with another client who's
+request will not be processed because of those bytes to ignore, leading
+to a possible hang of the other client request.
+
+To avoid the issue, make sure we have zero bytes to ignore left in the
+input request when sharing the input buffer with another client.
+
+CVE-2025-49178
+
+This issue was discovered by Nils Emmerich <nemmerich@ernw.de> and
+reported by Julian Suleder via ERNW Vulnerability Disclosure.
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2024>
+
+CVE: CVE-2025-49178
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/d55c54cecb5e83eaa2d56bed5cc4461f9ba318c2]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ os/io.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/os/io.c b/os/io.c
+index 67465f9..f92a40e 100644
+--- a/os/io.c
++++ b/os/io.c
+@@ -444,7 +444,7 @@ ReadRequestFromClient(ClientPtr client)
+      */
+
+     gotnow -= needed;
+-    if (!gotnow)
++    if (!gotnow && !oci->ignoreBytes)
+         AvailableInput = oc;
+     if (move_header) {
+         if (client->req_len < bytes_to_int32(sizeof(xBigReq) - sizeof(xReq))) {
+--
+2.40.0
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index 5ed8ca0365..e150961882 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-49176-0001.patch \
            file://CVE-2025-49176-0002.patch \
            file://CVE-2025-49177.patch \
+           file://CVE-2025-49178.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.40.0


