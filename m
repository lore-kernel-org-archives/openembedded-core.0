Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tw7Uw-0004uF-Ck
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 09:40:33 +0100
Received: by mail-pb0-f41.google.com with SMTP id xa7so1931219pbc.28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2013 00:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=aZWlu4v8FVD5deTQ7DMssI3KkQmYIFKVWLVqns12aKs=;
	b=0jFnt2zfn4M98lfHR+WdnJc+mTRhwfvVahuB/MVEBmwU6bUZzPPFVW3o1fOvVCmRRw
	u2Y5a7zf1RtbXKT+qUAB489gqRJXqQJjygKyzTnW5tK0KceaF863xp3vx1PM0gTChIGR
	Mk8G1ZHDAxJvw2oOXe6mg+djd19vFElOc1b/kWnN2aOI4ABK3kpAnoMzm1tjFSUaZDGq
	tIuG9E7V3m+tvveor2wf6aF5RW35bkQ9/qX6Z2QYCCswYA1+SR0jcM0qOENaecV5XKZ9
	rkM5ZRJHaJYl3ZG+W+tv45po2RWgMCuIx+CfaoITZUPSRqVJdTZNNKDxo97KARTTDnMg
	GQcw==
X-Received: by 10.66.76.198 with SMTP id m6mr21637651paw.32.1358497501532;
	Fri, 18 Jan 2013 00:25:01 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id rv8sm2682791pbc.27.2013.01.18.00.24.58
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 18 Jan 2013 00:25:00 -0800 (PST)
Date: Fri, 18 Jan 2013 09:24:54 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: rongqing.li@windriver.com
Message-ID: <20130118082454.GB3091@jama>
References: <cover.1358477598.git.rongqing.li@windriver.com>
	<f55fd0b28b693f4a7c0a761c4630e0375b4a526b.1358477598.git.rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <f55fd0b28b693f4a7c0a761c4630e0375b4a526b.1358477598.git.rongqing.li@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org, joe.macdonald@windriver.com
Subject: Re: [PATCH 2/2] default-distrovars: add tcp-wrappers to default DISTRO_FEATURES
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
X-List-Received-Date: Fri, 18 Jan 2013 08:40:35 -0000
X-List-Received-Date: Fri, 18 Jan 2013 08:40:35 -0000
X-Groupsio-MsgNum: 34004
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gj572EiMnwbLXET9"
Content-Disposition: inline

--gj572EiMnwbLXET9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 18, 2013 at 10:56:23AM +0800, rongqing.li@windriver.com wrote:
> From: "Roy.Li" <rongqing.li@windriver.com>
>=20
> tcp-wrappers DISTRO_FEATURES only is used in xinetd currently, but other
> packages maybe need it to enable tcp-wrapper support, like vsftpd.
>=20
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>  meta/conf/distro/include/default-distrovars.inc |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/=
distro/include/default-distrovars.inc
> index 9002fd6..9126825 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -19,7 +19,8 @@ DISTRO_FEATURES_LIBC_DEFAULT ?=3D "ipv4 ipv6 libc-backt=
race libc-big-macros libc-b
>  					libc-posix-wchar-io"
>  DISTRO_FEATURES_LIBC ?=3D "${DISTRO_FEATURES_LIBC_DEFAULT}"
>  DISTRO_FEATURES_LIBC_class-nativesdk =3D "${DISTRO_FEATURES_LIBC_DEFAULT=
}"
> -DISTRO_FEATURES ?=3D "alsa argp bluetooth ext2 irda largefile pcmcia usb=
gadget usbhost wifi xattr nfs zeroconf pci 3g x11 ${DISTRO_FEATURES_LIBC}"
> +DISTRO_FEATURES ?=3D "alsa argp bluetooth ext2 irda largefile pcmcia usb=
gadget usbhost wifi xattr nfs zeroconf pci 3g x11 tcp-wrappers \
> +			${DISTRO_FEATURES_LIBC}"

DISTRO_FEATURES_BACKFILL maybe?

> =20
>  IMAGE_FEATURES ?=3D ""
> =20
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gj572EiMnwbLXET9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD5BtYACgkQN1Ujt2V2gByDAACgjKWXLbcHzhAUuisa/D/zyhih
1jgAoLu/OdB8G4qFjOPV+3RUIzFPonIc
=aO7c
-----END PGP SIGNATURE-----

--gj572EiMnwbLXET9--
