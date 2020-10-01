Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.3750.1601584719301132897
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2020 13:38:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ap1le7i7;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id s131so7210773qke.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2020 13:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BkvDDTK53Eq+a8X1JPXyUH0KOr2iHka8Bj6mbH2JdDI=;
        b=ap1le7i7mrQRKPQUmcZbqRQGZgYWPZ7ElZZktP3X+6p9ny9/EcWRc4BO0v9DykYuwW
         +ogUV1wsYsP7mbo46yXjwbjx6an87R7mzEchDQ5MbOv0pqQfKWtT8AibIVL0IRo72UGX
         QE4sFCX/VEOsXIF9kMPMRWMbX5kIKXkME3lSVThr5YGwuiG7KSMZihcG8Ii+yMduin0g
         zGeQLL97WTauNqcxRZPkp124T9W0eCzUTMOEIHamj4k4d9N3HLqKO94Dfuwr8dA0Jawt
         BK9NyhoXWGs6CPEl+5YWOSaPrqgcS3750niAp+bNdQKOEBOdRGzUpCt0++oFPbSTyUyv
         PoSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BkvDDTK53Eq+a8X1JPXyUH0KOr2iHka8Bj6mbH2JdDI=;
        b=JfatKbdUy9OqeA5YllpgbXQZFebB4dJdE3hIBndEwFijSDqIWWz6yhz5ivkctcNNfR
         XFumeJfn/hkZk1stptoqMBTTiH7mzYCo3Q3chryTdHfhWeiR/9KoOj+qgaPNpuY/NJzQ
         km4iL5uXupkmIH5ZZ73DyUww0F/MXwcxCRNUPk/nl9gOXQhFMGfPxQWmAXuEqwOELbdb
         6KejLh4ihR1xsSly1DYTyMH/MIYKof2axCqJF6E/zoQs2qHIgEGIIipGjlh/+Afjljxz
         23Kv0Mi8PlwgvVrfIn5/kJuX6hRhaMdEO9JqNVV3s6KTLM5g8IhMOgaLpJ19suvgiIwO
         8DAQ==
X-Gm-Message-State: AOAM531zgCqaLeVmYuk7E/rN7w+jhTND81qDMxPgmANwYkQ9rwtkSjp7
	B83FMTK0NUPvtALyXyMgH1ErCvboAg3ziBnuoaI=
X-Google-Smtp-Source: ABdhPJwVbH6KDaQm103sqGqcO4EkGe3aPDdTfwR3j+GpR9attARQ8QGd51M3oKNxvp+g0UppS4CoDlbsRZwdILyddiU=
X-Received: by 2002:a05:620a:7f6:: with SMTP id k22mr9401802qkk.337.1601584718321;
 Thu, 01 Oct 2020 13:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200930150545.3882859-1-ayaka@soulik.info> <CANNYZj85ymSHGvm5E7Axtrs6B6-V4nQGCFzcCVJKCM0=wsPtkg@mail.gmail.com>
 <34ad6791-d6db-4f37-a804-36df55b3472e@soulik.info> <CANNYZj_o=iZkZc51088ACJXGkDFeaCTCxGoETzCakh3HJZ-snA@mail.gmail.com>
In-Reply-To: <CANNYZj_o=iZkZc51088ACJXGkDFeaCTCxGoETzCakh3HJZ-snA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 1 Oct 2020 13:38:12 -0700
Message-ID: <CAMKF1sq2dGdBsLJHAEyf84qiuah_DPwd-YAw0PvKVH4WL6kAWg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] meson: add sysroot property
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: ayaka <ayaka@soulik.info>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 1, 2020 at 2:22 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Thu, 1 Oct 2020 at 06:15, ayaka <ayaka@soulik.info> wrote:
>>
>> It is the nativesdk meson has this problem, that is what cross build
>> requests for.
>>
>> You can try the Intel MediaSDK, I reported this issue to Gstreamer for
>> this but it comes to the issue of OE.
>>
>> Or you mean the native meson for the target system ? I don't think they
>> need a cross build file.
>
>
> native meson does use a cross file when building target packages, and things work without sysroot property, including using pkg-config:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/meson.bbclass
>

if meson used its defaults ( which means looking into native rootfs on
build system ) perhaps is fine for native packages since they don't
execute on
other build systems, but not so for nativesdk and target packages

> So I worry that your patch is fixing a symptom and not the problem.
>
> Alex
>
> 
>
