Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577EBCCD18C
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 06:58:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9185.1760425126958135367
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 23:58:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Oojc+ARM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2382c2f518=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59E5k8u52065923
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 23:58:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=JF3WM7Lj3wcNIlbIwoa1jOiabsiFez0SGiJ0eznDYOU=; b=Oojc+ARMvwtv
	uND/hbLuB0qlu7fQpNY8JZbbgDTWTYj8TS85ydNWcvkc16EmEEE0OypD8UUuvk4c
	6XCrETuWwkh5numKjFFOVes3BKGK/aMuEDkHcmaOrNgVfjtEliOZPiguoWhCKLTn
	vjUdNvKjRKN1xcXG1V7KwoPZq3hh45EQEA5FaBSOuMd+Pwxatf+g+SlLnbf823iK
	fUO9RZUXNY6GMne4OZQ9b23cDtkMfs2ITXRdn7wB7SHvJ4yiForOJjAep6Ndimen
	NexqL8I0UaTnFOhu+IyM2wcYMtYQj5k+Xsz1qkg1z6hOmXTG481it664ESGngy9+
	ykQWTZCHpw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qprdtf1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 23:58:46 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Mon, 13 Oct 2025 23:58:45 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Mon, 13 Oct 2025 23:58:45 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/3] libxml2: upgrade 2.14.6 -> 2.15.0
Date: Tue, 14 Oct 2025 14:58:42 +0800
Message-ID: <20251014065842.2919308-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251014065842.2919308-1-hongxu.jia@windriver.com>
References: <20251014065842.2919308-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDA1MyBTYWx0ZWRfX/79rAII8y9YN
 qGLmWkTvFpx383X0nN3SzD17ADuf13HW53avoYdM0b8rTDE6tEVWVYQA2iu7sCRd64UFGXmPsKC
 OlgBcbXD79VQBnJEZ2ehPdDaPfaXstU8eUa5w8nSZzEn4TL4EWCpj1GrN3rzIDxoXlKhdh76Ldp
 52vENvclHzPNa3B9VyU7cjognEsplScKxMeJmYV08WFax3eAbQbKTA2GmUq1/zfUz47NP9/BbWn
 QS4Fk0lrymYb7ou4B4Alukmq801XZuOsAuEpkUSxeJbMVpGM08Xuzn7XxsKUptoOf4Rt0QAvJRh
 shi/qGghZr7zMo25mNQapWeLHSmuxwZEk1y6Emt0EEIUKOgO41no2lor4FjanzM0oWgOyy6Y4zy
 WomAVuK29xTujLVpL7gRaTGcbD4NCw==
X-Proofpoint-GUID: k-CJOmbgungzd1QAMGTDr-tldtrpP161
X-Authority-Analysis: v=2.4 cv=JaKxbEKV c=1 sm=1 tr=0 ts=68edf4a6 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=GHR8O2WEAAAA:20
 a=SSmOFEACAAAA:8 a=t7CeM3EgAAAA:8 a=gnsHP6tfyjpMGVmyUOsA:9 a=m9p5bXcFLgAA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=CTwFTDRtctY-zZ8oRDn3:22 a=yULaImgL6KKpOYXvFmjq:22
 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
X-Proofpoint-ORIG-GUID: k-CJOmbgungzd1QAMGTDr-tldtrpP161
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510140053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 06:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224810

Due to upstream [Remove LZMA support][1], drop option --without-lzma

[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/1763281cd65ded4067ddf123eb7358690c214b0b

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libxml/{libxml2_2.14.6.bb => libxml2_2.15.0.bb}    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.14.6.bb => libxml2_2.15.0.bb} (95%)

diff --git a/meta/recipes-core/libxml/libxml2_2.14.6.bb b/meta/recipes-core/libxml/libxml2_2.15.0.bb
similarity index 95%
rename from meta/recipes-core/libxml/libxml2_2.14.6.bb
rename to meta/recipes-core/libxml/libxml2_2.15.0.bb
index 6ed8760f4c..8ff5320c47 100644
--- a/meta/recipes-core/libxml/libxml2_2.14.6.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.0.bb
@@ -21,7 +21,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2025-6021.patch \
            "
 
-SRC_URI[archive.sha256sum] = "7ce458a0affeb83f0b55f1f4f9e0e55735dbfc1a9de124ee86fb4a66b597203a"
+SRC_URI[archive.sha256sum] = "5abc766497c5b1d6d99231f662e30c99402a90d03b06c67b62d6c1179dedd561"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 CVE_STATUS[CVE-2025-6170] = "fixed-version: fixed in version 2.14.5"
@@ -49,10 +49,10 @@ RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-gconv-ebcdic-us \
                                          "
 
 # WARNING: zlib is required for RPM use
-EXTRA_OECONF = "--without-debug --without-legacy --with-catalog --with-c14n --without-lzma"
-EXTRA_OECONF:class-native = "--without-legacy --with-c14n --without-lzma --with-zlib"
-EXTRA_OECONF:class-nativesdk = "--without-legacy --with-c14n --without-lzma --with-zlib"
-EXTRA_OECONF:linuxstdbase = "--with-debug --with-legacy --with-c14n --without-lzma --with-zlib"
+EXTRA_OECONF = "--without-debug --without-legacy --with-catalog --with-c14n"
+EXTRA_OECONF:class-native = "--without-legacy --with-c14n --with-zlib"
+EXTRA_OECONF:class-nativesdk = "--without-legacy --with-c14n --with-zlib"
+EXTRA_OECONF:linuxstdbase = "--with-debug --with-legacy --with-c14n --with-zlib"
 
 python populate_packages:prepend () {
     # autonamer would call this libxml2-2, but we don't want that
-- 
2.34.1


