Received: from EUR06-DB8-obe.outbound.protection.outlook.com (EUR06-DB8-obe.outbound.protection.outlook.com [40.92.51.32])
 by mx.groups.io with SMTP id smtpd.web12.457.1619110141713153502
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 09:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=vEQBXfYx;
 spf=pass (domain: outlook.com, ip: 40.92.51.32, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsgnXW+vSQDO3OlaG/G6SXjWpvUfArHtfzy1oTz8s54XnOmZhIIkw2ocji9ldwjJrYd5c+D/3srz8t/hBU2GuEcAUsJpfjCoEb5R9CVRTfcmxFkVw5VO9dMJzxb0etvjADFN/LofHK1tJ3SWLJu92jZUfyfGE+nwj8fEC2WjQINOIteQG84TWsjyu8+Tffouu6UduARrAYGddVB26OrCqncqEX3/SoFLxCzrXmV1u9Gy2myiN2cHtQ91WxtNHiJmhT3k8aR1B4IipoijCnuEGXXuigpmyh54s+kONCEeZyQcCcLOrTDKHnmyqU44SWvCGlAoa1WmQPX8oQ2iqeFYIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZrbWgIWgzSMxiHETT7XCkecJMebwki/TCdMlGe80jk=;
 b=k9MkGPYf17AhNOy3EnTmZf6jBWneYNL/I0Iy1AfjjySa+Ch5mFOdTAcITbB/ofbKSYQcj3m1hkdsYYIbJpltxYoj8FCxH8VcjuFDvnR5EIO/RfDHj+xRIiFL1kYgAHg01jPLJ8VyvCQ0HnK3EsCBqdJOh6UEiSsuPz2L+S8Pl1tKeILfVK929XIU3qS9Rjp8T/YgqzmOjNnRz0nWY2zE0CcrcvCAA8kzW+3QDloZncXhM9vcUMKLBn4Xv5ycGHsY6oJ+ENUJo1xu6/YNVSg7WTPykwlcZ0cY2Q0KChiKLaYM8RqXkKwQrMc3DNquMwUdGvjRDiGnrBU6JQ8o1BpWKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZrbWgIWgzSMxiHETT7XCkecJMebwki/TCdMlGe80jk=;
 b=vEQBXfYxdCmp8jJTWjBskA2l6tIvc9os6XWqlsWhmMnGf1t85y0yBk4zjvCuJXRhQ7cwhi02Z4lcYrrdmhqA8SHq8HpVOP5bjc/cCTfrIllrQg4clHHyd4fUEFBKYeEMQfrsnOlYkB5BgEk7lfFIfXrNMLUz6wVFu35s91hFHv7rbNzJG3htrkhjWkZ+So12IbfDsS2dkB0/yVHRgYdlNIwihVdvhZ30xINaSNZagPIKurhhsJNoCQoGIRY5aEPiqM+CcGMzZLSvEmr+sf9raS5V1mp4cXN+fPMCdmfv33VZAeAmMYUNVcMvpyL8xaK6QOxq9IlOadETLEOMICzEHA==
Received: from AM7EUR06FT058.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc36::53) by
 AM7EUR06HT115.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc36::206)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 16:48:59 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:fc36::46) by AM7EUR06FT058.mail.protection.outlook.com
 (2a01:111:e400:fc36::161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend
 Transport; Thu, 22 Apr 2021 16:48:59 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:393F0A358D09FA16A93F14BC075A705D32BF02E23700145D5980B5DD19F8696E;UpperCasedChecksum:FAA46F43096B18FADEF07879D83A379C8E1DF2034649AC8ABE6DE31821959293;SizeAsReceived:7316;Count:45
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::a49a:d6ef:d598:e471]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::a49a:d6ef:d598:e471%7]) with mapi id 15.20.4065.021; Thu, 22 Apr 2021
 16:48:59 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][PATCH v2] cve-update-db-native: skip on empty cpe23Uri
Date: Thu, 22 Apr 2021 18:48:27 +0200
Message-ID: <AM9PR09MB464219591A09F7157448D429A8469@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
X-TMN: [3gJr0JffMtT3/IqsRYujS1LZ9o/lR796]
X-ClientProxiedBy: AM5PR0202CA0005.eurprd02.prod.outlook.com
 (2603:10a6:203:69::15) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20210422164827.768764-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.141.90.56) by AM5PR0202CA0005.eurprd02.prod.outlook.com (2603:10a6:203:69::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22 via Frontend Transport; Thu, 22 Apr 2021 16:48:59 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: bc91b28c-1ef1-4c0b-c93e-08d905ae86e5
X-MS-Exchange-SLBlob-MailProps: 
	mBRmoEB1kyIBHUdHYY2XMN28iyJFVzCNIO++VsceLtNsob3aH+JC82oPhmLfFYnIfy3T9bK/AhI7utEaLjtDpXLvQotBEWTvNm0A3qI8Zm7iL4voH8fPD1IlUkZEkT9T8Mg0uYYrsezYWVrZEp/Ihvzl4rj7+fzjKFTHcKEsk2YJeT/KZM3utUz0Tw1JQWirUAVpsru0Og5YPFBS1doeLV523g5y6bZOM2LzsMUGXcsb2u6R4PaF4YBSGdoMf4kDCV22t4FxikJU97X8dXOTIviXVl71G9/eEsAM8Au+eVuRHq8UJNaql/n9oTjM29Wx2wJpCEdmstnJ2xQKXbmWr0G9ZoxJiqD+W67/5g2AD7ZtQ7V4FKS5A1h/ki8ucTzvraP1ScovXUsPKfLL0QMlZl2bYFMiQ9haEYI7J0m7VGHaSfhm8Mth2HehCP38cJqDDabkjzJJVFon9dTxRbu+3KVvNko8ppvJwFJzP6OP1dxF6cqWjlma1q2aGRyMO//xZ6jKVqz5vAAePyG3x8xZHa7mRleiZsDzUfQpozOAnXXeUrWzCaI5nTAe61qWwN3kPGx91AC6vD8MxOqSzgD/K7enEwldjP6PHNe+zHYNEfmBvw4/rtGHUtX81V2csljhccqOvrP/zW3pfq56Ktmgxfn2o0HfyViecs9zdAi9TXOA6SIcccP1ueIrGjiusBJ6d7bi97Ws19icQMOoAQkd07lOcuL8nXtG6R8cogcsPlejxi6E0y/fmFGbYyv0i9+VZcJAff5Hi34=
X-MS-TrafficTypeDiagnostic: AM7EUR06HT115:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Dk0uI2yG6oyzIJEpbaCTjWj9ephQedncc58pCdVN5qxSBLcuQXUOoT/f35LsvUMg41z7XwaCOuKBtGQVJ8XE/nPqz/mleO+ofqKDpl2oqlt3pXDiD4qWBcvzO+l7LaP+gNI30OWUKdskvCd0PZOIvVenYat0oobCVc/lYTmV9cULPZN5zhTRtq99cPucUmbB11xfUgLwl7FKC2hSOsK/bJ4zcEnscN8cS/m5/YL5OLSHcVULgIPwl0D3V88kBAl7ZjdtKcpqfkG+oZSU4rGFZsPs+jgCc8AZrfs29addJDMFm4HTImDahdEGSEeUxbZ169xyx41RFpqOnqvcrVJkjBL2ALHofAr4eGJDK7MHQSj/bR3nqEmH2akMnRLGSuM34fV30AeaRGirFWsBDfcmWw==
X-MS-Exchange-AntiSpam-MessageData: 
	vTOfHC4eCDXcTjHRzNf8X2ArIOZd6UzJKphOFP9lrZE4o+McpbnEZYXXDpzQ+tI9XUOrQpDIU++2xra1rjX7e8E48Cq1FPQCjwsbnuq6H0M2Npu0mWHXk+g5g7sMN7vFULGsqMd9MY7wgpEuiN+lDg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc91b28c-1ef1-4c0b-c93e-08d905ae86e5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 16:48:59.8655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR06FT058.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7EUR06HT115
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Recently an entry in the NVD DB appeared that looks like that
{'vulnerable': True, 'cpe_name': []}.
As besides all the vulnerable flag no data is present we would get
a KeyError exception on acccess.
Use get method on dictionary and return if no meta data is present
Also quit if the length of the array after splitting is less than 6

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
v2: handle the case where key is set but value is none and
    if resulting array is shorter than expected

 meta/recipes-core/meta/cve-update-db-native.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-=
core/meta/cve-update-db-native.bb
index 25ec6bac71..e5822cee58 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -139,7 +139,12 @@ def parse_node_and_insert(c, node, cveId):
         for cpe in node.get('cpe_match', ()):
             if not cpe['vulnerable']:
                 return
-            cpe23 =3D cpe['cpe23Uri'].split(':')
+            cpe23 =3D cpe.get('cpe23Uri')
+            if not cpe23:
+                return
+            cpe23 =3D cpe23.split(':')
+            if len(cpe23) < 6:
+                return
             vendor =3D cpe23[3]
             product =3D cpe23[4]
             version =3D cpe23[5]
--=20
2.25.1

