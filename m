Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38474.1795597599787432426
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 01:06:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=yEDjQNwm;
 spf=pass (domain: est.tech, ip: 52.101.84.69, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nz9VKNDu56Tn+yj+LxGf7jhM7pxD4YcLBuWkpMcpZ4EvbEbyhKz8NVdXVCVfT/wKNTTMMAvurqL1ZJQXR7YWKYqAswKvboLdsOofZMRvAkkNoB2JMEAAZx561BGAZVOR77qeAV7cGBMEgvM/TnoIfK2654W3XLzL4Hz+O4AOWy+u+PT37k35u34rUeBG5VdnLg7ZHWeQN6atixUQrwpp3cZRv21L2mscFZVVRCAlBnAxJvP9hTNxpRrr98zs+ydKspRdHZEwNp1cMiSp0By9vgdtATYqQkq8iMGO9o0m6atGi062xb0/E6fEPhBuHfEsW91XIpvSh6BgpQ6/RysIBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85oW//2MMgRAWOijEC61YUK/OcEJmeGO+Whq3ET0mc4=;
 b=cLmNx/w486+SLFSWR1+tgPvcXRVQge9QOuu/mwEo9EGQSdz50Zw3Ae8MY8vOcti1FUhRKBrnMxdXuxUYzxZeeDdssjnJG4kQx+oMWVNvdxi7L5HSZ0xi1qkdG8oCWTehoZkiwSBaht1DLVg/8XrCjjsyjOdUfrrLAA6E83Pw3MjTOb/svQ//0aqSvf3adnfsFyqk60KPX7mvMbyQq0hrzuyTefh6AWDKMpsnJPP7UCDwdvokky6+9TRn8caKg8z4RLSajrL8P58D69mOzmC5a/2xjx7AEYHSpW6es5WqcQ13AmA5M4yyR7jyl6eZzhDJdBWQCnhxUsBQ8k/9PKq+wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85oW//2MMgRAWOijEC61YUK/OcEJmeGO+Whq3ET0mc4=;
 b=yEDjQNwm25rebin7wNKZsBTnxKyHPP1IdHiTgdvdvUgrQJERuTCzrcf88ndFxA1DFJvCpmVA3C+ftJLQXkBjDmuu9xtIthu9c79RxMcq3xDQV5mKPymTj4BYGlrzXfuoYIX0wX74UbdKMbpJF9raEMvUcDAineaQV++fr9taaCLmamrs6qD5U99HV7iETsvhPU9qOPIVqxgUfu8EPO0wbgAZOogrd9xd5MoN+uuMOqFmIdAJS/++bOEMUkac3dbX5FQiGj5ad3b4s1li6Y544rq468NASnut2M795gwXqxS7mq3lQ+UxF7892UcpboJPadABrd+jmBcUxptt6A2LHw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV1P189MB2746.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1f1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 09:06:34 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 09:06:34 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] screen: upgrade 5.0.2 -> 5.0.3
Date: Wed, 25 Nov 2026 10:06:27 +0100
Message-ID: <20261125090627.78976-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261125090627.78976-1-jaipaul.cheernam@est.tech>
References: <20261125090627.78976-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PAYP264CA0001.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:11e::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV1P189MB2746:EE_
X-MS-Office365-Filtering-Correlation-Id: a279e677-4696-4879-42a8-08df4ad36722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|6133799003|261009223027099003|11063799006|56012099006|10067099003|261102123227099003|261028144727099003|261026140227099003|261022105027099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: W9FVaamtTCHjjaP0RFGrRV/HtI0WPjWLqmDj3R2PsAE+MU81vMd7auhPncsQQ4m0Rj/gKZcCkWbCPE2teSjUPtb4x9hPATe6zFJbpKx7+YudRbTzFw2pJydjNq4yzG4H0D9kRRLgkqeIGUWx7ehFadmxsh/3TbZGYmODPlmGliaLi4qZkyf1ALZz5enuel0WMvNU9TTS2WUrf6IqVel24gdF8syKgDgZ3AbpzVdPP2GbmLUPhD7wVfl7jFfYPBdye4/yKol5EhsGcH5LHmemMsULUXEWHfoQIfprRvmnK/pRtdani6aic7WwPSx2Czf79mkxQmMaGs/Ef7tKVtvUgARRXQ6EjN6lDRYuot0dDwjvhEYeXocUVAdDMR8ddhAFF6jYtlkM7KHHDz7v24T1IfBCy+9WMH9CPo37XfCIU9z10XZe/pYd7euVsBjXRd/lY7Z60CRSCYbQfI8uCGRwW5lFfi2+wstgy7tOfpnT1/+h7Y+oPNfXgPeCOYn71PknnFyZaSu2dYw0Cmx01Xup3GrVyCH2ESEhq6w9aX6MaWi7KV7o3qObbZNyYcWsyWhLQTJ/tpYc7+LPCFQZYKBjGMaQBSQZ1ZlBtzOKPmi8GcQYUnw+jIZmFidAYhIa55bj
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(10067099003)(261102123227099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uwHlvxHZsBxiu4O5dYh2HdGxadQ2/lVGYqVCGBp//yxTNLwW0wwKVZF5zMHI?=
 =?us-ascii?Q?cCbpAH6SixDo2T1HEkvtNVJhQwp4SAFN2Su9RlnfoO2y18/OKLjMWRKpOffk?=
 =?us-ascii?Q?LJLIrw9qNoEAbKp0rAiiQajhTQ+VfAdWZlNvNDqFn7yn2UI+/2vfDgtON9P9?=
 =?us-ascii?Q?GJdakQIEfs7v+C9KEblvHL+moRy4xBzNlCwuLKr6JYqGSZSltCndCDdhWlB+?=
 =?us-ascii?Q?dflsRDowyR5o7GgZ788V7AZPNlxaAtfOcVqwGCVIDi8t17ZXwvVqjLxlbOUn?=
 =?us-ascii?Q?EUK6wVPeXp0NNDauNbMaEm29enD39hHDrKvc+3YTiVO3xVDcRlzd5qA6j1bx?=
 =?us-ascii?Q?hJbGUluOw1VpmsH7m1WXefch3djiMNaZ9wik2gTKgd/3ICoHqxrJZcAH23vW?=
 =?us-ascii?Q?n25dIUGVpU5DvxEbHUJbbWXJSc1UFilOB3JC/GIco0PZGNcvY86HyIq+I4XV?=
 =?us-ascii?Q?+DdNuTw71AH4kfcOkctfVVMIZC1MK0/05WEjXXEFIdpV9gKioxPzc59WOcfp?=
 =?us-ascii?Q?wBXfnr0ztJ6PDQB0QrSh4DoCbcwB3vFKjYaA7nr2aG1WN8jBqdyenaaZxc6U?=
 =?us-ascii?Q?Fve5IaigidHiMEFQE/UlbMtigOYPkDa7yaePhX6eacVjzf1fekiAMlOIjnyS?=
 =?us-ascii?Q?c6+W70eNFTsG+WUYywweiAvhpXqszWTJIDhPTuHGytIlQoYTbZG1Xkg6x0To?=
 =?us-ascii?Q?/+7z3BSqruZuOAbe2zsHY6JnL0ZcRuNhYVpDvvDwu5He5u85xEt5wCADkqMB?=
 =?us-ascii?Q?j6hoZyDX1mYfhuklPET+yyndk3h99LJ9ujKcIr9kqqMYRLFPB00TH4r6x3vA?=
 =?us-ascii?Q?3swkGDZvUOjGnsh+vsMgXruqIqDdxqplJfOjhzuO3SEhuno0teyesCFsr0n0?=
 =?us-ascii?Q?ArD4X2TOLpAb6tiv1VuPUEXi+/56/5iwXLhOtbv9WBlsk4q09LB6DIAuJpGn?=
 =?us-ascii?Q?2aSk9ojmeJPGeusGWvjf7CFImJWrYiak96+AO49zZ7ItQGosK7JiPGChYHKl?=
 =?us-ascii?Q?v+vzo3zgIq+c8rCgBzb0XeAP7X8UfRyf92WjJizptaek9Z54x1Iq8VBtorNM?=
 =?us-ascii?Q?bVD48gRF97TGbqfNmLLVdaiJHmfdf0EbFwwbrdiBMG/uYK7FJNhivw35Jqiz?=
 =?us-ascii?Q?EEAR5wOZyPfEExtvc7TpYSqF8nOt9qTYTfzkn+1DcmNQoDnxu1aGQi+xHXps?=
 =?us-ascii?Q?BqM/twKENdgj0JcOUb935D3EpLtYIktgl5bdW4T4iPXaVJ0MrSwcgyqhRyOW?=
 =?us-ascii?Q?xipzwlCik+aYnDchm8eLzanv4tscEt6j4j8uikYO9M9pWahYmqqy4g7HO0ca?=
 =?us-ascii?Q?1Te1rH3sDRysB8W4ixAqadEishclXevtxCC0Tu71za1pEeFtl6yW34GB57sp?=
 =?us-ascii?Q?w3rgArWP0oTQhD9OMNJlGN9MQYmAs9tBO2tVNh+aned3CUYU/ecER0cXjh38?=
 =?us-ascii?Q?hR+I9s5fWCYunzJ0/kh0W+JJMSi9gYNUC4BXh3W3ff5g8x5a6VVdu1Kmf7a8?=
 =?us-ascii?Q?kNR5cL+F7MuccjleubuaVArDbY//uYLbf9m6FJUK4RUXH/6A0YTeoZLIR/LR?=
 =?us-ascii?Q?JhVauDnapdCLEyC6cmFc8qz4+zkC2nqPvrvYcML0L1txm7dupFb7+LBSpkNC?=
 =?us-ascii?Q?qUL+8ruvY7QnMXOfWS9Q+DQUT9tCOSyg02oMtysm32CppQyZ6NqRjv0mRh7n?=
 =?us-ascii?Q?EuRKmu6stgpWYA52usa22FB8izxn/KUsnHJS/7IopPd2gkdvWVyuot0fwkXx?=
 =?us-ascii?Q?sTZpKPIjS8CsXR9ztLY+qX9+Sm4Hp2s=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a279e677-4696-4879-42a8-08df4ad36722
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 09:06:33.9906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PX+v1cF1N6qzjHJ6Z39z9resNjx6WpdFZ1twwKDj9AoGy2uqBIcM7EAXIZTAM4QvuS2y01acHEs6GDArn4hSwD70Lf2HZHCU5SU+/pfZXK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2746
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 09:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251170
Content-Type: text/plain; charset="utf-8"

Version 5.0.3 (25/11/26):
  * Fixes:
	- encoding fixes
	- restore rendition attribute modifiers (bug #67154)
	- Fix uninitialized buffer with padding escapes
	- Fix off-by-one in resize CheckMaxSize guard
	- manpage: correct rendition syntax and examples
	- security: add SocketPath size check

ChangeLog: https://cgit.git.savannah.gnu.org/cgit/screen.git/tree/src/Chang=
eLog?h=3Dv.5.0.3

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../screen/{screen_5.0.2.bb =3D> screen_5.0.3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/screen/{screen_5.0.2.bb =3D> screen_5.0.3.bb}=
 (95%)

diff --git a/meta/recipes-extended/screen/screen_5.0.2.bb b/meta/recipes-ex=
tended/screen/screen_5.0.3.bb
similarity index 95%
rename from meta/recipes-extended/screen/screen_5.0.2.bb
rename to meta/recipes-extended/screen/screen_5.0.3.bb
index b88d3e7346a..b9831cafaed 100644
--- a/meta/recipes-extended/screen/screen_5.0.2.bb
+++ b/meta/recipes-extended/screen/screen_5.0.3.bb
@@ -20,7 +20,7 @@ SRC_URI =3D "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'file://screen.p=
am', '', d)} \
            "
=20
-SRC_URI[sha256sum] =3D "ca9a2c7e240919bc7ac12124593ae4529bb4eb5f7349d88578=
29b7e3f0b3b332"
+SRC_URI[sha256sum] =3D "941c98ffecdca4bff4bbd1cd6f08fbd18967353affc4652104=
0a999dafbd39a2"
=20
 inherit autotools-brokensep texinfo
=20
