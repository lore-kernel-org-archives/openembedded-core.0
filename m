Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17518.1794920703119255486
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 05:05:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=dHODb+ou;
 spf=pass (domain: axis.com, ip: 52.101.65.5, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cA9eAhsq/TaH9673ahZiJhM4qoPswwYoyO+Lu5nA6NoYfkAhXohlJszMiq5K4ZBjud74w0EGrl4ZtvFgmVn1r2rDx+fXltU8QrNZGaoWJSADEO8X7a0E7pKnomPd7GUiX+sUywxxFSJgI7ElDrV2iBrCno2J64rxAh7h3Mc62POhsBxxuAxp+v3/WW9yq0W8aykZOc3/qm/S8jQ9PyC9bPo3dI3OM/r6oX/7/eRnob+EUPHWoEWoHOqCn+HcCr+MPL3O1+KkxV09eXEpyZ5ka092qVrXkPFmu344rCZ2QK7dcEFNvu0lEFkhIjyzSrlp5Dx06DPVQ45b+XJ77I8IGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=riENP3AgZDTZgSmhmEJJLTdqDcOGjop76/j657BSmEo=;
 b=zAGOCM7NoLbj8itCilObJkIkD1f7JQAk1/i+umgAx1h9Z0cMlEnK9GutrD6kZ1M5YGC5q2KCj6ktKRCeR192F6IpPYNRrPnstGeSzTIlZ1lPfysqD2kRPbtFKlmCeX1zd2gQr7LkxYnE/gC51bWcpryx6+OrRXoZZeVxBYtgxMzWdODLQa/If4wKoQ+Hdx9oy8Ur+n7R7sHvEGVQ5c9Kp8pzwqU5FmPqHQim2eyHGAIN2Zlw+fT51Cusjvo0ZtFhVhiGMpXbcCYk1E3tRwl3tTjVYq1SxnOFcNeNd2gipC4DpWF8RGw+uWAchqmrIhl6GaTcoM2PEBeJe2VB1Quq5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=riENP3AgZDTZgSmhmEJJLTdqDcOGjop76/j657BSmEo=;
 b=dHODb+ou4v8dfJy01CewYaLixhPQbwP58nl7UG5fhlIDdDhLSBoHK5/OJtSVc+AkS94jB4lZoiB48WfAZ/DqJQSLSeuBuhASLTBE2ZnC7Tplo4LW0HVfA0nWRKX7uxHf3vENyupl44slEteaSb8un4oE4NcSRaK06p+DbgCWd44=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by CPJPR02MB857839.eurprd02.prod.outlook.com (2603:10a6:380:20e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 13:04:59 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 13:04:59 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "sean@geanix.com" <sean@geanix.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2 2/3] license_image: don't apply
 INCOMPATIBLE_LICENSE to SDK host tools
Thread-Topic: [OE-core] [PATCH v2 2/3] license_image: don't apply
 INCOMPATIBLE_LICENSE to SDK host tools
Thread-Index: AQHddouHhdkuRRFBa0GX+xlVUOhd37cyOBIA
Date: Tue, 17 Nov 2026 13:04:59 +0000
Message-ID: <DB5PR02MB102130D7248FCFE07318026E7EF7B2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20261117120155.3986876-1-sean@geanix.com>
 <20261117120155.3986876-3-sean@geanix.com>
In-Reply-To: <20261117120155.3986876-3-sean@geanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|CPJPR02MB857839:EE_
x-ms-office365-filtering-correlation-id: 05ccf19b-53b0-40f3-d7eb-08df44ab62b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|6133799003|15056099003|261009223027099003|56012099006|4143699003|261102123227099003|261028144727099003|261026140227099003|261022075727099003|261021121427099003|261022105027099003|261026121527099003|261021123027099003|261022115727099003|11063799006|38070700021|10067099003;
x-microsoft-antispam-message-info: hVbE3juKJNj44HiSR4M9BBVeEPt5VvVciixP3wtq7m3qgYuJq8AUT+GekSt1/LEdtYHZZjMwm7DZRbX2NT0CgxiW3PlhGet/cnalhQunB4xDPCPqUbmKK8wZEOo+ZlFIf1/rcMu0bpjbpU/HFT1ZAmZZJ3qYbQFnD6p5Mlcnab/rCI8IsLzA1UJdEA0cZYSv/U5Vjlm22PAASJMlD35+ceVevpZa91+Znzd9jP/mErmxOW9apNBRr8sCEyNU80pLA6IWfa3CPvnWy5BbLd2Rten0b2hB4VGzMwVTwEici5J+8Q5rdfKK+KDkgL5m2ge6bqNtVjZq6N8fQli68Emz9S7kn5vAwPJ5gJSSnxMLaGJA2bZga8yeugVZGYx9w+i+/U7xRPfcdCMnNhC7lL0s6bORZ+/bzUab8mNBK3KwswA3AYfYNEdApJ5nBNCJ5K+qMfodvh5w8nK2YXiSw9VoJ4EdBhJL+GGYAwc2SVyFdBpSpj0SNzbuojuY08y+mOQs4zT80MDue24vLeC1oA1iGV28xHf8Fr0C8LCi/LoWNsykbJm1rdiSFcay7PJlyA28DdXv9tOSdjVTCnww4yCS1lX7ACw7udrMKY0PalbXOqNHU28LfWEKHuycqoWSlLLIqBeCP0ktK8nrRetZ988I3D33N0QD8q1v+XZdQMJpUv/hArppA21Uqk+03kXGqHvyRhKJnR+LpM87qXol+8BkTQ3uRPrgpgAQ8fnv2xA1GnY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(15056099003)(261009223027099003)(56012099006)(4143699003)(261102123227099003)(261028144727099003)(261026140227099003)(261022075727099003)(261021121427099003)(261022105027099003)(261026121527099003)(261021123027099003)(261022115727099003)(11063799006)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ujmJc0imifhAmBBgPtXc73DshuILfcSvb+403JYgSWFz3u4iCnZ8rxFSCeMl?=
 =?us-ascii?Q?36Hv0UEd3IS38W+ABP7lT8pJCsNo+77b4URrFTKB0q7eqUAFlt9Xg+2Q3jl0?=
 =?us-ascii?Q?c88kqGttT0pkuc4Ah1BDRJlVTmaLPA5FgMIGB5h5e7WN2DMVsoEZg400n4+I?=
 =?us-ascii?Q?/YNVdAsgAFryQF7smhjk7xoiUluvpzBYbSzp1D7WYiAZGfukM9u2QEUmZ40B?=
 =?us-ascii?Q?5sL+vnJeySYE7eMKW64DSPGGApIJ4wGz4FyP04v5VQA0tT00egT55NwpvgID?=
 =?us-ascii?Q?BomTd/P+hDXjyzeWwsfkMcYwPPg3D8Qnjvd733DhGMhHw3sX7UvzpyGDcoGA?=
 =?us-ascii?Q?SLLbbm21mBZiZGJiTs/ytgMw4V8+4wbpTR+N6birCm7ZpbX3R9XuqD5EbdZS?=
 =?us-ascii?Q?Xvf0GA7Ocz7b1jm1GbW/4xh5yLv1nsu82aJkLl24/k9XjcXye/2UpTaNDs45?=
 =?us-ascii?Q?QQ/WwI5jGwJ4zsFe6EkBtfMO5+NB7Siqba0gSPNn/utAgSLjEV8Xcu08AiM/?=
 =?us-ascii?Q?NUIoLSNq3GlqgHOcmNwx1+2pZvIR5L4uaa+WsVe1bEMSgXh//WCBKlg7kz5M?=
 =?us-ascii?Q?iKHn7L2/Mvl/BfazNnL1YQ1grys6x5r6j+6Ygzr6TxvoQNvUbeohjNE2BgQj?=
 =?us-ascii?Q?YjoYbicvGe73EInbkU9wlPbk3uPWOohICRn6SjwiC79DofVz0IhE7HW9kjHq?=
 =?us-ascii?Q?B2UWi/XlDD2Icmn/u7KnZzhk1jJGt+PoOumFrE3IH8ndWwLMvT0805Jraf2C?=
 =?us-ascii?Q?vG/dzyyyeS7PNv2p2K4RIXWcOu+KZjEhKnYTX2UYdLlIM7Fbxkr6N49ixjVw?=
 =?us-ascii?Q?nUn2hOde2qoduFs/eBugomNSer4jKpcGEqcBJeg3JXyFsTXeNBYWLKzbnJJ6?=
 =?us-ascii?Q?NNeTyMAip1g3JKkhDxjydRlvs12rwLoWPSZ7ZQiBbL8KT+dq6IJcZPjfVe75?=
 =?us-ascii?Q?f90NhO65OYuX0mH21xmoLfGoq29lKkeg3SYbNv9dRSjdJQ+UsE4JTbome4Jn?=
 =?us-ascii?Q?1AjGFkFcVOJA9JVpjQDsn3y2p0ThN51KzxcSvrE3SSG2po+C2C9DxlvxbeQ/?=
 =?us-ascii?Q?boxyeE2E0USrMG64aFJATngK3cSbcgGT69uHAIWVqjGT5dJK+tXKpdjgJ+pl?=
 =?us-ascii?Q?ov1EcLhfk30Ho+1VUqg/bKSAPoIPl37DDjWDBo8StHH52ojoPMiT5+bptqKN?=
 =?us-ascii?Q?k3qumJxzQzlIhtegCWsfIlu/OJGYWnh0N63oY5fhCDP8Uwf8HXxVihGYnM8T?=
 =?us-ascii?Q?xBKV4GQBUszupP2evbviGix1pESJO7NNkwvZ3XztlF6su78nel19axj9Ey/n?=
 =?us-ascii?Q?/btxhpRC2uV6gL7FNsKUsRix15L9BfEyjt8ozYL2zqZd/9yPaso7iMJPIwN2?=
 =?us-ascii?Q?Ng+zqmZunVGgHafYt5oj7nB286EgwDbhXvzICMABXHLPtLX1ApG0coByYwSc?=
 =?us-ascii?Q?xPpCrihZMU6rOXhDxo8fb1hCwR9CsokWO8iepYxZWaNIDIBytHylO4N2Ig1t?=
 =?us-ascii?Q?jctaLiXkEt2Yd9YkTPam+I7BGg3ozD8rGWCGUuxk6BG0+9A3U7VnaWSTGtKp?=
 =?us-ascii?Q?5+ER80yhji4fj09uWlPr35lWfnDKCyIwxh80z9ZRsNNTlybwm1jh944wLiKT?=
 =?us-ascii?Q?rYgy0a+bBpnxX+EYz5L9Wcs4Gf6YN7E4Xd353jWveKwB2glL9aGGOqhczxdi?=
 =?us-ascii?Q?33NlzpyRCuTjEIGJRl+uO6/sxhA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ccf19b-53b0-40f3-d7eb-08df44ab62b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 13:04:59.5743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: as9bX3yKraU/c0YE9V468qOrFSeYifA50Z2goe8ixzpbbZm9IgzfXTq2XpVzg0PI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPJPR02MB857839
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 13:05:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250448

> -----Original Message-----
> From: Sean Nyekjaer via openembedded-core <sean=3Dgeanix.com@lists.openem=
bedded.org>
> Sent: den 17 november 2026 13:02
> To: openembedded-core@lists.openembedded.org
> Cc: Sean Nyekjaer <sean@geanix.com>
> Subject: [OE-core] [PATCH v2 2/3] license_image: don't apply INCOMPATIBLE=
_LICENSE to SDK host tools
>=20
> Since the SDK host and target sysroots are passed through
> write_license_files(), do_populate_sdk checks every nativesdk and
> cross-canadian package against the image's INCOMPATIBLE_LICENSE and
> fails, e.g. with INCOMPATIBLE_LICENSE =3D "GPL-3.0*":
>=20
>   Some packages cannot be installed into the image because they have
>   incompatible licenses:
>         nativesdk-autoconf (GPL-3.0-or-later)
>=20
> At parse time skip_incompatible_package_licenses() exempts these
> recipes, so they are built and packaged, and only the SDK manifest
> step rejects them. Use incompatible_license_check_needed() in
> write_license_files() too, so host tools in the SDK are treated the
> same way. Target packages in the image and in the SDK target sysroot
> are still checked.
>=20
> Fixes: f757ae4dadab ("license_image: extend to SDK coverage")
> AI-Generated: Claude Opus 5.5 (Claude Code)
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>  meta/classes-recipe/license_image.bbclass | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-rec=
ipe/license_image.bbclass
> index 7d00b1ae53..728db8ae3a 100644
> --- a/meta/classes-recipe/license_image.bbclass
> +++ b/meta/classes-recipe/license_image.bbclass
> @@ -128,16 +128,23 @@ def write_license_files(d, license_manifest, pkg_di=
c, rootfs):
>=20
>              pkg_allow_licenses =3D oe.license.filter_pkg_license_list(pk=
g, allow_licenses)
>=20
> +            # Host tools in the SDK (nativesdk, cross-canadian) are not
> +            # subject to INCOMPATIBLE_LICENSE, same as at parse time.
> +            if oe.license.incompatible_license_check_needed(d, pkg_dic[p=
kg]["PN"]):
> +                pkg_bad_licenses =3D bad_licenses
> +            else:
> +                pkg_bad_licenses =3D []
> +
>              if node:
> -                if incompatible_licenses :=3D oe.license.license_allowed=
(node, bad_licenses, pkg_allow_licenses):
> +                if incompatible_licenses :=3D oe.license.license_allowed=
(node, pkg_bad_licenses, pkg_allow_licenses):
>                      incompatible_packages.append("%s (%s)" % (pkg, ' '.j=
oin(n.to_string() for n in incompatible_licenses)))
> -                elif incompatible_licenses :=3D oe.license.license_allow=
ed(node, bad_licenses, []):
> +                elif incompatible_licenses :=3D oe.license.license_allow=
ed(node, pkg_bad_licenses, []):
>                      oe.qa.handle_error('license-exception', "Including %=
s with incompatible license(s) %s into the image, because it has been allow=
ed by exception list." %
>                                         (pkg, ' '.join(n.to_string() for =
n in incompatible_licenses)), d)
>=20
>              (pkg_dic[pkg]["LICENSE"], pkg_dic[pkg]["LICENSES"]) =3D \
>                  oe.license.manifest_licenses(d, pkg_dic[pkg]["LICENSE"],
> -                                             bad_licenses, pkg_allow_lic=
enses)
> +                                             pkg_bad_licenses, pkg_allow=
_licenses)
>=20
>              if not "IMAGE_MANIFEST" in pkg_dic[pkg]:
>                  # Rootfs manifest
> --
> 2.56.0

IANAL, but for the record, I believe you risk violating the (L)GPL-3 licens=
e=20
if you distribute an SDK after applying the above, and then do not comply=20
with the license requirements of the (L)GPL-3 license. And the whole point =
of
using INCOMPATIBLE_LICENSE =3D "*GPL-3.0*" in your configuration is to avoi=
d this
risk.

Since the GPL license is all about what you distribute, it does not matter =
if it
is target or native tools, you are *distributing* them all as part of the S=
DK.

Thus I believe it is wrong to apply this, but if it is applied, it should b=
e=20
opt-in, and come with a massive warning.

//Peter

