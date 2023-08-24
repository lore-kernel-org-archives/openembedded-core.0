Return-Path: <emkan@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 089C1C7113B
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 13:41:26 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.101])
 by mx.groups.io with SMTP id smtpd.web11.10997.1692884479251618777
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 06:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=f20+53Vj;
 spf=pass (domain: prevas.dk, ip: 40.107.8.101, mailfrom: emil.andersen@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IvgdxxDBc5qmPfhtbPS2Sd5jqNhXSpqWgGblAQDjPbwwUq4FQym/hQo+LtYRzyhlm6cMGcb3OYlvRm9zXwJa9r/KjnpJpgJLnletUNTgsrpDv28pmjjfEwTrze32ACgg7ZrTrNc45mtLzh9bZqsjh0kPMNZT367Uy0f3n9OLDWEj4CGPdtMnbVmwtT0/N8tl8oIxwNxohMwAxGdPuIXaOjuALXUOIEogC9mPwMzT20smWFuzsR1QeML3WNVtI7gQxKRfj+cMll+atZA6TBrYul2XfIlxmE3+89PBD4n8lCRoF5okvTLToUvKZMQN5tyAglR/XxFY2lncgOkEDhy+Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcgjXnzbyLRG+45VcyLPUOyEuN4FtYshut9vdi/ebTE=;
 b=MPM24gjzVJGsdXerDWGAzY3S64S7X3oGPeMejps0cCjTQNxh7tnHcNR99P/To5tfqldCqwGN+umhflE13r+ymAl1T2qBK7FhI83ISgvgUuHWf9b+HjVYXRZ3NjxbkqVW2iJroBgJQxmYilD7D8wOZoqvc/NQX5b4j7DwozpcY+kFR2k6mOdY1B+hCZTwW34VVIG6lFkUr08/9MzzeuEOi9R3kPWKMatrXsI6iG/zeJgNj5xI+QCTnDOZ3Oc6s+xaNZ2SejbvMz2n442sGbHlkRQwONqvT7MlO/f9fzQkKLx9s/vDhIfJq/twp59a0drlglGJxnXhp8a6FcWKISA/3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcgjXnzbyLRG+45VcyLPUOyEuN4FtYshut9vdi/ebTE=;
 b=f20+53VjKmKUeRo4iVHdwoJLL3Hh3VesBwBck+Maza5inzSdPmT/d/jWAuAUfVTiM3yRxdmIi8nQg+ttxbvdzrTmoFs69ifx/f1yxyPvvuvGEmdPWaPgI2XroJ6pKIgDStPVLOLijhDeNGXzOfB2XBDC8Q1fokTpWFx7oFy90/U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1fe::24)
 by DU0PR10MB7142.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:44e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 13:41:15 +0000
Received: from DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3887:6849:a8a9:72f6]) by DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3887:6849:a8a9:72f6%7]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 13:41:15 +0000
From: Emil Kronborg Andersen <emkan@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Emil Kronborg Andersen <emkan@prevas.dk>
Subject: [PATCH 3/3] libx11-compose-data: add CVE_PRODUCT
Date: Thu, 24 Aug 2023 15:41:01 +0200
Message-ID: <20230824134101.41906-4-emkan@prevas.dk>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824134101.41906-1-emkan@prevas.dk>
References: <20230824134101.41906-1-emkan@prevas.dk>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0049.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::10) To DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:1fe::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB4571:EE_|DU0PR10MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a730653-8440-430e-33e5-08dba4a7c976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aPsLGyI3cBlgKY9/FmwGEZgRcNb2vP8FDmqPbffdArdpy3c+oPmjJLsVtO9MJoUnxX4NHubPkRSxaFzG5Bms3cZrt9g7NTdpBPnCywGHSlXWZK0OrnmvHzj7f5hLHgnH5vAsrzfDRHH875KaajRgBdNBnpDTs82Ixi51c/6g07f7NTVLBnxXFVbyui286xobDWtdSFR0FJumr7mPBaEWwveOwt43BZnFbNZHmnyOBGjaEHLYHffIVfFsZYd7OrHVPUOGp9B7PJQDwC9Z4B25wvAUxt83j7i7IBdr9lkpxgksu7j95Q5I2afmZdBOJ+QqK1khMHHS5u+h8aT6PxiuthTNpQJsWuTRFrXIdr0kIKcbM8lXPChcxURIjzVqQcPMM4iui2ZNc9K2d5BIHwkcEBDz5MswI14o5B2TjZ6qLw2g/eS1ahS1Hu59xrrqUxxFx1d+NyBq95mTbCnwF+BM8J1nfqPZNaNuKnOxFRyOhJ2UyZAYttW+oSek5RKJst9uy/XKgOs9oa9I7MZ000UbMBrLmr0zjWWdLa97oG+OiI4Tkj18UaneNKZM+O45NdmaZTNzGaeBZ0EeZd4vYM2VMdYAfEUTg1biRsvBqnyEtJ0PpsvwjljMibpIOC26KlLg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(39850400004)(346002)(366004)(1800799009)(451199024)(186009)(38100700002)(38350700002)(36756003)(6506007)(6666004)(6486002)(478600001)(5660300002)(6916009)(316002)(2906002)(8976002)(4326008)(8676002)(8936002)(26005)(6512007)(66946007)(66556008)(66476007)(4744005)(52116002)(41300700001)(1076003)(107886003)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?A8dZScRNVPypyvIzPyQ542Vp5gJooZeEn5rIZxKoUZUA6GJREWj1WIPffTjN?=
 =?us-ascii?Q?RDkiZGnpFTwlULx3MB5qjJQbeDhwxwSVyoDPLX2TQXEhNjUPoAx5R0MY3FWm?=
 =?us-ascii?Q?VeJCYMsv8HqWLXmlooruPxuOdQUxVSeenrGT9iesPqw2nJU/5tbF5FDeGb5w?=
 =?us-ascii?Q?f5bcsyhCEQnPt6+CbuVIwNyysn9fY0jKrS1FQaiYALaowmCXZwIFjSH1bIY+?=
 =?us-ascii?Q?eqSr68+6qeAMIi0PWtKh4r47GSOf9IEGc2uR5RI5XBV6Wk7naBsL/pllrWGe?=
 =?us-ascii?Q?2ip8p1CGcYVcG6uINvkgwKzsQnLt96pR/e/5iJpJAPtzjQjcEF4/keCDq1s1?=
 =?us-ascii?Q?NfolW6uCEW05YsjG5JcFntgM0jH/SG+GfTsZlllLXLyvx6VBIiuU6KPdPPw4?=
 =?us-ascii?Q?gGpcPxl8bAs9x+XvNEdd78gU3FhO8AWrR5WC7EjC6JJVJcjJBh/xhK479mL/?=
 =?us-ascii?Q?jg7pahJxwhKpaVDoSSrP+OxfaOkn0UURxMj+UseX8TYt/zl26ase1YMNpzBM?=
 =?us-ascii?Q?GpPnz9VWdvdvIVAUYVroy3x2zCkMLW2NXKiWpspbfygckUEAb43ocL86RkQO?=
 =?us-ascii?Q?jbe35FVGluKJrLTLCNXRi1R5llwdiUhdCcyId6fbKST/oQtRV69NM3wHnItf?=
 =?us-ascii?Q?Az6Uvml3mOSf+b1YN7S8rhm7wOc1be72/cqSPB6ossaS88QKu0y1BhndNUbV?=
 =?us-ascii?Q?I4q5bHe0JvAzE0xJ1miDkrM18h4jsWAKn6rJis0B5JZbM4BT2GshSkZKk/n9?=
 =?us-ascii?Q?kxW+24m7hFFYk99ElTfbEUxzdpd3jWJ4OD7WTpIzqB/CdG5BmEI6o9t03i9L?=
 =?us-ascii?Q?BI1uoBnNBeD3qQhptJdOFWDgmIhNvJxTuh6BvhveCnCEZvlb9N49+9dIrVyB?=
 =?us-ascii?Q?dK2YSQkyZVjxcRfisTMk62rhqevKyvh6X8wFf1QbVgBV/VSDim/K9HMFDDb0?=
 =?us-ascii?Q?wK46grzw5WwJ4cw7fj9GHo3Qx1JSW3j6CpR5fCNKB0GtYuK0TtIX3CogbivI?=
 =?us-ascii?Q?Ot+W4wJj6zL0SAFiTAqr+enk6c6jscRl3pqQYEDXs6zV/0Mn1BDxKaw7gtil?=
 =?us-ascii?Q?StgpD525+jMxuC0GTFqCSx21gBarhJ9bU6HWNWOM/zKZnfzaqIN+vD8h4R7V?=
 =?us-ascii?Q?2qYSAkeBdrybdS28ZW2MZ1y40qt6dTB0V3QW+Pt8e9snRHpRc4XKsDC5NknU?=
 =?us-ascii?Q?36ppH1c4cPEoEUXJG72JRTaAqlfG9PSI+h1UhHjUdSDX4JNoOYWtfsqasS11?=
 =?us-ascii?Q?2AhRv8Xx7f2TN9UXP1fhGGg1MeDzCwsM8ePbZTWnTzgNJKIN/p3breJ2n+0x?=
 =?us-ascii?Q?lQ05tEdJzWRgF3PC4GUzW9Oc3iEhgeoeTPc9ub+r836w7Ib/3B978j1Z70SN?=
 =?us-ascii?Q?jnEMaeCQ1H93LvOybhl/RGVe2Pk/sBc5BtO2/r5QEjivQGWMwdLIn/ocC59Y?=
 =?us-ascii?Q?qCVtCl2I45ueYI6opmkNp+t+Nld8O1t/1GN6hDOGO2SZ3GqYrrShIOV4VL04?=
 =?us-ascii?Q?AtOAiPoXQGMvFFohsohGe1Tsn+k0nJ6UQ/9Y2uRh4IFak8O3ygQjgHMHVRzD?=
 =?us-ascii?Q?w34BmyKOf3M9OmbUUEqX3guPUmAft/k++V64sSQluVPsz+EmJ3aLEdtV/7As?=
 =?us-ascii?Q?LQ=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a730653-8440-430e-33e5-08dba4a7c976
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 13:41:15.1458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i1XGwrwXTXAwA7yYqQT2Ro61fsornoZxKdLTbz7S60WhUsqV0qo9jGXn4jP3Alno/UtvgIJWyjRInObiNR+moQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7142
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 13:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186660

Signed-off-by: Emil Kronborg Andersen <emkan@prevas.dk>
---
 meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.4.bb b/=
meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.4.bb
index 2131f46213..5d5762456c 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.4.bb
@@ -33,3 +33,5 @@ do_install() {
 PACKAGES =3D "${PN}"
=20
 FILES:${PN} =3D "${datadir}/X11/locale ${libdir}/X11/locale"
+
+CVE_PRODUCT +=3D "x.org:libx11"
--=20
2.41.0


