Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5997C7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 13:16:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7190.1750252592667747695
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 06:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8264e32d1b=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IAmJsZ025230
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 13:16:31 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 478xa1mme8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 13:16:31 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 18 Jun 2025 06:16:30 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 18 Jun 2025 06:16:28 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] systemtap: add sysroot Python paths to configure flags
Date: Wed, 18 Jun 2025 18:46:24 +0530
Message-ID: <20250618131624.4093387-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=PuiTbxM3 c=1 sm=1 tr=0 ts=6852bc2f cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=O0CcSXKsLRh4rcT418cA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: InLmKisbwyDvGx_k18yVU97UauPJsYDC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDExMiBTYWx0ZWRfX50DPrkJ1E5Mt ZNDgZdIpJaV05LOG3ghM1EeRXBX5X6Nt8hN9GBzwrpNxRnF02+6tBDn2Q6IUOsUAy5XZbpk306W 7IrFTEMj6GS5ZKM6TupJOwUPrrB0mqovf+PWH0BqJ0GyCtwSU8y6+44Bql5qmlFI7TKkN5PHn3Z
 1mjjAOXXpgsHRcEmiQpyoHUc+NNGvWVIaEZEhinb0iw9i05zJoUqBsnMqfNcs2xJoPPqrrcL/dj hOusSUf34tHlwnJEunTvwALI9YuyPk7vMVI4V49yGtQAy7SkYJF+n9U43xcRNcwVT/ZUqrcSX2V 5RCi7k3CGmAlRi/3wPXwqcnsAMg3vC+TqtWURi/5isvGiN7sLcTLAGFDkmCnojjSFyRqgknCPKE
 0g8AkpiWJ/GlDiE4OXkSy9/KSmH1XhYtQJUKZph3HpsknBhGDdAhW598nRvVxWJXD4j2Go14
X-Proofpoint-GUID: InLmKisbwyDvGx_k18yVU97UauPJsYDC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=652 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506180112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 13:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219012

From: Soumya Sambu <soumya.sambu@windriver.com>

Explicitly set Python-related flags to use sysroot-staged headers and tools.

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index c84fc27001..40ccf1d523 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -35,6 +35,13 @@ PACKAGECONFIG[python3-probes] = "--with-python3-probes,--without-python3-probes,
 inherit autotools gettext pkgconfig systemd
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3-probes', 'setuptools3-base', '', d)}
 
+EXTRA_OECONF += " \
+    PYTHON_CPPFLAGS=-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION} \
+    PYTHON3_CONFIG=${STAGING_BINDIR_NATIVE}/python3-config \
+"
+
+CPPFLAGS:append = " -I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}"
+
 # exporter comes with python3-probes
 PACKAGES =+ "${PN}-exporter"
 FILES:${PN}-exporter = "${sysconfdir}/stap-exporter/* \
-- 
2.40.0


