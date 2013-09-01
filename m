Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5487E6B3B7
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2013 11:12:17 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so1772542ead.16
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2013 04:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yXzR3FLK9vzKBsMD823fFt0Lz3zQD9kiQaZB+a9wyB4=;
	b=XhMHGa9D/HjoGMrEwtaXiBS0+WxQ3FHVYrf7amfMoOa1zo4x6YckEV0g36FSttqKof
	UeBZBuEaagi03vliCgFNrQ965TmGqdGs8qUEn5YaQVD1BizgJtgfuq6gL9ZmR2naeeYU
	JcBwv32sixFaW50UBem8QX57LHnFFZXxsYxZEbsmNjS5KTqs+iGyOmUkkjmDy38rT8nx
	SuksOV03ZggFKcYZ+aGm3oLgzof0Yn6nv5kKv7jDSh723NscAzupS2uOCurnSTiF7NH7
	NdnCYzZEZ4c/gjKFsoC7pJLM96A91iXs/sYm8XV1WAH0kOdnaG/zpy+PQ9U94ZM+e3/6
	48Yg==
X-Received: by 10.15.100.198 with SMTP id bn46mr27489827eeb.11.1378033937524; 
	Sun, 01 Sep 2013 04:12:17 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a6sm12468063eei.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 01 Sep 2013 04:12:17 -0700 (PDT)
Date: Sun, 1 Sep 2013 13:13:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Yevhen Kyriukha <kirgene@gmail.com>
Message-ID: <20130901111333.GW3544@jama>
References: <1377997926-55540-1-git-send-email-kirgene@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1377997926-55540-1-git-send-email-kirgene@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] cryptsetup: Updated to upstream version.
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
X-List-Received-Date: Sun, 01 Sep 2013 11:12:18 -0000
X-Groupsio-MsgNum: 44357
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uaCnWV1VgVvklJsa"
Content-Disposition: inline

--uaCnWV1VgVvklJsa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 01, 2013 at 04:12:06AM +0300, Yevhen Kyriukha wrote:
> Also build static libraries.

Hi,

please resend to openembedded-devel ML.

>=20
> Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
> ---
>  .../cryptsetup/{cryptsetup_1.6.1.bb =3D> cryptsetup_1.6.2.bb}         | =
6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/cryptsetup/{cryptsetup_1.6.1.bb =3D> cryp=
tsetup_1.6.2.bb} (87%)
>=20
> diff --git a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb b/met=
a-oe/recipes-support/cryptsetup/cryptsetup_1.6.2.bb
> similarity index 87%
> rename from meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb
> rename to meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.2.bb
> index 95f7e8d..6c3418a 100644
> --- a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb
> +++ b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.2.bb
> @@ -12,8 +12,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D32107dd283b1=
dfeb66c9b3e6be312326"
>  DEPENDS =3D "util-linux lvm2 popt libgcrypt"
> =20
>  SRC_URI =3D "http://cryptsetup.googlecode.com/files/cryptsetup-${PV}.tar=
=2Ebz2"
> -SRC_URI[md5sum] =3D "f374d11e3b0e7ca0f805756fd02e34ff"
> -SRC_URI[sha256sum] =3D "baf36e663c03eb6440482d91c486d61ed47ce5c9268ad04c=
18ca09082755149c"
> +SRC_URI[md5sum] =3D "cd834da49fbe92dd66df02cc5c61280f"
> +SRC_URI[sha256sum] =3D "15723f0198303d4bcb99d480b7a773918e2d319f03484579=
88c063bdd03e109a"
> =20
>  inherit autotools gettext
> =20
> @@ -29,3 +29,5 @@ RRECOMMENDS_${PN} =3D "kernel-module-aes-generic \
>                       kernel-module-cbc \
>                       kernel-module-sha256-generic \
>  "
> +
> +EXTRA_OECONF =3D "--enable-static"
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uaCnWV1VgVvklJsa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIjIV0ACgkQN1Ujt2V2gBzlvACfcymYKVofqKPjz0p3jqJvy7at
vgsAn11TFCTrM2w+yRnR276W30BE7O5x
=z88Z
-----END PGP SIGNATURE-----

--uaCnWV1VgVvklJsa--
