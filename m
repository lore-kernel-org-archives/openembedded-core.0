Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 89B156F89F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 11:24:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 01 Apr 2014 04:24:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,771,1389772800"; d="scan'208";a="504258741"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by fmsmga001.fm.intel.com with ESMTP; 01 Apr 2014 04:24:07 -0700
Received: from irsmsx101.ger.corp.intel.com (163.33.3.153) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Tue, 1 Apr 2014 12:23:11 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.78]) by
	IRSMSX101.ger.corp.intel.com ([169.254.1.248]) with mapi id
	14.03.0123.003; Tue, 1 Apr 2014 12:23:11 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Sarbu, Florin-Ionut (Wind River)" <florin.sarbu@windriver.com>
Thread-Topic: [OE-core] [PATCH] connman.inc: Add PACKAGECONFIG support for
	bluez5
Thread-Index: AQHPTZKJhiyv5K9pxUm65LZ9kMsX3pr8hKmAgAAX3FA=
Date: Tue, 1 Apr 2014 11:23:10 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB1CE76D4F@IRSMSX105.ger.corp.intel.com>
References: <1396346945-3782-1-git-send-email-florin.sarbu@windriver.com>
	<1396349467.1432.4.camel@ted>
In-Reply-To: <1396349467.1432.4.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman.inc: Add PACKAGECONFIG support for bluez5
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
X-List-Received-Date: Tue, 01 Apr 2014 11:24:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

I would also say that is an important change, with some possible unforeseen=
 consequences.
The YP is in the stabilization phase for 1.6 release.
In my opinion, the support for and change to BlueZ (overall) should be post=
poned to 1.7.
Also, this not the proper solution, because, in the end, if BlueZ4 will sti=
ll be around in 1.7 (which is not my intention, to be honest), this will be=
 worked out with a Bluetooth stack provider (which can be BZ4 or, preferabl=
y, BZ5).

I vote against this patch.

Regards,
Cristian Iorga
YP
Intel Corporation

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Richard Purdie
Sent: Tuesday, April 1, 2014 1:51 PM
To: Sarbu, Florin-Ionut (Wind River)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] connman.inc: Add PACKAGECONFIG support for b=
luez5

On Tue, 2014-04-01 at 13:09 +0300, Florin Sarbu wrote:
> Currently connman can only RDEPEND on bluez4.
> This patch adds support for having bluez5 in PACKAGECONFIG and get=20
> connman RDEPEND on bluez5 if desired.
>=20
> Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
> ---
>  meta/recipes-connectivity/connman/connman.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-connectivity/connman/connman.inc=20
> b/meta/recipes-connectivity/connman/connman.inc
> index b3147c9..53a6a4f 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -32,7 +32,7 @@ EXTRA_OECONF +=3D "\
> =20
>  PACKAGECONFIG ??=3D "wispr \
>                     ${@base_contains('DISTRO_FEATURES', 'wifi','wifi', ''=
, d)} \
> -                   ${@base_contains('DISTRO_FEATURES', 'bluetooth','blue=
tooth', '', d)} \
> +                   ${@base_contains('DISTRO_FEATURES',=20
> + 'bluetooth','bluez4', '', d)} \
>                     ${@base_contains('DISTRO_FEATURES', '3g','3g', '',=20
> d)} \  "
> =20
> @@ -42,6 +42,7 @@ PACKAGECONFIG ??=3D "wispr \
> =20
>  PACKAGECONFIG[wifi] =3D "--enable-wifi, --disable-wifi, wpa-supplicant"
>  PACKAGECONFIG[bluetooth] =3D "--enable-bluetooth, --disable-bluetooth, b=
luez4"

You renamed the option above but didn't here and hence broke bluez4.
This is not the quality of patch expected at -rc time for a release :(.

Cheers,

Richard

> +PACKAGECONFIG[bluez5] =3D "--enable-bluetooth, --disable-bluetooth, blue=
z5"
>  PACKAGECONFIG[3g] =3D "--enable-ofono, --disable-ofono, ofono"
>  PACKAGECONFIG[tist] =3D "--enable-tist,--disable-tist,"
>  PACKAGECONFIG[openvpn] =3D "--enable-openvpn --with-openvpn=3D${sbindir}=
/openvpn,--disable-openvpn,,openvpn"
> @@ -114,6 +115,7 @@ RPROVIDES_${PN} =3D "\  RDEPENDS_${PN} =3D "\
>  	dbus \
>  	${@base_contains('PACKAGECONFIG', 'bluetooth', 'bluez4', '', d)} \
> +	${@base_contains('PACKAGECONFIG', 'bluez5', 'bluez5', '', d)} \
>  	${@base_contains('PACKAGECONFIG', 'wifi','wpa-supplicant', '', d)} \
>  	${@base_contains('PACKAGECONFIG', '3g','ofono', '', d)} \
>  	xuser-account \
> --
> 1.9.1
>=20


--=20
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

