Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1S7wow-0007S8-Pn
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 23:37:26 +0100
Received: by yenm3 with SMTP id m3so2401958yen.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 15:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=SQqRN6AVaJMTbto5G8IwYM/3RjL3fk+ciCRPqLImXb0=;
	b=nzFoje/1vDqPbzNCmLY/DlW/BEZKSZcYPbKFGmU2eQc4McOsP0drk3/VZ01MWctsqQ
	yOSfadLOkNL9lQhRRfEqhzO/eDJy+YUL076NW4O0j1MHOx/FU9PbJtr0B8+1cRd5/M7l
	06PYpY7+773TvBzJS3mrwfRiby7UxwvZd8hdb624wQs4DIiBySsGnoEvJDpIQSB8SP4a
	n6BGHbk8Dmw4iszYn3MTIauCs0aUC0GZwukOCILUGlLbHEdIQxh2kO7lyb8byGi0p7iE
	8Csa2jYpXjVhMnHrcsSkIRhxL+MIfLMl80vXV6QrZszI5ti2hpEm+cYiH3FjVN/GxjS/
	SpSw==
MIME-Version: 1.0
Received: by 10.60.30.3 with SMTP id o3mr2331614oeh.9.1331764119680; Wed, 14
	Mar 2012 15:28:39 -0700 (PDT)
Received: by 10.182.246.8 with HTTP; Wed, 14 Mar 2012 15:28:39 -0700 (PDT)
Date: Wed, 14 Mar 2012 15:28:39 -0700
Message-ID: <CAGDS+n=KnzzUvUfv_T5X9yHPtOzQ7cgORh-ZbOJZDbFis9F69Q@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: boost breaks on rebuild
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Mar 2012 22:37:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

Boost is another package when a rebuild is triggered:

ERROR: Logfile of failure stored in:
/media/Work/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/boost-1.49.0-r2.0/temp/log.do_compile.22475
Log data follows:
| ERROR: Function failed: do_compile (see
/media/Work/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/boost-1.49.0-r2.0/temp/log.do_compile.22475
for further information)
| + bjam -sTOOLS=gcc '-sGCC=ccache arm-poky-linux-gnueabi-gcc
-march=armv7-a -fno-tree-vectorize      -mthumb-interwork
-mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8  -Wl,-O1
-Wl,--hash-style=gnu -Wl,--as-needed
--sysroot=/media/Work/yocto/tmp/sysroots/omap4-multi
'\''-DBOOST_PLATFORM_CONFIG="boost/config/platform/linux-gnueabi.hpp"'\'''
'-sGXX=ccache arm-poky-linux-gnueabi-g++  -march=armv7-a
-fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp
-mfpu=neon -mtune=cortex-a8  -Wl,-O1 -Wl,--hash-style=gnu
-Wl,--as-needed --sysroot=/media/Work/yocto/tmp/sysroots/omap4-multi
'\''-DBOOST_PLATFORM_CONFIG="boost/config/platform/linux-gnueabi.hpp"'\'''
-sGCC_INCLUDE_DIRECTORY=/media/Work/yocto/tmp/sysroots/omap4-multi/usr/include
-sGCC_STDLIB_DIRECTORY=/media/Work/yocto/tmp/sysroots/omap4-multi/usr/lib
-sNO_BZIP2=1 -sNO_ZLIB=1 '-sBUILD=release <optimization>space
<threading>multi <inlining>on <debug-symbols>off'
'-sPYTHON_VERSION=${PYTHON_VERSION}' --layout=system
--builddir=/media/Work/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/boost-1.49.0-r2.0/boost_1_49_0/arm-poky-linux-gnueabi
--disable-icu --with-date_time --with-filesystem --with-graph
--with-iostreams --with-program_options --with-regex --with-signals
--with-system --with-test --with-thread --prefix=/usr
--exec-prefix=/usr --libdir=/usr/lib --includedir=/usr/include
| error: at /media/Work/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/boost-1.49.0-r2.0/boost_1_49_0/tools/build/v2/user-config.jam:94
| error: duplicate initialization of gcc with the following parameters:
| error: version = 4.3.1
| error: previous initialization at
/media/Work/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/boost-1.49.0-r2.0/boost_1_49_0/tools/build/v2/user-config.jam:93
|
NOTE: package boost-1.49.0-r2.0: task do_compile: Failed

I don't have a fix for this but wanted to document the failure.

As with all the other failures of this type, a -c cleansstate and
rebuild is the workaround.

It feels to me like there are quite a few recipes that don't handle
rebuilds -- I seem to run into a few after every pull.

Steve


