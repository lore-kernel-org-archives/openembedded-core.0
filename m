Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.88])
 by mx.groups.io with SMTP id smtpd.web08.10456.1619717194582059142
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 10:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=n4rDo71B;
 spf=pass (domain: windriver.com, ip: 40.107.92.88, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTKH33nC/bJSkuh3O3bf2ao4/oP6q9dUUoP3HRgcVi8AiM7wftKxXemrk/mCrn8UN3IEIXqiBF9449ItFiR/cIcOXvTXyObHeRpZziK9boUfR4po9LiUWr/Y23zA1crLvC7QQbt7rU0DzGyTeYPQzGmruBAZNmfnEp9WebxiVCaSFf1fAwr0VnR0N6onIRoa/8W+qlglomL84abIFdXCeM4fXZLeeRmFQwlyliN6CJcQ97rpQFi9YaH1n71tw3gy/DMeQP79qZhnQjnJj3FP25l9hS/LxkaGfEoj0r+jq8+K6LLA1hytGwEz+Vto+T/JRGQw7o4hlJW6q+Di6dOz8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sea9n0iaDkEBEFcyAdcARuylNOSKl6mcmFsOzJKGCoM=;
 b=HWYhrnIKwigbjeQ6t6jO45YSXUwh/9lywKZbAzEM2KJ+BkpWreXJ/V0Z40jvXqz5u+oqg3HhS3Jz8J8I0TJVxiR3psVOADOkr15nfy0mzD1gIWzqFoq1omSxWYP4ZtIDrtH/L0JBFXCjntfn6cxxDf2wro9Lyp+Y47jfG4vYbFyaqzI5pCuNsAnKgoICACRCMBGxhFzLwydCbMxzxEWPvHPR7rR11roWajomKFDNzXTS4JHk8IbMlmAxOOTkDI7QWWkX+YKeH/lGtv/ufkWTL0EHkYX1/V4cmDUrkR8SlvhVzI8UZykCHWKyaL4feDKTd91W1UvcvqolFEeGoEBMOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sea9n0iaDkEBEFcyAdcARuylNOSKl6mcmFsOzJKGCoM=;
 b=n4rDo71BQasr6njKuBCh7NdRUkR3kzmkVICq/8rDUxvRra05/YZy3og2NQSIhWYOiCAfNr/ryZuMdMLxeNIphZPsLO5qN5lJHkRiAyapJqoamRfHmYOwIs6gknND0diV0/xQCunWRYIt0IdTdHk4QsT+ZBzy5WXqi/TK3VFZGiA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1999.namprd11.prod.outlook.com (2603:10b6:300:20::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25; Thu, 29 Apr
 2021 17:26:32 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7%6]) with mapi id 15.20.4065.027; Thu, 29 Apr 2021
 17:26:32 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
CC: naveen.kumar.saini@intel.com,
	liezhi.yang@windriver.com
Subject: [PATCH] tbb: Disable PPC as COMPATIBLE_MACHINE
Date: Thu, 29 Apr 2021 10:25:09 -0700
Message-ID: <20210429172509.2611258-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR12CA0048.namprd12.prod.outlook.com
 (2603:10b6:301:2::34) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from soho-swold-l2.corp.ad.wrs.com (71.238.119.71) by MWHPR12CA0048.namprd12.prod.outlook.com (2603:10b6:301:2::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend Transport; Thu, 29 Apr 2021 17:26:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a5d5a89-3588-4896-56db-08d90b33ee69
X-MS-TrafficTypeDiagnostic: MWHPR11MB1999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB199916D3FFAB0BF412EC15A8EE5F9@MWHPR11MB1999.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1d8r9HNeW7m5EaummvxtiMUJ7InDLO1Q3YB3538806FPVSI+vhdcl59pFfKtH6KcttbkBPDlqWV1lDhI/Uoh3YxLkj2kQVC63fNk6rZl0fuqqp4RTrRff1XYk8+MfEGgg6UC0CR5N5NzmHAMlwaiB20MueBROLV7JR3+6iFuMhhQLxCr5KmmahvKLpoyyXiSwpcWC232dKF8viILDofC9YJNmGAhU7edD4sKNMqaJPeGPXebZbZyXUYhY1+SY1ARKvp9WeRw+rvdaukq3nleBUY7jy+j89BD9tf4cemWQvcmoXqTmcsnTe1+oozxVLRgX4D81wEZSq3IzYhCu+wgiIGwcGiM4k0dKW20rTkhPiQs1INHSSGTmEEEZFjTEUnmsh9P4TTamFTHzj7q8PDGJsj1H8pOV7Uh/kN2izKSncStZ2KBLxS7xLfMkCMJNxqaTnoWbX7+FJgSZJN62omQEYrMyWHtIvt/llM8yA7vaZIEJ677BJJnCRPOUp3Yxjll9c3HDGbpGxuQ2KQZ3QGYiC5Df0Lg0Dt48ezkz60pMbVU/ZLm5fJpUbHR65OQh9hwtbEC9UVJ22L4ZcMPOazEldz/juBs4hxge5VOgABJNUTYchrtypt8MoD55GS8l14BBkNfdF5xjNTVW1dNmftgV1UjyO1FwaPS3judFWc0fjE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(376002)(136003)(396003)(366004)(346002)(26005)(1076003)(186003)(107886003)(6512007)(16526019)(6666004)(316002)(86362001)(36756003)(6916009)(8676002)(2906002)(6506007)(52116002)(6486002)(4326008)(5660300002)(478600001)(2616005)(66476007)(44832011)(8936002)(66946007)(38100700002)(956004)(4744005)(38350700002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?OFbn0tbeo9ibxqHpmiZH4HQpMSDCULlxZ1kJ/9Fx8h25tZKBWSCDiC2JN0xI?=
 =?us-ascii?Q?bl4JFOu8iHzjy2N2QxmR4y/gn3FdZjdh/LjCFkEyKY9HNW0dXH/UWg9bAqh8?=
 =?us-ascii?Q?xUCUg2pWV9ohecI4fYWX5WWnqj7volV0999KCtJreuaifYdVVfJ2AoqMCbsW?=
 =?us-ascii?Q?xbWW4lDKuu/AKA0ooBRpcoxqkAZlo2MXGSWyJ0bpmxQTpojmCsuSCdHscDy7?=
 =?us-ascii?Q?0Wr/yh2A3owDaqATVmoTi2Bd4vkrYcwFdHvzhOwfO3e2RNR37AwrucBHW4PM?=
 =?us-ascii?Q?QwT/UWdaZj62j9HD9VggHFrr8Rl/svXWgXLtinubK9lJNpmuwUcU42fbVGcp?=
 =?us-ascii?Q?rmTSvLCFCJiAHNFd9ucKv7m11fzQuJVFMt/NVG2k5GHXbdULGGDMRtB7iFGH?=
 =?us-ascii?Q?SbHz9k2NwJ04pbqUPDgh8t1X07r5tnr9BXyfuwBofv7ShRkvbIy1rpKFGkZE?=
 =?us-ascii?Q?3UdcGQYl81H4+VaSWaMD82lrWkEiqfDRv/C4Vv4WxiNjakvlyejje4JExNUk?=
 =?us-ascii?Q?KD9Iz24JDl7x13X45dsrRN860Tb3HHjyB2t7qRQjOyTCywnAflS5e2sBVJQb?=
 =?us-ascii?Q?X3PMmrVBhV08kGVxrnPnAStIhYCJ9/0290Ofh5aEn70ME94yZ7Y0lUg6m6EQ?=
 =?us-ascii?Q?n2tKTLmDPbRW7sM7dp6S8wRKdA7/FEYPBiGCHhKMQqcbOXWbOpboUn6a1Eyk?=
 =?us-ascii?Q?NWU3yA8j361+udg+b8BetM4jU+YbX6vhZvQ7/65n+tVIweqWUAvrgVrKIPd2?=
 =?us-ascii?Q?ZDv6xjhkwotrZSpyBKQWP+9BA6b/SjrVNeJHsV0zZ5zFyy9CEalSFBJEuJPA?=
 =?us-ascii?Q?BXZolGKxluw2alqVb6VlndgtgeCV1anW09juGVhfvbGZ1zw4J6QqhuOID39B?=
 =?us-ascii?Q?Jlb7VF9aexV4jmin9hD1MHUshVgYvAQH+1aX6hsf8SipMMyjHjDtoiAiSNMa?=
 =?us-ascii?Q?TOpH82MOn+hUnSAFKjdqjO2QGFfcrJ6V8IoyBliM4/iGpaWCo8QEZr6ZAsdI?=
 =?us-ascii?Q?teQdxfOG/MVNbCC8hTd804z56FSVh1udrAB8qbNp/410hRMIFoTWXOvJXYjd?=
 =?us-ascii?Q?oPBvuTTpxCStqSdQwqBF161opelH91br1QOd4HlCIxHcXLLik/IzfoJP3qt+?=
 =?us-ascii?Q?A5h8faEoPRucroUVLaMTJpmZZB++k7t3MRmsvZwGJtRypJFoEyUIirtQO+C5?=
 =?us-ascii?Q?hQ8cElJnaXKy30wnOVrKXJqFytJabAWX+n84vAlpZ7ZO16VbgPhhdQJOtjce?=
 =?us-ascii?Q?u3Crin+VQjVjmC4kS9QjMTxOzIrd85qFYz6FnjcKCKp0GlrCW/hCxt6LEJPN?=
 =?us-ascii?Q?/Mc2nq/mL4PR3E7RlabqJlL1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a5d5a89-3588-4896-56db-08d90b33ee69
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 17:26:32.2536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OOOmK4OHs24BDU+vZVsOhju+6HYI+/3du/KEBKHgUjs5aoqDI/WtO1NkYSWcHI/XqnCHwq7788Xa4Ga5d4Bxdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1999
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The latest version does not support PPC architecture, so disable
the it. Otherwise the following error occurs:

/srv/nvme/yocto/hardknott/builds/tbb/tmp/work/ppc7400-poky-linux/tbb/2021.2=
.0-r0/git/src/tbb/tools_api/ittnotify_config.h:338:12: error: '__TBB_machin=
e_fetchadd4' was not declared in this scope
  338 |     return __TBB_machine_fetchadd4(ptr, 1) + 1L;
      |            ^~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta-oe/recipes-support/tbb/tbb_2021.2.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb b/meta-oe/recipes-=
support/tbb/tbb_2021.2.0.bb
index b05a59dc7..d8a18866c 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
@@ -43,3 +43,6 @@ LDFLAGS_append_mips =3D " -latomic"
 LDFLAGS_append_mipsel =3D " -latomic"
=20
 LDFLAGS_append_libc-musl =3D " -lucontext"
+
+# The latest version of oneTBB does not support PPC
+COMPATIBLE_MACHINE_powerpc =3D "(!.*ppc).*"
--=20
2.25.1

