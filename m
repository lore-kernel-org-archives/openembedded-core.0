Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 984D5D0BB46
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 23:39:03 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.57])
 by mx.groups.io with SMTP id smtpd.web10.2432.1729726741193554490
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 16:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=bdx4YF4E;
 spf=pass (domain: axis.com, ip: 40.107.104.57, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=urFjoVovYghJKQ0iartJeRz01toYwObP1bFHQ6GOjTf0hCtSM6b8kePeuK6yfes1DQLxh0giSLPfAFNUWfemvdlNqJwiD331yzYgf0wnZnvhCb+JGbll15WxLkLAKaramYExpB8pEqrquW8DODEx6QW1fo/ebNe69MAx3/3VMnSGBzY3k+5sDRxCyBYApDPO40mOMqSouGl1+v8+tOiFQjaYEfvE4ezHIsyhRQYhuV7wCsd6qGFT2aXeXaS933HqL6txvFMQ6swPxtJUwTpmytEC35oLdiziktLufPc33I0F1rPW5fR/XuXhAss1L0S0EV6Khpx1dxIQEHNUZ1wwoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALWXmH5+tKSQICfnd+d3YUiwcP7no6RiKt+mB4ZepDs=;
 b=kBYWN2Z0ipKucXChi1oGyITDbKBsXdFtkeRYAYnQ6sLuhDX7iKYLJyeq5vV49g8pZv9mrhEW2kF7UvPWzuJZTIkouCkL2MK6fJBxs1mxGmjPkrs2lw+gkA1gSQJ6/AmSZCXb64hsEvNpMKTmY2LbR+F3TcwXJcClSvCbgxpuHXjoq7fPr2urqhxbkeS4pheeCrtm3cV+L+XGi+NaIP/PR86v3GXDmugQFUV8yvJblZpoa7sSlaOoZm5h0F/ozWdHDASCPow6SYizv1pmNoNWwXv/Q1WPB68TGk+8Re6zVYfUmZL5CMfwPg4QdQL6Xn1PKIvKMiBZBQvbXnt8n80StA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALWXmH5+tKSQICfnd+d3YUiwcP7no6RiKt+mB4ZepDs=;
 b=bdx4YF4EMs6+Odp0qwJay0N86b0qnz9zElpZlGxZy1R3cWonKMKwznLx+2DJfta5TQslfAFz4ljxvKMNG7sMJY+Upqa0QK+pH/6u1e5AZADdFXUl0evRclGfOzpnV2l9rjGGSN/k1yvZkoyBuMq77IGEu9msBtNxaUhSTFKMjKY=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU0PR02MB9100.eurprd02.prod.outlook.com (2603:10a6:10:464::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 23:38:56 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8093.018; Wed, 23 Oct 2024
 23:38:56 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Joshua Watt <JPEWhacker@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH v2 2/4] lib: license: Move package license skip
 to library
Thread-Topic: [OE-core][PATCH v2 2/4] lib: license: Move package license skip
 to library
Thread-Index: AQHbJZF3ja5qgR1WBUKXABoZXdFr3bKU+lPQ
Date: Wed, 23 Oct 2024 23:38:56 +0000
Message-ID: 
 <DB5PR02MB10213DE9178DC0AAABF24AF60EF4D2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20241018220818.4042304-1-JPEWhacker@gmail.com>
 <20241023212013.995247-1-JPEWhacker@gmail.com>
 <20241023212013.995247-3-JPEWhacker@gmail.com>
In-Reply-To: <20241023212013.995247-3-JPEWhacker@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU0PR02MB9100:EE_
x-ms-office365-filtering-correlation-id: b48028a6-f283-4e02-04ec-08dcf3bbdc83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?W8r/7pWGMtFYnQYq3dmnWdBrkUWpu6SJ/nVj6coNlypJtLoJiD/oXueniyHu?=
 =?us-ascii?Q?AqaOKMVbEzeGf8g1KA25fhcculrOZNqOjgPoxJI112edF63rgbgQSWo9x69Y?=
 =?us-ascii?Q?qCpCOMwPTuXZCNnicNyeJYjUDpmhU4GbbRhtV5MKcuo0I4qUrcQouK8htgtf?=
 =?us-ascii?Q?bNrvqutdFmOT2aRufi6lMfkK7S3S2GgnQNmDp/+GXsmPL+CV5kOdFBUrmiPF?=
 =?us-ascii?Q?C22Uj7AtFPddyA6ZJWzgdOuhrL2hckZKrn/GAVEBGXSOlZBFyKVkxqoTfdYG?=
 =?us-ascii?Q?saESt6lsNC7eBmH8048hn2mLW51TICvkNCbj6MqASYsRpaGiKN8SUO+Nodlb?=
 =?us-ascii?Q?mpI2Ta/3VOojur9fnG0ErTVrRv/mIaJz+/9YxDCzCV2jCYWnl4ouCZJp9ftQ?=
 =?us-ascii?Q?PQNgHrLt5Udw6H61yRjtFLEfX7Ly+kP5JwjLHroakork9eVXLpy8djhCITLx?=
 =?us-ascii?Q?Th79L+PGActm336c7LsHI7uMOxSZIZZ90bK6oKzQz7Lg+FoiDgNvlN0wJ2jC?=
 =?us-ascii?Q?WN4zZVqHo6vgrbvOaBxvKB3pQiJZUGtiuaBOR7V5cX/qCvTH6idoYp/4TW/O?=
 =?us-ascii?Q?NWV9D3/+m4fEIYhHaBgtHKStJOFZbImdYrYQBdnUCoPpo7qIOjWtkUjRoXmH?=
 =?us-ascii?Q?5YxCGbZSXYqM3k1Nu0DC7z94HkA5FyD/qSs0zr6mAHum38Sk9iXLlR6Rm9OF?=
 =?us-ascii?Q?Cbv2uZI1G25XtvsHAQwaUq+8es49JJ+q9Ry073Lz6Mi0nP94osHxvDQzkAIT?=
 =?us-ascii?Q?VyMKMV2ktEPKgZQdcPziazlIfDn+7WTQg0jNSkQMqBrIvjeTHwbEpP7Vn4n6?=
 =?us-ascii?Q?BBK0br/xgq+WPs22j1j8PTc38Y1LYR8mlDe1jjpSks+Q7X4HbjVyIXI/Z/Mj?=
 =?us-ascii?Q?/gzT5TsaA9QBRX1jOUQPEIQYGQnGxvuLPVzjQqNEBCBfP4zt09LAtUACqnNS?=
 =?us-ascii?Q?BT8RAH1R1WWo1XvWOU8VODtUakKFLITksfRVeGT4pNXP3asnuVKSalEll3V3?=
 =?us-ascii?Q?N8Ml8Mnm7pMqUvLpseeiZys1PteIBXHQ5Msb/hKCVOKBj9DElVLoKfdAn4PV?=
 =?us-ascii?Q?ZuVhIPorgXwAR9lOj9CxiVEiP5/01ct33e3R6XD2l80Lhi8R5tcGsxtxLSpX?=
 =?us-ascii?Q?kJHmx9Xz7f9GmILVVzFQElR42Yi1OKoOMnYH9xgcDaMzCs9fVImJ1mbcSjEs?=
 =?us-ascii?Q?FPzwloZgWn/5xjOSGt8Sp802RXj+apG7lAR2bO5cg82bdkIBu3b6SCdMLaxX?=
 =?us-ascii?Q?WvzCjz1wp+pBjBF6sVVpIfRj3uVn/WoeSdni5PmhW5RxNoqYZNlLnzS4x/P8?=
 =?us-ascii?Q?DVCdwpGkdZnO8D1FkPHimhSrw7o/5CIHmmqW39epbNtLyfjVJon6c5LMBlKa?=
 =?us-ascii?Q?ZaD1r/8=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?tvn1/Vq50t3dkvDzM2Hhuv2ZswDZ6q5D1d34EHNNUe+FCa/oPiHvhKmziQ+n?=
 =?us-ascii?Q?liMW2GwSrFmGv/InGZUzKTB9zguya5z+VNZQ9b1NRIoyy3LcWpsNICf6qq9y?=
 =?us-ascii?Q?u+l0FneUNTYXwkg70WF8c6+VSlt9CIiKVs+Sg4JRVroX1glYrDEjQNMrD/eP?=
 =?us-ascii?Q?U9Ha4gE+CSiJDQNMIwLPbSsdcxvmCasm89Wa6u0mTQL3TIVEca7FdnMjUy2f?=
 =?us-ascii?Q?OdP4hyc+K33ojXnLepTjU2IFTj5zF2IoP2eDYr58z9v9S0Auf6+9hkDD12yr?=
 =?us-ascii?Q?nPfY1eqv4ZSkqJyDZMMdOloRtWkg+T256zGun/M9396NiSJGxuthwE0W5nT0?=
 =?us-ascii?Q?AZcwAgTzaLyMU7rOPPazOkD0OFSbcUT7SWpkHKY0o3LZwG6p9TC+7MJ+iydM?=
 =?us-ascii?Q?qiF8T5r020xl6kBwRJdI/+yaknflFvMVdwr3zyrbrik7sOXrEvyTqorNUKyV?=
 =?us-ascii?Q?jmkDxPawaV/zivl4sdLAxmBYLsiOIY+bfl6RNH9mpDhAXKbmNsQuOti7vj3Z?=
 =?us-ascii?Q?3/e9K1/kkj7bRoZznmufYOQHM1N1NK/nrrK3w6cS1dRKFFRkdpCWPWX7Cv5v?=
 =?us-ascii?Q?afyFfx7D4WxfSNgCgyL7RJ1smlu2XKCy2cLerrONBRKPq9++dVtNU9QvvO6Q?=
 =?us-ascii?Q?gCE4u7O8dgVXrb9bQe6VWd8AZEh9Ic4ceBa8/JEnxvsdun08jvyKNT6SkhkP?=
 =?us-ascii?Q?sjvKGQ67ayAFT2p9TyGDS0jhyrTynhJ07KK2K4L1ugRF6m8RPkWK3R/cnqEI?=
 =?us-ascii?Q?hf42jGeDmLrdsTM91KY+QvaX2a1/fp5BQOF+3/RntTV9eRBB2pbndyjCRqII?=
 =?us-ascii?Q?8uE7nl02el0gW38/wbfplOEoiFhdMBkoJFkyO6HHNALqz8WM+duYkR9gpmf2?=
 =?us-ascii?Q?xfoCBlxW1zYFSHntIneTtNE7sTRzL7fa6nNVvcNcQPfU66LGgtga0zcqqxrR?=
 =?us-ascii?Q?kqLsZWEyliYeFUT9+QNz3qkaKRoD8Gzn1SbzJ1eIb7hZEfNDD5LpLpYtcSKt?=
 =?us-ascii?Q?u812qKEs7d0KwN4zc1aevhLZ6ny0EHaESM76K7xjnAJgyB/NkcPovIh+7rJ4?=
 =?us-ascii?Q?adn7vMisuR7VzhSUVgzXfY131FAR/wkFwtpjuiqfxLiOe5geIgKEKJqlwePM?=
 =?us-ascii?Q?goIz5HpbrTqqrbblJMtvWnNL6t+wd0TWYwZQIfswyjKRWX4qRMH8+KSPsbbf?=
 =?us-ascii?Q?LuYxoLEQNmh1UTMo/sY+VdsigXMz2CIDCI27ax4tuhcPcSpKNziMRDQGBLFQ?=
 =?us-ascii?Q?XOGlzjXDS3LUsTZE9VPYpURn+w4Qr+Cwqxrx7CkokIz6ZubL1E+vc9esaSoi?=
 =?us-ascii?Q?zzkBsLfFlpW5VpCIxQlviBS3DTaNVkmUag7JztxZrnu1mxVk7BhBIS0+fD8+?=
 =?us-ascii?Q?jQLglTrk3W9v7S1iq1FRzwLsw/nchzZmRvrY1qyVnS8+R+nl7AV1pOfZSmMo?=
 =?us-ascii?Q?41Uhy7uvF57nfYmXz/K4bBanTsgX5JUx2X08Y4+ExdaLjEi7BmIQk4NgHLKM?=
 =?us-ascii?Q?8y0m6G5u+WmOsF64rvuF8vlHxx6WhJrxkvwkPZYe6lFc3YedmyEFiZgFev24?=
 =?us-ascii?Q?9Z5oZ42Q+4uNdCYnvOA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b48028a6-f283-4e02-04ec-08dcf3bbdc83
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 23:38:56.3580
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: onmZPwJqULlFP/vahkBuMtyLbDF3wzplbziHWMYoI2q1vhVFdkQvReJG9Prpecvl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 23:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206272

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Joshua Watt
> Sent: den 23 oktober 2024 23:15
> To: openembedded-core@lists.openembedded.org
> Cc: Joshua Watt <JPEWhacker@gmail.com>
> Subject: [OE-core][PATCH v2 2/4] lib: license: Move package license skip =
to library
>=20
> Moves the code that skips packages with incompatible licenses to the
> library code so that it can be called in other locations
>=20
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes-global/base.bbclass | 35 ++++------------------------
>  meta/lib/oe/license.py           | 39 ++++++++++++++++++++++++++++++++
>  2 files changed, 43 insertions(+), 31 deletions(-)
>=20
> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.=
bbclass
> index 88b932fc3f0..5b8663f454d 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -573,37 +573,10 @@ python () {
>=20
>          bad_licenses =3D (d.getVar('INCOMPATIBLE_LICENSE') or "").split(=
)
>=20
> -        check_license =3D False if pn.startswith("nativesdk-") else True
> -        for t in ["-native", "-cross-${TARGET_ARCH}", "-cross-initial-${=
TARGET_ARCH}",
> -              "-crosssdk-${SDK_SYS}", "-crosssdk-initial-${SDK_SYS}",
> -              "-cross-canadian-${TRANSLATED_TARGET_ARCH}"]:
> -            if pn.endswith(d.expand(t)):
> -                check_license =3D False
> -        if pn.startswith("gcc-source-"):
> -            check_license =3D False
> -
> -        if check_license and bad_licenses:
> -            bad_licenses =3D oe.license.expand_wildcard_licenses(d, bad_=
licenses)
> -
> -            exceptions =3D (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") =
or "").split()
> -
> -            for lic_exception in exceptions:
> -                if ":" in lic_exception:
> -                    lic_exception =3D lic_exception.split(":")[1]
> -                if lic_exception in oe.license.obsolete_license_list():
> -                    bb.fatal("Obsolete license %s used in INCOMPATIBLE_L=
ICENSE_EXCEPTIONS" % lic_exception)
> -
> -            pkgs =3D d.getVar('PACKAGES').split()
> -            skipped_pkgs =3D {}
> -            unskipped_pkgs =3D []
> -            for pkg in pkgs:
> -                remaining_bad_licenses =3D oe.license.apply_pkg_license_=
exception(pkg, bad_licenses, exceptions)
> -
> -                incompatible_lic =3D oe.license.incompatible_license(d, =
remaining_bad_licenses, pkg)
> -                if incompatible_lic:
> -                    skipped_pkgs[pkg] =3D incompatible_lic
> -                else:
> -                    unskipped_pkgs.append(pkg)
> +        pkgs =3D d.getVar('PACKAGES').split()
> +        if pkgs:
> +            skipped_pkgs =3D oe.license.skip_incompatible_package_licens=
es(d, pkgs)
> +            unskipped_pkgs =3D [p for p in pkgs if p not in skipped_pkgs=
]
>=20
>              if unskipped_pkgs:
>                  for pkg in skipped_pkgs:
> diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
> index 7739697c401..866a876d7f0 100644
> --- a/meta/lib/oe/license.py
> +++ b/meta/lib/oe/license.py
> @@ -422,3 +422,42 @@ def check_license_format(d):
>                      '%s: LICENSE value "%s" has an invalid separator "%s=
" that is not ' \
>                      'in the valid list of separators (%s)' %
>                      (pn, licenses, element, license_operator_chars), d)
> +
> +def skip_incompatible_package_licenses(d, pkgs):
> +    if not pkgs:
> +        return {}
> +
> +    pn =3D d.getVar("PN")
> +    bad_licenses =3D (d.getVar('INCOMPATIBLE_LICENSE') or "").split()
> +
> +    check_license =3D False if pn.startswith("nativesdk-") else True
> +    for t in ["-native", "-cross-${TARGET_ARCH}", "-cross-initial-${TARG=
ET_ARCH}",
> +            "-crosssdk-${SDK_SYS}", "-crosssdk-initial-${SDK_SYS}",
> +            "-cross-canadian-${TRANSLATED_TARGET_ARCH}"]:
> +        if pn.endswith(d.expand(t)):
> +            check_license =3D False
> +    if pn.startswith("gcc-source-"):
> +        check_license =3D False
> +
> +    if not check_license or not bad_licenses:
> +        return {}

For efficiency, it would be better to return early, i.e.:

    bad_licenses =3D (d.getVar('INCOMPATIBLE_LICENSE') or "").split()
    if not bad_licenses:
        return {}

    pn =3D d.getVar("PN")
    if if pn.startswith("nativesdk-") or pn.startswith("gcc-source-"):
        return {}
    for t in ["-native", "-cross-${TARGET_ARCH}", "-cross-initial-${TARGET_=
ARCH}",
              "-crosssdk-${SDK_SYS}", "-crosssdk-initial-${SDK_SYS}",
              "-cross-canadian-${TRANSLATED_TARGET_ARCH}"]:
        if pn.endswith(d.expand(t)):
            return {}

> +
> +    bad_licenses =3D expand_wildcard_licenses(d, bad_licenses)
> +
> +    exceptions =3D (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") or "").s=
plit()
> +
> +    for lic_exception in exceptions:
> +        if ":" in lic_exception:
> +            lic_exception =3D lic_exception.split(":")[1]
> +        if lic_exception in obsolete_license_list():
> +            bb.fatal("Obsolete license %s used in INCOMPATIBLE_LICENSE_E=
XCEPTIONS" % lic_exception)
> +
> +    skipped_pkgs =3D {}
> +    for pkg in pkgs:
> +        remaining_bad_licenses =3D apply_pkg_license_exception(pkg, bad_=
licenses, exceptions)
> +
> +        incompatible_lic =3D incompatible_license(d, remaining_bad_licen=
ses, pkg)
> +        if incompatible_lic:
> +            skipped_pkgs[pkg] =3D incompatible_lic
> +
> +    return skipped_pkgs
> --
> 2.46.2

//Peter

