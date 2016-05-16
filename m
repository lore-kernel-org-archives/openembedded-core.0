Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 857D7601A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 17:23:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 16 May 2016 10:23:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,627,1459839600"; 
	d="asc'?scan'208";a="982183515"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.164])
	([10.219.5.164])
	by fmsmga002.fm.intel.com with ESMTP; 16 May 2016 10:23:37 -0700
To: openembedded-core@lists.openembedded.org
References: <1462984915-12056-1-git-send-email-anibal.limon@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <573A0236.6040003@linux.intel.com>
Date: Mon, 16 May 2016 12:24:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1462984915-12056-1-git-send-email-anibal.limon@linux.intel.com>
Cc: patrick.ohly@gmx.de
Subject: Re: [PATCH] classes/base: get_lic_checksum_file_list imporve validaton of url's
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
X-List-Received-Date: Mon, 16 May 2016 17:24:00 -0000
X-Groupsio-MsgNum: 82163
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="wha1VCW1xX6Ma1I4IWWTOkmd4aioei4EM"

--wha1VCW1xX6Ma1I4IWWTOkmd4aioei4EM
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

ping

On 05/11/2016 11:41 AM, An=C3=ADbal Lim=C3=B3n wrote:
> When specify an URL different that supported file:// the function
> returns an empty path causing an exception without notice the user
> that the URL is Malformed.
>=20
> [YOCTO #9211]
>=20
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
> ---
>  meta/classes/base.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index a7ca3a6..c3c2669 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -105,6 +105,9 @@ def get_lic_checksum_file_list(d):
>          # any others should be covered by SRC_URI.
>          try:
>              path =3D bb.fetch.decodeurl(url)[2]
> +            if not path:
> +                raise bb.fetch.MalformedUrl(url)
> +
>              if path[0] =3D=3D '/':
>                  if path.startswith(tmpdir):
>                      continue
>=20


--wha1VCW1xX6Ma1I4IWWTOkmd4aioei4EM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJXOgI4AAoJEGJqcE9h3glgdT8P/juaDNBrJJTzDs/+jKl4C2Hq
Y5I6HM5itNmz5N/gM8CEh7GHEpIldk7V+9K4Oe8dJGiBNP9rnP5SE3RFWYn4todF
S0zryGCgsq2WlUxGFotPPBC6RMH6LpRooCVwvE98o2Sn6RcpYKbinQCcYLdXGq9r
cg6eHWEBPAXNPfgfEvpIrCQE3jrarw13svTpzDCBQ2zZ6bO5Pizboq7Q2fLe5baX
98l883ROaw04cV/5BGcuATdyjpU9NFW0lquiNWdc89se506JaJDh1YjUGE6WJra3
2ict2RArN+ts8NeLul4Kr1Qv5vhAP+k1naFzE4ewJ8kuif9bqjhFkE9D7+mYXsQU
m4S7t2C+8ENIVLVAhLnvviWdKLZKe4aE5Z1Rdsv5qipl9rl8bFPmZGSnQSkE+iHZ
hh8jJwC8fVITEwyrGcQ/vGiN5QD2H+LFcdjwIvfLm/8H1iYxPgbFVv3SREsScPAu
WogiIjYZIGmK+esaAaw0uId++EFJol/Yy5dFFW2tBzHz1ZkE2IL7x4jKerFzHWQr
hKO01aLDV2tKO936AfiVnr/6EQbfKpuN5ySIjQUs8OwtBZzlpW+ePyS5Kl61P5bu
cxztBT6y/ctN2Hj4kf4HE7g8yvyOtBRFEkExzgGxRDne1F8fkytj/2tn9XmTdBd3
k0MgJ7XTu6L7stG4AoCZ
=HrAY
-----END PGP SIGNATURE-----

--wha1VCW1xX6Ma1I4IWWTOkmd4aioei4EM--
