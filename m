Received: from mail-pa0-f53.google.com ([209.85.220.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TyM7j-0001nL-Nh
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 13:42:03 +0100
Received: by mail-pa0-f53.google.com with SMTP id hz1so5463095pad.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 04:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=9oHNKzp2l2u0uGL17jsfTGbOjG/HTEezANTXt8LZiO0=;
	b=HnbW5swmw9vnC8MJY8MnQDmSTzrWsJE6hvUyqtKamr2/zomWMRC+4JU8xMNav8+0HA
	8MYFmb/C8CoUFzLJPdGBEFSchIWj1r8zeXAirk2p0eAbo6v2dk699zTByzM4iyw7Wdpc
	mbvRmSjrEtc5aXNYmBWLPK97/9HXihcRMjVNiTbaX2yya4CV+wnIN1AdYquIdZ9tzl/4
	rGzfrMo5XoCwe8KmDB7/fZTVyKHlyPnVIHHC5hX/yfGTqaHYsoi6cWzUW3XqJf3Ja5qk
	vZveI87BYfSmrZJNz1R2RQkg+i37ihZPZp8nyeLx3znD6n33WKnlL4RhwAXu+/pQQBur
	qP2Q==
X-Received: by 10.69.0.4 with SMTP id au4mr4051691pbd.152.1359030370261;
	Thu, 24 Jan 2013 04:26:10 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id q4sm15625047paz.20.2013.01.24.04.26.06
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 04:26:08 -0800 (PST)
Date: Thu, 24 Jan 2013 13:26:04 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: ml@communistcode.co.uk
Message-ID: <20130124122604.GB3012@jama>
References: <1359024278-24627-1-git-send-email-ml@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <1359024278-24627-1-git-send-email-ml@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: remove usbutils dependancy
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
X-List-Received-Date: Thu, 24 Jan 2013 12:42:06 -0000
X-Groupsio-MsgNum: 34352
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9zSXsLTf0vkW971A"
Content-Disposition: inline

--9zSXsLTf0vkW971A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 24, 2013 at 10:44:38AM +0000, ml@communistcode.co.uk wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>=20
> No where in the systemd readme does it specify that usbutils
> is a dependancy of systemd. I can only guess that it was added
> due to an issue elsewhere in the chain or it was brought in
> when udev was merged and the dependancies never checked.

It was needed for older systemd revisions:
http://git.openembedded.org/meta-openembedded/commit/?id=3Dec2459251c68bb09=
0c8b6f0d6cbf5ea0c2486337

http://cgit.freedesktop.org/systemd/systemd/tree/configure.ac?id=3Dcd96b3b8=
6abb4a88cac2722bdfb6e5d4413f6831

And removed between 195 and 196:
http://cgit.freedesktop.org/systemd/systemd/commit/configure.ac?id=3D796b06=
c21b62d13c9021e2fbd9c58a5c6edb2764

Please update commit message.
=20
> I have build tested this with no issues.
>=20
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>  meta/recipes-core/systemd/systemd_196.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_196.bb b/meta/recipes-core=
/systemd/systemd_196.bb
> index a78a8a6..9eca25b 100644
> --- a/meta/recipes-core/systemd/systemd_196.bb
> +++ b/meta/recipes-core/systemd/systemd_196.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260=
aa954499f7abaabaa882bbe \
> =20
>  PROVIDES =3D "udev"
> =20
> -DEPENDS =3D "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-n=
ative acl readline dbus libcap libcgroup tcp-wrappers usbutils glib-2.0 lib=
gcrypt"
> +DEPENDS =3D "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-n=
ative acl readline dbus libcap libcgroup tcp-wrappers glib-2.0 libgcrypt"
>  DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d=
)}"
> =20
>  SECTION =3D "base/shell"
> --=20
> 1.8.1.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9zSXsLTf0vkW971A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEBKFwACgkQN1Ujt2V2gByNLQCgtL2larJPY/FU/wvqyqpUmMYD
dgoAn3S1rAWFKpw87exiI9hRZRWGTUxr
=3a+V
-----END PGP SIGNATURE-----

--9zSXsLTf0vkW971A--
