Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 67E446DEC8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2013 18:03:23 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c41so1782894eek.23
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2013 10:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=a8CPojcdzDITMgY8H8HDMqIq6Tjm9/ZAeIDQmeeARhk=;
	b=iVvT2b/qDdulP+lS8+wH++UBOz1lzqfHDMwjiclwc+0+XKlwItyKIbEs5hkXxhHtKV
	Qv6pDMUozz+hyAIpkyDpOC7c/cvDvMjfZcxtlfOs7O8jCdeuZkMwsZUXc/am1nY/wyCo
	rz0NZN64zmiF2+3l+Hna79OVX5W4CK8fs9pYX/AUYDFA/9+9A9eyHRx5KwVq9Q4fsObv
	WF+mWxi5Z7a6c8ilMP+pG5mpTfIgCdXjSzWaQQjV1F0tQV9/+Wq5IVCBK6XoUxBz1Ike
	NOhshQM8AkrrsXZW4PtFAUyVblD0q8tApdORBCpIFxmvNylQjN0mBFUS6e7pePklaudO
	1+oA==
X-Received: by 10.14.149.139 with SMTP id x11mr12642884eej.35.1387130602311;
	Sun, 15 Dec 2013 10:03:22 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id a51sm32635312eeh.8.2013.12.15.10.03.20
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Dec 2013 10:03:21 -0800 (PST)
Date: Sun, 15 Dec 2013 19:03:49 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Message-ID: <20131215180349.GA3706@jama>
References: <1386946031-6292-1-git-send-email-kergoth@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1386946031-6292-1-git-send-email-kergoth@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pulseaudio: only package consolekit module when x11 is enabled
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
X-List-Received-Date: Sun, 15 Dec 2013 18:03:24 -0000
X-Groupsio-MsgNum: 48226
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline

--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2013 at 07:47:11AM -0700, Christopher Larson wrote:
> As requested by Martin Jansa <martin.jansa@gmail.com>.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

>=20
> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> ---
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/rec=
ipes-multimedia/pulseaudio/pulseaudio.inc
> index 2bee9eb..dce8555 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -74,7 +74,7 @@ USERADD_PARAM_pulseaudio-server =3D "--system --home /v=
ar/run/pulse \
>  # adding the console-kit module to an image, we also get the necessary
>  # consolekit package produced.
>  PACKAGES =3D+ "libpulsecore libpulsecommon libpulse libpulse-simple libp=
ulse-mainloop-glib \
> -             pulseaudio-server pulseaudio-misc pulseaudio-module-console=
-kit"
> +             pulseaudio-server pulseaudio-misc ${@base_contains('PACKAGE=
CONFIG', 'x11', 'pulseaudio-module-console-kit', '', d)}"
> =20
>  #upgrade path:
>  RREPLACES_pulseaudio-server =3D "libpulse-bin libpulse-conf"
> --=20
> 1.8.3.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKt7wUACgkQN1Ujt2V2gBx4awCgtnXD1AFWsekvXRtfVg1gdPtH
cC4AoLi3Uu54WS+f66SKfnQ6Tuu0WziQ
=JPLj
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
