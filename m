Received: from mail-pd0-f175.google.com ([209.85.192.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UZkFP-0001M0-Vu
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 17:56:16 +0200
Received: by mail-pd0-f175.google.com with SMTP id y14so493259pdi.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2013 08:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=6Z3Zu8BDYSDymdRUCXLVtJENwZU3zsNzHg7VwSwWTE0=;
	b=uZ85xzSmyUW0nV+Cr0uDvWSjdn+xVoOS9rk6aLG2o/PG1hXLn/YCR9jPXZnior5S5N
	mQD0Yvb6FuxHgN8skkIu8hhtOj0FS5F4p0a74nHJNBPK4mWjGUAOya/0CguYW29Y6Wjb
	8AQrf4EwfXeJf6seliMznJmH9i2b16KAuhFDi1fBkIoWqleeukN2kSv6EDcH4fXYN0ht
	0RVH5oC+hf0PDoLFyPUIF7iBKVgQN+WTPjuFobg2IgvPTZQUb+SwS/fQ4v17PAKQ+ntD
	lnCZFw7j1T4FV6c4O52Kf2+B4x8Y1FBLRiMdTAX6vhTZMHn+iJK8s63L88Os3T/AK8Fy
	uDiA==
X-Received: by 10.66.26.71 with SMTP id j7mr3393984pag.209.1367941090388;
	Tue, 07 May 2013 08:38:10 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	vv6sm30825668pab.6.2013.05.07.08.38.07 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 07 May 2013 08:38:09 -0700 (PDT)
Date: Tue, 7 May 2013 17:38:01 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130507153801.GF3187@jama>
References: <1367931368-21504-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1367931368-21504-2-git-send-email-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1367931368-21504-2-git-send-email-richard.purdie@linuxfoundation.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/15] core-image-minimal-initramfs: Remove odd quote characters
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
X-List-Received-Date: Tue, 07 May 2013 15:56:27 -0000
X-Groupsio-MsgNum: 38804
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aZoGpuMECXJckB41"
Content-Disposition: inline

--aZoGpuMECXJckB41
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2013 at 01:55:54PM +0100, Richard Purdie wrote:
> The quote characters present trigger pyhton 3 characters type warnings,

                                      ^python^

> we don't need them so replace them with normal quote characters.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-core/images/core-image-minimal-initramfs.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/m=
eta/recipes-core/images/core-image-minimal-initramfs.bb
> index 6de24b3..46a9dc4 100644
> --- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
> +++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
> @@ -1,7 +1,7 @@
>  # Simple initramfs image. Mostly used for live images.
>  DESCRIPTION =3D "Small image capable of booting a device. The kernel inc=
ludes \
>  the Minimal RAM-based Initial Root Filesystem (initramfs), which finds t=
he \
> -first =E2=80=9Cinit=E2=80=9D program more efficiently."
> +first 'init' program more efficiently."
> =20
>  IMAGE_INSTALL =3D "initramfs-live-boot initramfs-live-install initramfs-=
live-install-efi busybox udev base-passwd"
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

--aZoGpuMECXJckB41
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGJH9kACgkQN1Ujt2V2gByCSACguIXpYxHEUUrL/DFfhWaXR2lX
za4AniVIqa0IOEcX8Qvy/uYiLPrkdeIv
=zeja
-----END PGP SIGNATURE-----

--aZoGpuMECXJckB41--
