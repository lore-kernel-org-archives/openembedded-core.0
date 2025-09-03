Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 471DDCA100C
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 04:16:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4518.1756873010043408671
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 21:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qWbZpMcf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1341cf759b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5834Adak3601874
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Sep 2025 04:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=QX8aNoMGINfLvAThWHj8T8XDKTE5hNH/5waXWfV3FxA=; b=qWbZpMcfuMNy
	6feI1l8iIUHO3tPAri6thAeFyGAH7WYhwOZApvvIo22WkjbIRytT92o9W9adm2/d
	sypU7uy/fqsfLYB7jn56WTq3ASWqYHpLHz2fJWWLSTzhVNw2UVyw7NKMiB/jaDpM
	mfyYSBl/pgEb3RnH3hxyqDIJNTImSVhTyqK0gAFUz3Zc8vCI0qY9rgSmRuxKRtE/
	UV2eV6QU7NUPU0QdANbr8iqe/Oep7ZSHWLKWJBva7MIOUFMqA61uIqRaCgtJxkyk
	NzB988hKzwJI7ezB4r9ueEnKTtfqb5X0EqCVIFb4nfgZ7kOINmP3nie6k7aQDKgi
	nQLc/IlzAg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48upgykm28-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 04:16:49 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 2 Sep 2025 21:17:04 -0700
Received: from ala-lpggp7.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 2 Sep 2025 21:17:05 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] git: 2.50.1 -> 2.51.0
Date: Tue, 2 Sep 2025 21:16:57 -0700
Message-ID: <24b963c7e77e01dba0eaf33cd5744f91fcccda2f.1756872991.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1756872991.git.liezhi.yang@windriver.com>
References: <cover.1756872991.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDAzOCBTYWx0ZWRfX1Se2+IbndGhe
 J50ZmM31FahHcH+iBgAw8IW2yXDp7t1RhBQXsekXKazmT+8VwCVCTX7hSmXOhOqOvcJnTrnGc+W
 8hqtgtQsPBg8lNzUhlgOgnfymi96qwUGPeC1rwXn0lXWhlEoSPoyubCgPh7B2lCl2Hsa6f0DhTr
 +HrHRjhUkKoCvS9T+IDJSPBZyz5OLtm/iOfnTfFSxLExDggo2dpM410kjbP5s5MFvs8u2gYfLfl
 sliFaYO4fxBj5LUlNfMOECILX1O32BX6YkvxEHl6+GmeqDWRFwBS3YdZ4X1d1kH/+kdMKZyXsnt
 0ORtn+lN8+8uQRbpTw9mfVb7lSye4LkjDlAsrUBXTxSUK5pBhnqOA7mqgtVGk4=
X-Authority-Analysis: v=2.4 cv=eubfzppX c=1 sm=1 tr=0 ts=68b7c131 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=kP8cXfqgbZGvQaP_GYIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: wwO1L3kOl5LQdGpUtIeK5H4Xykc3GoUf
X-Proofpoint-ORIG-GUID: wwO1L3kOl5LQdGpUtIeK5H4Xykc3GoUf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 04:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222842

From: Robert Yang <liezhi.yang@windriver.com>

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/git/{git_2.50.1.bb => git_2.51.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.50.1.bb => git_2.51.0.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.50.1.bb b/meta/recipes-devtools/git/git_2.51.0.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.50.1.bb
rename to meta/recipes-devtools/git/git_2.51.0.bb
index 36401c58f1..aeb8c54aa0 100644
--- a/meta/recipes-devtools/git/git_2.50.1.bb
+++ b/meta/recipes-devtools/git/git_2.51.0.bb
@@ -170,4 +170,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "522d1635f8b62b484b0ce24993818aad3cab8e11ebb57e196bda38a3140ea915"
+SRC_URI[tarball.sha256sum] = "3d531799d2cf2cac8e294ec6e3229e07bfca60dc6c783fe69e7712738bef7283"
-- 
2.49.0


