Return-Path: <maxin.john@gehealthcare.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A171C52D54
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 09:53:27 +0000 (UTC)
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com [67.231.157.48])
 by mx.groups.io with SMTP id smtpd.web11.39372.1722419602337588870
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jul 2024 02:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gehealthcare.com header.s=outbound header.b=WtFFvMxB;
 spf=pass (domain: gehealthcare.com, ip: 67.231.157.48, mailfrom: maxin.john@gehealthcare.com)
Received: from pps.filterd (m0048205.ppops.net [127.0.0.1])
	by m0048205.ppops.net-00176a03. (8.18.1.2/8.18.1.2) with ESMTP id 46V8r2OL009309
	for <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 05:53:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	gehealthcare.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	outbound; bh=Nl4JUKsOn45uU3O9CZqIPM3k+JyrRP1s3CO0yoJU7A0=; b=WtF
	FvMxB2H0aRVUuLolZ8SPYcJ2t5vL6o04clK1IVxt9zhClDX+boN6czcojQqlMrz2
	gWEK2iAq7j8LhtKk4wf2eKSXZrE5K9cKD0/lGNxCpxwI5HlOBjM/RD7LzP2uk2Ri
	YrB56iua9WmyDLeQ4EoKb+/KUZ0ST2h5ywhIZy4wb0rBSby6KKNaYnjiN5Zr7TqF
	cQ7ptQVyUcu57D55kw+Et3Wx+WYuNMk0ohkPF8yudEbqpydX5VtcqUMun21zQ0/l
	qlMIaetxfcvp/ZGQ3l+mRSGFdFFtvnnmhvPBlhYVroyewdxOc0H3vEpw5THHkQno
	rlK36TxlpUc3U0tZK7Q==
From: Maxin John <maxin.john@gehealthcare.com>
To: openembedded-core@lists.openembedded.org
Cc: Intaek Hwang <intaek.hwang@gehealthcare.com>
Subject: [PATCH 2/7] mpfr: set CVE_PRODUCT
Date: Wed, 31 Jul 2024 12:53:04 +0300
Message-Id: <20240731095309.95-3-maxin.john@gehealthcare.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240731095309.95-1-maxin.john@gehealthcare.com>
References: <20240731095309.95-1-maxin.john@gehealthcare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3VYM_r_yAFQjS44dVG2jvRVGBXC9krHR
X-Proofpoint-GUID: 3VYM_r_yAFQjS44dVG2jvRVGBXC9krHR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_06,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 mlxlogscore=741
 priorityscore=1501 impostorscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 09:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202699

From: Intaek Hwang <intaek.hwang@gehealthcare.com>

Set CVE_PRODUCT of mpfr as gnu_mpfr to match NVD entries.

Signed-off-by: Intaek Hwang <intaek.hwang@gehealthcare.com>
Signed-off-by: Maxin John <maxin.john@gehealthcare.com>
---
 meta/recipes-support/mpfr/mpfr_4.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/mpfr/mpfr_4.2.1.bb b/meta/recipes-support/mpfr/mpfr_4.2.1.bb
index a2067e1036..9558eab828 100644
--- a/meta/recipes-support/mpfr/mpfr_4.2.1.bb
+++ b/meta/recipes-support/mpfr/mpfr_4.2.1.bb
@@ -9,6 +9,8 @@ inherit autotools texinfo
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     file://COPYING.LESSER;md5=3000208d539ec061b899bce1d9ce9404 \
                     "
+CVE_PRODUCT = "gnu_mpfr"
+
 DEPENDS = "gmp autoconf-archive-native"
 
 SRC_URI = "https://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz"
-- 
2.39.2


