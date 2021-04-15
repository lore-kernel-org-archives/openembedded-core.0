Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.1145.1618509779374440272
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U0gh8LlE;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id e14so38169355ejz.11
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 11:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lC3YVzMJuUQEwll69uTTvHqn2CQBv6yz0IGSA4CC5Nk=;
        b=U0gh8LlEs3zrWAI84YhVISpJQxXQSiV6T7IToQjsb1ggfZ3mvPmR3evteU6jy59sxP
         knCI49+8spb92sIAZVdaGqUFZdhwtW/WLN/DOfz4LTBJP3C34tsuWMeKiAuAQcZuBU9m
         JdZpEhQFHQupCtTmLN2WaHdXW42iatuex4ZwI/aIdGXiZwqyLDK5MAgp/r9dl/Bf34eF
         PfswzwJv40ugjWLf7QxsclEyM9zlaTFeu90esH6LcJIr+m8/tpLLyU6xD+FxAZ3+di59
         Bu5fqvuGfgSn9Qrn44ELpfmZH0bKVEg8yvfeu2nUkxNx7o6DcLMsGZgGAY10w/7dbrz4
         Ci7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lC3YVzMJuUQEwll69uTTvHqn2CQBv6yz0IGSA4CC5Nk=;
        b=qh2G5Z9VzC7AHPq55/pcMpH/f0kIhBISeCKNuKzUYOm5qlflc6Qg4DnvR3FeeTi4W1
         Al3fFIMGi8iw20BCdJSJ5AC6zd/BUtkrSxm+tENum4adfe2LynqhN/Htj69qc7Ppun/t
         vgTUg7dQG3Jo7hGzP9qikKapduO3hXD8mEz604g/cO2vdDLSF3i2ICnvH5QkHYqst2gM
         txuvwNRaAejhaxNQLCfdIrSsWavFMA9hSeGUo7zFQmxhEoYvuydUyWMLOF2q100b7UjE
         oVVNvy8bcvhNg157f/pUaTVM6xGiWogFJbxHfyeMLJG7GPrj+jFtXVVwASMXzfSzjhVO
         huUA==
X-Gm-Message-State: AOAM533yujy2l59D0YHJgN/cttAgMI2Ygf7q6WkMGTPUFJ4nvP/+/90V
	9OqpZNolvCfd82tLXcP4z9R0mantjWw47UVhyOE=
X-Google-Smtp-Source: ABdhPJwNEW79eICy7TXjKkc/ssysh8gS2rqJ7tJU3EjBxYJedt7PI/tgUJ6KjWe6ONbsEjckYlx9/44KxkxGc42yyBE=
X-Received: by 2002:a17:906:ff52:: with SMTP id zo18mr4510616ejb.298.1618509777686;
 Thu, 15 Apr 2021 11:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210405190833.53066-1-sakib.sajal@windriver.com>
 <CADkTA4NtZxz0vPb+Ska8++1T_Q2v5LAkV3PNVyDAyEFO6-tpbg@mail.gmail.com> <397aa941-6da4-e0ad-d83d-7dff27d191d4@windriver.com>
In-Reply-To: <397aa941-6da4-e0ad-d83d-7dff27d191d4@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 15 Apr 2021 14:02:46 -0400
Message-ID: <CADkTA4NW1ym5=NqknqO8gFrTK_9LZNY5Mdu7GHoVjgC-=nk1PA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto[-rt]_5.4: remove feature/gpio/mockup.scc
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 15, 2021 at 1:27 PM Sakib Sajal <sakib.sajal@windriver.com> wrote:
>
>
> On 2021-04-06 7:36 p.m., Bruce Ashfield wrote:
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > On Mon, Apr 5, 2021 at 3:08 PM Sakib Sajal <sakib.sajal@windriver.com> wrote:
> >> mockup.scc is not supported in 5.4 kernel
> >>
> > Can you elaborate ? Are you seeing build issues ? Something else ?
> >
> > The Kconfig options are in our 5.4.109 kernel tree, so you must mean
> > something more than that.
> >
> > Bruce
>
> mockup kernel module was added for the purpose of testing libgpiod
> (v1.6.3 on master meta-oe).
>
> The minimum kernel version required for testing is v5.5.
>
> from libgpiod-1.6.3/tests/gpiod-test.c:
>
> #define MIN_KERNEL_MAJOR        5
> #define MIN_KERNEL_MINOR        5
>

..  but yet the config options exist. Which is the point of a
fragment.  The compatibility of user space -> version is a different
question.

We'll just leave this as-is, since the options are in 5.4

Bruce

>
> Sakib
>
>
> >> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> >> ---
> >>   meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb | 1 -
> >>   meta/recipes-kernel/linux/linux-yocto_5.4.bb    | 1 -
> >>   2 files changed, 2 deletions(-)
> >>
> >> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> >> index 2ffc8ed542..7629229601 100644
> >> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> >> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> >> @@ -42,4 +42,3 @@ KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc
> >>   KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> >>   KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
> >>   KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
> >> -KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
> >> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> >> index 245c3d574b..04e64c028b 100644
> >> --- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> >> +++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> >> @@ -52,4 +52,3 @@ KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> >>   KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
> >>   KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
> >>   KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
> >> -KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
> >> --
> >> 2.25.1
> >>
> >>
> >> 
> >>
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
