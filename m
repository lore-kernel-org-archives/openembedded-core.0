Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.84])
 by mx.groups.io with SMTP id smtpd.web11.3345.1614145310102977026
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 21:41:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Qq5fxWj1;
 spf=pass (domain: windriver.com, ip: 40.107.92.84, mailfrom: yongxin.liu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bfcK3P4ee1bkQLQFS9I6rLzhVYwMA2YCG4Zakchq2HR06JyRQ4olrZKZF2pkbbTc+ejY9+60w53JcFxm6sWQQHRz8jJ249PFheMdVojEBpRWcyaXpNBzwm5hY7QqPk/163P1FKy4rB7wVtGXYiK/64sxir1rMo9wF2qDP8tOfhRt59qs8d+wnHKgtPW/Yi+NjlEmWk3BffRq4Zo9TYt1Pm0mp5lAATRNMpBX19GHcqu/gHE0UkEM1MZl0akB8g6WQbcOp31iW+2H1Rgu+rjP8VEkmglOKXOjqTkI+bgczcVl8D9NFrI/ZLlNVhp4V/mXZr1YlzuuxnpoVPd6ke3iIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xzJYm3D/rSccDnCG3GbP3ZSr/H5lfTj5exJZSm+Q9TY=;
 b=jVxqfvnhQQkfChXfZdElC5wHl4gYVTc4bWtoABwOZ8k4LEMlncyMHjrLC3dAwfPmFTO7HwdzGfy1lR2qpGi/ggzy8bd8EQQRQE6sy1kVMqLaH+6psxkYvuIbpsUOMzW8R/hqydMc8Dty4ckUifoyYJFYjfQHO/uyQAAMvKEc34MXyuSBGiw/hwrA1BGesFE8TRe+PbspABh6XuctQ+HG10yApNcHY9s0CbeHhl7w8uFvLzYFcSgOnYN9CoveKOd8JwUs9EIavD6gcv7xORMIhL3oODG5nn7fcq4xJ93CB2gh2soJ9R2V3GnN31kqledvuTJv848tb+h5+VBsJsHHCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xzJYm3D/rSccDnCG3GbP3ZSr/H5lfTj5exJZSm+Q9TY=;
 b=Qq5fxWj1xNRL9kjVv6R+1qQhpUEliUXODAaVDLOwngAQVLCOxiRrCFHtSb9FUkeaz1pW1fW2HuILkxZ2ccVwuXJ2tXpxDNH1K8jvGakgCK6lk4HrSp7bk7H1cxTN4g6FUCZgMccFKIAoxtoT7V4qEGaX6xE/TLGB1IlYuiLKtjI=
Received: from PH0PR11MB5175.namprd11.prod.outlook.com (2603:10b6:510:3d::8)
 by PH0PR11MB5014.namprd11.prod.outlook.com (2603:10b6:510:31::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.33; Wed, 24 Feb
 2021 05:41:47 +0000
Received: from PH0PR11MB5175.namprd11.prod.outlook.com
 ([fe80::8c9c:1dc9:353:8eba]) by PH0PR11MB5175.namprd11.prod.outlook.com
 ([fe80::8c9c:1dc9:353:8eba%7]) with mapi id 15.20.3868.033; Wed, 24 Feb 2021
 05:41:47 +0000
From: "Yongxin Liu" <yongxin.liu@windriver.com>
To: =?iso-8859-1?B?QvZzevZybelueWkgWm9sdOFu?= <zboszor@pr.hu>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] mesa: Allow building the iris driver
Thread-Topic: [OE-core][PATCH] mesa: Allow building the iris driver
Thread-Index: AQHXBdRGYws5h6ejyEObq+r+fTEljapmel0QgABX4QCAAADZAA==
Date: Wed, 24 Feb 2021 05:41:47 +0000
Message-ID: 
 <PH0PR11MB51754CF41DB48C10155A7D99E59F9@PH0PR11MB5175.namprd11.prod.outlook.com>
References: <1664CBDF366E1544.31496@lists.openembedded.org>
 <PH0PR11MB517551B295DA5D06BAD7A144E59F9@PH0PR11MB5175.namprd11.prod.outlook.com>
 <3a1b9a3d-2a57-2ced-2a1d-77293a14b6b4@pr.hu>
In-Reply-To: <3a1b9a3d-2a57-2ced-2a1d-77293a14b6b4@pr.hu>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pr.hu; dkim=none (message not signed)
 header.d=none;pr.hu; dmarc=none action=none header.from=windriver.com;
x-originating-ip: [60.247.85.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b896a34c-3251-4ed1-caa7-08d8d886e071
x-ms-traffictypediagnostic: PH0PR11MB5014:
x-microsoft-antispam-prvs: 
 <PH0PR11MB5014423B40BF6EF9CAD4189CE59F9@PH0PR11MB5014.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1r7bYtpYvsFWZ8yE9NMnoGItWBr032wftY272AEaF1iZVJr40k1F3t6kP7JOdJKjeiO014R66Yqunv5JEiw36d+pRqZlsGbbWKmtQSmX7XrJ6tk9vUEBxxiP8iJ4hEOd2ruenJ81Fh68RHjD628Ge7Zq7XRfQCypgKUinIq0o0g7IOs7UiVCfPDY5jeLQlCtXz5E0vZjgFvH1YFBPHR+tTBqrmnY1tbGQOYFHAdqU73Pwnlw8AV1ySKcnXPqVAw4dT5jsqH8SupIfJggvU74omS9R7Iflcliuvnkq+Q/JRC8TOnKTzhfYRH9HMZxP+MraVwl5peCr9+tx7lGK+61xMt2Cgmswy2Y7qAmTTgVuGSDE4IKAY8lF3zqM0SAH0y8gI63g99RHfYHF8tkk9/TE2/Y7cSZmeN1E/sUCeNsc6ZGsJrd5ZmSwnxrU81VKWyuRb85HTziPiFw9fyVgsc7CWDdjHY1NLBrnGL4dFO00+1Zyxo9YUCNrO1RwWcdsqo+92zrEY3TYCizgREot+TO+F+tkG+jJJKIQM+Dc/L6esoX7s2RzRB9ovGz35tosIr6U0FaXrWoQEtpsRGyA5E3c3iNV0LDqzjyHjSLN5Fqxs0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5175.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39850400004)(366004)(346002)(2906002)(9686003)(55016002)(86362001)(33656002)(186003)(26005)(8676002)(966005)(83380400001)(6506007)(71200400001)(66574015)(8936002)(478600001)(316002)(64756008)(66476007)(53546011)(66556008)(52536014)(5660300002)(76116006)(110136005)(66946007)(66446008)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?1JAUwBUJHu8XAntO3PoCuWdGRTo90qY9w59lRdE9pna7i+VkcKZVlS5DfF?=
 =?iso-8859-1?Q?MgFGL/JWj3bgeOOiRsR5wF08OOnkOZ7aHM+CalKafwEZcVHIg0HaZpK2gJ?=
 =?iso-8859-1?Q?RLvyIGDtuxr0uoshTA55ggLMa8UlZCq/vwKm34Uy9nWA6nln8NDUsV9VFv?=
 =?iso-8859-1?Q?kPeofZ+f6iUJ63BKuZTHjLeUPrlemaTOTO6KEDCFYqEf1lM9h2zFSI+410?=
 =?iso-8859-1?Q?UDH5mMONMpuVcACRKHx9Q/+uexCjYZ1a95B5fFVEOmuuiQ5VsZb3/NkCLX?=
 =?iso-8859-1?Q?cXqTSmTvvZKoLM+ODZWaoNny2lC6GNWJJRG31cfxteUuECnzvtdoJTpHeY?=
 =?iso-8859-1?Q?rxMidn8+62IEFokUJck5qRVrhSGEiKo/elDkoIBnV2z6Q2zXSEYCbCPZdt?=
 =?iso-8859-1?Q?nBD0itUTN/W0D3vprMGwbQlthCyuxjX54Y7J0tTSGjMb9Dhrx8Asf5dy/q?=
 =?iso-8859-1?Q?j9tKPYTnT8+64ZX2RdUAnE+PdXRIbK6CiU1gVtQ6lwJySUwqc0q+M38qtR?=
 =?iso-8859-1?Q?6PUlaEnTsWUMKRbVTsKbAbjQPHntOrvyM32pHlfy9bJlC2ldCeb6gOdV0J?=
 =?iso-8859-1?Q?k8INDVOpdmx9ZUtFdEiBhdcIYXxzG1o4EITbvro9ZfefQ5bOYq81yqn/qu?=
 =?iso-8859-1?Q?wC7G/aYFTNSaWNXrffYNBsniIJVYNCnfDReY9BBr+ag+rO5SOyEVhg1bbe?=
 =?iso-8859-1?Q?+cmhiuo7YETjMzMLgPc4PV+sUQqMoCOpgugqT4npRpBZvvnCriymu4UyFX?=
 =?iso-8859-1?Q?HspoDvEFbJQxLJTDsY16ldU1l20L91JePm89Y02Y9DYUHemicLiSrI4fXS?=
 =?iso-8859-1?Q?cfpJV6wOzlYwVqNHD7RmEgAtmtIPzTIDxq2WKFLZi0JGkLE2/1qoHR2mol?=
 =?iso-8859-1?Q?VBJFEijI+M8A8v+dfczNM9O/PhfALWvps4u3XxUuoldBx3HeiLw1bi++xd?=
 =?iso-8859-1?Q?D9H1w1DcgbqnFqTpb1htpLLcT2qX0/Pvcsz0c+/TVL0eZA+SAecYxxBFon?=
 =?iso-8859-1?Q?IymjlEPVuZZ05S4C8/4z6rVVLTVz7xUvSs6Qp31Mwu/iQ/HmdDRmlfZpAt?=
 =?iso-8859-1?Q?SbXi8HaxgqXBt1BzA9JwKtszL4KRY25DU9yz25KarLLcXTW+Lm+ZZM/K+i?=
 =?iso-8859-1?Q?mzem9tmphjkfwD+KZ2bTzG5OJxkoEqpVWVGRp7IhnfjLg2y6ibSlELK78g?=
 =?iso-8859-1?Q?RWIOUAjH+c1WxfY8z+tND2iZ3ve6tgU2+D9O1QpCWOCsSyts8eyk2uzL4v?=
 =?iso-8859-1?Q?0cxw0op2YEgHQZ6NlNgyIHxTMJnQuUItTrpfNVy7WpLSGQlMJ3+yRdOk8j?=
 =?iso-8859-1?Q?LlTB1QwbvObZeVo4ih02kZxvlVEfOVnRfjYvVPiDG9gacWg=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5175.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b896a34c-3251-4ed1-caa7-08d8d886e071
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 05:41:47.4172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YtCc1citiIbcLR7YdvL8XqlzFq4qU7QcM9hdsIl/9+B+OzjotK+mSGHyGdHD1mTCkeKiVBMY9a02sT5Zrr5tiSRY7bcDJhzLmlW3nbZ37OU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5014
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: B=F6sz=F6rm=E9nyi Zolt=E1n <zboszor@pr.hu>
> Sent: Wednesday, February 24, 2021 13:36
> To: Liu, Yongxin <Yongxin.Liu@windriver.com>; openembedded-
> core@lists.openembedded.org; richard.purdie@linuxfoundation.org
> Subject: Re: [OE-core][PATCH] mesa: Allow building the iris driver
>=20
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>=20
> Hi,
>=20
> 2021. 02. 24. 1:31 keltez=E9ssel, Yongxin Liu =EDrta:
> >
> > Iris driver supports Broadwell and newer (Gen8+) for very low CPU
> overhead.
> >
> > With this patch, user can add PACKAGECONFIG_append =3D " iris" in thei=
r
> bbappend file.
> >
> > And then iris will be added in build options, like "-Dgallium-
> drivers=3Dswrast,virgl,iris".
> > You can check mesa/2_20.3.2-r0/build/meson-logs/meson-log.txt for this=
.
> >
> > The driver can be found in build directory:
> > mesa/2_20.3.2-r0/image/usr/lib64/dri/iris_dri.so
> >
> >
> > Thanks,
> > Yongxin
>=20
> Since VAR_append can appear multiple times, bbappend files can equally d=
o
>=20
> GALLIUMDRIVERS_append_x86_class-target =3D ",iris"
> GALLIUMDRIVERS_append_x86-64_class-target =3D ",iris"
>=20
> instead of this PACKAGECONFIG.
>=20
> Anyway, since this MR exists in Mesa:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/8015
> after a certain point this will have to be used in the upstream recipe
> (pseudo-patch follows):
>=20
> ...
> -DRIDRIVERS_append_x86_class-target =3D ",r100,r200,nouveau,i965,i915"
> -DRIDRIVERS_append_x86-64_class-target =3D ",r100,r200,nouveau,i965,i915=
"
> ...
> +GALLIUMDRIVERS_append_x86_class-target =3D ",nouveau,i915,iris"
> +GALLIUMDRIVERS_append_x86-64_class-target =3D ",nouveau,i915,iris"
> ...
>=20

Great. Thanks for pointing it out.

--Yongxin

> Best regards,
> Zolt=E1n B=F6sz=F6rm=E9nyi
>=20
> >
> >> -----Original Message-----
> >> From: openembedded-core@lists.openembedded.org <openembedded-
> >> core@lists.openembedded.org> On Behalf Of Yongxin Liu
> >> Sent: Thursday, February 18, 2021 16:56
> >> To: openembedded-core@lists.openembedded.org;
> >> richard.purdie@linuxfoundation.org
> >> Subject: [OE-core][PATCH] mesa: Allow building the iris driver
> >>
> >> Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> >> ---
> >>   meta/recipes-graphics/mesa/mesa.inc | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-
> >> graphics/mesa/mesa.inc index cb075a8b89..72e22d654e 100644
> >> --- a/meta/recipes-graphics/mesa/mesa.inc
> >> +++ b/meta/recipes-graphics/mesa/mesa.inc
> >> @@ -168,6 +168,9 @@ GALLIUMDRIVERS_append
> >> =3D"${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '
> >>   PACKAGECONFIG[panfrost] =3D ""
> >>   GALLIUMDRIVERS_append =3D"${@bb.utils.contains('PACKAGECONFIG',
> >> 'panfrost', ',panfrost', '', d)}"
> >>
> >> +PACKAGECONFIG[iris] =3D ""
> >> +GALLIUMDRIVERS_append =3D"${@bb.utils.contains('PACKAGECONFIG',
> >> +'iris',
> >> ',iris', '', d)}"
> >> +
> >>   OSMESA =3D "${@bb.utils.contains('PACKAGECONFIG', 'gallium',
> >> 'gallium', 'classic', d)}"
> >>   PACKAGECONFIG[osmesa] =3D "-Dosmesa=3D${OSMESA},-Dosmesa=3Dnone"
> >>
> >> --
> >> 2.14.5
> >
> >
> >
> >=20
> >

