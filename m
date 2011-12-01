Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1RW5wn-0005WP-Ok
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 13:41:07 +0100
Received: by ghrr13 with SMTP id r13so1744306ghr.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 04:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=RBy3ETysTaQ9Fnpdit/Hol5l2DpW32Q1H8wiKserTew=;
	b=x2V5f8nYgwYE4LPqMIyk1aFpZBInoR0BQAWqqDo7BOrmbGF857K7BkvOgNYY2yY4jP
	WbL+TK/qxKRY9fEY8KNPtr5/DTfpiOxFvnuzWrjro+FZN5+rNl7KE9zeg7w41vmdgKaV
	TPafys/ErChBgpyJPEpQ45Wck1oB2WD7B0VYI=
MIME-Version: 1.0
Received: by 10.236.22.164 with SMTP id t24mr10909653yht.67.1322742863760;
	Thu, 01 Dec 2011 04:34:23 -0800 (PST)
Received: by 10.236.67.33 with HTTP; Thu, 1 Dec 2011 04:34:22 -0800 (PST)
In-Reply-To: <4EC24711.2010805@eukrea.com>
References: <4EC24711.2010805@eukrea.com>
Date: Thu, 1 Dec 2011 07:34:22 -0500
Message-ID: <CAOd_LFzLRF3VvbQqrGekjtLSvfyXHQHeKyd=QcnAUFQpaGg8uA@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 01 Dec 2011 12:41:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 15, 2011 at 6:03 AM, Eric B=E9nard <eric@eukrea.com> wrote:

> The workaround is to reduce BB_NUMBER_THREADS to <=3D4 which seems to nev=
er
> bring the problem (at least for a dozen of builds).
>
> Does anyone meet the same problem ?

Yes, I just ran into this problem with a snapshot from yesterday.

> Any idea of what could be wrong here ?

No, I don't.  Its odd because the string includes are present:

find -name string
./am180x-evm/usr/include/c++/string
./am180x-evm/usr/include/c++/debug/string

Using built-in specs.
COLLECT_GCC=3Darm-angstrom-linux-gnueabi-g++
COLLECT_LTO_WRAPPER=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x=
-eglibc/sysroots/x86_64-linux/usr/libexec/armv5te-angstrom-linux-gnueabi/gc=
c/arm-angstrom-linux-gnueabi/4.5.4/lto-wrapper
Target: arm-angstrom-linux-gnueabi
Configured with:
/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-eglibc/work-shared/gc=
c-4.5-r43+svnr178923/gcc-4_5-branch/configure
--build=3Dx86_64-linux --host=3Dx86_64-linux
--target=3Darm-angstrom-linux-gnueabi
--prefix=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-eglibc/sys=
roots/x86_64-linux/usr
--exec_prefix=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-eglib=
c/sysroots/x86_64-linux/usr
--bindir=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-eglibc/sys=
roots/x86_64-linux/usr/bin/armv5te-angstrom-linux-gnueabi
--sbindir=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-eglibc/sy=
sroots/x86_64-linux/usr/bin/armv5te-angstrom-linux-gnueabi
--libexecdir=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-eglibc=
/sysroots/x86_64-linux/usr/libexec/armv5te-angstrom-linux-gnueabi
--datadir=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-eglibc/sy=
sroots/x86_64-linux/usr/share
--sysconfdir=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-eglibc=
/sysroots/x86_64-linux/etc
--sharedstatedir=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-eg=
libc/sysroots/x86_64-linux/com
--localstatedir=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-egl=
ibc/sysroots/x86_64-linux/var
--libdir=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-eglibc/sys=
roots/x86_64-linux/usr/lib/armv5te-angstrom-linux-gnueabi
--includedir=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-eglibc=
/sysroots/x86_64-linux/usr/include
--oldincludedir=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-egl=
ibc/sysroots/x86_64-linux/usr/include
--infodir=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-eglibc/sy=
sroots/x86_64-linux/usr/share/info
--mandir=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-eglibc/sys=
roots/x86_64-linux/usr/share/man
--disable-silent-rules --disable-dependency-tracking
--with-libtool-sysroot=3D/scratch/handera/handera-oe/build/tmp-angstrom_201=
0_x-eglibc/sysroots/x86_64-linux
--with-gnu-ld --enable-shared --enable-languages=3Dc,c++
--enable-threads=3Dposix --disable-multilib --enable-c99
--enable-long-long --enable-symvers=3Dgnu --enable-libstdcxx-pch
--program-prefix=3Darm-angstrom-linux-gnueabi- --enable-target-optspace
--enable-lto --enable-libssp --disable-bootstrap --disable-libgomp
--disable-libmudflap --enable-cheaders=3Dc_global --with-float=3Dsoft
--with-local-prefix=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x=
-eglibc/sysroots/am180x-evm/usr
--with-gxx-include-dir=3D/usr/include/c++
--with-sysroot=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-egli=
bc/sysroots/am180x-evm
--with-build-sysroot=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_=
x-eglibc/sysroots/am180x-evm
--enable-poison-system-directories
--with-headers=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-egli=
bc/sysroots/am180x-evm/usr/include
--disable-nls --disable-libunwind-exceptions
--with-mpfr=3D/scratch/handera/handera-oe/build/tmp-angstrom_2010_x-eglibc/=
sysroots/x86_64-linux/usr
--with-system-zlib --enable-nls --enable-__cxa_atexit
Thread model: posix
gcc version 4.5.4 20110917 (prerelease) (GCC)

I noticed --with-gxx-include-dir=3D/usr/include/c++, but other builds
that appear to be working also have that.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


