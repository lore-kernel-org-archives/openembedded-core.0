Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web10.11261.1600169727772877397
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2020 04:35:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ca6W5rpi;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id j11so4615978ejk.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2020 04:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+yYZIcM1FoCxwlZzVQUUM0inoomYnYnR6KNuiD0j1aE=;
        b=Ca6W5rpihj7NDzvu+vsi/aLAMAaZ3cISuH7tpTD3bdy0SB4H3PZPFIftizJAzNrJUY
         H2wMsp/Rc6Ft1sEvpRhOI6B24kLU2e8EHQMrtIQDg+9Jjcc/5pGRmMw7hRZnyukLJYgG
         v6ulb8rNsanGV+JNhCaPo7ghrN2s9LjWYER7Vi0IHGNUh1R7PHnbb/ikb8q3WiPh0+pm
         X7y4cu4elRwO4z4p+W61vJXvUEY3TOQW0do308ERfJ6QxfhVEY9cS5VxiOGFs49oIhNF
         t4l4kp5afmMOExYSdRDLE+NS2iL81TVvkFG7v63c1dBk78x/NBWCOXJaNUSZ+bONu6Fb
         PNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+yYZIcM1FoCxwlZzVQUUM0inoomYnYnR6KNuiD0j1aE=;
        b=ELMU79fHVTCiH/Mh8M/a1Th3sQoy8Zyc9kaSvgIxH1vsOZaNtlXOUT1h7DWAK7cPdH
         5rIkzqljdeTafU1ChiI+a9lJ6aqBJ8SgCCI+ams9asfRrRfPbOt2IRieq0I3uxD6ne5c
         2G4qOX0gZf44alTigr5chqPlBERHCOXpLxe4Cz02fmz4Ov3DuuWka0Ph0xCtuwKZ+GUA
         LnoL5W4+jFMVVpBUqSIA3kI6SXr+JKpOMi63VHIsaFjvF9hJoPb84InHENEVD90RItVi
         laQ9T4knLPrdzMZ/2d/7NUBHeL7/C7RBkh54IZM3C8uDmsCj+bFm3xEzT4uj/IHNSHEl
         kGZg==
X-Gm-Message-State: AOAM531bm/NJgdHX39fEW0fN6Svac0HEGXSbYpSfAlzljzKkdERSgcfQ
	bGh+AeSsg1qyiInHP1cAvAy8KeLNhfQ7qlgSuVo=
X-Google-Smtp-Source: ABdhPJwZO7Aokvosb41jaSFXLmFMR99quCrGGdtRMCidmls/Qf3R1RF1zUKHwWpug+OfHKkLNDF+vpcvTf76DGmgWVo=
X-Received: by 2002:a17:906:1e11:: with SMTP id g17mr18510928ejj.298.1600169726074;
 Tue, 15 Sep 2020 04:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1600122415.git.bruce.ashfield@gmail.com>
 <ced4f4ad5252bcc989f40b54341c0d7a5835bfce.1600122415.git.bruce.ashfield@gmail.com>
 <486E178E-DCB8-4B23-B199-63231267196E@gmail.com>
In-Reply-To: <486E178E-DCB8-4B23-B199-63231267196E@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 15 Sep 2020 07:33:56 -0400
Message-ID: <CADkTA4MFzRoKSV6+kBvYvsQ-BfFwt4BJuOj5bPpfQLYbJk_vmg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] lttng-modules: backport patches from 2.12.x to fix 5.4.64+ and 5.8.9+ builds
To: Jens Rehsack <rehsack@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 15, 2020 at 1:44 AM Jens Rehsack <rehsack@gmail.com> wrote:
>
>
>
> > Am 15.09.2020 um 00:34 schrieb Bruce Ashfield <bruce.ashfield@gmail.com>:
> >
> > From: Jens Rehsack <sno@netbsd.org>
> >
> > Backporting the 10 patches since the lttng 2.12.2 release. We'll drop
> > them once .3 is released, but for now, we need the fixes to build
>
> Yet another question: there is a stable-2.12 branch ... wouldn't it be reasonable to use this one as upstream source instead of the tarball?
>

We used to do that .. yes. But then the lttng recipe was changed away
from git to using the tgz.

I complained at the time (I'm sure it is in the archives for all to
see), since I'm constantly doing new kernels and have to do this sort
of exercise.

The devupstream bbclass allows me to keep moving on my new kernels
when I need to pick up changes for -dev, and luckily -stable doesn't
normally need this sort of thing.

IIRC it was switched to tgz since things like AUH work better with the
tarballs, but I can't be sure.

But let's just say that I agree that this recipe is better as a branch
based, git recipe and not a tgz based recipe. I just haven't waded
into the discussion to switch it back :)

Bruce

> > against the latest 5.4, 5.8 and 5.9 kernels.
> >
> > We also bump the devupstream SRCREV to pickup the same changes.
> > -=-=-=-=-=-=-=-=-=-=-=-
>
> --
> Jens Rehsack - rehsack@gmail.com
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
