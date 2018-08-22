Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1CBA97927C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 22:17:07 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id p84-v6so5919849oic.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 15:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=pNR8x6fZ2gkZ7V/ZMGscE7fBXeDDRnOZiih6ESDfDnU=;
	b=UvQRIgdS0zDfrJ5NPn/byxcjnMKMNgWoBGizCVQoUtj1fCl2DHKpWrLYbFuKYg+k+y
	2nwNTkSfiXjkS7kya5RaCX4/ivJgcRihrxGWyx3dbOtQrgYOqWdefF1c5HNoivLnFepf
	e3IiOS8Ud03v0NN6m5ZRoW7IST5c2eT/16ZaShzJHwy15pa9KSrWo6goJXsheKz/yKp4
	o4BKUI7OSZzHyEWgyRP2BzrVuDSZgR+Yr7NRLKD/9A/aK1l2dq1T6m7IkRVMBAc2Pj14
	bWGD7ci6y24VPeByP7GO0//cRAoL8oKOiS2LACVcqBmos/ZVIaow/G1M/4p9I23cm0al
	9r3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=pNR8x6fZ2gkZ7V/ZMGscE7fBXeDDRnOZiih6ESDfDnU=;
	b=CoscL1b5R7Gs888Wdxn8oyXvXLb7AeUfgglOte53RJJGqJEFYKWv7RoIdqYFLf1EUH
	M6qYp6MCQ/eTlCMks9y5BA8rfpTw58ZtXYbmckxnHAp4j8HLaPUC2+EAOyKWwa6llegQ
	amPmyn/jeyhkRv9D1/woWfuY7vK0hirgzI/uVo40ieW0uzn4c+KAJe7k2pyui0GXkk58
	GfHbbKFwRIYcAfg4XbNwZ7ycrYYDMkNkPQIDocEPNlxCljBs3tp/yCmcxUS60RM/mLnK
	ivL4wYPqIHOdyKd8H2QK8Q0erEuvghsxySvAdnfs5qSHGBL7zsNQFYx2JKBXzd3h3Drc
	IMYw==
X-Gm-Message-State: APzg51AZxhOe4ZqMYxgTwrIKYSwTD6iewn0ZLJ+xzI23apttE7i6Mli7
	5zVCg///4Ptz1O3DJ3RZC8AcuMBzSgpWVlnwdkxu9d6A
X-Google-Smtp-Source: ANB0VdZBxXMcQIXt5eoNs11dPklYT23aZSJGu8io6wsGWI8adlQzX7blpegXYgTeD+R0b2E1RJDdIqWqUTtmMGQiiLg=
X-Received: by 2002:aca:55c6:: with SMTP id
	j189-v6mr5531902oib.202.1534976228618; 
	Wed, 22 Aug 2018 15:17:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:454b:0:0:0:0:0 with HTTP; Wed, 22 Aug 2018 15:17:07
	-0700 (PDT)
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 23 Aug 2018 00:17:07 +0200
Message-ID: <CALbNGRRML_TnWOCC_=XTGB7dHe4bAk_YMw-GXZG97SwgpkJNzQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Face some linker errors recently
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
X-List-Received-Date: Wed, 22 Aug 2018 22:17:08 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

to test my patches, I moved my layers from sumo to recent master and
see similar linker (=gold) errors in different recipes. Up to now
there are:

meta-qt5-extra/kwallet:
FAILED: bin/libkwalletbackend5.so.5.49.0
: && <...>/recipe-sysroot-native/usr/bin/arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-g++
-fPIC -march=armv7ve -mthumb -mfpu=neon-vfpv4 -mfloat-abi=hard
-mcpu=cortex-a7  --sysroot=<...>/recipe-sysroot  -O2 -pipe -g
-feliminate-unused-debug-types
-fdebug-prefix-map=/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/kwallet/5.49.0-r0=/usr/src/debug/kwallet/5.49.0-r0
-fdebug-prefix-map=<...>/recipe-sysroot=
-fdebug-prefix-map=<...>/recipe-sysroot-native=
-fvisibility-inlines-hidden  -march=armv7ve -mthumb -mfpu=neon-vfpv4
-mfloat-abi=hard -mcpu=cortex-a7  --sysroot=<...>/recipe-sysroot
-std=c++0x -fno-operator-names -fno-exceptions -Wall -Wextra
-Wcast-align -Wchar-subscripts -Wformat-security -Wno-long-long
-Wpointer-arith -Wundef -Wnon-virtual-dtor -Woverloaded-virtual
-Werror=return-type -Wvla -Wdate-time -fdiagnostics-color=always
-pedantic -Wsuggest-override -Wlogical-op
-Wzero-as-null-pointer-constant  -Wl,--no-undefined
-Wl,--fatal-warnings -Wl,--enable-new-dtags -Wl,-O1
-Wl,--hash-style=gnu -Wl,--as-needed -shared
-Wl,-soname,libkwalletbackend5.so.5 -o
bin/libkwalletbackend5.so.5.49.0
src/runtime/kwalletd/backend/CMakeFiles/kwalletbackend5.dir/blockcipher.cc.o
src/runtime/kwalletd/backend/CMakeFiles/kwalletbackend5.dir/blowfish.cc.o
src/runtime/kwalletd/backend/CMakeFiles/kwalletbackend5.dir/cbc.cc.o
src/runtime/kwalletd/backend/CMakeFiles/kwalletbackend5.dir/sha1.cc.o
src/runtime/kwalletd/backend/CMakeFiles/kwalletbackend5.dir/kwalletentry.cc.o
src/runtime/kwalletd/backend/CMakeFiles/kwalletbackend5.dir/kwalletbackend.cc.o
src/runtime/kwalletd/backend/CMakeFiles/kwalletbackend5.dir/backendpersisthandler.cpp.o
src/runtime/kwalletd/backend/CMakeFiles/kwalletbackend5.dir/kwalletbackend_debug.cpp.o
src/runtime/kwalletd/backend/CMakeFiles/kwalletbackend5.dir/kwalletbackend5_autogen/mocs_compilation.cpp.o
 <...>/recipe-sysroot/usr/lib/libKF5WidgetsAddons.so.5.49.0
<...>/recipe-sysroot/usr/lib/libKF5Notifications.so.5.49.0
<...>/recipe-sysroot/usr/lib/libKF5I18n.so.5.49.0 -lgcrypt
<...>/recipe-sysroot/usr/lib//libgpgmepp.so
<...>/recipe-sysroot/usr/lib/libKF5CoreAddons.so.5.49.0
<...>/recipe-sysroot/usr/lib/libQt5DBus.so.5.11.1
<...>/recipe-sysroot/usr/lib/libQt5Widgets.so.5.11.1
<...>/recipe-sysroot/usr/lib/libQt5Gui.so.5.11.1
<...>/recipe-sysroot/usr/lib/libQt5Core.so.5.11.1 -lpthread -lgpgme
-lassuan && :
<...>/recipe-sysroot-native/usr/bin/arm-angstrom-linux-gnueabi/../../libexec/arm-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/8.2.0/ld:
warning: discarding version information for
__pthread_key_create@GLIBC_2.4, defined in unused shared library
<...>/recipe-sysroot/usr/lib/libpthread.so (linked with --as-needed)
<...>/recipe-sysroot-native/usr/bin/arm-angstrom-linux-gnueabi/../../libexec/arm-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/8.2.0/ld:
error: treating warnings as errors
collect2: error: ld returned 1 exit status


meta-qt5-extra/kio-extras:
FAILED: thumbnail/svgthumbnail.so
: && <...>/recipe-sysroot-native/usr/bin/arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-g++
-fPIC -march=armv7ve -mthumb -mfpu=neon-vfpv4 -mfloat-abi=hard
-mcpu=cortex-a7  --sysroot=<...>/recipe-sysroot  -O2 -pipe -g
-feliminate-unused-debug-types
-fdebug-prefix-map=/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/kio-extras/18.04.2-r0=/usr/src/debug/kio-extras/18.04.2-r0
-fdebug-prefix-map=<...>/recipe-sysroot=
-fdebug-prefix-map=<...>/recipe-sysroot-native=
-fvisibility-inlines-hidden  -march=armv7ve -mthumb -mfpu=neon-vfpv4
-mfloat-abi=hard -mcpu=cortex-a7  --sysroot=<...>/recipe-sysroot
-std=c++0x -fno-operator-names -fno-exceptions -Wall -Wextra
-Wcast-align -Wchar-subscripts -Wformat-security -Wno-long-long
-Wpointer-arith -Wundef -Wnon-virtual-dtor -Woverloaded-virtual
-Werror=return-type -Wvla -Wdate-time -fdiagnostics-color=always
-Wl,--no-undefined -Wl,--fatal-warnings -Wl,--enable-new-dtags -Wl,-O1
-Wl,--hash-style=gnu -Wl,--as-needed -shared  -o
thumbnail/svgthumbnail.so
thumbnail/CMakeFiles/svgthumbnail.dir/svgcreator.cpp.o
thumbnail/CMakeFiles/svgthumbnail.dir/svgthumbnail_autogen/mocs_compilation.cpp.o
 <...>/recipe-sysroot/usr/lib/libKF5KIOWidgets.so.5.49.0
<...>/recipe-sysroot/usr/lib/libKF5KIOCore.so.5.49.0
<...>/recipe-sysroot/usr/lib/libKF5Service.so.5.49.0
<...>/recipe-sysroot/usr/lib/libQt5Network.so.5.11.1
<...>/recipe-sysroot/usr/lib/libQt5Concurrent.so.5.11.1
<...>/recipe-sysroot/usr/lib/libKF5JobWidgets.so.5.49.0
<...>/recipe-sysroot/usr/lib/libKF5Completion.so.5.49.0
<...>/recipe-sysroot/usr/lib/libQt5Svg.so.5.11.1
<...>/recipe-sysroot/usr/lib/libKF5WidgetsAddons.so.5.49.0
<...>/recipe-sysroot/usr/lib/libQt5Widgets.so.5.11.1
<...>/recipe-sysroot/usr/lib/libKF5CoreAddons.so.5.49.0
<...>/recipe-sysroot/usr/lib/libQt5DBus.so.5.11.1
<...>/recipe-sysroot/usr/lib/libKF5ConfigCore.so.5.49.0
<...>/recipe-sysroot/usr/lib/libQt5Gui.so.5.11.1
<...>/recipe-sysroot/usr/lib/libQt5Core.so.5.11.1 && :
<...>/recipe-sysroot-native/usr/bin/arm-angstrom-linux-gnueabi/../../libexec/arm-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/8.2.0/ld:
warning: discarding version information for __cxa_finalize@GLIBC_2.4,
defined in unused shared library <...>/recipe-sysroot/lib/libc.so.6
(linked with --as-needed)
<...>/recipe-sysroot-native/usr/bin/arm-angstrom-linux-gnueabi/../../libexec/arm-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/8.2.0/ld:
error: treating warnings as errors
collect2: error: ld returned 1 exit status


meta-browser/chromium-x11:
FAILED: libVkICD_mock_icd.so libVkICD_mock_icd.so.TOC
python "../../build/toolchain/gcc_solink_wrapper.py"
--readelf="arm-angstrom-linux-gnueabi-readelf"
--nm="arm-angstrom-linux-gnueabi-nm" --sofile="./libVkICD_mock_icd.so"
--tocfile="./libVkICD_mock_icd.so.TOC"
--output="./libVkICD_mock_icd.so"  -- arm-angstrom-linux-gnueabi-g++
-march=armv7ve -mthumb -mfpu=neon-vfpv4 -mfloat-abi=hard
-mcpu=cortex-a7 --sysroot=<...>/recipe-sysroot -shared
-Wl,--fatal-warnings -Wl,--build-id=sha1 -fPIC -Wl,-z,noexecstack
-Wl,-z,now -Wl,-z,relro -Wl,-z,defs -Wl,--as-needed -fuse-ld=gold -B
-Wl,--icf=all -Wl,-O2 -Wl,--gc-sections -Wl,-O1 -Wl,--hash-style=gnu
-Wl,--as-needed -o "./libVkICD_mock_icd.so"
-Wl,-soname="libVkICD_mock_icd.so" @"./libVkICD_mock_icd.so.rsp"
<...>/recipe-sysroot-native/usr/bin/arm-angstrom-linux-gnueabi/../../libexec/arm-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/8.2.0/ld.gold:
warning: discarding version information for
__pthread_key_create@GLIBC_2.4, defined in unused shared library
<...>/recipe-sysroot/usr/lib/libpthread.so (linked with --as-needed)
<...>/recipe-sysroot-native/usr/bin/arm-angstrom-linux-gnueabi/../../libexec/arm-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/8.2.0/ld.gold:
error: treating warnings as errors
collect2: error: ld returned 1 exit status

OK I could add

LDFLAGS_append = " -Wl,--no-fatal-warnings"

but that just works around. Does anybody have an idea what's going
wrong with these recipes?

Cheers

Andreas

