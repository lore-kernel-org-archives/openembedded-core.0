Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A72E67A7C
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 06:56:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12735.1772521012346915935
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 22:56:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=muBwtsN1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75229269e5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6233YZkK3807920
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Mar 2026 22:56:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=94dmXckgFYDKNGUUHAgNbBwi+39V8trsqb7a5LUE4X8=; b=muBwtsN1YMEJ
	GJw46gNNBt7IBD7u6bunvBUde9HZhanIqNK0GvZbChJ5Qcv8SzFYuxD+uC9LmG8w
	QbYjSDAaSoR4EpmNMBIWPLWfAzDUB3RgGi3tXluDgXQkZEeexy5E6YrVHvk6kp+M
	7sRR5GWtnWXcPh0a3dZvOhwMVjJ/Zm+YgQayMqgH50rIeXTXNUFrW25qw0DVaqya
	SKTcIGcAVuihVegYQbWkUA0/n6FF7UBaWeB6MLsSi/Ckl4WmOgjgIrWO8x0M4/k0
	PI/R8+Mkb6UekqdC1Y24c/YhZyldZoff+jFK3fFJImWKrMaI0SnTSbhyDx4Auhr3
	zTF3QC9JPA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cm0rgju8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 22:56:51 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 2 Mar 2026 22:56:51 -0800
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (10.11.232.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 2 Mar 2026 22:56:50 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 10/19] python3-markdown: upgrade 3.10.1 -> 3.10.2
Date: Tue, 3 Mar 2026 14:56:31 +0800
Message-ID: <20260303065640.2541884-10-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303065640.2541884-1-hongxu.jia@windriver.com>
References: <20260303065640.2541884-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Py7cLrgy11b7Jzz63HOXJTSDgqz2Zws8
X-Authority-Analysis: v=2.4 cv=Of+VzxTY c=1 sm=1 tr=0 ts=69a68633 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=gxeRpamcAAAA:20 a=t7CeM3EgAAAA:8
 a=rgKrbnolna9BbNwK4ZwA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: Py7cLrgy11b7Jzz63HOXJTSDgqz2Zws8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA0NyBTYWx0ZWRfX2b3H/e0apYM9
 eMp9t+D8TT6PZ6IoEbrTmdArE6gZnvxqjWMNTsApMxEVgwpIuRbgKJeziGRDoooQa7WOlKqu6t4
 +Prx24ne0JJCuJRkMXs/XOTfP+nBywR0lV89lcmA1StUqkayBfIvOwI2wFHLGS4F0d2m+PRGEZI
 9bQHFcYopkSqRZ9R7CqLYcJzwgwSGmUyMXl6Z19RozQgWjIPY0EXXNgv/kWpBjBMkqebL5Zktq0
 Zq5hRi6vXVpq6ssEw19bGHW2AtDBbcpn9DDJ0tP5GsFH4sGJi/KTT/nw9h711j9dNHoyXlnvuLZ
 VsdEnDtOnhqjbbexC7VOa6IxJlNf/HPzWqm5Svk13bCjPPsie/1chZR+IGhKMquHQST/lFWmITF
 Z12mz0aHJyyoy7LuHLPRA3WlZ2sP17P0xfcWCAW5V4uH+yhTO3oeWJGlHDQg8hTsGQTCyPUwsaN
 WSX5r6+gb75TmbMFMVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 06:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232248

Release note [1]:

Fixed
- Fix a regression related to comment handling (#1590).
- More reliable fix for </ (#1593).

[1] https://github.com/Python-Markdown/markdown/releases/tag/3.10.2

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../{python3-markdown_3.10.1.bb => python3-markdown_3.10.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.10.1.bb => python3-markdown_3.10.2.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.10.1.bb b/meta/recipes-devtools/python/python3-markdown_3.10.2.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-markdown_3.10.1.bb
rename to meta/recipes-devtools/python/python3-markdown_3.10.2.bb
index 91dac7abd1..6a35e0def8 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.10.1.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.10.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ec58cdf7cfed06a21f7a9362627a5480"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "1c19c10bd5c14ac948c53d0d762a04e2fa35a6d58a6b7b1e6bfcbe6fefc0001a"
+SRC_URI[sha256sum] = "994d51325d25ad8aa7ce4ebaec003febcce822c3f8c911e3b17c52f7f589f950"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


