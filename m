Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.55])
 by mx.groups.io with SMTP id smtpd.web09.1477.1614825591783089365
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 18:39:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=S6hgnvWb;
 spf=pass (domain: windriver.com, ip: 40.107.93.55, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COc0zST0dPU7AdCO5qibjPxJt6j9x2+YIELfKMHMnkQ36rN7tzX6Nsyu6t7m8U15r/e+tEldQdR5PrN8ncQxRncSdaBdAkSjGOYCZfL1K2vMCeO3zStJJzaakVQ1tJmbQZRKanXRnrg2xBYgckANuyHra8eus0rKUitWfJZHX2/94L1l8sPJT4itOhwrb58N2qqFKCel0wJZ7gbd9nLSEI9RcYjD8EbMIIUrCQtgb0/uG/mswvMNSTgZIl5tC0BuQ2ESR/FcAK2ELbeVCiYj+p1j+3jRt+nzT2lCtARmo+2hH1rsXbek0aswUp6bdMIHs0XDN3Ht2t6QweOTXx9IQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwCZSlXLIxcFBgmFG72SXoYLQCEK4kXyUCNU9dfZRvg=;
 b=gPn6jQQ+a+9vlZrE6WvgmQJg/3dUj0LgUnh8uVRmNEqeDvikSh/rz+XSSt13dbvkAYkU3mjXAcw6C34kbop7lcFY0OTgzhwDQnvqa25wmqjvvlYOh085S/5Af2or9d6mdZUC9EcKggBe5kyIyrBF8oMaD0ZQUh/ua0qqeQlcNG6ie7+aamQJ3EkwVCbxdkZVO7TmxTbvIOeYGJAPQPJfx3MJ2bHJUVaua5Nz6KjTf/cK2ifSjTvZOxlr+leSZW3iUFfKPixrZU7sXL8nOaROktx2pYjxMH0Yv6NRHBE8+hOwDcHOsrDPzfSzC2hTxQZLf1/Amu8wBmknrqS/kvZpUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwCZSlXLIxcFBgmFG72SXoYLQCEK4kXyUCNU9dfZRvg=;
 b=S6hgnvWb7athsIz8c8poPrirXpufkLr/N+dkH5kDPT6QPXH8CkpqiTQ6kt7y6fOjI4OuemdIQAqMXfzt7DCiTXZ9KBLY4SK3Um3b/zY7ResmYoVlGwS9GB2mx19nWFlpN16ea0m06bhVu+f/kGWJL+xeOBDmYOqTPUkynDpotl0=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BYAPR11MB3031.namprd11.prod.outlook.com (2603:10b6:a03:8d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Thu, 4 Mar
 2021 02:39:49 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::95a3:653e:2078:fb4]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::95a3:653e:2078:fb4%6]) with mapi id 15.20.3912.021; Thu, 4 Mar 2021
 02:39:49 +0000
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: bruce.ashfield@gmail.com
CC: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] lttng-tools: upgrade 2.12.2->2.12.3
Date: Thu,  4 Mar 2021 10:39:35 +0800
Message-ID: <20210304023935.30856-1-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0023.apcprd03.prod.outlook.com
 (2603:1096:203:c9::10) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp1.wrs.com (60.247.85.82) by HKAPR03CA0023.apcprd03.prod.outlook.com (2603:1096:203:c9::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.14 via Frontend Transport; Thu, 4 Mar 2021 02:39:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00bba198-6480-42f7-ff1a-08d8deb6c7a1
X-MS-TrafficTypeDiagnostic: BYAPR11MB3031:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB303111DD528DC38152B4BB89E4979@BYAPR11MB3031.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KUIqy2Rwh+03QdBk/HJJVxaC595A0CM9jgwrha7bo6D9B2KC6anZb0Jz65/RqrnKz2Lxl0I54dhGFvdtqpxrEUZgfOzNxvclMBMZ2rTXX3FrDhRCDJhi9ynLkX0q0sj2Cb0iLPtiirH/AXWXOKCb1oG8WRn8hJaRGu0zSH0pcBKGAmlZWHyNLvGTna4UOTxCXIy4dbWCzZMj45cL+4SIzyhvTYSuyoRdKMA2Yxnqd3N140fjhjDCRXx3toa2IurGx1cVgjlptPQ39SnPbjgMgBHEJLEncymQenrf0CvPiYdszbz+tJ5h3fva+fXbRKMgcLl7kLnH2bkx4SLL5QAhDJstK+WHmOm3BXhWxNGTBqGNqNkRoVzv85mjLocQGhtc0Hap1QXFo7I773vCH/jKG7hhexN9yKi3JtieVx1JWAWu8u5Nv1OUndICMJgw+YRAuuzdXijHkC6zpFWCvFMVN32bLSVOYo+e6yhSSX8yFMXuGgU439t33SpfZtng3Rzocu+DIkt73ddze/ZUaQeg4yIa+lq10FPNfEtxpoKIxQ7aIoAoXDGrBJpzKlmMddYdvl1ssVr5W7shbrMEwV1E7to5P4LS8JF5ls2dQnaUytg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(366004)(396003)(39850400004)(956004)(4326008)(6506007)(8676002)(66556008)(16526019)(186003)(83380400001)(8936002)(26005)(36756003)(5660300002)(316002)(6666004)(2616005)(6916009)(1076003)(66946007)(9686003)(2906002)(6512007)(66476007)(52116002)(478600001)(6486002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?HYgtYsY3I9Z3cJm3uQeC7nwxsEqJ0coQUdieck0YoA/qwkvYQbo5/ptuVp3E?=
 =?us-ascii?Q?B9ode2Hci9Z/Gu8YW2ElsIWbD1M2I/EvKqZsAER8ZXRR8/rV6kaO9Ls35qeC?=
 =?us-ascii?Q?4B9Vu1rG/FL2iz1Xsce3NDplt7qEypLkDgPuIXU2PAQVZ7EHqiWokBZr5Tkp?=
 =?us-ascii?Q?Bz7IJJF1roSYybUTfLMAVPqBRfvf4IrFhpcKRPRubJ9chLg0u3p8KUjQ9Bij?=
 =?us-ascii?Q?ZZgphV4wJxW2ccXRNgBnIiXtx4xS5L0XLD+2dT5xWNfMFsqBSqZNaFeSVI8v?=
 =?us-ascii?Q?rDxcVJllSOThdhAbvm4Lq7iF/VnmlXRGyjssMv2R5tZHluaCTzTnC0AKbYU/?=
 =?us-ascii?Q?3h9ZZXvUlfyivZ20pQLkCqqAuoyJBCBOvmsbabZvoCVzeqktkk163fOaQpNL?=
 =?us-ascii?Q?Fn42Edwi46LoEB2POwS4wdMoJkT5f+GxejgAnN9tHiNztqGX3CggZoVaBeYN?=
 =?us-ascii?Q?LCF0MNyS4REgo70jutXSpdwcNhedG5W8/IDltZngqEAJ80CA98BJsm4EM7xy?=
 =?us-ascii?Q?ULPJxEcWKyMOCHag3O/3Z7cEKz/4mfa7e6MGAF5maBYG7Y3JExZHqRe2RO8Q?=
 =?us-ascii?Q?r+pAvtaBE6xiaL1OfUvK0vhFnVENYO9KSIVz+yEmmhLVPOYep1rAYsXhiyXe?=
 =?us-ascii?Q?XlzjVq54UVXC1H0Xx1wJT4XeSmB1Jtj0ijPZaNkt+2sGbwDcV7PkNE3y+Xq7?=
 =?us-ascii?Q?MHQtG2VmnT0EfEASYT1cnF6KUeIDhWZfbrMsfrmRVzSlreG7vZ0m8wMnCC+D?=
 =?us-ascii?Q?rrLHtPexpBn85vcBoshYDlk82Hp0VhWIh9u5uefg0dOywk7VD1C65tAW6wOR?=
 =?us-ascii?Q?UdAouGFrcvYU6n7+J4djWoEQYDb2aHBFGN/NjSPeyV39gdaKq/zGPumnFmLX?=
 =?us-ascii?Q?+KqD2BwOShuHyMxfrXaBaK2D1+zuJktZeRcUknJo9jSnNPYo85L8rxNcMoUx?=
 =?us-ascii?Q?nETv2kaGop4+7W1Gzk+Fo077u0iimv0Mqtdo3mLLHA9gpSekJX9sx5Tztz5h?=
 =?us-ascii?Q?JjOElVjKSBRxYpK2B7aENWTftVlozbDTnPUK8LnrE6bNWQ2x8Jjr3UuOTvQQ?=
 =?us-ascii?Q?y65nthpqQJ0Jpz5VMbUP31ji1IvgO7iitqdb1FWjCH8JRXAmG1+oFhBm33Rv?=
 =?us-ascii?Q?uePYwojJleGp+k0ud7VBXvRonk0j3pAkSnfsY/DIJWUxEjJxhery0Nj06JMH?=
 =?us-ascii?Q?h+dp9sRHVxleeN/tsHBn8NuYhiN4ycDRncAV85oq/aqlHt07gwBwMexzkHEO?=
 =?us-ascii?Q?yGg4wJtxHaOlCBQp3FJNUXLb6iDeA4NYtfTlyQxNe6f0pW5zNqmffsMVht6o?=
 =?us-ascii?Q?r3L2K+xXhKu2U0y0HmbQgfbi?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00bba198-6480-42f7-ff1a-08d8deb6c7a1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4241.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 02:39:49.2029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9UB+gf5v/AIQV6EENPAngR228r6g1RA8jLk9Ul6+hN/Ja0zvRA7hRCbnN1iyuU3qdMx9ZicVsX+ozcB/TARfxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3031
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Yanfei Xu <yanfei.xu@windriver.com>

This is a bug fix release. Meanwhile, this upgrade will solve a
lttng-tools testcase failure that test_notification_kernel hangs
with linux-yocto-dev.

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

