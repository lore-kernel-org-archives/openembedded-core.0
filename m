Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SRoHn-0001YZ-1P
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 19:33:19 +0200
Received: by werb13 with SMTP id b13so1833328wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2012 10:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UGgM8sZjsK7OIV+NhCR3r03UjuDPUO5UxvbLOAq2qtI=;
	b=QOO/SWfIloSozzeMzdaJKqzKwFTuelkUNReFlLh+uIxo30YIpfbZtQGSSTzGTZ1BuT
	RD9PfZBVo2cUF9eKFucxUU3RfoVaQiCGlywL48luB9E6GFzowCMtK8SW8vGvpGexiNXu
	LIjYl1ZzB9UqXovABF/qN49LxEXXiZEt/dW/f37qRD/uXD1JVsdesvW0pRpOxlYU/+t6
	G2SEZctx3KD3Is3167AL1118UO02sNe3Xk6+6kH8dkgeK05+xfJw2zKqw7Dw/1tbHT+O
	eBCn2phj0tDZuu5BgWR1ZXUoFHfJx5kGBEJMTep2FwEukBNzSH2P8/B6sjuyCx1eb/tc
	6Z4A==
Received: by 10.216.134.145 with SMTP id s17mr4548938wei.22.1336497807102;
	Tue, 08 May 2012 10:23:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h8sm47703398wix.4.2012.05.08.10.23.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 May 2012 10:23:25 -0700 (PDT)
Date: Tue, 8 May 2012 19:23:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120508172326.GA3138@jama.jama.net>
References: <1336497594-19016-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1336497594-19016-1-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] zlib: upgrade to 1.2.7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 May 2012 17:33:19 -0000
X-Groupsio-MsgNum: 21836
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline

--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 08, 2012 at 07:19:54PM +0200, Eric B=E9nard wrote:
> 1.2.6 is no morre fetchable and 1.2.7 fix some bugs, full changelog is
              ^^^^^
typo and can you resend with -M used for smaller diff?

Thanks

Cheers,

> available here : http://zlib.net/ChangeLog.txt
>=20
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  .../zlib/zlib-1.2.6/remove.ldconfig.call.patch     |   20 -------------
>  .../zlib/zlib-1.2.7/remove.ldconfig.call.patch     |   20 +++++++++++++
>  meta/recipes-core/zlib/zlib_1.2.6.bb               |   29 --------------=
------
>  meta/recipes-core/zlib/zlib_1.2.7.bb               |   29 ++++++++++++++=
++++++
>  4 files changed, 49 insertions(+), 49 deletions(-)
>  delete mode 100644 meta/recipes-core/zlib/zlib-1.2.6/remove.ldconfig.cal=
l.patch
>  create mode 100644 meta/recipes-core/zlib/zlib-1.2.7/remove.ldconfig.cal=
l.patch
>  delete mode 100644 meta/recipes-core/zlib/zlib_1.2.6.bb
>  create mode 100644 meta/recipes-core/zlib/zlib_1.2.7.bb
>=20
> diff --git a/meta/recipes-core/zlib/zlib-1.2.6/remove.ldconfig.call.patch=
 b/meta/recipes-core/zlib/zlib-1.2.6/remove.ldconfig.call.patch
> deleted file mode 100644
> index 403b482..0000000
> --- a/meta/recipes-core/zlib/zlib-1.2.6/remove.ldconfig.call.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -
> -When /etc/ld.so.cache is writeable by user running bitbake then it creat=
es invalid cache=20
> -(in my case libstdc++.so cannot be found after building zlib(-native) an=
d I have to call=20
> -touch */libstdc++.so && /sbin/ldconfig to fix it.
> -
> -So remove ldconfig call from make install-libs
> -
> -Upstream-Status: Inappropriate [disable feature]
> -
> -diff -uNr zlib-1.2.6.orig/Makefile.in zlib-1.2.6/Makefile.in
> ---- zlib-1.2.6.orig/Makefile.in	2012-01-28 23:48:50.000000000 +0100
> -+++ zlib-1.2.6/Makefile.in	2012-02-13 15:38:20.577700723 +0100
> -@@ -199,7 +199,6 @@
> - 	  rm -f $(DESTDIR)$(sharedlibdir)/$(SHAREDLIB) $(DESTDIR)$(sharedlibdi=
r)/$(SHAREDLIBM); \
> - 	  ln -s $(SHAREDLIBV) $(DESTDIR)$(sharedlibdir)/$(SHAREDLIB); \
> - 	  ln -s $(SHAREDLIBV) $(DESTDIR)$(sharedlibdir)/$(SHAREDLIBM); \
> --	  ($(LDCONFIG) || true)  >/dev/null 2>&1; \
> - 	fi
> - 	cp zlib.3 $(DESTDIR)$(man3dir)
> - 	chmod 644 $(DESTDIR)$(man3dir)/zlib.3
> diff --git a/meta/recipes-core/zlib/zlib-1.2.7/remove.ldconfig.call.patch=
 b/meta/recipes-core/zlib/zlib-1.2.7/remove.ldconfig.call.patch
> new file mode 100644
> index 0000000..403b482
> --- /dev/null
> +++ b/meta/recipes-core/zlib/zlib-1.2.7/remove.ldconfig.call.patch
> @@ -0,0 +1,20 @@
> +
> +When /etc/ld.so.cache is writeable by user running bitbake then it creat=
es invalid cache=20
> +(in my case libstdc++.so cannot be found after building zlib(-native) an=
d I have to call=20
> +touch */libstdc++.so && /sbin/ldconfig to fix it.
> +
> +So remove ldconfig call from make install-libs
> +
> +Upstream-Status: Inappropriate [disable feature]
> +
> +diff -uNr zlib-1.2.6.orig/Makefile.in zlib-1.2.6/Makefile.in
> +--- zlib-1.2.6.orig/Makefile.in	2012-01-28 23:48:50.000000000 +0100
> ++++ zlib-1.2.6/Makefile.in	2012-02-13 15:38:20.577700723 +0100
> +@@ -199,7 +199,6 @@
> + 	  rm -f $(DESTDIR)$(sharedlibdir)/$(SHAREDLIB) $(DESTDIR)$(sharedlibdi=
r)/$(SHAREDLIBM); \
> + 	  ln -s $(SHAREDLIBV) $(DESTDIR)$(sharedlibdir)/$(SHAREDLIB); \
> + 	  ln -s $(SHAREDLIBV) $(DESTDIR)$(sharedlibdir)/$(SHAREDLIBM); \
> +-	  ($(LDCONFIG) || true)  >/dev/null 2>&1; \
> + 	fi
> + 	cp zlib.3 $(DESTDIR)$(man3dir)
> + 	chmod 644 $(DESTDIR)$(man3dir)/zlib.3
> diff --git a/meta/recipes-core/zlib/zlib_1.2.6.bb b/meta/recipes-core/zli=
b/zlib_1.2.6.bb
> deleted file mode 100644
> index 54f8abf..0000000
> --- a/meta/recipes-core/zlib/zlib_1.2.6.bb
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -SUMMARY =3D "Zlib Compression Library"
> -DESCRIPTION =3D "Zlib is a general-purpose, patent-free, lossless data c=
ompression \
> -library which is used by many different programs."
> -HOMEPAGE =3D "http://zlib.net/"
> -SECTION =3D "libs"
> -LICENSE =3D "Zlib"
> -LIC_FILES_CHKSUM =3D "file://zlib.h;beginline=3D4;endline=3D23;md5=3D94d=
1b5a40dadd127f3351471727e66a9"
> -
> -PR =3D "r1"
> -
> -SRC_URI =3D "http://www.zlib.net/${BPN}-${PV}.tar.bz2 \
> -           file://remove.ldconfig.call.patch \
> -           "
> -SRC_URI[md5sum] =3D "dc2cfa0d2313ca77224b4d932b2911e9"
> -SRC_URI[sha256sum] =3D "fa3e3e4881fa5810b8903f2c7e0dcd5a0a673535f0438021=
c4bbb5db1b918c8e"
> -
> -do_configure (){
> -	./configure --prefix=3D${prefix} --shared --libdir=3D${libdir}
> -}
> -
> -do_compile (){
> -	oe_runmake
> -}
> -
> -do_install() {
> -	oe_runmake DESTDIR=3D${D} install
> -}
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta/recipes-core/zlib/zlib_1.2.7.bb b/meta/recipes-core/zli=
b/zlib_1.2.7.bb
> new file mode 100644
> index 0000000..f37856e
> --- /dev/null
> +++ b/meta/recipes-core/zlib/zlib_1.2.7.bb
> @@ -0,0 +1,29 @@
> +SUMMARY =3D "Zlib Compression Library"
> +DESCRIPTION =3D "Zlib is a general-purpose, patent-free, lossless data c=
ompression \
> +library which is used by many different programs."
> +HOMEPAGE =3D "http://zlib.net/"
> +SECTION =3D "libs"
> +LICENSE =3D "Zlib"
> +LIC_FILES_CHKSUM =3D "file://zlib.h;beginline=3D4;endline=3D23;md5=3D94d=
1b5a40dadd127f3351471727e66a9"
> +
> +PR =3D "r1"
> +
> +SRC_URI =3D "http://www.zlib.net/${BPN}-${PV}.tar.bz2 \
> +           file://remove.ldconfig.call.patch \
> +           "
> +SRC_URI[md5sum] =3D "2ab442d169156f34c379c968f3f482dd"
> +SRC_URI[sha256sum] =3D "49e2e9658dfb036900da6ea0267a737fa3c4eee6666776d3=
78c79d52e9334934"
> +
> +do_configure (){
> +	./configure --prefix=3D${prefix} --shared --libdir=3D${libdir}
> +}
> +
> +do_compile (){
> +	oe_runmake
> +}
> +
> +do_install() {
> +	oe_runmake DESTDIR=3D${D} install
> +}
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+pVo4ACgkQN1Ujt2V2gBzQCQCgjoTORRe+9rKKpr7Bkxa8neg8
saUAoKH4xWpvBiCyz+xhcGdgDI94A5Up
=Ujlx
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
