Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31622.1793876978210880068
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:09:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=w74rPy2g;
 spf=pass (domain: est.tech, ip: 52.101.66.21, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybORU3vMk+MU/Z7HPI13XwH3hQmdxxvV8iaGNENJJET9Ukxa2NJf53qctBHYRgMrSOEDio/kanMfEpXJPIuA7aukLoPJfqyvUEkfbmJE3ld7LfVXCTeRmaahXSg+EzZYS+S5UlsNvYGj8JyBas5zDotO9iWpq4xgoWAEWmhhxK2NoU2LPJsq+Z6rmc4kPSAOuy/ZeXJf53HRZY7dFgW4iOtBi8r4YTMWxG9fnETjY/x7nbMAKikoh54VtbohaWU3KwJX02djYAG/YlG8E3F04JnQkB16MrOXOil7OAvp57GT6c1FqArgF80hPa81saa7Jsd+gGJWeNPasmjOji1d5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9yVGVy/6mU/yuSZ3UVdjniW/xxqpDyk3BSd1QIBVpE=;
 b=uzHx1hbvVPLVz2pnifPZgFD1Jz9wwSh2a2556hxp9LcWB5JoiQmznAMKeStLTtwuW6+W93xq6XYyhKbEVVmR6sVmxFNOQHVI1djXWj30vB+S83glXF+PxxdLnMv9uuQ2BMPottkWul5ztLCO8aIUtMaN9oXrsMzyLqsIU8XPNbzbZvTVCj1XITWmR/XgMpVgKNc6dZK37DvFNDLGQVrjxAV/oLaQ2Tu3vyVK1AUT325bjNtVjKbrneyJ3EpOe4pofaLr/fqTbv/6dCIIpUD45pXVZCQmN0pT1BZ1/itowMijdZ9S8Ngke5s3T3ijlTNir6bX2WdZRi0TX9AHHrXpWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9yVGVy/6mU/yuSZ3UVdjniW/xxqpDyk3BSd1QIBVpE=;
 b=w74rPy2g1EGYuqDUFpiwKpMcj9cSPijcvD9PLav7hmjVUxQDZZvzx8uS2kJI2mI6+nxT9CdERsLX1Sc+baXG6ixvqBjEyy7CbNLecRHskWGdFqp7V8qfCCnbxluoUtqmiMNRwltKxbtlWFu9uPuWuGPRzaIHuujbSt0c/bsiFDptxLjPMOUx4km2gBbreYaEr892a7evVwFigUkUlMes5uS4IghdED/H6CzcJZAKthbG3I2695bzJjmCZQF0sLljUzwvAyxh68wwaV7+kSr9fGsErdwdfXar65NXgD7ok/12Qyu7EB7W4LjZVw2AcUZDgSQ+Mf6IAurg4/1pFgbrGw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI0P189MB3462.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 11:09:37 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 11:09:36 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v2 02/10] initscripts: remove obsolete systemd masking
Date: Thu,  5 Nov 2026 12:09:22 +0100
Message-ID: <20261105110930.52643-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261105110930.52643-1-jaipaul.cheernam@est.tech>
References: <20261027110126.9383-1-jaipaul.cheernam@est.tech>
 <20261105110930.52643-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2P250CA0004.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::9) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI0P189MB3462:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb2f9e1-6a9f-49f7-b302-08df3b2d4708
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|4143699003|261021121427099003|261026121527099003|261022105027099003|261009220027099003|261009221727099003|261022075727099003|261009221227099003|261009223027099003|261102123227099003|261009223327099003|261021123027099003|261028144727099003|261026140227099003|22082099003|6133799003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: birA9InoYd0tCYuKMWs3dlWKNIzK0ZPVuK0FZ48TM/KyQZkvH8jRWCK2LbJpeNGcNQh8V2wrI2xoMpFcT0RjISddksxDrvz5KZa6l4ELLlsR0oP24ZoFJmxaA4XdMFB+3WYq58AB6ybUME+K5s7vOg9cmPO6txtImbHtG4cKgwXZH1ilS9XGLc6EOH4OJizN2EbiN5+L4ClcjaTpFX17uWZ72uuF9XMN4af/enlcWEMKfGeUckjYeHnxU0POC2jIL/ygfSvvb9CitCQx61mqyu2NzzDSpInubthbpOKX6IAXqEyJa9J5HuxGYdlbon9+gZ2FRYafGv4vn2Y5tqUDe4A3UFXEcqqzidyHKwHs8cCVy/E5ciqQ3S1UHtb/N/93WGTQwspC6CMcXnuHBeOvhcx4CzJ8Zye7RPHXhR+mQATrLy/W/69XQXoKOa8IKv7Yk8NmQVMH+laZ5I7ZH2P6Uv4gi/4mZukensGJDsEUzOGpsyTRq9RG3wA7ERM3RTP8THdO5m/4MrRs6oZNTy7WCaKJVdg+YGWBZF/zc/KgVAoh5eEILHAyExtes07vVWNugm8L27oYlVGzi5Z1Pt0P+Pj+MNLFgY6cGS77Rwo7cOicmWnPDZZ273YzVNdzfuzEOoXrK9s73aNlTvm8VAtWRZTiahJDyT4V8YIIhUiGgfI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(261021121427099003)(261026121527099003)(261022105027099003)(261009220027099003)(261009221727099003)(261022075727099003)(261009221227099003)(261009223027099003)(261102123227099003)(261009223327099003)(261021123027099003)(261028144727099003)(261026140227099003)(22082099003)(6133799003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oLVRIRBFaFubZfIAzpVB9npaPaUB9yNxC9/5RMpPxDtARi/udvlC3blhn0/N?=
 =?us-ascii?Q?0FYSX+bwMLuIz3OuPnBztTvS3KVM2urNF3Q/UmvKDW0kbB2/Vst9sZs8Fu4b?=
 =?us-ascii?Q?io6fWwfipYBcot8Ctrlx0k8tMumOyqS/dE87CmUccoz14hb3ENJK2BUClWqn?=
 =?us-ascii?Q?AJIOV/nh0DWId5Pfai29y6v0wtHYOtP/z5v2ZEBTtq2rBJ4uE+yiDSP5R+pe?=
 =?us-ascii?Q?gHSA4blr7Tr2sP8y/6fxzj0uYUI1UKJc4IszTnmesQ07dqsDzQhpnADw/iDt?=
 =?us-ascii?Q?ryWTLFFupkD4yT+A84nef4maUYyP3CobB1Pc3QNfC2pVg7e2OunnBFPTTdPD?=
 =?us-ascii?Q?+5806CeePprVRlP4JIOk1WkanEVy+jeMbsniaXOgoBv5Bii5WcQ3gPmkaJ9O?=
 =?us-ascii?Q?YgMeGTG7oDvcPTUuQ16PoUYOZ8+MAyaamq11KMtO2+Wi4SGIoP7TIgPMI9WV?=
 =?us-ascii?Q?xYlnhduBe3BO1Vkl/TRR8/BMRDmZj6tJA3griDvYbEQ3lK/JlxIGuUmUhDUc?=
 =?us-ascii?Q?JvVjCx2MjjTG3zxEI228Lw/5VL+Nn8BFZyCmenqP5N0B/Y46oyNt9iEfxS/Z?=
 =?us-ascii?Q?5KtEchtx9iCiftroTBUT25nNE6SmORjY10gj7quCOel86byjEZehooUCmDU3?=
 =?us-ascii?Q?79kCztr1jmPHNKTzEteiI43z7iSCF6cHVDnDps5Sgxbw0eNhXbIgOozyv48S?=
 =?us-ascii?Q?XcnywVfVwvgwupwTIHgWd89Fz0fxhva5fEAtO1EmtLI7ySw/bTdeY2OP0QSx?=
 =?us-ascii?Q?hpoYvKroiYaNS+uSYmBk2UjgFPNpOP3loguoujEXuSUIEV2fDRAbPgb0Iulx?=
 =?us-ascii?Q?PB2VbbTceWBJ+Vev3z+EtksvrFgniiosTNsHbRzsn8+S4Ghol2t1F6IKtWhL?=
 =?us-ascii?Q?LVuOSFqF1dT16y46YPUoyz4xd9cu906aaOAJbbWG60f6wNWjH8w20HxWs3YA?=
 =?us-ascii?Q?6HiNdn1Qnl5WNyq3Vmb6LU1lawxqZhzIo06Y2T9r3UG22Pg4KVqPakelQagR?=
 =?us-ascii?Q?6f3ZCw3qra78Hh1C2+l5bJfbx5gj9WWyhA0lURWML+vz5sz2Zc2k44Dgb7G8?=
 =?us-ascii?Q?PZsIAckOHxE+AARzUQDBrXoX1XA2LFBdcG5p+a43O6X3nlKnosZ9VT5lxeRz?=
 =?us-ascii?Q?LEop4j0Ve0MpXQRBDKG9hNxgNVDNfKe1mptvaCQNfsc4nybUrPmxRN4zxwkL?=
 =?us-ascii?Q?OoUlwOBcQ4XerfOMgmDhYgnXuwBxjojurq2bv/Q9ApMdS0vwY3PQERq+2D3f?=
 =?us-ascii?Q?LrdjtoyjltQNOvSz6n8+4eG/IbFHH/H0TI0Sb1nAEKcyqcHIAkeuSnPEYntL?=
 =?us-ascii?Q?/l4k4uDMFN3xxY1JFvZr7MSjs6N9y0WkdvyUnKe8WnEoFbHYI1WRfWdmvjvj?=
 =?us-ascii?Q?2Xw53Q7asMkFfTgFBseeVUbOrjaWLeX8oz32+Ngrj4cnr91FgtU+erCY2Rc9?=
 =?us-ascii?Q?u+kizOU+JT0KhzWCGM2jtV2dknO1OQzUSSqxCB/RsvRh3Twjw52ep7mwCZ0S?=
 =?us-ascii?Q?MxFiKXAadIkIy4QkLzCucs0oyxvaEW4o2/JSeGwoQC7zbMIjw4aqiYWwoG3H?=
 =?us-ascii?Q?V7RqSftS0ZyNIiDB/txAYA/62opfZbM6RRwzaiEOZFcNuIco6Vi7h83XgIvm?=
 =?us-ascii?Q?SFuUC71g9xpoLEcZ484ph6C8N5rPE99mrUSLGsb9WyZDGyXweWvjRaJulOOY?=
 =?us-ascii?Q?vKaT9lLzMBPV4XL5la+v6sA3I+YqfbYg9CiyUN4SjFlEDePc488SvtxemS0a?=
 =?us-ascii?Q?DFNcK+aQBw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb2f9e1-6a9f-49f7-b302-08df3b2d4708
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 11:09:36.2432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fEpeOUJdie45UgZU265UdetJb8L8xWx80ITrJKu9b2+tRQAWPuV0cNR/RSS52shLFJeEEXIAdkvW/sXPKJRVxeR0VXdp68yemHDdtcn7CrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3462
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 11:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249529
Content-Type: text/plain; charset="utf-8"

From: Ross Burton <ross.burton@arm.com>

systemd no longer has sysvinit compatibility[1], so it won't try and run
the init script in this recipe that is also implemented by systemd.

Remove the explicit systemd unit masking, effectively reverting [2].

[1] oe-core d9ec9e20eeb ("systemd: Stop supporting sysvinit compatibility")
[2] oe-core 844f897710 ("initscripts: mask initscripts from systemd")

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2ace925cc4a23ff33a9bced602212fda06e4c5a9)
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../initscripts/initscripts_1.0.bb            | 26 -------------------
 1 file changed, 26 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipe=
s-core/initscripts/initscripts_1.0.bb
index 23411b6a71..ae386a6281 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -41,7 +41,6 @@ S =3D "${UNPACKDIR}"
 KERNEL_VERSION =3D ""
=20
 DEPENDS:append =3D " update-rc.d-native"
-PACKAGE_WRITE_DEPS:append =3D " ${@bb.utils.contains('DISTRO_FEATURES','sy=
stemd','systemd-systemctl-native','',d)}"
=20
 PACKAGES =3D+ "${PN}-functions ${PN}-sushell"
 RDEPENDS:${PN} =3D "initd-functions \
@@ -154,32 +153,7 @@ do_install () {
 	update-rc.d -r ${D} dmesg.sh start 38 S .
 }
=20
-MASKED_SCRIPTS =3D " \
-  banner \
-  bootmisc \
-  checkfs \
-  checkroot \
-  devpts \
-  dmesg \
-  hostname \
-  mountall \
-  mountnfs \
-  populate-volatile \
-  read-only-rootfs-hook \
-  rmnologin \
-  sysfs \
-  urandom"
-
 pkg_postinst:${PN} () {
-	if type systemctl >/dev/null 2>/dev/null; then
-		if [ -n "$D" ]; then
-			OPTS=3D"--root=3D$D"
-		fi
-		for SERVICE in ${MASKED_SCRIPTS}; do
-			systemctl $OPTS mask $SERVICE.service
-		done
-	fi
-
     # Delete any old volatile cache script, as directories may have moved
     if [ -z "$D" ]; then
         rm -f "/etc/volatile.cache"
