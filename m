Received: from mail-we0-f178.google.com ([74.125.82.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T06rc-0008D8-HN
	for openembedded-core@linuxtogo.org; Sat, 11 Aug 2012 10:16:04 +0200
Received: by weyu7 with SMTP id u7so1769147wey.37
	for <openembedded-core@linuxtogo.org>;
	Sat, 11 Aug 2012 01:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uvcHM1/VtVD24W9aCAhjA264zj7bhJIf9ptSkb7fR3o=;
	b=iPPhNcSCc7YCfC2I8Y9I4sly3fWPBnsawC0AkjYN0Oo/WTbNjDdwI891Tm/MUMuOGd
	ZO3kddPRvs+3/kOzHNk2E3YMoICJYNAfEI0ApYxG+SN2j3UVZtmBetLeIvYKYyT0CV8t
	v148Qi4xs8FBPtg+VV6i92TAMUyI9ItMvL4Cd0I0sBL7oKYDO01/2sNZtBA+Fn/7jVqs
	vSgVoHXvWy3n28OrLrRmnZOcJI3Eanilt5SMbQoKnmZYylXHShnhosOmgUHkQkmisx6p
	FXAKn2PKC0ni3CC+r7IfR0bpaXVGNoqEU1ff6z7++eFMYVsdH/yJk+5eJRMHPIDj04m2
	dfwA==
Received: by 10.180.103.4 with SMTP id fs4mr2309014wib.16.1344672254011;
	Sat, 11 Aug 2012 01:04:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fr4sm3624466wib.8.2012.08.11.01.04.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 11 Aug 2012 01:04:12 -0700 (PDT)
Date: Sat, 11 Aug 2012 10:04:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120811080416.GA3258@jama.jama.net>
References: <CAMKF1sokpajrms4PACKOSt8CYFt+6JEQ2Fre=QpzJfQF-KLrKA@mail.gmail.com>
	<20120809131016.GA3273@jama.jama.net>
	<CAMKF1sqC-_YTdwsLvVoVyz04ndMxNt6W1z__f_9nUTfb6aF8GQ@mail.gmail.com>
	<20120809145732.GD3273@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120809145732.GD3273@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@linuxtogo.org
Subject: Re: binutils 2.23 call for testing the recipes
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
X-List-Received-Date: Sat, 11 Aug 2012 08:16:04 -0000
X-Groupsio-MsgNum: 27285
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline

--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 09, 2012 at 04:57:32PM +0200, Martin Jansa wrote:
> On Thu, Aug 09, 2012 at 07:53:43AM -0700, Khem Raj wrote:
> > On Thu, Aug 9, 2012 at 6:10 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > > On Wed, Aug 08, 2012 at 10:45:19AM -0700, Khem Raj wrote:
> > >> Hi
> > >>
> > >> Binutils 2.23 branch has started upstream. Given that toolchain
> > >> components require a lot of soak time, I have created the recipes
> > >> for binutils 2.23 and pushed it here
> > >>
> > >> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/=
binutils-2.23
> > >>
> > >> If you are using angstrom set
> > >>
> > >> ANGSTROM_BINUTILS_VERSION =3D "2.23" in local.conf after pulling tha=
t branch
> > >> for OE-Core it will work as it is
> > >>
> > >> Let me know if you see any errors.
> > >
> > > I was trying to build armv4t image with gold enabled again to see if
> > > those issues with gold are resolved and building linux-3.2 and linux-=
2.6.39
> > > are failing with this:
> > >
> > > |   LD      arch/arm/boot/compressed/vmlinux
> > > | arm-oe-linux-gnueabi-ld: error: DIV usage mismatch between arch/arm=
/boot/compressed/misc.o and output
> > > | arm-oe-linux-gnueabi-ld: error: DIV usage mismatch between arch/arm=
/boot/compressed/lib1funcs.o and output
> > > | make[2]: *** [arch/arm/boot/compressed/vmlinux] Error 1
> > >
> > > Any hint for that?
> >=20
> > probably you need something like below
> > https://lists.yoctoproject.org/pipermail/poky/2011-January/003131.html
>=20
> I've used something like
> https://github.com/CyanogenMod/android_kernel_samsung_tuna/commit/ec1ac58=
9d49081286164246fbaaba0012ae7ecac
> and core-image-minimal-mtdutils looks better wrt gold issues we had, now
> waiting for bigger image like shr-lite-image to test it more.

As I said on IRC, I spoke too soon, bash and other apps still suffer from I=
llegal instrictions=20
when gold is used on armv4t..

Also firefox does not build anymore (this is from armv7a): will try to disa=
ble-efl-hack later

| g++ -o elfhack -isystem/var/lib/jenkins/jobs/shr-core-branches/workspace/=
shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include -O2 -pipe -fpermissiv=
e -L/var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/s=
ysroots/x86_64-linux/usr/lib -L/var/lib/jenkins/jobs/shr-core-branches/work=
space/shr-core/tmp-eglibc/sysroots/x86_64-linux/lib -Wl,-rpath-link,/var/li=
b/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/sysroots/x86=
_64-linux/usr/lib -Wl,-rpath-link,/var/lib/jenkins/jobs/shr-core-branches/w=
orkspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/lib -Wl,-rpath,/var/lib/=
jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/lib -Wl,-rpath,/var/lib/jenkins/jobs/shr-core-branches/workspac=
e/shr-core/tmp-eglibc/sysroots/x86_64-linux/lib -Wl,-O1 host_elf.o host_elf=
hack.o
| arm-oe-linux-gnueabi-g++  -march=3Darmv7-a -fno-tree-vectorize     -mthum=
b-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=
=3D/var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/sy=
sroots/nokia900 -fno-rtti -Wall -Wpointer-arith -Woverloaded-virtual -Wsynt=
h -Wno-ctor-dtor-privacy -Wno-non-virtual-dtor -Wno-invalid-offsetof -Wno-v=
ariadic-macros -Werror=3Dreturn-type -Os -fsigned-char -fno-strict-aliasing=
 -fpermissive -fvisibility-inlines-hidden -fno-strict-aliasing -std=3Dgnu++=
0x -pthread -ffunction-sections -fdata-sections -pipe -fexceptions  -DNDEBU=
G -DTRIMMED -g -Os -freorder-blocks  -fomit-frame-pointer -fPIC -shared -Wl=
,-z,defs -Wl,--gc-sections -Wl,-h,test.so -o test.so -lpthread -Wl,-O1 -Wl,=
--hash-style=3Dgnu -Wl,--as-needed -Wl,--icf=3Dsafe   -Wl,-rpath-link,/var/=
lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/work/armv7=
a-vfp-neon-oe-linux-gnueabi/firefox-10.0.2-r2/mozilla-release/dist/bin -Wl,=
-rpath-link,/usr/lib  test.o
| =3D=3D=3D
| =3D=3D=3D If you get failures below, please file a bug describing the err=
or
| =3D=3D=3D and your environment (compiler and linker versions), and use
| =3D=3D=3D --disable-elf-hack until this is fixed.
| =3D=3D=3D
| /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/wor=
k/armv7a-vfp-neon-oe-linux-gnueabi/firefox-10.0.2-r2/mozilla-release/build/=
unix/elfhack/elfhack -b test.so
| test.so: terminate called after throwing an instance of 'std::runtime_err=
or'
|   what():  Unsupported relocation type
| make[7]: *** [test.so] Aborted (core dumped)
| make[7]: Leaving directory `/var/lib/jenkins/jobs/shr-core-branches/works=
pace/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/firefox-10.0=
=2E2-r2/mozilla-release/build/unix/elfhack'



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAmEgAACgkQN1Ujt2V2gByFUQCfXdmCENYX23FeyIk/Lmb4gOpF
lMoAnj6/VRDzLDQUizeZrAlFqlApV2ln
=c/tD
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
