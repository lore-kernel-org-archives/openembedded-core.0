Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.63])
 by mx.groups.io with SMTP id smtpd.web09.80773.1629439936146508183
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 23:12:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@synaptics.onmicrosoft.com header.s=selector2-synaptics-onmicrosoft-com header.b=GKlCuOM4;
 spf=pass (domain: synaptics.com, ip: 40.107.244.63, mailfrom: randy.li@synaptics.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Po11/83Z17zJTDuUrVHY2YzPUIbJwQEARju4JrxvTp4+d7y0SJHM68YPzeNzyYqBbMs1QpXvs3kSbSp250kuxrWLGroLzotYF8HPEGf9hzKobO2zzHjc2MyEr9BALZ+TnyeHAUvRcD0xLYq2qBUGhzenimayHVei6oMIsTSh3LaFH/njcCylPK3PkvJd2oN/VjdJBbg7P3zjRSzXymwG17xIAins8aNGrLgNhOTK7Zs9ozIRcnarWJzdAd0+OhlDv2S+oa0+9ML2y7ijIeqFXbM0ecCt7a9IzyD4/uKJ1WNtn2MmCMtmrAUJ40JQpLaFlE/m6jCs8BkRWrlIjT13Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mY8PLbZkdlXGJb7MiXLhojiTPG3x1HNMHfuIGRbfeRk=;
 b=ocg6Vd9vQqQ+aCiRDI30oWQwSv+dR3TOuppVK528OGPcE1I5J9tVartb8rVNcLZQz0siC6Nazu7a40HeaUdGr52tgI7Smxk65POIRycdAkAZVAaU+6CEeUWB7dw2/x0/TFqDufX7Gp9THto7c639C6OmFxbZDNwFGxL23MmJROSpcIPIbSP1rsRIPhH4Ns92m8Yvocjc2vkhp5FHuqC7tzbboM3t8IJtkQrYR0wwEGYEJ58ROpBTgLjxfJ7fHCS4fkk2KQ9+P5LAIv2xQ4I+EQFOHq4Y7rH5OYbKgpPKZJqkr4GEQC73/S2Crha2kWtQDX0nqv9UtHsu2kv5xMz2Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mY8PLbZkdlXGJb7MiXLhojiTPG3x1HNMHfuIGRbfeRk=;
 b=GKlCuOM41XQ69ozungl5PbvGE5ky/FgnfBBcJmiEiGEO/FjH2D6ynSvd8BC/YsKBFSTZ1W1nL4ISl+Z1/Khr547R49t8a6zWOkk3d5uTWFgHJJOXZ2VDCp7TR6RarEODN234znTr5q3GO3XE0Q6gKEQR63zXuDPRm26MOVZ87ZM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by DM6PR03MB4667.namprd03.prod.outlook.com (2603:10b6:5:181::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.22; Fri, 20 Aug
 2021 06:12:14 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::f093:dd49:947a:f1f7]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::f093:dd49:947a:f1f7%3]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 06:12:14 +0000
From: randy.li@synaptics.com
To: openembedded-core@lists.openembedded.org
CC: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
Subject: [PATCH 0/2] support building for Android target
Date: Fri, 20 Aug 2021 14:11:48 +0800
Message-ID: <20210820061150.146518-1-randy.li@synaptics.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: SJ0PR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::23) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
Return-Path: randy.li@synaptics.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from randy-t14s.synaptics.com (192.147.44.15) by SJ0PR05CA0048.namprd05.prod.outlook.com (2603:10b6:a03:33f::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.6 via Frontend Transport; Fri, 20 Aug 2021 06:12:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 430fd940-a6a8-43eb-777f-08d963a17427
X-MS-TrafficTypeDiagnostic: DM6PR03MB4667:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR03MB4667F989213DB7FE739DF6FE86C19@DM6PR03MB4667.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ay4kDl6e2xRjEpYh3Uf5o/scckTQS0wjUjUo9472KDFdEXeB8VapHRKGzVtQlyYwu+eK4NTY/B0uoRt4jzaI7EYX0CYSu86/v6zxPCmZoaTqc2F02WLl5CSbGTdhWkk6kNLfAmL/eajHTt5OmTtDuC/Z3a99nK7O3Jpq7Vp22y1UaTPnixuNEbQx0OEupBHVQL0Gz5dfQoUCSrQXUbOeoVtbnA74QPM5mzXtaYB+DInK+BZ0LrnUDIm+J0UxPiAmC2j4GCMDXVnU0LC8y+DDFc0V6dW3QL4F0M02kWESLkoSvh6RJFikvwBYlt5IjouwFtjToIDlUv8K8M8rcB4RuP0r71nHQ7M7L989uijhtXovS2NobtQuH5lyjMI9viesd6NBrTKOHZ5OZwWeuJrFWEyH5F7pB7+99KoYv+ppFrggL3ggSHpyGjDoo5DMRCskz6JfBpQwHWQtP1eTMBo9ks+lrV06Tykc2XRy+aKhS+gfTsBov5ddF9vGx6D0ERH8ONWkS/jrrDEUR3Xjo9VDRJcqeWgIBq8NnAMkadzVB5P2fI1+f0NUVerXUjeuEQOz9i4oKBjvLedCBw4STj5AcYcnHAjEdrlCEK44bX8dySihPAtflcDxD6afajl/EwkjjRap6kJS2Q1Gk3YEkqSMgAVsQHE1/msAjBoccew+xCRmlRno0/PgHGMyNwR8i4OCKUBSQkCFOSQ/d35IwySFnA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(136003)(396003)(366004)(39850400004)(52116002)(478600001)(2906002)(6666004)(2616005)(7696005)(186003)(66556008)(26005)(66946007)(6486002)(66476007)(86362001)(38100700002)(956004)(38350700002)(316002)(5660300002)(1076003)(36756003)(8936002)(83380400001)(4326008)(4744005)(107886003)(6916009)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5EXmJnV1xYKM38OkRb3XD9p2C7VJfQvG3+9LUsdQcQiFH8nGEQ42rgeFcxhD?=
 =?us-ascii?Q?+NFHJBi7gZJWpJIFwI0uBw/17o3SbZO0+pKo0MotLPajPVYXrGHy4dzNviR7?=
 =?us-ascii?Q?jYEshuQEnzzC6gdCe3qwEqnAnNC37ZD+8oahSCreZGP4oMWkKQF7+NDnVSoT?=
 =?us-ascii?Q?iTPusskckvAHqzK381P/H2JyuSVRX5tgyHNxyEm2wNWjMLAWNbVGBDhNdOpc?=
 =?us-ascii?Q?03D+qu+mUDE1DL3Z9KEUIHMKRluDwNUsOPt6nYpfMEcjPJ48Y/U9Vc86YCnn?=
 =?us-ascii?Q?lLDgbMgFAP3ckdfcFrCMgloKtx6YIvtr6KVgCmBP3NZwZ594AZsb0LjqyL7S?=
 =?us-ascii?Q?w9hhqv427kVU1HpHgG+jSR4msBBx8Mn//ZX8YpBuEvewbY/V6VgwUdjmSYsv?=
 =?us-ascii?Q?Cna2d344VY+ozPqZFWYfeTlRo22YnfrcwL6YApR453ZJwTXLRJSPvtwBZv0A?=
 =?us-ascii?Q?vDaej2rvciNXGKs4HzASlTagle8gaScs3dnTcEDBVR63F5iGrTDcIKiBMAd5?=
 =?us-ascii?Q?NhJDbnxe/m/Uu6kZieSGeEDzKdE4c2R1b2KhejQ3KLTy+RM0t9ITM74xwRlG?=
 =?us-ascii?Q?mpb8wQzu4/6DYq2DNrfq+J5QFcu2ZLL0ZDxrvqnAyinmVCOGTXsFr3Hsh/kt?=
 =?us-ascii?Q?NTkaLENIEzXREuYAZQioyX6tn+KOYlR2VMVq6kvD6oU14dfqEnReQt8AudSs?=
 =?us-ascii?Q?siP3zqRPfDRwY4FB9E+0g/jEPhuPrB5NLp8ajBvCq5F6cbmdMzMnJTCjcyk/?=
 =?us-ascii?Q?MguiCkVhpJ/u1Ur14NYfgFtOAiq55P34s669WECUhD6l4/YoKY+KzTNTNGBX?=
 =?us-ascii?Q?vbjXqBEzjgkyJ4Pl6kdr/85rCP9VzGWQuiK5x6dvDFGXkDh7ZBo937eH9fq8?=
 =?us-ascii?Q?4tlgPuT8CAMcIJO90/UWtMirEunNzfleuLgi1+/hF81dvF7xtZd48kyTYH/e?=
 =?us-ascii?Q?SZy76Tw+9yU07tiFd3pikLXY8v9uiV8yn3huteDM2Z+ES46h+k52OYoNESuz?=
 =?us-ascii?Q?ZY7VwE/23ewKYJ+7xBuzxJwJS9ToPERK+uHpoZ7dj/C+elf26gJYH3pP6Lg9?=
 =?us-ascii?Q?ttNjqGvFuh6yXJGiLRBG/1VCfzMMJbJFFMXWOLuH8aNqQxSId60W9fv1rJWi?=
 =?us-ascii?Q?XRiW6Zg8ceWcqu83kHoEpp7JWYWvUxZoxmChzd4mJpJyL1My+QcgPI75EdqL?=
 =?us-ascii?Q?6EYpeu1pE9eRxUXChqiZuq5dQ6l0Vvoc76T5ujbFuQTjZC95Eu1s2QxvL+M1?=
 =?us-ascii?Q?UWGAJDbj6DPbUeM7b4nvjr8kiYy9D4CSR6s1gPMz5MHiAhLoe0P4SfX0kE94?=
 =?us-ascii?Q?MetwEL0HCeNSAoYt4bKa2ZmM?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 430fd940-a6a8-43eb-777f-08d963a17427
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 06:12:14.2320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Is8VT34YACNQh7bm+u3joOCu8MRmQfTwSBky2LpHnwbdxYkovHfRBS1CqlMLOHfCH9xFIGbQkcIRCo8DyybuLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4667
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>

You may check the meta-android-ndk I posted to the -devel
list before.

Hsia-Jun Li (2):
  cross-canadian: skip it for Android bionic
  machine_dict: Add Android OS to it

 meta/classes/cross-canadian.bbclass | 2 +-
 meta/lib/oe/elf.py                  | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

--=20
2.7.4

