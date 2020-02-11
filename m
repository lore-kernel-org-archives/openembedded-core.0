Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id F321360CD1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 01:08:28 +0000 (UTC)
IronPort-SDR: 3Ekd7BktnjmdE+tta5EW9UhljDsB2nZu05PRDkrIjpmvOwM/E7bPg+JXATrPnqE8Vh+rAa4u0R
	gvj8CKNGOYDfbUTyEkskl6GFXMJpTXjqV7hnp1brZVks74u9yxqPbvBw0Gf2TsoA0305lNB0Ob
	PdEDNWlgZykuJ3YU4FNCe36NbY6sHsGaDAyKhDuSV8SHlVdWuVrip0PlIelheOB8ZdyhDRLviW
	cbd+tXHloI9oV2TLprmLzXmNVkyBWFW8JIyKJNOrIZgF99623rX4DUaazmIDRqCY/0VK1csHt9
	ARM=
X-IronPort-AV: E=Sophos;i="5.70,427,1574118000"; 
   d="scan'208";a="5275684"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] pkgconf: Remove pointless DEFAULT_PREFERENCE
Thread-Index: AQHV4CuDQw08lJP1dEOFdY3DvdJbF6gVLdow
Date: Tue, 11 Feb 2020 01:08:28 +0000
Message-ID: <034530475e114936a4a1c8b924905912@XBOX03.axis.com>
References: <20200210160224.21246-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200210160224.21246-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [PATCH] pkgconf: Remove pointless DEFAULT_PREFERENCE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Feb 2020 01:08:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of Richard Purdie
> Sent: den 10 februari 2020 17:02
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] pkgconf: Remove pointless DEFAULT_PREFERENCE
>=20
> There is no other version of pkgconfig to have a preference against,
> remove the unneeded variable.

The variable may be pointless, but I guess the intent was to make it=20
clear that the original pkgconfig recipe (which still exists) is to be=20
preferred?

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/pkgconf/pkgconf_1.6.3.bb | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.6.3.bb b/meta/recipe=
s-devtools/pkgconf/pkgconf_1.6.3.bb
> index 94bc112b9fd..732ca2a0348 100644
> --- a/meta/recipes-devtools/pkgconf/pkgconf_1.6.3.bb
> +++ b/meta/recipes-devtools/pkgconf/pkgconf_1.6.3.bb
> @@ -8,7 +8,6 @@ BUGTRACKER =3D "https://github.com/pkgconf/pkgconf/issues=
"
>  SECTION =3D "devel"
>  PROVIDES +=3D "pkgconfig"
>  RPROVIDES_${PN} +=3D "pkgconfig"
> -DEFAULT_PREFERENCE =3D "-1"
>=20
>  # The pkgconf license seems to be functionally equivalent to BSD-2-Claus=
e or
>  # ISC, but has different wording, so needs its own name.
> --
> 2.20.1

//Peter


