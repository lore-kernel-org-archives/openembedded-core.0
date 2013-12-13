Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id A0E3F60EF6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 15:08:04 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id r15so943093ead.38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 07:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fFQ+l9OrEh/tKZu9sd4ss4ygW1WxeAhVw5Pfqm2/FTI=;
	b=r7+Xt1fhhtQD+7xS4vC7DC1XETcA03KXKPW2+ry1tWxjaYsvNrE/KPilybPfgdmjbS
	0D1h3XnYwV+vpopCeVXSE5TX9lUZaWOJkcPgMPPGGVrazkEAhIeGU4RcDEx8ZVDgzuxt
	YzSABoqXBl4WIWRWloDSt6+EmrX9nDs0OWzI/R2rTQ1zrOUAmp684PiWtIayvkiaGuyf
	2BLtMOCGhy9rf/wBULb/ve9k2c5ReSN+8UIyrB6O9a/rECHgCAqWb7V7cTbppr/bd7pt
	niu/BAP+cm3cebJA82KExp0xGTDGrlLHOsdzvEswg2uo0vbW8qhzsAsZLmHRGs1npzTA
	9Nyw==
X-Received: by 10.14.9.131 with SMTP id 3mr3411849eet.45.1386947283306;
	Fri, 13 Dec 2013 07:08:03 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id j46sm7701151eew.18.2013.12.13.07.08.01
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Dec 2013 07:08:02 -0800 (PST)
Date: Fri, 13 Dec 2013 16:08:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Message-ID: <20131213150826.GC3715@jama>
References: <cover.1386946335.git.kergoth@gmail.com>
	<6122710ad05d4a2c1fa2d42fba3025cae6dab5ed.1386946335.git.kergoth@gmail.com>
MIME-Version: 1.0
In-Reply-To: <6122710ad05d4a2c1fa2d42fba3025cae6dab5ed.1386946335.git.kergoth@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC 1/2] os-release: add new operating system identification recipe
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
X-List-Received-Date: Fri, 13 Dec 2013 15:08:05 -0000
X-Groupsio-MsgNum: 48201
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WplhKdTI2c8ulnbP"
Content-Disposition: inline

--WplhKdTI2c8ulnbP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2013 at 07:56:37AM -0700, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>=20
> This is needed by systemd, among other useful applications. All fields are
> metadata driven, and initial values come from our DISTRO variables.
>=20
> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> ---
>  meta/recipes-core/os-release/os-release.bb | 42 ++++++++++++++++++++++++=
++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 meta/recipes-core/os-release/os-release.bb
>=20
> diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-co=
re/os-release/os-release.bb
> new file mode 100644
> index 0000000..0f67597
> --- /dev/null
> +++ b/meta/recipes-core/os-release/os-release.bb
> @@ -0,0 +1,42 @@
> +inherit allarch
> +
> +SUMMARY =3D "Operating system identification"
> +DESCRIPTION =3D "The /etc/os-release file contains operating system iden=
tification data."
> +LICENSE =3D "MIT"
> +INHIBIT_DEFAULT_DEPS =3D "1"
> +
> +do_fetch[noexec] =3D "1"
> +do_unpack[noexec] =3D "1"
> +do_patch[noexec] =3D "1"
> +do_configure[noexec] =3D "1"
> +
> +# Other valid fields: BUILD_ID ANSI_COLOR CPE_NAME HOME_URL SUPPORT_URL =
BUG_REPORT_URL
> +OS_RELEASE_FIELDS =3D "ID ID_LIKE NAME VERSION VERSION_ID PRETTY_NAME"
> +
> +export ID =3D "${DISTRO}"
> +export NAME =3D "${DISTRO_NAME}"
> +export VERSION =3D "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODENAME if 'DI=
STRO_CODENAME' in d else ''}"
> +export VERSION_ID =3D "${DISTRO_VERSION}"
> +export PRETTY_NAME =3D "${DISTRO_NAME} ${VERSION}"
> +
> +export BUILD_ID ?=3D "${DATETIME}"
> +export ID_LIKE
> +export ANSI_COLOR
> +export CPE_NAME
> +export HOME_URL
> +export SUPPORT_URL
> +export BUG_REPORT_URL
> +
> +do_compile () {
> +    for field in ${OS_RELEASE_FIELDS}; do
> +        if eval "test -n \"\$$field\""; then
> +            eval "printf \"%s=3D%s\n\" \"\$field\" \"\$$field\""
> +        fi
> +    done >os-release
> +}
> +do_compile[vardeps] +=3D "${OS_RELEASE_FIELDS}"

Isn't this dependency picked automatically?

> +do_install () {
> +    install -d ${D}${sysconfdir}
> +    install -m 0644 os-release ${D}${sysconfdir}/
> +}
> --=20
> 1.8.3.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WplhKdTI2c8ulnbP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKrIuoACgkQN1Ujt2V2gBwhHgCeNzEGca4b9kcHQy+fludbRCcT
F+0AoIIePDHxJbHMkNogvRJjQnaAM1cL
=MNIr
-----END PGP SIGNATURE-----

--WplhKdTI2c8ulnbP--
