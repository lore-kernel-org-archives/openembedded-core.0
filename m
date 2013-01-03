Received: from mail-pa0-f50.google.com ([209.85.220.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TqoGR-0003YJ-OF; Thu, 03 Jan 2013 18:07:35 +0100
Received: by mail-pa0-f50.google.com with SMTP id hz10so8730095pad.37
	for <multiple recipients>; Thu, 03 Jan 2013 08:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=MPQwcLPzbHZwTOipbvE1iytJr9/2WPQNfJEhJwvp008=;
	b=k1JkTaaupuqExA93eGHPbOn9lSBH1/Vva1w+vnEzoH67zxtn+CDZPiJpfQOSHuiBMh
	S+cu3cdUbEYqm4SvK+9Y3l0BNp63v8TZveykHcsRSVa8T2XPBX3PgA65eYn/6oKdpzk8
	JCeuYO3cT5FyJycs3jBBOcaAbPm8ty84bTW/aOvpEryrPyehFrDxe1hY/dW65N9eVBQr
	CsapkVoa0tZg9xFlgDxUPUGoYaGE95CLStN/luMhD0BcyqIo1DnN3ximguHMwy6o+yQa
	mEndgdIykUxzZEE4Dh21pPKazuVMdJpbhUwWQh4igJDh1JRR+UOwTLOTW8R08TIVTkrS
	02pQ==
X-Received: by 10.68.131.73 with SMTP id ok9mr156332326pbb.83.1357231946687;
	Thu, 03 Jan 2013 08:52:26 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ot3sm30588869pbb.38.2013.01.03.08.52.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 08:52:25 -0800 (PST)
Date: Thu, 3 Jan 2013 17:52:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Constantin Musca <constantinx.musca@intel.com>
Message-ID: <20130103165232.GH3276@jama>
References: <20121231094421.4C58F102EC@opal>
MIME-Version: 1.0
In-Reply-To: <20121231094421.4C58F102EC@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Constantin Musca : gsettings-desktop-schemas: add recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Jan 2013 17:07:37 -0000
X-Groupsio-MsgNum: 33241
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J+eNKFoVC4T1DV3f"
Content-Disposition: inline

--J+eNKFoVC4T1DV3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 31, 2012 at 09:44:21AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 59d7b8b3bdef47c1ad45fc404b1b169b5f2980b7
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D59d7b8b3bdef47c1ad45fc404b1b169b5f2980b7
>=20
> Author: Constantin Musca <constantinx.musca@intel.com>
> Date:   Fri Dec 21 14:42:07 2012 +0200
>=20
> gsettings-desktop-schemas: add recipe
>=20
> - this is needed by metacity 2.34.13
>=20
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

gsettings-desktop-shemas recipe in meta-gnome had extra postinst,=20
can you add that to oe-core recipe if it's still useful?

BTW: gsettings-desktop-schemas_3.0.1.bb needs to be removed from
otherwise old version is built and metacity fails.

--- ./meta-gnome/recipes-gnome/gnome-desktop/gsettings-desktop-schemas_3.0.=
1.bb 2012-07-19 09:10:28.502340570 +0200
+++ ../openembedded-core/./meta/recipes-gnome/gnome/gsettings-desktop-schem=
as_3.7.3.bb  2013-01-01 22:16:07.294198940 +0100
-inherit gnome
-
-RDEPENDS_${PN} =3D "glib-2.0-utils"
+DEPENDS =3D "glib-2.0"
=20
-pkg_postinst_${PN} () {
-if [ -n "$D" ]; then
-    exit 1
-fi
+inherit gnome pkgconfig autotools gettext
=20
-glib-compile-schemas ${datadir}/glib-2.0/schemas
-}
+GNOME_COMPRESS_TYPE =3D "xz"

Cheers,

>=20
> ---
>=20
>  .../gnome/gsettings-desktop-schemas_3.7.3.bb       |   15 +++++++++++++++
>  1 files changed, 15 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb =
b/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb
> new file mode 100644
> index 0000000..720858a
> --- /dev/null
> +++ b/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb
> @@ -0,0 +1,15 @@
> +DESCRIPTION =3D "A collection of GSettings schemas for settings shared b=
y various components of a desktop"
> +HOMEPAGE =3D "http://live.gnome.org/gsettings-desktop-schemas"
> +BUGTRACKER =3D "https://bugzilla.gnome.org/"
> +
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
> +
> +DEPENDS =3D "glib-2.0"
> +
> +inherit gnome pkgconfig autotools gettext
> +
> +GNOME_COMPRESS_TYPE =3D "xz"
> +
> +SRC_URI[archive.md5sum] =3D "6dbede8f6112b7e0dd4864e979b91771"
> +SRC_URI[archive.sha256sum] =3D "1da53e1b960f08ce4b0d472e6f339b7beaf19a78=
89c15911775abf4efe2ec760"
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--J+eNKFoVC4T1DV3f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDlt1AACgkQN1Ujt2V2gBxVMgCePNyX/w3JXSa/xmpX8ihfz141
jucAn0BP/h9n6ZCkYlc/cmlVxcsN6myC
=pdqp
-----END PGP SIGNATURE-----

--J+eNKFoVC4T1DV3f--
