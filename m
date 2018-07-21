Return-Path: <ptsneves@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id A8C157899B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 12:34:12 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id r16-v6so13563808wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 05:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=JqpnsGiTu9BQd4HY2ktcgpUcItdBswo7Dwer8krJkUw=;
	b=hsaxZh4NZ+zzrFQqdP0qC7rB+rmgYB7T+kx0sv/rvKoCBmgT6weY+xksam63VXfIo+
	GMPo6IRI0L+YOStEDBnCbu4tA4ZJdNuC3CrwSiUz1e5xj83zKgYklhmU7rg1TaZogVEj
	NJvYdbiW6DJ4WHfuxK98Bn3slXn8L6DB/mq2fPmSAh+puJxAWlwYcp55F0B8v7S2dVGm
	RWkUsZoMAJ4Pz5NWB9LfiIr9IQBnFfmQ0H1YyWf+aalxLYgljAzGOeEXh+plCKwbd9dR
	mAIDxb80Q5GV8SVhz1WiLdydVIX+OdFjpWfiWx2c/DsQbpWpHLsWjDseFmxQTvk0YsIw
	iO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=JqpnsGiTu9BQd4HY2ktcgpUcItdBswo7Dwer8krJkUw=;
	b=Or4Jw1O+eveytP2LpbOgzMyQSeRMnfCMfRka+fiSFTESM1t6Y9Fc7wcd5u0MpS1MCM
	KkVt6UOZkzCQACmpTLKrcBy0/mAZua3Zklj8bpV2fua2pA8njc1awN1xjLN6eTVBT6WL
	p3x5ww6QyFiXCvyN9mbndjkepJazYMWkuXAWGzlEjz7Nak+h1TQ+tLdmeUt6zsh8XBK2
	KtgM7EWAsBig+qY6vzifXWFI9Iyt1H/T0wZkbD5q30d7AAz1/r0gDwugIFm6yDSrGJCL
	TRc426be0WKrTI3fnxRblzk+/0OQMFM+5y88AI1E9ZmZgPhrBJv8Kr80Y2patlgay9yT
	nBew==
X-Gm-Message-State: AOUpUlGfRRt0y8aOkPmyiWm/YNxBTothRbBwBdpwFUguWXcJddDM5JGp
	rPO7vsipL8KS3FBobZS8iOXW6e89fHdbBeuwcg==
X-Google-Smtp-Source: AAOMgpev6UEgM3TZHzoSaOxO90tPQxKFF7RCgIsQKDiYmhQ2WWiiFZaO6uM361t/swFwXJzTXGRNoyuq3FefCLEJmTs=
X-Received: by 2002:a5d:5641:: with SMTP id
	j1-v6mr4058614wrw.209.1532176453218; 
	Sat, 21 Jul 2018 05:34:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1c:e719:0:0:0:0:0 with HTTP; Sat, 21 Jul 2018 05:34:12
	-0700 (PDT)
In-Reply-To: <CAJO0J4j9an=54P1-Nq4PB9kOU+VP5xasSsVXZpbzAdKcqxR_zQ@mail.gmail.com>
References: <CAJO0J4j9an=54P1-Nq4PB9kOU+VP5xasSsVXZpbzAdKcqxR_zQ@mail.gmail.com>
From: Paulo Neves <ptsneves@gmail.com>
Date: Sat, 21 Jul 2018 14:34:12 +0200
Message-ID: <CAJO0J4i6aBSo3pAT1Zd+nJVYCn0TQr_u58Pp1aEMYXX8+K5h+w@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Sat, 21 Jul 2018 12:34:12 -0000
Content-Type: text/plain; charset="UTF-8"

Replying to myself in the hope that it further helps:

I narrowed down the bug to a gcc 7 problem. Using the prebuilt gcc
from linaro, i am able to use networking functionalities in gccv6 but
not gccv7. gcc7 is the default gcc version of poky/sumo.

Paulo Neves

On Sat, Jul 21, 2018 at 12:08 PM, Paulo Neves <ptsneves@gmail.com> wrote:
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

