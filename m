Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id E7D6C751E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 19:49:51 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id t22-v6so851374oih.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 12:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c2df37msyC3+dURCqLxHzIp/XCA2BmNfA/+9BMnHxWE=;
	b=UI+bEt7Uhy4T+vNAcnCgdHtXQ1jU/EoPcHPEPyEDYfTahtU0xBo/2GXmscEHH0rvF/
	9eV+StpbEDi5DvQX1Jjy5m+nYRG3UewEPPZpKLWuci1Nw8vrEyJNVQmrPEmD3PEnRBak
	SwgqMDsmIWBNukNn/rza+ogaHI7UGCL/Cz4wCTi3ps6pKkf2cRanpFugmx+YVhQGoBxq
	SwrGXRJ0nG+rESqYPS3LtwtMYHIyncBjzlc08KjBtUTF1tC5WgZVSLybqLeKZ13H1gXz
	P+vIKbfVv6yQaDNg/nM+XQ8u0LeF6ASgg+HaEMZV0GeZ7muSKn8hOE0o081pCedGwmJr
	iV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c2df37msyC3+dURCqLxHzIp/XCA2BmNfA/+9BMnHxWE=;
	b=ZO/jmTF3Lvhdue+5pkSH7dnABtrzOqfPYznEmHQWA8LVRqLOHhlgas4BNCtpPyezRQ
	z2oSWTLafb9Eiz06SVNURMYmNKby3tO9+K/n+GQxqEHW2Q72p+Gz0CHrDy1AyXK1N8Ur
	XckDcVPpE0nPM9j2HOlqGKGNd2NPTW7qKSxA3LsFixzv8wv+1ICrG3wI5QesvK/4J/Bn
	ITooRPEhflrjUQ8guHbLXcS2hPbtM5QlSS8A3JuPFRdRt6njQwX22kVY59Nsi8CzVc9d
	WZYPRI+D2nn8/GKWUAfaaULkeZG5k+sqpH5VBhonpf9Nu2+j1jYDHmYtueWptRoGn5BL
	OD9g==
X-Gm-Message-State: APt69E03ViZ3eVEdmzKDaM4yF2fzm6ByxEARZd9UepmKeNhJkPyul3Ya
	AUEdWsNi60oBszkorSaVH0f/OriNiRsuS4i5rGroBg==
X-Google-Smtp-Source: ADUXVKJnll3rT6rw9K7LC6oiYzB43W0ZhWqFjjyaR8sNse8RXqglbANr93+29loceaamjvB+aHpC93lrI+gBWah1Wkg=
X-Received: by 2002:aca:2808:: with SMTP id
	8-v6mr10676120oix.235.1529437792882; 
	Tue, 19 Jun 2018 12:49:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Tue, 19 Jun 2018 12:49:32
	-0700 (PDT)
In-Reply-To: <282aab6b-9e7c-1d85-8e1e-443d1156c1fa@gmail.com>
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
	<20180504123244.43049-12-alexander.kanavin@linux.intel.com>
	<32602a82-f07d-3c69-2305-3f0f17f4c9dc@windriver.com>
	<CAJTo0La2eicsFUCAPOktYs110iFdOrFWNzLXC+EeeRrDzBHtNQ@mail.gmail.com>
	<282aab6b-9e7c-1d85-8e1e-443d1156c1fa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Jun 2018 20:49:32 +0100
Message-ID: <CAJTo0LY-xmzar7jRYeboJJ5krAULqPMdwpS7hxgbC8m52uTEew@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/14] meson: update to 0.46.0 -- broke systemd on qemuppc
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
X-List-Received-Date: Tue, 19 Jun 2018 19:49:52 -0000
Content-Type: text/plain; charset="UTF-8"

On 19 June 2018 at 17:00, Khem Raj <raj.khem@gmail.com> wrote:
>>> I recently started testing qemuppc by booting
>>> core-image-minimal with systemd as init. It fails with:
>>>
>>>     /sbin/init: error while loading shared libraries:
>>>        /lib/systemd/libsystemd-shared-237.so: R_PPC_REL24 relocation at
>>> 0x0054574c for symbol `strlen' out of range
>
>
> This would also indicate that libsystemd is probably missing -fPIC during
> compile, can you check the compiler cmdline passed when building on of .o
> files that gets includes in libsystemd.

[1/1423] powerpc-poky-linux-gcc -m32 -mhard-float -mcpu=7400 -mno-spe
-fstack-protector-strong -D_FORTIFY_SOURCE=2 -no-pie -fno-PIE
--sysroot=/data/poky-tmp/master/work/ppc7400-poky-linux/systemd/1_237-r0/recipe-sysroot
-Isrc/libsystemd/src@libsystemd@@systemd@sta -Isrc/libsystemd
-I../git/src/libsystemd -Isrc/basic -I../git/src/basic -Isrc/shared
-I../git/src/shared -Isrc/systemd -I../git/src/systemd -Isrc/journal
-I../git/src/journal -Isrc/resolve -I../git/src/resolve -Isrc/timesync
-I../git/src/timesync -Isrc/login -I../git/src/login -Isrc/udev
-I../git/src/udev -Isrc/libudev -I../git/src/libudev -Isrc/core
-I../git/src/core -I../git/src/libsystemd/sd-bus
-I../git/src/libsystemd/sd-device -I../git/src/libsystemd/sd-hwdb
-I../git/src/libsystemd/sd-id128 -I../git/src/libsystemd/sd-netlink
-I../git/src/libsystemd/sd-network -Isrc/libsystemd-network
-I../git/src/libsystemd-network -I. -I../git/
-fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -std=gnu99
-Wextra -Werror=undef -Wlogical-op -Wmissing-include-dirs
-Wold-style-definition -Wpointer-arith -Winit-self
-Wdeclaration-after-statement -Wfloat-equal
-Wsuggest-attribute=noreturn -Werror=missing-prototypes
-Werror=implicit-function-declaration -Werror=missing-declarations
-Werror=return-type -Werror=incompatible-pointer-types
-Werror=format=2 -Wstrict-prototypes -Wredundant-decls
-Wmissing-noreturn -Wimplicit-fallthrough=5 -Wshadow -Wendif-labels
-Wstrict-aliasing=2 -Wwrite-strings -Werror=overflow -Wdate-time
-Wnested-externs -ffast-math -fno-common -fdiagnostics-show-option
-fno-strict-aliasing -fvisibility=hidden -fstack-protector
-fstack-protector-strong --param=ssp-buffer-size=4 -fPIE
-Wno-unused-parameter -Wno-missing-field-initializers
-Wno-unused-result -Wno-format-signedness -Wno-error=nonnull
-Werror=shadow -ffunction-sections -fdata-sections -include config.h
-fPIC -pthread -fvisibility=default -m32 -mhard-float -mcpu=7400
-mno-spe -fstack-protector-strong -D_FORTIFY_SOURCE=2 -no-pie -fno-PIE
--sysroot=/data/poky-tmp/master/work/ppc7400-poky-linux/systemd/1_237-r0/recipe-sysroot
-O2 -pipe -g -feliminate-unused-debug-types
-fdebug-prefix-map=/data/poky-tmp/master/work/ppc7400-poky-linux/systemd/1_237-r0=/usr/src/debug/systemd/1_237-r0
-fdebug-prefix-map=/data/poky-tmp/master/work/ppc7400-poky-linux/systemd/1_237-r0/recipe-sysroot=
-fdebug-prefix-map=/data/poky-tmp/master/work/ppc7400-poky-linux/systemd/1_237-r0/recipe-sysroot-native=
-MD -MQ 'src/libsystemd/src@libsystemd@@systemd@sta/sd-utf8_sd-utf8.c.o'
-MF 'src/libsystemd/src@libsystemd@@systemd@sta/sd-utf8_sd-utf8.c.o.d'
-o 'src/libsystemd/src@libsystemd@@systemd@sta/sd-utf8_sd-utf8.c.o' -c
../git/src/libsystemd/sd-utf8/sd-utf8.c

You're right, no -fPIC.  The no-PIE flags are coming from
SECURITY_NOPIE_CFLAGS.  I'm guessing security_flags is interacting
badly with ppc again?

Ross

