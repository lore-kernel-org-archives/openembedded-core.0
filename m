Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RGRsw-0001wQ-AN
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 10:52:26 +0200
Received: by bkat8 with SMTP id t8so2045091bka.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2011 01:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tIGptrbNshB8bIFWART/fXBWuSStc87FwPJvg3p6AD8=;
	b=V594mZiPacXZXzKdVnCr55MrwCSp50Wx/ZR+v1rij8K0s//kAyWQgoZ3CFbVv0k50u
	wt7o3m/RKBIAc4pnuWrpH2ohBr6HRijUBCrK3kT8Mz86FsY/fvfeUrfQlAcEJU7Cl/MC
	n7LqBn5SUhvguTaxEw36XXKE2pmEXuAKjHh6w=
Received: by 10.204.7.206 with SMTP id e14mr4266233bke.87.1319013995827;
	Wed, 19 Oct 2011 01:46:35 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u18sm5042468bkn.6.2011.10.19.01.46.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Oct 2011 01:46:34 -0700 (PDT)
Date: Wed, 19 Oct 2011 10:46:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111019084629.GC3522@jama.jama.net>
References: <cover.1318976197.git.josh@linux.intel.com>
	<36d6035f30aedab85ce5acf79d5a935151514f1f.1318976197.git.josh@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <36d6035f30aedab85ce5acf79d5a935151514f1f.1318976197.git.josh@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/2] gst-plugins-good: update to 0.10.30
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Oct 2011 08:52:26 -0000
X-Groupsio-MsgNum: 11238
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HG+GLK89HZ1zG0kk"
Content-Disposition: inline

--HG+GLK89HZ1zG0kk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2011 at 03:24:11PM -0700, Joshua Lock wrote:
> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> ---
>  ...good_0.10.28.bb =3D> gst-plugins-good_0.10.30.bb} |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-multimedia/gstreamer/{gst-plugins-good_0.10.28.bb =
=3D> gst-plugins-good_0.10.30.bb} (84%)
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.28.b=
b b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
> similarity index 84%
> rename from meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.28.bb
> rename to meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
> index 6c837a7..96855aa 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.28.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
> @@ -18,5 +18,5 @@ do_configure_prepend() {
>  	rm ${S}/m4/lib-link.m4 || true
>  }
> =20
> -SRC_URI[md5sum] =3D "6ef1588921f59d85c44ee2e49a3c97a0"
> -SRC_URI[sha256sum] =3D "adfbce68b9fbadb7a7aeda2227af6afe1928ef025af41587=
26617b9d6834b028"
> +SRC_URI[md5sum] =3D "62fd7a3ef187c4f99b3d7c352d58dae9"
> +SRC_URI[sha256sum] =3D "b12cba90b27d8423cd0a808939098d19db3996cfb9bf5285=
07c6321782e095f6"
> --=20
> 1.7.6.4

Can you please fix:
NOTE: Running task 2693 of 2701 (ID: 9, /OE/shr-core/openembedded-core/meta=
/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb, do_package)
NOTE: package gst-plugins-good-0.10.30-r2: task do_package: Started
WARNING: For recipe gst-plugins-good, the following files were installed bu=
t not shipped in any package:
WARNING:   /etc/gconf/schemas/gstreamer-0.10.schemas
NOTE: package gst-plugins-good-0.10.30-r2: task do_package: Succeeded

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HG+GLK89HZ1zG0kk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6ejmUACgkQN1Ujt2V2gBxXHQCglPzoXbvfCW9k/GH4WdoVulGZ
Io4AniCDc7fYD9lfRu1a4fRCZkFXUyCq
=zXGe
-----END PGP SIGNATURE-----

--HG+GLK89HZ1zG0kk--
