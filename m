Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C9ECC3DA66
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 14:38:06 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.45])
 by mx.groups.io with SMTP id smtpd.web10.15042.1692974276062525627
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 07:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=H1w8tArO;
 spf=pass (domain: nxp.com, ip: 40.107.7.45, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WKk3Hn+sZ9Y8F7r3js8uC+4WTzh+maBST2yzTdDITCMyuh2WpppPXTcZfVtrK5en7E6CpVz3Trziysuqn0Hy6vEs10vFhtF5ajnJF42M3WQqW/MCr1GkonGPYlfFA/LKu+eG7QI58W7AfuIs7WcepttdOoelRralj3NzKQjzlgGjAlbifkjfNeZTDkHCnPCt7KhpwjwcAJj5WoWiPD2hccCtIBDgCmCAK+nQePjHoIPb4zzFofFaUGhE7v5G5jUuLOixr0kFa6WtdmNnMzECaaTfz16E3Tx6hGAwf5dgIIC9C3waA9/sibEIDFwTLxeaW/FAXt7PHzRPJ8PdyY50bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vT19HEsrVfnL93v470Gn0Taapjt5+gDYHTjpoN2W588=;
 b=lyaVU55/CnQ19CwWonc/+GwlMRfOQ6CivuIAFu6fB8Hw6kk4jbXfk8nTNKT5BhEBMb0rOjUHtORFL1IznVWRjp09fZD+tfyu9Ekrov87811og8alFICyJUwdY06rtojSDV7mogRVmHrPq8EfTxkoOroNVPqTICr094rlJ9Ye/0jLWTod3ZJ/iEj8zVLI5jEY8uhcPE82p2leD/OKxtcr3itz+YklMaDMtRM9xZO+i2COl7i3GTFr53mGHV+B+gW8dIK59haM4tACrYZEw2t6aJO2sXyHsA+Nxn3ugoISahPXzkCfP5tlqhhqoWB5GiJA35war4HN94Iys9XWHdHi5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vT19HEsrVfnL93v470Gn0Taapjt5+gDYHTjpoN2W588=;
 b=H1w8tArOdaDFvJmUVmxMOmIrIiyOcVSZmf+/sk49ZLtOUYYYxZokqDkXkDqqgzKX90MVOMTAWQrr+JmM5qIZOkTypPnvqxXGz2d7tSe7fpuCPnW2aMbK3Dn59JHjlQfFlai0gZ07oJm50L/bfSDM2u9wWPl3LcLz2C2yswngIBs=
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com (2603:10a6:8:f::15)
 by DB9PR04MB8494.eurprd04.prod.outlook.com (2603:10a6:10:2c6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Fri, 25 Aug
 2023 14:37:51 +0000
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::b077:9a2:546c:d6e6]) by DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::b077:9a2:546c:d6e6%5]) with mapi id 15.20.6699.027; Fri, 25 Aug 2023
 14:37:51 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: Tom Hochstein <tom.hochstein@nxp.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"otavio.salvador@ossystems.com.br" <otavio.salvador@ossystems.com.br>
Subject: RE: [OE-core] [PATCH] linux-firmware: add firmware files for NXP BT
 chipsets
Thread-Topic: [OE-core] [PATCH] linux-firmware: add firmware files for NXP BT
 chipsets
Thread-Index: AQHZ1sYsnZloSA3k/EOlzvSF+X2Ama/7FZYA
Date: Fri, 25 Aug 2023 14:37:50 +0000
Message-ID: 
 <DB3PR0402MB38529DF900F5D80085F17E23E2E3A@DB3PR0402MB3852.eurprd04.prod.outlook.com>
References: <177E6A5CBC11CE3B.14626@lists.openembedded.org>
In-Reply-To: <177E6A5CBC11CE3B.14626@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0402MB3852:EE_|DB9PR04MB8494:EE_
x-ms-office365-filtering-correlation-id: cc08abe9-1466-4ecb-dbf8-08dba578dc15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 r1J4t6NGTR5mU0BTYWFKM3n9yRQNxr9HY/TAe2fwnWA933DEIIS4SBHROD1+AzH0xDZaSs97c+ypOeOZ13XwDVUbk+1vNWfZ0Tx+JrNzwCQ+pawL2K8MRC+PDSSSmmI9GFPgvoEo2HwH1ei4dCHG3YTMa8+JGvvyTdao60OpT5miRGEJ3XuPI8ww4SGkMQjahVxZFSjV7Dj/8ERfPTBRjnh5SpuV+/cH/3TUNqanlQYxp+3csUo4xuV0LwzyBsBa0qUqLP2j50YlSmuHV0OgDtovdJmBBY26aWBG0tO+d/42Dr+wapQfxRKg5LEyuULiSfZhW4ExrOKUrOj9pP6qPKR5A90QwQC1QZjmH+4/6vzXSlhSZMTn+mpmPASV86PJsSiazIhO9ZRtRYK6oOjjrhM+3AIPEKDuNi7l7IRsb+fca+Mp37aXTF5Sy7DQDZFq+WItgarjvbTVhaSA6SEi64s30sMl7KYRfCy5Nh2zLMIT8cu3ABI1u0o6TFJ1ZuAwEmMZHvwjuad4yCZvWy6rTsTBDRNdwi5TcpeoO9eGYGSpMVjvU+s8yOY/hLsb3n4LSTzV3fR1UUQ3klzXSlmnFi1LEeICWblI1lVHH1vOkg0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3852.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(366004)(39860400002)(376002)(1800799009)(451199024)(186009)(44832011)(83380400001)(9686003)(478600001)(26005)(55016003)(45080400002)(5660300002)(52536014)(2906002)(966005)(8676002)(8936002)(38070700005)(38100700002)(122000001)(66556008)(66946007)(76116006)(66476007)(86362001)(71200400001)(41300700001)(64756008)(53546011)(55236004)(33656002)(110136005)(7696005)(66446008)(316002)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?zbIoufy5mNo4qETguX76aPm5EtpCXJK+ntLttVETuErH3F+acSffsKe0oM6Z?=
 =?us-ascii?Q?Na5aQpqMLR2VmhYE3XfChIhEmRFX7S7cOZTeDCjqSHGfJO04rayq+vOwoKl8?=
 =?us-ascii?Q?aABILjcM9VPaB9nJfgC+DLTcJO/Qg+h8nt5n40GrLxDq0a3QbsB5wO0ZZwOk?=
 =?us-ascii?Q?Hp8I+nH+PEwetYAbiJndnkYE5bqcTS1xr/jkLACygkbBrox+KnFxdvxcBzgN?=
 =?us-ascii?Q?4j/HlO4AdHq9oerJOnl7A/czjQiAizghTNE9oA0mfi2KJgJ36K3Zl6UxD1Sf?=
 =?us-ascii?Q?qiwFbK9hq2M2DFDgjxpHN9HM4PxbBO08r/cJ1ooeIhyW3N8wXJGBMuQ0JdTU?=
 =?us-ascii?Q?1Ox5HLtHxeY0udnX7Y2GfjMo+WsDEkOfyXIh6r2z69urdjQO+3ufL37jMFVn?=
 =?us-ascii?Q?Fy2FRDjx/609MofcLT3AmvO8arjyXm/IIXGYjNZOtPc6/eXLck9TL5qv++Pj?=
 =?us-ascii?Q?2KjtrXkpSOaudS8AGZhDGrkTVcHz/7m71ZsbexP/wJMgR5qfClD68jZ3uAKg?=
 =?us-ascii?Q?8Zvf06i0iCt8VBwCVSUXtpicn/J0myoZuXhy/ZAFKeOWV53sns4ddC8P6cbC?=
 =?us-ascii?Q?2hlfSk6b2KSSFNzB37cFvbaMatVtsmjhUHnfx2ypRopd4FSfUDITaxbA8ssA?=
 =?us-ascii?Q?UEa0Le3ZCli2NKFHKHcnci6D9TDhUINsoMJ6K6FJj3wfn0gROFiqn/6yK8Qw?=
 =?us-ascii?Q?jMBlKjHCSgYdjiF2DfUEqZGxn7UhcCo3LOdPfm/hst8LJ1i0rCDzpzSTGK59?=
 =?us-ascii?Q?bzue9KLqDN7oqb0zG5Zee4Y+hfz7Hs6Nf7figyZEm7zuRcIUA41/9VGovfqK?=
 =?us-ascii?Q?Etf2tnR0m4vp2YSs7iHM5i6swiGg3S+rJdUuCt1BOJhZxKcqEii6UpUoWQXz?=
 =?us-ascii?Q?HoABqW51edSwc/byLJdguuC7GnJBbfvquU3wENONE6t7Z9nO050/5cv1lr5P?=
 =?us-ascii?Q?0vvA/rz0vT9m0rfVwNyhuVkwhQp0rQkUgJWVPjreimX6JM3R8nZBbeQkum9j?=
 =?us-ascii?Q?0cNBk/N8yqAzkhrybWOniEtEs7QzJo8YfUAFkdzPDLKT+Schano5TqUd4SHN?=
 =?us-ascii?Q?v5EpHi0sqXR194VicyZ7NaEmNMX6PMbSaXmAJZLquQXT5PnWhfCzF6iTf0xH?=
 =?us-ascii?Q?RJXemtKYvIaFZ/mswjwnmnzPxYARDh2jOtRSkOZR6s2POK2wwCquPkFWL/DN?=
 =?us-ascii?Q?YZqya5qSt0xiKtblUcbzG3sDTEH2buCwlE/sK8xhLEs4FWGnyKLTCDjIemGj?=
 =?us-ascii?Q?gOJbmd4W+lChwEBITQqAXxh/WxjxJmWMcnzBo7ly5LMizqNS/WxBmS/frR+i?=
 =?us-ascii?Q?H/AJybuJcOW8hNSckK+DCVpPDAmHc0bdR1Xb4hyfmDSeKcuwZQI1PJoy1dvv?=
 =?us-ascii?Q?ORRv0CvspUM5hVwUnsVVh9+F1ml7/vzau7nBrqXkouKR0jIcSMlK8MQB4IOL?=
 =?us-ascii?Q?BTydiNTABUh5t+MuppbonFk3X1dnKEWoeGjQyStHrjQOd2SPBiZhMSM2prpR?=
 =?us-ascii?Q?cRH4zu4iWFYw5HGu20jUa0Rj9qLbyK0niB/Kwz9jBSuEoS46FSwtN6+18QL7?=
 =?us-ascii?Q?URErYvSKhee8FSWLUau9XHSPSogZVETxNmT38IJS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3852.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc08abe9-1466-4ecb-dbf8-08dba578dc15
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2023 14:37:51.0090
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PJjplnL9FkZ/NnHCpyORTk3+iD2PLVP74tAYAozTjNhRHuGUYImq+I/ZopndmQiO4yMXmyJHG2W5IqL3KpuJnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8494
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 14:38:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186709

Please hold off on this. The -common design is not working correctly and is=
 causing those firmware packages to be registered as a runtime dependency o=
f the main package.

Tom

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Tom Hochstein via lists.openembedded.org
Sent: Thursday, August 24, 2023 3:04 PM
To: openembedded-core@lists.openembedded.org; otavio.salvador@ossystems.com=
.br
Cc: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [OE-core] [PATCH] linux-firmware: add firmware files for NXP BT ch=
ipsets

These BT only firmware files are submitted for NXP chips.

88w8997-bt:
uartuart8997_bt_v4.bin version: 16.92.21.p81
helper_uart_3000000.bin version: 16.92.21.p81

88w8987-bt:
uartuart8987_bt.bin version: 16.92.21.p76.5

88w9098-bt:
uartuart9098_bt_v1.bin version: 17.92.1.p136.24

iw416-bt:
uartiw416_bt_v0.bin version: 16.92.21.p81

iw611-bt / iw612-bt:
uartspi_n61x_v1.bin.se version: 18.99.1.p154.40

These firmware files are downloaded over UART interface. The
helper_uart_3000000.bin needs to be downloaded before
uartuart8997_bt_v4.bin for 88w8997 chip to set download baudrate
to 3000000.

The above commit message is copied from the source commit message:
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git=
/commit/nxp?id=3D1f82dd25c3ea59b6bed80ee685d860f0c5f19875

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 .../linux-firmware/linux-firmware_20230625.bb | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb =
b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
index 6765226b9d..45556d419e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
@@ -40,6 +40,7 @@ LICENSE =3D "\
     & Firmware-myri10ge_firmware \
     & Firmware-netronome \
     & Firmware-nvidia \
+    & Firmware-nxp \
     & Firmware-OLPC \
     & Firmware-ath9k-htc \
     & Firmware-phanfw \
@@ -105,6 +106,7 @@ LIC_FILES_CHKSUM =3D "file://LICENCE.Abilis;md5=3Db5ee3=
f410780e56711ad48eadc22b8bc \
                     file://LICENCE.Netronome;md5=3D4add08f2577086d44447996=
503cddf5f \
                     file://LICENCE.nvidia;md5=3D4428a922ed3ba2ceec95f076a4=
88ce07 \
                     file://LICENCE.NXP;md5=3D58bb8ba632cd729b9ba6183bc6aed=
36f \
+                    file://LICENSE.nxp;md5=3Dcca321ca1524d6a1e4fed87486cd8=
2dc \
                     file://LICENCE.OLPC;md5=3D5b917f9d8c061991be4f6f5f1087=
19cd \
                     file://LICENCE.open-ath9k-htc-firmware;md5=3D1b33c9f4d=
17bc4d457bdb23727046837 \
                     file://LICENCE.phanfw;md5=3D954dcec0e051f9409812b561ea=
743bfa \
@@ -174,6 +176,7 @@ NO_GENERIC_LICENSE[Firmware-moxa] =3D "LICENCE.moxa"
 NO_GENERIC_LICENSE[Firmware-myri10ge_firmware] =3D "LICENCE.myri10ge_firmw=
are"
 NO_GENERIC_LICENSE[Firmware-netronome] =3D "LICENCE.Netronome"
 NO_GENERIC_LICENSE[Firmware-nvidia] =3D "LICENCE.nvidia"
+NO_GENERIC_LICENSE[Firmware-nxp] =3D "LICENSE.nxp"
 NO_GENERIC_LICENSE[Firmware-OLPC] =3D "LICENCE.OLPC"
 NO_GENERIC_LICENSE[Firmware-ath9k-htc] =3D "LICENCE.open-ath9k-htc-firmwar=
e"
 NO_GENERIC_LICENSE[Firmware-phanfw] =3D "LICENCE.phanfw"
@@ -309,6 +312,16 @@ PACKAGES =3D+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-nvidia-license \
              ${PN}-nvidia-tegra-k1 ${PN}-nvidia-tegra \
              ${PN}-nvidia-gpu \
+             ${PN}-nxp-license \
+             ${PN}-nxp8987-sdio \
+             ${PN}-nxp8997-common \
+             ${PN}-nxp8997-pcie \
+             ${PN}-nxp8997-sdio \
+             ${PN}-nxp9098-common \
+             ${PN}-nxp9098-pcie \
+             ${PN}-nxp9098-sdio \
+             ${PN}-nxpiw416-sdio \
+             ${PN}-nxpiw612-sdio \
              ${PN}-netronome-license ${PN}-netronome \
              ${PN}-qat ${PN}-qat-license \
              ${PN}-qcom-license ${PN}-qcom-yamato-license \
@@ -543,6 +556,42 @@ FILES:${PN}-netronome =3D " \

 RDEPENDS:${PN}-netronome +=3D "${PN}-netronome-license"

+# For NXP
+LICENSE:${PN}-nxp8987-sdio =3D "Firmware-nxp"
+LICENSE:${PN}-nxp8997-common =3D "Firmware-nxp"
+LICENSE:${PN}-nxp8997-pcie =3D "Firmware-nxp"
+LICENSE:${PN}-nxp8997-sdio =3D "Firmware-nxp"
+LICENSE:${PN}-nxp9098-common =3D "Firmware-nxp"
+LICENSE:${PN}-nxp9098-pcie =3D "Firmware-nxp"
+LICENSE:${PN}-nxp9098-sdio =3D "Firmware-nxp"
+LICENSE:${PN}-nxpiw416-sdio =3D "Firmware-nxp"
+LICENSE:${PN}-nxpiw612-sdio =3D "Firmware-nxp"
+LICENSE:${PN}-nxp-license =3D "Firmware-nxp"
+
+FILES:${PN}-nxp8987-sdio =3D "${nonarch_base_libdir}/firmware/nxp/*8987*"
+FILES:${PN}-nxp8997-common =3D " \
+    ${nonarch_base_libdir}/firmware/nxp/uartuart8997_bt_v4.bin \
+    ${nonarch_base_libdir}/firmware/nxp/helper_uart_3000000.bin \
+"
+ALLOW_EMPTY:${PN}-nxp8997-pcie =3D "1"
+ALLOW_EMPTY:${PN}-nxp8997-sdio =3D "1"
+FILES:${PN}-nxp9098-common =3D "${nonarch_base_libdir}/firmware/nxp/uartua=
rt9098_bt_v1.bin"
+ALLOW_EMPTY:${PN}-nxp9098-pcie =3D "1"
+ALLOW_EMPTY:${PN}-nxp9098-sdio =3D "1"
+FILES:${PN}-nxpiw416-sdio =3D "${nonarch_base_libdir}/firmware/nxp/*iw416*=
"
+FILES:${PN}-nxpiw612-sdio =3D "${nonarch_base_libdir}/firmware/nxp/uartspi=
_n61x_v1.bin.se"
+FILES:${PN}-nxp-license =3D "${nonarch_base_libdir}/firmware/LICENSE.nxp"
+
+RDEPENDS:${PN}-nxp8987-sdio +=3D "${PN}-nxp-license"
+RDEPENDS:${PN}-nxp8997-common +=3D "${PN}-nxp-license"
+RDEPENDS:${PN}-nxp8997-pcie +=3D "${PN}-nxp8997-common"
+RDEPENDS:${PN}-nxp8997-sdio +=3D "${PN}-nxp8997-common"
+RDEPENDS:${PN}-nxp9098-common +=3D "${PN}-nxp-license"
+RDEPENDS:${PN}-nxp9098-pcie +=3D "${PN}-nxp9098-common"
+RDEPENDS:${PN}-nxp9098-sdio +=3D "${PN}-nxp9098-common"
+RDEPENDS:${PN}-nxpiw416-sdio +=3D "${PN}-nxp-license"
+RDEPENDS:${PN}-nxpiw612-sdio +=3D "${PN}-nxp-license"
+
 # For Nvidia
 LICENSE:${PN}-nvidia-gpu =3D "Firmware-nvidia"
 LICENSE:${PN}-nvidia-tegra =3D "Firmware-nvidia"
@@ -1125,6 +1174,7 @@ LICENSE:${PN} =3D "\
     & Firmware-moxa \
     & Firmware-myri10ge_firmware \
     & Firmware-nvidia \
+    & Firmware-nxp \
     & Firmware-OLPC \
     & Firmware-ath9k-htc \
     & Firmware-phanfw \
--
2.25.1


