Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.70])
 by mx.groups.io with SMTP id smtpd.web10.5041.1614666559297854262
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 22:29:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fzsIuxK8;
 spf=pass (domain: windriver.com, ip: 40.107.68.70, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZbWImIVbalbk7Q0TLM+XVdKQx6xtaTq+P263FnH2Uc61UgcJ/fQLqKqPmCHBOcWgLcr1ZSk1q42BjPHwWz5v6OY0CY+mI5DIw+87EIvZCHgb2HGaPMcnzHD4C/eAbs3vTPhouTWyNPglDm+Z6QGhWqLWkVl9RuoV7/ZMJ5GmPZma+Eo53qdlEotmKET5lcyUVq+zBGH+UDkYRyMVisEaefWqnNVxdFowuwOedKIDkryfN8TpzKRJM6WYPNxJwPgcwLHM3ZJj2ruS4TdoTFAqzfTTm2ebHgK06/kOKF3sp4iaONn2JVYRTuiH9uNCDPGyvF/1DtJCwJmxPDTaYi1Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgN2JA+1UeHnevaTR3OeCHJCAvyrJwIHz56hZejxOuc=;
 b=C55R3+MIwUvmI7FS5qvbKYU35Pw+DKmMb1NddbiWEidn1CNHz2jqU8tougtkjaOeMO4jDr8qlaL2Pqsdb28m4MMrC0d19O9e4a9/5Z6RtQbgbGhXXTea2OguKfrmWwFB9JK5WJNl3kuqt62yfw/692/gcoSZdjSTD9BLvmiynNX2Z+0FJW8HKcfBw+HuyBAVDRSTJgUUXchm5akbQvIhJqiiCdKIqePGIKpOWRuGd/vqhT6Uu7mEEiWIjUw5S5sXt7CSlr7FemetUTHnavRhnhiLeEGowI+axPNn0DtJ8b5g0eq3gCIDUVdd7Xw2cwX3TKXJEdtw/jXtKDjvTdXvsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgN2JA+1UeHnevaTR3OeCHJCAvyrJwIHz56hZejxOuc=;
 b=fzsIuxK8QqrgvO7BsyXrpknhqV8IKiMpxGyyr024312P26thfNihKo5461UAZxD9zXV88+t6v4vMyiq8A2c+g888VQxd40l2GvVa+3ip7nDiNwSlhIudToaRP6IrUSSHpQBbG3VAWIjSzfB61Q913uv+Jhvmgj4+NIPHPhOo1HM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB3216.namprd11.prod.outlook.com (2603:10b6:805:c1::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Tue, 2 Mar
 2021 06:28:56 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%9]) with mapi id 15.20.3890.028; Tue, 2 Mar 2021
 06:28:56 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core] cairo: Using the snapshot version instead of the stable release
Date: Tue,  2 Mar 2021 01:28:05 -0500
Message-ID: <20210302062805.9917-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: BL0PR02CA0112.namprd02.prod.outlook.com
 (2603:10b6:208:35::17) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by BL0PR02CA0112.namprd02.prod.outlook.com (2603:10b6:208:35::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Tue, 2 Mar 2021 06:28:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4465f8d6-7957-4808-627a-08d8dd4474e5
X-MS-TrafficTypeDiagnostic: SN6PR11MB3216:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3216C537B94B76BD45F7040C80999@SN6PR11MB3216.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	io3Z58FnoBo80TlxVSrobh9yR90ufnMN4wsQPCs8XJEMmPxNnd+FRN3jCeWampJStXak+Env9RVvHvTCYT6P/Yg8MKskir6NtaDrIpvONaFV310jui1iteddTjmqUtG48sHAk3jAOC1M1w7D95uKOc4kGeOZUXxJuzbjb7R+3vYlFfxf3TVZbH5OCI76fxxa7gS9YblwJqHup31AN8vBHaEKIxAv6DnsrTRKm0+fmTS6Ej+lE+Wd68TB66l5+uEuO6SF17SQaIxTEiGiiOCC+rK4p746wrKudH3v85ElEichdV16p/MycqkVWk4k0ojtIqW4SFwE6KmSwI1MXLzns0BruwEtcLIjzomu7/sXc0lZuzhYJw0RBiNDRhoKOnFl6OxWi97BtxEkqIB0u3iK3+ZPd3zWChNUOaAi7iWLCL0TM1nbaINghwFyouZIarAFdlfn6Z/ZZSKn6YiNxTAgQrriee7mcQ/fMctFE8Uj9lhz3gk3R2ZbCFTukI+B8fcepvWxVlM5i8N0eZmKB3kG4Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(366004)(136003)(39850400004)(8676002)(478600001)(2616005)(16526019)(26005)(8936002)(6666004)(4001150100001)(66476007)(36756003)(1076003)(6916009)(956004)(186003)(558084003)(6512007)(86362001)(6486002)(5660300002)(52116002)(66556008)(2906002)(6506007)(316002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?YB1DIBFD7aLUftdyO3+Xj+r+vy82133EdCFFcfzTtfvBPZ29yDDo+U22D4f9?=
 =?us-ascii?Q?YZt/7RgNb+et1exw42bOVAvoo+VL048QyC6R5JtH7VCnuQBzOxLPm7A4r5ff?=
 =?us-ascii?Q?l/n6mbZJ2TsZt8gDxC2waCgRub1NXKDxC8RFxR9YefpdrfyB7ciDY8iQ3i6H?=
 =?us-ascii?Q?o7NDgRehPp0V4UJ+3qFjuXUj6aJE/RtfLlMVTh8e1x7xQTDJuFSU/7H19f99?=
 =?us-ascii?Q?V5ncA2RrXEwpwFQhhsmymt446XDGhmJ8e9Yc4wj8wouwcE2zeC33cXqadrrr?=
 =?us-ascii?Q?LPvJZlzQlouOy1z5aXkihSw0S7NPjVktmrZ6r+AqPwk21ZtVXDGO786Y+FYX?=
 =?us-ascii?Q?zUwJW/7MSn6TotGKGZBSnxLBa4/7vc96dmmaZT+baUx0F4ZpVozDOrVsaYN+?=
 =?us-ascii?Q?/3hRX79tnlCAQ3IpLQ3A3JIjK1GjYH0tcQDSxhpSif57DslJaIA0vWrVqnMT?=
 =?us-ascii?Q?V+E9Bg5/AaN3zSs29J04AlV9GqWtu+NZ9DzJHN4fWKUy2taF18GJKJ4UjsKG?=
 =?us-ascii?Q?MKX0GjxYhiv850tkMTrfI4NSe3hbOi1w0JG6m3ldHCtNcIU9lxLPi+2rsaQ1?=
 =?us-ascii?Q?tgny6KkcxYda3yL6LJLBzHrXcVbdVEvLoYzIw1Ecy1GNlDJFteIwENL33OBz?=
 =?us-ascii?Q?N20agGy8YdWmuh+9difhPcypAoEDr7naHS+4P3MR9hyXbPTBwar0txAb+XMr?=
 =?us-ascii?Q?XFGiniyTKg8zN5PTZamZwRekjUHgXHFPMHrwI0NzuwWLA346ob7lPW9nC8k7?=
 =?us-ascii?Q?55fW6jTBG0uwNxgmhrnQfriZ3+u4wbNCfQenRAdDoVtqI03OlPEVFfFLCeiA?=
 =?us-ascii?Q?8jSYMQONlMG0dNlHvrsrRo4u2IqIQvGk3QY2y4T0/MWjIG5d1wD4Q0Wu4FHy?=
 =?us-ascii?Q?ex36DOTR1Q2msSuYqFn9y82z7Hwqa+qMeqy+Y+MjmVrTGcwA4TcPec6PmlIq?=
 =?us-ascii?Q?Py/AAhml+fmnm60S/4A+gxltETJJlsaDjmUcP99UCMSI0Hdlp+ATh4/Ki6xP?=
 =?us-ascii?Q?THXZOyPJOoRE70vntBUq1Ue1TREcPJS2TLoj5rDVtkHYCgM5gyksuINhdATK?=
 =?us-ascii?Q?w+laRxw/KmDX38IKwpSX25oZ/AsDf5mBbuonVjoQ0kc8m+7xLmwxjUz7etsP?=
 =?us-ascii?Q?6OWrOw5h+9AqCmGveWpoLpyP2f5bz5iMrrTDCQaWsJdtgnHnMCp+WwrJI4C3?=
 =?us-ascii?Q?7ynFtTZyDypeBcCGz1wxZxMH5RxyAk9dT4GtGoFrlxq5p1++yVPN55q8Nx4C?=
 =?us-ascii?Q?GcCfIzLToihyPmHckkGOXJ/Jes5P1PYv/aq0RlGz4ZsqP7jvmiEEumFYX2XN?=
 =?us-ascii?Q?1OatO3f5SNhJ5ANxu2T0WSNY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4465f8d6-7957-4808-627a-08d8dd4474e5
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 06:28:56.4079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /NUDwswoxfErR01Ysav+g4YjyrAcqgbYgiDpDltjJdA5oIPetyOm49UPkkcoISVkN3O9Z003edYszFey8CejxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3216
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain


Thoughts on if its acceptable for Yocto to use a snapshot release for cairo=
?

current version 1.16 was released on 2018-10-19

Archlinux uses 1.17.4
Linux From Scratch recommends 1.17.2

yifan


