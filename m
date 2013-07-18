Return-Path: <daiane.list@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2F2716B118
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 12:33:32 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id 14so3035411pdj.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 05:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=pyI4uyhGgp7e/asL+UR/5QtLUYEQrx7d04u/Xbfzv8g=;
	b=rJIdZ7QFw1mNLH2CSLW04dAA3actODeT+aUG0Sw4rWLQfzsCcrIBf6oCFtODkCNoxX
	55d+QbC2S7vAa/3LPX8WJ+mXP6BmrGG2lruBVsXMlw6DbH3xnbhD/RFELCwAqkEeN0l6
	uqeXqz+fgW1C8aJFcZGsY4GV5FS3FkskBnLzQP4OSi8sv5XlsO5iIW79RGqahzcx/UaM
	tZ5YW9av3tBYQ5dSLkRrdDgpH/WU5b0pwA+MxUi7B+DYTEcNG/Rr8tp3ismGQOcR0FLQ
	GB4rXVOAx/j77ul0sVxivEHd9Hb9KY4jES1jXtdxthDz0XPFIQcSi+5uyxMQzG5lODsy
	Ng1g==
MIME-Version: 1.0
X-Received: by 10.66.252.129 with SMTP id zs1mr12766791pac.113.1374150812802; 
	Thu, 18 Jul 2013 05:33:32 -0700 (PDT)
Received: by 10.70.20.225 with HTTP; Thu, 18 Jul 2013 05:33:32 -0700 (PDT)
Date: Thu, 18 Jul 2013 09:33:32 -0300
Message-ID: <CA+jg_OV-i-dRAw92j2dXsodfi5=EmXSnFuA-GVvRCJYbEbS=gg@mail.gmail.com>
From: Daiane Angolini <daiane.list@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: No package 'cairo' found for GTK+
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
X-List-Received-Date: Thu, 18 Jul 2013 12:33:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm facing the following error. Anyone know what I should try in order
to properly configure my build?


| checking how to hardcode library paths into programs... immediate
| configure: creating ./config.lt
| config.lt: creating arm-poky-linux-gnueabi-libtool
| checking for special C compiler options needed for large files... no
| checking for _FILE_OFFSET_BITS value needed for large files... 64
| checking dependency style of arm-poky-linux-gnueabi-gcc
-march=armv7-a -mthumb-interwork -mfloat-abi=softfp -mfpu=neon
--sysroot=/home/daiane/gerrit/build/tmp/sysroots/imx53qsb... none
| checking for arm-poky-linux-gnueabi-arm-poky-linux-gnueabi-nm...
arm-poky-linux-gnueabi-nm
| checking whether to enable maintainer-specific portions of Makefiles... yes
| checking for some Win32 platform... no
| checking whether build environment is sane... yes
| checking for library containing strerror... none required
| checking whether arm-poky-linux-gnueabi-gcc  -march=armv7-a
-mthumb-interwork -mfloat-abi=softfp -mfpu=neon
--sysroot=/home/daiane/gerrit/build/tmp/sysroots/imx53qsb and cc
understand -c and -o together... yes
| checking whether make sets $(MAKE)... (cached) yes
| checking for arm-poky-linux-gnueabi-pkg-config... no
| checking for pkg-config...
/home/daiane/gerrit/build/tmp/sysroots/x86_64-linux/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for BASE_DEPENDENCIES... no
| configure: error: Package requirements (glib-2.0 >= 2.28.0    atk >=
1.29.2    pango >= 1.20    cairo >= 1.6    gdk-pixbuf-2.0 >= 2.21.0)
were not met:
|
| No package 'cairo' found
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|
| Alternatively, you may set the environment variables BASE_DEPENDENCIES_CFLAGS
| and BASE_DEPENDENCIES_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| Configure failed. The contents of all config.log files follows to
aid debugging
| ERROR: oe_runconf failed
| ERROR: Function failed: do_configure (log file is located at
/home/daiane/gerrit/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/gtk+/2.24.18-r0/temp/log.do_configure.30671)



Thanks in advance,
Daiane

