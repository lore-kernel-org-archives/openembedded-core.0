Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1B6C760722
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 17:40:52 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id b5-v6so7981794qkg.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 10:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Fc4kdXcejoToa+TAr2l0rnd3/55/7CiWzunLHWD+X1I=;
	b=UgM2AyrpibHqAIgSGd8XcSYEo1DL3soVFQI6priSbONBqIfF4jheFmN67Nrd/xiMQK
	ogNpIpkRQqQv1EqKrTWrnQmXcnxEavptqEAXWIWq0JDeMyg8GdTdpKxc/SWNiTrd6BJv
	n536893tq11M9gbovAEIXDeY2s5E1DTn/0T7VCyQ+bAZaIvE/fLVZrS3Bbb28jY1O+O0
	Q+qglslWbzl/s+bLPU8awwfGFCu9iQ0yGsG3FCjRMk3Sx1kHRlvOR1tRFyLdvVTTU9k9
	8HxolAAMKZPLD0gYJI34gpKxX6W7GiuacM0ByOAtkEbS9kvwOGbdCIJJ4vebSByfn2K4
	1Enw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Fc4kdXcejoToa+TAr2l0rnd3/55/7CiWzunLHWD+X1I=;
	b=B+9xr+gD4Al4GhwTeDs55zLo9BNpYBj4770hDHWZUFwZtacDjiuYcFqz7r1sz3bxt5
	y0ghzwgzZk+OsQGgejrfyxBnDglyWzk7z4o+ej1KtPi6SxTVXzwdIY/keaUlW8rhpwvO
	04/GwiHG19NRI3IiCzYdJcNYm0iSCvFv7zGZuIpLDRljMbO0nsUc7MOseX5a1BcR0eUX
	C10v/r7CnWC/vWc/Du8pfy00R04Lin9KBrQFQRg0Xc+jwQVOOlW3H25DzJib1X/oygU7
	R8/c4tb3OrDZ2Td3op68EgI3k59Uz+SKKaaxvHorXX40TaBr4gbeq0oQvsEbF1w6Vn0z
	c9Pw==
X-Gm-Message-State: AOUpUlEr7rOgBaxX8XE3Toxd56aj8Ckm6L/vcvQxuTh5pqyWJzRClEq2
	YfvMIER9+CJki45tn8OZQGhDrdOhqzH+XJhERJA=
X-Google-Smtp-Source: AAOMgpe8ahSugUDCn3ks4AW2JxZ82xs8VQ13iwn1MRYFMP5OeRhuLk9pVzO3WIyrNqYepaGvCkn9KBGCTCOEX4UNt7M=
X-Received: by 2002:a37:4a94:: with SMTP id
	x142-v6mr5943389qka.110.1532194852803; 
	Sat, 21 Jul 2018 10:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAJO0J4j9an=54P1-Nq4PB9kOU+VP5xasSsVXZpbzAdKcqxR_zQ@mail.gmail.com>
	<CAJO0J4i6aBSo3pAT1Zd+nJVYCn0TQr_u58Pp1aEMYXX8+K5h+w@mail.gmail.com>
In-Reply-To: <CAJO0J4i6aBSo3pAT1Zd+nJVYCn0TQr_u58Pp1aEMYXX8+K5h+w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 21 Jul 2018 10:40:26 -0700
Message-ID: <CAMKF1sr=bDDMXhBWkuF6mM-o0mZeh0uyyfGvbHnNCpp6LX8nmw@mail.gmail.com>
To: Paulo Neves <ptsneves@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Sat, 21 Jul 2018 17:40:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 21, 2018 at 5:34 AM Paulo Neves <ptsneves@gmail.com> wrote:
>
> Replying to myself in the hope that it further helps:
>
> I narrowed down the bug to a gcc 7 problem. Using the prebuilt gcc
> from linaro, i am able to use networking functionalities in gccv6 but
> not gccv7. gcc7 is the default gcc version of poky/sumo.
>
> Paulo Neves
>
> On Sat, Jul 21, 2018 at 12:08 PM, Paulo Neves <ptsneves@gmail.com> wrote:
> > Hello,
> >
> > I use a modified version of meta-odroid so that I can build u-boot
> > from hardkernel v2017.05
> > (https://github.com/hardkernel/u-boot.git@88af53fbcef8386cb4d5f04c19f4b2bcb69e90ca)
> >
> > Recently i noticed my u-boot crashes in any network operation (even
> > ping) if it is compiled by the yocto toolchain. To abstract away any
> > recipe differences and narrow down my changes to the toolchain, I
> > cloned the hardkernel repository and made
> >
> > With Ubuntu 16.04.4 LTS and gcc-arm-linux-gnueabihf package [1]
> >
> > make CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm odroid-xu4_defconfig
> > make CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm
> > cd ./sdfuse
> > ./sdfuse.sh /dev/mmcblk0
> >
> > The Odroid successfully boots
> >
> > On the other hand the exact same commands on the same workspace but
> > with the PATH set to the yocto recipe-sysroot (sumo) I am able to boot
> > but upon using a network resource it always hangs as below [2]. This
> > is exactly the same crash behavior as the one produced by the normal
> > yocto build.With u-boot built with the yocto toolchain, if i try to
> > boot from the sd card everything works fine. The only way that the
> > yocto toolchain seems to impact is in network related operations in
> > u-boot. I have tried to correct some of the minor warnings that pop up
> > in both versions. I also tried to build with -O0 but the problem
> > persists.
> >
> > [1]
> > ~/Projects/u-boot$ arm-linux-gnueabihf-gcc -v
> > Using built-in specs.
> > COLLECT_GCC=arm-linux-gnueabihf-gcc
> > COLLECT_LTO_WRAPPER=/usr/lib/gcc-cross/arm-linux-gnueabihf/5/lto-wrapper
> > Target: arm-linux-gnueabihf
> > Configured with: ../src/configure -v --with-pkgversion='Ubuntu/Linaro
> > 5.4.0-6ubuntu1~16.04.9'
> > --with-bugurl=file:///usr/share/doc/gcc-5/README.Bugs
> > --enable-languages=c,ada,c++,java,go,d,fortran,objc,obj-c++
> > --prefix=/usr --program-suffix=-5 --enable-shared
> > --enable-linker-build-id --libexecdir=/usr/lib
> > --without-included-gettext --enable-threads=posix --libdir=/usr/lib
> > --enable-nls --with-sysroot=/ --enable-clocale=gnu
> > --enable-libstdcxx-debug --enable-libstdcxx-time=yes
> > --with-default-libstdcxx-abi=new --enable-gnu-unique-object
> > --disable-libitm --disable-libquadmath --enable-plugin
> > --with-system-zlib --disable-browser-plugin --enable-java-awt=gtk
> > --enable-gtk-cairo
> > --with-java-home=/usr/lib/jvm/java-1.5.0-gcj-5-armhf-cross/jre
> > --enable-java-home
> > --with-jvm-root-dir=/usr/lib/jvm/java-1.5.0-gcj-5-armhf-cross
> > --with-jvm-jar-dir=/usr/lib/jvm-exports/java-1.5.0-gcj-5-armhf-cross
> > --with-arch-directory=arm
> > --with-ecj-jar=/usr/share/java/eclipse-ecj.jar --disable-libgcj
> > --enable-objc-gc --enable-multiarch --enable-multilib
> > --disable-sjlj-exceptions --with-arch=armv7-a --with-fpu=vfpv3-d16
> > --with-float=hard --with-mode=thumb --disable-werror --enable-multilib
> > --enable-checking=release --build=x86_64-linux-gnu
> > --host=x86_64-linux-gnu --target=arm-linux-gnueabihf
> > --program-prefix=arm-linux-gnueabihf-
> > --includedir=/usr/arm-linux-gnueabihf/include
> > Thread model: posix
> > gcc version 5.4.0 20160609 (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.9
> >
> > [2] TFTP from server 192.168.3.123; our IP address is 192.168.3.71
> > Filename 'zImage'.
> > Load address: 0x40008000
> > Loading: *
> >
> >
> > Let me know if you have any suggestions.

can you see if latest u-boot also have similar issues ?
For me in past hardkernel uboot required gcc 4.9 and moment
i switched to newer gcc it borked.

> > Paulo Neves
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

