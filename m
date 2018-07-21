Return-Path: <alex.kiernan@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id EDD3B71993
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 19:53:08 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id r18-v6so9456138ual.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 12:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=k+tLExJ4uHDfTiPWopJQEVaLyChrYukxK59h2tFuJZc=;
	b=VLOWf6b16SG1fGyasbiCvh7N0cQJKsaLiLJz60crJ2XNongmW1rGqgCQKauTlpeJhT
	Jni3ds1VITMBhpITWPRz/88lw9eDxP/HvaVDgfmW5XNBFaR2XEuiPEEhwwKy2WVbL/T2
	+trXh3VOpiLT3HPlPuy53SBZDjRM+Ug4PLcuQ+qkVKOeVjQ+FMEBRM0J0+wT56yk9Kle
	tyiD++DjtCOPwdEtDCg4Yt0f4OHg615E9EkxZP/5sKgK8qZuQdxOUHWAOL+kEFrjxvw7
	axPOUgjSFmQhV2VAXjGbmPn4z2pfQfdH/n+Qdb9VJDluAooburlRgfkvlQGWxWuhjAEA
	MaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=k+tLExJ4uHDfTiPWopJQEVaLyChrYukxK59h2tFuJZc=;
	b=Ju+9uJoZ1dthlkAkj+D1sPi8gqSAwFr2u77mRdOfo6KnwPxR3enLk7BRMwNYFVdrle
	9g1zGeIKkHA7cQxvQ7GzZCRL7UsUU6aH/QJF5yAX0QXLHzsiQ1fkQvhcj3AGVT1kIVrb
	DPJpQPzTgmo2XgtPQIQQkFVk1HSnZK10TbfSIgOo3JkjgnENJxrO3D5Na7+VISYm0Ejf
	6Bf7Ghpe+SN/CqhqsEhnljo1VNLXEDclxq7YE/5T0ZnGtg49zKCzppiUmKAhFLL0xEmb
	6FQvjpf50s0Q5SlNi31WBQ584y1a86xmYgQ4WlWBCj7FEqYEvUXpr8qVe43bBPEmsXlA
	qSxw==
X-Gm-Message-State: AOUpUlG4LRPEK8npWMRVomNGC68oUWMjF5jPBi4J07lphzJf2Pm1Xhf2
	2AtDDb92JWJeH+UoN+Tj+5jcbDbfAZVcWpdcS+g=
X-Google-Smtp-Source: AAOMgpfAY+CKYtvfLpCxObuJFq4XEByMgNu568mGDVH0GnDs/sLMh0pLpWLNZ+Qi9CEo0by+BTR0LP4McHesF64tr0w=
X-Received: by 2002:ab0:4c24:: with SMTP id
	l36-v6mr4685026uaf.199.1532202789700; 
	Sat, 21 Jul 2018 12:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAJO0J4j9an=54P1-Nq4PB9kOU+VP5xasSsVXZpbzAdKcqxR_zQ@mail.gmail.com>
In-Reply-To: <CAJO0J4j9an=54P1-Nq4PB9kOU+VP5xasSsVXZpbzAdKcqxR_zQ@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 21 Jul 2018 20:52:58 +0100
Message-ID: <CAO5Uq5RZX0DpSaEbZpmQ1_1Yi_4=6Y0jX5e77d5Z_FTuHVf+FA@mail.gmail.com>
To: ptsneves@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: u-boot crash on network code hardkernel v2017.05
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
X-List-Received-Date: Sat, 21 Jul 2018 19:53:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 21, 2018 at 11:09 AM Paulo Neves <ptsneves@gmail.com> wrote:
>
> Hello,
>
> I use a modified version of meta-odroid so that I can build u-boot
> from hardkernel v2017.05
> (https://github.com/hardkernel/u-boot.git@88af53fbcef8386cb4d5f04c19f4b2bcb69e90ca)
>
> Recently i noticed my u-boot crashes in any network operation (even
> ping) if it is compiled by the yocto toolchain. To abstract away any
> recipe differences and narrow down my changes to the toolchain, I
> cloned the hardkernel repository and made
>
> With Ubuntu 16.04.4 LTS and gcc-arm-linux-gnueabihf package [1]
>
> make CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm odroid-xu4_defconfig
> make CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm
> cd ./sdfuse
> ./sdfuse.sh /dev/mmcblk0
>
> The Odroid successfully boots
>
> On the other hand the exact same commands on the same workspace but
> with the PATH set to the yocto recipe-sysroot (sumo) I am able to boot
> but upon using a network resource it always hangs as below [2]. This
> is exactly the same crash behavior as the one produced by the normal
> yocto build.With u-boot built with the yocto toolchain, if i try to
> boot from the sd card everything works fine. The only way that the
> yocto toolchain seems to impact is in network related operations in
> u-boot. I have tried to correct some of the minor warnings that pop up
> in both versions. I also tried to build with -O0 but the problem
> persists.
>
> [1]
> ~/Projects/u-boot$ arm-linux-gnueabihf-gcc -v
> Using built-in specs.
> COLLECT_GCC=arm-linux-gnueabihf-gcc
> COLLECT_LTO_WRAPPER=/usr/lib/gcc-cross/arm-linux-gnueabihf/5/lto-wrapper
> Target: arm-linux-gnueabihf
> Configured with: ../src/configure -v --with-pkgversion='Ubuntu/Linaro
> 5.4.0-6ubuntu1~16.04.9'
> --with-bugurl=file:///usr/share/doc/gcc-5/README.Bugs
> --enable-languages=c,ada,c++,java,go,d,fortran,objc,obj-c++
> --prefix=/usr --program-suffix=-5 --enable-shared
> --enable-linker-build-id --libexecdir=/usr/lib
> --without-included-gettext --enable-threads=posix --libdir=/usr/lib
> --enable-nls --with-sysroot=/ --enable-clocale=gnu
> --enable-libstdcxx-debug --enable-libstdcxx-time=yes
> --with-default-libstdcxx-abi=new --enable-gnu-unique-object
> --disable-libitm --disable-libquadmath --enable-plugin
> --with-system-zlib --disable-browser-plugin --enable-java-awt=gtk
> --enable-gtk-cairo
> --with-java-home=/usr/lib/jvm/java-1.5.0-gcj-5-armhf-cross/jre
> --enable-java-home
> --with-jvm-root-dir=/usr/lib/jvm/java-1.5.0-gcj-5-armhf-cross
> --with-jvm-jar-dir=/usr/lib/jvm-exports/java-1.5.0-gcj-5-armhf-cross
> --with-arch-directory=arm
> --with-ecj-jar=/usr/share/java/eclipse-ecj.jar --disable-libgcj
> --enable-objc-gc --enable-multiarch --enable-multilib
> --disable-sjlj-exceptions --with-arch=armv7-a --with-fpu=vfpv3-d16
> --with-float=hard --with-mode=thumb --disable-werror --enable-multilib
> --enable-checking=release --build=x86_64-linux-gnu
> --host=x86_64-linux-gnu --target=arm-linux-gnueabihf
> --program-prefix=arm-linux-gnueabihf-
> --includedir=/usr/arm-linux-gnueabihf/include
> Thread model: posix
> gcc version 5.4.0 20160609 (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.9
>
> [2] TFTP from server 192.168.3.123; our IP address is 192.168.3.71
> Filename 'zImage'.
> Load address: 0x40008000
> Loading: *
>
>
> Let me know if you have any suggestions.
> Paulo Neves

Try cherry-picking 704f3acfcf55343043bbed01c5fb0a0094a68e8a:

http://git.denx.de/?p=u-boot.git;a=commit;h=704f3acfcf55343043bbed01c5fb0a0094a68e8a

-- 
Alex Kiernan

