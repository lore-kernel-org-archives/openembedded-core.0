Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 261C56007A;
	Sun, 23 Sep 2018 14:51:34 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id n6-v6so6355089qtl.4;
	Sun, 23 Sep 2018 07:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=gi0PywhnXn9jGV5Ib1m1oKKWzJKk2Rjyb+okviQqHow=;
	b=etdmCWXnuvjq9dfdDt3EcS5iyG760XQ6ARHkua/Sa4IFOZAgbBjvD3AENT6uBNEF9x
	N6cWj89WM2KmEjjifUPu1fGLH7qSkJDZn8jWioauj5L0Hw0/LvR2GH3cyswdBCRx3fYS
	TToEYaLD+tnLoGSigM+OERQXZYqB2jK7PjKNCwoUXZKCx4QQeEf9RzpfOhld4dkeOgHI
	HVVX5ZaY4RX1mWjsaoXovzJQQ7u/vzVV2zfLNO1pusSL959vU5D308oYbok+AxRh+kQb
	UBpUP1stsin8piBg6CZkXSTPcycRO7jDKwQi2wjJvLlXlygckecgQgJ8WzMmL5TMoWwY
	8rXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=gi0PywhnXn9jGV5Ib1m1oKKWzJKk2Rjyb+okviQqHow=;
	b=o6mGxdD/1IaZb09xtS1N8ktgcw1k6T+obdQHYsw/ukmOn558fYjbZ56KaRCFe/ZEA1
	wpJlY6Ce2cuNOOuk5xtsLbwIENCDsndpQxiv2Hkwlj7/lrIlOWckyniBtzT0BzLuihET
	VlD13K/LTECEaDujtvdJikYRG26XQ/1dtKyT8cewY58dztBI5Yb4mOdPLPcKxJVhpsJh
	77jKKaMG7hOSvngc4CVOaur+cicl/llgR1edrrudsbSpG2X8XsnEO2Rvo0SHvjuZn5Ui
	LdQ7G1ProHOPoizphiWkbi/fRIJHbDAmZ9ReITqz3EmDsQP9BdGnn6UN/PklxHPlyyZ3
	+N7w==
X-Gm-Message-State: ABuFfoiU4jqQNlLNjqewYQv5oX/oNaXM9EgjLTBa/fO+SyxIuhvR1ZXV
	yMGbt/GegD+xzvW/TfhxFabtBykB7Of4xRuJZBE=
X-Google-Smtp-Source: ACcGV62J2iP/udI5KAax2rxUNCBUivSl7vsJpFJF2oI3tzQB/9WxoruXAsAgxuH2yrF+lV+Mr6xZ8lmjAW8n9fQCyS4=
X-Received: by 2002:ac8:6c8:: with SMTP id j8-v6mr4202510qth.314.1537714294732;
	Sun, 23 Sep 2018 07:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <153754348673.9161.13447934313277658780@git.openembedded.org>
	<20180921152447.28A71234DE8@git.openembedded.org>
	<CA+chaQcHh7nAJy+k9ZmxB6ERm0r5woFVnUku_5RB0PiakE95CA@mail.gmail.com>
In-Reply-To: <CA+chaQcHh7nAJy+k9ZmxB6ERm0r5woFVnUku_5RB0PiakE95CA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Sep 2018 07:51:08 -0700
Message-ID: <CAMKF1sqK1EvH455QgBGcAuT5MpgWVaMFBu3i0db18mm_MZzjug@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-commits@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 02/45: fribidi: use Meson instead of autotools
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
X-List-Received-Date: Sun, 23 Sep 2018 14:51:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 23, 2018 at 2:20 AM Martin Jansa <martin.jansa@gmail.com> wrote=
:
>
> Was this one ever sent to ML? I haven't found it in the archives.
>
> With security flags enabled it fails on older hosts (e.g. Ubuntu 14.04 wi=
th gcc-4.8) now with:

I am seeing same failure on ubuntu 14.04 and centos7 boxes
this definitely is regression, its being not to right about using
TARGET_CFLAGS where it should not be using them

>
> DEBUG: Executing shell function do_compile
> [1/63] gcc -Igen.tab/gen.tab@@gen-unicode-version@exe -Igen.tab -I../frib=
idi-1.0.5/gen.tab -I. -I../fribidi-1.0.5/ -Ilib -I../fribidi-1.0.5/lib -pip=
e -D_FILE_OFFSET_BITS=3D64 -ansi -fvisibility=3Dhidden -O2 -g -feliminate-u=
nused-debug-types -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi3-webos=
-linux-gnueabi/fribidi/1.0.5-r0=3D/usr/src/debug/fribidi/1.0.5-r0 -fdebug-p=
refix-map=3DTOPDIR/BUILD/work/raspberrypi3-webos-linux-gnueabi/fribidi/1.0.=
5-r0/recipe-sysroot=3D -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi3-=
webos-linux-gnueabi/fribidi/1.0.5-r0/recipe-sysroot-native=3D -UHAVE_CONFIG=
_H -DHAVE_STRINGIZE -DDONT_HAVE_FRIBIDI_CONFIG_H -DHAVE_STDLIB_H -DHAVE_STR=
ING_H -DHAVE_STRINGS_H -DSTDC_HEADERS=3D1  -MD -MQ 'gen.tab/gen.tab@@gen-un=
icode-version@exe/gen-unicode-version.c.o' -MF 'gen.tab/gen.tab@@gen-unicod=
e-version@exe/gen-unicode-version.c.o.d' -o 'gen.tab/gen.tab@@gen-unicode-v=
ersion@exe/gen-unicode-version.c.o' -c ../fribidi-1.0.5/gen.tab/gen-unicode=
-version.c
> [2/63] gcc   -o gen.tab/gen-unicode-version 'gen.tab/gen.tab@@gen-unicode=
-version@exe/gen-unicode-version.c.o' -Wl,--no-undefined -Wl,--as-needed -O=
2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=3DTOPDIR/BUILD=
/work/raspberrypi3-webos-linux-gnueabi/fribidi/1.0.5-r0=3D/usr/src/debug/fr=
ibidi/1.0.5-r0 -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi3-webos-li=
nux-gnueabi/fribidi/1.0.5-r0/recipe-sysroot=3D -fdebug-prefix-map=3DTOPDIR/=
BUILD/work/raspberrypi3-webos-linux-gnueabi/fribidi/1.0.5-r0/recipe-sysroot=
-native=3D -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fstack-protector=
-strong -Wl,-z,relro,-z,now
> FAILED: gen.tab/gen-unicode-version
> gcc   -o gen.tab/gen-unicode-version 'gen.tab/gen.tab@@gen-unicode-versio=
n@exe/gen-unicode-version.c.o' -Wl,--no-undefined -Wl,--as-needed -O2 -pipe=
 -g -feliminate-unused-debug-types -fdebug-prefix-map=3DTOPDIR/BUILD/work/r=
aspberrypi3-webos-linux-gnueabi/fribidi/1.0.5-r0=3D/usr/src/debug/fribidi/1=
.0.5-r0 -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi3-webos-linux-gnu=
eabi/fribidi/1.0.5-r0/recipe-sysroot=3D -fdebug-prefix-map=3DTOPDIR/BUILD/w=
ork/raspberrypi3-webos-linux-gnueabi/fribidi/1.0.5-r0/recipe-sysroot-native=
=3D -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fstack-protector-strong=
 -Wl,-z,relro,-z,now
> gcc: error: unrecognized command line option =E2=80=98-fstack-protector-s=
trong=E2=80=99
> ninja: build stopped: subcommand failed.
> WARNING: exit code 1 from a shell command.
>
> Is meson too active in adding SECURITY_FLAGS even to native part of the b=
uild or should we just just remove -fstack-protector-strong completely for =
fribidi?
>
>
>
> On Fri, Sep 21, 2018 at 5:24 PM <git@git.openembedded.org> wrote:
>>
>> This is an automated email from the git hooks/post-receive script.
>>
>> rpurdie pushed a commit to branch master-next
>> in repository openembedded-core.
>>
>> commit d297f7ebf3f62528d055e1938a9693d6f3a61935
>> Author: Ross Burton <ross.burton@intel.com>
>> AuthorDate: Fri Sep 14 00:28:39 2018 +0100
>>
>>     fribidi: use Meson instead of autotools
>>
>>     Upstream is moving to Meson, so backport a patch to use that instead=
 of
>>     autotools.
>>
>>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta/recipes-support/fribidi/fribidi/meson.patch | 44 +++++++++++++++++=
+++++++
>>  meta/recipes-support/fribidi/fribidi_1.0.5.bb    |  8 ++---
>>  2 files changed, 47 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/recipes-support/fribidi/fribidi/meson.patch b/meta/rec=
ipes-support/fribidi/fribidi/meson.patch
>> new file mode 100644
>> index 0000000..8b3c4a9
>> --- /dev/null
>> +++ b/meta/recipes-support/fribidi/fribidi/meson.patch
>> @@ -0,0 +1,44 @@
>> +Upstream-Status: Backport
>> +Signed-off-by: Ross Burton <ross.burton@intel.com>
>> +
>> +From f5feb6c599adb52f24656f8589868039b0d14272 Mon Sep 17 00:00:00 2001
>> +From: Heiko Becker <heirecka@exherbo.org>
>> +Date: Fri, 7 Sep 2018 20:57:11 +0200
>> +Subject: [PATCH] Build generator executables natively
>> +
>> +They are run during the build and not installed in the end. Without
>> +this one gets the following error from meson: "ERROR: Can not use
>> +target gen-unicode-version as a generator because it is cross-built
>> +and no exe wrapper is defined. You might want to set it to native
>> +instead."
>> +
>> +Closes #87.
>> +
>> +---
>> + gen.tab/meson.build | 6 ++++--
>> + 1 file changed, 4 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/gen.tab/meson.build b/gen.tab/meson.build
>> +index 6006d98..8c21e98 100644
>> +--- a/gen.tab/meson.build
>> ++++ b/gen.tab/meson.build
>> +@@ -33,7 +33,8 @@ gen_unicode_version =3D executable('gen-unicode-versi=
on',
>> +   'gen-unicode-version.c',
>> +   include_directories: incs,
>> +   c_args: native_args,
>> +-  install: false)
>> ++  install: false,
>> ++  native: true)
>> +
>> + fribidi_unicode_version_h =3D custom_target('fribidi-unicode-version.h=
',
>> +   input: files('unidata/ReadMe.txt', 'unidata/BidiMirroring.txt'),
>> +@@ -67,7 +68,8 @@ foreach tab : tabs
>> +     gen_prog_src, 'packtab.c',
>> +     include_directories: incs,
>> +     c_args: native_args,
>> +-    install: false)
>> ++    install: false,
>> ++    native: true)
>> +
>> +   tab_inc_file =3D custom_target(gen_prog_name,
>> +     input: gen_prog_inputs,
>> diff --git a/meta/recipes-support/fribidi/fribidi_1.0.5.bb b/meta/recipe=
s-support/fribidi/fribidi_1.0.5.bb
>> index 303ccb7..63b2da6 100644
>> --- a/meta/recipes-support/fribidi/fribidi_1.0.5.bb
>> +++ b/meta/recipes-support/fribidi/fribidi_1.0.5.bb
>> @@ -3,16 +3,14 @@ SECTION =3D "libs"
>>  LICENSE =3D "LGPLv2.1+"
>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b91076e631dd8edb74247=
69c7"
>>
>> -SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/=
${BP}.tar.bz2"
>> +SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/=
${BP}.tar.bz2 \
>> +           file://meson.patch"
>>  SRC_URI[md5sum] =3D "0f97f65038545340316ec0f4bd53df0b"
>>  SRC_URI[sha256sum] =3D "6a64f2a687f5c4f203a46fa659f43dd43d1f8b845df8d72=
3107e8a7e6158e4ce"
>>
>>  UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/${BPN}/releases"
>>
>> -inherit autotools lib_package pkgconfig
>> -
>> -# TODO use Meson instead of autotools when
>> -# https://github.com/fribidi/fribidi/issues/87 is solved
>> +inherit meson lib_package pkgconfig
>>
>>  CVE_PRODUCT =3D "gnu_fribidi"
>>
>>
>> --
>> To stop receiving notification emails like this one, please contact
>> the administrator of this repository.
>> --
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

