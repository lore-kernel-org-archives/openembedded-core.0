Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.88])
 by mx.groups.io with SMTP id smtpd.web08.25345.1611132264404706631
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jan 2021 00:44:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TA7a8+89;
 spf=pass (domain: windriver.com, ip: 40.107.75.88, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvb7fD+NfakNJ4uaT/v/aDwgTCeKihlRnNCTu54eMC3UAEWZ5uH6nLZcrtxgNyUjShKPtes3hGEiC3+gsyatwN1A7O/5P+P3LyUJmJuj3LNo0j9K9yArkTrrZ7+jyv36sPKX3DSFbUimcOFc6uMxsTPL0p/lYpJvqc+mMtPm7CNCfy8LxkLC9ucFQxCajAFd/P3UwgGSHICiMiPnSXaogaViL6PQyQF73CgOAQ10YV9nS7uC+ODy97Wmd5QBDmwce7JycVrxFxczhemhKcEEvz1/xWuDjA+HlVIDXFXbBmX7wW3D5hc2pGBgADZgfVHPLC8uXyKpiE6usb94d4z7tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9UlePyFqN/sLpsBrcAKE85Cyh2G/PVM3pnJUFx93x8=;
 b=XEaKHmrvtTioZihTSz6UYLQfA9z779yA/m/NbJbj1hiiXmtPkLDluN+VOm3bykWOLNBglKmX0Z/NA9m2MlhpYZPtZSOeC4o/IflsCl6hewea0koEqeTx4DGfo0V9BbUue6fmrse+jLETN5EKRM89iasDNzFyEtU2jWoJ7rtlpfOZDHLFR1yCUdFfg6dJjjUsAPnhzeW7Gt8ES8THl4kllreE+zeTH/oOVMksi0jQyBBGDcPCdCuZpuAkXYBo3cdUkvYnFEjEtg0/Ql6egaEsXM+1XISlx1tCmTp4zZYC/ixlWC/PhST93zc/zEcI4mukCKQbwiOpmuirbzj3BE59Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9UlePyFqN/sLpsBrcAKE85Cyh2G/PVM3pnJUFx93x8=;
 b=TA7a8+89AXMtkk9SOEY9v4geo01eZ6Uz6LS6+VwJI9KG+hyfCOTl8RpENRw6WJ2k20mxemqdr7meek1idddwsIAzKq6SGhM1b/tvzoCjf6/k2MGL74HWr0fDdg0UgZEuzkq/QtnZfpK9vqZBioM5NoYawyKEVpLMRdwkpVPCoCE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (2603:10b6:805:d5::13)
 by SA0PR11MB4574.namprd11.prod.outlook.com (2603:10b6:806:71::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 20 Jan
 2021 08:44:23 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1%6]) with mapi id 15.20.3784.011; Wed, 20 Jan 2021
 08:44:23 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] oeqa/selftest: binutils-cross-x86_64 -> libgcc-initial
Date: Wed, 20 Jan 2021 00:44:09 -0800
Message-Id: <ae026a78dae39a94c9e9d94be7a1d67119ebecae.1611132189.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1611132189.git.liezhi.yang@windriver.com>
References: <cover.1611132189.git.liezhi.yang@windriver.com>
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: YT1PR01CA0137.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::16) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by YT1PR01CA0137.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend Transport; Wed, 20 Jan 2021 08:44:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f536f1d2-785a-4717-55f9-08d8bd1f95d2
X-MS-TrafficTypeDiagnostic: SA0PR11MB4574:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB457429022739FB119F3C3D0DFFA29@SA0PR11MB4574.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:390;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Cq6qwfR6Q6JIJdGJnaIzZmPuuGz3rYZfOKSm6VeYVjULqec53KD+PoeX+FZsfgtKniUxQ+T11tU7+zKio1G/sQVke0oODbUVtqcL3P1vOYbf5ri/iBy6RzPmX/eIegdzpbrXfV18VedAiW02tiexraiTJTSDBYxC9866FQd1Gd0DDFxuJHdpDu+8skam9ycIaMpQKY0AC2hmnKH34/aPAihZAZrHlxH5r7Snka7d+jNUSLWIpVjxqStC2A201HSrgsiIBetbvzGthA1sXi0QAslbRRTWbHi1chaZ+u184jEGfU7zkImrz1hjWs5ZuxiBxUpZWAhGONe2y9KbwuHohuVsk3GF+20n0hJMiUmunHIVKQ5hGBi8kXU97ruM3W0CF76mzgKJy9q4fw/uwdftNA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39840400004)(376002)(366004)(346002)(136003)(4744005)(316002)(6506007)(6916009)(186003)(26005)(66476007)(66556008)(52116002)(956004)(2616005)(478600001)(6512007)(66946007)(8936002)(5660300002)(36756003)(16526019)(2906002)(8676002)(6486002)(6666004)(83380400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?e12skH8CDp1TkP2PDWQg/knJHJwLb4djwKpYqXRXXhbmt0aIpgwctGXJoXrz?=
 =?us-ascii?Q?7YoeSSm2wve9q6FxTVsU02ayuNv9O7TXuMmDp4fvHmM6zHgNuml/BYkNGnxs?=
 =?us-ascii?Q?x23uPBExEfV4I7Z3pvmfI/ZqM7ieyYv66QZ8jgbKTPzJU099YQuhEnyhGcr1?=
 =?us-ascii?Q?FDq5Wa/vzOScFSYw2OxKBD0xjfxC5RXX2jKylFhM6e3WO7BbG88xYXWtW9/I?=
 =?us-ascii?Q?X6u03tKkvXSEKQHavvg0QIYdzoEwvDNiUfADDRzvziKYyn/qN8uUgd1a/Mu7?=
 =?us-ascii?Q?F8xiIQXTKmuoOPlKrKvFZ6yrmy+Qn7YegleQxttdUpNRE2v8EUSk9cjPgQFn?=
 =?us-ascii?Q?f2xPVYlRoLRDFGtk8LKUVwKZoNaRYGwb7PvB27+iVYeBImZ3d7JfN3Z2NJRy?=
 =?us-ascii?Q?wXSUDTEkiiwgGDu/w9rS8ZXCcSKFjkv4Kepq/dV97WXw/J1z/SMKRXtXxUA5?=
 =?us-ascii?Q?ll584kHXKenPziaSy4JqYLDcwEufdIiIjzsuhGdd8Xc5rftfaAI1D6tYBVWx?=
 =?us-ascii?Q?U1tHns0CdrB2YmAXKBE/WmGqwBa6yIqcfBEUVFfNhMaNY+Jqc5q9jcFtGouY?=
 =?us-ascii?Q?9wHO73umxOCJohdM7bAiC2pL9w0hk28bEAxZnuzKTA2fP0jSnNnDG9ZFb3qW?=
 =?us-ascii?Q?xYifMvckMpkgM6pa9ZguDGBEAffDkwxeMXY2ciULXPz38JD1Jl7Wb9vztj2i?=
 =?us-ascii?Q?csj8bwzg2bSrq5+Up1qxJl7TVRZQKh1Lm/mdylbDIwgsXLoVj9EBBsxUuBZF?=
 =?us-ascii?Q?axIWRC3g1yftQVz5hKXH3bN0yUxDCRsZUZSH5y3urAyVEZJtpl5Huipk83ym?=
 =?us-ascii?Q?p2rM9QMwCRQ63zSFkqgsdME3ltAiRwNG76M7Zbgp02QQ9AVv3CtRCHDVgXPG?=
 =?us-ascii?Q?ZocSpvDIYSD2RUDTWlOG5JaYqFbED6/54zpu5Zhk2icana1K2AGSTPwT+gm0?=
 =?us-ascii?Q?X0Hzm1M3bHMK+k6GRRDFIIwjDYLfMkz7r6nEqdJjZeUCuHaIGcWSXuhFvmAE?=
 =?us-ascii?Q?YbUl?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f536f1d2-785a-4717-55f9-08d8bd1f95d2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 08:44:23.0499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ogzJK8E4Y50d2yIb1FG3rRiJHLlMuUhbD/HLc/pmfDgyz2RLrN00LLzvur1Qcy41zxPWzb6mjIETF1yGaqpJF5toicIkF/BxzjE5z2+hCgk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4574
Content-Type: text/plain

The binutils-cross-x86_64 is not avaliable for non x86-64 machines.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/selftest/cases/buildoptions.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index fb0a5ebfed4..3495bee986a 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -38,7 +38,7 @@ class ImageOptionsTests(OESelftestTestCase):
         p = bb_vars['SYSROOT_DESTDIR'] + bb_vars['bindir'] + "/" + "ccache"
         self.assertTrue(os.path.isfile(p), msg = "No ccache found (%s)" % p)
         self.write_config('INHERIT += "ccache"')
-        recipe = "binutils-cross-x86_64"
+        recipe = "libgcc-initial"
         self.add_command_to_tearDown('bitbake -c clean %s' % recipe)
         bitbake("%s -c clean" % recipe)
         bitbake("%s -f -c compile" % recipe)
-- 
2.17.1

