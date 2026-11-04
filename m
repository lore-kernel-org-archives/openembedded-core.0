Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7205.1793792314298488007
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 03:38:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=e9vo6Q7E;
 spf=pass (domain: est.tech, ip: 40.107.162.23, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQx1yA/HCL0m42LQGpo12WQFrJXW0dbeJmNJFPL2eAY6sQ8yuaKPfDJWvo0aiLbVpeMKIiybMBYyWCZ+7T74j6Wqp/IEu5vH7w0Stv3MBtKeEkqm4fzEvU5sWYcWU1ZqNCTxgUnLTnyjWnLt5pFYQyQiGKC/64w5da9VhQ1LOad2CQhqibhphr3DVkYzixY9vaq3lN/EW4p5fGgnpH4y2U9cAneULxTSVsk+CM3BHitfLaKcdlXstgbYMVruvUwrGgXmuSa9GPdjYVMOAVUOiGNbjwkJDzyXfLm6gDMYt5QLHoAbt4r4MGqxH5m8GK9n5NYpNubXzBdmxScPV3UO8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Blmrc0Vx1buVnJ/4S3DD6DFGPGhIKuB8hLirkqlZC70=;
 b=ntbfbc8Yl9yMmk9MzKWNSWZgSv3/Bs1ZwhgNnBr7AA9DC+6Fu6Tt+15ts3DurTX/4cJ8aT4rabEyAdbOApfErOzE3NkC9PGKyADpv8Se8gIYWo2nBr37J/9NzS3nVUMrwFIgHU6ZQ9fEAVfgk3o+DrUFGxZGG0d2fabfdG+ibX5bsU+sKYPifu0g6f84EejIIWLBPnvUIU7IDWjky53RKOKNqB2saY6j8bNNVS/qWpJxPeQZUPNjx/dDmEtcGjdcNZ6zvKbIZjHp50l44gszIxJJBi1PB54m9RRO8WrnzH1wXTsoanyTjBx+GOBch2hEm8JtSF9zVHjbRumxypipOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Blmrc0Vx1buVnJ/4S3DD6DFGPGhIKuB8hLirkqlZC70=;
 b=e9vo6Q7EumPASjNDzzxCiMDTYVr8ZQjNJxG2EP5XnAsxabrsxx8+ov69cfaHaLRfYbHEQdFSUDBzLfp89CDD3bMU0b9PeZXyEPwyBxhvN4wYZGqwKDstcOt11mweyY4pABGIKnREkEJ9LpWtBNh0SJP4E5+L3pDK3CBAQwJ+G69YgKBPEGVUbyelVvesfB1BPb/l7dxF0NA6DBmZKBbS4mrHw3lITpt5S/rhOp1gfjAcGiVoag7UtYLUmunxRmhUiQ+t1qRdyiKn7FhgDE6+Begh897eOZDIYOOJpr2k1vhpnKtH6bhLKvQcP/FM27lsCCa8FoCQRjbSUXuDcgMvTw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV1P189MB2084.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:57::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 11:38:28 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 11:38:28 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] ppp: upgrade 2.5.4 -> 2.5.5
Date: Wed,  4 Nov 2026 12:38:22 +0100
Message-ID: <20261104113822.45520-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261104113822.45520-1-jaipaul.cheernam@est.tech>
References: <20261104113822.45520-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::10) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV1P189MB2084:EE_
X-MS-Office365-Filtering-Correlation-Id: ea109c6a-c64b-4c93-0454-08df3a682557
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261022105027099003|261022075727099003|261026140227099003|261028144727099003|261026121527099003|10067099003|12006099003|25016099003|22082099003|18002099003|29003799003|6133799003;
X-Microsoft-Antispam-Message-Info: OXJBkCu8MbWNe+P/fxGH4VLIrtqigP21t1EW15VV/WxvZw9TKMURXhcPaTUvMLvVmMVc+kI8v7w+6+Qzqx0p3D7dKBsuo4F/mkIcZjsUMTNY/WodovZifrEvAfHfGT9XnG9bMThDtTG+vDX2qu0rUewmPo967YUyAlScWBxM/fgj8/3cHQyF6a1ocNjGiiOOf7qkldnp49of0xK5GzRvClW4SMmCc4/XPW/+t4PpOtrt5mN6Vr5bkSQAzKUWT3uWFwsNN9PKLOUID2LHgOCKsXsffm4n7EfbDnMVIXER/Ag+b+zQgnA9MO7TlI9gI+Q8Q+nbk6gI1D22bEvdLILC5MlvFRQqg2XFlUisMds6arj/uytF/XK6PAz+T1lJJNkS4WL+k1t8wy2b9MAARyt3m9j0dn+IdKZWCbDyxOv6kjamQCYKwoLZK76nu8HEFCrAaDCpJxJtZ8C8Yag1zNZ/nKBA2ARZQlCdVEMbUwUKvNe0fE4nya2SX3pDEu+Y9KtY2zkvNnKVhlHEiDY1mCWYAlP207y7K6vngMvQWZ0OXn9WQ1/xdmu6CDFhVD4Yp/PvTtNbAhW9hIXa7hAl5RX7PJbWwRse5wtRibCX45B46KotqsWaje3sw+8WPrv6DbIF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261022105027099003)(261022075727099003)(261026140227099003)(261028144727099003)(261026121527099003)(10067099003)(12006099003)(25016099003)(22082099003)(18002099003)(29003799003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MTQHI/B4A85crRK816D08duQRoEDS41Zqld14+Jrfr5VNgVARAiCJ0XX2O7G?=
 =?us-ascii?Q?itGpOyBByEYiWL0T0U1qtrmf84zTgROeAdyvguylYs1CAVHiUmVhY9yBkCNI?=
 =?us-ascii?Q?yAnImk2i4nD/c9w64NUY9DuD/ZMhTNHt1TECikZOoFYs3xdYAMjc6/fhmlzx?=
 =?us-ascii?Q?h8s2CYPyNAMlKtPNimXYBtqDUhzvKsANAdZeYqyazTaSMDMo2aOVQc3DBXMh?=
 =?us-ascii?Q?8vlXdKxKAKFV9uKEwg0f5SdxVR145h/nHzCPl9og3M3VSKaRoiiz7Hp0dGGN?=
 =?us-ascii?Q?1nOLc5n9QO6tto+YBnf+mx8MEmRDTMTKdK38A0xUETbIXoMhmUMxHv7DWBXv?=
 =?us-ascii?Q?8Nw58Jy0zVdJoChN4bnDsPVdl903qHYfnau/nguEFKShK/+uEqawljr//Myv?=
 =?us-ascii?Q?t5PriS5I+6RMcLdzSH9hO1zpdpq9MWJzYVuSh8GLmmFEuhaqtrjdkR5+P3wR?=
 =?us-ascii?Q?wD1fwym8pm8MyeAdjF0hUbfdCxWn2NYGEcq8piDe8jLy2JjzfBu/sUnU5cOs?=
 =?us-ascii?Q?j7PB2ci31PGu6zaiVXYBW2ffAW5CPLLG4nr2s89ZsMic7Tr8e4CY36O+aLR/?=
 =?us-ascii?Q?oglUC4lM5gVdb8ne+nwc5y6fIuH4kmaMTDJhdDIeR+ZPxLiDCshZjJuPAZs1?=
 =?us-ascii?Q?C/2DM1zuoj1yngo+gfQR2c7ID3hxFot3dozSQg+3FZDtJX+rYqEqsQvgP3a1?=
 =?us-ascii?Q?Ey369TL74qobb+9AhEOgpKYEjD0Pgam93p1kZc5D8sTJc9veTp6mJLzFk9W0?=
 =?us-ascii?Q?+uhNtSmesfDnvP/XRTou2L0pHpqkTheiAapnLwnSxG3zjf/xhSl9OvivVMHO?=
 =?us-ascii?Q?VB7PyuXeQFhvvOXrTClJ5mRtZ6IMNO971/MQPtzNRNGKKeoRppUf5fduP9dO?=
 =?us-ascii?Q?tAN4RxE8ZKEw/76Dvl57fgT9+q2JlL48eWiudp2ibhLTLJ/nOztjgVC+jdmY?=
 =?us-ascii?Q?ESgh0ZPYsjEfeBzMGUOVNZUPPsYV4ZsXHGaBZdWbEabgAhW+cuJdPl21cvAK?=
 =?us-ascii?Q?4AKD5OjAOcVMj6+B4/kkuFfo76e/ybnrcHiyWtwKtZ3U+inb4v0JqTZMGXE8?=
 =?us-ascii?Q?sFIQMlQz/IyQcOWZx6+ds2QE3T+Zh9Mrlpq3y8k64SeDrmgdhhUts6K9TnwH?=
 =?us-ascii?Q?pmYPR36YR73rMfwvFZSNpVXRUwWmD3D711NcMKgtYix+v9REEof04XOAxju6?=
 =?us-ascii?Q?7wdzTUgA14la31wAhO+tic/kcQRvrARGQoPOnqh59D2NFBjrmxd8eUVWldXf?=
 =?us-ascii?Q?zI0bF/ywKUo5CuniCWs6c0TyP9olrdhKYh3BrEEJLFQIL3kSor8P6z5kh10s?=
 =?us-ascii?Q?X8cSEpoXVo363HLtm9vb+zS+/8MiEWMeSBu7oPmwVVsy5lt1/8rx8vNhTnEs?=
 =?us-ascii?Q?92UsX8dn+/+iyb1TjAQ/mQdjLlZSnluJt/I5lrhhe3DR/CYa0WbQMx4BKLnr?=
 =?us-ascii?Q?wRlNxWmFZlQnwfW/kYD7ajzgzbyQzYzFC0VDLmNiZN3N95tGZ496qdrk9+MX?=
 =?us-ascii?Q?jKMCRd/Ppn/ZfZCnbsTXzgiVQ6KjU8wZw9MA1PEB2vTBQmazxjlOAevlamKS?=
 =?us-ascii?Q?tb4jAZMIzotS1eB6G/cVgsPlBrlIXgzfeZtBsc2gISFV2vui6c5zxOh/Vn0o?=
 =?us-ascii?Q?cYft31JJtefnxlbOb0ar7hLUropB4AXKR4sVvuxEJ0bRhGf+q5Nod7c80LI7?=
 =?us-ascii?Q?puqWEKN/LPxDoxAG/opGsMXD+Uo2AqV2l5WmG0nngZ23J6yU6qhe0CcnAee3?=
 =?us-ascii?Q?Gotax+yNLg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ea109c6a-c64b-4c93-0454-08df3a682557
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:38:28.8568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lu3h29q5ZfgOGwMlTiRX/hOQDIbJD8n55oaS7s7pdN8OPPulL7SyxXt+Pl+EjzHOTj27x1JvpvWF/h+wE65pqUD1QdX8t7RPo2kfTQNL6Ik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 11:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249369
Content-Type: text/plain; charset="utf-8"

ReleaseNotes: https://github.com/ppp-project/ppp/releases/tag/v2.5.5

This is a bug-fix and security release, with no new features. Changes inclu=
de:

 - Fix bugs where hook scripts such as /etc/ppp/ip-up were not being run.
 - Fix bugs causing PPP_SCRIPT_INSTANCE to be set incorrectly for some scri=
pts.
 - Fix validation of received frames in the RADIUS plugin, along with some =
further hardening against incorrect received frames.
 - Fix generation of MPPE keys when EAP-TLS is being used with TLS 1.3. Thi=
s makes it work with Windows clients, but breaks compatibility with earlier=
 versions of pppd (but only in the case where EAP-TLS and MPPE and the 'max=
-tls-version 1.3' option are all being used).
 - Various cases existed in the MPPE code where the link could come up with=
out MPPE encryption despite it being requested via one or more of the 'requ=
ire-mppe', 'require-mppe-40' or 'require-mppe-128' options. This is now fix=
ed. Also, pppd will now accept an MPPE CCP configuration option requesting =
no encryption from the peer if MPPE is not required (rather than rejecting =
it).
 - Fix a bug where the password from a file specified with the '+ua' option=
 was not being used.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-connectivity/ppp/{ppp_2.5.4.bb =3D> ppp_2.5.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ppp/{ppp_2.5.4.bb =3D> ppp_2.5.5.bb} (98%=
)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.4.bb b/meta/recipes-conn=
ectivity/ppp/ppp_2.5.5.bb
similarity index 98%
rename from meta/recipes-connectivity/ppp/ppp_2.5.4.bb
rename to meta/recipes-connectivity/ppp/ppp_2.5.5.bb
index 6f7977ece3..4a21b94907 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.4.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.5.bb
@@ -25,7 +25,7 @@ SRC_URI =3D "https://download.samba.org/pub/${BPN}/${BP}.=
tar.gz \
            file://ppp@.service \
            "
=20
-SRC_URI[sha256sum] =3D "379a630a40d858a1347f6592d671791dde12101697a743ef99=
00012f3765be31"
+SRC_URI[sha256sum] =3D "0ebbcfef906d16cfbb9cbdd19c0d92aa3df2fd8fdd29731f61=
4c58d16a279aa5"
=20
 inherit autotools pkgconfig systemd
=20
