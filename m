Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RW6A7-0005xk-HO for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 13:54:51 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1CmArG015238
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Dec 2011 12:48:10 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14826-05 for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2011 12:48:06 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1Cm4mo015232
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Dec 2011 12:48:05 GMT
Message-ID: <1322743693.17484.120.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Dec 2011 12:48:13 +0000
In-Reply-To: <CAOd_LFzLRF3VvbQqrGekjtLSvfyXHQHeKyd=QcnAUFQpaGg8uA@mail.gmail.com>
References: <4EC24711.2010805@eukrea.com>
	<CAOd_LFzLRF3VvbQqrGekjtLSvfyXHQHeKyd=QcnAUFQpaGg8uA@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	pB1CmArG015238
Subject: Re: Reproducible build problem with BB_NUMBER_THREADS=8
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
X-List-Received-Date: Thu, 01 Dec 2011 12:54:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2011-12-01 at 07:34 -0500, Cliff Brake wrote:
> On Tue, Nov 15, 2011 at 6:03 AM, Eric B=C3=A9nard <eric@eukrea.com> wro=
te:
>=20
> > The workaround is to reduce BB_NUMBER_THREADS to <=3D4 which seems to=
 never
> > bring the problem (at least for a dozen of builds).
> >
> > Does anyone meet the same problem ?
>=20
> Yes, I just ran into this problem with a snapshot from yesterday.
>=20
> > Any idea of what could be wrong here ?
>=20
> No, I don't.  Its odd because the string includes are present:
>=20
> find -name string
> ./am180x-evm/usr/include/c++/string
> ./am180x-evm/usr/include/c++/debug/string
>=20
> Using built-in specs.
> COLLECT_GCC=3Darm-angstrom-linux-gnueabi-g++
> COLLECT_LTO_WRAPPER=3D/scratch/handera/handera-oe/build/tmp-angstrom_20=
10_x-eglibc/sysroots/x86_64-linux/usr/libexec/armv5te-angstrom-linux-gnue=
abi/gcc/arm-angstrom-linux-gnueabi/4.5.4/lto-wrapper
> Target: arm-angstrom-linux-gnueabi
> Configured with:
> /scratch/handera/handera-oe/build/tmp-angstrom_2010_x-eglibc/work-share=
d/gcc-4.5-r43+svnr178923/gcc-4_5-branch/configure
> --build=3Dx86_64-linux --host=3Dx86_64-linux
> --target=3Darm-angstrom-linux-gnueabi
> --prefix=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-eglibc=
/sysroots/x86_64-linux/usr
> --exec_prefix=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-e=
glibc/sysroots/x86_64-linux/usr
> --bindir=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-eglibc=
/sysroots/x86_64-linux/usr/bin/armv5te-angstrom-linux-gnueabi
> --sbindir=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-eglib=
c/sysroots/x86_64-linux/usr/bin/armv5te-angstrom-linux-gnueabi
> --libexecdir=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-eg=
libc/sysroots/x86_64-linux/usr/libexec/armv5te-angstrom-linux-gnueabi
> --datadir=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-eglib=
c/sysroots/x86_64-linux/usr/share
> --sysconfdir=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-eg=
libc/sysroots/x86_64-linux/etc
> --sharedstatedir=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_=
x-eglibc/sysroots/x86_64-linux/com
> --localstatedir=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x=
-eglibc/sysroots/x86_64-linux/var
> --libdir=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-eglibc=
/sysroots/x86_64-linux/usr/lib/armv5te-angstrom-linux-gnueabi
> --includedir=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-eg=
libc/sysroots/x86_64-linux/usr/include
> --oldincludedir=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x=
-eglibc/sysroots/x86_64-linux/usr/include
> --infodir=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-eglib=
c/sysroots/x86_64-linux/usr/share/info
> --mandir=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-eglibc=
/sysroots/x86_64-linux/usr/share/man
> --disable-silent-rules --disable-dependency-tracking
> --with-libtool-sysroot=3D/scratch/handera/handera-oe/build/tmp-angstrom=
_2010_x-eglibc/sysroots/x86_64-linux
> --with-gnu-ld --enable-shared --enable-languages=3Dc,c++
> --enable-threads=3Dposix --disable-multilib --enable-c99
> --enable-long-long --enable-symvers=3Dgnu --enable-libstdcxx-pch
> --program-prefix=3Darm-angstrom-linux-gnueabi- --enable-target-optspace
> --enable-lto --enable-libssp --disable-bootstrap --disable-libgomp
> --disable-libmudflap --enable-cheaders=3Dc_global --with-float=3Dsoft
> --with-local-prefix=3D/scratch/handera/handera-oe/build/tmp-angstrom_20=
10_x-eglibc/sysroots/am180x-evm/usr
> --with-gxx-include-dir=3D/usr/include/c++
> --with-sysroot=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-=
eglibc/sysroots/am180x-evm
> --with-build-sysroot=3D/scratch/handera/handera-oe/build/tmp-angstrom_2=
010_x-eglibc/sysroots/am180x-evm
> --enable-poison-system-directories
> --with-headers=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-=
eglibc/sysroots/am180x-evm/usr/include
> --disable-nls --disable-libunwind-exceptions
> --with-mpfr=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-egl=
ibc/sysroots/x86_64-linux/usr
> --with-system-zlib --enable-nls --enable-__cxa_atexit
> Thread model: posix
> gcc version 4.5.4 20110917 (prerelease) (GCC)
>=20
> I noticed --with-gxx-include-dir=3D/usr/include/c++, but other builds
> that appear to be working also have that.

When you restart the build is the problem persistent or does it work the
second time?

Does someone have a complete console log for a build that failed with
this they could share?=20

Cheers,

Richard



