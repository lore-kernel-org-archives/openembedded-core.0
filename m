Return-Path: <victor.kamensky7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5936C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 21:27:32 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.1159.1702502850213923902
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 13:27:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ITU5pgBX;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: victor.kamensky7@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-28ade227850so1540619a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 13:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702502850; x=1703107650; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlJzH1BRA37HC8TPNA9ZXSPfyQNtVLdKYIyJUFNSGPw=;
        b=ITU5pgBXOFWJ/xDqPs/lxmUvb1iYHG22qxGzuU2RKjNpbUpU4199tIB88Sd71jAqWb
         J2xQVBfCfQ/YYK3/dNzQytaO+78aGreh7Mu4kQQ7vTUZTB5UmPfCmKTWjw7pw2g66ffo
         xtOsErfqG3IA3l69zmVKYZ6M/E2jX3pa6OjIYvFmxifx5uVu9/1TVL4ILn9zJQh7UsNf
         VvQslolE7fHGkUqkOCQBnEYMX30jRczyb1qIJHYPQ71sv0/SrdzF9di9RfgiH138uZfm
         wBLgm+7Xb4ZXtPq5Xxq5Ukvtkc4Fk+bVn1478kz+O6ArqGqiaSUTXM+Ql8VXAsQe74yB
         xDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702502850; x=1703107650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlJzH1BRA37HC8TPNA9ZXSPfyQNtVLdKYIyJUFNSGPw=;
        b=ig47ZK8crWcSdR8XI/hFBjufdJWjvfy+1iI419yuVh/mUZMdLqAUQv22lNxlQobO9P
         6n1EAKUpXmFxGJeKD/BSXbd5YWkgR8LOTjxFoR1jHV2uM98MqusWKuv+2aIYW2StPgYz
         eOPofVQWn6mziF1U4SAEcVGdTNbvWKMSFgoc4q1ovHakTHldSxwlyl0BoAiRul7WUtsV
         aSqweh0QGlKrl2v/XL0+6srmbRJ3Y9G5TrT4pH8Tws2M0rd8pZHlE3rz2UL/aFMlqHQI
         9tb/34deND8LyoT5GbpIk03epSL2NZToELZGJHMViWg2no5jIywfWp9peU+rvv14p17C
         myvg==
X-Gm-Message-State: AOJu0Yz68lAvgeuU2KO/3i61Felv1OwNax1xLTVSzWT2v0RLW+CKieR3
	FOBwvRMY4zDDeAD3WPp5gQddHxp1sb+1u+Qx7Yo=
X-Google-Smtp-Source: AGHT+IERiT56g95KhhNtepPcJknFwS2QxD7nmrH1UtnDWADpPincljaCnCKlKc/WICLCTKQ1AQo6EhElPqEOv3MNlPY=
X-Received: by 2002:a17:90b:2b47:b0:285:b78a:dbce with SMTP id
 rr7-20020a17090b2b4700b00285b78adbcemr6879207pjb.37.1702502849490; Wed, 13
 Dec 2023 13:27:29 -0800 (PST)
MIME-Version: 1.0
References: <20231205063249.3433-1-victor.kamensky7@gmail.com> <CA+chaQeUbSV49rXVnbfbQ3f_5z8b2iizZxh1_YVogWWpwL255g@mail.gmail.com>
In-Reply-To: <CA+chaQeUbSV49rXVnbfbQ3f_5z8b2iizZxh1_YVogWWpwL255g@mail.gmail.com>
From: Victor Kamensky <victor.kamensky7@gmail.com>
Date: Wed, 13 Dec 2023 13:27:18 -0800
Message-ID: <CAHSqoWuSCbwhKKpBCnMxp4TxH4Yi0gyujPYXZpW6FFB-UtDywg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] systemtap: upgrade 4.9 -> 5.0
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 21:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192328

Hi Martin,

Sorry about that. I am looking at it now.

Do I understand it correctly to reproduce the issue: I need to remove
debuginfod (as it is currently on
by default) from DISTO_FEATURES and remove debuginfod from elfutils
PACKAGECONFIG defaults?

Thanks,
Victor

On Sun, Dec 10, 2023 at 3:16=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> This seems to be causing:
> ../git/util.cxx:51:10: fatal error: elfutils/debuginfod.h: No such file o=
r directory
>    51 | #include <elfutils/debuginfod.h>
>       |          ^~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[2]: *** [Makefile:1389: stap-util.o] Error 1
>
> on some systems.
>
> Looks like with https://sourceware.org/git/?p=3Dsystemtap.git;a=3Dcommit;=
h=3D2e67b053e3796ee7cf29a39f9698729b52078406 it now enables debuginfod ("AC=
_MSG_RESULT([yes])" _after_ the PKG_CHECK_MODULES now seems wrong).
>
> log.do_configure:
> checking whether to use debuginfod... checking for debuginfod... no
> yes
> checking for debuginfod_find_metadata in -ldebuginfod... no
>
> build $ grep DEBUGINFO config.h
> #define HAVE_LIBDEBUGINFOD 1
>
> config.log (see the strange result yes):
> configure:12213: checking whether to use debuginfod
> configure:12228: checking for debuginfod
> configure:12235: $PKG_CONFIG --exists --print-errors "libdebuginfod >=3D =
0.179"
> Package libdebuginfod was not found in the pkg-config search path.
> Perhaps you should add the directory containing `libdebuginfod.pc'
> to the PKG_CONFIG_PATH environment variable
> No package 'libdebuginfod' found
> configure:12238: $? =3D 1
> configure:12252: $PKG_CONFIG --exists --print-errors "libdebuginfod >=3D =
0.179"
> Package libdebuginfod was not found in the pkg-config search path.
> Perhaps you should add the directory containing `libdebuginfod.pc'
> to the PKG_CONFIG_PATH environment variable
> No package 'libdebuginfod' found
> configure:12255: $? =3D 1
> configure:12269: result: no
> No package 'libdebuginfod' found
> configure:12304: result: yes
> configure:12315: checking for debuginfod_find_metadata in -ldebuginfod
> configure:12344: ccache aarch64-webos-linux-gcc  -mcpu=3Dcortex-a72 -marc=
h=3Darmv8-a+crc -mbranch-protection=3Dstandard -fstack-protector-strong  -O=
2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-securit=
y -Werror=3Dreturn-type --sysroot=3D/OE/lge/build/webos/scarthgap/BUILD/wor=
k/raspberrypi4_64-webos-linux/systemtap/5.0/recipe-sysroot -o conftest  -O2=
 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix=
-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64-webos-linux=
/systemtap/5.0/git=3D/usr/src/debug/systemtap/5.0  -fdebug-prefix-map=3D/OE=
/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64-webos-linux/systemtap=
/5.0/git=3D/usr/src/debug/systemtap/5.0  -fmacro-prefix-map=3D/OE/lge/build=
/webos/scarthgap/BUILD/work/raspberrypi4_64-webos-linux/systemtap/5.0/build=
=3D/usr/src/debug/systemtap/5.0  -fdebug-prefix-map=3D/OE/lge/build/webos/s=
carthgap/BUILD/work/raspberrypi4_64-webos-linux/systemtap/5.0/build=3D/usr/=
src/debug/systemtap/5.0  -fdebug-prefix-map=3D/OE/lge/build/webos/scarthgap=
/BUILD/work/raspberrypi4_64-webos-linux/systemtap/5.0/recipe-sysroot=3D  -f=
macro-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64=
-webos-linux/systemtap/5.0/recipe-sysroot=3D  -fdebug-prefix-map=3D/OE/lge/=
build/webos/scarthgap/BUILD/work/raspberrypi4_64-webos-linux/systemtap/5.0/=
recipe-sysroot-native=3D    -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed =
-fcanon-prefix-map  -fmacro-prefix-map=3D/OE/lge/build/webos/scarthgap/BUIL=
D/work/raspberrypi4_64-webos-linux/systemtap/5.0/git=3D/usr/src/debug/syste=
mtap/5.0  -fdebug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/ras=
pberrypi4_64-webos-linux/systemtap/5.0/git=3D/usr/src/debug/systemtap/5.0  =
-fmacro-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_=
64-webos-linux/systemtap/5.0/build=3D/usr/src/debug/systemtap/5.0  -fdebug-=
prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64-webos=
-linux/systemtap/5.0/build=3D/usr/src/debug/systemtap/5.0  -fdebug-prefix-m=
ap=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64-webos-linux/s=
ystemtap/5.0/recipe-sysroot=3D  -fmacro-prefix-map=3D/OE/lge/build/webos/sc=
arthgap/BUILD/work/raspberrypi4_64-webos-linux/systemtap/5.0/recipe-sysroot=
=3D  -fdebug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberr=
ypi4_64-webos-linux/systemtap/5.0/recipe-sysroot-native=3D  -Wl,-z,relro,-z=
,now  conftest.c -ldebuginfod   >&5
> /OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64-webos-linux/syst=
emtap/5.0/recipe-sysroot-native/usr/bin/aarch64-webos-linux/../../libexec/a=
arch64-webos-linux/gcc/aarch64-webos-linux/13.2.0/ld: cannot find -ldebugin=
fod: No such file or directory
> collect2: error: ld returned 1 exit status
>
> With debuginfod in DISTRO_FEATURES (which is included by default) and *de=
buginfod PACKAGECONFIG enabled in elfutils (also by default based on DISTRO=
_FEAUTRES) this builds OK.
>
> Regards,
>
>
> On Tue, Dec 5, 2023 at 7:33=E2=80=AFAM Victor Kamensky <victor.kamensky7@=
gmail.com> wrote:
>>
>> Similar to 4.9 release, in 5.0 release release-5.0 tag is off any branch=
,
>> release-5.0a tag e72dc118e563c645d93a1a2d771e8d90e8fec1ae is on the mast=
er
>> branch. Use this value for SRCREV and add catch up patch,
>> 0001-prerelease-datestamp-fixes.patch, to bring source up to release-5.0=
 tag
>> level. Remove 0001-prerelease-datestamp-fixes.patch in next upgrade.
>>
>> Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
>> ---
>>  .../0001-prerelease-datestamp-fixes.patch     | 23 ++++++++++++
>>  .../systemtap/0001-release-date-fix.patch     | 37 -------------------
>>  .../systemtap/systemtap_git.inc               |  6 +--
>>  3 files changed, 26 insertions(+), 40 deletions(-)
>>  create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-prerele=
ase-datestamp-fixes.patch
>>  delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-release=
-date-fix.patch
>>
>> diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-prerelease-dat=
estamp-fixes.patch b/meta/recipes-kernel/systemtap/systemtap/0001-prereleas=
e-datestamp-fixes.patch
>> new file mode 100644
>> index 0000000000..afdc10a3fe
>> --- /dev/null
>> +++ b/meta/recipes-kernel/systemtap/systemtap/0001-prerelease-datestamp-=
fixes.patch
>> @@ -0,0 +1,23 @@
>> +From cfc2c1d53924face11e3fab78ded61c359778eb9 Mon Sep 17 00:00:00 2001
>> +From: "Frank Ch. Eigler" <fche@redhat.com>
>> +Date: Sat, 4 Nov 2023 12:19:59 -0400
>> +Subject: [PATCH] prerelease datestamp fixes
>> +
>> +Upstream-Status: Backport
>> +---
>> + NEWS | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/NEWS b/NEWS
>> +index c7f31e8b7..f0f9056c4 100644
>> +--- a/NEWS
>> ++++ b/NEWS
>> +@@ -1,4 +1,4 @@
>> +-* What's new in version 5.0, 2023-11-03
>> ++* What's new in version 5.0, 2023-11-04
>> +
>> + - Performance improvements in uprobe registration and module startup.
>> +
>> +--
>> +2.31.1
>> +
>> diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-release-date-f=
ix.patch b/meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.pa=
tch
>> deleted file mode 100644
>> index 3dcb369ec3..0000000000
>> --- a/meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.patc=
h
>> +++ /dev/null
>> @@ -1,37 +0,0 @@
>> -From ebb424eee5599fcc131901c0d82d0bfc0d2f57ab Mon Sep 17 00:00:00 2001
>> -From: "Frank Ch. Eigler" <fche@redhat.com>
>> -Date: Fri, 28 Apr 2023 13:51:27 -0400
>> -Subject: [PATCH] release date fix
>> -
>> -Upstream-Status: Backport
>> ----
>> - NEWS           | 2 +-
>> - systemtap.spec | 2 +-
>> - 2 files changed, 2 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/NEWS b/NEWS
>> -index 695bc990c..46859e304 100644
>> ---- a/NEWS
>> -+++ b/NEWS
>> -@@ -1,4 +1,4 @@
>> --* What's new in version 4.9, 2023-04-27
>> -+* What's new in version 4.9, 2023-04-28
>> -
>> - - ISystemtap: the new interactive systemtap jupyter kernel. This provi=
des
>> -   a simple GUI for writing/running Systemtap scripts in an easy, incre=
mental
>> -diff --git a/systemtap.spec b/systemtap.spec
>> -index 59814f112..fd8023264 100644
>> ---- a/systemtap.spec
>> -+++ b/systemtap.spec
>> -@@ -1307,7 +1307,7 @@ exit 0
>> -
>> - # PRERELEASE
>> - %changelog
>> --* Thu Apr 27 2023 Frank Ch. Eigler <fche@redhat.com> - 4.9-1
>> -+* Fri Apr 28 2023 Frank Ch. Eigler <fche@redhat.com> - 4.9-1
>> - - Upstream release, see wiki page below for detailed notes.
>> -   https://sourceware.org/systemtap/wiki/SystemTapReleases
>> -
>> ---
>> -2.40.1
>> -
>> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/reci=
pes-kernel/systemtap/systemtap_git.inc
>> index de3750ff04..bc2a9ff434 100644
>> --- a/meta/recipes-kernel/systemtap/systemtap_git.inc
>> +++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
>> @@ -1,13 +1,13 @@
>>  LICENSE =3D "GPL-2.0-only"
>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a=
4263"
>> -SRCREV =3D "418f0a45ca4473491385b5c7eef777607bbdb3b7"
>> -PV =3D "4.9"
>> +SRCREV =3D "e72dc118e563c645d93a1a2d771e8d90e8fec1ae"
>> +PV =3D "5.0"
>>
>>  SRC_URI =3D "git://sourceware.org/git/systemtap.git;branch=3Dmaster;pro=
tocol=3Dhttps \
>>             file://0001-Do-not-let-configure-write-a-python-location-int=
o-th.patch \
>>             file://0001-Install-python-modules-to-correct-library-dir.pa=
tch \
>>             file://0001-staprun-stapbpf-don-t-support-installing-a-non-r=
oot.patch \
>> -           file://0001-release-date-fix.patch \
>> +           file://0001-prerelease-datestamp-fixes.patch \
>>             "
>>
>>  COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips=
|riscv64).*-linux'
>> --
>> 2.31.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#191795): https://lists.openembedded.org/g/openembedd=
ed-core/message/191795
>> Mute This Topic: https://lists.openembedded.org/mt/102987514/3617156
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [m=
artin.jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

