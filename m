Return-Path: <maxin.john@gehealthcare.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55676C52D6F
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 09:53:27 +0000 (UTC)
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com [67.231.157.48])
 by mx.groups.io with SMTP id smtpd.web10.39081.1722419601857147849
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jul 2024 02:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gehealthcare.com header.s=outbound header.b=UYwVNoe/;
 spf=pass (domain: gehealthcare.com, ip: 67.231.157.48, mailfrom: maxin.john@gehealthcare.com)
Received: from pps.filterd (m0048205.ppops.net [127.0.0.1])
	by m0048205.ppops.net-00176a03. (8.18.1.2/8.18.1.2) with ESMTP id 46V8r2OK009309
	for <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 05:53:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	gehealthcare.com; h=content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=outbound; bh=r4Zk3JiaT8nm
	dMQDfjMwDsu7mBmuAcPPt7h3vqxwt3A=; b=UYwVNoe/GtxIjNwRT4C8XYkUKO1w
	0A90DXNJwUeyQ4W+C3oY7qAwJyQthbZGDpUPTj6ZQltn0UzHXE700HauMzc9tETC
	wYz1/WfNUyDlDjE4Q11Ws0BVtkZA0VxtyE05HON5LEEHvBL21zI/rbBkuIb2vgm3
	4wlSIswQn164eQkKccmNpjRqXFaPkCOZm/ak68oxAk4vQlsgUVyrCbYAuwEwoVPu
	cw80LDezdYcbCe8JM7hC+WYpyxe58BUTLAvBv9RFH3g3zPJgoWKGeVeaYpoI6dJc
	ZexooIOJbNzJvNMwmwE4yjcScG51IsnDGX01plTFg1h8vnTMGLLm3G9gaA==
From: Maxin John <maxin.john@gehealthcare.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] set CVE_PRODUCT to recipes
Date: Wed, 31 Jul 2024 12:53:02 +0300
Message-Id: <20240731095309.95-1-maxin.john@gehealthcare.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: agy71owEKePyp_ltXI_vcMsBaQKPwryJ
X-Proofpoint-GUID: agy71owEKePyp_ltXI_vcMsBaQKPwryJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_06,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 mlxlogscore=335
 priorityscore=1501 impostorscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 09:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202697

Add CVE_PRODUCT to recipes

Intaek Hwang (6):
  alsa-plugins: set CVE_PRODUCT
  mpfr: set CVE_PRODUCT
  libatomic-ops: set CVE_PRODUCT
  gstreamer1.0-plugins-bad: set CVE_PRODUCT
  python3-lxml: set CVE_PRODUCT
  python3-psutil: set CVE_PRODUCT

Jonas Munsin (1):
  bzip2: set CVE_PRODUCT

 meta/recipes-devtools/python/python3-lxml_5.2.2.bb              | 2 ++
 meta/recipes-devtools/python/python3-psutil_6.0.0.bb            | 2 ++
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb                      | 2 ++
 meta/recipes-multimedia/alsa/alsa-plugins_1.2.12.bb             | 1 +
 .../gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb                | 2 ++
 meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb       | 2 ++
 meta/recipes-support/mpfr/mpfr_4.2.1.bb                         | 2 ++
 7 files changed, 13 insertions(+)

-- 
2.39.2


