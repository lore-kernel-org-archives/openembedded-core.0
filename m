Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7013B72730
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jan 2015 11:31:28 +0000 (UTC)
Received: by mail-wg0-f54.google.com with SMTP id z12so7589525wgg.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jan 2015 03:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HJpeNsPx8o56mqkiLLluPJm6wRX258Fc4gyYN/jy5HE=;
	b=oWjKYw+fpd/uiq3dLV42IyJDlQqu8RjJ6AlGd9BNTII3otLuJpEzJLxO1dhlqA9YJI
	keAya+uGqu3N20+gDZB+BEL5LakIAyMAIVzd5PP74Q3Sa97lPok8D1DrZAEyMsoGAFps
	MgS0QLZfvTNHiTNxBitlXwCZDIwchjo/Un1aDeilqKRCzXOqga+9zBsGDDAAQQTkjvgR
	+le+m8B7LoYaBHaG7/xvO7k8vNjGBFBqWTXdwCsNz1BIscQEfTMTuX/iZoNAKRNPT/eB
	W7Z2vCFceuvh0dfFe7YcXwb4oo5T+0WrTWDbdeN8xGmYVGoh6+fv04YOOSG+ZxtPrXLI
	MdEg==
X-Received: by 10.194.175.69 with SMTP id by5mr30621611wjc.32.1420803089122;
	Fri, 09 Jan 2015 03:31:29 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x6sm9665866wjf.24.2015.01.09.03.31.27
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Jan 2015 03:31:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 9 Jan 2015 12:31:33 +0100
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20150109113133.GC3137@jama>
References: <cover.1420558836.git.sgw@linux.intel.com>
	<b1d8e4726ccb1a825d9338a718edb5a4d854a33c.1420558836.git.sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <b1d8e4726ccb1a825d9338a718edb5a4d854a33c.1420558836.git.sgw@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 06/12] json-c: Upgrade to 0.12
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
X-List-Received-Date: Fri, 09 Jan 2015 11:31:33 -0000
X-Groupsio-MsgNum: 61210
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vOmOzSkFvhd7u8Ms"
Content-Disposition: inline

--vOmOzSkFvhd7u8Ms
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2015 at 07:42:16AM -0800, Saul Wold wrote:
> Added CFLAGS to prevent compiler error of unused size variable
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-devtools/json-c/{json-c_0.11.bb =3D> json-c_0.12.bb} | 6 ++=
++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/json-c/{json-c_0.11.bb =3D> json-c_0.12.bb}=
 (75%)
>=20
> diff --git a/meta/recipes-devtools/json-c/json-c_0.11.bb b/meta/recipes-d=
evtools/json-c/json-c_0.12.bb
> similarity index 75%
> rename from meta/recipes-devtools/json-c/json-c_0.11.bb
> rename to meta/recipes-devtools/json-c/json-c_0.12.bb
> index 389e0f9..79cf6dc 100644
> --- a/meta/recipes-devtools/json-c/json-c_0.11.bb
> +++ b/meta/recipes-devtools/json-c/json-c_0.12.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dde54b60fbbc351=
23ba193fea8ee216f2"
> =20
>  SRC_URI =3D "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar=
=2Egz"
> =20
> -SRC_URI[md5sum] =3D "aa02367d2f7a830bf1e3376f77881e98"
> -SRC_URI[sha256sum] =3D "28dfc65145dc0d4df1dfe7701ac173c4e5f9347176c8983e=
dbfac9149494448c"
> +SRC_URI[md5sum] =3D "3ca4bbb881dfc4017e8021b5e0a8c491"
> +SRC_URI[sha256sum] =3D "000c01b2b3f82dcb4261751eb71f1b084404fb7d6a282f06=
074d3c17078b9f3f"
> =20
>  RPROVIDES_${PN} =3D "libjson"

^ This isn't correct anymore (isn't compatible with libjson).

0.12 doesn't install libjson shim (json.pc) anymore and libjson libs are
gone as well:

See:
https://github.com/json-c/json-c/commit/c8ee9196420c4b7c295a38c397a4e315df1=
baa03

as results it breaks couple recipes in world builds:
  /home/jenkins/oe/world/shr-core/meta-webos-ports/meta-luneui/recipes-webo=
s/luna-sysmgr-common/luna-sysmgr-common.bb, do_compile
  /home/jenkins/oe/world/shr-core/meta-smartphone/meta-android/recipes-andr=
oid/suspend-blocker/suspend-blocker.bb, do_compile
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extende=
d/rsyslog/rsyslog_7.4.4.bb, do_compile
and a lot more which depend on luna-sysmgr-common so they aren't shown.

OE qemux86@luneos ~/webos/owpb/webos-ports/tmp-glibc/work/i586-webos-linux/=
json-c $ ls -lR 0.1*/image/usr/lib/
0.11-r0/image/usr/lib/:
total 240
-rw-r--r-- 2 bitbake bitbake 121584 Jan  9 10:48 libjson-c.a
-rwxr-xr-x 2 bitbake bitbake    925 Jan  9 10:48 libjson-c.la
lrwxrwxrwx 1 bitbake bitbake     18 Jan  9 10:48 libjson-c.so -> libjson-c.=
so.2.0.1
lrwxrwxrwx 1 bitbake bitbake     18 Jan  9 10:48 libjson-c.so.2 -> libjson-=
c.so.2.0.1
-rwxr-xr-x 2 bitbake bitbake  95836 Jan  9 10:48 libjson-c.so.2.0.1
-rw-r--r-- 2 bitbake bitbake   1780 Jan  9 10:48 libjson.a
-rwxr-xr-x 2 bitbake bitbake    934 Jan  9 10:48 libjson.la
lrwxrwxrwx 1 bitbake bitbake     16 Jan  9 10:48 libjson.so -> libjson.so.0=
=2E1.0
lrwxrwxrwx 1 bitbake bitbake     16 Jan  9 10:48 libjson.so.0 -> libjson.so=
=2E0.1.0
-rwxr-xr-x 2 bitbake bitbake   5752 Jan  9 10:48 libjson.so.0.1.0
drwxr-xr-x 2 bitbake bitbake   4096 Jan  9 10:48 pkgconfig

0.11-r0/image/usr/lib/pkgconfig:
total 8
-rw-r--r-- 2 bitbake bitbake 205 Jan  9 10:48 json-c.pc
-rw-r--r-- 2 bitbake bitbake 201 Jan  9 10:48 json.pc

0.12-r0/image/usr/lib/:
total 252
-rw-r--r-- 3 bitbake bitbake 138592 Jan  9 12:04 libjson-c.a
-rwxr-xr-x 3 bitbake bitbake    925 Jan  9 12:04 libjson-c.la
lrwxrwxrwx 1 bitbake bitbake     18 Jan  9 12:04 libjson-c.so -> libjson-c.=
so.2.0.1
lrwxrwxrwx 1 bitbake bitbake     18 Jan  9 12:04 libjson-c.so.2 -> libjson-=
c.so.2.0.1
-rwxr-xr-x 3 bitbake bitbake 108728 Jan  9 12:04 libjson-c.so.2.0.1
drwxr-xr-x 2 bitbake bitbake   4096 Jan  9 12:04 pkgconfig

0.12-r0/image/usr/lib/pkgconfig:
total 4
-rw-r--r-- 3 bitbake bitbake 205 Jan  9 12:04 json-c.pc

> @@ -19,3 +19,5 @@ do_configure_prepend() {
>      # Clean up autoconf cruft that should not be in the tarball
>      rm -f ${S}/config.status
>  }
> +
> +CFLAGS +=3D "-Wno-error=3Dunused-but-set-variable"
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vOmOzSkFvhd7u8Ms
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSvvBUACgkQN1Ujt2V2gBylVwCfZSBCf346OlmRWpcdPFVKXO0k
O4QAn0xo38v3kfexHXm+gaMBisOT3kf7
=DkpH
-----END PGP SIGNATURE-----

--vOmOzSkFvhd7u8Ms--
