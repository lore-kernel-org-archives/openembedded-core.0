Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19007.1792661691929440204
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 02:34:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ACmR5FZH;
 spf=pass (domain: est.tech, ip: 52.101.84.56, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kzFkWGMqslTI+AzG8Uh5sefI0u8UzMCJLtKq2kjRz1KmU4KO8iVDAK/yJIMbSk7BGXU6JqzgcuKLmEHCvfNAp6VGbuwU3MCsLZfUyKqmshKe1RIZM2R/17j4/TW7ibm3gjTHWj6E7eQQJAnLL+7iLCRzkxxorFbZGzX4OUQCSwUixdJWEghR4muIaV65+zweBG4cvRk4w5N/njpCzIkpWtjWVDoZQ1AXzCecNVJ1A15utKWU14DpQCBXa3QIBX672bg5FA8oCo3TimUX5evEHIVUGtURuwPftkRzVnGzzjFy0bLrYU1Pl7qy6hdeh0aE1dU4SWPcGz9DadhAX2v0jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LT3eRipFFnzf0MBZVx4sQbLi6qQ7847axKsRRdScgkM=;
 b=trDB52FULxshWCel/jaihKuszD6sTWMUGzysd1UZzqfxtOelcZO7+0Zg0S3Hcu1fzAKpdQzHlwfsGBKBY1uaEQaHy9dc8cxngE4hmZx/ciQtjsdHI1GxWqO6dKJPv52a5vW52LVtShxtpSw7JdsH+wW5VkYszu0xQzi/trVP/QsuPfgrwGuAG9SpyIP2aWVYC65hfnp+1m/VVTy1WDnTg0AKRt/IaI6UThxhBQzZlTlrFdDZTx1kLc2e91ebqL+VauLH3g+M6ydkbJn8lLLPlkvLiacck0YSlBml1IYHcCVT+UbXkpIEJXZe8AYOcsbAg3touihoDcoD3GRBWUr33w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LT3eRipFFnzf0MBZVx4sQbLi6qQ7847axKsRRdScgkM=;
 b=ACmR5FZH6ZnmoY8aubg4M+t1I2z9H1dof0fYOouYlqfqRilg/MoACKboCFaqGGiaNOHuQAjVAEevQIpxEkYsxJ1m+sY3AhVHHo9P4i2rxkV08rb3lSdLj8KD98sQQxXIDSCsIhEztuo4PbsRsUjgnKihlHGC+ZrSWXYsKeXdRcnm58yQG3EXw+9YoPbrR/FhcJNdEZxbMK1ApDqt4BvHWk7Vj5ut0uQteLDLiRrtl0KIk+IrqSZ5FXT77PV2lX7R7at18j42ISYRHjvsMRY5DPdU5DhKoRkbn1PppYvovijSIsJ5vNb/uH8YZdli1IM4YsELbv5cZGXHrHlVkpI0Zg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM0P189MB0706.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:1a2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Thu, 22 Oct
 2026 09:34:47 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 09:34:47 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] Upgrades on  22 Oct 2026
Date: Thu, 22 Oct 2026 11:34:40 +0200
Message-ID: <20261022093445.66335-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0103.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::15) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM0P189MB0706:EE_
X-MS-Office365-Filtering-Correlation-Id: 403957c8-b8a4-46f4-ece0-08df301fb66b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|18002099003|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261009221227099003|10067099003;
X-Microsoft-Antispam-Message-Info: cCA1oFBEKWI5Xpz8kb2ShX1RgXb6/6jYDI3vuRLBGHQe4XtN8mu4a1mh1PDyyks5d1THeNUuz7AWoJZHuSuAXunRqfYCO5m0c1uRoOY/iMqTkXeQPeQFWm+SVBlTmwPeVoofWkGeKQrlIVlBYe+OYVNsVQoXjNY5J9htrrDVsqVcgfFoUxGXfBlBFyNRu1IeEtGbDFoaM0ZJUiciKNgS79fcP0QnkhXvQp5fCc1ooKjdi3EJ5qvTRDFeDv5PbcbHkVdvrYcYP0hBAduHM01VlmIKTODy0R8HbEIcqYCHjmswrBboTy56aUXNNX+uFjZMz5CPf/AKFsFowK992h5oFwH1RU82dGQq6QZOuj8mTi+LTlzcUYMgvOgGoubr5LcovE1h6/FvXyMxZgwRRdx3tBPgSeZ7zDDjo/glc6ctZdZ+Bas73zoB+o8eVSt7nl5AO187rnxuHKDD9bFIIITXfTQHvaWN1Yc7mePomuO8TRqdR3Z0s8pGlxeFVlSolftj6D8mixxYUcuI/mMBOvRvALAcRdkulSWrs/ZOrBfo2hxP/Leuaz57jK6mjtrnsncKPUdQh0xIgQLXqm0v1/jqX+ktMV4lIRjzl+t2+S6hsCoCaEOcy+rHhYcjg3OI3GIe28BYbskbmDWUNoOKIrYVcB3vouEcBRt1tUMdIBRgxOQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(18002099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261009221227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r6TcEp2AYXBz2UoDWSkoaEYUQrzxK8AsTHK4wUesWcwF708rT7oD0VCdiVqd?=
 =?us-ascii?Q?O5m1aTiuklUWPDRXNg8uVVnAUIJtMkAOEBuYs/O7a4L37rdtlDPwqeOo1+CD?=
 =?us-ascii?Q?RD3oaDc5M9OdK61FOY3GMzT/kV29nXK/m61kRkT9SXipy0I5CIa71CYnIAgI?=
 =?us-ascii?Q?jErQCBZs7Cmri8bWskgOTGzDG9nRt2k6yvRq2bTJWLeCKZaf1eBIvV6Ua9ru?=
 =?us-ascii?Q?0CceptAR2xcbNryuqxh4Jz8NS+EaoCz8p42fM/gNyHwmFhvKWsmpMnbWfOuz?=
 =?us-ascii?Q?PE1gVDAmrkKSbLImB8YTWJXAGNEQkgt9N2xBkHicWtvB/dX+7XRM7iBtShDK?=
 =?us-ascii?Q?tRDaVi08ZPpg3g4atknQH4DQJmVTE2a376ZuuUt4uBLdLGfFed32cCmyn/RG?=
 =?us-ascii?Q?94AA6hqf5X/c2Hx+gw1+PkBqaSPjSQoW0yvZd7KQ0xKGEizf4526H8CjPzJL?=
 =?us-ascii?Q?CRZ3Dc4yNB/9Xl0XreKzI9QrB3FJY/pE8vR9c/6I4Jf2SlQq9OZ+e9Sl7AQ9?=
 =?us-ascii?Q?AZz/I2p9j3God8TF8znoOMPseqE5sr0D+m10AJd530lSQe4MEvn4B8Q3ZTRr?=
 =?us-ascii?Q?aQvvl0uqtZOM7YN8HnWyGJEJH8X0vlwLc0OIwqdG+N7p+CqpdnrFTXVztYxp?=
 =?us-ascii?Q?ssRFm2VcPX4qdeuue1KQef06wFRrz+1xCF/xFIhpUSVx3768UWKS3d+ODXus?=
 =?us-ascii?Q?DhD6JaG31QpFrkXYmkGkIoIAbsr85zHKdfMtB4Fc1yWX0Mce7+zkkav/29B0?=
 =?us-ascii?Q?6cuxFBmFIUg5U/NGxnW2j5SBSwrrr695Ytoz+FxWuLfUOi4fdp/gUcoU8AcC?=
 =?us-ascii?Q?RlTEVa6sCWlj+WqL6LcoklVlMX5E9Lim1KylfqpLT+G5JD6I3hzoyfl08yeH?=
 =?us-ascii?Q?G8Eu9xCSoDZC/H/k6ZHDHvzl06B5WkdvHYmMILnvreLKkSVm936atezFDkFy?=
 =?us-ascii?Q?+Fz1IdfGvJQ/852Xb+hk5Rnl0y4mQPiHmAFNc+GsQ2tXQVIEkK47AZtSErIc?=
 =?us-ascii?Q?DtYo3avPnEg98O9nJu4UyLS3CF46PGqIhHiM2U79UI30FLYx+Ydzwgsa9ebI?=
 =?us-ascii?Q?b8iduGjSEC2im5SRQLDapHd5mQtCiJjsPqx3E0zn+ZPzHhXULk5E1DFSgBcV?=
 =?us-ascii?Q?6yTb4M0+0O0dE2KBrJvUTBNtOGVqmixDUzdgi55Jkn7Vl/nQXnkyoh6Mucyn?=
 =?us-ascii?Q?gvnQH1vKBh4p5QV+VgpLaJ74vJPeFgpqGjSxVRwauXeOACaRArG4l4EmwZxT?=
 =?us-ascii?Q?SAgLzCBiqubL7Bx0S6UZjU5/9qHYbE0kV261sWakpRkVUYxVErwVq/iNXPrH?=
 =?us-ascii?Q?VW19VCHtIzYOFht5mIK055XbPS4i2cJbacL3HkqLvBFTWBIjOVlyFudPn00W?=
 =?us-ascii?Q?f+Mqq15HJjAvXv4gZVYFEoMR88gB9IXhjpO3z+n6J0rU7TqYO+5hc3xOnh9P?=
 =?us-ascii?Q?aa7hYyxWFkyak9VnGiBabh8bqg2pfr6o6JOfjOzeYAD1IqJ4vrakTGf9y671?=
 =?us-ascii?Q?ssfRq0BnLvkyq1xHrGF6h1DsUPzbAL/o7Q/6CQfRHDSaEzC+wevd6ycvUXLT?=
 =?us-ascii?Q?m+uLFGGtgfX/XvbWsgkNy79S3gDoWtNJeHuCg/n7fanLInEgbSAVaw0sfsri?=
 =?us-ascii?Q?gRqMoHQx7zgkOCTjFXfTa/geOREIrBlasQNj65p35G7jZxIzuhytHGTgX29p?=
 =?us-ascii?Q?pdhIhzvKOlySzSuqq9fRYgHlfVFjX2SiL/n8PQ//Y87VR//LVVoV99+ygSKY?=
 =?us-ascii?Q?Gsw5vaJZUg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 403957c8-b8a4-46f4-ece0-08df301fb66b
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 09:34:47.5122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VF0HMIUf+D1kjbvaL+Tfwt42c/EPMccAvpTZMkwIvU3jrvTC2+BV6eryxAI+e/CNuGgrFZ0miARrfxUYS7PbW9QRxgTVJueiTLvhjJGTjAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P189MB0706
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 09:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248426
Content-Type: text/plain; charset="utf-8"

Jaipaul Cheernam (4):
  libtracefs: upgrade 1.8.3 -> 1.8.4
  bind: upgrade 9.20.29 -> 9.20.30
  libtraceevent: upgrade 1.9.0 -> 1.9.1
  python3-zipp: upgrade 4.1.0 -> 4.1.2

Upgrade Helper (1):
  python3-uv-build: upgrade 0.13.0 -> 0.13.5

 ...1-avoid-start-failure-with-bind-user.patch |   2 +-
 ...kport-ax_prog_cc_for_build.m4-macros.patch |   2 +-
 ...d-V-and-start-log-hide-build-options.patch |   4 +-
 ...ching-for-json-headers-searches-sysr.patch |   4 +-
 .../recipes-connectivity/bind/bind/conf.patch |   2 +-
 ...t.d-add-support-for-read-only-rootfs.patch |   2 +-
 .../bind/make-etc-initd-bind-stop-work.patch  |   2 +-
 .../bind/{bind_9.20.29.bb =3D> bind_9.20.30.bb} |   2 +-
 .../python/python3-uv-build-crates.inc        | 120 ++++++++----------
 ...d_0.13.0.bb =3D> python3-uv-build_0.13.5.bb} |   2 +-
 ...n3-zipp_4.1.0.bb =3D> python3-zipp_4.1.2.bb} |   2 +-
 ...eevent_1.9.0.bb =3D> libtraceevent_1.9.1.bb} |   2 +-
 ...ibtracefs_1.8.3.bb =3D> libtracefs_1.8.4.bb} |   2 +-
 13 files changed, 66 insertions(+), 82 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.29.bb =3D> bind_9.20.30.b=
b} (97%)
 rename meta/recipes-devtools/python/{python3-uv-build_0.13.0.bb =3D> pytho=
n3-uv-build_0.13.5.bb} (92%)
 rename meta/recipes-devtools/python/{python3-zipp_4.1.0.bb =3D> python3-zi=
pp_4.1.2.bb} (83%)
 rename meta/recipes-kernel/libtraceevent/{libtraceevent_1.9.0.bb =3D> libt=
raceevent_1.9.1.bb} (93%)
 rename meta/recipes-kernel/libtracefs/{libtracefs_1.8.3.bb =3D> libtracefs=
_1.8.4.bb} (93%)

