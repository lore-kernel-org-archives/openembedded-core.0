Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id AB8D8753D4;
	Thu, 10 May 2018 22:40:54 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id h15-v6so2379881uan.11;
	Thu, 10 May 2018 15:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lp0jyg32zgHIreJCVBPWf/cP82d7HLaaD8T4CFXMwvc=;
	b=WvBZTiZDl1Ow4d6KHxgA9iEcUJccLMgf+iaxpjL8X97wfNSb3pPif8E53hRPhtbrid
	utYGNCfftNAauSpWrq2y6f8BO5DE7gFyR1kOQvy848BykLQftX/VUTH0OYxKlC+SmV6B
	R2y9PwM/ZV8eC2njCSST39PUw+DyNszpajM4Pr2p2yeeToLb5Vgq+ccHuua+NpBMVqZF
	2ioKUoyYo5W2jSSlGTONPGy8cM3qHP+Y6EN2pXzRUzUTsdt5N9zNfsEdxOivn44HmZ3t
	eJPNBMa+QcWv9ZipcXP9Id3h7o/zwZukoCSPEOUcDr7bzhqe3Y7b1IJj8ck5nu4IK0zc
	vTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lp0jyg32zgHIreJCVBPWf/cP82d7HLaaD8T4CFXMwvc=;
	b=BlvGxOhjWE2+K9xxWq+NukQAqDZbVlDEe1Xqvf5hRd8EAX9F8FXHsL0hgIvENfhT2Y
	5UCAfaiPmn156rTAXKS0/jWcnu/bzYcyD5oE5u24umIPMMsNnGgjl5MZgJyfaGJCK715
	yK4GlwMHOXEc7wSLuGd8OghIxol0/tw+5rkcL0AU40hTtJS9AU6KPV/sP4J+M/Uamahk
	SatnypPzhz1h0NgRwjZQkaG9xUgoRxM0mlB/T9DVSbiP5BO5Da3m+wZbGiZghujtuzLy
	FJzSFYjiy87SlTDeQmhpvO9Btb4n24j7b62d/3OQwG0mj0PjMRxDDDN3NG1rLF5SJmLl
	yURA==
X-Gm-Message-State: ALKqPwel6kzJ3aPPIRtB08/zgi8P2XUPzhX57yhnrLzZ7E2D49KQhW6C
	JOJBo22Q59VmyWuxsrkoZXYZL0W9o/i9fZ6k4As=
X-Google-Smtp-Source: AB8JxZpSe5jEzdQAivarkbVztryCqVqGh7XM8oq5GBiD0XO/wnqsju9925YjI4SPb5kDgIgnsFsrAvjbG7/It5hbwS8=
X-Received: by 2002:ab0:2054:: with SMTP id
	g20-v6mr2608854ual.150.1525992053822; 
	Thu, 10 May 2018 15:40:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.48.148 with HTTP; Thu, 10 May 2018 15:40:53 -0700 (PDT)
In-Reply-To: <CA+chaQcTPwJy+dL6GvBKJTcZuiVUiztVqEDXmSwZ==b53m_mcQ@mail.gmail.com>
References: <CAMKF1spa1bbrUjQWbhdUw3C4Cxu99fU=Be3sEm+SYFNq_oxEKw@mail.gmail.com>
	<CA+chaQcUU=Dew1cATDBpuA2_f_eh1=DAyEMaDHfVx7kY88rZhg@mail.gmail.com>
	<8d962430-ac63-5e97-fd32-2c0464c62acb@gmail.com>
	<20180510191145.GA1954@jama>
	<CAJ86T=Xz+2neJPBw41_sFxd977xp=zznsgzFdbeHJ-aysJNk+g@mail.gmail.com>
	<20180510214325.GC1954@jama> <20180510220735.GD1954@jama>
	<CAJ86T=UpZ0+HTqre2Z4eAPM9LY_eH1EUO=e1v0sz7FPe4+8aRw@mail.gmail.com>
	<CA+chaQcTPwJy+dL6GvBKJTcZuiVUiztVqEDXmSwZ==b53m_mcQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 10 May 2018 15:40:53 -0700
Message-ID: <CAJ86T=XkBkKhK6mwqxnFA1CkaV5swjGKsdNv_7E9fgFa=qhdCw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembedded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [RFT] GCC 8.1
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
X-List-Received-Date: Thu, 10 May 2018 22:40:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 10, 2018 at 3:38 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> see
> http://lists.openembedded.org/pipermail/openembedded-core/2018-May/150654.html

Removing -fno-omit-frame-pointer isn't the same as adding
-fomit-frame-pointer. Frame pointers may get enabled depending on the
optimisation level etc (ie not only by -fno-omit-frame-pointer).

> On Fri, May 11, 2018 at 12:38 AM Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> On Thu, May 10, 2018 at 3:07 PM, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>> > On Thu, May 10, 2018 at 11:43:25PM +0200, Martin Jansa wrote:
>> >> On Thu, May 10, 2018 at 12:27:50PM -0700, Andre McCurdy wrote:
>> >> > On Thu, May 10, 2018 at 12:11 PM, Martin Jansa
>> >> > <martin.jansa@gmail.com> wrote:
>> >> > > On Thu, May 10, 2018 at 11:50:02AM -0700, Khem Raj wrote:
>> >> > >> Hi Martin
>> >> > >>
>> >> > >> Thanks for testing and reporting back
>> >> > >>
>> >> > >> On 5/9/18 2:38 AM, Martin Jansa wrote:
>> >> > >> > My initial tests show couple issues, but usually caused by other
>> >> > >> > changes
>> >> > >> > in that branch, not the gcc-8 itself.
>> >> > >> >
>> >> > >> > 1) strace-4.22 from
>> >> > >> >
>> >> > >> > http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/gcc-8&id=af33a8b721cc9caebd3f5226b4c5903f666ab654
>> >> > >> > fails to build with ptest enabled (it builds with 4.20 version
>> >> > >> > if I
>> >> > >> > revert this change)
>> >> > >> > ../../strace-4.22/tests/inject-nf.c: In function 'main':
>> >> > >> > ../../strace-4.22/tests/inject-nf.c:86:1: error: r7 cannot be
>> >> > >> > used in
>> >> > >> > asm here
>> >> > >> >   }
>> >> > >> >   ^
>> >> > >>
>> >> > >> are you targeting thumb1 ? how can I reproduce it ?
>> >> > >
>> >> > > I'm trying to find out what's different in the builds where it was
>> >> > > failing, will provide more info later.
>> >> >
>> >> > This is probably due to making an inline syscall from Thumb (doesn't
>> >> > a
>> >> > matter Thumb1 or Thumb2) with frame pointers enabled.
>> >> >
>> >> > Does adding -fomit-frame-pointer to CFLAGS fix it?
>> >>
>> >> It was with raspberrypi3, thumb (Thumb2) enabled in DISTRO, there is
>> >> already -fno-omit-frame-pointer in the default command line for it,
>> >> adding -fomit-frame-pointer at the end fixes it:
>> >>
>> >> docker-lge @
>> >> ~/build/build-webos-master/BUILD/work/raspberrypi3-webos-linux-gnueabi/strace/4.22-r0/build/tests
>> >> $ arm-webos-linux-gnueabi-gcc  -march=armv7ve -mthumb -mfpu=neon-vfpv4
>> >> -mfloat-abi=hard -mcpu=cortex-a7
>> >> --sysroot=/OE/webos/build/build-webos-master/BUILD/work/raspberrypi3-webos-linux-gnueabi/strace/4.22-r0/recipe-sysroot
>> >> -DHAVE_CONFIG_H    -I. -I../linux/arm -I../../strace-4.22/linux/arm
>> >> -I../linux -I../../strace-4.22/linux -I.. -I../../strace-4.22
>> >> -DTESTS_SIZEOF_KERNEL_LONG_T=4 -DTESTS_SIZEOF_LONG=4  -Wall -Wempty-body
>> >> -Wformat-security -Wignored-qualifiers -Wimplicit-fallthrough=5 -Winit-self
>> >> -Wlogical-op -Wmissing-parameter-type -Wnested-externs
>> >> -Wold-style-declaration -Wold-style-definition -Wsign-compare -Wtype-limits
>> >> -Wwrite-strings -O -fno-omit-frame-pointer -g -feliminate-unused-debug-types
>> >> -fdebug-prefix-map=/OE/webos/build/build-webos-master/BUILD/work/raspberrypi3-webos-linux-gnueabi/strace/4.22-r0=/usr/src/debug/strace/4.22-r0
>> >> -fdebug-prefix-map=/OE/webos/build/build-webos-master/BUILD/work/raspberrypi3-webos-linux-gnueabi/strace/4.22-r0/recipe-sysroot=
>> >> -fdebug-prefix-map=/OE/webos/build/build-webos-master/BUILD/work/raspberrypi3-webos-linux-gnueabi/strace/4.22-r0/recipe-sysroot-native=
>> >> -pipe  -c -o inject-nf.o ../../strace-4.22/tests/inject-nf.c
>> >> -fomit-frame-pointer
>> >>
>> >> This might come from:
>> >> meta/conf/bitbake.conf:DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer
>> >> ${DEBUG_FLAGS} -pipe"
>> >> because in this build I had DEBUG_BUILD enabled.
>> >>
>> >> Will retest with 4.20 version + DEBUG_BUILD to see if it fails there as
>> >> well now.
>> >
>> > 4.20 doesn't fail with DEBUG_BUILD, because inject-nf.c test is new in
>> > 4.22:
>> >
>> >
>> > https://github.com/strace/strace/commit/58598cd7f6e23e531d71bfe5a4e35f898a4f3b2d#diff-dc01d20c1e55f8adf7536cb46d4481e1
>> >
>> > What is preferred fix for this? Is adding -fomit-frame-pointer to CFLAGS
>> > when ptest is in DISTRO_FEATURES acceptable solution?
>>
>> I would say unconditionally adding -fomit-frame-pointer to CFLAGS for
>> all builds is OK (strace is a debug tool - not something that
>> generally needs to be debugged and frame pointers aren't essential for
>> debugging anyway).

