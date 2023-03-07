Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B690EC678D4
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 09:23:23 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.10574.1678181000038983654
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 01:23:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: 2n.com, ip: 195.60.68.18, mailfrom: kubiznak@2n.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZRVPEIDtuV1dHdNpuulONIeKmM7l0s7GTWAJ7QjZhE3Qc8wIkOSeLsBGwOguqXW9DiBmheSk/XhkeoJk3xtZguNz7yDmk2dsQaDPu546QUM6BoRkl09mS9N1uFmz3vteUKYJV8Z3B4/cKQpOnh4iBloil9HPSK0QKo+aH4NKZmL6vOI6VR4tfxu68p61qj3ddT6+AWUEA2buovC5uintYt/vD3xGUM5uh87Qp5tGUYCtppz0Cf+rDRRZw6PplUlzUfI3JKVMzcqAvb2W50BeTel9xPAl1RMQBRUmiw6F7CFb1engWHkeHBVbIon0I63ajVjomAopf3uo4YZQHPoIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/g07ubyV//TUbXU3d7bad2ZJTitfqr5adVxyyyBaCpo=;
 b=lSC0opCBXVb+wSveOyaFnyyAvdH+waRmyRVo7Bk2bXA0rsXHK+RdcerY6b0DJKGl7sMaVOTCRQV+cKh6nn7Mx13Vaneg0JfIgX9R/PI+XMjSRIgb+YcGm0wrLZEembIgCcADt/FfKzGleRmpcfrv3Bn+3DJyiEn+DVj/Wx1G0LmOM3Gu1xsV+6NIBO5daMr7SX03kKysWKC8LxuG/AX4ZVWFdHHcpSnD0Nr3Wunhf8RfmkBq/Qwz9K9HaNtZAYSKMjNB5RYWacO7u2nfM2PCDpJJMFVamtXSqnjuSnvKWhjn0UT6TIDuLEgjshFqH3L12TcSvQDX/DRYRBH8wUay4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=2n.com; dmarc=pass action=none header.from=2n.com; dkim=pass
 header.d=2n.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/g07ubyV//TUbXU3d7bad2ZJTitfqr5adVxyyyBaCpo=;
 b=I93uviCmxE0unvhXR6OurzhY1tqqr4Nsb4ff0yJrO8jKUj6m2iU9GCwfFVtDMwkhNbyC8VxhCAMfUqO9sfqlXflc3u3ecLFIoeVXnZkN12Hq6q+JCnYKBBj7m5t+93RoiYhXGP/HuzS8IVelZ1DttoqIRDzNdPLcnA8FKSDimKk=
From: =?iso-8859-2?Q?Petr_Kubiz=F2=E1k_-_2N?= <Kubiznak@2n.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] graphene: remove introspection from
 PACKAGECONFIG
Thread-Topic: [OE-core][PATCH] graphene: remove introspection from
 PACKAGECONFIG
Thread-Index: AQHZQqQ/T48fyHDsPUmIa0YsbTnmUq7vJuRi
Date: Tue, 7 Mar 2023 09:23:15 +0000
Message-ID: <DB4PR02MB10030B5C7A26DB7E9DA54B42AE2B79@DB4PR02MB10030.eurprd02.prod.outlook.com>
References: <17448D1AD5EE07BA.28744@lists.openembedded.org>
In-Reply-To: <17448D1AD5EE07BA.28744@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=2n.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR02MB10030:EE_|AS2PR02MB9119:EE_
x-ms-office365-filtering-correlation-id: 5c8383fd-0941-477f-9c97-08db1eed94f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2xjpvRh4JgVldiEBKuL0OW2mmZJs+spx2yYh+jzybY5M+OBOeDh2OGAoGX9xB84wDIu2GFD0SdXw1sg96FL+WTh0nLE9kPy5P7lircCu4K9H05UUM9SJMFOAqiPTAHp0SbLxQTMwpyqWZL6N6Ja6mrZh4PBb+Y/I8qDflfnpolu+1pQFAZkdzUKADXGmgdsWgi1XXJ/oI2GUDQannfECGRsn/elLkzUgsr/MlnjiGSBPRO9pX8KCBaldbjMxl24MLIaJWEPFLxe9K/dhiHzPm+0+g4Q23Qg/pN7vK4sqFiRo6CK3rJoDbS8ldwQ0q7eqW1j8vpUH15EanyAa4gt4qiX4BZJSJmoKWFvfHNfLrA9wfzvzi9coiu3uKh3bsXtZtKGEjPauE58PDQXyP0nVT8tNCU4einL2ax9w+h5S1EAY+sP0e0tcTKvunirsWSRwvcCNHeEXYW4dN/7xctiM7bz/1Iyo3IwiVIdpj3UJ6FLH50tw1pAEPDN5IqmMOH/yzZDmKR+yA6dgTxGZ9VmzZM0fXjKPt/rElk/Z3qTANmaJ+9zflBAaR8CVVqZq1qUflKGExM2xLPDyq2BeOdKoxpE//cEnxUiPLdL2yqpkXxXdYhmW107SC0qCbwhmJb5+bnT+orrVuLghB4j+8mK2eUZVRlZaPyDjuNAsQByzmIUjnhtIdzOdbrAFLgwWh//2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR02MB10030.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199018)(9686003)(186003)(2906002)(91956017)(5660300002)(38100700002)(122000001)(38070700005)(52536014)(66946007)(6916009)(8936002)(8676002)(41300700001)(76116006)(66476007)(66446008)(71200400001)(7696005)(66556008)(478600001)(26005)(64756008)(53546011)(316002)(86362001)(55016003)(33656002)(83380400001)(966005)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?sqLSH6CJzZBq+Jwc+74xvyF9wYFRDFT0ZJmfz6VPseKkwqtLcrQEngNo/v?=
 =?iso-8859-2?Q?I9KgGYziZ++AjTGseHwr2iGIEEY+kOZsTdOMDa7tC20g41xvr/ZXiZbXka?=
 =?iso-8859-2?Q?B2uPZTXN8h02TH4HH8hgOqh4NNigW5k6yCACTtP6PRsruqMUKUuUUhVMpq?=
 =?iso-8859-2?Q?IuHrOolla2KJs4x5ZzXH8H+xQOQYWNooiaQMKkaQ/eLDbGKt6Hn1zE6GfP?=
 =?iso-8859-2?Q?DPbkgmgXv57fLBkcIljFmmNXh1Pw3D5us73SoCEjtbxRu7dE96L3l24T1x?=
 =?iso-8859-2?Q?AI8vf15Z7Fj45z23wj6QS5pf3eIVcl7nqk47VcqYKT5lbRvpXv7hMbWnum?=
 =?iso-8859-2?Q?K1uP4H/McvO6euDUqLqB7DXORCfzCKviH//S+yirU6q9XOHF4Dp+tx/wbu?=
 =?iso-8859-2?Q?r5HA8eW3T5eZYlTQ79rRtFunnRCHYfX7oCj8PavKEBS25ZMCFDruw3ERUY?=
 =?iso-8859-2?Q?EuuvZkR9u0Kf5Lz9H7sKZIpcfG/k6AEWjiGAK70Q/vp2KIFFs45SyvrSZU?=
 =?iso-8859-2?Q?GHqj61eMetv3s++pduQTHYG6fspmRqiNP9bSNmqgrYjqi3R6ymu4VFdbax?=
 =?iso-8859-2?Q?KhG1Cy8JLd186y5MlAjoVnMs37UOdoKViKXRNv3plajlei9RcyUCjyChy4?=
 =?iso-8859-2?Q?IxStPAhVWEDGA/CZPiCykQlP6Avqd6u5wZRk9Boze75KImyQ0LxwwMbdFs?=
 =?iso-8859-2?Q?0ILlyW2PuKuxZG83GPfKs7ktjXCiLKbHE6FvQ7k+gOfalPQi2GF9bptTCq?=
 =?iso-8859-2?Q?pCWTRHXbLk6h+B9al9D/IW/cxTJSBhW5rw6A5JSDo/54X/vYxkCcgxeNUo?=
 =?iso-8859-2?Q?o2ScbFEPW4zaiovdaFV113Ef7uSospx5S97ItoeMDtR8ScQhy3moybhI64?=
 =?iso-8859-2?Q?1oh0bl1EckTkUGR+T+kPrr9s6/K+xPOhdOSMEUMPxa6O+awicuyazLgDv3?=
 =?iso-8859-2?Q?HIOAF1lFELAa5BuwftOpcLVa4Hu6q3myPCeLT2ZZ3gd65xNGKIXuRcaaju?=
 =?iso-8859-2?Q?iGo6uIo3RG/8mJU7g/Ja2oYk2M/aNm5d/URR8syYc+E+DGl4/et0/IUcKk?=
 =?iso-8859-2?Q?orVUlzbIyt/eldreXExCIr+/XIhWFHx6QB26NvPest0tvkSKLWMFwJgSCz?=
 =?iso-8859-2?Q?L0iNHMNwxDZRr9kPPYWNVyKzGlEsxqP+xbxaQffJZx0AKcjeWmpD0yLgCx?=
 =?iso-8859-2?Q?NZ32tzrb9V5+vTYO2HOOdJ2sBhBJ/X6mJjXPwU/6GY9g9e0npBvuluSUZJ?=
 =?iso-8859-2?Q?H1xpJv0yiTxX624m5UXBW4E3qOi8V1/qnWsU9ly6Zoxq2kyNozbc0Vohlu?=
 =?iso-8859-2?Q?FtGke4QD5T0qrmbP5uLgS9EpAVSV5D8ijp1cwn2RtZxnJ4m0wJKOmQImGn?=
 =?iso-8859-2?Q?zqtj9yJZctBNgQpEt/ny5yDhhcyNN1FD/coVLoG77sMwKO36mGgmqKyDVR?=
 =?iso-8859-2?Q?n4mHMn7TrT5UALT0MuNMivl0mLWfhjcx0VryipDnc62lW9RYc5307uhCKd?=
 =?iso-8859-2?Q?uuMa5RNsgn4hzvb0BHXHWBYmtIeI7kGI2sDnae0NcI96bqjPIfxW762yO2?=
 =?iso-8859-2?Q?p+SB0K0V7B/ZzABPf4AhPNA7+qOEbR1hspPRr0SgXtdvQaa0SyYsgAjRDR?=
 =?iso-8859-2?Q?9fb9i8lXaji0U=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR02MB10030.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c8383fd-0941-477f-9c97-08db1eed94f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2023 09:23:15.7376
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zCRO8CAX3w4zu0L4KXaLWFB8eApxdGJ7cl+qpYUx2QaWgjx7QS5+zQRjrOQ1bUNi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 09:23:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178095

Could anyone have a look at this patch, please?=0A=
=0A=
Thank you,=0A=
Petr=0A=
=0A=
________________________________________=0A=
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Petr Kubiz=F2=E1k - 2N <Kubiznak@2n.com>=0A=
Sent: Friday, February 17, 2023 8:47 AM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Cc: Petr Kubiz=F2=E1k - 2N=0A=
Subject: [OE-core][PATCH] graphene: remove introspection from PACKAGECONFIG=
=0A=
=0A=
Assignment of "introspection" as default PACKAGECONFIG value does not=0A=
reflect gobject-introspection being globally enabled or disabled.=0A=
As a result, graphene compilation used to fail when g-i was disabled.=0A=
=0A=
Use standard means to enable or disable introspection based on machine=0A=
and distro features, as implemented by gobject-introspection class.=0A=
=0A=
Signed-off-by: Petr Kubiz=F2=E1k <kubiznak@2n.com>=0A=
---=0A=
 meta/recipes-graphics/graphene/graphene_1.10.8.bb | 7 ++++---=0A=
 1 file changed, 4 insertions(+), 3 deletions(-)=0A=
=0A=
diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/recip=
es-graphics/graphene/graphene_1.10.8.bb=0A=
index 75c8258d99..120ee80b17 100644=0A=
--- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb=0A=
+++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb=0A=
@@ -9,14 +9,15 @@ inherit gnomebase gobject-introspection gtk-doc=0A=
=0A=
 SRC_URI[archive.sha256sum] =3D "a37bb0e78a419dcbeaa9c7027bcff52f5ec2367c25=
ec859da31dfde2928f279a"=0A=
=0A=
-# gtk4 & mutter 41.0 requires graphene build with introspection=0A=
 # Disable neon support by default on ARM-32 platforms because of the=0A=
 # following upstream bug: https://github.com/ebassi/graphene/issues/215=0A=
-PACKAGECONFIG ?=3D "introspection ${@bb.utils.contains('TUNE_FEATURES', 'a=
arch64', 'neon', '', d)}"=0A=
+PACKAGECONFIG ?=3D "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', 'neon=
', '', d)}"=0A=
=0A=
-PACKAGECONFIG[introspection] =3D "-Dintrospection=3Denabled,-Dintrospectio=
n=3Ddisabled,"=0A=
 PACKAGECONFIG[neon] =3D "-Darm_neon=3Dtrue,-Darm_neon=3Dfalse,"=0A=
=0A=
+GIR_MESON_ENABLE_FLAG =3D 'enabled'=0A=
+GIR_MESON_DISABLE_FLAG =3D 'disabled'=0A=
+=0A=
 GTKDOC_MESON_OPTION =3D "gtk_doc"=0A=
=0A=
 EXTRA_OEMESON =3D "-Dinstalled_tests=3Dfalse"=0A=
--=0A=
2.30.2=0A=
=0A=

