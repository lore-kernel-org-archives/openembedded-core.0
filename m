Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id AF308780AA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 16:13:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 May 2017 09:13:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,415,1491289200"; 
	d="asc'?scan'208";a="93154049"
Received: from unknown (HELO [10.219.128.117]) ([10.219.128.117])
	by orsmga002.jf.intel.com with ESMTP; 29 May 2017 09:13:46 -0700
To: Patrick Ohly <patrick.ohly@intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.393a6efac99077bd222866024d8e18f371414195.1496071841.git-series.patrick.ohly@intel.com>
	<c8d26bf705a207b8f639c966f811bbb15556038c.1496071841.git-series.patrick.ohly@intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <592C48BD.5020107@linux.intel.com>
Date: Mon, 29 May 2017 11:13:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <c8d26bf705a207b8f639c966f811bbb15556038c.1496071841.git-series.patrick.ohly@intel.com>
Subject: Re: [PATCH 3/6] yocto-compat-layer.py: apply test_signatures to all layers
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
X-List-Received-Date: Mon, 29 May 2017 16:13:48 -0000
X-Groupsio-MsgNum: 97886
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="NT4DBsPxTBiLIFr4LpWFI1ouh4VeDO4eU"

--NT4DBsPxTBiLIFr4LpWFI1ouh4VeDO4eU
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 05/29/2017 10:32 AM, Patrick Ohly wrote:
> Software layers were previously allowed to change signatures, but
> that's not desired for those layers either. The rule that a layer
> which is "Yocto Compatible 2.0" must not change signatures unless
> explicitly requested holds for all kinds of layers.

If i understand correctly now a software layer can't change a signature
but how do we handle this?, currently if a software layer is added and
has bbappends or newer version of a recipe the signature will change.

May be we need to postpone this validation removal until we have a
manner to avoid a software layer automatically change the signatures.

Cheers,
Anibal


>=20
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  scripts/lib/compatlayer/cases/common.py | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/scripts/lib/compatlayer/cases/common.py b/scripts/lib/comp=
atlayer/cases/common.py
> index 2dfcbb1..fe4936e 100644
> --- a/scripts/lib/compatlayer/cases/common.py
> +++ b/scripts/lib/compatlayer/cases/common.py
> @@ -27,10 +27,6 @@ class CommonCompatLayer(OECompatLayerTestCase):
>                        'bitbake -e')
> =20
>      def test_signatures(self):
> -        if self.tc.layer['type'] =3D=3D LayerType.SOFTWARE:
> -            raise unittest.SkipTest("Layer %s isn't BSP or DISTRO one.=
" \
> -                     % self.tc.layer['name'])
> -
>          # task -> (old signature, new signature)
>          sig_diff =3D {}
>          curr_sigs, _ =3D get_signatures(self.td['builddir'], failsafe=3D=
True)
>=20


--NT4DBsPxTBiLIFr4LpWFI1ouh4VeDO4eU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJZLEi/AAoJEGJqcE9h3glgd9oP/3FHQo59alFWv+U9QuLv0yhg
FYc9j+dG/7KBL3gfQkfG8PX3zZQKS7ZTRnsUzfOBg5+Hn4EsyTDwZk6+nF1zpLvk
t1+0jxqfdA8lzDYc5l3sF7DvMzDRmuXPDAq/uJqHF047V0QqFUTNz3Qg3t60fAvX
GlRJMroBAGG2GH2BzKGJpI8w50b+Uhrai6czPjj6UDENIx8/S6Sc2BcLnFKriB0e
8tLN8SsR5lI9S8TtKlrzSrEcNR0uvPe5eay8UluwgpESDNkZ/stH4l7IRDYi094x
EgCtoK3zFwdQPyKn7oAi35PQBagV6O2u997n/2CF481tcBB1W3EXGp0pra96cOKB
Nuu07iDppM995E4W93zJa1xvb8PNIcb4qk7qU82QuG1CC02d+dismzXat8A0BrZ9
xOQbj/89vnOubODotygnp7nsKwgUU7d5lbPYQ5Ve3+1iLTaIxmaWSWYs+h4jYj8I
VlfjmRjEWLaKI5rQFB8lYNFLOba1+RXXIhVYkTerNxvuSk+LASJ1RvVYAIXgU1AX
2yRK3aNLaZ7x20Cip/aHxCvhtQ9FXSlP7KY2gH9pt0ZmoXw4FPzeZyPVjhT0+yes
OnOGE6Dt5SWf0CZAvQyw0EBf8wG4qfuYhpKU4BTtUr0cnVc+QHmUzB0Zg+dLA4p5
45KYGyEbyGF3ruvN6SeB
=3QkM
-----END PGP SIGNATURE-----

--NT4DBsPxTBiLIFr4LpWFI1ouh4VeDO4eU--
