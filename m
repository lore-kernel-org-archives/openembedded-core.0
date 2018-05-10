Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id D31B1753AF;
	Thu, 10 May 2018 22:38:00 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id u8-v6so1380660vku.5;
	Thu, 10 May 2018 15:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=PCEjVm9kJCOaqXFfByUHoY62nY0ufPFsHq19Uql6iUk=;
	b=j8W9FETOwAA0IQclXAH3UGZtitdqQh+HsKRyeLaa7XhMRpl2wM3+WDWKgLoO5xkdgV
	Y10wnGL4GCh5oQU8oO4l3Dsqq60Vjbp3EKeT39zTBS/Q4BFdP1qFEfHnL80jkvB/xtvd
	F8yENi9FVN7hM4kYxIpKKxO9BhKmmD0N4T1iVM2ZPeeHiyNcdzIohUu8Ihx7CSeVrJrv
	XrEZNMWpdFb4NWiOhYKF1wfKCi50L4AaVbOsXRJFUFPm44r8BkNe6y8LMXEy0XRIjuUk
	3rslh5WQNRMZAoYSdnUoylLSvhomm9UOEmR8bGGl03qf7DGymb+dy+49EBK2Zi00ZdnR
	sRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=PCEjVm9kJCOaqXFfByUHoY62nY0ufPFsHq19Uql6iUk=;
	b=LWbh9uxPKm8BYr0mfk5KG7IFVize3aZZcHq1v9KHmRpQ8EQ3Jbb/yAVfWQh2wjlVdh
	67pje67A5wbcsHsfEGvroU1vZ+tLX+AfT4QL0J8aeUHC3d8XHPzKbKilqnw7yUadmtxX
	ej2zf6pjr6m1/HIOoO6uHMuM+/+CFUE51ztA4P2wiMbnrgNN9IYO+EzV8l3ciWf76Q41
	ACDBu0ChYKnzYglhb60jT9IuwwxoJKEcgHgUuLeI34Xob7fbZU/oUxRL7X0rpMfqGNjL
	DbkNf93XSrnFqJkiHGqK9nHZzmBC8GgNWAoR3PMCBRqSY20fO2BDG3IA+eDMxaVxgNZG
	KeRg==
X-Gm-Message-State: ALKqPwfLZ0Og7APHd36iBcHUO+Pogk66V/jet4g9dkYEroBzXzgtYzkt
	PB52bhbEGRnB+b0Dd1rEnRw42FP/E8SI+NE7Z68=
X-Google-Smtp-Source: AB8JxZprbYi+cRTWUQfQYoSY7pQyG5YerLv4b2D1a/P6tL7Vgo3FfSUI8VKT1SpFjkgCI1kiAepjkhHY+PkCB/CFa1Y=
X-Received: by 2002:a1f:4445:: with SMTP id
	r66-v6mr2321267vka.154.1525991881434; 
	Thu, 10 May 2018 15:38:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.48.148 with HTTP; Thu, 10 May 2018 15:38:00 -0700 (PDT)
In-Reply-To: <20180510220735.GD1954@jama>
References: <CAMKF1spa1bbrUjQWbhdUw3C4Cxu99fU=Be3sEm+SYFNq_oxEKw@mail.gmail.com>
	<CA+chaQcUU=Dew1cATDBpuA2_f_eh1=DAyEMaDHfVx7kY88rZhg@mail.gmail.com>
	<8d962430-ac63-5e97-fd32-2c0464c62acb@gmail.com>
	<20180510191145.GA1954@jama>
	<CAJ86T=Xz+2neJPBw41_sFxd977xp=zznsgzFdbeHJ-aysJNk+g@mail.gmail.com>
	<20180510214325.GC1954@jama> <20180510220735.GD1954@jama>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 10 May 2018 15:38:00 -0700
Message-ID: <CAJ86T=UpZ0+HTqre2Z4eAPM9LY_eH1EUO=e1v0sz7FPe4+8aRw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 10 May 2018 22:38:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 10, 2018 at 3:07 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Thu, May 10, 2018 at 11:43:25PM +0200, Martin Jansa wrote:
>> On Thu, May 10, 2018 at 12:27:50PM -0700, Andre McCurdy wrote:
>> > On Thu, May 10, 2018 at 12:11 PM, Martin Jansa <martin.jansa@gmail.com=
> wrote:
>> > > On Thu, May 10, 2018 at 11:50:02AM -0700, Khem Raj wrote:
>> > >> Hi Martin
>> > >>
>> > >> Thanks for testing and reporting back
>> > >>
>> > >> On 5/9/18 2:38 AM, Martin Jansa wrote:
>> > >> > My initial tests show couple issues, but usually caused by other =
changes
>> > >> > in that branch, not the gcc-8 itself.
>> > >> >
>> > >> > 1) strace-4.22 from
>> > >> > http://git.openembedded.org/openembedded-core-contrib/commit/?h=
=3Dkraj/gcc-8&id=3Daf33a8b721cc9caebd3f5226b4c5903f666ab654
>> > >> > fails to build with ptest enabled (it builds with 4.20 version if=
 I
>> > >> > revert this change)
>> > >> > ../../strace-4.22/tests/inject-nf.c: In function 'main':
>> > >> > ../../strace-4.22/tests/inject-nf.c:86:1: error: r7 cannot be use=
d in
>> > >> > asm here
>> > >> >   }
>> > >> >   ^
>> > >>
>> > >> are you targeting thumb1 ? how can I reproduce it ?
>> > >
>> > > I'm trying to find out what's different in the builds where it was
>> > > failing, will provide more info later.
>> >
>> > This is probably due to making an inline syscall from Thumb (doesn't a
>> > matter Thumb1 or Thumb2) with frame pointers enabled.
>> >
>> > Does adding -fomit-frame-pointer to CFLAGS fix it?
>>
>> It was with raspberrypi3, thumb (Thumb2) enabled in DISTRO, there is
>> already -fno-omit-frame-pointer in the default command line for it,
>> adding -fomit-frame-pointer at the end fixes it:
>>
>> docker-lge @ ~/build/build-webos-master/BUILD/work/raspberrypi3-webos-li=
nux-gnueabi/strace/4.22-r0/build/tests $ arm-webos-linux-gnueabi-gcc  -marc=
h=3Darmv7ve -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7=
 --sysroot=3D/OE/webos/build/build-webos-master/BUILD/work/raspberrypi3-web=
os-linux-gnueabi/strace/4.22-r0/recipe-sysroot -DHAVE_CONFIG_H    -I. -I../=
linux/arm -I../../strace-4.22/linux/arm -I../linux -I../../strace-4.22/linu=
x -I.. -I../../strace-4.22 -DTESTS_SIZEOF_KERNEL_LONG_T=3D4 -DTESTS_SIZEOF_=
LONG=3D4  -Wall -Wempty-body -Wformat-security -Wignored-qualifiers -Wimpli=
cit-fallthrough=3D5 -Winit-self -Wlogical-op -Wmissing-parameter-type -Wnes=
ted-externs -Wold-style-declaration -Wold-style-definition -Wsign-compare -=
Wtype-limits -Wwrite-strings -O -fno-omit-frame-pointer -g -feliminate-unus=
ed-debug-types -fdebug-prefix-map=3D/OE/webos/build/build-webos-master/BUIL=
D/work/raspberrypi3-webos-linux-gnueabi/strace/4.22-r0=3D/usr/src/debug/str=
ace/4.22-r0 -fdebug-prefix-map=3D/OE/webos/build/build-webos-master/BUILD/w=
ork/raspberrypi3-webos-linux-gnueabi/strace/4.22-r0/recipe-sysroot=3D -fdeb=
ug-prefix-map=3D/OE/webos/build/build-webos-master/BUILD/work/raspberrypi3-=
webos-linux-gnueabi/strace/4.22-r0/recipe-sysroot-native=3D  -pipe  -c -o i=
nject-nf.o ../../strace-4.22/tests/inject-nf.c -fomit-frame-pointer
>>
>> This might come from:
>> meta/conf/bitbake.conf:DEBUG_OPTIMIZATION =3D "-O -fno-omit-frame-pointe=
r ${DEBUG_FLAGS} -pipe"
>> because in this build I had DEBUG_BUILD enabled.
>>
>> Will retest with 4.20 version + DEBUG_BUILD to see if it fails there as =
well now.
>
> 4.20 doesn't fail with DEBUG_BUILD, because inject-nf.c test is new in
> 4.22:
>
> https://github.com/strace/strace/commit/58598cd7f6e23e531d71bfe5a4e35f898=
a4f3b2d#diff-dc01d20c1e55f8adf7536cb46d4481e1
>
> What is preferred fix for this? Is adding -fomit-frame-pointer to CFLAGS
> when ptest is in DISTRO_FEATURES acceptable solution?

I would say unconditionally adding -fomit-frame-pointer to CFLAGS for
all builds is OK (strace is a debug tool - not something that
generally needs to be debugged and frame pointers aren't essential for
debugging anyway).

