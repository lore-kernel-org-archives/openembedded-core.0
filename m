Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.77])
 by mx.groups.io with SMTP id smtpd.web08.9856.1612539455898951234
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 07:37:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=sbvNVxvK;
 spf=pass (domain: kpit.com, ip: 40.107.139.77, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0WGTd8TjYpp/MhN6W+jyXAN8XzFsskPL7ihg0v+AZfOP9riWLuMFEkS+9nB3mJsNFnt9u2v2AaS1TXo6yPXeATCjBC0EWNL+VQkDGRt/xF3ItVYggZ+eozuXACcL+Gw2YUgZQd1764B4B0CbI6wZTqu5TcSCxxYr1HMYUKtKXeLp0WfQOHzgLurj8z0AGf+CWrjkW7bfQ8Ydptjp2acFDVFuB2Pwf2pY32vcNGWnp6ixzAGJF83g5M3PEZue02GIhBjrPd/j8hoHwWj/gx00NhRkNyVHEoyDbH4r1msQ7ZTLtVXybrgIUEE5GUckKS5V4cZoZ48Upc83MtrWLc30A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V++bZ7OzW0LatQqDNKYd0MwPmsgHG1p1Ao6gkBNCKA8=;
 b=SXW+CSoF1Y8TKHro3IMwdmLp1Kex5EjQsoaB0eJN2P8f5KdeUm22gbGdsHQnzrCZyKSP5G7xMcX/Y+qdD1o3Nblmv2500+9JoxM8tsMBCQRP6+PYKmp/SymFrWvOc2HyhlkoYXT63BzqrToy264jS/rmaP3qnyhqcONA3EI/WNswV/wVsAMTGc26fH7wUrYMa6OD2f54rnnIpj5SKZ9l1oYQD+7HrUTA0ee/hUT7SlWXo7b4zGD55nafzB1TC5gNA2mS2yCUg+q836n6PonzhnU3k/95u9KQsbnqOc5Vy+ajLBW0483Wqh1x8/JaoEmnBzTTMJTntyeKCVks9pygFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V++bZ7OzW0LatQqDNKYd0MwPmsgHG1p1Ao6gkBNCKA8=;
 b=sbvNVxvK5SsITBA9vY3RUmEVCJbtrrnMZ6t6tCmKyidal12szsY5gNx/o/DWXtCjFvIbfTyZW2f6OZIVT3EJKOxvUdDIH90TLP5huO7ylT7VA4Qcnz2tYSOn1rwGBDE/fWkMB948XBTLvPTy84tqfwSf/C8D9vuQoCjaZEUgiD8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:74::20)
 by BMXPR01MB0839.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 5 Feb
 2021 15:37:23 +0000
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d1e0:16c8:df47:e868]) by BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d1e0:16c8:df47:e868%7]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 15:37:22 +0000
From: "saloni" <saloni.jain@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	anuj.chougule@kpit.com
Subject: [poky][master][dunfell][gatesgarth][PATCH v3] libgcrypt: Whitelisted CVEs
Date: Fri,  5 Feb 2021 21:07:12 +0530
Message-Id: <1612539432-3400-1-git-send-email-Saloni.Jain@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2409:4043:2e10:1952:e87b:d65:9b3f:2ae2]
X-ClientProxiedBy: MA1PR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::16) To BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:74::20)
Return-Path: Saloni.Jain@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4043:2e10:1952:e87b:d65:9b3f:2ae2) by MA1PR01CA0100.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3825.19 via Frontend Transport; Fri, 5 Feb 2021 15:37:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 82ac7068-2b52-43fa-d24e-08d8c9ebed9f
X-MS-TrafficTypeDiagnostic: BMXPR01MB0839:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BMXPR01MB08391C66E998564DBCF63EB487B29@BMXPR01MB0839.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Kbg1DNllH+B6cRN/JizHNulRtPwDPhJuSQPAckimP7VD6WUFkXvk+gkmel3s/DNoP5bELPaFsfakk6121FrZZiwr3I7xzDrxP5yeOD6HOPaGjy2JCOkRCYZNhNcFtegI5NrXzcy3gGqUWMTxZNxpKRbgcwjFlP4er2XKBQ1l75jd2+UPuiWKhrNJkRrJbaU+cbuBxkYS9HLRJEl8vIV1108fiXFuUGRt8VzhXG3BjRGtWRTdDQcddzSWYXZBQjwfziB8ruI8MPkr2CjVVemhp6oGdKOI/5jHqwBzsxnY6D4JlAsuW370lHWPTuZ38aqHVqjg6f8ZjK2WU4VDTUpgigXa9OnQYdt68vXSAvwV3N7BhxQEJUsCYcpG1DSgFUHZES0o0ljqHbTjGGmuwwmQ//JAP7aFx62VwQSZ9dt1TKFs079WsLbvJZBng95ONQwQz+yk177sTCmPvwZ8hEqRuSrVlcEsK2xB03XNyPzfk+pPJ4tSC7MQ9zwpCAQKYkvs/ZiymzAMrxgipqmGMWmCywGKuPzqN1pGEAcV3Zh+O25MB1s89eShOJ+McQoJTbMDzbZJXK2mezKC4qmKBz3EYrGGcSf6Ep+lIh4oOJUmrHD2Sn5WqNwbMcyP3O6eqYKu0nKzvJRL/V6Jt/ITCX7JVhEDHVZpv8QJYpDDekTtI+armwbOnU+SKMHzsoXb+1y/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39850400004)(366004)(376002)(396003)(66476007)(107886003)(66946007)(66556008)(966005)(6486002)(6512007)(52116002)(83380400001)(316002)(8936002)(8676002)(69590400011)(83080400002)(6666004)(6506007)(2906002)(36756003)(4326008)(86362001)(186003)(16526019)(478600001)(5660300002)(2616005)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?CGpC58acu+NJBu2ehO1mmJZujNAl182upFjmNwVA4e8circz/kxuEtH9Q37g?=
 =?us-ascii?Q?XWRIi8utY1ughcaKLPym/YhYiGOMk+KAoITX0carqhika0tMF+3ckyt6z8V1?=
 =?us-ascii?Q?o1UboOVrNC+Jjja9Ckfx6+Qdo1htASed7IODh2wBOjesiiIRLKcTfQ+eBePl?=
 =?us-ascii?Q?2j3bwOxrvhVQneTgjXlTDBVI7bTISDpf0P1FXxu8Ka3mQPlflcWiq3Il+iDt?=
 =?us-ascii?Q?D1QiwMbJu+LCZKe2f0qXUK3aRQhKJHf65zrKokcWjEQW5ieLXDANaChO4+EZ?=
 =?us-ascii?Q?Cf44C1vgsE8TXbbS2sAeUZirOjE7qb0TvzwDCVxOsK08IU/qB85qbmUhTiP2?=
 =?us-ascii?Q?hMz8RPHzT8dMJmZSgOqTcAXwlNws8kJNG2MdPsUxgjqAlHzzGjiofaNxPbrx?=
 =?us-ascii?Q?gcp7uU31XoWfpsMq/asXzwDgq1A2R0pWIAFkfPZU1P41/MtYAhM/IZE2oaGY?=
 =?us-ascii?Q?i9oLDZydTVjDTXa5qpPfsIUIq8u9hNM51+dKe5qEs3eghA9YF/4LAE6/Brmn?=
 =?us-ascii?Q?blKWdNzEaVzflsMkV0QlJr5BaJg9795VpaQMEk5rO7H1E8MRE65jOm7FOmKJ?=
 =?us-ascii?Q?f6LOfwRX2k7+UlKFDgfi7kOpnYn2eil0f6BDKwM0R4AvlVBvrmt72Io6IgkS?=
 =?us-ascii?Q?aPwYSTq7PgHgqIv89tKh5uRG/dU2vRbhskNWIeHZWGxtrECpAz7fgcu9cTKu?=
 =?us-ascii?Q?uzmDC/vsF+y+R918HKuuPqx9bvVI/Ot0o7KZV3iVSjBPLSsJ3AhbCNiksF1G?=
 =?us-ascii?Q?aaDgc5QCYSJ/zXc+Mp2vl1louUdmiwm8sWeXPzytDygT3zgZA/13fQUcwhTL?=
 =?us-ascii?Q?dBdifmhj7CYrCQjTZZhsFEA9iMrxwX4iIUQJNSnzheg3oxNPSVyLvugUMyAD?=
 =?us-ascii?Q?UROd+MVEjncD4gFXdDQXbkQaSJw/l5DQUZvNNoa7ujOHeR+MlVSiStmbxxhV?=
 =?us-ascii?Q?cw/q5EEz4CG383vcEIOOZhdQd5TYwjxYxptCEj6K51yYAVQ6Y/2QKljdRAm9?=
 =?us-ascii?Q?l/yXhp839U07u+2lgLuF9y90+Vv5NoRXX0lspyQU+v0evwHqgW/SzQ/f7gM9?=
 =?us-ascii?Q?NSMBmccIngAgQLrLmw0M0jgfBEOva2saUgzOU7JtmPG7itRMJpEg8iBAKtw8?=
 =?us-ascii?Q?ixinlOPrUCb0hVAz65TUqJ2tk/XfQUMHv2Rt0lo66yB23bOozsic8SVwH8SA?=
 =?us-ascii?Q?ey7wNeZOwnlnX4Y3LnqQ4Z/y/QmsseutLIBfNOjIvcNinMtGXcbZVAOaWVcB?=
 =?us-ascii?Q?moN//21XL6ZI5oLLBdg/2/EodGj0AV0Qpy6y2Y5yETusSXCSuDzhS5F4s1wX?=
 =?us-ascii?Q?2NXm0z0nIyL2ADGsCMuXnmacKAX+T5SfxeJqUim5giBB99mCaKMi3uVnvj7J?=
 =?us-ascii?Q?vVIkdGZ6S4Hz0jmENejXrrpetw6A?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ac7068-2b52-43fa-d24e-08d8c9ebed9f
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 15:37:21.7225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0ivzFPFFifaOsl6wWDLHWTH76AYMYf5oCkFFADQB30PJo0MYQ0V3WX02pzarrqbKxvcfg94NxjTu1Qj40l1Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB0839
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Whitelisted below CVEs:

1. CVE-2018-12433
Link: https://security-tracker.debian.org/tracker/CVE-2018-12433
Link: https://nvd.nist.gov/vuln/detail/CVE-2018-12433
CVE-2018-12433 is marked disputed and ignored by NVD as it does
not impact crypt libraries for any distros and hence, can be safely
marked whitelisted.

2. CVE-2018-12438
Link: https://security-tracker.debian.org/tracker/CVE-2018-12438
Link: https://ubuntu.com/security/CVE-2018-12438
CVE-2018-12438 was reported for affecting openjdk crypt libraries
but there are no details available on which openjdk versions are
affected and does not directly affect libgcrypt or any specific
yocto distributions, hence, can be whitelisted.

Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
---
 meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb b/meta/recip=
es-support/libgcrypt/libgcrypt_1.8.7.bb
index 0cad41d..7db624a 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb
@@ -28,6 +28,9 @@ SRC_URI =3D "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.ta=
r.bz2 \
 "
 SRC_URI[sha256sum] =3D "03b70f028299561b7034b8966d7dd77ef16ed139c43440925f=
e8782561974748"

+# Below whitelisted CVEs are disputed and not affecting crypto libraries f=
or any distro.
+CVE_CHECK_WHITELIST +=3D "CVE-2018-12433 CVE-2018-12438"
+
 BINCONFIG =3D "${bindir}/libgcrypt-config"

 inherit autotools texinfo binconfig-disabled pkgconfig
--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
