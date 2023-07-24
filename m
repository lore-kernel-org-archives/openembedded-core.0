Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3693DC0015E
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 07:48:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.42725.1690184903456795483
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 00:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cqq9Rh59;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65692af2bb=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36O7P1ZT028697;
	Mon, 24 Jul 2023 07:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=tRBgi
	WJbT9SYSoBFMOD6KQApj3OTP5T6yjKOm6VJytw=; b=cqq9Rh59bJQpBxs/Ep0J1
	qeJRrQBa9GJjj7GZRNFqxa1Nob7qPQDhFtNYL6Yaj2qa5GjL6QIYjWFe86A166VU
	y4X/i1DD+4nYXcsxy5nh7E9UqnTUGUPi1yNTn9yu6E4KWmlShxERz2A0YSs9QvF+
	IvmhCLXbBopQi4O2Nw8QTbGJiUFXIGHXDYcl8KtjJ+wBYnIQ4Xf2ZBFVzomp3B++
	Q0rpzZ9IQ7k9faImZS2mMQU3bJx4HmCPZg9XpgmL2r3AA2bVetaFD2VVBMlrBYSI
	/nQWvQvftBciO5AIvMoY/yZgh/ZDW4Vh3xPs/RQtb2c1x+9CIDS7kG3U/AQb0h4X
	A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s1a78ramj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 24 Jul 2023 07:48:22 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 00:48:20 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 00:48:19 -0700
From: <kai.kang@windriver.com>
To: <steve@sakoman.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: [mickledore][PATCH] webkitgtk: disable DEBUG_BUILD
Date: Mon, 24 Jul 2023 15:48:15 +0800
Message-ID: <20230724074815.591827-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: qrDSb1PkGXpPNnSpZIQCt_IkPbMKEZpS
X-Proofpoint-GUID: qrDSb1PkGXpPNnSpZIQCt_IkPbMKEZpS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_06,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 mlxlogscore=511 mlxscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2307240069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 07:48:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184778

From: Kai Kang <kai.kang@windriver.com>

It fails to build webkitgtk with DEBUG_BUILD:

  Source/bmalloc/libpas/src/libpas/pas_generic_large_free_heap.h:140:1:
  error: inlining failed in call to 'always_inline'
  'pas_generic_large_free_heap_try_allocate_test_allocation_candidate':
  indirect function call with a yet undetermined callee
  | pas_generic_large_free_heap_try_allocate_test_allocation_candidate(
  | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

So disable DEBUG_BUILD for it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.38.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.38.6.bb
index 5e8adf50fc..e6d817cb62 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.38.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.38.6.bb
@@ -42,6 +42,9 @@ DEPENDS += " \
           gettext-native \
           "
 
+# webkitgtk fails to build with DEBUG_BUILD enabled
+DEBUG_BUILD = "0"
+
 PACKAGECONFIG_SOUP ?= "soup3"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
-- 
2.34.1


