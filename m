Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5C64A6FF84
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 16:37:30 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id y2-v6so12925700wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 09:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=9S/ZyFoKQEP9bAoKh5YvjVx7dBeomX6XpK8pmnuWZug=;
	b=rRyWCi46pyQ7u7cDy6rNMJundQmuPqGwKeTnT1au7nb16WppfXYZeb9CBZzCvRBHMw
	0tv7+ZFFaAZ3MHfqqYd8OQKpjNaSssd5aAO0Bn2m7K2xWahSoP4V4l8gKPd2atimA9hg
	s1k4PDdBMsBjCypY2TUbcj8SjksfyebT2j1RyuoKlYNGigoWcNvcqUbq/xzqavDK1TZL
	YjPlw11JpOM884y1bHEr6I2D+Wjt+7Yel2TdWOpC8Ez3qJJIIXETtNUVlEEWk5JEuht/
	Y+Xx3yU2a2yBsMesEcfDMAfMBdON7amS/3GKI8AJ0jmUogIXgdatHRsFDEp14MeCuLHK
	xi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=9S/ZyFoKQEP9bAoKh5YvjVx7dBeomX6XpK8pmnuWZug=;
	b=gvw1z3h2tv669RrowEQLUw33ZxddW9m12wljuVl2NU+cIHLGdSDYcxHnidKSN/WGpd
	pmILNcgpg6R8MriTSswVKXnR5NbiUlvEdPTiWa3lM8RKYM0WSzJOvtqLBcguRlkZYGhz
	eQ5bsKrV5lN6BDwvFhNTHFvQDEhTI1ZyOjkDjoztq0i8OrpVE5zm5nzoVUV0szFyQAsv
	cNb79hyfdd1yNuRQTf44GcX+MjxMQoPjGfaZlztAVltqXM6+yMMw7MXO2p5vyzl7OsBI
	LT5xER1PhAU8lH7Tudalr7H4/3G3Sc9ncXlwI5AGQEQFVySZ/iQKSqt6pnxRI2s+HYcI
	Y++A==
X-Gm-Message-State: AOUpUlHcztTifyKMnxNaFHD/ljn8yx4DsftaVsVdOsvnZkkrOptSxUAa
	JVjZYHgJDGfIQ6gHaj2ZKDQ=
X-Google-Smtp-Source: AA+uWPzOB8NB4gis3jWDL0W82DAr4h7BkTSMXzeVamKjAi7RTzges3hdEA9PUGK2L2SZV+DAFb90YQ==
X-Received: by 2002:a1c:30d2:: with SMTP id
	w201-v6mr10776057wmw.47.1534264650957; 
	Tue, 14 Aug 2018 09:37:30 -0700 (PDT)
Received: from [10.42.8.207] (b2b-78-94-80-58.unitymedia.biz. [78.94.80.58])
	by smtp.gmail.com with ESMTPSA id
	w14-v6sm23369427wme.6.2018.08.14.09.37.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Aug 2018 09:37:29 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <C921E0A2-1F37-495E-982B-AB1FCEBBDB6D@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Tue, 14 Aug 2018 18:37:27 +0200
In-Reply-To: <6b107e710448191ecc7f638891dbf1837dbd8e8d.camel@linuxfoundation.org>
To: richard.purdie@linuxfoundation.org
References: <33B9AF0C-D9AF-4714-B28C-F45A66E398E7@gmail.com>
	<6b107e710448191ecc7f638891dbf1837dbd8e8d.camel@linuxfoundation.org>
X-Mailer: Apple Mail (2.3445.9.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] libxml-parser-perl: fix "...contains bad RPATH"
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
X-List-Received-Date: Tue, 14 Aug 2018 16:37:30 -0000
X-Groupsio-MsgNum: 114705
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D212ACF9-52B6-46F4-81CE-2402E507C037";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_D212ACF9-52B6-46F4-81CE-2402E507C037
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Richard,

I tried:

$ bitbake libxml-parser-perl-native nativesdk-libxml-parser-perl =
libxml-parser-perl

WARNING: Host distribution "ubuntu-18.04" has not been validated with =
this version of the build system; you may possibly experience unexpected =
failures. It is recommended that you use a tested distribution.
Loading cache: 100% =
|#########################################################################=
##########################################################################=
###################| Time: 0:00:00
Loaded 3693 entries from dependency cache.
Parsing recipes: 100% =
|#########################################################################=
##########################################################################=
#################| Time: 0:00:01
Parsing of 2421 .bb files complete (2417 cached, 4 parsed). 3685 =
targets, 100 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           =3D "1.39.0"
BUILD_SYS            =3D "x86_64-linux"
NATIVELSBSTRING      =3D "universal"
TARGET_SYS           =3D "arm-poky-linux-gnueabi"
MACHINE              =3D "wendy"
DISTRO               =3D "gpw"
DISTRO_VERSION       =3D "1.0.0"
TUNE_FEATURES        =3D "arm armv7a vfp neon callconvention-hard =
cortexa8"
TARGET_FPU           =3D "hard"
meta
meta-poky
meta-yocto-bsp       =3D =
"master:e82d2edca398c392309713577859724900b20190"
meta-oe
meta-python
meta-networking
meta-filesystems
meta-webserver       =3D =
"master:0691e134bf938e0712cf14d3a441bbba04727cea"
meta-cpan            =3D =
"master:7ddb7aae38ad9c8fc850026de6636fbe2a4aabdd"
meta-jens            =3D =
"master:92863f571a9b64aa5b6c6866db9eb0c8972a546f"
meta-gpw             =3D =
"master:8679df6ae6a22b15bd4127c838915dcf087bf614"

Initialising tasks: 100% =
|#########################################################################=
##########################################################################=
##############| Time: 0:00:00
Checking sstate mirror object availability: 100% =
|#########################################################################=
################################################################| Time: =
0:00:00
Sstate summary: Wanted 155 Found 0 Missed 310 Current 96 (0% match, 38% =
complete)
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 1007 tasks of which 669 didn't need to be =
rerun and all succeeded.

Unfortunately I don't have a SuSE based build machine nor a reasonable =
MIPS setup to test - but can you please describe what I need to do to =
reproduce that error?
Further: Ross complained regarding patch corruption by Apple Mail - I =
resent the patches on August, 8th (you replied that on August, 6th) =
using git-send-email. Did you fix the corrupted patch before?

I really want this thing being fixed - does it occurs anywhere else or =
can the reason the missing "--sysroot"?

When I restrict the additional sed commands to target only, how would =
that affect the nativesdk?

Cheers,
Jens

> Am 06.08.2018 um 17:22 schrieb richard.purdie@linuxfoundation.org:
>=20
> On Thu, 2018-08-02 at 10:21 +0200, Jens Rehsack wrote:
>> The perl distribution "XML-Parser" relies for configuration
>> on the tooling of Devel::CheckLib - which is not aware of
>> sysroot locations nor of reasonable compiler/link definitions
>> from outside.
>>=20
>> This causes
>>=20
>>    ERROR: libxml-parser-perl-2.44-r0 do_package_qa: QA Issue: package =
libxml-parser-perl contains bad RPATH =
${BUILDDIR}/tmp/work/core2-64-poky-linux/libxml-parser-perl/2.44-r0/recipe=
-sysroot/usr/lib in file =
${BUILDDIR}/tmp/work/core2-64-poky-linux/libxml-parser-perl/2.44-r0/packag=
es-split/libxml-parser-perl/usr/lib/perl/vendor_perl/5.24.4/auto/XML/Parse=
r/Expat/Expat.so
>>    package libxml-parser-perl contains bad RPATH =
${BUILDDIR}/tmp/work/core2-64-poky-linux/libxml-parser-perl/2.44-r0/recipe=
-sysroot/usr/lib in file =
${BUILDDIR}/tmp/work/core2-64-poky-linux/libxml-parser-perl/2.44-r0/packag=
es-split/libxml-parser-perl/usr/lib/perl/vendor_perl/5.24.4/auto/XML/Parse=
r/Expat/Expat.so [rpaths]
>>    ERROR: libxml-parser-perl-2.44-r0 do_package_qa: QA run found =
fatal errors. Please consider fixing them.
>>    ERROR: libxml-parser-perl-2.44-r0 do_package_qa: Function failed: =
do_package_qa
>>=20
>> It's strongly encouraged to the maintainer @toddr to rework the
>> toolchain for up to date environments.
>>=20
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>> ---
>> meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb | 6 +++++-
>> 1 file changed, 5 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb =
b/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
>> index c5e0ae6769..2ca8d506f4 100644
>> --- a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
>> +++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
>> @@ -19,7 +19,11 @@ inherit cpan ptest-perl
>> # fix up sub MakeMaker project as arguments don't get propagated =
though
>> # see https://rt.cpan.org/Public/Bug/Display.html?id=3D28632
>> do_configure_append() {
>> -	sed 's:--sysroot=3D.*\(\s\|$\):--sysroot=3D${STAGING_DIR_TARGET} =
:g' -i Makefile Expat/Makefile
>> +	sed -E \
>> +	    -e 's:--sysroot=3D.*\(\s\|$\):--sysroot=3D${STAGING_DIR_TARGET=
} :g' \
>> +	    -e 's:-L${STAGING_LIBDIR}::g' -e 's:-I${STAGING_INCDIR}::g' =
\
>> +	    -e 's:LD_RUN_PATH ?=3D ?"?[^"]*"?::g' \
>> +	    -i Makefile Expat/Makefile
>> 	sed 's:^FULL_AR =3D .*:FULL_AR =3D ${AR}:g' -i Expat/Makefile
>> 	# make sure these two do not build in parallel
>> 	sed 's!^$(INST_DYNAMIC):!$(INST_DYNAMIC): $(BOOTSTRAP)!' -i =
Expat/Makefile
>=20
> Hi Jens,
>=20
> Thanks for looking into this. Unfortunately its still not working, see
> the error below for the -native version.
>=20
> Cheers,
>=20
> Richard
>=20
>=20
> NOTE: recipe libtest-needs-perl-0.002005-r0: task do_compile: Started
> ERROR: libxml-parser-perl-native-2.44-r0 do_compile: oe_runmake failed
> ERROR: libxml-parser-perl-native-2.44-r0 do_compile: Function failed: =
do_compile (log file is located at =
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/buil=
d/tmp/work/x86_64-linux/libxml-parser-perl-native/2.44-r0/temp/log.do_comp=
ile.34225)
> NOTE: recipe librepo-1.8.1-r0: task do_patch: Succeeded
> NOTE: recipe libxml-namespacesupport-perl-1.12-r0: task do_configure: =
Succeeded
> ERROR: Logfile of failure stored in: =
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/buil=
d/tmp/work/x86_64-linux/libxml-parser-perl-native/2.44-r0/temp/log.do_comp=
ile.34225
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 28 =
PASTHRU_INC=3D-isystem/home/pokybuild/yocto-autobuilder/yocto-worker/night=
ly-mips-lsb/build/build/tmp/work/x86_64-linux/libxml-parser-perl-native/2.=
44-r0/recipe-sysroot-native/usr/include -O2 -pipe LD=3Dgcc
> | make[1]: Entering directory =
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/bui=
ld/tmp/work/x86_64-linux/libxml-parser-perl-native/2.44-r0/XML-Parser-2.44=
/Expat'
> | =
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/bui=
ld/tmp/work/x86_64-linux/libxml-parser-perl-native/2.44-r0/recipe-sysroot-=
native/usr/bin/perl-native/perl" =
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/bui=
ld/tmp/work/x86_64-linux/libxml-parser-perl-native/2.44-r0/recipe-sysroot-=
native/usr/lib/perl-native/perl/5.24.4/ExtUtils/xsubpp" -noprototypes =
-typemap =
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/bui=
ld/tmp/work/x86_64-linux/libxml-parser-perl-native/2.44-r0/recipe-sysroot-=
native/usr/lib/perl-native/perl/5.24.4/ExtUtils/typemap" -typemap =
"typemap"  Expat.xs > Expat.xsc && mv Expat.xsc Expat.c
> | gcc  -c =
-isystem/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/bu=
ild/build/tmp/work/x86_64-linux/libxml-parser-perl-native/2.44-r0/recipe-s=
ysroot-native/usr/include -O2 -pipe  -D_REENTRANT -D_GNU_SOURCE -fwrapv =
-fno-strict-aliasing -pipe -I/usr/local/include -D_LARGEFILE_SOURCE =
-D_FILE_OFFSET_BITS=3D64 -D_FORTIFY_SOURCE=3D2 -O2   -DVERSION=3D\"2.44\" =
-DXS_VERSION=3D\"2.44\" -fPIC =
"-I/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/b=
uild/tmp/work/x86_64-linux/libxml-parser-perl-native/2.44-r0/recipe-sysroo=
t-native/usr/lib/perl-native/perl/5.24.4/CORE"   Expat.c
> | cp Expat.pm ../blib/lib/XML/Parser/Expat.pm
> | Running Mkbootstrap for XML::Parser::Expat ()
> | cp Parser/Style/Debug.pm blib/lib/XML/Parser/Style/Debug.pm
> | cp Parser/LWPExternEnt.pl blib/lib/XML/Parser/LWPExternEnt.pl
> | cp Parser/Encodings/x-sjis-unicode.enc =
blib/lib/XML/Parser/Encodings/x-sjis-unicode.enc
> | cp Parser/Encodings/windows-1251.enc =
blib/lib/XML/Parser/Encodings/windows-1251.enc
> | cp Parser/Encodings/Japanese_Encodings.msg =
blib/lib/XML/Parser/Encodings/Japanese_Encodings.msg
> | cp Parser/Encodings/big5.enc blib/lib/XML/Parser/Encodings/big5.enc
> | cp Parser/Encodings/x-sjis-jisx0221.enc =
blib/lib/XML/Parser/Encodings/x-sjis-jisx0221.enc
> | cp Parser/Encodings/README blib/lib/XML/Parser/Encodings/README
> | cp Parser/Encodings/x-euc-jp-unicode.enc =
blib/lib/XML/Parser/Encodings/x-euc-jp-unicode.enc
> | cp Parser/Encodings/iso-8859-4.enc =
blib/lib/XML/Parser/Encodings/iso-8859-4.enc
> | cp Parser/Encodings/ibm866.enc =
blib/lib/XML/Parser/Encodings/ibm866.enc
> | cp Parser/Encodings/iso-8859-7.enc =
blib/lib/XML/Parser/Encodings/iso-8859-7.enc
> | cp Parser/Encodings/iso-8859-8.enc =
blib/lib/XML/Parser/Encodings/iso-8859-8.enc
> | cp Parser/Style/Subs.pm blib/lib/XML/Parser/Style/Subs.pm
> | cp Parser/Encodings/iso-8859-9.enc =
blib/lib/XML/Parser/Encodings/iso-8859-9.enc
> | cp Parser/Encodings/iso-8859-3.enc =
blib/lib/XML/Parser/Encodings/iso-8859-3.enc
> | cp Parser/Encodings/euc-kr.enc =
blib/lib/XML/Parser/Encodings/euc-kr.enc
> | cp Parser/Encodings/windows-1252.enc =
blib/lib/XML/Parser/Encodings/windows-1252.enc
> | cp Parser/Encodings/x-sjis-jdk117.enc =
blib/lib/XML/Parser/Encodings/x-sjis-jdk117.enc
> | cp Parser/Encodings/iso-8859-5.enc =
blib/lib/XML/Parser/Encodings/iso-8859-5.enc
> | cp Parser.pm blib/lib/XML/Parser.pm
> | cp Parser/Style/Tree.pm blib/lib/XML/Parser/Style/Tree.pm
> | cp Parser/Encodings/windows-1250.enc =
blib/lib/XML/Parser/Encodings/windows-1250.enc
> | cp Parser/Style/Stream.pm blib/lib/XML/Parser/Style/Stream.pm
> | cp Parser/Encodings/x-euc-jp-jisx0221.enc =
blib/lib/XML/Parser/Encodings/x-euc-jp-jisx0221.enc
> | cp Parser/Encodings/iso-8859-2.enc =
blib/lib/XML/Parser/Encodings/iso-8859-2.enc
> | cp Parser/Style/Objects.pm blib/lib/XML/Parser/Style/Objects.pm
> | cp Parser/Encodings/x-sjis-cp932.enc =
blib/lib/XML/Parser/Encodings/x-sjis-cp932.enc
> | cp Parser/Encodings/koi8-r.enc =
blib/lib/XML/Parser/Encodings/koi8-r.enc
> | cp Parser/Encodings/windows-1255.enc =
blib/lib/XML/Parser/Encodings/windows-1255.enc
> | chmod 644 "Expat.bs"
> | rm -f ../blib/arch/auto/XML/Parser/Expat/Expat.so
> | gcc   =
-L/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/bu=
ild/tmp/work/x86_64-linux/libxml-parser-perl-native/2.44-r0/recipe-sysroot=
-native/lib =
-Wl,-rpath-link,/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mip=
s-lsb/build/build/tmp/work/x86_64-linux/libxml-parser-perl-native/2.44-r0/=
recipe-sysroot-native/usr/lib =
-Wl,-rpath-link,/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mip=
s-lsb/build/build/tmp/work/x86_64-linux/libxml-parser-perl-native/2.44-r0/=
recipe-sysroot-native/lib =
-Wl,-rpath,/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb=
/build/build/tmp/work/x86_64-linux/libxml-parser-perl-native/2.44-r0/recip=
e-sysroot-native/usr/lib =
-Wl,-rpath,/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb=
/build/build/tmp/work/x86_64-linux/libxml-parser-perl-native/2.44-r0/recip=
e-sysroot-native/lib -Wl,-O1 -Wl,--allow-shlib-undefined =
-Wl,--dynamic-linker=3D/home/pokybuild/yocto-autobuilder/yocto-worker/nigh=
tly-arm/build/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-6=
4.so.2 -shared -L/usr/local/lib Expat.o  -o =
../blib/arch/auto/XML/Parser/Expat/Expat.so 	\
> |    -lexpat  	\
> |
> | =
/usr/lib64/gcc/x86_64-suse-linux/8/../../../../x86_64-suse-linux/bin/ld: =
cannot find -lexpat
> | collect2: error: ld returned 1 exit status
> | make[1]: *** [Makefile:462: =
../blib/arch/auto/XML/Parser/Expat/Expat.so] Error 1
> | make[1]: Leaving directory =
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/bui=
ld/tmp/work/x86_64-linux/libxml-parser-perl-native/2.44-r0/XML-Parser-2.44=
/Expat'
> | make: *** [Makefile:594: subdirs] Error 2
> | ERROR: oe_runmake failed
> | WARNING: =
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/buil=
d/tmp/work/x86_64-linux/libxml-parser-perl-native/2.44-r0/temp/run.do_comp=
ile.34225:1 exit 1 from 'exit 1'
> | ERROR: Function failed: do_compile (log file is located at =
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips-lsb/build/buil=
d/tmp/work/x86_64-linux/libxml-parser-perl-native/2.44-r0/temp/log.do_comp=
ile.34225)
> NOTE: recipe libxml-parser-perl-native-2.44-r0: task do_compile: =
Failed

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_D212ACF9-52B6-46F4-81CE-2402E507C037
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAltzBUcACgkQRJmWrtzl
Cp3Ing//SYvC4aTus/xmUHZJ9ebki32X4WMlN88T9XDA4daP4InYpCDol1kdQWN8
xB0x4FJ/ngn1Pr2QoohPOaBRNlFIUFoPFXB+FZJJUHiupxUaCZemtid8RLaqkEw0
/XfTrKlEaN7YABLc6EjwkE2neF8XNOsir4wjRzr4Ihkj7DtB6/cmcLFg7b9EwXiT
kYvxXy6VkuGBnfOatXGU01B6lKpkaaYSSOZKqkD0cz/6vjc0ONHBS54vUAsJVNGL
jiaLHAwCG0FD90kxbwuNAagA861T4Eoq3bjuiz4BeIMkS8bNTYK0CNzR5MzlxGky
qHbA3ZVZyaZoz3gVuQK3kdLXvoeQabbFUl+T18Nv6H74CnXUswCo/dLijSu+d4HP
QUGgM/+4Vswuu7QHGAAElrC9wAe/imhmBLZPY58r23duHn4b2/rXZcJi1fEl5N6G
0l09PJq7ib99BHtRtT+mWD7+gIHlPUAngu4beWvWtfPOIpicrPeCm3lThtJnueQR
wi3ufDtu0rBdUpImN0eDhVfSeEfRvz76TJ+ku3aFbNPnfoGWcQawAWqf9x9drwGq
WRpM/1Ty3n+50cpDFikifP+MWDRpeG+aSChzF10zLPR3eDeI0Obc3gDLoubOzuoS
1G9YyooJgB60VUmHsKswsaTb26hQlVEDK5g71NULZXclA3nXhJw=
=zC/J
-----END PGP SIGNATURE-----

--Apple-Mail=_D212ACF9-52B6-46F4-81CE-2402E507C037--
