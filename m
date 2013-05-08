Received: from mail-ea0-f180.google.com ([209.85.215.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UZwyO-0007H8-At
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 07:31:37 +0200
Received: by mail-ea0-f180.google.com with SMTP id g14so674211eak.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2013 22:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=XyxYgKp8LMAJvu9pxhtcNG+iHSoWQE596F+yE7wJV8M=;
	b=lCGvq02H92CVdp0+akepWR2i01qlSMEKJ2hhvKxmFOcb6bouuVJZ5yWHHXxb4hZWDw
	X7r1ja7w9aD77a5q2XNWR/tTPtAql5Zb0f9V39o7c2mVYxkciYEZPHdhvssivJV23nHZ
	3KekIoMMxg0icpMExXPLZmpFQp8BE9Miqms+d8l+MgwA6DlF/UcYrXWm0Ng1/PTExcyj
	rGR2gNS81jvuOLinfIezXd+NGqvRXUn1aEbN2Pdl/xP9bTrbLksUIH0fFqzwrIl/WBPA
	BJSME7Z+jnaXltwkJltK3HxEKSRDuYWaX+4AFPld8/xwCL+aaBLAM0Y/MaERo8LH5yBw
	rJJg==
X-Received: by 10.14.99.198 with SMTP id x46mr12689127eef.38.1367990006592;
	Tue, 07 May 2013 22:13:26 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	bn53sm42943777eeb.7.2013.05.07.22.13.25 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 07 May 2013 22:13:25 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <6488B785-095B-4077-96A6-0E2004900C68@gmail.com>
Date: Wed, 8 May 2013 07:13:23 +0200
Message-Id: <A0A7ED9A-5E0F-4851-AED8-6D405407CAF6@dominion.thruhere.net>
References: <515ED999.9040100@communistcode.co.uk>
	<D19A794A-8644-4443-9628-2B137F2BC89F@gmail.com>
	<515EFD76.2090009@communistcode.co.uk>
	<0CA85874-9D57-4E2A-B47D-79DAAD3E78A6@gmail.com>
	<51628545.6050106@communistcode.co.uk>
	<5162888A.90502@communistcode.co.uk>
	<6488B785-095B-4077-96A6-0E2004900C68@gmail.com>
To: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQmyYNpmiUGIggfbUX/nT3QbdJJOy40NFhL2QtJm5mNrPbFBggrla4gVAKFwiMeoKT+ArA9X
Cc: "openembedded-core@lists.openembedded.org layer"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Angstrom-devel] gcc-cross-initial Failure (is a meta-aarch64 screw up)
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
X-List-Received-Date: Wed, 08 May 2013 05:31:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 8 mei 2013, om 04:23 heeft Khem Raj <raj.khem@gmail.com> het volgende =
geschreven:

> Hi Jack
>=20
> since I was playing with archlinux today, I could reproduce this gcc =
ICE problem with angstrom. Actual issue has been already fixed with
>=20
> =
http://git.openembedded.org/openembedded-core/commit/?id=3Db1dc91969f9bb0c=
2a3a4336f5e9a2f57aabb9f78
>=20
> but it was still failing on angstrom/cortex-a8-hf and it took some =
time to realize that angstrom is including meta-aarch64 layer and
> it has totally totally screwed up the toolchain build since this layer =
forked the .inc files from oe-core gcc at some point and never did kept =
them
> in sync with OE-Core it meant that even when I wanted to use gcc 4.7 =
from OE-Core it was picking .incs from meta-aarch64 and the patch
> which was applied to OE-Core recently has been ignored and hence the =
gcc ICE
>=20
> meta-aarch64 has
>=20
> $ find . -name *.inc
> ./recipes-devtools/binutils/binutils-cross-canadian.inc
> ./recipes-devtools/binutils/binutils-git.inc
> ./recipes-devtools/binutils/binutils-cross.inc
> ./recipes-devtools/binutils/binutils.inc
> ./recipes-devtools/gcc/gcc-crosssdk-initial.inc
> ./recipes-devtools/gcc/gcc-common.inc
> ./recipes-devtools/gcc/gcc-configure-common.inc
> ./recipes-devtools/gcc/gcc-cross4.inc
> ./recipes-devtools/gcc/gcc-cross-canadian.inc
> ./recipes-devtools/gcc/gcc-cross-initial.inc
> ./recipes-devtools/gcc/gcc-package-sdk.inc
> ./recipes-devtools/gcc/gcc-package-runtime.inc
> ./recipes-devtools/gcc/gcc-package-target.inc
> ./recipes-devtools/gcc/gcc-crosssdk.inc
> ./recipes-devtools/gcc/gcc-4.7.inc
> ./recipes-devtools/gcc/gcc-configure-sdk.inc
> ./recipes-devtools/gcc/gcc-configure-runtime.inc
> ./recipes-devtools/gcc/gcc-configure-cross.inc
> ./recipes-devtools/gcc/gcc-package-cross.inc
> ./recipes-devtools/gcc/gcc-cross.inc
> ./recipes-devtools/gcc/gcc-configure-target.inc
> ./recipes-devtools/gdb/gdb-cross.inc
> ./recipes-devtools/gdb/gdb.inc
> ./recipes-devtools/gdb/gdb-common.inc
>=20
>=20
> This seems totally wrong to me to since it overrides recipes in subtle =
ways and does not document it anywhere
>=20
> firstly, README is not there and as it seems its a BSP layer but it =
has much more than a BSP metadata in it.
> even then if it needed a new toolchain then it should have used =
different names for includes like meta-linaro-toolchain does.
>=20
> if it needed to enhance existing recipes from OE-Core or reuse them =
then it should have included them as it is and tweaked with bbappend
> or created new recipes itself for aarch64 compiler tools.
>=20
> I will leave this to meta-linaro devs to sort out and let it play =
better with rest of layers meanwhile I will propose to disable =
meta-aarch64 in angstrom.=20

Yes, please disable it till meta-aarch86 gets fixed

regards,

Koen

>=20
> Thanks
>=20
> On Apr 8, 2013, at 2:06 AM, Jack Mitchell <ml@communistcode.co.uk> =
wrote:
>=20
>> On 08/04/13 09:52, Jack Mitchell wrote:
>>> On 05/04/13 18:03, Khem Raj wrote:
>>>> On Apr 5, 2013, at 9:36 AM, Jack Mitchell <ml@communistcode.co.uk> =
wrote:
>>>>=20
>>>>> I build for the beaglebone and I changed them in line with your =
default beaglebone build patch you posted a week or so ago. I think it =
moved it form soft to hard float possibly...
>>>> yes do a clean build if possible
>>>=20
>>> Hi Khem,
>>>=20
>>> Clean build results in the same failure.
>>>=20
>>> Host GCC:
>>>=20
>>> Using built-in specs.
>>> COLLECT_GCC=3Dgcc
>>> =
COLLECT_LTO_WRAPPER=3D/usr/lib/gcc/x86_64-unknown-linux-gnu/4.8.0/lto-wrap=
per=20
>>> Target: x86_64-unknown-linux-gnu
>>> Configured with: /build/src/gcc-4.8.0/configure --prefix=3D/usr =
--libdir=3D/usr/lib --libexecdir=3D/usr/lib --mandir=3D/usr/share/man =
--infodir=3D/usr/share/info --with-bugurl=3Dhttps://bugs.archlinux.org/ =
--enable-languages=3Dc,c++,ada,fortran,go,lto,objc,obj-c++ =
--enable-shared --enable-threads=3Dposix --with-system-zlib =
--enable-__cxa_atexit --disable-libunwind-exceptions =
--enable-clocale=3Dgnu --disable-libstdcxx-pch =
--enable-gnu-unique-object --enable-linker-build-id =
--enable-cloog-backend=3Disl --disable-cloog-version-check --enable-lto =
--enable-gold --enable-ld=3Ddefault --enable-plugin =
--with-plugin-ld=3Dld.gold --with-linker-hash-style=3Dgnu =
--disable-install-libiberty --disable-multilib --disable-libssp =
--disable-werror --enable-checking=3Drelease
>>> Thread model: posix
>>> gcc version 4.8.0 (GCC)
>>>=20
>>>=20
>>> Tune:
>>>=20
>>> DEFAULTTUNE_beaglebone =3D "cortexa8hf-neon"
>>>=20
>>> Cheers,
>>>=20
>>=20
>> Ok, looks like it might have been fluke that it just failed when I =
changed tune, as it also fails with the old tune, please see attached.
>>=20
>> Cheers,
>> Jack.
>>=20
>> --=20
>>=20
>> Jack Mitchell (jack@embed.me.uk)
>> Embedded Systems Engineer
>> http://www.embed.me.uk
>>=20
>> --
>>=20
>> <log.do_compile.25230>_______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
>=20
> _______________________________________________
> Angstrom-distro-devel mailing list
> Angstrom-distro-devel@linuxtogo.org
> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/angstrom-distro-devel



