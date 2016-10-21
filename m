Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id E761171A40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 07:47:40 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id m5so76263765qtb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 00:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FNDoPjahgiB+yemkJzM0Tq1hkoEV/tQhvNAVbr52XeI=;
	b=sKuuk0DONGaYA8bj5d/egJYI0huiRRGwlWRHa9PBwGmshyTDVO0lBuw35c5A65clNp
	gq1VpXWz5sfXEnZazOwQgN9yXxK1noa/+mCC8AbW+VTln9PLR8lskzuhYK9GfFgNfWDI
	mirlJXUQFBYlBnkiTi+H28ykLxxd3V5fplA0Gutr27rA9d1CkSRBXU9X2w5f/3eTLm7z
	NLG8RzOoLXM4trbzkyXGv+T/mZmqTCPlHbIz5DoicTHGctP9bT5W7bcD2DZBBYhQ6REN
	OyXJvFm40V6A8p+kSLXhJHG8xrUFKXtK64mCTSqjgz4l5CA7dkYFNrbC4ywKWR6G684J
	Nttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FNDoPjahgiB+yemkJzM0Tq1hkoEV/tQhvNAVbr52XeI=;
	b=RJBz4waUD+0psGpXvjb/DAqJkVvnyYb1oeI8ObFCEvj2MAYas7ObdEZJCLwF1o6kta
	OWowwdHI8rQv56GPclj1PNj6Sj6f+Y3/ZU5EwnvKBBlEa60yOILRwdkJTJDwhD0efeC0
	83aVkY6ywYMSKECyegoJY8N2JXDyYqqrTAynqhaUxNoNhUFqjkOJj40cJ5n6DhB/ObyO
	ydJkw/8+JEPkATC5OHK/uS5gI27KXLrLFFGFh1yngC/WrF996s/n/S9WZ9bZeOHS3Y+c
	MIavfOQr//CIADLflbeDzakPlOBO3KUJqTmJ5dirCAlDbeYq9xqqQcPeHjtxUoF0Crve
	vGkA==
X-Gm-Message-State: ABUngvdtzkYozYzY4znceLf5bGDAxwCtUcfwPeLHuNbOSIBDpO81r5lP7vTcjEXSSQgeUWj5CpLmhAhj9p5LnnS2
X-Received: by 10.200.35.117 with SMTP id b50mr4567792qtb.38.1477036061825;
	Fri, 21 Oct 2016 00:47:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Fri, 21 Oct 2016 00:47:21 -0700 (PDT)
In-Reply-To: <20161020133514.3403-1-marex@denx.de>
References: <20161020133514.3403-1-marex@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Oct 2016 08:47:21 +0100
Message-ID: <CAJTo0LZeox5Xe6hpnH82JZLaMb1_LtuUjKpcZtmcLOAOnosSUg@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] u-boot: Update to 2016.09.01 release
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
X-List-Received-Date: Fri, 21 Oct 2016 07:47:41 -0000
Content-Type: multipart/alternative; boundary=001a113f41fcc94ded053f5b417a

--001a113f41fcc94ded053f5b417a
Content-Type: text/plain; charset=UTF-8

On 20 October 2016 at 14:35, Marek Vasut <marex@denx.de> wrote:

> Upgrade U-Boot to the latest version.
>

As usual, u-boot-mkimage broke again:

| DEBUG: Executing shell function do_compile
|   x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3
-mfpmath=sse
--sysroot=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/build/tmp/sysroots/qemux86-64
 -O2 -pipe -g -feliminate-unused-debug-types
-fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/build/tmp/work/core2-64-poky-linux/u-boot-mkimage/1_2016.09.01-r0=/usr/src/debug/u-boot-mkimage/1_2016.09.01-r0
-fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/build/tmp/sysroots/x86_64-linux=
-fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/build/tmp/sysroots/qemux86-64=
 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wp,-MD,tools/.bin2header.d
-Wall -Wstrict-prototypes -O2 -fomit-frame-pointer
 -DCONFIG_FIT_SIGNATURE -include ./include/libfdt_env.h -idirafterinclude
-idirafter./arch/sandbox/include -I./lib/libfdt -I./tools
-DCONFIG_SYS_TEXT_BASE=0 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -D_GNU_SOURCE
 -o tools/bin2header tools/bin2header.c
| cat ./Licenses/gpl-2.0.txt | gzip -9 -c | \
| tools/bin2header license_gzip > ./include/license.h
|   x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3
-mfpmath=sse
--sysroot=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/build/tmp/sysroots/qemux86-64
 -O2 -pipe -g -feliminate-unused-debug-types
-fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/build/tmp/work/core2-64-poky-linux/u-boot-mkimage/1_2016.09.01-r0=/usr/src/debug/u-boot-mkimage/1_2016.09.01-r0
-fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/build/tmp/sysroots/x86_64-linux=
-fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/build/tmp/sysroots/qemux86-64=
 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wp,-MD,tools/lib/.crc32.o.d
-Wall -Wstrict-prototypes -O2 -fomit-frame-pointer
 -DCONFIG_FIT_SIGNATURE -include ./include/libfdt_env.h -idirafterinclude
-idirafter./arch/sandbox/include -I./lib/libfdt -I./tools
-DCONFIG_SYS_TEXT_BASE=0 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -D_GNU_SOURCE
-pedantic -c -o tools/lib/crc32.o tools/lib/crc32.c
| /bin/sh: tools/bin2header: /lib/ld-linux-x86-64.so.2: bad ELF
interpreter: No such file or directory
| ERROR: oe_runmake failed
| make[1]: *** [include/license.h] Error 126
NOTE: recipe u-boot-mkimage-1_2016.09.01-r0: task do_compile: Failed
ERROR: Task
(/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb:do_compile)
failed with exit code '1'

It's using the target compiler/sysroot/options to build a runtime tool (so
should use BUILD_CC instead of CC, etc).

Ross

--001a113f41fcc94ded053f5b417a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 October 2016 at 14:35, Marek Vasut <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:marex@denx.de" target=3D"_blank">marex@denx.de</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:soli=
d;padding-left:1ex"><div id=3D"gmail-:ll" class=3D"gmail-a3s gmail-aXjCH gm=
ail-m157e25d232cd49c4">Upgrade <span class=3D"gmail-il">U</span>-<span clas=
s=3D"gmail-il">Boot</span> to the latest version.<br></div></blockquote></d=
iv><br></div><div class=3D"gmail_extra">As usual, u-boot-mkimage broke agai=
n:</div><div class=3D"gmail_extra"><br></div>| DEBUG: Executing shell funct=
ion do_compile<br>| =C2=A0 x86_64-poky-linux-gcc =C2=A0-m64 -march=3Dcore2 =
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/pokybuild/yocto-auto=
builder/yocto-worker/nightly-no-x11/build/build/tmp/sysroots/qemux86-64 =C2=
=A0-O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=3D/home/p=
okybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/build/tmp/work=
/core2-64-poky-linux/u-boot-mkimage/1_2016.09.01-r0=3D/usr/src/debug/u-boot=
-mkimage/1_2016.09.01-r0 -fdebug-prefix-map=3D/home/pokybuild/yocto-autobui=
lder/yocto-worker/nightly-no-x11/build/build/tmp/sysroots/x86_64-linux=3D -=
fdebug-prefix-map=3D/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-=
no-x11/build/build/tmp/sysroots/qemux86-64=3D =C2=A0-Wl,-O1 -Wl,--hash-styl=
e=3Dgnu -Wl,--as-needed -Wp,-MD,tools/.bin2header.d -Wall -Wstrict-prototyp=
es -O2 -fomit-frame-pointer =C2=A0 =C2=A0-DCONFIG_FIT_SIGNATURE -include ./=
include/libfdt_env.h -idirafterinclude -idirafter./arch/sandbox/include -I.=
/lib/libfdt -I./tools -DCONFIG_SYS_TEXT_BASE=3D0 -DUSE_HOSTCC -D__KERNEL_ST=
RICT_NAMES -D_GNU_SOURCE =C2=A0-o tools/bin2header tools/bin2header.c<br>| =
cat ./Licenses/gpl-2.0.txt | gzip -9 -c | \<br>| 	tools/bin2header license_=
gzip &gt; ./include/license.h<br>| =C2=A0 x86_64-poky-linux-gcc =C2=A0-m64 =
-march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/pokyb=
uild/yocto-autobuilder/yocto-worker/nightly-no-x11/build/build/tmp/sysroots=
/qemux86-64 =C2=A0-O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefi=
x-map=3D/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-no-x11/build=
/build/tmp/work/core2-64-poky-linux/u-boot-mkimage/1_2016.09.01-r0=3D/usr/s=
rc/debug/u-boot-mkimage/1_2016.09.01-r0 -fdebug-prefix-map=3D/home/pokybuil=
d/yocto-autobuilder/yocto-worker/nightly-no-x11/build/build/tmp/sysroots/x8=
6_64-linux=3D -fdebug-prefix-map=3D/home/pokybuild/yocto-autobuilder/yocto-=
worker/nightly-no-x11/build/build/tmp/sysroots/qemux86-64=3D =C2=A0-Wl,-O1 =
-Wl,--hash-style=3Dgnu -Wl,--as-needed -Wp,-MD,tools/lib/.crc32.o.d -Wall -=
Wstrict-prototypes -O2 -fomit-frame-pointer =C2=A0 =C2=A0-DCONFIG_FIT_SIGNA=
TURE -include ./include/libfdt_env.h -idirafterinclude -idirafter./arch/san=
dbox/include -I./lib/libfdt -I./tools -DCONFIG_SYS_TEXT_BASE=3D0 -DUSE_HOST=
CC -D__KERNEL_STRICT_NAMES -D_GNU_SOURCE -pedantic -c -o tools/lib/crc32.o =
tools/lib/crc32.c<br>| /bin/sh: tools/bin2header: /lib/ld-linux-x86-64.so.2=
: bad ELF interpreter: No such file or directory<br>| ERROR: oe_runmake fai=
led<br>| make[1]: *** [include/license.h] Error 126<br>NOTE: recipe u-boot-=
mkimage-1_2016.09.01-r0: task do_compile: Failed<br>ERROR: Task (/home/poky=
build/yocto-autobuilder/yocto-worker/nightly-no-x11/build/meta/recipes-bsp/=
u-boot/u-boot-mkimage_2016.09.01.bb:do_compile) failed with exit code &#39;=
1&#39;<div><br></div><div>It&#39;s using the target compiler/sysroot/option=
s to build a runtime tool (so should use BUILD_CC instead of CC, etc).</div=
><div><br></div><div>Ross</div></div>

--001a113f41fcc94ded053f5b417a--
