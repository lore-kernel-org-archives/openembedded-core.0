Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6122.1794231660299882387
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:41:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=qKSX1cTZ;
 spf=pass (domain: est.tech, ip: 52.101.69.5, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pthOZEicD8sMt4tNquIVjO5bDU6X8ocTxhcLXlUKDNkJNQg1/mVSVKJYYFDA58bYOzbSxm2Evy25dl3DYQ9DlP3v8BhUZS1VheRlBrLmd+FYc0ohEar0vDzQu7LE9UoCQetDVh7TNS6Tn/mfJTQvUb6geluUQXDTkCFkgs1SGfxMC4BCq8b0mR+231uFTBwq5XlH6qsg+mPgUA8dAgj+2dUEalo1HxAOIpNgLGq+134n2P+Lss2H8aeZWI5mLoFgdxEDKV9Tmh0kIMSA2e47oG2tFv9tFRwyPiABt+MsaiaBksO4u4DkQgMXzHC4EzF3tiZF3PMdAk9PdbE28oYxJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+OAjMxAFbrOU5stqcFsunYssSVi+VcY9oSekSslOug=;
 b=Q5T5EAHNJ2hn3ELfHiFOJIHCVpHdF578SWODAXQv2e9CziYaP5Aj3bg6WdwcBEIcPCwZQVDgUvTclpsCoLPCOvI8rSAnmS1dkF4U5WAvAcFxuBOuPgyp3KLu8lbxcrJbcQw+j8HUK1updD+7P8cRxaxOWZO/8Sg0offSD9jV8m+AmyaoUfpOh6KBQY2E43Eg4RWNmsIEdTfFABS0Dp8ljGX7S1Faq0/9An+i8gQFD7OsMySfUMFYuPcURtM2DC5VNARNubNUBxCJQtZqlH2My29tBy3s1Yefq3/fd0m1ml7dadESV8gs3vGb7HD8/OmRpxEvV041R3UirNRW+LJtDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+OAjMxAFbrOU5stqcFsunYssSVi+VcY9oSekSslOug=;
 b=qKSX1cTZKIEtFj11j4A7tDsAiQHsEJEPFDwyWJ6OcPK0P/FZxwkVWrgaws5hheewFM+uYMYsg6LhhJbrL+H/mqDkgg0d9MkFFnxQIsRTXAktUFyZb2JpRrXwlYnNNaFusXrDeD3aKCkCb9jL4F6FxpgLnS0OU/A8doBC1mBj53wf2PtBmfnd+XS6z3EbBiHPDcIy7iq9fy5CpNhwx+Wrai4wiWzNkD+Dy3amYyGmETnP0P7HJv4luVfVpHf4XI2t6QxrOsX9eJs3mH78EAc96TNxskuLs882FJYv4yyhGy2N5A96OLiiBf6cCr2RqjUtf133RLqOoeRhIG1cLLEkzg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by CPJP189MB287125.EURP189.PROD.OUTLOOK.COM (2603:10a6:380:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 13:40:58 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 13:40:58 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/21] gstreamer1.0-plugins-ugly: Upgrade 1.28.8 -> 1.28.9
Date: Mon,  9 Nov 2026 14:40:26 +0100
Message-ID: <20261109134034.74458-14-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
References: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZP191CA0063.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::7) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|CPJP189MB287125:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ff4dff8-b975-4e06-e3b3-08df3e6715f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|261021121427099003|56012099006|261021123027099003|261022105027099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|12006099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: WWmHsqc7s6XMUUitzi2pLJlHUQFH3mWnc0oRIpbs+RkNqX0MKkzr/NNwrQ5Kdc0lsSD6N7O2U5mu0qkxdmbwmfN4i/+QuzCge4IpsLESbX3GrZ7dwcAm/4j6ACfLBL7qMMYty0lNtIk2m9pIU2v0uh4kXVnshCWUnRDtgQZFaZcIFJB6D99Naug8867vL7qgjoPJIKqDhaP1P6zSd4MbZIm+cbuDLZVxXy1r9RRp4jtUiWJaPLxgmjNdHYDy1+YFQlkZD35WiWonZBFD1LyfL20ZGZ0KrM9QFI1s/PM5Ma1Kk2I49ES0UbhE8DOfZMWl/L4cyYcQZm62lwVfi1va+f0Ez0gn2HQ3vnCR9+QlCyWEUi/BwZZx9BJUwr0UBhtHkpf5BPC8ANOLaTaFdgQjca0usYln+V0PuDbF8QS0iZj+MG42YtFmw8R9iG5GLTnSb+rItDgvSOeh2SEWBzWZkg2oI2MUiYpQQwT9a3pmWrG07gWwaoHzMeNbDAxaosICviwIQCCxxtR+Qdfg8L0o4rOwbOPV85kUILDLto3aMc5hxELbIaEQ5WbxhGvbK+qM86ABBvLMf34CC+koN24vTCqifkPF4qhkWnq4cALoAYE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(261021121427099003)(56012099006)(261021123027099003)(261022105027099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(12006099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I2ZdICmAWAhTLsjmnrSpaPuhgwq1IBdebHsLycbAkunvg8MkxnA00PnOTHI5?=
 =?us-ascii?Q?Bf+tWWviMRzed1Mzolr0tWWUkeFKWC57HvT4yBf5vaY3d3IE891kPqa1rKmf?=
 =?us-ascii?Q?aRfL0jB65H+b4lTv4ynqn2khi5EBxUN3cZav+pGpscWvbv7GNXqWO1eiINzP?=
 =?us-ascii?Q?8n5ShE20L0VslyV0LI9EWcL1B6gDI9Ob7AcGJRAVf0ALwzymzwPHIVkTt3Ek?=
 =?us-ascii?Q?qcAhROWTu13zvZUopnpfqACH8ouCs4w2KnzC590+f/7/RqmSqj0xLmVQUVlE?=
 =?us-ascii?Q?kCMKljCLgDW2W+ndUtEA/0/9I4sam4d2vjpeAr0A5F7/BfWsIGMDuLiGMyjo?=
 =?us-ascii?Q?OZNeUdIIjuEq3fHup4AEVMxVwnoQrTDtqthvLzByRkZR7828pcXJf7OGg6GI?=
 =?us-ascii?Q?zhbDHPNpkvIUjNmydPzFp0gkdVKt5r6KAoWLBp13bELmzAOATbyxPIE1oB0s?=
 =?us-ascii?Q?q2Y6ELkpthAGlbVBH5pfegaFAWgdS0Hh++BjJQYWHybiyTaTc5nmrcQEXmoz?=
 =?us-ascii?Q?GGsSxr2cvnyyRgUpiptRGZQt5yXz8DqIafEykRJlrRqs2RXr66MkyegTtfq6?=
 =?us-ascii?Q?DuU0cruj+wbAz5mPkO0Z6kn5RJ+vT4Voyr27rsm4rpnKJVDHiruZadwfm0M7?=
 =?us-ascii?Q?J22iZeK7+qqy/cRhApz5rT9IgL/QLgFCJMlTWpZr5RVVABysxE8YD6XeSblJ?=
 =?us-ascii?Q?QoMUBEeU6wP6xfGUvPwQkAX2dRHb/XcM5F6Ts1RhY3d5p+trkuXk/c3JSS7C?=
 =?us-ascii?Q?HgoQ/yQn58E3pxhX6frQzzXHKOvevJUXaiu1CCdrbJgcpZdtjg9C0iJqb45p?=
 =?us-ascii?Q?wQlQhG8sbBwLaqGvKO+NGWN66alnNXfwlzdq5ri/blBdkS5q6zQL5zql/jX9?=
 =?us-ascii?Q?T5xRmDP4j8NwoALAxBJBGFSnFGt7eS4JRBHrWUn76GWrlDqnP5r2iTCB6/J6?=
 =?us-ascii?Q?7Ggcpn4V0BZ7/DtNOOGhi+WJmnF6U0nrgkXsj3LVEppYNgg9CybCEYOUvpQ3?=
 =?us-ascii?Q?vMfyt2cDWqkoHvsQ2s+H6qlgOQyr5AsyCYOWIj6LXJUFfBhmJgwzWg3AC9Mn?=
 =?us-ascii?Q?G3TS1gnY0B9KQM/BMkgYZYmMstSpBcYu9YSoFjZo4oNXJWAoWoHWJ3pJAQcT?=
 =?us-ascii?Q?dsZ4HgqiLWi9TH0mvHbTBx+TUdjvEdDT2fQNS9O3RX/0/OgEdNYeHHzQte5X?=
 =?us-ascii?Q?oZuI2Yd3s/ly9VRkkIzgjkdDw9F5VU2fxxGNFbgs4TGY8hqyTAAs+qfbitno?=
 =?us-ascii?Q?XHxzfSvXDjvLhw1dPL205cRyEa8bjOcJIfKZynqUH+KDM78a/vntCVtToOiF?=
 =?us-ascii?Q?QKwys73uuzG3/Qz6hzHvaLsTMC+DGwGlo5Pu/reSRoDrzIfsVa1fa+H3gna9?=
 =?us-ascii?Q?4m2O4NBrToXKVvGMU5EaERTd297dzvRFJtQaTcJrmOXsPjxPyjJTIn4Jow7g?=
 =?us-ascii?Q?SbSU7mZgrVTw0MtCk33pU3aEqM5/gzPb8frE9TGu0oKeMW1en3JipjLIhRF+?=
 =?us-ascii?Q?IyiryCIL1pQ2PfJEuW9JTmBpX5DDSyS+fFdorhzuesC20453AiRQ8HKGL2tu?=
 =?us-ascii?Q?jD/0gLadKXaM/zm++yK7KnbW578IK+BruPNv/JrdLxAE8aQa947bvYQLBKvY?=
 =?us-ascii?Q?HMtLjlvTdZyH53cSloL/tPfPmqkhX3UIF7UmrB9ogFhx0wHDiTj3nnA6LZmC?=
 =?us-ascii?Q?oJ7RR6AN410Dcfpxjp8ZfnXPaZ8yqzFo5pT1kG1PR8hMs/w2BfN/SE2+m1nb?=
 =?us-ascii?Q?pVdFYTpm2A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff4dff8-b975-4e06-e3b3-08df3e6715f8
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 13:40:58.2243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BoF7wWw2BtQEY/Xxe/sw5pVhvX/nFTkCl0YCPcDxHE6ckR64Lh2ks9KCYer9yJfORW0w+aBXdNrlwd7j2efQD7ELXCGZTy3OgomPKF0+AR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPJP189MB287125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249818
Content-Type: text/plain; charset="utf-8"

ReleaseNotes: https://gstreamer.freedesktop.org/releases/1.28/#1.28.9

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...ugins-ugly_1.28.8.bb =3D> gstreamer1.0-plugins-ugly_1.28.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.28.8=
.bb =3D> gstreamer1.0-plugins-ugly_1.28.9.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.=
28.8.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.=
9.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2=
8.8.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.=
9.bb
index 33eb4c13aa6..7ea8036a56e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.8.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.9.bb
@@ -15,7 +15,7 @@ SRC_URI =3D " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plu=
gins-ugly-${PV}.tar.xz \
             "
=20
-SRC_URI[sha256sum] =3D "51ae53002e3bbe9ed0f2215020c5a248bf0ed41b9d9a2a4e10=
2b8583fedab61c"
+SRC_URI[sha256sum] =3D "550a52536962186f5488e06b5c08f31ae0f18400aee32a3385=
156d31cb4b1189"
=20
 S =3D "${UNPACKDIR}/gst-plugins-ugly-${PV}"
=20
