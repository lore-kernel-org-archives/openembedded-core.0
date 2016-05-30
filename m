Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 928286FF7F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 21:48:31 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 30 May 2016 14:48:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,392,1459839600"; 
	d="asc'?scan'208";a="817939327"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.164])
	([10.219.5.164])
	by orsmga003.jf.intel.com with ESMTP; 30 May 2016 14:48:31 -0700
To: Renato Caldas <rm.santos.caldas@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20160530214549.3766-1-rm.santos.caldas@gmail.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <574CB55A.4080405@linux.intel.com>
Date: Mon, 30 May 2016 16:49:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20160530214549.3766-1-rm.santos.caldas@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [master][PATCH] perl: reorder tar arguments in do_install_ptest()
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
X-List-Received-Date: Mon, 30 May 2016 21:48:31 -0000
X-Groupsio-MsgNum: 82861
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="NaTE6b9LF2Vjtaqsb0UKa4VV2vHRRLiaT"

--NaTE6b9LF2Vjtaqsb0UKa4VV2vHRRLiaT
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Thanks for sending the patch, only a little comment the [master] prefix
isn't required.

	alimon

On 05/30/2016 04:45 PM, Renato Caldas wrote:
> On some distributions tar requires the FILE argument to be the last, an=
d
> the existing order was causing the subsequent --exclude options to be d=
ropped.
>=20
> Fixes [YOCTO #9673].
>=20
> Signed-off-by: Renato Caldas <rm.santos.caldas@gmail.com>
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


--NaTE6b9LF2Vjtaqsb0UKa4VV2vHRRLiaT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJXTLVcAAoJEGJqcE9h3glgrY8P/j5bBoj8Q7EB1JPSGnBq+lqt
qWO6t4tZUGreI053C4PVvcRW48PQ5tfjTRuEnrOVEItZ8++wpq7yblhgHc4hR7hq
Fvt/ZJh2Iz0ktaOhjQBYtsciQd7atQ8E0tydlzcIBjotHmaHXPJa7YPLvcrym65I
araPx7hjR9Hxz0qWWpIdPJP0ngT7z/VwFnU+fQ43RZwHW3x0dJPqOXWdaeQ2x6y7
WJzHr4UpXOQDexs2Yc5HtKAEWMIBQCunw0diIJ9hUwSKfkD1d72MnMBPwAzy5dEQ
liuY8818qNfXueRvRwG1OA6aYRLDgJZnSmkPXk5hY2sJoy+P9QZkLCHBqSj/esa0
MycIdDa3wJxldt1y2W98n9NGFm+D/GxlInPgGgAklmhYN4RyXmVIvJxxYC+3/GuF
Nmkxk/W8P8qYcTiiu8w5X6pWOVTBSB8KVQ6QX8GihDs4/sxe1TDCS8Llzd6i4vYf
6SLeqd/8c3xRY7FCkNg2vEy9mOXOlUSXOGk7RozrlCznD26JmMQgDi24tsLdBo8/
qmJSoKWblWlvyPCvZqnC9LzjpKe6QYd9fWJUvTgaevo8ipM7TDEuzqBF178Ia6is
ncq6kPwXvLMFNENVxIXWrUM/wqtfxyDpAjgzBlR9dxWf4KIQZpJyb3q3L2shT2hp
bN3G1F+uK48rKwlwm53w
=Uzu4
-----END PGP SIGNATURE-----

--NaTE6b9LF2Vjtaqsb0UKa4VV2vHRRLiaT--
