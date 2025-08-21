Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840BBCA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 16:06:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.330.1755792368443590198
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 09:06:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=R+NfHrLt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0328589c10=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57L8kxBn2238132
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 16:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=jcXUhhPeTVPocSsCwK6TvjWr+mmoEP7R1TPh37/WZ8o=; b=R+NfHrLtf5ut
	3OiUdyNoQ6GwK1RK2nTyGhzN44iCGZZmVKeLeMA6hm5fA8Cl1MhW35MvE7G86ifE
	p+eCieAIuoZOx0jkpQhL5uE2tqATPCwuKCRRWTFdNpqesyYaGWuEEu0otp9INXtr
	NXduQiCOYGVcSB88GbphGChpzCYlcNSTypb69JE0XGKu2IQeoxYboTwovM7NEnGn
	A3GufnJyOOpe5dWswVcXfhwhLa6oteOezO1bJyrWGprw9puaSbv+4YDZJp94TlCF
	ZxHPa6rI9wEBiVYPL/xqtrcGt2Kn1SnrSqef498ocqEauSzPyghcrU5ODI2Hv6Fd
	CbwRM9ZsLA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48nekjsn88-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 16:06:07 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 21 Aug 2025 09:04:26 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 21 Aug 2025 09:04:25 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][walnascar][PATCH 04/10] gstreamer1.0-plugins-base: upgrade 1.24.12 -> 1.24.13
Date: Thu, 21 Aug 2025 21:34:12 +0530
Message-ID: <20250821160418.495625-4-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250821160418.495625-1-archana.polampalli@windriver.com>
References: <20250821160418.495625-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDEzMiBTYWx0ZWRfX//dk7Zwz+xPj
 Hmucx3+KG84dKRMGoZU/7yc4NuQltHnwj7BVVw73UKQQeN1QjO5oH7xpAKq7bjP7MMabxO1RlUc
 CKx3zXa7fn3/qeW2bapaFc10Uj0A7xl1cgGEm4YbbbclD1nZSKgpkPyeeCYoN0hbvfjBvSD8sQh
 0+1cEFHZUCBmqdegv33hlPoKoI0vT2CKUn/hHweMVDP52L4GJ69XJhR+CHt1dAoWfACWdqG00nu
 6tjKhjAzK8I2yL6UHBEKrJq7pKNrppXwmjy94+Cs0jmk1Uj/85cbuNa664E6yiQJyBB/VpPKAAE
 86QIAd5YBJDSWTPo7STeXHkS3EQa5oitwa92bt/LNk8wq5VtquLVBpim3OlJbZBqN+320vtfpGn
 vy42/bX0szSUR7UOzIAEXPF6wM1dfw==
X-Proofpoint-ORIG-GUID: fhNxjoL0sP6SHSBiAoEHWS4zoui-b0Lg
X-Proofpoint-GUID: fhNxjoL0sP6SHSBiAoEHWS4zoui-b0Lg
X-Authority-Analysis: v=2.4 cv=L5pEg+T8 c=1 sm=1 tr=0 ts=68a743ef cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=Atcp94eI31gPip-Y75IA:9
 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2508110000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 16:06:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222266

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 ...ins-base_1.24.12.bb => gstreamer1.0-plugins-base_1.24.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.24.12.bb => gstreamer1.0-plugins-base_1.24.13.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.13.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.13.bb
index f4505d831e..ee722056af 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.13.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "f6efbaa8fea8d00bc380bccca76a530527b1f083e8523eafb3e9b1e18bc653d3"
+SRC_URI[sha256sum] = "31a4a34e02df0471274fd0e8016495475b670320d20a3349faf0634340166c42"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.40.0


