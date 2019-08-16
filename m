Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 04B4F7F304
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 15:08:44 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id i4so6400623qtj.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 08:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8iquA0cHVh1SDy+OlSnlvlaPb61Wenu2JkEBUjbZd8Y=;
	b=pq+SqlTlumPUFqaPxCaAFtKgf0JcJvZZ5BmksGzM6IY7JTfL+lzOaFU5D6otwYx7BA
	Sl5ST9a2D9NO8g3ZgMn7xwkDjmwbCX+1qgcvY9U9+21phxbd2MQbFW7UgRP+luliSQfL
	p8ka5Zcrjuu102rQ2ky7qz/f431tKTD5KlP66aPhH34OFzikQ2gZcahG47GbcvZeroW2
	Iv5141CQZasODKb1uWOj7mYpoCYrm1wB3mjTBOB4LnzXzOzeyBgQahoz/kwmkfbf2Lvj
	WzIP7e6O1NYT3HxMPvDGsN5vkxQLKDQklUjmZkn9dAPxxU4U4oC0Z0vCNN8kovorTteK
	VLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8iquA0cHVh1SDy+OlSnlvlaPb61Wenu2JkEBUjbZd8Y=;
	b=N04xo5c7WZ3C6DCrKwQBUv1XcsArNx5/najctJvWMq+1ZojKlpuZSDchtVTSMF48A+
	FM8a613gIbtCjA4tx9Xb5JHhTbbyBfjSl2huA/6YQC6WRWID7bpXUSAFEnW32ghX/m7h
	a06cNALJheoP7l195kGKYwH2r5kGd2BYpLmwFpIT7fp4tHUhB6xDIvRcogyl3Dc5b9GX
	sqRHTu2t8MEXzRlg7rwovD8W9RXh1JLk+WqDcX9vBlj5V1lsiwQPz6n6u/mF/aB/AGJZ
	fnmluKoK6Yh+dhGirTxvE/rcPZ5bPmTw0LHaCRvVB19bChXc18WJGlNg6ID6sVPo3uEs
	ElLQ==
X-Gm-Message-State: APjAAAUqOtHExXbtuah63hdtTikCqz19BLfZwbJ0JlOR8cGo5cq9lNJF
	rI2Qj43tNSKTFR1zTVaErha7/rRyuigmnB0b65w=
X-Google-Smtp-Source: APXvYqxL435vgoNlLQ2WuA5lANYVEaFXHQnzVgzEMfMS161XLv6EQ4I1hEiHX2SNC87pO2GKugTBLSLodbwLYoPS3c4=
X-Received: by 2002:ac8:74d2:: with SMTP id j18mr654398qtr.378.1565968125475; 
	Fri, 16 Aug 2019 08:08:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190813152835.12578-1-raj.khem@gmail.com>
	<CA+chaQf6EnDHU=9U6q1a2_p=grcyWoy2epYXP+yaZ--qi0eH4Q@mail.gmail.com>
In-Reply-To: <CA+chaQf6EnDHU=9U6q1a2_p=grcyWoy2epYXP+yaZ--qi0eH4Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Aug 2019 08:08:18 -0700
Message-ID: <CAMKF1sqBFvdWb9XxGaUUZpcJh7zrcNkwBRLj7Ga3K35a+Fb2CA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] gcc-runtime: Move content from gcclibdir into libdir
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
X-List-Received-Date: Fri, 16 Aug 2019 15:08:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2019 at 5:00 AM Martin Jansa <martin.jansa@gmail.com> wrote=
:
>
> Hi,
>
> I have an app which includes omp.h from gomp, it used to find it without =
adding any -I for that (with just -fopenmp to enable openmp).
>
> Now the header file is included in RSS:
> lib32-recipe-sysroot/usr/lib/arm-oemllib32-linux-gnueabi/9.2.0/include/om=
p.h
> but no longer found in default search dirs.
>
> Is this expected or should gcc be adjusted to search for it automatically=
?
>

It should have adjusted automatically but these headers are searhed
relative to its own install and not sysroot reelative
so it might have to be addressed. Does it work with normal (
non-multilib ) case ?

> Looking at the default search paths I see:
>
> ignoring nonexistent directory "BUILD/work/machine-oemllib32-linux-gnueab=
i/lib32-component/2.0.0-76-r7/recipe-sysroot-native/usr/bin/arm-oemllib32-l=
inux-gnueabi/../../lib/arm-oemllib32-linux-gnueabi/gcc/arm-oemllib32-linux-=
gnueabi/9.2.0/../../../../../arm-oemllib32-linux-gnueabi/include"
> ignoring nonexistent directory "/not/exist/usr/include/c++/9.2.0"
> ignoring nonexistent directory "/not/exist/usr/include/c++/9.2.0/arm-oeml=
lib32-linux-gnueabi"
> ignoring nonexistent directory "/not/exist/usr/include/c++/9.2.0/backward=
"
> ignoring duplicate directory "BUILD/work/machine-oemllib32-linux-gnueabi/=
lib32-component/2.0.0-76-r7/recipe-sysroot-native/usr/bin/arm-oemllib32-lin=
ux-gnueabi/../../lib/arm-oemllib32-linux-gnueabi/gcc/../../../lib/arm-oemll=
ib32-linux-gnueabi/gcc/arm-oemllib32-linux-gnueabi/9.2.0/include"
> ignoring nonexistent directory "/not/exist/usr/lib/gcc/arm-oemllib32-linu=
x-gnueabi/9.2.0/include"
> ignoring nonexistent directory "/not/exist/usr/local/include"
> ignoring duplicate directory "BUILD/work/machine-oemllib32-linux-gnueabi/=
lib32-component/2.0.0-76-r7/recipe-sysroot-native/usr/bin/arm-oemllib32-lin=
ux-gnueabi/../../lib/arm-oemllib32-linux-gnueabi/gcc/../../../lib/arm-oemll=
ib32-linux-gnueabi/gcc/arm-oemllib32-linux-gnueabi/9.2.0/include-fixed"
> ignoring nonexistent directory "BUILD/work/machine-oemllib32-linux-gnueab=
i/lib32-component/2.0.0-76-r7/recipe-sysroot-native/usr/bin/arm-oemllib32-l=
inux-gnueabi/../../lib/arm-oemllib32-linux-gnueabi/gcc/../../../lib/arm-oem=
llib32-linux-gnueabi/gcc/arm-oemllib32-linux-gnueabi/9.2.0/../../../../../a=
rm-oemllib32-linux-gnueabi/include"
> ignoring nonexistent directory "/not/exist/usr/include"
> #include "..." search starts here:
> #include <...> search starts here:
>  BUILD/work/machine-oemllib32-linux-gnueabi/lib32-component/2.0.0-76-r7/r=
ecipe-sysroot-native/usr/bin/arm-oemllib32-linux-gnueabi/../../lib/arm-oeml=
lib32-linux-gnueabi/gcc/arm-oemllib32-linux-gnueabi/9.2.0/include
>  BUILD/work/machine-oemllib32-linux-gnueabi/lib32-component/2.0.0-76-r7/r=
ecipe-sysroot-native/usr/bin/arm-oemllib32-linux-gnueabi/../../lib/arm-oeml=
lib32-linux-gnueabi/gcc/arm-oemllib32-linux-gnueabi/9.2.0/include-fixed
> End of search list.
>
> On Tue, Aug 13, 2019 at 5:29 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> OE does not use the traditional /usr/lib/gcc prefix to store gcc-runtime
>> it basically is moved into libdir, however some newer files were
>> installed by newer versions of gcc especially libgomp ( omp.h openacc.h =
)
>> into gcclibdir, so we have content in both directories, this confuses
>> other tools which are trying to guess the gcc installation and its
>> runtime location, since now we have two directories, the tools either
>> choose one or other and we get inconsistent behavior, e.g. clang for
>> aarch64 uses /usr/lib but same clang for riscv64 chose /usr/lib/gcc
>>
>> This change ensures that OE ends up with single valid location for gcc
>> runtime files
>>
>> Move more common bits into common inc file
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> v2: Divert packaging to use new path in whole recipe
>>
>>  meta/recipes-devtools/gcc/gcc-runtime.inc    | 18 +++++++++++++++---
>>  meta/recipes-devtools/gcc/gcc-runtime_8.3.bb | 10 ----------
>>  meta/recipes-devtools/gcc/gcc-runtime_9.1.bb | 10 ----------
>>  3 files changed, 15 insertions(+), 23 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-de=
vtools/gcc/gcc-runtime.inc
>> index a5c2600d7f..22c1d78dd1 100644
>> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
>> @@ -17,6 +17,12 @@ EXTRA_OECONF_PATHS =3D "\
>>  EXTRA_OECONF_append_linuxstdbase =3D " --enable-clocale=3Dgnu"
>>  EXTRA_OECONF_append =3D " --cache-file=3D${B}/config.cache"
>>
>> +# Disable ifuncs for libatomic on arm conflicts -march/-mcpu
>> +EXTRA_OECONF_append_arm =3D " libat_cv_have_ifunc=3Dno "
>> +
>> +# Building with thumb enabled on armv6t fails
>> +ARM_INSTRUCTION_SET_armv6 =3D "arm"
>> +
>>  RUNTIMELIBITM =3D "libitm"
>>  RUNTIMELIBITM_arc =3D ""
>>  RUNTIMELIBITM_mipsarch =3D ""
>> @@ -77,6 +83,11 @@ do_install () {
>>                 cd ${B}/${TARGET_SYS}/$d/
>>                 oe_runmake 'DESTDIR=3D${D}' MULTIBUILDTOP=3D${B}/${TARGE=
T_SYS}/$d/ install
>>         done
>> +       if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include ]; then
>> +               install -d ${D}${libdir}/${TARGET_SYS}/${BINV}/include
>> +               mv ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/* ${D=
}${libdir}/${TARGET_SYS}/${BINV}/include
>> +               rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/${=
TARGET_SYS}/${BINV}/include
>> +       fi
>>         rm -rf ${D}${infodir}/libgomp.info ${D}${infodir}/dir
>>         rm -rf ${D}${infodir}/libitm.info ${D}${infodir}/dir
>>         rm -rf ${D}${infodir}/libquadmath.info ${D}${infodir}/dir
>> @@ -205,7 +216,7 @@ FILES_libssp-dev =3D "\
>>      ${libdir}/libssp*.so \
>>      ${libdir}/libssp*_nonshared.a \
>>      ${libdir}/libssp*.la \
>> -    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/ssp \
>> +    ${libdir}/${TARGET_SYS}/${BINV}/include/ssp \
>>  "
>>  SUMMARY_libssp-dev =3D "GNU stack smashing protection library - develop=
ment files"
>>  FILES_libssp-staticdev =3D "${libdir}/libssp*.a"
>> @@ -214,7 +225,7 @@ SUMMARY_libssp-staticdev =3D "GNU stack smashing pro=
tection library - static devel
>>  FILES_libquadmath =3D "${libdir}/libquadmath*.so.*"
>>  SUMMARY_libquadmath =3D "GNU quad-precision math library"
>>  FILES_libquadmath-dev =3D "\
>> -    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/quadmath* \
>> +    ${libdir}/${TARGET_SYS}/${BINV}/include/quadmath* \
>>      ${libdir}/libquadmath*.so \
>>      ${libdir}/libquadmath.la \
>>  "
>> @@ -239,7 +250,8 @@ FILES_libgomp-dev =3D "\
>>      ${libdir}/libgomp*${SOLIBSDEV} \
>>      ${libdir}/libgomp*.la \
>>      ${libdir}/libgomp.spec \
>> -    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
>> +    ${libdir}/${TARGET_SYS}/${BINV}/include/omp.h \
>> +    ${libdir}/${TARGET_SYS}/${BINV}/include/openacc.h \
>>  "
>>  SUMMARY_libgomp-dev =3D "GNU OpenMP parallel programming library - deve=
lopment files"
>>  FILES_libgomp-staticdev =3D "${libdir}/libgomp*.a"
>> diff --git a/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb b/meta/recipes=
-devtools/gcc/gcc-runtime_8.3.bb
>> index a1c7a76d0b..dd430b57eb 100644
>> --- a/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb
>> +++ b/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb
>> @@ -1,12 +1,2 @@
>>  require recipes-devtools/gcc/gcc-${PV}.inc
>>  require gcc-runtime.inc
>> -
>> -# Disable ifuncs for libatomic on arm conflicts -march/-mcpu
>> -EXTRA_OECONF_append_arm =3D " libat_cv_have_ifunc=3Dno "
>> -
>> -FILES_libgomp-dev +=3D "\
>> -    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \
>> -"
>> -
>> -# Building with thumb enabled on armv6t fails
>> -ARM_INSTRUCTION_SET_armv6 =3D "arm"
>> diff --git a/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb b/meta/recipes=
-devtools/gcc/gcc-runtime_9.1.bb
>> index a1c7a76d0b..dd430b57eb 100644
>> --- a/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb
>> +++ b/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb
>> @@ -1,12 +1,2 @@
>>  require recipes-devtools/gcc/gcc-${PV}.inc
>>  require gcc-runtime.inc
>> -
>> -# Disable ifuncs for libatomic on arm conflicts -march/-mcpu
>> -EXTRA_OECONF_append_arm =3D " libat_cv_have_ifunc=3Dno "
>> -
>> -FILES_libgomp-dev +=3D "\
>> -    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \
>> -"
>> -
>> -# Building with thumb enabled on armv6t fails
>> -ARM_INSTRUCTION_SET_armv6 =3D "arm"
>> --
>> 2.22.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

