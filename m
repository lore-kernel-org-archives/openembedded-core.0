Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id A2FCD6093B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 14:18:22 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id j11-v6so6418344pgf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 07:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IPi3l5730hm5wqDoTWMnzVPLukGljVG57u0PqtKptHo=;
	b=txXW0cm8GcmUFxuMwM1Mzm1NMwF0RIkgs3vdKK0e1p1w9H6O/mDYj084gTwElos7VX
	z1V1rMrkdqbMdHMHXcadC6dMWi85QZE8WWjV/FplScmJUrnfXn2euNaESnqGe+wr864r
	E2LqI/fZISb+ACYVyzy2is7HDDDFA/Cfe7+b1JunOH3LzKRgjnW3p6E4q21FLXwGUk7c
	77xap8iHCI+P512qecmrrbWu4jxrRmrX3zR+8VUJpALK8/jvIg9okcyiQThbCn8R5vm/
	33SOCUc6OVqzZiKeBWx3MLFx0B+iJSLXwWCC30k8ZfhxXxu5ZyMPOQJxrfSHYi/BaHmO
	wAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IPi3l5730hm5wqDoTWMnzVPLukGljVG57u0PqtKptHo=;
	b=s/cVCaxQM7W6i5R017LrvjoNhDwdrT4tTuMWgowd367C4kfGyseEoBHY+fVAcXoBF9
	2hvv5tEtj5PTX1Ycq6FVpePbsQkIm6x21CXeQ/WHebIzP1Y3r/IprZ2GhMvqbOCTJ+G2
	ogAvNTyM0l4/lmcMMbSgj6Q7mmZWtMoBLCDWMBsmisRbXeCsSqnA+YjmF7Q4EHn6ifmp
	wGHKzdkR6S1dosGtphOlrEjg1XojxkOe1oFC8DOwAr1b0Kfry1e0E8Bcr8Ot5kpY8n1/
	ZxZjGpC/cRaLD51mTAG8pLNtHGfW8T/41fCI3cfALAKK83C11wbj5Pcj7MGvzNS7+JCw
	hkfA==
X-Gm-Message-State: ALQs6tB5/z8CSIngyoZaaVyJ7NiDMLTvvNJCtZPoaCi02w3ruGVC6yx/
	kzQFz2HBMZTIGkd2Vbzf/uArlCT3K5JLvczInfw=
X-Google-Smtp-Source: AB8JxZqWOQvsAvm4dt3wYV533rDRIc9TPVK9U5X1/KAdUvdbh83fQHirelsffIXv/HRf22F2Xa8cCRfnuMr/LIkAYeY=
X-Received: by 10.98.91.2 with SMTP id p2mr4153410pfb.96.1525097903214; Mon,
	30 Apr 2018 07:18:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.182.141 with HTTP; Mon, 30 Apr 2018 07:17:52 -0700 (PDT)
In-Reply-To: <20180430133701.GA2138@jama>
References: <cover.1525029885.git.raj.khem@gmail.com>
	<e7446e8b086e4a6a93533902f580406ca0ebadd8.1525029885.git.raj.khem@gmail.com>
	<20180430133701.GA2138@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Apr 2018 07:17:52 -0700
Message-ID: <CAMKF1sqKyQ1NAybDCc_BmddOgndaDopqX9d8gCr_zhpCTe00pA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/24] alsa-tools: Update to 1.1.6
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
X-List-Received-Date: Mon, 30 Apr 2018 14:18:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 30, 2018 at 6:37 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sun, Apr 29, 2018 at 12:35:55PM -0700, Khem Raj wrote:
>> License-Update: FSF address updated in hdsploader/COPYING and ld10k1/COPYING.LIB
>>
>> Fix built with clang along the way
>>
>> Package python dependent tools into a separate package
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>
>> xxx
>
> ^^^ Insert some pr0n here.

rebase cruft. Fixed in v2

>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...served-user-defined-literal-warnings.patch | 28 +++++++++++++
>>  .../alsa/alsa-tools/autotools.patch           | 42 ++++++++++++-------
>>  ...lsa-tools_1.1.5.bb => alsa-tools_1.1.6.bb} | 25 ++++++++---
>>  3 files changed, 75 insertions(+), 20 deletions(-)
>>  create mode 100644 meta/recipes-multimedia/alsa/alsa-tools/0002-Fix-clang-Wreserved-user-defined-literal-warnings.patch
>>  rename meta/recipes-multimedia/alsa/{alsa-tools_1.1.5.bb => alsa-tools_1.1.6.bb} (62%)
>>
>> diff --git a/meta/recipes-multimedia/alsa/alsa-tools/0002-Fix-clang-Wreserved-user-defined-literal-warnings.patch b/meta/recipes-multimedia/alsa/alsa-tools/0002-Fix-clang-Wreserved-user-defined-literal-warnings.patch
>> new file mode 100644
>> index 0000000000..2290915eab
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/alsa/alsa-tools/0002-Fix-clang-Wreserved-user-defined-literal-warnings.patch
>> @@ -0,0 +1,28 @@
>> +From 2e48e4045e1e951433da0ca4b1e49798eedde14f Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Tue, 24 Apr 2018 12:21:18 -0700
>> +Subject: [PATCH] Fix clang -Wreserved-user-defined-literal warnings
>> +
>> +| us428control.cc:66:18: error: invalid suffix on literal; C++11 requires a space between literal and identifier [-Wreserved-user-defined-literal]
>> +|         printf("usage: "PROGNAME" [-v verbosity_level 0..2] [-c card] [-D device] [-u usb-device] [-m mode]\n");
>> +|                         ^
>> +
>> +Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10360805/]
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + us428control/us428control.cc | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/us428control/us428control.cc b/us428control/us428control.cc
>> +index e839bf4..8cb3c42 100644
>> +--- a/us428control/us428control.cc
>> ++++ b/us428control/us428control.cc
>> +@@ -63,7 +63,7 @@ static void usage(void)
>> + {
>> +     printf("Tascam US-428 Control\n");
>> +     printf("version %s\n", VERSION);
>> +-    printf("usage: "PROGNAME" [-v verbosity_level 0..2] [-c card] [-D device] [-u usb-device] [-m mode]\n");
>> ++    printf("usage: " PROGNAME " [-v verbosity_level 0..2] [-c card] [-D device] [-u usb-device] [-m mode]\n");
>> +     printf("mode is one of (us224, us428, mixxx)\n");
>> + }
>> + /*
>> diff --git a/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch b/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
>> index 2e74963c89..c85834a593 100644
>> --- a/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
>> +++ b/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
>> @@ -1,3 +1,8 @@
>> +From b9a65bf3ba5628cfe8cfd2d10ce2dcf11a606775 Mon Sep 17 00:00:00 2001
>> +From: Dongxiao Xu <dongxiao.xu@intel.com>
>> +Date: Thu, 14 Jul 2011 15:40:36 +0800
>> +Subject: [PATCH] alsa-tools: Fix recipe build error.
>> +
>>  Add parameters to autoreconf to support cross compile.
>>  Remove some sub-components which needs further recipe support.
>>
>> @@ -5,22 +10,17 @@ Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
>>
>>  Upstream-Status: Inappropriate [configuration]
>>
>> -diff -ruN alsa-tools-1.0.24.1-orig//ld10k1/gitcompile alsa-tools-1.0.24.1/ld10k1/gitcompile
>> ---- alsa-tools-1.0.24.1-orig//ld10k1/gitcompile      2011-07-06 11:27:40.227665002 +0800
>> -+++ alsa-tools-1.0.24.1/ld10k1/gitcompile    2011-07-14 13:26:18.017665004 +0800
>> -@@ -1,6 +1,6 @@
>> - #!/bin/bash
>> -
>> --autoreconf -fi || exit 1
>> -+autoreconf $ACLOCAL_FLAGS -fi || exit 1
>> - export CFLAGS='-O2 -Wall -pipe -g'
>> - echo "CFLAGS=$CFLAGS"
>> - echo "./configure $@"
>> -diff -ruN alsa-tools-1.0.24.1-orig//Makefile alsa-tools-1.0.24.1/Makefile
>> ---- alsa-tools-1.0.24.1-orig//Makefile       2011-07-06 11:27:40.207665000 +0800
>> -+++ alsa-tools-1.0.24.1/Makefile     2011-07-14 15:08:08.877665009 +0800
>> +---
>> + Makefile          | 4 ++--
>> + ld10k1/gitcompile | 2 +-
>> + 2 files changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/Makefile b/Makefile
>> +index c32bf25..1119372 100644
>> +--- a/Makefile
>> ++++ b/Makefile
>>  @@ -1,8 +1,8 @@
>> - VERSION = 1.1.5
>> + VERSION = 1.1.6
>>   TOP = .
>>  -SUBDIRS = as10k1 envy24control hdsploader hdspconf hdspmixer \
>>  +SUBDIRS = as10k1 envy24control \
>> @@ -30,3 +30,15 @@ diff -ruN alsa-tools-1.0.24.1-orig//Makefile alsa-tools-1.0.24.1/Makefile
>>         hwmixvolume hdajackretask hda-verb hdajacksensetest
>>
>>   all:
>> +diff --git a/ld10k1/gitcompile b/ld10k1/gitcompile
>> +index 99429ac..20005d9 100755
>> +--- a/ld10k1/gitcompile
>> ++++ b/ld10k1/gitcompile
>> +@@ -1,6 +1,6 @@
>> + #!/bin/bash
>> +
>> +-autoreconf -fi || exit 1
>> ++autoreconf $ACLOCAL_FLAGS -fi || exit 1
>> + export CFLAGS='-O2 -Wall -pipe -g'
>> + echo "CFLAGS=$CFLAGS"
>> + echo "./configure $@"
>> diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.1.5.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.1.6.bb
>> similarity index 62%
>> rename from meta/recipes-multimedia/alsa/alsa-tools_1.1.5.bb
>> rename to meta/recipes-multimedia/alsa/alsa-tools_1.1.6.bb
>> index 1be43aa6e7..e065eec6b8 100644
>> --- a/meta/recipes-multimedia/alsa/alsa-tools_1.1.5.bb
>> +++ b/meta/recipes-multimedia/alsa/alsa-tools_1.1.6.bb
>> @@ -5,17 +5,19 @@ SECTION = "console/utils"
>>  LICENSE = "GPLv2 & LGPLv2+"
>>  DEPENDS = "alsa-lib ncurses glib-2.0"
>>
>> -LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>> -                    file://ld10k1/COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
>> +LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>> +                    file://ld10k1/COPYING.LIB;md5=a916467b91076e631dd8edb7424769c7 \
>> +                    "
>>
>>  SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/${BP}.tar.bz2 \
>>             file://autotools.patch \
>>             ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'file://makefile_no_gtk.patch', d)} \
>>             file://gitcompile_hdajacksensetest \
>> +           file://0002-Fix-clang-Wreserved-user-defined-literal-warnings.patch \
>>             "
>>
>> -SRC_URI[md5sum] = "3afb92eb1b4f2edc8691498e57c3ec78"
>> -SRC_URI[sha256sum] = "bc3c6567de835223ee7d69487b8c22fb395a2e8c613341b0c96e6a5f6a2bd534"
>> +SRC_URI[md5sum] = "5ca8c9437ae779997cd62fb2815fef19"
>> +SRC_URI[sha256sum] = "d69c4dc2fb641a974d9903e9eb78c94cb0c7ac6c45bae664f0c9d6c0a1593227"
>>
>>  inherit autotools-brokensep pkgconfig
>>
>> @@ -37,4 +39,17 @@ do_compile_prepend () {
>>      cp ${WORKDIR}/gitcompile_hdajacksensetest ${S}/hdajacksensetest/gitcompile
>>  }
>>
>> -FILES_${PN} += "${datadir}/ld10k1"
>> +do_install_append() {
>> +    sed -i -e "s|/usr/bin/python2|/usr/bin/env python2|g" ${D}${bindir}/hwmixvolume
>> +}
>> +
>> +PACKAGES =+ "${PN}-hwmixvolume"
>> +
>> +FILES_${PN}-hwmixvolume = "${bindir}/hwmixvolume"
>> +
>> +FILES_${PN} += "${datadir}/ld10k1 \
>> +                ${datadir}/icons/hicolor \
>> +               "
>> +
>> +RDEPENDS_${PN}-hwmixvolume += "python"
>> +
>> --
>> 2.17.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

