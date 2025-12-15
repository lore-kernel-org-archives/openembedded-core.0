Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C69D41D74
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 08:43:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43984.1765788229347843731
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 00:43:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OrR+Rtr/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4444066fb7=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BF69SgG3530180
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 08:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=KXa4RoFuhoqJs930FWQJXOSWCg04UhmAi5Fw1ASSxt0=; b=OrR+Rtr/4AXF
	xA3PFbeVyiQDQqrXZMRyn49Lsxw5jWgAX+MygPuZ4XmBNWFBW4bXYlBpfRWrH06W
	6Js2Dqv3zosNSEcaQ4a+pdolBm0a2DWggLy10cbIZrMWYNKRAUhG0Z6HCn7B2tL3
	ytXlm/s1abEf2UtvklS7lvp+AAfH/4i5hkcHwP402hRDH8t99+kEpK9iRkFDMqZl
	PZtL48e4IA1Xj2PKjMT7fsD6MFP7tcs3xDTimG+oF6dhUgR75/HUqsCgcQgSfMga
	ZH3hWXeW17FyA7h3ja/J+OOCUvY6+LAIoaCcOcrLuTe47QpYlPJjsX+UCsKGFSXW
	POWHYHiM5w==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b0wc0hnmx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 08:43:48 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 15 Dec 2025 00:43:47 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 15 Dec 2025 00:43:46 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] socat: 1.8.0.3 -> 1.8.1.0
Date: Mon, 15 Dec 2025 16:43:45 +0800
Message-ID: <20251215084345.1797393-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215084345.1797393-1-hongxu.jia@windriver.com>
References: <20251215084345.1797393-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MiBTYWx0ZWRfX+GKHdfsfup/t
 FufIjgHGwSKa6HdTy2vdfpt5DtW6x1S98NW+vDCgZ2b9wHxddWUSQyERvfbNUaqpSgSi38gybNl
 wpZ0pk0ywFZJ8X8wZPrQ7Dp0Qa6WSL/TgxOTRdht2WdcoUrYsFWVrEvChTD7zaHd3E/wtPYeeiO
 wrEdMU1LuY9UCWs4etfNp9Tz2QBChklK1sbA6xFHUnslPPrQWmZXLAXh/oBM3g692ZfvOpZpHoy
 fZDc4nny8xtqR+fhAmDi5h+aFZJL+nkMkkkr2/DW+axjsd5Sdd+XjHp+157GqIk/xAxw5yCPG5u
 ct1sGJAKhx+unTNNe9IIa9TeyEZgD9ItvmQF7/wqdcejch29QdRaHq1BxzxLn4EDvyuLwS+zQAZ
 4nTAir1v4iXFBEl+fkRA1/yhC36eTw==
X-Proofpoint-GUID: q2AkV4jDRQOh3Avu3ViFXj1wDvwA5_Fh
X-Proofpoint-ORIG-GUID: q2AkV4jDRQOh3Avu3ViFXj1wDvwA5_Fh
X-Authority-Analysis: v=2.4 cv=B/60EetM c=1 sm=1 tr=0 ts=693fca44 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=rFFRleaeAAAA:8 a=t7CeM3EgAAAA:8
 a=NueaCR-sV5yAVaOkMQUA:9 a=YLtI_f64H5IAZ6mI3Lwl:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 08:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227701

License-Update: No change, update README to add new lines

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../socat/{socat_1.8.0.3.bb => socat_1.8.1.0.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/socat/{socat_1.8.0.3.bb => socat_1.8.1.0.bb} (91%)

diff --git a/meta/recipes-connectivity/socat/socat_1.8.0.3.bb b/meta/recipes-connectivity/socat/socat_1.8.1.0.bb
similarity index 91%
rename from meta/recipes-connectivity/socat/socat_1.8.0.3.bb
rename to meta/recipes-connectivity/socat/socat_1.8.1.0.bb
index b5f5d72f9c..d9daa0635e 100644
--- a/meta/recipes-connectivity/socat/socat_1.8.0.3.bb
+++ b/meta/recipes-connectivity/socat/socat_1.8.1.0.bb
@@ -7,13 +7,13 @@ SECTION = "console/network"
 
 LICENSE = "GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://README;beginline=248;endline=278;md5=338c05eadd013872abb1d6e198e10a3f"
+                    file://README;beginline=252;endline=282;md5=338c05eadd013872abb1d6e198e10a3f"
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://0001-fix-compile-procan.c-failed.patch \
 "
 
-SRC_URI[sha256sum] = "01eb017361d95bb3a6941e840b59e4463a3fabf92df4154ed02b16a2ed6a0095"
+SRC_URI[sha256sum] = "91f222ee65559036600c2505b999acebed48b899f0e2e53ae1c9c31d6986b6a4"
 
 inherit autotools
 
-- 
2.34.1


