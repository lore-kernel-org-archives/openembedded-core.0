Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.1730.1628030665183430618
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Aug 2021 15:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=W5JoBgeB;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=384908bf27=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 173MMcdl024557
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Aug 2021 22:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=dN3Ywfin7ilURYnGfvEBVYJhyeFJpvZudcD180gPkfs=;
 b=W5JoBgeBku6gyRwafo9Zey9EpF1iaj0cv+OGAUtal5CNOONtYOBgPneGVEZ+ELuJL4y7
 FXuzq3PQ1mnPeU9I9SCUtI7nSOzYBo8C4SORoVtVul8MAsfzHPx2RoTrnVhk+ndejBpk
 PARsfB3q4NmsE/c69iNKHvPqi71sfYdrdmN2H9NpYzYPMQfVcMbwWU3ypj93IqYHICJ9
 n5qomew0RtBYdu5uRPI6/HuEPrr+QyX7MN/p1TN8SvSkJidsl/z3iS04cknlLwbDnZ4a
 egjwjArKwvyPhv+f8gCdgn9+fY9WbYizt0wMJdOtSbhFnpenC7djsXTsRJxoSqrJz5G4 xg== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2046.outbound.protection.outlook.com [104.47.57.46])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a705h8kdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Aug 2021 22:44:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DEGF25/lwSTRCuAX1/BqV80TweaofjkQa1iZqrCswyJkHnXtTbQ1azoSWtbtEFBhMpMDWOFPrU4dPmH8jYU5YBmpAU9JPuiERnpd0fKvpCWL2gNJuw0MbyBvYas3EdGgEvqk8cMUqjNOKtSA++ynGc52EHEyT9qjesYUHGNHeHMSesPgOjh49fvS5BvjjJc/fvKEpvWNA/29CV/KZMvpyb6k4dQqnCDKCVaK9FM+G+BZV03gaettd186B/TqLuJJ1AXBpBeMyheFCXAb38gsFoeJ4C61nvED/sZcJ2inwxb/NJM7mp7Qq2ZF4YwSDT+a1KvwNrVWcaoaG4ve6ItE/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dN3Ywfin7ilURYnGfvEBVYJhyeFJpvZudcD180gPkfs=;
 b=HabB0fQjnhMP0dts8x7wKzr3yIB8mjBKzJugdW7zAdHgXx01i7RdZWOFJjOBL0aQzIymaG3htTp5mjuMsthzh8FohjCW260TxVqkx2uQNoTV/o+drgnVDeW7dPdn6zfgmml6MauFbcQSaXxsSNq6u9ajt3vbXXC8bzIpJtl82F7j2J+cgc9vf9WyVQCrpOMEtT4tKWNbkxwfWspawS37OKQ7xLe/3Ypj2Ks5fph79uD0V4IcoeJKT4z3vPajVEPTZeR6tQcfIRZKejx/t8OItrky+TkQ+OdZQdiPhYyM5gF1byEJkgv70RdXnaeiibkBgVGTP6fh+7PkylonCYjP0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB4899.namprd11.prod.outlook.com (2603:10b6:303:6e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Tue, 3 Aug
 2021 22:44:22 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::f006:a5f2:fcbd:3424]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::f006:a5f2:fcbd:3424%9]) with mapi id 15.20.4394.015; Tue, 3 Aug 2021
 22:44:22 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] MAINTAINERS: Saul will cover devtool and eSDK
Date: Tue,  3 Aug 2021 15:44:03 -0700
Message-Id: <20210803224403.382641-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: MW4P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::34) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from soho-swold-l2.corp.ad.wrs.com (71.238.119.71) by MW4P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Tue, 3 Aug 2021 22:44:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd9cfe3a-308f-45ad-22f1-08d956d03c95
X-MS-TrafficTypeDiagnostic: CO1PR11MB4899:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4899C18788C709B2C8EA4C31EEF09@CO1PR11MB4899.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oX0d9uEhWa4HNbhT5C4ClPykTEKn9hBeDgdJuy/6e/qHQEM2CjfmM6TkdDCMyi7qHA94KOp7g7CMDVCcpSksPmUgblVih9++6S3+OUKLsDXV+L0dYXkv0MP8Wd2U+1dDZxh2p4uquQnRjhn43rXct79mJhDRa+pw07gxMXvzzzS3lysbcd+ttbENNRu5yKXXM33ZwFU87C5ElsgTTjScRHNJUFhzICVxSQmW1le+W6uc7Sc6OTRWNcWiY/Db1w412tGpiONAcvamEmPrDLr+QG1yJ3zktFvU3zQgOdnx35b1YPtBX08Nt0GA41/fGwELsZjy2xIu+rH47AlrOQ/cxggMfvMw21AWIhx8/TLkjjVPMezFOxhIy8T1WKmK91iId6CZAAa3XwM1qjHGQvMSRcCwjd2Q1ubYTP4L5oLtarbyRJA4OZbY6WOnwEmRp8gVZTAYqDO4daZPgJ698Pj7eEISQIxHclV8cJH4HxI8nmZYu3Qffe0JqhWCBR2DEBysN08x+oB7HV2Uu6GiRBh5QLQf49ERlQYZARm8S/AQ7wnBSe4aqXV/Nn2J5UyOP0RoARx0kn+JntlItGdqlIPqyOSvh5dUqeYZnhvuETJwSalTUwrbzFU8iuPo4ac9kpV4r6iDRmBhh99cDlwdMrgDkz7ReT4+0ik9a7p9L4rf7SOV02Kxa9UenwoTRdZYp3aSfSSufRb70wydiW8I+w3/jw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(39850400004)(376002)(346002)(26005)(2616005)(6666004)(6916009)(2906002)(956004)(186003)(478600001)(66946007)(66556008)(66476007)(83380400001)(316002)(86362001)(5660300002)(8936002)(38100700002)(6486002)(1076003)(6512007)(4744005)(44832011)(8676002)(52116002)(6506007)(38350700002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bXJYcEQ3bVhEWmh3WExrc2FrTWQwTXNFZTRtQktudEdoYzlWUHJpdUhROHIy?=
 =?utf-8?B?Mk5zS1hZalRrRGVLRHZxMTlsN3FlOXNuL2k4V1Z0RjlGc0RIOUVqNDUzTHFG?=
 =?utf-8?B?dDBUVlpnejNNUFF2eHpFVUVNTU45TkJ0UmdFNmVoSENHMUJoZ0prYTJsem5u?=
 =?utf-8?B?bGU0RHFUWHhHUWFsLzlMdENyTGRleFR1RU1PSVlmOUxjcTNjci84b0NXdm9Q?=
 =?utf-8?B?bCtHenpPWTUzVVlTS28rOVdFdHB6eTkxWElBbUZremt0aWNjMDBqMWZ6aXlY?=
 =?utf-8?B?OUlFaVhGa0d0ZUZ1TVZXOXZMeEpmM3QzcTREY3lib3JaL3Z4NGhhUElQN05D?=
 =?utf-8?B?cFQxVmNyUThNSVlLNUl5bjRnaklJd0VRM01OMWF0bzdPa0FsZUhwb1dtd3hk?=
 =?utf-8?B?TnFyMTdCRWJMcnJsK2JyVWIyNy9pbFVYZ1EzYjVNeGxvMElHUHlKUUd3dzcx?=
 =?utf-8?B?c0dObXVzbm40bmN0dXpKblBuK21Va0ZHTUdudDlKY3Q0MVdhTkQwM2NuRGpF?=
 =?utf-8?B?SHdBRS85cjZ2b0ZndktOaWdzK2JudjZ4ZjB2WHJ4T3hWYzFCeXMzbHZwRFJT?=
 =?utf-8?B?RDdacHlwbW5iZzNwcC9ZazlQQTc2bWQ5OVZ5dlFTNnlYaGhpMEY2ZXhVMXZ2?=
 =?utf-8?B?WFJwSU52NVB1Qk1qVzBJNE1PVXhrcCtCNXZYa1JWZmF1RjdSYWZDZ3JiKzY3?=
 =?utf-8?B?Vy9qQlJqUUd1Yjc4akY3Y2wxY05aaTFiWk5Jb3FicnUxTzI5WFY2NUthZmx0?=
 =?utf-8?B?SHovTXB0eWZScWVtZ3cvUFRoUWxJZ0pIYjNjelV5ZGNmNnBLZnd0MnVzT0Nj?=
 =?utf-8?B?VjBqT0h0d2pJSWM3QStRTFdiTUh3czkwdEhJaUFDaENqamJ0Nmh5SFl4aDN4?=
 =?utf-8?B?UE16cHdFKzhva0dGdmM1TksrRGYzd0YrTmt2dzdzbEthM1daS2RqTkFXTnhu?=
 =?utf-8?B?RFdZQ0R0NTJ1U1dwV3N6T1FkdkgvRVBpNThocGx1VTY2RjJUK1c1dzhwRkdl?=
 =?utf-8?B?ZWZqejNtN0diQStQVG95eks2UzRPbklEbHA5cGhpRFJPYTJRcEZVSmhHNlFr?=
 =?utf-8?B?MGRwSTFFdm50WHRRQkIvQWxZaGxWY3A2cGFmT3FUdDdEcy80QXU3anNTZFlQ?=
 =?utf-8?B?dng1TnNCMWVlR1JJaHdrYXB3cklHZmNwSWNFSTNadXVEdjJVYkVVejlWM1FM?=
 =?utf-8?B?UnZ3S3RrMHBvYy9DZkl2akZ0RklIN2g1S2VxZms5RVkrQllVaVM5UVlHOXAx?=
 =?utf-8?B?L1JZTnVGaUdCRC9WcmprbUN0S0RwZzdMNGVCeWlONC83S1NCRUIrbFRFY2JB?=
 =?utf-8?B?TEUyUXQ1R1J0bFR3d2VLMzBvem8rYnhPa00wSXJPZG5GTGx3cncrREMvYU9h?=
 =?utf-8?B?NFhoRmVMeTd0RXRFak96S2IzUTdZMHNCZ0VOMkZPSFZpM0xDNlFDdm9LYlFH?=
 =?utf-8?B?WFM3WmlTYXpTNk8vaWl2enM3YWtIdHoweExwVXhQWTZlQ2RzSERxcFYyMVZz?=
 =?utf-8?B?SDE2WTJmYjM0SFlsZXJzZmdya2ZBVThyRmxycHZCMkhkdWc5d1R4a2ZUNU1D?=
 =?utf-8?B?VTZpT0hUV1NCMGZCSWN3SytwdHdkT1lBY1cvbVF1TUdZUkE4MGc0endNQnVR?=
 =?utf-8?B?UGRGL3d2N29vM1BaY0wvWjZrWmZNT3VVK0pCaUlOdEprT2w5RDJHcDRMbHlk?=
 =?utf-8?B?aC9Sb2V6QnJWa2F5ZU9sRHJCQmdtb0NaYm40TUJyNjRxQWNDdTVZb2tsNlFG?=
 =?utf-8?Q?vqrW3WMYHSzSPA/WIlvGfCZvr19kHVnrwxpWZ8l?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd9cfe3a-308f-45ad-22f1-08d956d03c95
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 22:44:22.2096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FN4NCe6zjwy/x7IchtT90MikyQuHyVzDbxp6WcehkC4kW+U2LZpPpBohnVcSEttvGeNVPcDJFHBNQsHlUK+qqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4899
X-Proofpoint-GUID: I0yyhTnb9OGSplFYBSYkr_TwtDdQweQJ
X-Proofpoint-ORIG-GUID: I0yyhTnb9OGSplFYBSYkr_TwtDdQweQJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-03_08,2021-08-03_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 mlxscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 phishscore=0 mlxlogscore=496 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108030138
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 173MMcdl024557
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 MAINTAINERS.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS.md b/MAINTAINERS.md
index 604d800f63..2ddcde6878 100644
--- a/MAINTAINERS.md
+++ b/MAINTAINERS.md
@@ -38,6 +38,8 @@ Component/Subsystem Maintainers
 * Toolchain: Khem Raj
 * ptest-runner: An=C3=ADbal Lim=C3=B3n
 * opkg: Alex Stewart
+* devtool: Saul Wold
+* eSDK: Saul Wold
=20
 Maintainers needed
 ------------------
@@ -53,8 +55,6 @@ Maintainers needed
 * Prelink-cross
 * Matchbox
 * Sato
-* devtool
-* eSDK
 * Autobuilder
=20
 Layer Maintainers needed
--=20
2.25.1

