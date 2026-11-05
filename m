Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31622.1793876978210880068
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:09:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=stpJ++Bp;
 spf=pass (domain: est.tech, ip: 52.101.66.21, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NGcLg1xkMCA7sxcjxIq5YNZbQ2QYPgZRHBTdYsiHRxwuDUr8Td13Htn0CUTsKTdmmmDzT83eIaRsII/QfxdaYC+7LdgiI3Xr6tRHbtLWC2xNPiRNAGWsTPzbf9v/P2z5j9dTOEIuACShrs/fe94lmP6mHn6Rnspg8RflCIYolFzWV00cvzCbsaJ3nez+x7yI1umClTU9knZYQx6zE4FsTFGZu/lxNCSu5Snc8CM4M+F697GMjV/KKqulkiDMJAM19KJ4s5vvK94xdXOM783Vk4H/9ZwbGqwstybOWfOMyjZgQYfo21aLlxiIi+6wlZLFCcV+YbiBJ7MyxcIMX/yjZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XxAORb3tgJ0R/IuMrMWwR0kbAgQWPTxEOUMxQqzUtE=;
 b=UAwghFu9cG6BWZmCrYG5CSFs5CdK4qCSjpts2eanVp1U0O2OWGNiSXncN2ILIWDES5g2ITBKFXfS/GVaaJafedDV96kRgTGkFy06UVXtVmxG2JOo2SmFSWaB6b38OZd2YKsVd/Hwxg63E0mfy8KlXeNddvU/Qpg9cgR/83q5Iq6NrU1+u+CjYGwCyXDCB+H8ubxRqAywY0rzMFiSJ/ci3nOXa05uXu0FoaJ8fTg07Gpka2p2d1RVsYU3eeAYT7jKamP2Q11flVX5JGqqDE0Y2/k5cIyd6KKLoGw2Djv/8BiGkiRM4YyXq4hAZoeffVOcQ2gpEYkMfyj4DxLRPyJbZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XxAORb3tgJ0R/IuMrMWwR0kbAgQWPTxEOUMxQqzUtE=;
 b=stpJ++Bp3VwLKFsDlV91R+bPLl7LAjRHTcb7mR0TYuZAaXaehBE4lrkfDVaRjwRA5oYqbn71YPwROIqZ44uxC62F+UeZ81MN6TyY0ehxUi7SbP6ki+MZwT0fVsmmF0WGdUzvbRD1BfG6ASlhqL7DLblSV2MRpQzPp5iyexvR6ADfUpw+jQBcTxBWNiDYlK2DkAzi8BzcrjO/Dko60E7JWFrtYgHqqsZeWzL+dxjPXd0QzU2zL9UAk8Mu7uKbGwFGF+0HeT7/4SgUTavMkpMBZSF8O96QnqrMCL3RsrXBKK7Gleu6Exzv002Cl7ieIcefR88ObtjFGllIvRWW2f1yaQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI0P189MB3462.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 11:09:34 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 11:09:34 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v2 01/10] keymaps: remove obsolete systemd masking
Date: Thu,  5 Nov 2026 12:09:21 +0100
Message-ID: <20261105110930.52643-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261105110930.52643-1-jaipaul.cheernam@est.tech>
References: <20261027110126.9383-1-jaipaul.cheernam@est.tech>
 <20261105110930.52643-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7P190CA0029.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:550::23) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI0P189MB3462:EE_
X-MS-Office365-Filtering-Correlation-Id: 6af75dc6-cdba-462a-17c6-08df3b2d460c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|4143699003|261026121527099003|261022105027099003|261009220027099003|261009221727099003|261022075727099003|261009221227099003|261009223027099003|261009223327099003|261021123027099003|261028144727099003|261026140227099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: Sr82PzTUIXfXELSO17QezSFtB+LjGTFXz5a57eBLQcmNzhsRN+RTF9EUUVFzUPweiBvOPUDqCMShzUQxIz40tmBuCqYS6IgYoG7gIps69ywsynYNOkj68ciTtAoqMwNMRftiHQqp/aI7vyBYEIe72zt5USOKc1XTbf+gK2PIcH5JYgmMtJFbGpNyS2FNUyQj8qOj9tv+6lpCCKmi15LFmEdio4IBDW638xWNdYvVfTi2HPuD+rccLDdsphby5oI+A6WmS1t5RW1R/ttdEuE96ZLPl/9W/3s2nVZ1pMW0TYcqnYFocbiWtPLXvQ3zOp5iw/9oyj/HlM6vdr1dyuKK8oeP8WudLvaSLfyvWIzsm5b52Cdume1GVcof2fR3+P/qpYI7uv7WuZnt7au98OR3ImB3Zbw8/xJoZKwl0wmZot6iPXJh4lmnmtVk+73PAxE5KoksSLJm3LHHXfoFpMioYCCNjxglTaAHevPu5a5pc3Aa7A9qrVPOXo6mt53mRu7jAZ0zKk0uPaVfKIFVOQKWb1nJxfj2BR9GLFyjzhVRmo7RibDqiZrasEDJXBP/oiBXoIdcDcuw1VgJ8PpOqI2a5Lpwr+GwYg5VmkmDCJy61+ZwdyPb6g0RtVZjccE1gbNin3XA7qjqkH0qk9AG4tjufMoQis/mI8UKz+IuUslTJvk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(261026121527099003)(261022105027099003)(261009220027099003)(261009221727099003)(261022075727099003)(261009221227099003)(261009223027099003)(261009223327099003)(261021123027099003)(261028144727099003)(261026140227099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Thhk111EvVgCwTmE3NbH5w+1737BABmbXiMVpKd2GksukrJgKlBVNTnN57V7?=
 =?us-ascii?Q?uAvzH0iWLzV0vOLK2+Xd5tnmSABUadW7o5n2VSGV6R5D1p+cIcHgB0eb7txt?=
 =?us-ascii?Q?cL/SC/0pxnQS5e2CpjglowQeNzXxruC+/mIgIvpQGsNRHIBCCVA+fI5FnRxB?=
 =?us-ascii?Q?F4RYbp1j3/d7QUCpwyY/WRz/B01C3oGrBVjywm8RJjrlezg9dC3NkMNyzfoe?=
 =?us-ascii?Q?RXC1dyNuefhr3BVewYbzrvRrahc5l+3IP+fNKD1YqpfzNeOfwUmHHc+oDcJa?=
 =?us-ascii?Q?yJm+87ddArgKSlkXnbX2gm9IVvJ1jnJdfL0a58JeAxINHfkDW+MgT+L2Uvwc?=
 =?us-ascii?Q?hXFaHkX7FrnQn9BTYMowihamV7/NiUJGQog96JpwZth/wRjk6vHG9ejQ3cuz?=
 =?us-ascii?Q?HrEzMY2f4YUADo7BBfo7yE3Vyj/4zy9d+uc/qyT8Ri6Pr4ksgURZ/EU6kECp?=
 =?us-ascii?Q?yNLE6MBtaDLL10vXLDlgy9apVuzq6h9498DRtTZubdT1kj4vYYyh3AfO9+LL?=
 =?us-ascii?Q?v5uo2HIxOVv0dTyeUgnZdr6y9mGlaBbe+aIpGfI80YHgBHAsy63mYQlSVlh2?=
 =?us-ascii?Q?u3ex3FEST3i4v6BaGtHK5x7m0exp60abUFJ8bKl8a+JiCMFM2jsHi7QJNVQU?=
 =?us-ascii?Q?OkGBeiLtiLsWbAsiuV0D952VJLRV7Gm+QtiZyowmJX/HteIsphXc3P+aK1VE?=
 =?us-ascii?Q?Yj2DGuhVD+8dr7NPYrsvuQuKM+y3/1Kls7nDN7VhZYZrbSF2uaZxG/g202ed?=
 =?us-ascii?Q?6OZG5avbCJ+imwG7dUS45TIbV1PqplVh/kHCOFxk3RdGVD0dRYxjFD9PsR4I?=
 =?us-ascii?Q?GLE+9hmPeH7tsvGTBoQPp6Z4LFp5iD+/FAmFGmZhBMqYaObjhrkSJN9QM4UV?=
 =?us-ascii?Q?pJI1pnlj+tRkwIcN9sih8aFMr8/3t9gU4zyy9TQNRkTLm08jM0SlL7qyThpt?=
 =?us-ascii?Q?wnNvw3ukbld32gXxjDubiRY/Kx6AzTKI7cAcVLBVvN6ntIbFbxxvodynCxNZ?=
 =?us-ascii?Q?Xw1P3XNklh16Yus/3+giZFynljZVO33RM1rbfLEnpPg57hQsXnz9jaZ+H3Ax?=
 =?us-ascii?Q?SiwWp+IMWWwrprNAMJKXme7TPEahmidbFKJ+/QNgdC8u31hvI4eHDiQrANih?=
 =?us-ascii?Q?isQ1nB6J3FLm3vC6VTICbjA+JZxB0Y0dnVREbwkLbZbYNc3Yq/nfXr75Te9+?=
 =?us-ascii?Q?TngL6WtWS+RfOskfCgZeT5DcWzzKNKDmtWQk+jYK0aChZ2bChydeHCu6Td8P?=
 =?us-ascii?Q?Lf0VHvW4dpinVS5EQldSJiyyd21gDqrTC+z21pM4FnO4LlFvOYaD1XURqEN7?=
 =?us-ascii?Q?VVfdrghTbHUpf3PBI1yQYrVZ/FvENdSF/YJJL1gROYNNgpYL/XjAzoB8lg3w?=
 =?us-ascii?Q?zDf5C4kEewvFJunPskEFIEmgEVEXwJXixlzlR5VIch5VilcndDksJgsIhtpG?=
 =?us-ascii?Q?jt/kwQyVArNUqLat2jlvJhT+0cTZwhr2Kc6NYQCy8zYob+YjyEh6+gJGqZOX?=
 =?us-ascii?Q?IRYHjCAdk06qhtGmbYp9q4MA6ueizD0mBrvfoGIB9/RcMZe3L8VKi3kevTHL?=
 =?us-ascii?Q?q2wUILecS9o2gWJ7wVBEzCZTu2/MonbtaOgqtLGJpHfoT4MTGfvbiUHx7l7e?=
 =?us-ascii?Q?TQwYCcFXc8lCKGcF12g672mitnJq0M0bYFNdzauKjKO84KMI8W7AB5EnV/7w?=
 =?us-ascii?Q?fgkvU/aYxPnHEtWDXWVH6VJSBsAFSI361F6+yxmSv5sFYUiUyTZXEah2DpRJ?=
 =?us-ascii?Q?jJMw66Pebw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af75dc6-cdba-462a-17c6-08df3b2d460c
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 11:09:34.5744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1yGPasyaD74L7gphzeItpsvHYf/kvJ0SmfSi2wT+kjr5VR3wtqZzgUnnG0Llh1jzbn3aE0h+MGvsprCUxrDC4lJFrd92Lw/4EpyJoSgmC7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3462
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 11:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249528
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
