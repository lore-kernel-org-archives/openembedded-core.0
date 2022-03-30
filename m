Return-Path: <simon.kuhnle@methodpark.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 610F4C433F5
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 08:35:41 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.71])
 by mx.groups.io with SMTP id smtpd.web12.4782.1648629339098297935
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 01:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@methodpark.de
 header.s=selector1 header.b=gDd3quTb;
 spf=pass (domain: methodpark.de, ip: 40.107.7.71,
 mailfrom: simon.kuhnle@methodpark.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4DQQ+wor9xML+4Sqp0gXJIkB9VcdSW60BryPzC68nTOwcQdibQMIIePml02jYQxVBZP9jS+4MKATk0mTV+lqcJy6d2Ud7TzkPpbPgGP6lJZj7LZDLbgw2QADXzgT7WYB9ls4lIEP4g+2RSx1IKkZZgqiUXr+AALNu44pXgpqDGl/SWJ1TzaiBKJKfsDuscL6O/rSmguRmbP4+0D1A3251e1VfIcU/8yQHMH81zSxkArFvlDCOM1flYFG6P11kIxDHMNL4JOZeszUak9LUvQRAuQ3W6X1RCAuqsrIN+O/FvSTKVPkr7I/LHaOxPio4E2VmhJzbrNR4GtqwIrNXb/GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmzFG9ylf2A2xhpD/kZsGqodXJVL+pIwBb0jpvm3rZs=;
 b=IzLxbkV3j6Z6P3Ime63ZsyKkcdzoJvEr7aVtSGQ7I+ByuYsz1kA/RZWh1VxU8+WQCT32sc3XGX8nCIkQuU0x7xhuDYEkOftL8plouoak0O/bj6ozPPhJBtGc/U1kL0KODN7kfK1ztaSalD7n8t7XekR7quJrWr0B9QP7EtW4rjq0IaQ9RKFV9YebvPHlCHcn/APL2MJ6Gr3Xca2Whmu9Id9tctKE6HZDarV6l7uONhpAG30JPtEhopYdQzdUt3SIQaqwN/95aDZLKa9BZ0BgzB1eb5IupXUxZXWRah5JGLDKT270D7uC3axcw4obPsFbeEOwOlSk7GDevsZJ/QpLrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=methodpark.de; dmarc=pass action=none
 header.from=methodpark.de; dkim=pass header.d=methodpark.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=methodpark.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RmzFG9ylf2A2xhpD/kZsGqodXJVL+pIwBb0jpvm3rZs=;
 b=gDd3quTb8Ir4gmDeZ2Su7o5tWRRUWbxdwWTNClh0Ec8tXgLMERH/uopdJljWvHxhs2+4xuAS+BTZ/lYlZ68EynRSHDA4YjENI8IdxB/sLMGlz5oEprMVitPV0V/jvOyYT25o4mOqiRmJVjL6Vj0nGv6N4Q0C8ZF5XGpRcJLlYOI=
Received: from AM9PR08MB6307.eurprd08.prod.outlook.com (2603:10a6:20b:2dc::5)
 by PA4PR08MB6015.eurprd08.prod.outlook.com (2603:10a6:102:e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Wed, 30 Mar
 2022 08:35:35 +0000
Received: from AM9PR08MB6307.eurprd08.prod.outlook.com
 ([fe80::305b:c874:d8d3:7a8c]) by AM9PR08MB6307.eurprd08.prod.outlook.com
 ([fe80::305b:c874:d8d3:7a8c%9]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 08:35:35 +0000
From: Simon Kuhnle <simon.kuhnle@methodpark.de>
To: openembedded-core@lists.openembedded.org
CC: Simon Kuhnle <simon.kuhnle@methodpark.de>
Subject: [PATCH] convert-variable-renames: Fix typo in description
Date: Wed, 30 Mar 2022 10:35:24 +0200
Message-ID: <20220330083524.150652-1-simon.kuhnle@methodpark.de>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0022.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::14) To AM9PR08MB6307.eurprd08.prod.outlook.com
 (2603:10a6:20b:2dc::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab0bd24e-1969-4d55-2c45-08da12284280
X-MS-TrafficTypeDiagnostic: PA4PR08MB6015:EE_
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB60151222D7A3C164A262B2168B1F9@PA4PR08MB6015.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BQeJeALSYQsXT4ddQodLRneSeAWWGCGQHU1RbHNsH+8lxfU/lW7AlrtyGDwv53dF7XG998kofe7wAt1akA+00Ig3pCersW10YwiLC+V8dr6ilrBd0R826FIATzdbAKH2iVBBI2Y0XJZn9ArCzw5Nskh3Nj9u3EO6WwmtIZeYY25yVQU2OHleYBYWgAadOAN9UPcI7EilNx3m6lPpqSDgBwTvVwkcvHksP2erBJEIbISWCvJKtpEWQRPZ3VZLSDlN8fOMcEbPztYVJS5Fnp2JALMPmHKTMHTLZRfip9KzSe8f39Jbm8NrwBl5kgvAMG5sqpq5TOaemuBqUNhWvtsFC/iBf8hg3ubNaY8prH+3D2TO+YqlWcZd6LiYmihmDrqeP2Jd+jZ/MUgGQLvdHrcnNEO86hfGfVZzjp6xwIbmXaANHEq1Uu2b1748Qut4jtJZCHo3ygmu53ff5KFtvjmF65FdTd6uqU2vrhVCnwFtHfxajHg5eX7YrqQXNCCQlDilBra/UfRQfScY3x9VyEDY1gRg9s39PkyBQSjOVrj8DdBlGoOXnD7WXMpGKUrpiozi2ivlwLTsmnGmqcBr7mQE556mPIhU3PbFAiZkzqb0Y+Dzgj4KwS4djawwi3hcwotenGStjDtYaD2/OPBvSEzNthPNWDomlVIdkmpS5Kanrjl+PyU/XyQ02gcy+nznK0TuBb/3JPUNmrOdlJEQLjDxQg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6307.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(136003)(366004)(376002)(396003)(346002)(39850400004)(6506007)(316002)(508600001)(2906002)(52116002)(36756003)(1076003)(107886003)(2616005)(6916009)(38350700002)(38100700002)(83380400001)(66476007)(66556008)(6512007)(186003)(26005)(4326008)(8676002)(66946007)(5660300002)(4744005)(86362001)(6486002)(6666004)(8936002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dma2Pf37Qj8m98byD7DlfVXtjhfn8J7abm6WwGkkJJGWvL3kfdwgvcBF6A36?=
 =?us-ascii?Q?JHURNT1sw0qMp2RZp7MPDbqnb4daadAwzUHJoz+6OnwvvU58HDtSPQBcfmLW?=
 =?us-ascii?Q?o53lL3iZN85EzbtL8z+3DxFOEVqRFKhjbKuRDf4F1zmQGJCgxxBYbDV4g7cT?=
 =?us-ascii?Q?/yd5j+OsTBgK4T3nhecswkHgM0WT//CP8nUIKhShGE4kP/ARmDEweJQ80MyS?=
 =?us-ascii?Q?yl/drIaLZjfzQFHddRhj3h13OdpGrW52YrDXpvSWlsENOSsXk7gR9E7wcI54?=
 =?us-ascii?Q?HWNjemG4prxRHMsaRC/rEPKnZ5o7XNg4Kscwf6hVBtjCGhR8vasRI2rDF9wi?=
 =?us-ascii?Q?3zRY4UYAQ2l6CnXmZ4egnuF/0oReYkJqmlyIwh+ZV6h+PXAI6WaBErBNUgrv?=
 =?us-ascii?Q?14mPfqAzWSEbTJBvIJ6RNLyVxfetg7vOoLf+rHVQ27+6Vp2yt1PGfU9KhlOS?=
 =?us-ascii?Q?Q3VWayCO8ageLxb8RFSu8vPdS4fj08LWERz3KlywuoaKiRqdx4g8mxmeVz6L?=
 =?us-ascii?Q?GT8TQ1CU0IZO3+tdXxkeAn9h/Ub4hGH5cBt/mu013WVoRLN13RkEbwTJjJCK?=
 =?us-ascii?Q?YnbeUv2Es9/Ry2bhKQdo2hAmCMZlkLoyH6SzKoGFzG3gkJ4chOPtCvy3dgvu?=
 =?us-ascii?Q?WFt4Axu9r4qU4vui01VZojHifmapQlV59e28/B8GPL3mL1UInFGMBzLMd1ii?=
 =?us-ascii?Q?40XFzClEjWfE+d2OJkaIWWOy4PR/avmDNKsJiXllvQpepP14/k+SlcaIOjt+?=
 =?us-ascii?Q?HFHHiCekg5P+qiBl9TMn3+WKs6sYYY40C9+j04zV6kQRYPVOPCcBznyNg9Ey?=
 =?us-ascii?Q?vtMbS2ieDv4mo+JqmO5mvy8b9iVgxeRIQEYaed8oWuopTSHXpJj//0UUa6dh?=
 =?us-ascii?Q?6aCQawgbdn6HdU/WQSpWsJfsxeS3sUc/AomkrZWx7wRjzsxXlD4aX4hswW7d?=
 =?us-ascii?Q?tWQPra2b24gmzhPNe54iyJk64BmtuCDsvNxCBdSXuIzmbO7ERARCWQu3a1Xt?=
 =?us-ascii?Q?V5JmXt3AiMcKLsWz1hbeG3/EL+HocEfqNNvoO3Uj/2BqyRUaZ77Om6+aanYy?=
 =?us-ascii?Q?dtESFEnR6dM+PmsECYzdGbgmcYmxzH+rLM1YjGDrXcHwZvhhXvMnZoyKE6HA?=
 =?us-ascii?Q?a2th+3443XTj9DS3v2VjHME874k6odSvwiyg7RLHjzmzt5QVsWYIH8ZwMtdS?=
 =?us-ascii?Q?X6VM2bg9howHca8GpSWaUhUKyFYbtV14gmKABRI0zbTXidVnJY5CqPHl3jWS?=
 =?us-ascii?Q?f+UmX2peKSfz5mxS1wteaQVXhgC4PGS4g6vaCtvxxfjtJp39VqmLoItuciW0?=
 =?us-ascii?Q?G2rfg4qwhgyOLLIWFbyp9K4kjqZCtrO/q0EBPEGNgn/++oe8A7f1RL/06VcX?=
 =?us-ascii?Q?/hTPwHodmCou83N1x8Z2fQ5SFOvrsu+jzXnvSu7/Aovv10yFg87pH1digLpr?=
 =?us-ascii?Q?Rbn1XTK4f/mw7pG3DNh2Ppg9a0jhTn0DeT67fd8ipRM96/63xIhHqlYFnMKr?=
 =?us-ascii?Q?2ly1QPvtQQhdz5j0GazlubsVEtOvFMgvcwcH/K6NI2uJCNrfsrJR4SbzORvk?=
 =?us-ascii?Q?6umgJr9VU7tC2m1dxsTGV2mF1/+IRIj8NmmU3zzi/e7WggoRcDyNXOOJY7Xh?=
 =?us-ascii?Q?FuALykZb86JIxXqV6A3r/7FaI/FNAvT1MX+CJFIwBcTdnEaYDTap97pBuuRL?=
 =?us-ascii?Q?wZ4WYpigPHw1u1vo9yAys3OmbbtrjXsVysdOpBYc4tj11HbpJw+qt2XCIF2T?=
 =?us-ascii?Q?QF2UG2v2E8DacpZW2ISutZvxOygLAUI=3D?=
X-OriginatorOrg: methodpark.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ab0bd24e-1969-4d55-2c45-08da12284280
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6307.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 08:35:35.5960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eb611ac0-eafe-4516-ac14-6de964173ebb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Kiv1QDKCMIGpBvouW5UDsteIrDsai0p3LIhGzrJQ7o8qeHGZGAQ+SYBBBKmbnzkQnni8OsYPparHUhgPJXwg8PZH4PBP5ntejV/FAtVpVLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 08:35:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163775

Signed-off-by: Simon Kuhnle <simon.kuhnle@methodpark.de>
---
 scripts/contrib/convert-variable-renames.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/convert-variable-renames.py b/scripts/contrib/=
convert-variable-renames.py
index 856c001e11..eded90ca61 100755
--- a/scripts/contrib/convert-variable-renames.py
+++ b/scripts/contrib/convert-variable-renames.py
@@ -1,7 +1,7 @@
 #!/usr/bin/env python3
 #
 # Conversion script to rename variables to versions with improved terminol=
ogy.
-# Also highlights potentially problematic langage and removed variables.
+# Also highlights potentially problematic language and removed variables.
 #
 # Copyright (C) 2021 Richard Purdie
 # Copyright (C) 2022 Wind River Systems, Inc.
--=20
2.32.0


