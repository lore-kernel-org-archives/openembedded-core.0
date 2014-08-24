Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0545770703
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 23:39:45 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id lx4so8946281iec.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 16:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=aa8tQ4I6erBCrkZnqnnZS6Gwd1lLmDMddDcjmz18LiU=;
	b=q7Dc+4qOW/sxXbuoccMC0A+lP9m4ChA6YrZVqhfNohC39jTzjKbEiTWUclcFUeVK+/
	cCaThAot8PkIYWxFeQhB+hRwUZhLTx4/TGvc9cmMhymKyF4QeibO+zaOR8FUYFSNR5g7
	lnyv2b+g42pNNA+2DjH4STW5Zjy3GFBg76CU5Jaq60vgE4VaTVmWUmTRG/JSI4/Q9bla
	x7G+fDdLPxlwId2PSJEef/jPcfxHKEZKlx+Ukwn7jOkUW64Sh3Dv2KukS9zGsda0gVNK
	OEOfDeMiGCbO7wXLEp831enO+cykRVRRD3ZvCZd8hy1/N43VRBthFim3Z05Uj9siaex0
	vpkQ==
X-Received: by 10.43.75.7 with SMTP id yy7mr294100icb.15.1408923586678; Sun,
	24 Aug 2014 16:39:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Sun, 24 Aug 2014 16:39:16 -0700 (PDT)
In-Reply-To: <CAP9ODKrHQz8yOnRy9c7E=6TOgbJuh1124uKiSPumTFdy9evpoA@mail.gmail.com>
References: <CAP9ODKrHQz8yOnRy9c7E=6TOgbJuh1124uKiSPumTFdy9evpoA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Aug 2014 16:39:16 -0700
Message-ID: <CAMKF1spfWfHpKV3bhqksSiw6LuuMa7POTnpp1ObTj2uUAEHadg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: FTBFS: nativesdk-alsa-lib
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
X-List-Received-Date: Sun, 24 Aug 2014 23:39:50 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 24, 2014 at 2:02 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Hello,
>
> Today testing the SDK build based in today's tip of master I found
>
> do_configure log:
>
> checking for i686-oelsdk-linux-gcc... i686-oelsdk-linux-gcc
> -march=i686 --sysroot=.../build/tmp/sysroots/cortexa9hf-vfp-neon-mx6-oelsdk-linux
> checking whether the C compiler works... no
> configure: error: in
> `.../build/tmp/work/cortexa9hf-vfp-neon-mx6-oelsdk-linux/nativesdk-alsa-lib/1.0.27.2-r0/build':
> configure: error: C compiler cannot create executables
> See `config.log' for more details
> Configure failed. The contents of all config.log files follows to aid debugging
> ERROR: oe_runconf failed
>
> config.log:
>
> .../build/tmp/sysroots/x86_64-linux/usr/libexec/i686-oelsdk-linux/gcc/i686-oelsdk-linux/4.9.1/ld:
> cannot find crt1.o: No such file or directory
> .../build/tmp/sysroots/x86_64-linux/usr/libexec/i686-oelsdk-linux/gcc/i686-oelsdk-linux/4.9.1/ld:
> cannot find crti.o: No such file or directory
> .../build/tmp/sysroots/x86_64-linux/usr/libexec/i686-oelsdk-linux/gcc/i686-oelsdk-linux/4.9.1/ld:
> cannot find crtbegin.o: No such file or directory
> .../build/tmp/sysroots/x86_64-linux/usr/libexec/i686-oelsdk-linux/gcc/i686-oelsdk-linux/4.9.1/ld:
> cannot find -lgcc
> .../build/tmp/sysroots/x86_64-linux/usr/libexec/i686-oelsdk-linux/gcc/i686-oelsdk-linux/4.9.1/ld:
> cannot find -lgcc_s
> .../build/tmp/sysroots/x86_64-linux/usr/libexec/i686-oelsdk-linux/gcc/i686-oelsdk-linux/4.9.1/ld:
> cannot find -lc
> .../build/tmp/sysroots/x86_64-linux/usr/libexec/i686-oelsdk-linux/gcc/i686-oelsdk-linux/4.9.1/ld:
> cannot find -lgcc
> .../build/tmp/sysroots/x86_64-linux/usr/libexec/i686-oelsdk-linux/gcc/i686-oelsdk-linux/4.9.1/ld:
> cannot find -lgcc_s
> .../build/tmp/sysroots/x86_64-linux/usr/libexec/i686-oelsdk-linux/gcc/i686-oelsdk-linux/4.9.1/ld:
> cannot find crtend.o: No such file or directory
> .../build/tmp/sysroots/x86_64-linux/usr/libexec/i686-oelsdk-linux/gcc/i686-oelsdk-linux/4.9.1/ld:
> cannot find crtn.o: No such file or directory
>
> Does someone has a clue where to start looking to fix this?

are you building out of sstate ? it may be that dependencies on
nativesdk-gcc-runtime and nativesdk-libgcc and nativesdk-glibc are
missing.

