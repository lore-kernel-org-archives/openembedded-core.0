Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D25EC761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:31:24 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.66634.1680517882113335604
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: 2n.com, ip: 195.60.68.18, mailfrom: kubiznak@2n.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFI7ezROq9t/tiF+eG9T/lvrspJGycqn/pRGkTEjxMI1JoavMxtnvOLSEXeM0Td6a5PB+OoeqThhJ9dP3Z5RNxRd+8/adfenACceQ7ZJUo759/m2bkeZnW+COdJELmU2HG0yBMGuECkS2KKnyVNPNrGuLN3RQ0c8PzzfR1Ulc6zaE2pdX+rtwypZZMLayYb7UTZs7tadzrQsrTzDnl4dYSiduHy9utftUxjj2U10q1cn0nhZKUIrBoXC9Vo826kxu0YF+Er8ovNmyaCoR+/0TYiOXrUFyRCfmeIb8+JFeQSG4MDZDRK8LhsuAAHp5zHSRqPYniY2RmpS2gf+jtRYag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rx49lsRHkgF2bDi0ynwmsZuyRtJvl2cuEkqlpurMWE=;
 b=k+jNkNUAuJ7/JvtqrG1TKTqX5bxLyrgR2u/LqhQNd2H9Tos7c3RQ++uBD7tOgt517oYJY8WHtnnL94SKztzNnrrhX7MSux+WUazfmynx5fYMZ6BccT0PKqaiKx6xQ+qU9Tc+WFPscY9OLH85UqzA1PYBHKKyT7U4NTADc6ptCtmV8LoMGuCwPMOJO7Ngz9TjN9luNvc/LG62GjjtY9cTve6V/Sl4Jk78IbdB27wmo/nNrj2ndyc/mHMUujkxINcEG48zFGQV5qo58AiiAlXuSdezE46gurMW0wg1rHL1rx1phdgvLfP6PNN3D9ePXSUSZVdzbg6GEKPM1tE3m7Egvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=2n.com; dmarc=pass action=none header.from=2n.com; dkim=pass
 header.d=2n.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rx49lsRHkgF2bDi0ynwmsZuyRtJvl2cuEkqlpurMWE=;
 b=wHXWLzbyDb4QodGLTugwKx5819GQM0WmhUGTgrHG/NSX4UFl3mzM2pA/eHGfzecSPCSyibhc4JGeveNk29QQl0Ur6byZecQDdRqGEqNcVpClOeK9vGI2p2T/v/7e7tdIZqfe3euzHnKPm5+3QN6yXw3coDLVxoHZiygUKWGtkS4=
From: =?iso-8859-2?Q?Petr_Kubiz=F2=E1k_-_2N?= <Kubiznak@2n.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v4 06/10] webkitgtk: add missing dependencies
Thread-Topic: [OE-core][PATCH v4 06/10] webkitgtk: add missing dependencies
Thread-Index: AQHZY8baKMX2+W2/H0yd7VqMp8wFla8UyviAgASXNz0=
Date: Mon, 3 Apr 2023 10:31:17 +0000
Message-ID: <DB4PR02MB100301B77BF93E3A3CC6708A5E2929@DB4PR02MB10030.eurprd02.prod.outlook.com>
References: <20230331114634.3578244-1-kubiznak@2n.com>
	 <20230331114634.3578244-6-kubiznak@2n.com>
 <e1408db180e41666a38260a9f45f6edf7f725192.camel@linuxfoundation.org>
In-Reply-To: <e1408db180e41666a38260a9f45f6edf7f725192.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=2n.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR02MB10030:EE_|DB9PR02MB7194:EE_
x-ms-office365-filtering-correlation-id: 39ec8810-0110-4dbe-3400-08db342e8f3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LsYnx9ZaiTuxKUmIDIIXGAky5wG3tR3NsikS/iyh+IBdGspcW7zFb34E0Y3iiAoZ6XX+ZaOORIJMpgvRBZ+3ezJMP71vfJzpmwdMnU45KLpE7JAGAME8gQJctUt8e2GFqVktlKf67BKIrdFqfAkSDIkS3HiYuw1AW4phZmdELDDc/Km0B0/g0X6BPsZmg9IRSqumflnnxOCYjH87DIPrpB0zCRQK8485GqkFzOFxS/nFJJSkB6p/PXkPeO0WEXioSllPyEj1xWjMXKJgckg6YNXqg5/fnAzy0VJLdNPO5gIPUPok99CZxZ22efzKfTnjqS0TPmEHJ5xWqL47GYhEO3/ObDbyBLUOU23iPYvfNzEUJANyi3CuBSC9ktiVFpVoGoSBt7RUutPmzmvO0YL/23MInl7ACPiaEcuNLm9k2I1MrndQWJoqJt1S92U2yis7rBelOWRK69koJje8P1JOvIdqw5AbF/Oi19ZFTT+5G2B2euiBxt5IRH+2rkWnIEbznfUmGjfcRLjKZBzoIlbXrCVc+FbS0RDmoNKAJBbwptPIneuu97d2BHvYTACCJgq0a2hTXOr/372LGfRay1l8x8imfS7tSOQCGrYxNiR0HUo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR02MB10030.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199021)(83380400001)(91956017)(71200400001)(478600001)(7696005)(110136005)(316002)(6506007)(53546011)(9686003)(26005)(186003)(2906002)(5660300002)(33656002)(38100700002)(8676002)(66476007)(66556008)(66446008)(66946007)(122000001)(76116006)(41300700001)(86362001)(8936002)(64756008)(52536014)(38070700005)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?TOD/XBWa8V3uS8oTvyMwDHsZ0rYNUOtH9Gdgx66uprp2ZV7PkfdS9akp6R?=
 =?iso-8859-2?Q?fDg8RGsF22BLJ9vomMhA4BmfkIB960enhu/u81AsNP0gTyXGltfZOyzLwY?=
 =?iso-8859-2?Q?ElpMwulSPSaGQLU54VuEmeL7268SOAidoWXf05cGCJ6KvIFa71Dxng0mDf?=
 =?iso-8859-2?Q?+WL0t5eM/jSTohh1113LBXvR6Xnj+LJvawYvIWqyjwhdiHml5Q/EsjDfnp?=
 =?iso-8859-2?Q?fMqmzJzG+2bC/MPupca3AWcyewpyhlJvwXmWHVViyIaBMm/bm6aeTgieb5?=
 =?iso-8859-2?Q?/T0XidqfgGI2UhjAVktLW5r30dmkr4Gu6Vs6lWKPar1Moy3wv42KL+vEh2?=
 =?iso-8859-2?Q?MK0rfpxuBU9n339L46wX9fILr3ty19iV50D1C9sJpUL0Zs4WqOQ2J4DKq6?=
 =?iso-8859-2?Q?ofghPv0ZXbO3GUA7LxSiPFHfNn71lzLOjWy5fhgc9LOhXIu0P+pX3Tm/XL?=
 =?iso-8859-2?Q?B2EYHLI1Q5xWUGLg/5j2Oc//Ni9wqHYN/g+gcVinNMfeM63SiuwOeStngg?=
 =?iso-8859-2?Q?GtCxeGfyxzQ1oqwiHPlPKpCa7d+4hLWCG+LliC5GMMGODfWVvmhAsCFzim?=
 =?iso-8859-2?Q?VtLjte1jJKfogT7hBy0cgtqf7zQt0UzTeKhcGgh5RzjI8euoC9sEPTtTe7?=
 =?iso-8859-2?Q?a2/bWB8faOJToIThviZ43DAcXbIG2hg7GQNeY9AjPaf1yzZar3ElIQoj3f?=
 =?iso-8859-2?Q?CRDAXklam9d6ZfgOe8KEIxcVS7S/Ov/cd9oeB03oT2lZV198ndWYKVJCwe?=
 =?iso-8859-2?Q?NQ+gKTVtJ63QAIzsKN6CW9sOoqmdN57YUQWmIURtqF4eNsMoS2UWFpehqW?=
 =?iso-8859-2?Q?8hMNL3Os9l6eV5ccyjTmXoHd0jueN+KTqjUbWVVGHyKiz4Z3BbuFT19q6X?=
 =?iso-8859-2?Q?x7pi87W43msaBgZ6ZFdoUIfd6nfNh7Q201AVA2Z1PA/UPc4EpPCz1XpYrY?=
 =?iso-8859-2?Q?9oVJ+4qDetWt/VpgTVyI0QHB7pL5DUeRWEd1ZDXiCTu2DP1jAj/09Jo1Th?=
 =?iso-8859-2?Q?Zp3eJnpBF2c3HuP4FQHZ01tKypk1n7/fNf/v1EnxH5NL67NslR4Qrf5WcD?=
 =?iso-8859-2?Q?y56pYx5NEPL8UXHW6aqMOk6k6s/vRK2HBjYRQm8qWbQHE325Tat1sOHaHY?=
 =?iso-8859-2?Q?tjoUsuI215NyQfnz0tlV4VVe3SjbA2bNT76HZu6/tRIz1/lsRt2ju/bCNn?=
 =?iso-8859-2?Q?2EL+ttZUc4tgKbapnh7SEN6+wNR8YfPz4inXNSjNi1jbK59SqUGVcvZ0yp?=
 =?iso-8859-2?Q?I2QjNv77LVRG7dXkX3wxAmXr5rAlIuzlyC6UzwbfjSxysNjWEysQ//H9GR?=
 =?iso-8859-2?Q?tRducKXaBs3WzhYDszDN6/3hXPr/IaMsUUK8vKas/49cNMdlYCFZG3zVHj?=
 =?iso-8859-2?Q?pqdh/tD/WFfTf4EcnJFjMMOS7sSPsEx8wzsf+Rlv0T+iajfs7jAih2Ey3n?=
 =?iso-8859-2?Q?UtTSlvFWcQZ/Lz7KxZA8yuyc4ExQ2CKC/IpvLFCQEnFDJwws3ABsBw0A60?=
 =?iso-8859-2?Q?72zL3q4h/+ZPiMIOGSqNQbupAEujS0hVzrrLsdqvLtqFdt+TkzsxDiNRtH?=
 =?iso-8859-2?Q?gUG/c6eaiN35kBpqKVPdTIK3m8LAJanQ6yGd/gePKjaDj/ah2b5Bh0J5QT?=
 =?iso-8859-2?Q?pfYprz2ubP4J8=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR02MB10030.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ec8810-0110-4dbe-3400-08db342e8f3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2023 10:31:17.9094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GqO3LJs1aiafQ5QVVl5YoeODMRgRpfd8rA4+zdZGquRyH+NM9/3CVIgNOnpWfvIi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7194
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 10:31:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179606

Hi Richard,=0A=
=0A=
Yes, that is sufficient. I've prepared an updated patch. In the meantime, I=
've noticed some of the patches from the series had been merged into master=
-next, but not to the master yet. Should I now resend the whole series, or =
filter out these patches, i.e. rebase to master or master-next?=0A=
=0A=
Thanks,=0A=
Petr=0A=
=0A=
________________________________________=0A=
From: Richard Purdie <richard.purdie@linuxfoundation.org>=0A=
Sent: Friday, March 31, 2023 2:06 PM=0A=
To: Petr Kubiz=F2=E1k - 2N; openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core][PATCH v4 06/10] webkitgtk: add missing dependencies=
=0A=
=0A=
On Fri, 2023-03-31 at 13:46 +0200, Petr Kubiz=F2=E1k wrote:=0A=
> When gobject-introspection feature is disabled, gettext and=0A=
> glib-2.0-native dependencies are not pulled in, which causes failures=0A=
> in do_compile due to missing xgettext and gdbus-codegen.=0A=
>=0A=
> Signed-off-by: Petr Kubiz=F2=E1k <kubiznak@2n.com>=0A=
> ---=0A=
>  meta/recipes-sato/webkit/webkitgtk_2.38.5.bb | 3 ++-=0A=
>  1 file changed, 2 insertions(+), 1 deletion(-)=0A=
>=0A=
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.38.5.bb=0A=
> index e52920883a..b49ecf2a31 100644=0A=
> --- a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb=0A=
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb=0A=
> @@ -17,7 +17,7 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BPN}-=
${PV}.tar.xz \=0A=
>             "=0A=
>  SRC_URI[sha256sum] =3D "40c20c43022274df5893f22b1054fa894c3eea057389bb08=
aee08c5b0bb0c1a7"=0A=
>=0A=
> -inherit cmake pkgconfig gobject-introspection perlnative features_check =
upstream-version-is-even gi-docgen=0A=
> +inherit cmake pkgconfig gobject-introspection perlnative features_check =
upstream-version-is-even gi-docgen gettext=0A=
>=0A=
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"=0A=
>  REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('DISTRO_FEATURES', 'w=
ayland', 'opengl', '', d)}"=0A=
> @@ -38,6 +38,7 @@ DEPENDS +=3D " \=0A=
>            libnotify \=0A=
>            gstreamer1.0 \=0A=
>            gstreamer1.0-plugins-base \=0A=
> +          glib-2.0-native \=0A=
>            "=0A=
>=0A=
>  PACKAGECONFIG_SOUP ?=3D "soup3"=0A=
=0A=
If the dependency is just xgettext then it may just be a DEPENDS +=3D=0A=
"gettext-native"  which is a lower requirement than the full gettext=0A=
target code?=0A=
=0A=
Cheers,=0A=
=0A=
Richard=0A=
=0A=

