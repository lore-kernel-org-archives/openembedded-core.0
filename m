Return-Path: <chaitanya.vadrevu@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86336C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 17:00:57 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web08.13166.1639674056709928797
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 09:00:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=5BhTCkl5;
 spf=pass (domain: ni.com, ip: 148.163.156.75,
 mailfrom: prvs=798487a089=chaitanya.vadrevu@ni.com)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BGFDS6x023555
	for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 11:00:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=PPS11062020;
 bh=Q13nlN8XiuG5tiCnftI/05CQ1U9AkWE+yQVtNsQSLY8=;
 b=5BhTCkl5Uba0tDT4DDO380S5KMs8H5Mp0il7qTHBnwTFqCAiOWu/HGdNmdjnYqhwUDDZ
 R+aNpA2sQ3o4Fv9Crd11Cb/CJYGJbYQ2ZpqUKeZQPqqueO7IBSO0q0RT9dPcy8fz5+Ix
 Uh5AuBzyDFjwWpAqAE1SwmnVS8j5ySYPznnZ4dpNmUuqiDew/rRPBAWBMvdB2uoj8508
 WnMG0NJi0WMaSkdw4IGRmM7Xciem7JSo+LUyNcrqAUs45g1hx7yAfR/FQ6Umd4Pnoa/s
 iwyjAjW2JNsenDrDQoyt1q5uS6ZknImt9n5JwIT4USUL7MWO8S9QUi/rljfzXMz0YPi/ Mw==
Received: from ni.com ([130.164.80.23])
	by mx0a-00010702.pphosted.com (PPS) with ESMTPS id 3cyjrh2pbv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 11:00:55 -0600
Received: from us-aus-exch1.ni.corp.natinst.com
 (us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod2.natinst.com (8.16.1.2/8.16.1.2) with ESMTPS id
 1BGH0snu000642
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 11:00:55 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
 us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Thu, 16 Dec 2021 11:00:54 -0600
Received: from cvadrevu-linux.amer.corp.natinst.com (172.18.68.32) by
 us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP Server
 id 15.0.1497.26 via Frontend Transport; Thu, 16 Dec 2021 11:00:54 -0600
From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Subject: [PATCH] python3-pyelftools: Depend on debugger, pprint
Date: Thu, 16 Dec 2021 11:00:22 -0600
Message-ID: <20211216170022.22028-1-chaitanya.vadrevu@ni.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: CjKNSXrKZLb0B4O9vVUv-b702-IpXfyo
X-Proofpoint-GUID: CjKNSXrKZLb0B4O9vVUv-b702-IpXfyo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_05,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Reason: orgsafe
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 17:00:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159796

python3-pyelftools uses python3-debugger, python3-pprint.
So add dependencies on these packages.

Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
---
 meta/recipes-devtools/python/python3-pyelftools_0.27.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.27.bb b/meta/recipes-devtools/python/python3-pyelftools_0.27.bb
index 0cfd99504b..f8b9d420a5 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.27.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.27.bb
@@ -11,3 +11,5 @@ PYPI_PACKAGE = "pyelftools"
 inherit pypi setuptools3
 
 BBCLASSEXTEND = "native"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-debugger ${PYTHON_PN}-pprint"
-- 
2.17.1


