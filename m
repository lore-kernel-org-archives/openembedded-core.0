Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.54])
 by mx.groups.io with SMTP id smtpd.web12.3310.1614752175299106825
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 22:16:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bBFgPOBa;
 spf=pass (domain: windriver.com, ip: 40.107.236.54, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZ1HWYFs+PsHatWUJQpZo6hxQdeqg9T9iLE3e9KAxVrVDvT1qQOeY5f4PMxF6HepD2hUinfwsgIzGfbm1pAvYYvAPBG+KaT2pKnDnVSb3g7GWUbc29D2qgyde517rOhul0hl/oXlvM3Ug50JjpbUJMINaBFgOq/dy0gOaElwrw0uAMFZNnUkm49QPIu3eofUFIVwazcZD0T/7DPJ4qGvFwH9nSxbtn9APYw95UJgc87NRHvpHEpbPaOTqshBemqv//2k+bvS9u0JMlpseCV7YAIYBs4/O3CpfOk88wdAuEaeMDxfhyKCReOrR95hYXI9bhcPz8cGQ05Gq/TfxTpZZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHdpPmbSfbqPxWSmeJtc80AWS3sGiaNKbrGAc3tOo5M=;
 b=alD6vOvvumqD//gIvg0o/X4E3TQLqoXxsYx8cH3zLEH+JkHePB84rJ2GsVQolvBrkQRJLASl0DQa03LuxvgLZhXmjMmmzQtVmXxTGpMXrgtQkwxUwJGAHcMW7kbdDMHQu9w1eEX9+4aKkPXoAHdJZFKoqbJ036J/2IBtC9YeovawP8+0FMc4SsVsseN4JFAQzt4pooFXGYw8YSGPo51MF6iUiYDu+IwqzwFPy5huNrWVsndoyB6zw3o5CQMF/zmUUtVgvfl/UQc9qi1Cai8GO3HsSYczRrSi2fx44y7T6E7q9F2DD06t9+38zZuQ7L5757GNP5+QN4kUXw8FbEZH2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHdpPmbSfbqPxWSmeJtc80AWS3sGiaNKbrGAc3tOo5M=;
 b=bBFgPOBaoZpjgohr0e0U/qd935zstov27oTc/l8TR15OrLJczK/2bEubISOetBnrImuidfKH0JNFZCIFdnAoRBoOI8cRDDN8eEXryP1E8hRvgzY5o79kof3JP95T7YcivpuYHZmMreH4Zjd4RFrF9IAg4XNfNL0RNZ6byoDCISQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BYAPR11MB3479.namprd11.prod.outlook.com (2603:10b6:a03:1e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Wed, 3 Mar
 2021 06:16:11 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::95a3:653e:2078:fb4]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::95a3:653e:2078:fb4%6]) with mapi id 15.20.3890.028; Wed, 3 Mar 2021
 06:16:11 +0000
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] lttng-tools: upgrade 2.12.2->2.12.3
Date: Wed,  3 Mar 2021 14:15:55 +0800
Message-ID: <20210303061555.40835-1-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2P15301CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::16) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp1.wrs.com (60.247.85.82) by HK2P15301CA0006.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.7 via Frontend Transport; Wed, 3 Mar 2021 06:16:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa655c63-ae55-4002-f99f-08d8de0bd6f6
X-MS-TrafficTypeDiagnostic: BYAPR11MB3479:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB347954D81600F733B00F1579E4989@BYAPR11MB3479.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O2BF9uNw0+9v9LAotb4ZKczzKPimuR/p4x6hBZeCqiVRjBKT9pjze8ReXxg8B3iQtfSKEr/Gd4tf4is39zfwuhZxZmXXBhl3tRuR5DcKHIt105b7jNl39hwDDoNXLcSjcd+J2GyeJHYIGwV9geSlBpkYYeltaSpXSqpExrBlspqq+gMg1FaMB9O6QUcTY8oHVhkonAXAqXiIlLbvKwRNXBf4I3n2mch3hyd3hmqW+ThrTGp7UorZqffdxQHQ5Pe1cg4VLpdzcZvxLtFC9jMThmjB7Nm2EnmOgHpqID1ftIiFwMn7ixztBkyfXooqFNnci5ln+HJCR75MmXbJ8zDTRSMxiq1V2HwhPUZChwchMfQqtqdLpD04cGwn+MmLgLOraMqt0w5qSbuWDDhJkqkmWFwat9XChIqSuSjRQSeshnkNcCdSbYuZ0D3w6gtNsnA/TPOg4YR3mPtg6JPeeaol6JMOjr6viNKvQVQKQFEoUWOYJNAQnD15ihg1fkUAOjsZTuDJpESMzC1Gj2JctsdlarzkRTHQeN75pF2ZB80g98RBOoXxmW07uXyVHfc4TEy7vt/q4FaCqKzZ/B5Z2i9oAyLObNBrpPzNAulD8XCTiFw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(39850400004)(376002)(136003)(66946007)(66556008)(8936002)(66476007)(8676002)(5660300002)(478600001)(86362001)(83380400001)(9686003)(2906002)(6512007)(36756003)(316002)(16526019)(186003)(6916009)(1076003)(26005)(6506007)(52116002)(6666004)(6486002)(956004)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?xF/uBanHX/l4BLslSgHAXBcHE4rtT8Iuo8e+vAOJ4bdSTj74MnZ1cp9TDATx?=
 =?us-ascii?Q?SKshZcqUYagq89oLJgrimydo43B6gg8SkgUaqDaAwd7bAifeM3Vuu748Gnx6?=
 =?us-ascii?Q?gkrlQuqgKyQgyNvuINWXU3FhkiyRN8nfug1KNBwIDy0Ai+zYyWYmBMBsXUS4?=
 =?us-ascii?Q?lrHYqaRFl5DpAHXl/LbVWO8+0irgdgpBRMPVL+ZYZqpKsOThbRWTfwf1R/gs?=
 =?us-ascii?Q?APmlYgOgOhomOcETYT6B/nOa/ATFGTC85gDzN4g2JwTRngJkQ33+O9ZeZHim?=
 =?us-ascii?Q?EuUuBQOwbdb3FI6kFNbQjM1H9X524hjfl4y6vQFULKLFVj3Zi1catPjZQAos?=
 =?us-ascii?Q?oUAwvhU35FSICDh79CyJBVgylSLbvYTVC5j2rDFNicOD0YZY5sHzuFJ8cN3t?=
 =?us-ascii?Q?jFEL7pEFSBdUchF26fe55PK7TwEY2jGAMkCrkf1qU88YUQbgH35qcPD7z02y?=
 =?us-ascii?Q?PUJ8BUkmQehKUnbKayzFzYc4Mjwf7IxjwgeufNKKuU9TvudfXG//DcQw/Y/6?=
 =?us-ascii?Q?qUpiuUJyFrNfNURFYgULrRiApOxSCUaWYfAeumO+B+7Qpxq8srZF6RqRcciF?=
 =?us-ascii?Q?gf6jdEMU8m6ilM5CdaA1YNopSrAIk1Yn/V2Uloq23x2zmKaZLzgayXIZhdlu?=
 =?us-ascii?Q?951zxZnnFUXbKOfKJVBiwkCPPUpM2BizYRi7zB5NErrDN6yZIktRleqQq1YW?=
 =?us-ascii?Q?oZuIc7ReTW0f8ueCqHpnfPQmJaa6sQop26Xi3i1WChRlzgkS7FaCQEflkZPV?=
 =?us-ascii?Q?KhOWAw4w5vhmlvJMv8b+N+ORiLztfoGN7su18EsGCWLJVmF5l9I3kgM0RQcN?=
 =?us-ascii?Q?9830i/vJTphRBgqy2VgxWWwU5sdV/iLOpJpSnUCKJWeeuDRaNGXOTBCEXpe+?=
 =?us-ascii?Q?RED7R6gC/DBNkv897FLUjV1DsxcnjS2Czi5SIk/hA/j6BoASIFbb5WSjZ38k?=
 =?us-ascii?Q?2EOteGpWcFU3eUcgo1FqL7VHa3zqZIWJ4dJqn/MuRspyYedImIKKOYNJYx6q?=
 =?us-ascii?Q?V9P2EFmDd0VboEoaDxlMFU0Mhe756PGZncQog3acedcnbGUkZ/P4fD3VRu5b?=
 =?us-ascii?Q?IAN3DfbNGLvQMktjXUfbHGn8mQrh4Qe6GUDNeUCUOQdSrL0whnkFtQjtXapd?=
 =?us-ascii?Q?bXPmmCpObljdVmrgfTMTK2WJj+RXpWaLYPdLIX7aY2db45INVGydDrfsfJLY?=
 =?us-ascii?Q?rBS2204hvS88AbxeBe9WIBTy8pYbU86YSpO6Zqk8GfC1xiYVZbNccSJoSzIw?=
 =?us-ascii?Q?3FRrAhlkW3S93k2Xd3hkX6MAB4f3f5kLnQRP+c+gaRGlhGQqwEV8F64rRI59?=
 =?us-ascii?Q?vJB0kO3Ot20rjy5pKVY4PWeD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa655c63-ae55-4002-f99f-08d8de0bd6f6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4241.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 06:16:11.3996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v6sVfKVDlIHtMvQtCL+JRrthB+2bYwIWBNQU9HacrFeAwBH4/ZbEVNLm0W7B3CrDaiJttZk6penUGw/t1LR3kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3479
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Yanfei Xu <yanfei.xu@windriver.com>

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
---
 .../lttng/{lttng-tools_2.12.2.bb =3D> lttng-tools_2.12.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.12.2.bb =3D> lttng-tools_2=
.12.3.bb} (98%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb b/meta/recipes=
-kernel/lttng/lttng-tools_2.12.3.bb
similarity index 98%
rename from meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
index 0787e04d19..eae95da2ed 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
@@ -37,7 +37,7 @@ SRC_URI =3D "https://lttng.org/files/lttng-tools/lttng-to=
ols-${PV}.tar.bz2 \
            file://0001-tests-regression-disable-the-tools-live-tests.patch=
 \
            "
=20
-SRC_URI[sha256sum] =3D "9ed9161795ff023b076f9f95afaa4f1f822ec42495c0fa04c5=
86ab8fa74e84f1"
+SRC_URI[sha256sum] =3D "2890da230edd523fcf497e9eb28133b7606d64fa01bcbffadb=
fcba42104db153"
=20
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
=20
--=20
2.27.0

