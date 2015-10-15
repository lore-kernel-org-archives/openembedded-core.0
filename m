Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id A2ED277060
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 07:08:27 +0000 (UTC)
Received: by payp3 with SMTP id p3so31129230pay.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 00:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=ENOCqSoJcAw1xzKeSxLn+Gj9+g2FKI47Z6foipM6/kQ=;
	b=GrxhpcPraLAYV8/IG1m7YvLblMsLW5vDLTZeATGkORKS2HwBKq5cVLEPWT9HlCHIGB
	3ueKPSVAhWfroNHFB+RVEgo3ONuqmF21Ka8v8Mfr6aJ/ocoQ/alZ3/k9RZRHuAyylkWa
	ArATZ2rrnmGZIKVUxOARZW2pKthDgdwn1vop8dmPZDTtWK9Rz6sc/VG2VJrkh43ySI7J
	4Re35zneQEoeLJxax1itXhMEpVyrYKyX1ZX+xe5vuZ966gfZ3iQ8EHeZBUgLnnNIM35d
	7xWpm36FSNf+VwCQdKtEtZgAt1BcjBMRHNh/sTwF2eSk6bMq6LXlmYjTEzvvheI/XLFC
	VcOQ==
X-Received: by 10.68.93.133 with SMTP id cu5mr8543042pbb.71.1444892907637;
	Thu, 15 Oct 2015 00:08:27 -0700 (PDT)
Received: from [192.168.0.4] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85]) by smtp.gmail.com with ESMTPSA id
	zn9sm13480634pac.48.2015.10.15.00.08.26
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Oct 2015 00:08:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3096.1\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJ86T=X3S1mL573-9g2uv0s892KCNaB3yU4xXUvoprSHfzMTqA@mail.gmail.com>
Date: Thu, 15 Oct 2015 00:08:21 -0700
Message-Id: <5B036807-2188-4B80-8AB9-CA18C5EC9CC4@gmail.com>
References: <CAJ86T=U7+d4niZ=hLgQywS6utiL5YJqw1r0E-+_friceOMm4ZQ@mail.gmail.com>
	<4CDE18CB-CAC5-4BE6-9361-89750B612EB1@gmail.com>
	<CAJ86T=X3S1mL573-9g2uv0s892KCNaB3yU4xXUvoprSHfzMTqA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3096.1)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: syslinux + gcc 5.2 build error
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
X-List-Received-Date: Thu, 15 Oct 2015 07:08:29 -0000
X-Groupsio-MsgNum: 72215
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9CEF5497-3286-4DE1-A257-BC779B0BCAD6";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9CEF5497-3286-4DE1-A257-BC779B0BCAD6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 15, 2015, at 12:03 AM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> On Wed, Oct 14, 2015 at 11:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>>> On Oct 14, 2015, at 2:38 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>>>=20
>>> I'm seeing what looks like a gcc bug when building syslinux with
>>> certain combinations of TUNE_CCARGS. A specific combination which
>>> fails is:
>>>=20
>>> TUNE_CCARGS =3D " -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 =
-mfpmath=3Dsse
>>> -fschedule-insns=E2=80=9D
>>=20
>>=20
>> and why would you use -fschedule-insns on something like ia32 with so =
few general purpose regs
>> at disposal ?
>> applying any insn schedule opts before machine registers are assigned =
may not always work.
>=20
> Mainly just following advice from Intel on tuning for Atom:
>=20
>  =
https://software.intel.com/en-us/blogs/2013/05/28/why-should-i-update-gcc-=
x86-compiler-or-gcc-compiler-performance-on-intel-atom-from
>=20

eh benchmarks... thats a number game, take it with a grain of salt when =
feeding real world workloads to compiler.
you might be surprised to see that not using any fanciness in fact has =
more optimizing effects in real world.

> I didn't do my own benchmarks so maybe that flag doesn't help much,
> but it didn't cause a build failure with gcc 4.9.x.
>=20
>>>=20
>>> ( ie the default flags set by tune-core2.inc with one additional =
flag:
>>> -fschedule-insns )
>>>=20
>>> Problem is only seen with gcc 5.2
>>>=20
>>> Compiler error is:
>>>=20
>>> i686-rdk-linux-gcc -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 =
-mfpmath=3Dsse
>>> -fschedule-insns
>>> =
--sysroot=3D/home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/vbox32
>>> -O2 -pipe -g -feliminate-unused-debug-types -fstack-protector-strong
>>> -D_FORTIFY_SOURCE=3D2 -MT zlib/deflate.o -MD -Os -march=3Di386
>>> -falign-functions=3D0 -falign-jumps=3D0 -falign-labels=3D0 =
-ffast-math
>>> -fomit-frame-pointer -std=3Dgnu99 -m32 -mpreferred-stack-boundary=3D2
>>> -fno-stack-protector -fwrapv -freg-struct-return -fPIC =
-fno-exceptions
>>> -fno-asynchronous-unwind-tables -fno-strict-aliasing
>>> -falign-functions=3D0 -falign-jumps=3D0 -falign-labels=3D0 =
-falign-loops=3D0
>>> -g -D__COM32__ -D__FIRMWARE_BIOS__ -nostdinc -iwithprefix include =
-I.
>>> =
-I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/sysl=
inux/6.03-r0/syslinux-6.03/com32/lib/sys
>>> =
-I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/sysl=
inux/6.03-r0/syslinux-6.03/com32/lib/../include
>>> =
-I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/sysl=
inux/6.03-r0/syslinux-6.03/com32/include/sys
>>> =
-I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/sysl=
inux/6.03-r0/syslinux-6.03/core/include
>>> =
-I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/sysl=
inux/6.03-r0/syslinux-6.03/com32/lib/
>>> =
-I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/sysl=
inux/6.03-r0/syslinux-6.03/com32/lib/sys/module
>>> =
-I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/sysl=
inux/6.03-r0/syslinux-6.03/bios/com32/lib//../..
>>> -W -Wall -Wstrict-prototypes -Wpointer-arith -Wwrite-strings
>>> -Wstrict-prototypes -Winline -DDYNAMIC_CRC_TABLE -DPNG_NO_CONSOLE_IO
>>> -DPNG_NO_WRITE_SUPPORTED -DPNG_NO_MNG_FEATURES -DPNG_NO_READ_tIME
>>> -DPNG_NO_WRITE_tIME -mregparm=3D3 -DREGPARM=3D3 -c -o zlib/deflate.o
>>> =
/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/syslin=
ux/6.03-r0/syslinux-6.03/com32/lib/zlib/deflate.c
>>>=20
>>> =
/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/syslin=
ux/6.03-r0/syslinux-6.03/com32/lib/zlib/deflate.c:
>>> In function 'deflate':
>>> =
/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/syslin=
ux/6.03-r0/syslinux-6.03/com32/lib/zlib/deflate.c:892:1:
>>> error: unable to find a register to spill
>>> }
>>> ^
>>> =
/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/syslin=
ux/6.03-r0/syslinux-6.03/com32/lib/zlib/deflate.c:892:1:
>>> error: this is the insn:
>>> (insn 745 1859 1860 94 (set (reg:QI 995)
>>>       (mem/j:QI (plus:SI (reg/v/f:SI 965 [orig:676 strm ] [676])
>>>               (const_int 48 [0x30])) [0 strm_54(D)->adler+0 S1
>>> A32])) =
/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/syslin=
ux/6.03-r0/syslinux-6.03/com32/lib/zlib/deflate.c:775
>>> 86 {*movqi_internal}
>>>    (nil))
>>> =
/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/syslin=
ux/6.03-r0/syslinux-6.03/com32/lib/zlib/deflate.c:892:
>>> confused by earlier errors, bailing out
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20


--Apple-Mail=_9CEF5497-3286-4DE1-A257-BC779B0BCAD6
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYfUOkACgkQuwUzVZGdMxRvMACcDOpyMb+jWfQHFPy6c/B+9SDG
hMMAnREvvRZOosT5laOOkdXsPXZw9ipD
=PCub
-----END PGP SIGNATURE-----

--Apple-Mail=_9CEF5497-3286-4DE1-A257-BC779B0BCAD6--
