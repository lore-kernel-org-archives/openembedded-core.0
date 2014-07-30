Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7845065CC9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 10:48:36 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id ho1so7277903wib.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 03:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nXbGe1iSYneFeXOKiAZ+UnMBJMQ44ltLWag5E71OABs=;
	b=N/zgD0AeZoolX01rfcKQpU6n7ULgXZtxJJvo3YQuZTqTsDn/FxqZf+ylNpwGkcpFeI
	nLNokuoH78wNQiLlhKF1qOkM8I+JsCaMNkT9T4P3Bvhwwz5G0JtTWJaGM69YsRqR9Ym5
	8SzCQQK94cNogetMeP6Mc1tFOK+sljWOi44OzJhyZcNoMunta7vn+Y5rClNCYB7LH7HB
	HpT9ujbL964riu+pgvzLMQ69ZLPfqUEQcLM7lqUNyxuTBUFWqbgQo6aLFR2P6m0qBAC4
	aZgxJPgPb4ePes//f+KhQEhOGX1AKdXp94yaZEInNz2K3El8RKRI5MshkEgAl6riTmfF
	jYXg==
X-Received: by 10.194.58.199 with SMTP id t7mr5220155wjq.14.1406717316860;
	Wed, 30 Jul 2014 03:48:36 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n2sm4606225wjf.40.2014.07.30.03.48.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jul 2014 03:48:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Jul 2014 12:48:59 +0200
To: ting.liu@freescale.com
Message-ID: <20140730104859.GL16445@jama>
References: <1406715821-2892-1-git-send-email-ting.liu@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1406715821-2892-1-git-send-email-ting.liu@freescale.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] base-files: set dynamic COLUMNS via resize command
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
X-List-Received-Date: Wed, 30 Jul 2014 10:48:38 -0000
X-Groupsio-MsgNum: 55757
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="citGix+cyBYE+lqp"
Content-Disposition: inline

--citGix+cyBYE+lqp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2014 at 06:23:41PM +0800, ting.liu@freescale.com wrote:
> From: Ting Liu <ting.liu@freescale.com>
>=20
> By default, COLUMNS is set to 80. If possible, run 'resize' to
> determine what the current dimensions are. This avoids the final
> part of long lines overlap the start of the same line.
>=20
> Signed-off-by: Ting Liu <ting.liu@freescale.com>
> ---
> changes in v2:
> * dynamically check for ${bindir} instead of hard code /usr/bin
>=20
>  meta/recipes-core/base-files/base-files/profile   |    4 ++++
>  meta/recipes-core/base-files/base-files_3.0.14.bb |    4 ++++
>  2 files changed, 8 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recip=
es-core/base-files/base-files/profile
> index 0b2d9d7..88ab8d8 100644
> --- a/meta/recipes-core/base-files/base-files/profile
> +++ b/meta/recipes-core/base-files/base-files/profile
> @@ -26,6 +26,10 @@ if [ -d /etc/profile.d ]; then
>    unset i
>  fi
> =20
> +if [ -x /usr/bin/resize ];then
> +  /usr/bin/resize >/dev/null
> +fi
> +
>  export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
> =20
>  umask 022
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/rec=
ipes-core/base-files/base-files_3.0.14.bb
> index 30b1bf4..e6109dd 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -102,6 +102,10 @@ do_install () {
>  	install -m 0644 ${WORKDIR}/host.conf ${D}${sysconfdir}/host.conf
>  	install -m 0644 ${WORKDIR}/motd ${D}${sysconfdir}/motd
> =20
> +    if [ "/usr/bin" !=3D "${bindir}" ]; then
> +        sed -i "s,/usr/bin/resize,${bindir}/resize," ${D}${sysconfdir}/p=
rofile
> +    fi
> +

Please use consistent whitespace for indentation (I know it's hard with
inconsistent styleguide, but please don't mix tabs and spaces for
indentation).

>  	ln -sf /proc/mounts ${D}${sysconfdir}/mtab
>  }
> =20
> --=20
> 1.7.3.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--citGix+cyBYE+lqp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPYzZsACgkQN1Ujt2V2gBwr5gCfakh9sNM1t7855NUslse+DTEs
oOoAniuZQJMb4IcsEc11ikzUAzIBJZXV
=dN+D
-----END PGP SIGNATURE-----

--citGix+cyBYE+lqp--
