Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1RtHhE-0006Jl-6r; Fri, 03 Feb 2012 12:52:52 +0100
Received: by eekd41 with SMTP id d41so937567eek.6
	for <multiple recipients>; Fri, 03 Feb 2012 03:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3ASMrO+QVc/iTOjz+XGy2eOLKlT9JEUeZuSpebF04Mk=;
	b=QX+oFBKqn8zr4chmyziDv3pI7WIPlyg2VBScnVzXKPcHGWNjCKN7TltyWYKHQ3U7O3
	ryxsnK1cZ25C5cJoV7Cvb/IZdJcsCt4LVr/0779razqAqlrBbmW2YZz1pxOXDxxJFqTy
	l4KQCaRMgkcIfwI27KbToGpKN0kPYBuyoXD6M=
Received: by 10.14.0.76 with SMTP id 52mr1264160eea.23.1328269495017;
	Fri, 03 Feb 2012 03:44:55 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a58sm20964993eeb.8.2012.02.03.03.44.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 03:44:54 -0800 (PST)
Date: Fri, 3 Feb 2012 12:44:51 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120203114451.GF3893@jama.jama.net>
References: <1324624336-18713-1-git-send-email-eric@eukrea.com>
	<20120104051849.GG31275@sakrah.homelinux.org>
	<20120104090523.066ae2d7@eb-e6520>
	<CA+chaQe-XFR6XVAoept8+d8kqoZ1y2qBoVXgetEPpD2n50nYBA@mail.gmail.com>
	<20120202084000.GD3697@jama.jama.net>
	<20120202091726.GG3697@jama.jama.net>
	<20120202111127.0b9d886a@eb-e6520>
	<20120203072808.GB3893@jama.jama.net>
	<20120203094104.GE3893@jama.jama.net>
	<20120203112037.314f9004@eb-e6520>
MIME-Version: 1.0
In-Reply-To: <20120203112037.314f9004@eb-e6520>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] SDK confusion Was: [meta-oe] gdb-cross-canadian: build gdb with python support
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
X-List-Received-Date: Fri, 03 Feb 2012 11:52:52 -0000
X-Groupsio-MsgNum: 16981
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HCdXmnRlPgeNBad2"
Content-Disposition: inline

--HCdXmnRlPgeNBad2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 03, 2012 at 11:20:37AM +0100, Eric B=E9nard wrote:
> Hi Martin,
>=20
> Le Fri, 3 Feb 2012 10:41:05 +0100,
> Martin Jansa <martin.jansa@gmail.com> a =E9crit :
> > in x86_64-oesdk-linux there are only gcc+binutils crosssdk
> > binutils-crosssdk-2.22-r2  gcc-crosssdk-4.6.2+svnr181430-r22  gcc-cross=
sdk-initial-4.6.2+svnr181430-r22  gcc-crosssdk-intermediate-4.6.2+svnr18143=
0-r22
> > the rest is in=20
> > x86_64-nativesdk-oesdk-linux
> >=20
> > gdb-cross-canadian-arm is only package were exec_prefix points to oecor=
e-x86_64-arm
> > ./gdb-cross-canadian-arm-7.3.1-r5.1/temp/run.do_configure.1688
> > export exec_prefix=3D"/usr/local/oecore-x86_64-arm/sysroots/x86_64-oesd=
k-linux/usr"
> >=20
> > while all nativesdk packages are using oecore-x86_64-x86_64
> > ./python-nativesdk-2.7.2-r0.5/temp/run.do_configure.14043
> > export exec_prefix=3D"/usr/local/oecore-x86_64-x86_64/sysroots/x86_64-o=
esdk-linux/usr"
> >=20
> here is the big difference when using Angstrom :
> python-nativesdk-2.7.2-r0.5/temp/run.do_configure.30951:73:export
> exec_prefix=3D"/usr/local/angstrom-eglibc-x86_64-armv7a/sysroots/x86_64-a=
ngstromsdk-linux/usr"
> I don't yet know where this difference comes from.

I also don't really understand using oecore-x86_64-x86_64 when building
for qemuarm

Last part should be TARGET_ARCH from
conf/bitbake.conf:SDK_NAME =3D "oecore-${SDK_ARCH}-${TARGET_ARCH}"

but TARGET_ARCH is defined couple of times:
conf/bitbake.conf:TARGET_ARCH =3D "${TUNE_ARCH}"

classes/native.bbclass:TARGET_ARCH =3D "${BUILD_ARCH}"
classes/crosssdk.bbclass:TARGET_ARCH =3D "${SDK_ARCH}"
classes/nativesdk.bbclass:TARGET_ARCH =3D "${SDK_ARCH}"

So it looks like TARGET_ARCH from bitbake.conf wins for you and here
it's using TARGET_ARCH =3D "${SDK_ARCH}" from nativesdk.bbclass

With following modification I was able to configure and build it fine,
but seems like your oecore-x86_64-arm correct and oecore-x86_64-x86_64
should be used only e.g. for qemux86-64 not qemuarm

Cheers,

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipe=
s-devtools/gdb/gdb-cross-canadian.inc
index b5746ce..bac63b7 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -10,12 +10,18 @@ RDEPENDS +=3D "python-nativesdk-core python-nativesdk-l=
ang python-nativesdk-re \

 EXTRA_OECONF_append =3D "--with-python=3D${WORKDIR}/python"

+NATIVESDK_NAME =3D "oecore-${SDK_ARCH}-${SDK_ARCH}"
+NATIVESDK_PATH =3D "/usr/local/${NATIVESDK_NAME}"
+NATIVESDK_PATHNATIVE =3D "${NATIVESDK_PATH}/sysroots/${SDK_SYS}"
+NATIVESDK_LIBDIR =3D "${NATIVESDK_PATHNATIVE}${libdir_nativesdk}"
+NATIVESDK_INCLUDEDIR =3D "${NATIVESDK_PATHNATIVE}${includedir_nativesdk}"
+
 do_configure_prepend() {
 cat > ${WORKDIR}/python << EOF
 #! /bin/sh
 case "\$2" in
-        --includes) echo "-I${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VE=
NDOR}-${HOST_OS}${exec_prefix}/include/python${PYTHON_BASEVERSION}/" ;;
-        --ldflags) echo "-L${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VEN=
DOR}-${HOST_OS}${libdir}/python${PYTHON_BASEVERSION}/config/config -lpthrea=
d -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
+        --includes) echo "-I${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VE=
NDOR}-${HOST_OS}${NATIVESDK_INCLUDEDIR}/python${PYTHON_BASEVERSION}/" ;;
+        --ldflags) echo "-L${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VEN=
DOR}-${HOST_OS}${NATIVESDK_LIBDIR}/python${PYTHON_BASEVERSION}/config -lpth=
read -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
         --exec-prefix) echo "/usr" ;;
         *) exit 1 ;;
 esac

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HCdXmnRlPgeNBad2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8ryLMACgkQN1Ujt2V2gBw9dwCfd7hsf3I47XQJSE9ulJMwp+0y
/KIAmwT1rHpDCW4Zw9xeXemzPZBSYddD
=hRZ4
-----END PGP SIGNATURE-----

--HCdXmnRlPgeNBad2--
