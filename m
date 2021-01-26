Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web09.16214.1611683653651219112
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 09:54:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i0G2DEQt;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: andrey.z@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id i187so13636113lfd.4
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 09:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6j/UdVTPvc6sSVV2K8clOzl6QVX/R7qQul6YqnHLWgg=;
        b=i0G2DEQt6fR8FemGR+N2Q1o8sRmqRwEs4akQxTcpXgYF4lnKG8fWJmW3BQ5v/4XKIN
         BThOYXa0mb4BfG6CERbK+HlQ3vI1701O4DpkAOnG+3dgrPzBA0yX08W1hp8maXt5ZnSZ
         fijenxjCF94uH2/Sg/uaYf+t6ULX4yobhQevNNtv6w81gL76Wkurv5fTv9Fxd46+ykA3
         t6W7yqwQUx0VK3uONk6LpS5kZfmNwScQjJzp7/CCS+HMvpyuXFE9BJ2pqSRVlKHzV47e
         9JmOm/FqZCX+zwRH9jpZHSbvypulxuDK25Heu1SkDXZML1/Vpd3wUkVklh827F1ANCkX
         k0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6j/UdVTPvc6sSVV2K8clOzl6QVX/R7qQul6YqnHLWgg=;
        b=JRFWiqupNjkuVGRxvvV+FkZejUrNlALe2+2OqV3mYOxYAKled6Z5urzq/h5MeFF/9h
         fLnED2hS6VHluZSzTE+CXGhglqELrp3bg84Tdl+wU7TIZXBNX3mKmQ1zTqLxTiZldQMH
         V+nQrY47J34pawLVGBKeQw2FYroiTNZxc44KtJgjMpiFBJ8JSiq1BbaYOGWcuXMhw0vb
         vS0FnZuoSZ5USij3UoHGIGBqjSZNLLQEbSrvTpvHRs2piRJpzhOymUGR0BEMKPYFHTHo
         DlD0rTM5dYqLMRy8eGqUgc2ZcQW4/UDb1MVrrha15Ej8Fn4R/lMzg4j4QaQEk2oCyMb9
         ulkQ==
X-Gm-Message-State: AOAM532WOmWmn6qdeQramQPIOPbzN/Ws7pf3laUVRZIzBY/hZpYNaLs1
	V4Z04bE4m3GAZ5OJbUSza/1+YKJrx2ipDUo7apo=
X-Google-Smtp-Source: ABdhPJyPVhRYS918Ebzc9r9jmuOwTTniwx7cBl+MiUGYhXQWH3rMuaTJU3d1+QNwlMTgTVagu9cNFu/l8dk4EQpL3X0=
X-Received: by 2002:ac2:4310:: with SMTP id l16mr3422667lfh.138.1611683651796;
 Tue, 26 Jan 2021 09:54:11 -0800 (PST)
MIME-Version: 1.0
References: <CAHtQpK71uAoq_hwDGJCvt5O_=kNXHkWFkmHC-BQkzcSCM3ys7A@mail.gmail.com>
 <CAOSpxdZ_0+QOwnpaCMMm=+1WUcedQ7aqnm=rmg1=_bU8TWOELQ@mail.gmail.com>
 <CAHtQpK7N-vmpvTpm2Jt-3Q4i+WXtMHfNSq4Jf+BsgsjkETwv7Q@mail.gmail.com>
 <559613c2-7d69-8ec6-a341-84ebf036d1b9@actia.se> <CA+chaQffacKr+9M5ibjui4Xt69+7vz3xLWdSpbO=hA5JcNW20Q@mail.gmail.com>
In-Reply-To: <CA+chaQffacKr+9M5ibjui4Xt69+7vz3xLWdSpbO=hA5JcNW20Q@mail.gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Tue, 26 Jan 2021 18:53:58 +0100
Message-ID: <CAHtQpK79JcJ9WPCzDcSa6jkBTZG3yVrEmGdqVHPDeT0yU83b7Q@mail.gmail.com>
Subject: Re: [OE-core] [dunfell]: gpsd recipe (3.19) build is broken
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: John Ernberg <john.ernberg@actia.se>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hello John and Martin,

On Tue, Jan 26, 2021 at 5:31 PM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> Yes, it's related to rebuilding in the same WORKDIR and the only fix which is needed to be backported to dunfell should be:
> 04afc692a gpsd: mark CLEANBROKEN
>
> see the previous discussion about this issue:
> https://lists.openembedded.org/g/openembedded-devel/topic/74225704#84379

Actually, I remember I was reading this and put it on my "internal
watch list", but quickly dropped it since the solution was provided!

Martin,
Would it be possible to cherry-pick that commit onto dunfell to fix
those build errors then?

>
> On Tue, Jan 26, 2021 at 7:58 AM John Ernberg <john.ernberg@actia.se> wrote:
>>
>> Hi Andrey, Steve,
>>
>> On 1/26/21 4:25 PM, Andrey Zhizhikin wrote:
>> > Hello Steve,
>> >
>> > On Tue, Jan 26, 2021 at 3:29 PM Steve Sakoman <steve@sakoman.com> wrote:
>> >>
>> >> Hi Andrey,
>> >>
>> >> Thanks for reporting this issue.
>> >>
>> >> I'm the maintainer for the dunfell branch of oe-core.  The gpsd recipe
>> >> is part of meta-openembedded. I'm copying Armin, who is the maintainer
>> >> for the dunfell branch of meta-openembedded.
>> >
>> > True, I've realized the recipe is not part of OE-Core.
>> >
>> >>
>> >> That said, I'm surprised you are seeing this issue since the gpsd
>> >> recipe has been fairly stable for quite some time.  I know that Armin
>> >> does test builds quite frequently.
>> >>
>> >> FWIW, I tried doing a gpsd build with oe-core, meta-openembedded,
>> >> meta-freescale, and meta-freescale-distro on an Ubuntu 20.04 and it
>> >> completed successfully.
>> >
>> > Arghh, got the same setup now - and the build issue was gone! :( Looks
>> > like this was an intermittent one
>> >
>> > I went ahead and invalidated the sstate for the recipe, and build went
>> > through alright.
>> >
>> > With that said: please discard this message, and thanks for responding here!
>> >
>> >>
>> >> Perhaps more information on your environment might help.  What
>> >> distro/version is the OS on your build machine? What other layers are
>> >> enabled in your build? What are you using for MACHINE and DISTRO?  Do
>> >> any of your layers have a .bbappend for gpsd?
>> >
>> > For the record: had nothing fancy, same setup as you've indicated above:
>> >
>> > Build Configuration:
>> > BB_VERSION           = "1.46.0"
>> > BUILD_SYS            = "x86_64-linux"
>> > NATIVELSBSTRING      = "universal"
>> > TARGET_SYS           = "aarch64-fsl-linux"
>> > MACHINE              = "imx8mmevk"
>> > DISTRO               = "fsl-wayland"
>> > DISTRO_VERSION       = "3.1"
>> > TUNE_FEATURES        = "aarch64 cortexa53 crc crypto"
>> > TARGET_FPU           = ""
>> > meta
>> > meta-poky            = "HEAD:bb7747497adbc7c99f6fc9b48b643eecb4cb1408"
>> > meta-oe
>> > meta-multimedia
>> > meta-python
>> > meta-networking
>> > meta-filesystems     = "dunfell:5bba79488b7d393d2258d6e917f7bf7b0d7c4073"
>> > meta-freescale       =
>> > "update-kernel-dunfell:184ee6b12d1c06db9327535ad1ae84d4709cfdb0"
>> > meta-freescale-3rdparty = "HEAD:ed841161a97307ebd901c31c62f8ecbee6baaacf"
>> > meta-freescale-distro = "HEAD:5d882cdf079b3bde0bd9869ce3ca3db411acbf3b"
>> >
>> >>
>> >> Regards,
>> >>
>> >> Steve
>> >>
>> >> On Tue, Jan 26, 2021 at 2:13 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>> >>>
>> >>> Hello Steve,
>> >>>
>> >>> gpsd recipe build breaks on the dunfell branch with following error messages:
>> >>>
>> >>> | /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/recipe-sysroot-native/usr/bin/aarch64-fsl-linux/../../libexec/aarch64-fsl-linux/gcc/aarch64-fsl-linux/9.3.0/ld:
>> >>> ./libgpsd.a(ppsthread.o): undefined reference to symbol
>> >>> 'pthread_create@@GLIBC_2.17'
>> >>> | /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/recipe-sysroot-native/usr/bin/aarch64-fsl-linux/../../libexec/aarch64-fsl-linux/gcc/aarch64-fsl-linux/9.3.0/ld:
>> >>> /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/recipe-sysroot/lib/libpthread.so.0:
>> >>> error adding symbols: DSO missing from command line
>>
>> We have seen this one as well, we have not identified why it happens,
>> but we believe it is triggered by an incremental rebuild of the recipe.

Thanks for a quick confirmation here, it's good to know I was not
alone to observe this issue. :)

>>
>> We have enabled systemd for gpsd, and if systemd is rebuilt due to a
>> patch or whatever, gpsd appears to error out exactly like this.
>>
>> A very quick analysis we did when it first happened seem to indicate
>> that Scons (when using a cache) gets confused about the pthread
>> capability in the environment.
>>
>> We have not been able to research the error further yet.
>>
>> Best regards // John Ernberg
>> >>>
>> >>> This cannot be reproduced on the current master branch, where the
>> >>> version of gpsd recipe has been bumped up from 3.19 to 3.20.
>> >>>
>> >>> Can you please consider to cherry-pick following commits from master
>> >>> in order to upgrade the gspd version on dunfell branch:
>> >>>
>> >>> 98e61961c gpsd: add new init script
>> >>> 04afc692a gpsd: mark CLEANBROKEN
>> >>> 33a15c790 gpsd: fix build on aarch64
>> >>> cecab9c4c gpsd: Upgrade 3.19 -> 3.20
>> >>>
>> >>> I've tried to cherry-pick them locally and they do apply clean. Also
>> >>> the build of gpsd is successful after this upgrade.
>> >>>
>> >>> --
>> >>> Regards,
>> >>> Andrey.
>> >
>> >
>> > --
>> > Regards,
>> > Andrey.
>> >
>> >
>> >
>> >
>> >
>>
>>
>>
>
> 
>


-- 
Regards,
Andrey.
