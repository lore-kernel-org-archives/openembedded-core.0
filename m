Return-Path: <ptsneves@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id DCE2260190
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 07:46:55 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id g6-v6so16878064wrp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 00:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=N2lnAPJrrQmodKmENgtAs9bl53O9iMRdht4T9LTjAr4=;
	b=OvPiWMLvatNYKajHA/vdnibjgJguoWsfMvSTMgf1jYLwF2U0h9XtCGMp61oc6xVI4I
	5DAJKdTgz7s9J1NVBYkw89KcAhURj07KrHii4LNDZbVeJi6kPa7pR9w4FMOnX05e3MzW
	DO8I9Ey+6Qf4+JK41DJj5OjiAQ2VNyaucvXxgADWchETiGQXrLz5DLYKOc+r22Cx72CC
	NCsbAUPU/l9oJGCk961WeulYxkSRYwvzkJZ1BCygHbdlZbV3P2lfSR8ky6DBgq19glh5
	ZElrnRcL/nhTXpmRhEe7IYmFLs+fqM2VRxrbYTOmGbS2dpX032TP8vvHu3jyMdtYl7CY
	FSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=N2lnAPJrrQmodKmENgtAs9bl53O9iMRdht4T9LTjAr4=;
	b=MXNb45rr3CTY5jchx6nqNpp73saOs5M0kXQncJ0FB4uvk3VWJ1Rf2AKexGcq7wGkAa
	tXfD6NDviHgLPImsuIRr1yU+OPZZf81KgU9rmNsGtnEAYAHr1bY8EKTxxrpAqPFhUDDI
	wGg3kGa7m0ESVhKjIo11T1Ax3QHZOwai+01Y1o/iQ2Tzwic9tE67Dgz2HPskQGz+hBJj
	Ya8QZZvvScU5YzUAIn0xZPS9IbJ620QJ1r77J2e+F50JFa4RQZwsI2luuUfrz/s37i0d
	1RNWy63Cv+EzyNhXNgE9L8vUQVD1LlsiXKqWtIeJHE18Ch2iRrS57ULx/C+jYbbQSXRN
	fShQ==
X-Gm-Message-State: AOUpUlGsmoVa7MkBPkNKS5W5KH3KHHksuRPzcBMEBV2o9qlwrrBzK4kG
	z5hwRzuBRxu9PUAOiqC5BGBD6OQnU7t8RtFM1zHUJbQ=
X-Google-Smtp-Source: AAOMgpdZgQQk2gPxVW9EUSLYw4O+ih8NP0THl4/dTcLdbUmv8Z6hNu6a/6kMzlklXEVnP46VfnDvNXfYtv5N6bB9Dzs=
X-Received: by 2002:adf:b1d2:: with SMTP id
	r18-v6mr8076489wra.79.1532332016608; 
	Mon, 23 Jul 2018 00:46:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1c:e719:0:0:0:0:0 with HTTP; Mon, 23 Jul 2018 00:46:56
	-0700 (PDT)
In-Reply-To: <CAO5Uq5RZX0DpSaEbZpmQ1_1Yi_4=6Y0jX5e77d5Z_FTuHVf+FA@mail.gmail.com>
References: <CAJO0J4j9an=54P1-Nq4PB9kOU+VP5xasSsVXZpbzAdKcqxR_zQ@mail.gmail.com>
	<CAO5Uq5RZX0DpSaEbZpmQ1_1Yi_4=6Y0jX5e77d5Z_FTuHVf+FA@mail.gmail.com>
From: Paulo Neves <ptsneves@gmail.com>
Date: Mon, 23 Jul 2018 09:46:56 +0200
Message-ID: <CAJO0J4jak3gmG1jOwDm3hce2tq6PJqdaU0GK-GR0VHA7dM4wyw@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 23 Jul 2018 07:46:56 -0000
Content-Type: text/plain; charset="UTF-8"

@Alex: Thanks for that commit id. I tried to manually add the
attribute but just to the net include[1], but the problem had not been
solved. I see in this commit more packed attributes changes, so I will
give it a try and let you all know.

>can you see if latest u-boot also have similar issues ?
>For me in past hardkernel uboot required gcc 4.9 and moment
>i switched to newer gcc it borked.
@Khem I saw your recipe commit, and was ready to commit to the same
solution you did in meta-odroid, of just downloading the prebuilt
linaro toolchain and use it to build u-boot. Even so this raises an
issue: Is there not a better way to depend on a version of GCC for a
specific recipe? Solving issues like these can be way beyond most
people's abilities (at least my own), and having a mechanism in yocto
to choose another gcc version might be desirable.

Paulo Neves

[1] https://lists.denx.de/pipermail/u-boot//2017-July/298986.html

On Sat, Jul 21, 2018 at 9:52 PM, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> On Sat, Jul 21, 2018 at 11:09 AM Paulo Neves <ptsneves@gmail.com> wrote:
>>
>> Hello,
>>
>> I use a modified version of meta-odroid so that I can build u-boot
>> from hardkernel v2017.05
>> (https://github.com/hardkernel/u-boot.git@88af53fbcef8386cb4d5f04c19f4b2bcb69e90ca)
>>
>> Recently i noticed my u-boot crashes in any network operation (even
>> ping) if it is compiled by the yocto toolchain. To abstract away any
>> recipe differences and narrow down my changes to the toolchain, I
>> cloned the hardkernel repository and made
>>
>> With Ubuntu 16.04.4 LTS and gcc-arm-linux-gnueabihf package [1]
>>
>> make CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm odroid-xu4_defconfig
>> make CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm
>> cd ./sdfuse
>> ./sdfuse.sh /dev/mmcblk0
>>
>> The Odroid successfully boots
>>
>> On the other hand the exact same commands on the same workspace but
>> with the PATH set to the yocto recipe-sysroot (sumo) I am able to boot
>> but upon using a network resource it always hangs as below [2]. This
>> is exactly the same crash behavior as the one produced by the normal
>> yocto build.With u-boot built with the yocto toolchain, if i try to
>> boot from the sd card everything works fine. The only way that the
>> yocto toolchain seems to impact is in network related operations in
>> u-boot. I have tried to correct some of the minor warnings that pop up
>> in both versions. I also tried to build with -O0 but the problem
>> persists.
>>
>> [1]
>> ~/Projects/u-boot$ arm-linux-gnueabihf-gcc -v
>> Using built-in specs.
>> COLLECT_GCC=arm-linux-gnueabihf-gcc
>> COLLECT_LTO_WRAPPER=/usr/lib/gcc-cross/arm-linux-gnueabihf/5/lto-wrapper
>> Target: arm-linux-gnueabihf
>> Configured with: ../src/configure -v --with-pkgversion='Ubuntu/Linaro
>> 5.4.0-6ubuntu1~16.04.9'
>> --with-bugurl=file:///usr/share/doc/gcc-5/README.Bugs
>> --enable-languages=c,ada,c++,java,go,d,fortran,objc,obj-c++
>> --prefix=/usr --program-suffix=-5 --enable-shared
>> --enable-linker-build-id --libexecdir=/usr/lib
>> --without-included-gettext --enable-threads=posix --libdir=/usr/lib
>> --enable-nls --with-sysroot=/ --enable-clocale=gnu
>> --enable-libstdcxx-debug --enable-libstdcxx-time=yes
>> --with-default-libstdcxx-abi=new --enable-gnu-unique-object
>> --disable-libitm --disable-libquadmath --enable-plugin
>> --with-system-zlib --disable-browser-plugin --enable-java-awt=gtk
>> --enable-gtk-cairo
>> --with-java-home=/usr/lib/jvm/java-1.5.0-gcj-5-armhf-cross/jre
>> --enable-java-home
>> --with-jvm-root-dir=/usr/lib/jvm/java-1.5.0-gcj-5-armhf-cross
>> --with-jvm-jar-dir=/usr/lib/jvm-exports/java-1.5.0-gcj-5-armhf-cross
>> --with-arch-directory=arm
>> --with-ecj-jar=/usr/share/java/eclipse-ecj.jar --disable-libgcj
>> --enable-objc-gc --enable-multiarch --enable-multilib
>> --disable-sjlj-exceptions --with-arch=armv7-a --with-fpu=vfpv3-d16
>> --with-float=hard --with-mode=thumb --disable-werror --enable-multilib
>> --enable-checking=release --build=x86_64-linux-gnu
>> --host=x86_64-linux-gnu --target=arm-linux-gnueabihf
>> --program-prefix=arm-linux-gnueabihf-
>> --includedir=/usr/arm-linux-gnueabihf/include
>> Thread model: posix
>> gcc version 5.4.0 20160609 (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.9
>>
>> [2] TFTP from server 192.168.3.123; our IP address is 192.168.3.71
>> Filename 'zImage'.
>> Load address: 0x40008000
>> Loading: *
>>
>>
>> Let me know if you have any suggestions.
>> Paulo Neves
>
> Try cherry-picking 704f3acfcf55343043bbed01c5fb0a0094a68e8a:
>
> http://git.denx.de/?p=u-boot.git;a=commit;h=704f3acfcf55343043bbed01c5fb0a0094a68e8a
>
> --
> Alex Kiernan

