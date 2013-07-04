Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 347F96AA07
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 11:46:39 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id l15so717235eak.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 04:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pijPQnonNbiCPgYC1Rq34cIdMUJN5+akIXQhGiGqoTA=;
	b=NyLMuMGNnIfSM7NKthEUhHame0k0vzWWFkKRvorQ5J9BxHEJ5GgkTIopCQNMBQUu5j
	DmcIpB/NTyMxF0OdPB8GDGMEr4V4UpyV5XaL5WRdN0kj0S6/VGmBURyJKKD/uk1/u7Fc
	dXNor+5ok28MEG2MXXLybB7emqDVZ5EPhQwXVns7vjXyDBQJwQoZr7LC4q5hoXqREPvD
	WmE68QMAFR/oplW2C1i4S6Bu9wpD8xCbI3V0Vnz7GROm5WghtOV2QSDUWneSmiNcI33l
	oa9liS0DH81/uhqC5kJldrVj4xVXC+UqrPTpCx+ogTKPUt0sRJFooZfnRyY7dsowN9Zq
	TWNw==
X-Received: by 10.14.204.137 with SMTP id h9mr6465326eeo.13.1372938399664;
	Thu, 04 Jul 2013 04:46:39 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b7sm4356072eef.16.2013.07.04.04.46.38 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 04:46:39 -0700 (PDT)
Date: Thu, 4 Jul 2013 13:46:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Message-ID: <20130704114642.GB3259@jama>
References: <cover.1372933905.git.laurentiu.palcu@intel.com>
	<4e815a29c0d069823211ba33645f3b08ae968bfd.1372933905.git.laurentiu.palcu@intel.com>
MIME-Version: 1.0
In-Reply-To: <4e815a29c0d069823211ba33645f3b08ae968bfd.1372933905.git.laurentiu.palcu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/5] xuser-account: create separate recipe for xuser creation
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
X-List-Received-Date: Thu, 04 Jul 2013 11:46:39 -0000
X-Groupsio-MsgNum: 41418
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O5XBE6gyVG5Rl6Rj"
Content-Disposition: inline

--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 04, 2013 at 01:58:01PM +0300, Laurentiu Palcu wrote:
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  .../user-creation/xuser-account_0.1.bb             |   27 ++++++++++++++=
++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 meta/recipes-support/user-creation/xuser-account_0.1.=
bb
>=20
> diff --git a/meta/recipes-support/user-creation/xuser-account_0.1.bb b/me=
ta/recipes-support/user-creation/xuser-account_0.1.bb
> new file mode 100644
> index 0000000..7430d2a
> --- /dev/null
> +++ b/meta/recipes-support/user-creation/xuser-account_0.1.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION =3D "Creates an 'xuser' account"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
> +

can we inherit allarch in it?

> +SRC_URI =3D ""
> +
> +inherit useradd
> +
> +do_configure() {
> +    :
> +}
> +
> +do_compile() {
> +    :
> +}
> +
> +do_install() {
> +    :
> +}
> +
> +USERADD_PACKAGES =3D "${PN}"
> +GROUPADD_PARAM_${PN} =3D "--system shutdown"
> +USERADD_PARAM_${PN} =3D "--create-home \
> +                       --groups video,tty,audio,input,shutdown \
> +                       --user-group xuser"
> +
> +ALLOW_EMPTY_${PN} =3D "1"
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--O5XBE6gyVG5Rl6Rj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHVYKIACgkQN1Ujt2V2gBy3RgCeMMfkdhVIFHzN2DYuIW5orBRO
efgAn3vOkze8C0SmOtXy8JhFzFMVfsoQ
=klet
-----END PGP SIGNATURE-----

--O5XBE6gyVG5Rl6Rj--
