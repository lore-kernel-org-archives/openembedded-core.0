Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdQF2-0002yy-5y
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 19:50:49 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so6907390eei.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2012 10:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hA0Axc6Qzin2hhyxhem8tVOls5na+hYJMrDem45BZ7I=;
	b=Z6JImamU168zBOpCLGHctXuEcXn/ccbmIPt1lwsRy6ydtpnN/02P4EwS7FStkuufFr
	ThdaX3jumCg5e1h4vxK5rbZQh3RMHag53CUAzqGPW8cjVYWRZsmHxkmo6SB8j6kPoMeD
	LGy6LT5Fvwden5qtjuJ2Os+/2H+G2K7QPGLVIWTTyg/KZNyVBDGW46Y/W4cIqcVwpbOy
	kRXHKrIg1fyEqg1MSRdx8wmqMjrzCB6+l41Nfio6YJrQt2Pat4/cmpnosZIWRlwA0mqc
	rV3X0uO9gc+6EEst86mVU9gOMm1LMVfsoZO8WSa5zeSvPvGSdnJbPWeAqqZIX+zHQfza
	tx0w==
Received: by 10.14.174.194 with SMTP id x42mr61093318eel.22.1354041390879;
	Tue, 27 Nov 2012 10:36:30 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n7sm24457831eeo.2.2012.11.27.10.36.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 10:36:30 -0800 (PST)
Date: Tue, 27 Nov 2012 19:36:24 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20121127183624.GF3692@jama.jama.net>
References: <20121127182306.GE3692@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20121127182306.GE3692@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: locale data broken in gstreamer
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
X-List-Received-Date: Tue, 27 Nov 2012 18:50:53 -0000
X-Groupsio-MsgNum: 31803
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OZkY3AIuv2LYvjdk"
Content-Disposition: inline

--OZkY3AIuv2LYvjdk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 27, 2012 at 07:23:06PM +0100, Martin Jansa wrote:
> In last rebuild from scratch I've noticed couple of weird locale data:
>=20
> Collected errors:
>  * check_data_file_clashes: Package gst-plugins-base-locale-en-gb wants
>  * to install file /usr/share/locale/en_GB/LC_MESSAGES/.mo
>         But that file is already provided by package  * gstreamer-locale-=
en-gb
>  * check_data_file_clashes: Package gst-plugins-base-locale-cs wants to
>  * install file /usr/share/locale/cs/LC_MESSAGES/.mo
>         But that file is already provided by package  * gstreamer-locale-=
cs
>=20
> All gstreamer and gst-plugins-base locales package just .mo file.
>=20
> from log.do_install:
> make[1]: Entering directory `/OE/shr-core/tmp-eglibc/work/armv4t-oe-linux=
-gnueabi/gstreamer/0.10.36-r1/gstreamer-0.10.36/po'
> installing af.gmo as /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi=
/gstreamer/0.10.36-r1/image/usr/share/locale/af/LC_MESSAGES/.mo
> installing az.gmo as /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi=
/gstreamer/0.10.36-r1/image/usr/share/locale/az/LC_MESSAGES/.mo
> installing be.gmo as /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi=
/gstreamer/0.10.36-r1/image/usr/share/locale/be/LC_MESSAGES/.mo
>=20
> They are installed to $(DOMAIN).mo
> gstreamer-0.10.36/po/Makefile.in.in:$(INSTALL_DATA) $$realcat $(DESTDIR)$=
$dir/$(DOMAIN).mo; \
> gstreamer-0.10.36/po/Makefile.in.in:echo "installing $$realcat as $(DESTD=
IR)$$dir/$(DOMAIN).mo"; \
>=20
> and DOMAIN should be set to GETTEXT_PACKAGE (gstreamer-0.10)
> ./gstreamer-0.10.36/po/Makevars:DOMAIN =3D $(GETTEXT_PACKAGE)
> ./gstreamer-0.10.36/po/Makefile:DOMAIN =3D $(GETTEXT_PACKAGE)
>=20
> Anyone else seen this, any idea why it fails now? gst* recipes weren't ch=
anged lately IIRC,=20
> so maybe some change in gettext which can break more recipes?

buildhistory shows that it got broken around Oct 21

Maybe someone with OEBasicHash can pinpoint it better?

$ git show -1 47613e04c950dee281bf4531ef3fb3b71a90c906 | grep gst-plugins-b=
ase-locale-en-gb -A 11
diff --git a/packages/armv4t-oe-linux-gnueabi/gst-plugins-base/gst-plugins-=
base-locale-en-gb/latest b/packages/armv4t-oe-linux-gnueabi/gst-plugins-bas=
e/gst-plugins-base-locale-en-gb/latest
index 74a76ae..ebcab7f 100644
--- a/packages/armv4t-oe-linux-gnueabi/gst-plugins-base/gst-plugins-base-lo=
cale-en-gb/latest
+++ b/packages/armv4t-oe-linux-gnueabi/gst-plugins-base/gst-plugins-base-lo=
cale-en-gb/latest
@@ -1,7 +1,7 @@
 PV =3D 0.10.36
 PR =3D r5
-RDEPENDS =3D gst-plugins-base virtual-locale-en-gb
-RRECOMMENDS =3D=20
+RDEPENDS =3D=20
+RRECOMMENDS =3D gst-plugins-base virtual-locale-en-gb
 PKGSIZE =3D 1165
 FILES =3D /usr/share/locale/en_GB
-FILELIST =3D /usr/share/locale/en_GB/LC_MESSAGES/gst-plugins-base-0.10.mo
+FILELIST =3D /usr/share/locale/en_GB/LC_MESSAGES/.mo
$ git show -1 47613e04c950dee281bf4531ef3fb3b71a90c906 | grep gstreamer-loc=
ale-en-gb -A 11
diff --git a/packages/armv4t-oe-linux-gnueabi/gstreamer/gstreamer-locale-en=
-gb/latest b/packages/armv4t-oe-linux-gnueabi/gstreamer/gstreamer-locale-en=
-gb/latest
index fffca5a..3affa1a 100644
--- a/packages/armv4t-oe-linux-gnueabi/gstreamer/gstreamer-locale-en-gb/lat=
est
+++ b/packages/armv4t-oe-linux-gnueabi/gstreamer/gstreamer-locale-en-gb/lat=
est
@@ -1,7 +1,7 @@
 PV =3D 0.10.36
 PR =3D r1
-RDEPENDS =3D gstreamer virtual-locale-en-gb
-RRECOMMENDS =3D=20
+RDEPENDS =3D=20
+RRECOMMENDS =3D gstreamer virtual-locale-en-gb
 PKGSIZE =3D 12518
 FILES =3D /usr/share/locale/en_GB
-FILELIST =3D /usr/share/locale/en_GB/LC_MESSAGES/gstreamer-0.10.mo
+FILELIST =3D /usr/share/locale/en_GB/LC_MESSAGES/.mo

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OZkY3AIuv2LYvjdk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC1CCgACgkQN1Ujt2V2gBwHywCfZwECchGLeF5JqSSZjXCPPw1w
E70An3aZCuyptfJ5fX++DBmg1WuMrZ65
=1jZw
-----END PGP SIGNATURE-----

--OZkY3AIuv2LYvjdk--
