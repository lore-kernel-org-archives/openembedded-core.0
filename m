Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7681B731F9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 20:11:16 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 30 May 2016 13:11:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,391,1459839600"; 
	d="asc'?scan'208";a="711212457"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.164])
	([10.219.5.164])
	by FMSMGA003.fm.intel.com with ESMTP; 30 May 2016 13:11:16 -0700
To: Renato Caldas <rm.santos.caldas@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20160528115341.4965-1-rm.santos.caldas@gmail.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <574C9E8C.1070503@linux.intel.com>
Date: Mon, 30 May 2016 15:11:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20160528115341.4965-1-rm.santos.caldas@gmail.com>
Subject: Re: [PATCH] perl: reorder tar arguments in do_install_ptest()
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
X-List-Received-Date: Mon, 30 May 2016 20:11:16 -0000
X-Groupsio-MsgNum: 82851
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="EOlEr6KuowLfTCJOUFoeWNr47uwRTRTVl"

--EOlEr6KuowLfTCJOUFoeWNr47uwRTRTVl
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Renato,

I tested the patch and works very well.
Could you sent another patch with [krogoth] prefix to be backported?

Thanks a lot,
	alimon


On 05/28/2016 06:53 AM, Renato Caldas wrote:
> On some distributions tar requires the FILE argument to be the last, an=
d
> the existing order was causing the subsequent --exclude options to be d=
ropped.
>=20
> Fixes [YOCTO #9673].
>=20
> Signed-off-by: Renato Caldas <rm.santos.caldas@gmail.com>
Acked-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>
> ---
>  meta/recipes-devtools/perl/perl-ptest.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-d=
evtools/perl/perl-ptest.inc
> index 948ea7c..66c5355 100644
> --- a/meta/recipes-devtools/perl/perl-ptest.inc
> +++ b/meta/recipes-devtools/perl/perl-ptest.inc
> @@ -7,8 +7,8 @@ do_install_ptest () {
>  	mkdir -p ${D}${PTEST_PATH}
>  	sed -e "s:\/opt:\/usr:" -i Porting/add-package.pl
>  	sed -e "s:\/local\/gnu\/:\/:" -i hints/cxux.sh
> -	tar -cf - * --exclude \*.o --exclude libperl.so --exclude Makefile --=
exclude makefile --exclude hostperl \
> -		--exclude miniperl --exclude generate_uudmap --exclude patches | ( c=
d ${D}${PTEST_PATH} && tar -xf - )
> +	tar -cf - --exclude \*.o --exclude libperl.so --exclude Makefile --ex=
clude makefile --exclude hostperl \
> +		--exclude miniperl --exclude generate_uudmap --exclude patches * | (=
 cd ${D}${PTEST_PATH} && tar -xf - )
> =20
>  	sed -i -e "s,${D},,g" \
>  	       -e "s,--sysroot=3D${STAGING_DIR_HOST},,g" \
>=20


--EOlEr6KuowLfTCJOUFoeWNr47uwRTRTVl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJXTJ6RAAoJEGJqcE9h3glgjRAQAJEJUZpFz+GrWFBvfNcmKMJ5
8HmbaCfBQRXj6gV10z8RcZI2VMO2J1k+tEDSMFJhGI4S6GG4kpUAy1rbggM/E4l5
kc836dKcfgnObNYOeX3mCSjtyLxLidQVSmwDOf9D49UZdoVR7eVEWlSMVz7esA11
LvSFahhlUALEu9+2T62a9sqmqqB53Y7RtbKzRdQYhoopo7mD5kNSBLqErjOO3jT+
IxIhM8SefUamLIRyeJCRIyQFcIVuz1qKbPnglFk9MawPCNwo7HH+WGuuWh1vyuDK
/sN1fxgczm+P3+MO8GDn40sZJFXnkL+pkEeHJJNf61AFlSXXPOgA2hnzhSENuHOB
VmI9Llq6Ir25lSNKTFxa6umdXriRriq6IimCNHXSnAdJSwMVH3BJjM9V7ddR4tjT
qws8UDbD6dmB9AkDIS64U9yflfC+BApKMVehOSKYo6w1T8WRs2xpfr15Nrvpe2E1
jkkGRAfLdgcGzFuqVjG9EtDsYJhxFnP5cDfQGNrptfnLvw/nXA+5imCf8jDuqgYw
bO6Ih78rQIACryAt3NSstwgn58B32XlXxA8kFr5nr7OOoRTqsBneKWWI19hoToMq
+1WeE7UfIH2Waugcu9kjzpv7XZcnr3JrBe8NXP3YRulV6+M2RrkDTLKIRn4aZft2
HVU0FCDwCszRA9lsiMMg
=YS5A
-----END PGP SIGNATURE-----

--EOlEr6KuowLfTCJOUFoeWNr47uwRTRTVl--
