Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id A54FE75799
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 16:30:48 +0000 (UTC)
Received: by wgmn9 with SMTP id n9so62851839wgm.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 09:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2L+baopIR4HABV6SUbJWS9lQHYsa6Tdyu6aPYwPeziw=;
	b=c6+lsT5tvPPt1+XnhGMEObjX2ImRyd6tU7ymAuA2HSKamhHzEuG2D3htSd/thAGHBD
	gU5vVRX8dQhaVOeUPfq1Hth+KAP0jMFrq7zIl0yA96PEHrjyTJBAM8/Cze24cBbZduc4
	TscvbX5SYGMxkx09s/tqiyLsHP8xVIVLM6mcIp1im2yCMMTZ98WpuwqW9fiMi2y38kK6
	zthQS2HkCKwuGRmkVewbd21EA7zcg6VUrqeQjCXNOuJc42gPzBKXcP9dwwiIxGFpij3n
	pw+JzxC5glLkduiaiAXaX7Up5SMdvUuhBERN/Um6yTFVopNQGXrCKzW9ohe+pWgfuzhe
	e9ew==
X-Received: by 10.180.219.41 with SMTP id pl9mr8290605wic.30.1437064248152;
	Thu, 16 Jul 2015 09:30:48 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	be9sm13909153wjb.26.2015.07.16.09.30.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Jul 2015 09:30:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 16 Jul 2015 18:31:15 +0200
To: "Iorga, Cristian" <cristian.iorga@intel.com>
Message-ID: <20150716163115.GF2134@jama>
References: <cover.1437043973.git.cristian.iorga@intel.com>
	<b898b9addec522a9834a53dfd6a699b65665669a.1437043973.git.cristian.iorga@intel.com>
	<20150716114642.GB2134@jama>
	<969F26A8BAB325438E7EB80D3C3134FB44B165B6@irsmsx105.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB44B165B6@irsmsx105.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/3] qemu: upgrade to 2.4.0-rc0
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
X-List-Received-Date: Thu, 16 Jul 2015 16:30:49 -0000
X-Groupsio-MsgNum: 68046
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Wb5NtZlyOqqy58h0"
Content-Disposition: inline

--Wb5NtZlyOqqy58h0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2015 at 03:55:51PM +0000, Iorga, Cristian wrote:
> Hi Martin,
>=20
> I am not sure that's really necessary.
> 1. There will be an upgrade to 2.4.0 following the official release ASAP;
> 2. Most probably there won't be any maintenance release to 2.3. before 2.=
4 release;

yes, but that doesn't mean that there aren't people with qemu recipes
which set:
PV =3D "2.4+gitr${SRCPV}"

> 3. Rarely there are maintenance releases from qemu project.
> 4. I don't like to beautify things only that there is a slight chance tha=
t "something might happen".

I don't like assuming that "something won't happen" when there is a lot
of layers you don't know about, including private ones and making it
beautiful is super easy and good convention for future as well.

Cheers,

> -----Original Message-----
> From: Martin Jansa [mailto:martin.jansa@gmail.com]=20
> Sent: Thursday, July 16, 2015 2:47 PM
> To: Iorga, Cristian
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH v3 1/3] qemu: upgrade to 2.4.0-rc0
>=20
> On Thu, Jul 16, 2015 at 01:56:43PM +0300, Cristian Iorga wrote:
> > - Get rid of direct use of gnutls APIs in quorum blockdrv in favour of=
=20
> > using the crypto APIs.
> > - Convert VNC websockets to use crypto APIs.
> > - qurum and vnc-ws packageconfig options no longer exist, removed.
> > - All previous CVE are now included.
> > - larger_default_ram_size.patch patch removed, no longer necessary.
> >=20
> > Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> > ---
> >  meta/recipes-devtools/qemu/qemu.inc                |  3 --
> >  .../qemu/qemu/larger_default_ram_size.patch        | 22 ---------------
> >  meta/recipes-devtools/qemu/qemu_2.3.0.bb           | 32 --------------=
--------
> >  meta/recipes-devtools/qemu/qemu_2.4.0-rc0.bb       | 22 +++++++++++++++
> >  4 files changed, 22 insertions(+), 57 deletions(-)  delete mode=20
> > 100644 meta/recipes-devtools/qemu/qemu/larger_default_ram_size.patch
> >  delete mode 100644 meta/recipes-devtools/qemu/qemu_2.3.0.bb
> >  create mode 100644 meta/recipes-devtools/qemu/qemu_2.4.0-rc0.bb
> >=20
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc=20
> > b/meta/recipes-devtools/qemu/qemu.inc
> > index d794af9..eba7d3d 100644
> > --- a/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > @@ -15,7 +15,6 @@ QEMU_TARGETS ?=3D "arm aarch64 i386 mips mipsel mips6=
4 mips64el ppc sh4 x86_64"
> > =20
> >  SRC_URI =3D "\
> >      file://powerpc_rom.bin \
> > -    file://larger_default_ram_size.patch \
> >      file://disable-grabs.patch \
> >      file://exclude-some-arm-EABI-obsolete-syscalls.patch \
> >      file://wacom.patch \
> > @@ -89,9 +88,7 @@ PACKAGECONFIG[virtfs] =3D "--enable-virtfs=20
> > --enable-attr,--disable-virtfs,libcap a  PACKAGECONFIG[aio] =3D "--enab=
le-linux-aio,--disable-linux-aio,libaio,"
> >  PACKAGECONFIG[xfs] =3D "--enable-xfsctl,--disable-xfsctl,xfsprogs,"
> >  PACKAGECONFIG[xen] =3D "--enable-xen,--disable-xen,xen,xen-libxenstore=
 xen-libxenctrl xen-libxenguest"
> > -PACKAGECONFIG[quorum] =3D "--enable-quorum, --disable-quorum, gnutls,"
> >  PACKAGECONFIG[vnc-tls] =3D "--enable-vnc --enable-vnc-tls,--disable-vn=
c-tls, gnutls,"
> > -PACKAGECONFIG[vnc-ws] =3D "--enable-vnc --enable-vnc-ws,--disable-vnc-=
ws, gnutls,"
> >  PACKAGECONFIG[vnc-sasl] =3D "--enable-vnc --enable-vnc-sasl,--disable-=
vnc-sasl,cyrus-sasl,"
> >  PACKAGECONFIG[vnc-jpeg] =3D "--enable-vnc --enable-vnc-jpeg,--disable-=
vnc-jpeg,jpeg,"
> >  PACKAGECONFIG[vnc-png] =3D "--enable-vnc --enable-vnc-png,--disable-vn=
c-png,libpng,"
> > diff --git=20
> > a/meta/recipes-devtools/qemu/qemu/larger_default_ram_size.patch=20
> > b/meta/recipes-devtools/qemu/qemu/larger_default_ram_size.patch
> > deleted file mode 100644
> > index 711c360..0000000
> > --- a/meta/recipes-devtools/qemu/qemu/larger_default_ram_size.patch
> > +++ /dev/null
> > @@ -1,22 +0,0 @@
> > -This patch is taken from debian. 128M is too less sometimes if distro=
=20
> > -with lot of packages is booted so this patch raises the default to=20
> > 384M
> > -
> > -It has not been applied to upstream qemu
> > -
> > -Khem Raj <raj.khem@gmail.com>
> > -
> > -Upstream-Status: Pending
> > -
> > -Index: qemu-0.14.0/vl.c
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- qemu-0.14.0.orig/vl.c
> > -+++ qemu-0.14.0/vl.c
> > -@@ -168,7 +168,7 @@ int main(int argc, char **argv)
> > - //#define DEBUG_NET
> > - //#define DEBUG_SLIRP
> > -
> > --#define DEFAULT_RAM_SIZE 128
> > -+#define DEFAULT_RAM_SIZE 384
> > -
> > - #define MAX_VIRTIO_CONSOLES 1
> > -
> > diff --git a/meta/recipes-devtools/qemu/qemu_2.3.0.bb=20
> > b/meta/recipes-devtools/qemu/qemu_2.3.0.bb
> > deleted file mode 100644
> > index cae0ad1..0000000
> > --- a/meta/recipes-devtools/qemu/qemu_2.3.0.bb
> > +++ /dev/null
> > @@ -1,32 +0,0 @@
> > -require qemu.inc
> > -
> > -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D441c28d2cf86e15a37fa47e15a7=
2fbac \
> > -                    file://COPYING.LIB;endline=3D24;md5=3Dc04def7ae388=
50e7d3ef548588159913"
> > -
> > -SRC_URI +=3D "file://configure-fix-Darwin-target-detection.patch \
> > -            file://qemu-enlarge-env-entry-size.patch \
> > -            file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch=
 \
> > -            file://qemu-CVE-2015-3456.patch \
> > -            file://01-xen-properly-gate-host-writes-of-modified-PCI-CF=
G-contents-CVE-2015-4103.patch \
> > -            file://02-xen-dont-allow-guest-to-control-MSI-mask-registe=
r-CVE-2015-4104.patch \
> > -            file://03-xen-MSI-X-limit-error-messages-CVE-2015-4105.pat=
ch \
> > -            file://04-xen-MSI-dont-open-code-pass-through-of-enable-bi=
t-mod-CVE-2015-4106.patch \
> > -            file://05-xen-pt-consolidate-PM-capability-emu_mask-CVE-20=
15-4106.patch \
> > -            file://06-xen-pt-correctly-handle-PM-status-bit-CVE-2015-4=
106.patch \
> > -            file://07-xen-pt-split-out-calculation-of-throughable-mask=
-CVE-2015-4106.patch \
> > -            file://08-xen-pt-mark-all-PCIe-capability-bits-read-only-C=
VE-2015-4106.patch \
> > -            file://09-xen-pt-mark-reserved-bits-in-PCI-config-space-fi=
elds-CVE-2015-4106.patch \
> > -            file://10-xen-pt-add-a-few-PCI-config-space-field-descript=
ions-CVE-2015-4106.patch \
> > -            file://11-xen-pt-unknown-PCI-config-space-fields-should-be=
-readonly-CVE-2015-4106.patch \
> > -            file://qemu-fix-CVE-2015-3209.patch \
> > -           "
> > -SRC_URI_prepend =3D "http://wiki.qemu-project.org/download/${BP}.tar.b=
z2"
> > -SRC_URI[md5sum] =3D "2fab3ea4460de9b57192e5b8b311f221"
> > -SRC_URI[sha256sum] =3D "b6bab7f763d5be73e7cb5ee7d4c8365b7a8df2972c52fa=
5ded18893bd8281588"
> > -
> > -COMPATIBLE_HOST_class-target_mips64 =3D "null"
> > -
> > -do_install_append() {
> > -    # Prevent QA warnings about installed ${localstatedir}/run
> > -    if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localstatedir=
}/run; fi
> > -}
> > diff --git a/meta/recipes-devtools/qemu/qemu_2.4.0-rc0.bb=20
> > b/meta/recipes-devtools/qemu/qemu_2.4.0-rc0.bb
> > new file mode 100644
> > index 0000000..c4505ba
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu_2.4.0-rc0.bb
> > @@ -0,0 +1,22 @@
> > +require qemu.inc
> > +
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D441c28d2cf86e15a37fa47e15a7=
2fbac \
> > +                    file://COPYING.LIB;endline=3D24;md5=3Dc04def7ae388=
50e7d3ef548588159913"
> > +
> > +SRC_URI +=3D "file://configure-fix-Darwin-target-detection.patch \
> > +            file://qemu-enlarge-env-entry-size.patch \
> > +            file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch=
 \
> > +           "
> > +SRC_URI_prepend =3D "http://wiki.qemu-project.org/download/${BPN}-${RE=
ALPV}.tar.bz2"
> > +SRC_URI[md5sum] =3D "0c890db3811f2ad9cc7bb2a5afe08e4c"
> > +SRC_URI[sha256sum] =3D "8dda3e0f9baffbe29b524c03fd46d611afed1dfb5da1be=
cec033beaf76a1bc6d"
> > +S=3D"${WORKDIR}/${BPN}-${REALPV}"
> > +REALPV =3D "2.4.0-rc0"
> > +PV =3D "2.3.0+${REALPV}"
>=20
> It's better to use something like 2.3.99+${REALPV} to make sure it sorts =
higher than any 2.3.* version (e.g. if someone is using some newer revision=
 from 2.3 branch.
>=20
> > +
> > +COMPATIBLE_HOST_class-target_mips64 =3D "null"
> > +
> > +do_install_append() {
> > +    # Prevent QA warnings about installed ${localstatedir}/run
> > +    if [ -d ${D}${localstatedir}/run ]; then rmdir=20
> > +${D}${localstatedir}/run; fi }
> > --
> > 2.1.4
> >=20
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Wb5NtZlyOqqy58h0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWn3FMACgkQN1Ujt2V2gByUxQCfZpXORYJ0S/8ey/9/NofdoZxe
5tcAoJ3NvvGEm3cwX9ky0Pml43kQRU8L
=30CW
-----END PGP SIGNATURE-----

--Wb5NtZlyOqqy58h0--
