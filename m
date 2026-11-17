Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16002.1794916293062564636
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 03:51:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=cl6cAf7i;
 spf=pass (domain: est.tech, ip: 52.101.84.4, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pkufb5+RRvlClCu9C4LuxfpksvGSXirwFzZe/+tyjYQr6X6TwaSirqxhBzcUylHiSE4ZdA3Ws3/4sJiU4KUK3070lToBtwxUL3WVQ5/Ti0kmh9oa4mp8Qo+4X4ZisUhDJs1fda+zIFadBGtBpfXT01nzxSIw1/MvUjVi4XJquQMf1TN7FkAA7MQ1qnoWzNz1UP7zdY48pNL/PfaPSE2hiirUxhu5tHmh0aK77eV/ZO51G6bOakoSgJLf0DFfAxe3gs7wEDrgUyFkYQfEszSpZ6cWvKJ8KIVXLq+xlBN9k3aZJzieip/YY+oC5j6m+z7GFL5pgELdp/U4QV8ebxnEQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XxAORb3tgJ0R/IuMrMWwR0kbAgQWPTxEOUMxQqzUtE=;
 b=izk6OhmrHN1W1cjOu2SkFNR0qQWafiuGH4m4RLCfbbSKujGPZsyAOFd6uozil3ofawW8c0vv2Bply5XV3iUxyfOpaWYED8jRsPDo065+v0RKZ1OHC8h/+y9pVmW70uKmTLDxE8O2aWc0xGwSZWVW5CJpXwMMF30rdskV8B8N1PdFFD0xwJv2zwnreGKNxLc4cWZHZWUE8924Y/RreH2g28byrEmB2C6saKot2nNMvYRr4ZcKC+Z0P1knYRcHzabx8PaPvMxnatMs/hMc+mn50hp1b/ftafokSBK700DUhvu+HBkmdWjxoAVPH1xmJ0n5GXbTECaPOh1lrbT03WBZmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XxAORb3tgJ0R/IuMrMWwR0kbAgQWPTxEOUMxQqzUtE=;
 b=cl6cAf7ih3I/BsO2LNO6QJd+41GJwyCzBnqDBYqvVKt2D4b5qC4eZbTxrkzhFsSl4cBv3Uo7eYV6Mvhs/YcpHU5oimHjVuVtbyxvxrC7xrDeUQFsS/42xKIm4uGqnS+3p81JY3GDncs4wiXKMg3gfQULeCwHxbIOsqjpp6NM56AQ6oBpQJyOSixQySxA+iXkEzNVYintYopGcbij3EbpRGckeYRoCf4C500OBx7vl/vtbitxid7UhkIqBdk1iGbD9KEl7yQiOwVS7c2VcXf5ZgkNGtsltYUvlFVuUN+tj6m//+ZZSB58tukD5eriENEIf4H0YL7Z32Ofk9xIjMVa1Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB8P189MB0853.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:162::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 11:51:30 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 11:51:30 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v3 1/8] keymaps: remove obsolete systemd masking
Date: Tue, 17 Nov 2026 12:51:19 +0100
Message-ID: <20261117115126.14374-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261117115126.14374-1-jaipaul.cheernam@est.tech>
References: <20261117115126.14374-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0554.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::9) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB8P189MB0853:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bf408f7-0364-4215-9cb7-08df44a11e4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|261009221727099003|261009221227099003|261009223027099003|261009223327099003|261009220027099003|11063799006|56012099006|261028144727099003|261021123027099003|261022105027099003|261026140227099003|261022075727099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info: 99z8SFs04ONMc1qFNsh3BTBg6+6F3wIeDeUdmwcXvnv6A7JzbuJ576SbV/u1QCh5k5Y8tXdGXJVVRGwTJcqbbEkJJmYfq9EI1vYz2anNlkywZ19+stNomqxNkhLPuuFbxBE9bn51vePMnyHZE+SBH/IrQ72RzyRXhmCJaOzapI5TpydPcCHursMmOq65vnP5lJkvqaN7DWRUs4wjEJV6yYJOYgoHAQ7UIobIelaNfEEH3QlN9rAqGsDopYQ1CK5i6h5O0ohJzICZNACzt7aZ757npjitYiRwhXl45DZpDBiFjjqYRAROUfGid+ujkKqxINAsUokeijXM1Ui/NRIxCw/a0fnJMKsEp1y5UHlURilUJRW/Fku4DW5h7W54CoGGG+vm/UDCQJNkPeDvcxsjnbuBW9KmvFu546iHcmJ/jiz5eZqGhUruAZ/4GyWcH9Etl3pTIMZaSn0bJKgmS81owPphovK6OUu3OM0bSPJgkCliDQV90086tfTyNGuD1VgAhNl8hddGkeksOKS1NJLU9nu2esh9xzqIjpzp+8raRk4ynHDgpY2vmfb6oVxZG+lGCkn2dSbTjsnRrLF3x8UPWI2VDsKorRBOWO+8F7LziCXI5HO6ZVJGKK9ILgPrmymikBVabAANR27aI7ErP0gMaCryh+MgxwVwmfiGLM0HCKw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(261009221727099003)(261009221227099003)(261009223027099003)(261009223327099003)(261009220027099003)(11063799006)(56012099006)(261028144727099003)(261021123027099003)(261022105027099003)(261026140227099003)(261022075727099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AYRb2uBcBW5pfahln3P/jai3O70ky4LeoOXsqVzDhTSYpxJczLHpTvNLi5qD?=
 =?us-ascii?Q?oUp9bdEvQ49qZTt+oqUgRz1vbhBYLLH5qpQIBB9Gq90S+JOz0NvPLL5WMTnH?=
 =?us-ascii?Q?ExuUAlQvFKwVI/LtCb+KYc33Xf9/Ml/aYcQF7WIh1MPFvqc3VfGAT6t4RxGG?=
 =?us-ascii?Q?a0lAtBDRtI6sPXwSvSbbz14sEty/X5885HtPekMbe6la7qf4Aj6R030fQhE9?=
 =?us-ascii?Q?Vv+rQki4KF9ih8gGom2JIPOySgMaKwjOF6DdYxuKXl41MSC4uV4sUO63Z3+w?=
 =?us-ascii?Q?jU4BbdeO09yd8JinRe09N5FQJzUtjoqtXvUvOZs5aDqMQjlNqyjSfQR7pkWC?=
 =?us-ascii?Q?Qhr0SX1LSmxPcuTy08/scoPtcBbBAMjyOoLB+gliUx7Q8EmGBJ71CXMk6+KC?=
 =?us-ascii?Q?fXwUsvzZPPgzrRtRc+ZZX6+++cOyUSeiYpVQ+Qtx1hT5fqCQ5Cl5ycQhwkc3?=
 =?us-ascii?Q?H+Dq4l6yk16as/tw9ZtDnSbYyuwty9rdo75Ow/u5Z5qlUti2EWnOpUYMO2+V?=
 =?us-ascii?Q?E53F/66ViYVMfUrcz02JRiYW/dRlNlNih9/fkqt3BeAucGaWTlTX347lhwFE?=
 =?us-ascii?Q?FooTjGj56USHd8NMZ1f72bgxeY+UnOBVidsHWDWHKkwWdmMl7G4jztSM5RFt?=
 =?us-ascii?Q?vxlUTkuqp1uYnn+gK5cN6nopLI16YGDLZrj5t89MUiry7iH4oEPtu0dtgKMy?=
 =?us-ascii?Q?zZZh1GBHgCUtt1EGmlKDqArEls3zq6E3Bl9c3n8EG32pGdNo42FhquvunMBn?=
 =?us-ascii?Q?pgTB6QXxCeA5WxBxuKBlO9bo6RBwNAfQUjCKUWK5MYhOEcVx/Y5g5p5oaCvw?=
 =?us-ascii?Q?o0HKujs4wapQHZt0u2Nz6denRcz/sbt5XtVYamv3PA+KXrWDTiTk//tUE7t4?=
 =?us-ascii?Q?ec+pc+P2WxjjaOu/jig3/b9R7kgXpGoEpcoDZPNHIw1CbS+6vP9GxhRP0qA8?=
 =?us-ascii?Q?M1m/Vw1NEKDuNI0+M6ElyCWcM3HKwpG6pUShkb+AbuEqDl8NtjF+uGYzrP/v?=
 =?us-ascii?Q?Wt9mQe2kD/bBAi/YaJr2j/v3i2HnagnPPaiD9+Iu26na3PI6ZzwSrjCNrKZk?=
 =?us-ascii?Q?iYOJBGd57KGMcLSt6ZII7h6Fbz+86MG/OTsYSrcEKuVxcEm4tNioZcNQ0716?=
 =?us-ascii?Q?DR/OESiUMq99Ow9lSAgh9ohk+F6X4ukWSb3/NM2r9JeVCLjcnWCGfUkDivQX?=
 =?us-ascii?Q?3BSc0GlAsNhzZk1Y8hLMVMncXMPfaC7XKPfmf5BBfA0SInWpye9PeOtly8c0?=
 =?us-ascii?Q?FpDcAQ3/LlpnFQuL8SrNUgjHWKbs416ogsVY0ZNqSjwI8dP+lzqlVljaOKre?=
 =?us-ascii?Q?3wRudNH1wPiIv4AN3W2OmAKLEkhH0yNzMqRONDyKaMWVtvcBAvfIfxwwNA6I?=
 =?us-ascii?Q?UPiN+3C9aaaA5wLhxurqKaXOQC4+Xs+UlZLhV2ecEQCvqqPiFCQnti+4GtuP?=
 =?us-ascii?Q?cwgYN+D8pJeTttgb6z4FMCZ6jnVwpF5ivvZCpevbG/KkFoEOJidqbKv0xnh/?=
 =?us-ascii?Q?Fj5ecAlNmtBdoITI+iCp1OlWRsVSDM1lV6R/9viW4clZuDAj/17J7W+SwKiV?=
 =?us-ascii?Q?vXRXzs4xTFIN3GkA/ZGaYeGFKG9Hh4NSkZW0sU3cPzEFr1eI+MFp3W9Deufr?=
 =?us-ascii?Q?ZuL6qKh2pz96jqLVRjGB4V+LbPYQx0lTgJv4ry1EFF232LzNHFG5cZvcLTyQ?=
 =?us-ascii?Q?g4R52K405GKujMIuaMzHP/MkTb6o8wVjGLRtceM8jeZX6MiiVCqoMvdeaH8K?=
 =?us-ascii?Q?RyWGy3xhqQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf408f7-0364-4215-9cb7-08df44a11e4f
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 11:51:30.0306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ViF50F+7xiPEy2hOkGj5VCi27j+dmMHE1Hx/5892qT4sOHj2Euvux18e1ImoHNOeXCy/0EvISiyO1Zlr/xFJgq/0ed47I3lCjy/oYLOT0zg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0853
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 11:51:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250425
Content-Type: text/plain; charset="utf-8"

From: Ross Burton <ross.burton@arm.com>

systemd no longer has sysvinit compatibility[1], so it won't try and run
the init script in this recipe that is also implemented by systemd.

Remove the explicit systemd unit masking, effectively reverting [2].

[1] oe-core d9ec9e20eeb ("systemd: Stop supporting sysvinit compatibility")
[2] oe-core 8cfba07e24 ("keymaps: mask keymap when necessary")

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5107c33bc6d81cac5fedf865d84a3742c6437d2e)
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-bsp/keymaps/keymaps_1.0.bb | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/meta/recipes-bsp/keymaps/keymaps_1.0.bb b/meta/recipes-bsp/key=
maps/keymaps_1.0.bb
index b7e6ef6cb1..546ebba5dc 100644
--- a/meta/recipes-bsp/keymaps/keymaps_1.0.bb
+++ b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
@@ -11,13 +11,6 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
=20
-# As the recipe doesn't inherit systemd.bbclass, we need to set this varia=
ble
-# manually to avoid unnecessary postinst/preinst generated.
-python __anonymous() {
-    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d=
):
-        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
-}
-
 inherit update-rc.d
=20
 SRC_URI =3D "file://keymap.sh"
@@ -36,14 +29,4 @@ do_install () {
     fi
 }
=20
-PACKAGE_WRITE_DEPS:append =3D " ${@bb.utils.contains('DISTRO_FEATURES','sy=
stemd sysvinit','systemd-systemctl-native','',d)}"
-pkg_postinst:${PN} () {
-	if ${@bb.utils.contains('DISTRO_FEATURES','systemd sysvinit','true','fals=
e',d)}; then
-		if [ -n "$D" ]; then
-			OPTS=3D"--root=3D$D"
-		fi
-		systemctl $OPTS mask keymap.service
-	fi
-}
-
 ALLOW_EMPTY:${PN} =3D "1"
