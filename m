Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4B2E96612D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 16:39:18 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 22 Mar 2016 09:39:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,377,1455004800"; 
	d="asc'?scan'208";a="673905312"
Received: from unknown (HELO [10.219.16.250]) ([10.219.16.250])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Mar 2016 09:39:13 -0700
To: openembedded-core@lists.openembedded.org
References: <1458664665-20517-1-git-send-email-alejandro.franco@linux.intel.com>
From: Alex Franco <alejandro.franco@linux.intel.com>
Message-ID: <56F17581.70809@linux.intel.com>
Date: Tue, 22 Mar 2016 10:40:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1458664665-20517-1-git-send-email-alejandro.franco@linux.intel.com>
Cc: joshua.g.lock@intel.com, benjamin.esquivel@intel.com, aschultz@tpip.net
Subject: Re: [PATCH] nativesdk-buildtools-perl-dummy.bb: disable ICECC
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
X-List-Received-Date: Tue, 22 Mar 2016 16:39:19 -0000
X-Groupsio-MsgNum: 79950
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="AnSS1HBegrqoju2S4dxPX6JbpOuMUClAt"

--AnSS1HBegrqoju2S4dxPX6JbpOuMUClAt
Content-Type: multipart/mixed; boundary="VUGnogGPJXg5rImg84N7DjX1MWEDbw3cc"
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: aschultz@tpip.net, benjamin.esquivel@intel.com, jussi.kukkonen@intel.com,
 joshua.g.lock@intel.com
Message-ID: <56F17581.70809@linux.intel.com>
Subject: Re: [PATCH] nativesdk-buildtools-perl-dummy.bb: disable ICECC
References: <1458664665-20517-1-git-send-email-alejandro.franco@linux.intel.com>
In-Reply-To: <1458664665-20517-1-git-send-email-alejandro.franco@linux.intel.com>

--VUGnogGPJXg5rImg84N7DjX1MWEDbw3cc
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Fix originally submitted on bugzilla [1] by Andreas Schultz, I get good
results with it and I do think that ICECC should be disabled for this
recipe...

Alex Franco

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D8934

On 03/22/2016 10:37 AM, Alex Franco wrote:
> Disable ICECC, as this recipe was added for compatibility with
> the extensible SDK (eSDK), and therefore does not need to be
> able to be built with the distributed icecream compiler.
>
> [YOCTO #8934]
>
> Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
> ---
>  meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb =
b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
> index 90784a9..b488b03 100644
> --- a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
> +++ b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
> @@ -18,6 +18,7 @@ PERLPACKAGES =3D "nativesdk-perl \
>                  nativesdk-perl-module-file-path"
> =20
>  ALLOW_EMPTY_${PN} =3D "1"
> +ICECC_DISABLED =3D "1"
> =20
>  python populate_packages_prepend() {
>      d.appendVar(d.expand('RPROVIDES_${PN}'), '${PERLPACKAGES}')



--VUGnogGPJXg5rImg84N7DjX1MWEDbw3cc--

--AnSS1HBegrqoju2S4dxPX6JbpOuMUClAt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJW8XWFAAoJEPR9uwMY2lTLpLgIAISfdk//wmR3+dfnPOYriUsH
CPOeTZpTVMFuhITXrTtc+tQreoSYn8WaenkwgdXjTC8wXLQmF2MWZfr+HY96lyzW
N7gSuGqFOBA88imu9X+UUNoqY1KUzhIVWStXv1jE15DhAPnxgh7hJJ9y/niuLRQr
lpOG1avOYPS2e7LkLdmYmkwDSOyMzREa782krkJZCKCFpmWTK9iXvgDawZs7GJ1I
8oQuD1WHPTpXJi/escrveGtqsCZrIGFzcInND+w369N4wxLe2ufBLWYXA3BHQZHo
Fho4NUOY0Pe6mtHB8Vv60RxiZ+zSWHrb8dLUu1PRMKM5NGbgIs2CpK7w3lYvASM=
=ZdHi
-----END PGP SIGNATURE-----

--AnSS1HBegrqoju2S4dxPX6JbpOuMUClAt--
