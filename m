Return-Path: <maxin.john@gehealthcare.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3A5C52D71
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 09:53:27 +0000 (UTC)
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com [67.231.149.52])
 by mx.groups.io with SMTP id smtpd.web11.39370.1722419601974583455
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jul 2024 02:53:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gehealthcare.com header.s=outbound header.b=BhFOUBqX;
 spf=pass (domain: gehealthcare.com, ip: 67.231.149.52, mailfrom: maxin.john@gehealthcare.com)
Received: from pps.filterd (m0048274.ppops.net [127.0.0.1])
	by m0048274.ppops.net-00176a03. (8.18.1.2/8.18.1.2) with ESMTP id 46V9N8ZT023385
	for <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 05:53:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	gehealthcare.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	outbound; bh=oWztl8nNfVBgocyNwSogs5ecH++fsCRQGevVhDByNeo=; b=BhF
	OUBqXEzDjaLglF+C9wOpdyRIbYUmadFULxcAJpDYFwBWK6FCtvI5M1oq3/BSvOLb
	rbupCfXZgUzvwGxPloUMEWqWI/Osc6XmBLnx7RJEjkaYIsAifoxQGNK9MwRzTWC0
	xI3aYwY2SYGaMOksNBGH8uFPGCqqZybJ2jsxswcpSEjpAHLVRW+9t7fyZ6oaTG3W
	9sQOg7xUE0skbf3W5qBe2BgaMoyvExsyoDNXqwAJ07SPajPbdgOvwzXZS9hOutsu
	Xt6jj0/fWOmUZTSWPbcuLACufPBGEP12juLvy4sBNAGL8K1WbeA9krRhkfIJdOct
	G3EygFcsGaQu1iSvkcg==
From: Maxin John <maxin.john@gehealthcare.com>
To: openembedded-core@lists.openembedded.org
Cc: Intaek Hwang <intaek.hwang@gehealthcare.com>
Subject: [PATCH 3/7] libatomic-ops: set CVE_PRODUCT
Date: Wed, 31 Jul 2024 12:53:05 +0300
Message-Id: <20240731095309.95-4-maxin.john@gehealthcare.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240731095309.95-1-maxin.john@gehealthcare.com>
References: <20240731095309.95-1-maxin.john@gehealthcare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XPORl_T74CBkGsVp-aockjrI1eZ2ixqH
X-Proofpoint-ORIG-GUID: XPORl_T74CBkGsVp-aockjrI1eZ2ixqH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_07,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=774
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 09:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202696

From: Intaek Hwang <intaek.hwang@gehealthcare.com>

Set CVE_PRODUCT of libatomic-ops to match NVD entries.

Signed-off-by: Intaek Hwang <intaek.hwang@gehealthcare.com>
Signed-off-by: Maxin John <maxin.john@gehealthcare.com>
---
 meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb
index 824400e743..39d761abdd 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb
@@ -13,6 +13,8 @@ GITHUB_BASE_URI = "https://github.com/ivmai/libatomic_ops/releases"
 
 SRC_URI[sha256sum] = "d305207fe207f2b3fb5cb4c019da12b44ce3fcbc593dfd5080d867b1a2419b51"
 
+CVE_PRODUCT = "libatomic_ops"
+
 S = "${WORKDIR}/libatomic_ops-${PV}"
 
 ALLOW_EMPTY:${PN} = "1"
-- 
2.39.2


