Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 982106067D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 02:16:06 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id x3so2262625pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 19:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=ViIcwqbRZT2IgGBn3M1XMLgGfjko1sixyxzmtyoOrJg=;
	b=db4V4iXRdVjz5Cbtv8K0TH577PSNeiFwxEW765uNi9NGHWE6XmxFUWXpwIh3HjpodW
	P2Yy1PlUxixOwzFi/bxuJnxWMCu0BATOTOXP2vtcVxgQxNxCruiR1yBPkO43a1O8TKJJ
	AW1LY4nCXCxJmgbVC77Jp/zi5APpIUFvUkbtv0upOjfT4gICYiisDzeMiKweRvUZs7XJ
	9lSzMhPoggixHQKTYQ9Olr6O0WnrWKNsoWzaaPL8RTAgMsC6xfjI4/qvgGdbnE/YVq5C
	9eY8VJ38lsowfMM39VI7J6OVs2vQmDWa1RPv6eAHPovc7cCIS1SIhC1rFqoYzsdqUjt3
	EEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=ViIcwqbRZT2IgGBn3M1XMLgGfjko1sixyxzmtyoOrJg=;
	b=ipmp3YxMoCB2lH/WksJ5YFTQ5z7IVz0tAOHFzepkVKbaaZ13K6WQHHbK0yClh9OGi9
	YAwKJnn5Yx3teLqwv9La22PqmhAYycahoYTLRfmPXR8f4TZAP2CTmIbKpN80l4cbHMy9
	Yz8CWm3ek8RRkbLdghqYOoIGoI2Q6UDi0Shwnex7ULX0WaVBPGkOpDbN8/lwVsbxP9i5
	kmIc7/vysjdamvG5S+GjLBuASY3ggSwa9TYZfwhtfhPncByU2S1leestdcHHQQazwybP
	ctUO40K33NW+XKPpyGNbx7xYaooKZdN3j8imX9NL5ZCNqhKJLxF34H6g5UdGEM0Y+zIL
	wIzg==
X-Gm-Message-State: AD7BkJJOImSIYbEQneh+vSifs5XK7iQCAGlG6Y7pni2pOFC9bEs6lzketUiNY/IU5h5Vaw==
X-Received: by 10.98.13.88 with SMTP id v85mr47473782pfi.150.1459217767009;
	Mon, 28 Mar 2016 19:16:07 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:8dbc:4c41:b29b:dc4?
	([2601:646:8800:5a9a:8dbc:4c41:b29b:dc4])
	by smtp.gmail.com with ESMTPSA id
	h85sm38559334pfj.52.2016.03.28.19.16.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Mar 2016 19:16:05 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <56F9DC9A.6070409@windriver.com>
Date: Mon, 28 Mar 2016 19:16:00 -0700
Message-Id: <39E0EE4C-3FCD-4FAC-94F2-0B4F3BED8F2F@gmail.com>
References: <cover.1455955403.git.raj.khem@gmail.com>
	<f444175f17a8fd5aea09aad8674c7b26d2ee6fd5.1455955403.git.raj.khem@gmail.com>
	<CAJ86T=VoDWL_Os8yAFHKpTfWTv8Q-uTpu8TEtwQc-7+-dWKFuA@mail.gmail.com>
	<56F9DC9A.6070409@windriver.com>
To: ChenQi <Qi.Chen@windriver.com>
X-Mailer: Apple Mail (2.3124)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] glibc: Upgrade to 2.23
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
X-List-Received-Date: Tue, 29 Mar 2016 02:16:06 -0000
X-Groupsio-MsgNum: 80235
Content-Type: multipart/signed;
	boundary="Apple-Mail=_130DB5C7-263E-4527-A159-EFDCD19659C2";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_130DB5C7-263E-4527-A159-EFDCD19659C2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


> On Mar 28, 2016, at 6:38 PM, ChenQi <Qi.Chen@windriver.com> wrote:
>=20
> On 02/23/2016 06:31 AM, Andre McCurdy wrote:
>> On Sat, Feb 20, 2016 at 12:07 AM, Khem Raj <raj.khem@gmail.com> =
wrote:
>>> Drop kconfig and options-group support
>>> Forward port cross-localedef support
>>> Assume ssp support in libc when building gcc-initial
>> Breaks for me when building for x86 with -Os (building with
>> -O1/-O2/-O3 are all OK):
>>=20
>> i686-rdk-linux-gcc  -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 =
-mfpmath=3Dsse
>> =
--sysroot=3D/home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/vbox32-tc=
bootstrap
>> ../sysdeps/unix/sysv/linux/posix_fallocate.c -c -std=3Dgnu11
>> -fgnu89-inline  -Os -Wall -Werror -Wno-error -Wundef -Wwrite-strings
>> =
-fdebug-prefix-map=3D/home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/=
vbox32=3D
>> =
-fdebug-prefix-map=3D/home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/=
x86_64-linux=3D
>> =
-fdebug-prefix-map=3D/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core=
2-32-rdk-linux/glibc/2.23-r0/build-i686-rdk-linux=3D/usr/src/glibc
>> =
-fdebug-prefix-map=3D/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core=
2-32-rdk-linux/glibc/2.23-r0/git=3D/usr/src/glibc
>> -feliminate-unused-debug-types -fmerge-all-constants -frounding-math
>> -g -pipe -Wstrict-prototypes -Wold-style-definition   -Wa,-mtune=3Di686=

>> -fexceptions  -ftls-model=3Dinitial-exec      -I../include
>> =
-I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glib=
c/2.23-r0/build-i686-rdk-linux/io
>>  =
-I/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glib=
c/2.23-r0/build-i686-rdk-linux
>>  -I../sysdeps/unix/sysv/linux/i386/i686  -I../sysdeps/i386/i686/nptl
>> -I../sysdeps/unix/sysv/linux/i386  -I../sysdeps/unix/sysv/linux/x86
>> -I../sysdeps/i386/nptl  -I../sysdeps/unix/sysv/linux/include
>> -I../sysdeps/unix/sysv/linux  -I../sysdeps/nptl  -I../sysdeps/pthread
>> -I../sysdeps/gnu  -I../sysdeps/unix/inet  -I../sysdeps/unix/sysv
>> -I../sysdeps/unix/i386  -I../sysdeps/unix  -I../sysdeps/posix
>> -I../sysdeps/i386/i686/fpu/multiarch  -I../sysdeps/i386/i686/fpu
>> -I../sysdeps/i386/i686/multiarch  -I../sysdeps/i386/i686
>> -I../sysdeps/i386/fpu  -I../sysdeps/x86/fpu/include
>> -I../sysdeps/x86/fpu  -I../sysdeps/i386  -I../sysdeps/x86
>> -I../sysdeps/wordsize-32  -I../sysdeps/ieee754/ldbl-96
>> -I../sysdeps/ieee754/dbl-64  -I../sysdeps/ieee754/flt-32
>> -I../sysdeps/ieee754  -I../sysdeps/generic  -I.. -I../libio -I.
>> -nostdinc -isystem
>> =
/home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/x86_64-linux/usr/bin/=
i686-rdk-linux.gcc-cross-initial-i686/../../lib/i686-rdk-linux.gcc-cross-i=
nitial-i686/gcc/i686-rdk-linux/5.3.0/include
>> -isystem =
/home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/x86_64-linux/usr/bin/=
i686-rdk-linux.gcc-cross-initial-i686/../../lib/i686-rdk-linux.gcc-cross-i=
nitial-i686/gcc/i686-rdk-linux/5.3.0/include-fixed
>> -isystem =
/home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/vbox32/usr/include
>>  -D_LIBC_REENTRANT -include
>> =
/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/=
2.23-r0/build-i686-rdk-linux/libc-modules.h
>> -DMODULE_NAME=3Dlibc -include ../include/libc-symbols.h       -o
>> =
/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/=
2.23-r0/build-i686-rdk-linux/io/posix_fallocate.o
>> -MD -MP -MF =
/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/=
2.23-r0/build-i686-rdk-linux/io/posix_fallocate.o.dt
>> -MT =
/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/glibc/=
2.23-r0/build-i686-rdk-linux/io/posix_fallocate.o
>> ../sysdeps/unix/sysv/linux/posix_fallocate.c: In function =
'posix_fallocate':
>> ../sysdeps/unix/sysv/linux/posix_fallocate.c:39:1: error: bp cannot =
be
>> used in asm here
>>  }
>>  ^
>> ../sysdeps/unix/sysv/linux/posix_fallocate.c:39:1: error: bp cannot =
be
>> used in asm here
>=20
>=20
> Hi All,
>=20
> For the latest master, if 'DEBUG_BUILD' is enabled, the above error =
appers.
>=20
> | ../sysdeps/unix/sysv/linux/posix_fallocate.c: In function =
'posix_fallocate':
> | ../sysdeps/unix/sysv/linux/posix_fallocate.c:39:1: error: bp cannot =
be used in asm here
> |  }
> |  ^
>=20
> The problem could be reproduced if we add in local.conf the following =
line.
> DEBUG_BUILD =3D "1"
>=20
> Do you have any idea what's going on there?

posix_fallocate is calling a syscall helper with 6 argument, and there =
has been i386 specific optimization added to glibc
which checks for gcc version and if its >=3D 5.0 then relies upon gcc to =
do right thing when spilling ebp, and switched to using
inline syscall handler. But this spill is working/tested with -O2 and =
everything else is just a bonus if it works. Can you try this
patch to glibc  ?


--- a/sysdeps/unix/sysv/linux/i386/sysdep.h
+++ b/sysdeps/unix/sysv/linux/i386/sysdep.h
@@ -46,7 +46,7 @@
    to compile glibc.  Disable GCC 5 optimization when compiling for
    profiling since asm ("ebp") can't be used to put the 6th argument
    in %ebp for syscall.  */
-#if __GNUC_PREREQ (5,0) && !defined PROF
+#if __GNUC_PREREQ (5,0) && !defined PROF && !defined __OPTIMIZE_SIZE__
 # define OPTIMIZE_FOR_GCC_5
 #endif





--Apple-Mail=_130DB5C7-263E-4527-A159-EFDCD19659C2
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlb55WQACgkQuwUzVZGdMxQYYwCfaetsJxTjP4MO/AUEptd6ewSK
1AwAoIJDlXpfN8qlgCL8H0yrN74sJmf5
=UB5Q
-----END PGP SIGNATURE-----

--Apple-Mail=_130DB5C7-263E-4527-A159-EFDCD19659C2--
