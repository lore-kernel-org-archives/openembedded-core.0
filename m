Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 326C2C4167B
	for <webhook@archiver.kernel.org>; Sun, 10 Dec 2023 11:16:57 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.52652.1702207006948532491
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 03:16:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IDTQqMal;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3360ae2392eso1969799f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 03:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702207005; x=1702811805; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nuUzB0oY6WAJ5HSqr4hk5y4C0nxa76F6a2OPCKyyiqs=;
        b=IDTQqMalNNglFDuqDSS89X9hdhxzLk4vg3k4omLGbirkvgIlyY/j632WLKfHi8mTug
         W9KGPHz3x44AGFlHPvf/zSg1yk1zJPmBWzCPf686hG2PCOLgKHN+lvaBu9lUcM+5FAKX
         PurTcIFl4xlsQ1paUrqZzkDk3mlDoU2Lnc5MpLuTwKmo0LbGyUFLRrfnxo5fVr/BmkaW
         HvUXZ2+Aja1Pkw/9rSpE7J4YmlypYvtXaPVicms/9OpPiu/6Kn9/fzTjOwguQpKd5bri
         sDTguS3ZqLkLGGZygYWTG7EsN1yTlSBFad8LjiiV61VpgJl9KRlRYWh/Kr3ODrk1bcL7
         WsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702207005; x=1702811805;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nuUzB0oY6WAJ5HSqr4hk5y4C0nxa76F6a2OPCKyyiqs=;
        b=viyTwhsM+s6GOxB6QM71luRH+5PTjCKidQgPAeaAldRoIeCJ6YmfXH/9NkCaafV0z+
         3hC3SUy8yOOAqsr24QFLJu/Yww+mPkJ7tjihIzsI6htKgO8id6sGYJpbonVxh+sNSzSD
         gPcLsZiLJD4BlHWBsoqLSfFJqdx9XfEpfcgH49q9Ozlra1UUEHFVlK7dOJgMV4AVBxVs
         YGvrkUOyq6/vULRk9/7fkj/7mKJUvNyXGOuMoDdUxso/vAhcJNUK+sJkXQGK9FQK0VL0
         ZNZDHrEXYuXeB5dY0UMLjiz6RBjz7TAMqdKd/jK+dsbeY9qXT9foxeszqY6pfkZYPOYs
         +ENg==
X-Gm-Message-State: AOJu0YyUB4QG76/iesJwnSLt17aIVxTIxne7RecTNrJnhAnENIyAfiV4
	k1ufd5C2KVePbRNNUITqUeiZ58NpRMhT15Kw23E=
X-Google-Smtp-Source: AGHT+IHReP8/TZOGi7pi/SaujoswB8/lVqRR6TLP/hISweqOyLHOmD9ugxhlyveZ9j4Gj2AD12VxCVlMop4VqMW3oRI=
X-Received: by 2002:a05:600c:8a4:b0:40b:5e59:b7d3 with SMTP id
 l36-20020a05600c08a400b0040b5e59b7d3mr1342088wmp.176.1702207004730; Sun, 10
 Dec 2023 03:16:44 -0800 (PST)
MIME-Version: 1.0
References: <20231205063249.3433-1-victor.kamensky7@gmail.com>
In-Reply-To: <20231205063249.3433-1-victor.kamensky7@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 10 Dec 2023 12:16:34 +0100
Message-ID: <CA+chaQeUbSV49rXVnbfbQ3f_5z8b2iizZxh1_YVogWWpwL255g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] systemtap: upgrade 4.9 -> 5.0
To: Victor Kamensky <victor.kamensky7@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d9ea37060c25f320"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 11:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192109

--000000000000d9ea37060c25f320
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This seems to be causing:
../git/util.cxx:51:10: fatal error: elfutils/debuginfod.h: No such file or
directory
   51 | #include <elfutils/debuginfod.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [Makefile:1389: stap-util.o] Error 1

on some systems.

Looks like with
https://sourceware.org/git/?p=3Dsystemtap.git;a=3Dcommit;h=3D2e67b053e3796e=
e7cf29a39f9698729b52078406
it now enables debuginfod ("AC_MSG_RESULT([yes])" _after_
the PKG_CHECK_MODULES now seems wrong).

log.do_configure:
checking whether to use debuginfod... checking for debuginfod... no
yes
checking for debuginfod_find_metadata in -ldebuginfod... no

build $ grep DEBUGINFO config.h
#define HAVE_LIBDEBUGINFOD 1

config.log (see the strange result yes):
configure:12213: checking whether to use debuginfod
configure:12228: checking for debuginfod
configure:12235: $PKG_CONFIG --exists --print-errors "libdebuginfod >=3D
0.179"
Package libdebuginfod was not found in the pkg-config search path.
Perhaps you should add the directory containing `libdebuginfod.pc'
to the PKG_CONFIG_PATH environment variable
No package 'libdebuginfod' found
configure:12238: $? =3D 1
configure:12252: $PKG_CONFIG --exists --print-errors "libdebuginfod >=3D
0.179"
Package libdebuginfod was not found in the pkg-config search path.
Perhaps you should add the directory containing `libdebuginfod.pc'
to the PKG_CONFIG_PATH environment variable
No package 'libdebuginfod' found
configure:12255: $? =3D 1
configure:12269: result: no
No package 'libdebuginfod' found
configure:12304: result: yes
configure:12315: checking for debuginfod_find_metadata in -ldebuginfod
configure:12344: ccache aarch64-webos-linux-gcc  -mcpu=3Dcortex-a72
-march=3Darmv8-a+crc -mbranch-protection=3Dstandard -fstack-protector-stron=
g
 -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-secu=
rity
-Werror=3Dreturn-type
--sysroot=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64-webos-=
linux/systemtap/5.0/recipe-sysroot
-o conftest  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map
 -fmacro-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4=
_64-webos-linux/systemtap/5.0/git=3D/usr/src/debug/systemtap/5.0
 -fdebug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4=
_64-webos-linux/systemtap/5.0/git=3D/usr/src/debug/systemtap/5.0
 -fmacro-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4=
_64-webos-linux/systemtap/5.0/build=3D/usr/src/debug/systemtap/5.0
 -fdebug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4=
_64-webos-linux/systemtap/5.0/build=3D/usr/src/debug/systemtap/5.0
 -fdebug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4=
_64-webos-linux/systemtap/5.0/recipe-sysroot=3D
 -fmacro-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4=
_64-webos-linux/systemtap/5.0/recipe-sysroot=3D
 -fdebug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4=
_64-webos-linux/systemtap/5.0/recipe-sysroot-native=3D
   -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fcanon-prefix-map
 -fmacro-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4=
_64-webos-linux/systemtap/5.0/git=3D/usr/src/debug/systemtap/5.0
 -fdebug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4=
_64-webos-linux/systemtap/5.0/git=3D/usr/src/debug/systemtap/5.0
 -fmacro-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4=
_64-webos-linux/systemtap/5.0/build=3D/usr/src/debug/systemtap/5.0
 -fdebug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4=
_64-webos-linux/systemtap/5.0/build=3D/usr/src/debug/systemtap/5.0
 -fdebug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4=
_64-webos-linux/systemtap/5.0/recipe-sysroot=3D
 -fmacro-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4=
_64-webos-linux/systemtap/5.0/recipe-sysroot=3D
 -fdebug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4=
_64-webos-linux/systemtap/5.0/recipe-sysroot-native=3D
 -Wl,-z,relro,-z,now  conftest.c -ldebuginfod   >&5
/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64-webos-linux/system=
tap/5.0/recipe-sysroot-native/usr/bin/aarch64-webos-linux/../../libexec/aar=
ch64-webos-linux/gcc/aarch64-webos-linux/13.2.0/ld:
cannot find -ldebuginfod: No such file or directory
collect2: error: ld returned 1 exit status

With debuginfod in DISTRO_FEATURES (which is included by default) and
*debuginfod PACKAGECONFIG enabled in elfutils (also by default based on
DISTRO_FEAUTRES) this builds OK.

Regards,


On Tue, Dec 5, 2023 at 7:33=E2=80=AFAM Victor Kamensky <victor.kamensky7@gm=
ail.com>
wrote:

> Similar to 4.9 release, in 5.0 release release-5.0 tag is off any branch,
> release-5.0a tag e72dc118e563c645d93a1a2d771e8d90e8fec1ae is on the maste=
r
> branch. Use this value for SRCREV and add catch up patch,
> 0001-prerelease-datestamp-fixes.patch, to bring source up to release-5.0
> tag
> level. Remove 0001-prerelease-datestamp-fixes.patch in next upgrade.
>
> Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
> ---
>  .../0001-prerelease-datestamp-fixes.patch     | 23 ++++++++++++
>  .../systemtap/0001-release-date-fix.patch     | 37 -------------------
>  .../systemtap/systemtap_git.inc               |  6 +--
>  3 files changed, 26 insertions(+), 40 deletions(-)
>  create mode 100644
> meta/recipes-kernel/systemtap/systemtap/0001-prerelease-datestamp-fixes.p=
atch
>  delete mode 100644
> meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.patch
>
> diff --git
> a/meta/recipes-kernel/systemtap/systemtap/0001-prerelease-datestamp-fixes=
.patch
> b/meta/recipes-kernel/systemtap/systemtap/0001-prerelease-datestamp-fixes=
.patch
> new file mode 100644
> index 0000000000..afdc10a3fe
> --- /dev/null
> +++
> b/meta/recipes-kernel/systemtap/systemtap/0001-prerelease-datestamp-fixes=
.patch
> @@ -0,0 +1,23 @@
> +From cfc2c1d53924face11e3fab78ded61c359778eb9 Mon Sep 17 00:00:00 2001
> +From: "Frank Ch. Eigler" <fche@redhat.com>
> +Date: Sat, 4 Nov 2023 12:19:59 -0400
> +Subject: [PATCH] prerelease datestamp fixes
> +
> +Upstream-Status: Backport
> +---
> + NEWS | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/NEWS b/NEWS
> +index c7f31e8b7..f0f9056c4 100644
> +--- a/NEWS
> ++++ b/NEWS
> +@@ -1,4 +1,4 @@
> +-* What's new in version 5.0, 2023-11-03
> ++* What's new in version 5.0, 2023-11-04
> +
> + - Performance improvements in uprobe registration and module startup.
> +
> +--
> +2.31.1
> +
> diff --git
> a/meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.patch
> b/meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.patch
> deleted file mode 100644
> index 3dcb369ec3..0000000000
> --- a/meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From ebb424eee5599fcc131901c0d82d0bfc0d2f57ab Mon Sep 17 00:00:00 2001
> -From: "Frank Ch. Eigler" <fche@redhat.com>
> -Date: Fri, 28 Apr 2023 13:51:27 -0400
> -Subject: [PATCH] release date fix
> -
> -Upstream-Status: Backport
> ----
> - NEWS           | 2 +-
> - systemtap.spec | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/NEWS b/NEWS
> -index 695bc990c..46859e304 100644
> ---- a/NEWS
> -+++ b/NEWS
> -@@ -1,4 +1,4 @@
> --* What's new in version 4.9, 2023-04-27
> -+* What's new in version 4.9, 2023-04-28
> -
> - - ISystemtap: the new interactive systemtap jupyter kernel. This provid=
es
> -   a simple GUI for writing/running Systemtap scripts in an easy,
> incremental
> -diff --git a/systemtap.spec b/systemtap.spec
> -index 59814f112..fd8023264 100644
> ---- a/systemtap.spec
> -+++ b/systemtap.spec
> -@@ -1307,7 +1307,7 @@ exit 0
> -
> - # PRERELEASE
> - %changelog
> --* Thu Apr 27 2023 Frank Ch. Eigler <fche@redhat.com> - 4.9-1
> -+* Fri Apr 28 2023 Frank Ch. Eigler <fche@redhat.com> - 4.9-1
> - - Upstream release, see wiki page below for detailed notes.
> -   https://sourceware.org/systemtap/wiki/SystemTapReleases
> -
> ---
> -2.40.1
> -
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc
> b/meta/recipes-kernel/systemtap/systemtap_git.inc
> index de3750ff04..bc2a9ff434 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.inc
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
> @@ -1,13 +1,13 @@
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> -SRCREV =3D "418f0a45ca4473491385b5c7eef777607bbdb3b7"
> -PV =3D "4.9"
> +SRCREV =3D "e72dc118e563c645d93a1a2d771e8d90e8fec1ae"
> +PV =3D "5.0"
>
>  SRC_URI =3D "git://
> sourceware.org/git/systemtap.git;branch=3Dmaster;protocol=3Dhttps \
>
> file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
>
> file://0001-Install-python-modules-to-correct-library-dir.patch \
>
> file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
> -           file://0001-release-date-fix.patch \
> +           file://0001-prerelease-datestamp-fixes.patch \
>             "
>
>  COMPATIBLE_HOST =3D
> '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips|riscv64).*-linux'
> --
> 2.31.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191795):
> https://lists.openembedded.org/g/openembedded-core/message/191795
> Mute This Topic: https://lists.openembedded.org/mt/102987514/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d9ea37060c25f320
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This seems to be causing:<div>../git/util.cxx:51:10: fatal=
 error: elfutils/debuginfod.h: No such file or directory<br>=C2=A0 =C2=A051=
 | #include &lt;elfutils/debuginfod.h&gt;<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~~<br>compilation terminate=
d.<br>make[2]: *** [Makefile:1389: stap-util.o] Error 1<br></div><div><br><=
/div><div>on some systems.</div><div><br></div><div>Looks like with=C2=A0<a=
 href=3D"https://sourceware.org/git/?p=3Dsystemtap.git;a=3Dcommit;h=3D2e67b=
053e3796ee7cf29a39f9698729b52078406" target=3D"_blank">https://sourceware.o=
rg/git/?p=3Dsystemtap.git;a=3Dcommit;h=3D2e67b053e3796ee7cf29a39f9698729b52=
078406</a> it now enables debuginfod (&quot;AC_MSG_RESULT([yes])&quot; _aft=
er_ the=C2=A0PKG_CHECK_MODULES now seems wrong).</div><div><br></div><div>l=
og.do_configure:</div><div>checking whether to use debuginfod... checking f=
or debuginfod... no<br>yes<br>checking for debuginfod_find_metadata in -lde=
buginfod... no<br></div><div><br></div><div>build $ grep DEBUGINFO config.h=
 <br>#define HAVE_LIBDEBUGINFOD 1<br></div><div><br></div><div>config.log (=
see the strange result yes):</div><div>configure:12213: checking whether to=
 use debuginfod<br>configure:12228: checking for debuginfod<br>configure:12=
235: $PKG_CONFIG --exists --print-errors &quot;libdebuginfod &gt;=3D 0.179&=
quot;<br>Package libdebuginfod was not found in the pkg-config search path.=
<br>Perhaps you should add the directory containing `libdebuginfod.pc&#39;<=
br>to the PKG_CONFIG_PATH environment variable<br>No package &#39;libdebugi=
nfod&#39; found<br>configure:12238: $? =3D 1<br>configure:12252: $PKG_CONFI=
G --exists --print-errors &quot;libdebuginfod &gt;=3D 0.179&quot;<br>Packag=
e libdebuginfod was not found in the pkg-config search path.<br>Perhaps you=
 should add the directory containing `libdebuginfod.pc&#39;<br>to the PKG_C=
ONFIG_PATH environment variable<br>No package &#39;libdebuginfod&#39; found=
<br>configure:12255: $? =3D 1<br>configure:12269: result: no<br>No package =
&#39;libdebuginfod&#39; found<br>configure:12304: result: yes<br>configure:=
12315: checking for debuginfod_find_metadata in -ldebuginfod<br>configure:1=
2344: ccache aarch64-webos-linux-gcc =C2=A0-mcpu=3Dcortex-a72 -march=3Darmv=
8-a+crc -mbranch-protection=3Dstandard -fstack-protector-strong =C2=A0-O2 -=
D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security -=
Werror=3Dreturn-type --sysroot=3D/OE/lge/build/webos/scarthgap/BUILD/work/r=
aspberrypi4_64-webos-linux/systemtap/5.0/recipe-sysroot -o conftest =C2=A0-=
O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map =C2=A0-fmacro=
-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64-webo=
s-linux/systemtap/5.0/git=3D/usr/src/debug/systemtap/5.0 =C2=A0-fdebug-pref=
ix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64-webos-lin=
ux/systemtap/5.0/git=3D/usr/src/debug/systemtap/5.0 =C2=A0-fmacro-prefix-ma=
p=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64-webos-linux/sy=
stemtap/5.0/build=3D/usr/src/debug/systemtap/5.0 =C2=A0-fdebug-prefix-map=
=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64-webos-linux/sys=
temtap/5.0/build=3D/usr/src/debug/systemtap/5.0 =C2=A0-fdebug-prefix-map=3D=
/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64-webos-linux/system=
tap/5.0/recipe-sysroot=3D =C2=A0-fmacro-prefix-map=3D/OE/lge/build/webos/sc=
arthgap/BUILD/work/raspberrypi4_64-webos-linux/systemtap/5.0/recipe-sysroot=
=3D =C2=A0-fdebug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/ras=
pberrypi4_64-webos-linux/systemtap/5.0/recipe-sysroot-native=3D =C2=A0 =C2=
=A0-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fcanon-prefix-map =C2=A0=
-fmacro-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_=
64-webos-linux/systemtap/5.0/git=3D/usr/src/debug/systemtap/5.0 =C2=A0-fdeb=
ug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64-we=
bos-linux/systemtap/5.0/git=3D/usr/src/debug/systemtap/5.0 =C2=A0-fmacro-pr=
efix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64-webos-l=
inux/systemtap/5.0/build=3D/usr/src/debug/systemtap/5.0 =C2=A0-fdebug-prefi=
x-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64-webos-linu=
x/systemtap/5.0/build=3D/usr/src/debug/systemtap/5.0 =C2=A0-fdebug-prefix-m=
ap=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64-webos-linux/s=
ystemtap/5.0/recipe-sysroot=3D =C2=A0-fmacro-prefix-map=3D/OE/lge/build/web=
os/scarthgap/BUILD/work/raspberrypi4_64-webos-linux/systemtap/5.0/recipe-sy=
sroot=3D =C2=A0-fdebug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/wor=
k/raspberrypi4_64-webos-linux/systemtap/5.0/recipe-sysroot-native=3D =C2=A0=
-Wl,-z,relro,-z,now =C2=A0conftest.c -ldebuginfod =C2=A0 &gt;&amp;5<br>/OE/=
lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64-webos-linux/systemtap/=
5.0/recipe-sysroot-native/usr/bin/aarch64-webos-linux/../../libexec/aarch64=
-webos-linux/gcc/aarch64-webos-linux/13.2.0/ld: cannot find -ldebuginfod: N=
o such file or directory<br>collect2: error: ld returned 1 exit status<br><=
/div><div><br></div><div>With=C2=A0debuginfod in DISTRO_FEATURES (which is =
included by default) and *debuginfod PACKAGECONFIG enabled in elfutils (als=
o by default based on DISTRO_FEAUTRES) this builds OK.</div><div><br></div>=
<div>Regards,</div><div><br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 5, 2023 at 7:33=E2=80=AFAM Vi=
ctor Kamensky &lt;<a href=3D"mailto:victor.kamensky7@gmail.com" target=3D"_=
blank">victor.kamensky7@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Similar to 4.9 release, in 5.0 release rel=
ease-5.0 tag is off any branch,<br>
release-5.0a tag e72dc118e563c645d93a1a2d771e8d90e8fec1ae is on the master<=
br>
branch. Use this value for SRCREV and add catch up patch,<br>
0001-prerelease-datestamp-fixes.patch, to bring source up to release-5.0 ta=
g<br>
level. Remove 0001-prerelease-datestamp-fixes.patch in next upgrade.<br>
<br>
Signed-off-by: Victor Kamensky &lt;<a href=3D"mailto:victor.kamensky7@gmail=
.com" target=3D"_blank">victor.kamensky7@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../0001-prerelease-datestamp-fixes.patch=C2=A0 =C2=A0 =C2=A0| 23 +++=
+++++++++<br>
=C2=A0.../systemtap/0001-release-date-fix.patch=C2=A0 =C2=A0 =C2=A0| 37 ---=
----------------<br>
=C2=A0.../systemtap/systemtap_git.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 6 +--<br>
=C2=A03 files changed, 26 insertions(+), 40 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-prere=
lease-datestamp-fixes.patch<br>
=C2=A0delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-relea=
se-date-fix.patch<br>
<br>
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-prerelease-datest=
amp-fixes.patch b/meta/recipes-kernel/systemtap/systemtap/0001-prerelease-d=
atestamp-fixes.patch<br>
new file mode 100644<br>
index 0000000000..afdc10a3fe<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-prerelease-datestamp-fix=
es.patch<br>
@@ -0,0 +1,23 @@<br>
+From cfc2c1d53924face11e3fab78ded61c359778eb9 Mon Sep 17 00:00:00 2001<br>
+From: &quot;Frank Ch. Eigler&quot; &lt;<a href=3D"mailto:fche@redhat.com" =
target=3D"_blank">fche@redhat.com</a>&gt;<br>
+Date: Sat, 4 Nov 2023 12:19:59 -0400<br>
+Subject: [PATCH] prerelease datestamp fixes<br>
+<br>
+Upstream-Status: Backport<br>
+---<br>
+ NEWS | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/NEWS b/NEWS<br>
+index c7f31e8b7..f0f9056c4 100644<br>
+--- a/NEWS<br>
++++ b/NEWS<br>
+@@ -1,4 +1,4 @@<br>
+-* What&#39;s new in version 5.0, 2023-11-03<br>
++* What&#39;s new in version 5.0, 2023-11-04<br>
+ <br>
+ - Performance improvements in uprobe registration and module startup.<br>
+ <br>
+-- <br>
+2.31.1<br>
+<br>
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.=
patch b/meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.patch=
<br>
deleted file mode 100644<br>
index 3dcb369ec3..0000000000<br>
--- a/meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.patch<b=
r>
+++ /dev/null<br>
@@ -1,37 +0,0 @@<br>
-From ebb424eee5599fcc131901c0d82d0bfc0d2f57ab Mon Sep 17 00:00:00 2001<br>
-From: &quot;Frank Ch. Eigler&quot; &lt;<a href=3D"mailto:fche@redhat.com" =
target=3D"_blank">fche@redhat.com</a>&gt;<br>
-Date: Fri, 28 Apr 2023 13:51:27 -0400<br>
-Subject: [PATCH] release date fix<br>
-<br>
-Upstream-Status: Backport<br>
----<br>
- NEWS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
- systemtap.spec | 2 +-<br>
- 2 files changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/NEWS b/NEWS<br>
-index 695bc990c..46859e304 100644<br>
---- a/NEWS<br>
-+++ b/NEWS<br>
-@@ -1,4 +1,4 @@<br>
--* What&#39;s new in version 4.9, 2023-04-27<br>
-+* What&#39;s new in version 4.9, 2023-04-28<br>
- <br>
- - ISystemtap: the new interactive systemtap jupyter kernel. This provides=
<br>
-=C2=A0 =C2=A0a simple GUI for writing/running Systemtap scripts in an easy=
, incremental<br>
-diff --git a/systemtap.spec b/systemtap.spec<br>
-index 59814f112..fd8023264 100644<br>
---- a/systemtap.spec<br>
-+++ b/systemtap.spec<br>
-@@ -1307,7 +1307,7 @@ exit 0<br>
- <br>
- # PRERELEASE<br>
- %changelog<br>
--* Thu Apr 27 2023 Frank Ch. Eigler &lt;<a href=3D"mailto:fche@redhat.com"=
 target=3D"_blank">fche@redhat.com</a>&gt; - 4.9-1<br>
-+* Fri Apr 28 2023 Frank Ch. Eigler &lt;<a href=3D"mailto:fche@redhat.com"=
 target=3D"_blank">fche@redhat.com</a>&gt; - 4.9-1<br>
- - Upstream release, see wiki page below for detailed notes.<br>
-=C2=A0 =C2=A0<a href=3D"https://sourceware.org/systemtap/wiki/SystemTapRel=
eases" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/systemta=
p/wiki/SystemTapReleases</a><br>
- <br>
--- <br>
-2.40.1<br>
-<br>
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes=
-kernel/systemtap/systemtap_git.inc<br>
index de3750ff04..bc2a9ff434 100644<br>
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc<br>
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc<br>
@@ -1,13 +1,13 @@<br>
=C2=A0LICENSE =3D &quot;GPL-2.0-only&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a8=
0fdaf4a4263&quot;<br>
-SRCREV =3D &quot;418f0a45ca4473491385b5c7eef777607bbdb3b7&quot;<br>
-PV =3D &quot;4.9&quot;<br>
+SRCREV =3D &quot;e72dc118e563c645d93a1a2d771e8d90e8fec1ae&quot;<br>
+PV =3D &quot;5.0&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://sourceware.org/git/systemta=
p.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank=
">sourceware.org/git/systemtap.git;branch=3Dmaster;protocol=3Dhttps</a> \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Do-not-let-configure-=
write-a-python-location-into-th.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Install-python-module=
s-to-correct-library-dir.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-staprun-stapbpf-don-t=
-support-installing-a-non-root.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-release-date-fix.patc=
h \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-prerelease-datestamp-=
fixes.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0COMPATIBLE_HOST =3D &#39;(x86_64|i.86|powerpc|arm|aarch64|microblazee=
l|mips|riscv64).*-linux&#39;<br>
-- <br>
2.31.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#191795): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/191795" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/191795</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102987514/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102987514/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000d9ea37060c25f320--

