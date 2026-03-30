Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE8F71061B15
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 16:23:02 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55561.1774887773904707916
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 09:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=pg1Cv6CE;
 spf=pass (domain: axis.com, ip: 52.101.66.27, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JfmWqCvFAbS3Qa9xjrUclfwLJxrwY34B0jld53T8HW4zn70WqjlFo1XVtgVBKhrShxMRZqr1qXnXT7RWjTqERzAvhboIMATluRMDsXD80n4CoAgC5UeSv9FhdZ79YvElxRnW2aXj3rIqwhhacPUHaoLHGPcIFm1TQywVgxPHo9cMRxYwvxzvXLBjrGEtP68fBaDDFopc6QbBGqt6LIB2x5wz2whLOnSDmpmHav90x8Zw8zfo4XvM65AnCbfnpPU7GCVGTK0ZMX1ABUUjXXF04QJok4hkmyFxEs6VfQ74N/Ww3VK2YpyCVmbh1RQe3ce0nV0KMuuoncrGJMCr4FMcMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOMVKGgHevP1Lg4TR9T+KkkUkiNLpZoZeNV+T7UaW8U=;
 b=txKL3f5g+rm16oHhCqb5z4OTZX0iRJ0ckvJM2Zpi1U3xaO2TJGo+RTOjI945MZsPTmH5Bj16a9WdsUT3HsI8kuIZaTE8yQ5/lQXzwlGqh0Zn6qwBzR8T/g5X2yiihiAMqN8TRldU3e5VlFPuHsJCyB5sOhU++2IjABWFQsx5C3HIwKyJ3KpJH8R1vfNvUeotXNOwJWM6KKBJO0sskODChZtZ6Uyqxd0zewuwMErA8glCB+GqYN0Itqff/IKV+3jHyU00/pqLdfbJ5uC6l1K0P0VW/RYuILaoJvV+D3f6eJH14srAGlmw0C5HBtboAMYWJ4N28CUEwmWwFFUMtCLjgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOMVKGgHevP1Lg4TR9T+KkkUkiNLpZoZeNV+T7UaW8U=;
 b=pg1Cv6CE4pbma6uwMpGvvukKYSFbLQ33GrbDWXzbJ1ZENBBQXzClem6PysDciIfqkzz5HNtsqzJgGpJPWGAUHibveFWClrmU6MyUq4Q1wnfAXewfnANooslqgZ6yegQuC8lFlPE1rC6tSA3tdi3chSENafiMv6DrL/SnK5AxZLE=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by OSKPR02MB11435.eurprd02.prod.outlook.com (2603:10a6:e10:98::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 16:22:49 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 16:22:49 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 10/10] gstreamer1.0: upgrade 1.26.9 -> 1.28.0
Thread-Topic: [OE-core] [PATCH 10/10] gstreamer1.0: upgrade 1.26.9 -> 1.28.0
Thread-Index: AQHcq8JrmSM+ut1aa0usJT8b8JwZN7XHabnQ
Date: Mon, 30 Mar 2026 16:22:49 +0000
Message-ID: 
 <DB5PR02MB10213FE000AAE2E4B66AD8618EF52A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260304103203.1649-1-wangmy@fujitsu.com>
 <20260304103203.1649-10-wangmy@fujitsu.com>
In-Reply-To: <20260304103203.1649-10-wangmy@fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|OSKPR02MB11435:EE_
x-ms-office365-filtering-correlation-id: 45d99d64-1a15-484f-65c6-08de8e7895bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: 
 IhdHNfmXvTFrPZEpxQalpghQPVPeYG1VuK44PuCzxoyV2MUnRsKpdqS7xtwgm0XxxmX5P43+ryFhQ47fxgsNAk+83JebX3PB1W0FZ5r7k/lIyleQ3oGv3dN1ExQ/etZmvqNoB8Thu/y/JbIYGCulVhqOgbHboCAstqIW6xVut/z1/3PSJgHp8p68W6UGtYca4E0TaTK0jyUtrmGBxSvpnIkvkySu0+c7Eju9eEzZgjxe5fMBUFCc/BB0UifhB0hkAyIZrj1U0jMsMArz0keX5JyUeyNY2/HoEG86beENmgogqCBgsWrLf2jcT/XmILsS+Nr2oGfTzw75+J/Fm2vSJVQod6PxpupBtrALjg4rJPye4zp7K4T8uafqTV5UgjhLAefEvZp2gjl2RPB12MuMKYs7YvjNweLr2uhjxHMRlJJoftkgBUku0MAPfTwHopUDoADdZNqUndXwIhsTbXIUcqBsF1WnLoecx4PNY3dz3N6kRHAHBVXa++P47oNPvsJ8osIRnF3wcdy1rDS/MwA76TfwEazoNQpe6Lv6RsCxxLlTxbPQfCClRk+P5le8y5+v/0Xuz9wvuKFlzZi9p0WdBDVSnqgG9Rn3SHnb+m5SMNPpibUDbIRk5+jd4rdamaRgyAdx4nV+U/6z5MPitdTKSBD+FKoqB0KTO9QZJK0U5zqNs4epFNcmKKdUtM5qJDoeOAazbpXEruE90CbyWewhwzPjmryw/TEItSMqPdHjRsg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?/PPzfyJA/H9yQ9/TVdov+XSfkeit1M6HE2c33sq18ZY9WxzKsF/w6xjjWQf4?=
 =?us-ascii?Q?Cy0k1tGldg+cQR3jFyR5lCOOjc9wXoexm1nEUn1kzKIVBJBxBgXbI0dQhTAU?=
 =?us-ascii?Q?suwWtRZX+otwW9c/dYKJGkqqpmCBQD9pKRG80pILVbDxPYPyETy9C0MUDiof?=
 =?us-ascii?Q?yC3EuEP/cZITio2RVTaLR53yioqE9P9us+tKU/s+5vJV1nFagSKnPr/Yypvw?=
 =?us-ascii?Q?QPdPuZh087L6VwUrJseFxwEV+9Blb9cAG4UflV8WzzR3Hjrrxc0sMs4shYcW?=
 =?us-ascii?Q?JujedyNsnQxx3z+WkecrpE7MlTn9CrnMw9jEnKvFq6rPqeNU/Sq6VAYL7PWZ?=
 =?us-ascii?Q?EQAFUS/2iwtFImJ23hZ7y4N+/T95mmETKyw0BRGej/UXTwcJtI42brG2RbbX?=
 =?us-ascii?Q?x9FDhShVe/pTQteehdqIb2EWseWMCBI2sBE7vS96oi7LNh0ry9mp9GuwnYa8?=
 =?us-ascii?Q?NqmAfFpjFf3yWa1cVtc1khcpnD3NpkOripvV/tz0XmfBxogguk0Ky33/ZBZO?=
 =?us-ascii?Q?6XMb/TmqRcfDJps2QbcucfXbTZwqsfI1lUaQ0CfUSQoeJ+/qpusqBEDLl+wB?=
 =?us-ascii?Q?O7q9rD7amMsqQ/8OOVjCMiQwwC1h51yOBVedsD4Ehsmetq0Cc1lMGJ70qnvU?=
 =?us-ascii?Q?+F3uQNitSO84s9SCzV9oGLleaAPGjnSNGfgf1kdJ6KPPEWLg1EJQb6XpMdYG?=
 =?us-ascii?Q?jRpGEz9oXdAb/BNnMShHWRxGvLjjine2hktl9iI4FmxBsWGaikvtretBeynV?=
 =?us-ascii?Q?6d/h2Ez2yYm/RZHsoX2GXCf9bKd9E8NMkEWWIQqLz3/rTBlenfpxUnkzy8ga?=
 =?us-ascii?Q?BSFIhXtiiMBM1yPYZwd+2lfd9aTzoy5WkRTOkNLWX0fR46fEmhC7UU7LMMUs?=
 =?us-ascii?Q?mfNAzkPgXzxkVBxCouXFv3UmZG1Z3c9VC+BIHF1IBPoIUhklxlwNDhJb0fhv?=
 =?us-ascii?Q?Nz22Fej/A8MpmHAAeYaA02VHxP5af1olaVq0cCbW+pS0TVCtnkyaEAAALC7J?=
 =?us-ascii?Q?2progABDQUJAa83JVYrOgN/3uXV71ooCU1DsRPiqg/CWU2/IAsc00/TrsYDv?=
 =?us-ascii?Q?yZo//S0tR31bTk3JOhPuV2z4X+tWojbGRagrLC9iutqWR6+b0x6FnLTcUh/V?=
 =?us-ascii?Q?1F900iM+QzZhc5k/SkY9vm/9InMqfCxSpT1Ab8U1vK7qdMVuBB2MpQcbUL6y?=
 =?us-ascii?Q?hMKSH6acm0ijrMUVcWWmnKyW13KmcC5fhyNenJj2CCu3DP0q/gw3qUTk5zzn?=
 =?us-ascii?Q?wpeAOj7dgD1I93jBbCxDDTyejlggkA7iRxs5N9Riiev6TpDOiy/HhSrtIYsp?=
 =?us-ascii?Q?tff/ICkAo+gcXe+LS/pFDdv0FDiXXdF8jhlH+woCgB6fXHLeAemFtwilTBQx?=
 =?us-ascii?Q?YfnyQyJFTKBwT48UfwPF2mxSU4EUEuk1J7jBUPCmBg5vVx5YDWxULAh0X7W1?=
 =?us-ascii?Q?GcAP7o+a1Uv+OuGO5KV3aDPT+LGgexEtk22dcMSciUmorVsfAy/kHdFEXq22?=
 =?us-ascii?Q?P6GEAQW1n4SyfwSvPXJ8NBLOCEYkOq12AHy1gqKw4i1z7nevXv1S6//o9yfr?=
 =?us-ascii?Q?mM56djVkG8nL0m6Mp41SAXgEJfbaza4eNyDEeDAYblWnLsNsFyOEUFL6YjLt?=
 =?us-ascii?Q?i0PDKMMuYuG4yeduS3nZpj2TtBEXvTlrJXWYXwLzAFC1pu7A8AepFBAv3JQv?=
 =?us-ascii?Q?E4z74nsb6uNHM+23GM1Pg+HbfU8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d99d64-1a15-484f-65c6-08de8e7895bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 16:22:49.2600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dNy5Vl37FjtGY7NG8qVvZ3uHQ6zwW2Z7hPXYwdiHWUJiww6B41Q3atH1/AAXLfPL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR02MB11435
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 16:23:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234252

What is the status of these patches, which upgrade the GStreamer recipes=20
to version 1.28.0?

I do not see them on neither master-next nor mathieu/master-next in=20
the openembedded-core-contrib repository.

//Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of wangmy via lists.openembedded.org
> Sent: den 4 mars 2026 11:32
> To: openembedded-core@lists.openembedded.org
> Cc: Wang Mingyu <wangmy@fujitsu.com>
> Subject: [OE-core] [PATCH 10/10] gstreamer1.0: upgrade 1.26.9 -> 1.28.0
>=20
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> 0002-tests-add-support-for-install-the-tests.patch
> refreshed for 1.28.0
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...2-tests-add-support-for-install-the-tests.patch | 14 +++++++-------
>  ...treamer1.0_1.26.9.bb =3D> gstreamer1.0_1.28.0.bb} |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.26.9.bb =3D> gs=
treamer1.0_1.28.0.bb} (97%)
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-ad=
d-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/g=
streamer1.0/0002-tests-add-support-for-install-the-tests.patch
> index ccfc869813..720a6f0c97 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-suppo=
rt-for-install-the-tests.patch
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-suppo=
rt-for-install-the-tests.patch
> @@ -1,4 +1,4 @@
> -From c33063360791e178de138304e29ab2264582d917 Mon Sep 17 00:00:00 2001
> +From 92e7d4090fa458bf02d3418cd01c960982821e92 Mon Sep 17 00:00:00 2001
>  From: Jose Quaresma <quaresma.jose@gmail.com>
>  Date: Sun, 11 Apr 2021 19:48:13 +0100
>  Subject: [PATCH] tests: add support for install the tests
> @@ -12,17 +12,17 @@ Upstream-Status: Submitted [https://gitlab.freedeskto=
p.org/gstreamer/gstreamer/-
>  Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
>  ---
>   meson.build                  |  4 ++++
> - meson_options.txt            |  1 +
> + meson.options                |  1 +
>   tests/check/meson.build      | 22 +++++++++++++++++++++-
>   tests/check/template.test.in |  3 +++
>   4 files changed, 29 insertions(+), 1 deletion(-)
>   create mode 100644 tests/check/template.test.in
>=20
>  diff --git a/meson.build b/meson.build
> -index 0a77e90..cadfaeb 100644
> +index 8adc055..b5c9e5b 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -664,6 +664,10 @@ if bashcomp_dep.found()
> +@@ -667,6 +667,10 @@ if bashcomp_dep.found()
>     endif
>   endif
>=20
> @@ -33,10 +33,10 @@ index 0a77e90..cadfaeb 100644
>   plugins_install_dir =3D join_paths(get_option('libdir'), 'gstreamer-1.0=
')
>=20
>   pkgconfig =3D import('pkgconfig')
> -diff --git a/meson_options.txt b/meson_options.txt
> +diff --git a/meson.options b/meson.options
>  index 39255cf..78af552 100644
> ---- a/meson_options.txt
> -+++ b/meson_options.txt
> +--- a/meson.options
> ++++ b/meson.options
>  @@ -16,6 +16,7 @@ option('poisoning', type : 'boolean', value : false, d=
escription : 'Enable poiso
>   option('memory-alignment', type: 'combo',
>          choices : ['1', '2', '4', '8', '16', '32', '64', '128', '256', '=
512', '1024', '2048', '4096', '8192', 'malloc', 'pagesize'],
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb b/m=
eta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.0.bb
> similarity index 97%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.0.bb
> index c66f614629..63633fea05 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.0.bb
> @@ -22,7 +22,7 @@ SRC_URI =3D
> "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
>             file://0003-tests-use-a-dictionaries-for-environment.patch \
>             file://0004-tests-add-helper-script-to-run-the-installed_test=
s.patch \
>             "
> -SRC_URI[sha256sum] =3D "8ee8772e468102ebe86d414d8c4c7440dd91d9f3e9396952=
ff23aecde80670c8"
> +SRC_URI[sha256sum] =3D "6c8676bc39a2b41084fd4b21d2c37985c69ac979c03ce595=
75db945a3a623afd"
>=20
>  PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests',=
 '', d)} \
>                     check \
> --
> 2.43.0


