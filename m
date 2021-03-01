Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.55])
 by mx.groups.io with SMTP id smtpd.web09.8613.1614574307169354039
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 20:51:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=muF1btzR;
 spf=pass (domain: kpit.com, ip: 40.107.138.55, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLEG/WDthaYiNegSlJu2i96r/qUbpZgdYjfU8RI0whTePwNlhSlG3zeFmhoRgOgyPXMlxKyTlEo3BBubmJHIlIz1/ZkBEyZ1rL5Y6b9Zbg6xLEMBfW091wzuDd6rNZwYldFbb6e4YErD2hyNihU6HyyOiGLT1A3iSKqZ3bP7QRR8PM7vMbGmTxW0AsEUu5212b0n+Zs09+u18nfJvxapkpjETvQ26uoLPlR1oFzaCxB1P/l+2nE/PxFRhkNQeX7BRCj5cqi3iWZaObrGXl5qdvCieVkp/N3np/LhErfkDBzKFEbtYNGOAo1ONatMUTIJFe5uPHp5OA0KqfBjDQBtRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cjwtli1ZZ7Lzwrfd5sZsSWVAZMbIBZCfCF1Ar8vLD20=;
 b=SPudHYBc6+PElN3ypUnO7SGX/BExFtMuw8gcKkjY8jEWEISBeNNlzQZIcTZfM+V1LeSIhej/XXhLLxI5cEjk4NUHGQuIKFZH8CgYXQvL2u4bmX74y1dzMDUEHLIm8ow1CepNOCWxD+C1MVV2LKFqGlt5JR+6Z/sIHEoVXwpsOZe1Viz8W4OKpOLqwCLGvsqwFZsM7utUxG6wX99/e3gL707wt1HBt9TZ11atodpwR6mBjHxV8xwRmY8t71WhKN0/knXPPHzAaLWx5VnMxJMObbuEIaZXCnJmADxD5ZnozLCoSNZaUjUGWJV69L5Bm1I0H+aWLwxSniy1v0dCCKbTVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cjwtli1ZZ7Lzwrfd5sZsSWVAZMbIBZCfCF1Ar8vLD20=;
 b=muF1btzR7slNd6YpAczNEvq/he4rhYXyJ+ZpE+HQxn2+UVWjkZO6zZNEZ7WBAkkPWEkgyTFsxis2X4peSRBe4qD8llUk7U1xwbMQoWb3s6FJ3O2nlBkcYWmnrjsjH+zr15eP2RCb3uJ45iH0Qy/XKjiFyZqvbVddBhjXWHVnd4Q=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:72::14)
 by MAXPR01MB2205.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:50::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Mon, 1 Mar
 2021 04:51:41 +0000
Received: from MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e080:2e6b:8611:6d10]) by MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e080:2e6b:8611:6d10%5]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 04:51:41 +0000
From: "saloni" <saloni.jain@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Saloni Jain <Saloni.Jain@kpit.com>
Subject: [OE-core][meta-oe][dunfell][PATCH] tcpdump: Added CVE tag inside patch
Date: Mon,  1 Mar 2021 10:21:27 +0530
Message-Id: <20210301045127.19431-1-Saloni.Jain@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2409:4043:2d1d:faab:90cf:9a1a:1f20:8a44]
X-ClientProxiedBy: MAXPR01CA0072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:49::14) To MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:72::14)
Return-Path: Saloni.Jain@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4043:2d1d:faab:90cf:9a1a:1f20:8a44) by MAXPR01CA0072.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:49::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Mon, 1 Mar 2021 04:51:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0506138f-5752-4279-9e02-08d8dc6db46e
X-MS-TrafficTypeDiagnostic: MAXPR01MB2205:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MAXPR01MB22056E9F7229A6EF991D0444879A9@MAXPR01MB2205.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Zg7FODHfITMlwSFVpBCjlI9/Odqf6s3cpmWmJmEW9UVX7fEYDX47RcIDOXIR/keu0LPOhIRwfx89G5YzyDIXsaUfJ3Ioa4Wrzs/X0dQVcGNFM6HPreukSF9z5JylcENyp7MxjPgHRCfGDtRL4g/VLjO8yRul9zZgC9OaVj/GaFrDDwmsW+oRqfGt7jdmIB/vSM1WUI625fwLz0AufESVp5GPRSeQ7SO2AICT5kWarbS+4KhOtlmXydJKgdgs2/t9xdP8nGYs1G/5QLRtXQuC7zwv94zHv1zFIrNP8lYX0x/Fi7Qwu1ZmdGNYPIhPCOGVuEhw/z+o9J4rZcgG0OMT462MJrQIuC2NuCKADhsjWgafm+R3Hgv2O85DxuiVqOvfAewGXaKL8kVmAWHq0JwsCI9qOcuQAWiAZjYt7/wpMhlbSHxY/v5r21Z7dTJMfSrlDQtMqhHOV25u+d+hVxrlROpzAs38645N9obipvr4jhMbz1cDWV5HEsPs3n3G2JhLEAOagzLhGfJW3MDBklMHlS7l9MGc4pSiKdHYwHvxcJKYfprcdfSnsX1+ZCNtCTT8XCfg3tC0pRIpYuWsajXWKg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39850400004)(66574015)(6512007)(4326008)(8676002)(2616005)(83380400001)(8936002)(5660300002)(86362001)(107886003)(66946007)(66556008)(6486002)(52116002)(2906002)(316002)(6666004)(69590400012)(186003)(6506007)(66476007)(36756003)(1076003)(16526019)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?3ztSbrEmf8Q7/Z3dqLPv/t+gHo7zCptO7sYrCUuAFN0I+LKlAjSp+lhQe/eR?=
 =?us-ascii?Q?QLk+0/LoXHFva8TJtyOhtR4tR3+r+XTEQtx7HdoBYUo/hT68zYe1Y1bVFQ6b?=
 =?us-ascii?Q?Hudi3kaeF9Mofs0UM66e10+323kD/AGb3SfIJUoPJ+Olf/rwWMLuN9UQrotL?=
 =?us-ascii?Q?PmjvKBNWTBraG/rQKOFn16czxysP8Z1aMvo149HMyDB2lKIB+9X1hihd0r1b?=
 =?us-ascii?Q?7gqzKSnmVDNVCT95ayum/NYf7uMdEKLlxhPUlw7YLfXWWtmuascNfERyM4Vs?=
 =?us-ascii?Q?DgmF+QohioHfxIBulI++3sN0WGE0JAZY2GKn2YMl2D3GPgyNdaT1KAxbxoaP?=
 =?us-ascii?Q?7cKN27k/53Ruq2yi2ajOhBgEfOFK/TLz8Dg11Ol6D6e9i3K+kaKOK8WLkzcG?=
 =?us-ascii?Q?DZDpcI6AeJrnneLJcXLi1bQhVFvuoFXNok26JTWOxh4fSPIRm05Sgv5s9dae?=
 =?us-ascii?Q?Xxr1PCH9IFcj/rNzNinJ6y/MzpFvEoxwUO8W/dzREnKPrkRluu4hD6WLJRNE?=
 =?us-ascii?Q?OUaHA8GtT06NL2WPkThEtEuc/hwdoIStmfwloQVspaTut3p1zka4rpoeb4PU?=
 =?us-ascii?Q?TS+lq/sPZJ4jkHQfSmOcBvfhaaF8i+kKLbSYyNHcsrp8wP+Mnqd8NGq9eVVR?=
 =?us-ascii?Q?Z3NSozUQF61kTqf8eSAy6cA5/dlD+KnVG7gWQO5PnMUSFjiv8qLmfSo24h3q?=
 =?us-ascii?Q?HqvDvDohYKqB9ADoPh8KaYvh9g2YIxfVUU2ip1KR1NAEATCkQbZsR3QjC1u9?=
 =?us-ascii?Q?vq4/6NzUkkNw3dcQhqzFVbjW+zmSf9k52+5taPWmjrCETQwrwN+k58NcnHxe?=
 =?us-ascii?Q?HJA/HK1nwzBLIWJsDQ92YPCsh7EGkAx6288yLXndas60Hb+U927839qzusza?=
 =?us-ascii?Q?hn6dG150vD0ulRc4KWT6TryRU1mteGbB00CaCkCs2y0X2lsjAzuAfTWzgY7z?=
 =?us-ascii?Q?kZlBsoVM+0ZNqS9GUFfTCRkI5pIF7uE/PDcLJUO9dBIPa1eXSa2hSZw+wqZl?=
 =?us-ascii?Q?5oQYbvZ1m7WWYkUsPAxJ9XPXY95B+oPVrQLp+Q5SKnirjrdOq0gjKnjpcyc6?=
 =?us-ascii?Q?Vb13UBNDni42oTGSOl7kLPt4jh6FjInoXodddW6QBZzRiPVxOJsxF9pLWGDH?=
 =?us-ascii?Q?EuiUqaJPXCn0nR/mZfhlf16Zswd7Ro0IQp3Yhsphjb2N72Z/b1pl8HEgDdsP?=
 =?us-ascii?Q?kVFMR7Rog+Q8Zz4RHa4PHARZN0D3GsXwwXpe1pVuepQQGv//LIxsMI2iscWt?=
 =?us-ascii?Q?iGwnfJOjZGQOhWGJMG0REsVXnCHmdUQN1VW26Tr98Pjo9N775xETMzkZuhhA?=
 =?us-ascii?Q?GnzqiQUZgtIzIwuWVcZ5Uec5R4SJ1yjooS/HDOW+hDGbQqM/S3BoI6m9omTD?=
 =?us-ascii?Q?7qk3VCvpOFuLwVnkCklWnByTfoYl?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0506138f-5752-4279-9e02-08d8dc6db46e
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 04:51:41.2467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9B0I4EXesF+y1FZ5pSSuBMMPKgnhqNcaNfPSTh20f47FJxili9ZkDe6VAlJze7JpCS7e7wmzVYAd9NBd4+ROA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB2205
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Saloni Jain <Saloni.Jain@kpit.com>

CVE tag was missing inside the patch file
which is the remedy for CVE-2020-8037,
hence CVE-2020-8037 will still be reported
in CVE checker cycle.
Hence, added CVE tag inside patch file to
resolve the issue.

Signed-off-by: Saloni.Jain <Saloni.Jain@kpit.com>
---
 ...-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/0001-PPP-When-=
un-escaping-don-t-allocate-a-too-large-buff.patch b/meta-networking/recipes=
-support/tcpdump/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-lar=
ge-buff.patch
index 9b74e00c5..0db8854ec 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump/0001-PPP-When-un-esca=
ping-don-t-allocate-a-too-large-buff.patch
+++ b/meta-networking/recipes-support/tcpdump/tcpdump/0001-PPP-When-un-esca=
ping-don-t-allocate-a-too-large-buff.patch
@@ -9,9 +9,10 @@ if we haven't captured all of it.

 (backported from commit e4add0b010ed6f2180dcb05a13026242ed935334)

+CVE: CVE-2020-8037
 Upstream-Status: Backport
 Signed-off-by: Stacy Gaikovaia <stacy.gaikovaia@windriver.com>
-
+Signed-off-by: Saloni Jain <saloni.jain@kpit.com>
 ---
  print-ppp.c | 18 ++++++++++++++----
  1 file changed, 14 insertions(+), 4 deletions(-)
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
