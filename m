Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id BE9976FE64
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 21:02:37 +0000 (UTC)
Received: by mail-yk0-f179.google.com with SMTP id 142so9948347ykq.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 14:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=4GAc9dChT79Z0SzxTZ9jfyiYiM9+ajHdUT9ARKfc/g4=;
	b=o35J3eVVU4w4yOnd4PGMz5Fs8gK0V64VQhkU/yXXw3Msnf/FwNVQVPiCPtTHPjecDt
	A5eP0giphFrtUZ94gib64lD5xvzGQRun4sml7tX0nBhmoiCZplFMfqlrAPhyBFLif3DB
	zEvcS4UMNDRUIaVoVhENk1+zoEyC7UJPSQ/Tnpj0jcmwHYCkI+RSsnNtKXZFHMEt50hx
	7WP4iQCLRlkBnlreJ62eQnpEQG8C8bfGlDAHZcX4bfTO4Khbqro1WxdhaLgzYJp9erlt
	ZNlYd8g24QFwrdyv7DXPoQEPnf2inJLmR3i2Ug6lMKhb5tJmkxIDwsGT01zaqI4jmhlW
	FV1g==
MIME-Version: 1.0
X-Received: by 10.236.19.196 with SMTP id n44mr29507575yhn.83.1408914158904;
	Sun, 24 Aug 2014 14:02:38 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Sun, 24 Aug 2014 14:02:38 -0700 (PDT)
Date: Sun, 24 Aug 2014 18:02:38 -0300
X-Google-Sender-Auth: MuhjAUfBKqt2cD6loURWt8K86_8
Message-ID: <CAP9ODKrHQz8yOnRy9c7E=6TOgbJuh1124uKiSPumTFdy9evpoA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: FTBFS: nativesdk-alsa-lib
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
X-List-Received-Date: Sun, 24 Aug 2014 21:02:40 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

Today testing the SDK build based in today's tip of master I found

do_configure log:

checking for i686-oelsdk-linux-gcc... i686-oelsdk-linux-gcc
-march=i686 --sysroot=.../build/tmp/sysroots/cortexa9hf-vfp-neon-mx6-oelsdk-linux
checking whether the C compiler works... no
configure: error: in
`.../build/tmp/work/cortexa9hf-vfp-neon-mx6-oelsdk-linux/nativesdk-alsa-lib/1.0.27.2-r0/build':
configure: error: C compiler cannot create executables
See `config.log' for more details
Configure failed. The contents of all config.log files follows to aid debugging
ERROR: oe_runconf failed

config.log:

.../build/tmp/sysroots/x86_64-linux/usr/libexec/i686-oelsdk-linux/gcc/i686-oelsdk-linux/4.9.1/ld:
cannot find crt1.o: No such file or directory
.../build/tmp/sysroots/x86_64-linux/usr/libexec/i686-oelsdk-linux/gcc/i686-oelsdk-linux/4.9.1/ld:
cannot find crti.o: No such file or directory
.../build/tmp/sysroots/x86_64-linux/usr/libexec/i686-oelsdk-linux/gcc/i686-oelsdk-linux/4.9.1/ld:
cannot find crtbegin.o: No such file or directory
.../build/tmp/sysroots/x86_64-linux/usr/libexec/i686-oelsdk-linux/gcc/i686-oelsdk-linux/4.9.1/ld:
cannot find -lgcc
.../build/tmp/sysroots/x86_64-linux/usr/libexec/i686-oelsdk-linux/gcc/i686-oelsdk-linux/4.9.1/ld:
cannot find -lgcc_s
.../build/tmp/sysroots/x86_64-linux/usr/libexec/i686-oelsdk-linux/gcc/i686-oelsdk-linux/4.9.1/ld:
cannot find -lc
.../build/tmp/sysroots/x86_64-linux/usr/libexec/i686-oelsdk-linux/gcc/i686-oelsdk-linux/4.9.1/ld:
cannot find -lgcc
.../build/tmp/sysroots/x86_64-linux/usr/libexec/i686-oelsdk-linux/gcc/i686-oelsdk-linux/4.9.1/ld:
cannot find -lgcc_s
.../build/tmp/sysroots/x86_64-linux/usr/libexec/i686-oelsdk-linux/gcc/i686-oelsdk-linux/4.9.1/ld:
cannot find crtend.o: No such file or directory
.../build/tmp/sysroots/x86_64-linux/usr/libexec/i686-oelsdk-linux/gcc/i686-oelsdk-linux/4.9.1/ld:
cannot find crtn.o: No such file or directory

Does someone has a clue where to start looking to fix this?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

