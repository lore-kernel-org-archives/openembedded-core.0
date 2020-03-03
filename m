Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id EBC79618A5
	for <openembedded-core@openembedded.org>;
	Tue,  3 Mar 2020 21:22:44 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id e26so4404265wme.5
	for <openembedded-core@openembedded.org>;
	Tue, 03 Mar 2020 13:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=EZKVe0nYHa/j7soy9bDd0U+Ri2UyRvM8VQaM6h0kpPQ=;
	b=pe+0NtDFHF4WQRRW5VV34NA4RhUNduV8rUsUScWaIxzmwgL8CUhlu7dh7rfA5bH/pF
	7OaZ1EJAm8AH9RMKv7749TahCINg9JT19VJV7gPhqX8KEVVNPNgi4GQtlpnsqcDJAvy0
	TBxWNnguZwPT4auHVdbomcduiElvJkJacjMF2Ja93k//KxqhqPcNqNm/SyIZeqPGhG4P
	Jq3WzWUvG0dZtfNU/tHhxNB11HD0XpQtUfEQx5X/U4xQmjPmoq/ZcY7HpyBP7NEbAuE1
	V2XJg+AuYTMBvSwYxrYqzDrMSK0GvgLFGXFCN/D/yXVzTwcUHiHtu3IKL6oMAg5BaDpU
	zBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=EZKVe0nYHa/j7soy9bDd0U+Ri2UyRvM8VQaM6h0kpPQ=;
	b=qDVQVQ+JaV/GSEQ8GB6Ql48J27VU/UjhndUihGn2fw+7fYi/wHq/D/M+oSwhzthPQN
	J/QvGluaHIDwIXYYK5K4l9kNTwxuHLGdq8FC0kzOvlZRRwsacntVOw2OGy420fyajmTh
	g1cze+EMUY3LUxKAUwRukJ/d4COjqIdsAyc66cMaTNRoxWREPuViYTIj5PcvdLOdNM9i
	ielvbdpDMUe54tqksTIcFcvKGRtZCl7qo9NVMYUTLxn+K778NkSJzbpNRikTvzaYBhc4
	4O8r6Wi8trAtX8zlhhsgndOQe1c5rZv0PAgLM5C5hNKKRBGOnZnMUWyzU0GKorqMrrLQ
	44fQ==
X-Gm-Message-State: ANhLgQ3C/AePBd94whEJ9m+eHNN109/Ny/lfX5DFDuBE2kZh6E+IXZOR
	r9IMocFKGVuJbOmISxfXx3Y=
X-Google-Smtp-Source: ADFU+vskrXbAZI2rxtxQBTx33GP1SC3jy/Cal6xVcVxasgSoboi6bqz9GnGXvI81Qv+/X7ksQIAHhw==
X-Received: by 2002:a1c:49d5:: with SMTP id w204mr468511wma.55.1583270565435; 
	Tue, 03 Mar 2020 13:22:45 -0800 (PST)
Received: from localhost ([109.238.218.228])
	by smtp.gmail.com with ESMTPSA id w8sm653844wmm.0.2020.03.03.13.22.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Mar 2020 13:22:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 3 Mar 2020 22:22:43 +0100
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20200303212243.vm7nwzuf4viwwaat@jama>
References: <20200303210903.29570-1-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200303210903.29570-1-akuster808@gmail.com>
User-Agent: NeoMutt/20180716
Cc: openembedded-core@openembedded.org, Armin Kuster <akuster@mvista.com>
Subject: Re: [v2][PATCH] libuv: move from meta-oe to core for bind update
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
X-List-Received-Date: Tue, 03 Mar 2020 21:22:45 -0000
X-Groupsio-MsgNum: 135971
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rb43rjc7qkcecck3"
Content-Disposition: inline

--rb43rjc7qkcecck3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2020 at 01:09:03PM -0800, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
>=20
> Signed-off-by: Armin Kuster <akuster@mvista.com>
>=20
> [v2]
> Add maintainer
> Update to newer version in meta-oe

This belongs either under --- or in this case normal commit message before
Signed-off-by (without '[v2]').

> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  .../libuv/libuv_1.34.2.bb                     | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 meta/recipes-connectivity/libuv/libuv_1.34.2.bb
>=20
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 10095ffe76..d724148014 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -392,6 +392,7 @@ RECIPE_MAINTAINER_pn-liburcu =3D "Alexander Kanavin <=
alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-liburi-perl =3D "Tim Orling <timothy.t.orling@linux=
=2Eintel.com>"
>  RECIPE_MAINTAINER_pn-libusb1 =3D "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-libubootenv =3D "Stefano Babic <sbabic@denx.de>"
> +RECIPE_MAINTAINER_pn-libuv =3D "Armin Kuster <akuster@mvista.com>"
>  RECIPE_MAINTAINER_pn-libva =3D "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-libva-utils =3D "Anuj Mittal <anuj.mittal@intel.com=
>"
>  RECIPE_MAINTAINER_pn-libvorbis =3D "Tanu Kaskinen <tanuk@iki.fi>"
> diff --git a/meta/recipes-connectivity/libuv/libuv_1.34.2.bb b/meta/recip=
es-connectivity/libuv/libuv_1.34.2.bb
> new file mode 100644
> index 0000000000..234cec37bb
> --- /dev/null
> +++ b/meta/recipes-connectivity/libuv/libuv_1.34.2.bb
> @@ -0,0 +1,19 @@
> +SUMMARY =3D "A multi-platform support library with a focus on asynchrono=
us I/O"
> +HOMEPAGE =3D "https://github.com/libuv/libuv"
> +BUGTRACKER =3D "https://github.com/libuv/libuv/issues"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da68902a430e32200263d182d44924=
d47"
> +
> +SRCREV =3D "f868c9ab0c307525a16fff99fd21e32a6ebc3837"
> +SRC_URI =3D "git://github.com/libuv/libuv;branch=3Dv1.x"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools
> +
> +do_configure() {
> +    ${S}/autogen.sh || bbnote "${PN} failed to autogen.sh"
> +    oe_runconf
> +}
> +
> +BBCLASSEXTEND =3D "native"
> --=20
> 2.17.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--rb43rjc7qkcecck3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXl7KowAKCRA3VSO3ZXaA
HB20AJwLPYX3ukza9u79bscBoRh7ucx9PQCcC7UG4uMkoWcmZY7XMoDFpWbKhqQ=
=Ndil
-----END PGP SIGNATURE-----

--rb43rjc7qkcecck3--
