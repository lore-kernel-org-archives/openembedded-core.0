Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web12.26478.1621877119704970811
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 10:25:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pzvtM+PL;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id b26so25667028lfq.4
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 10:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8nryFvk1Bj4PzhuiqOmRSj3Z/3v7Oa8Xck2ZOZUwFSQ=;
        b=pzvtM+PL3cvg7cBP7F/jfeO9Yx4ARHlcCoEFF02rgDBLrihycwjFmOg1/NOM6CWbBu
         MuN8YER+m8h4iBAYCeuG2BS19HMqFenhAVruP3xXHKZwyq4fD3wBT6Wt5EwT+A9hIHQ1
         79ml1pcX5GQvt83dMjWxLiw4cSoqbhXtILe1FOdbN/X/nf1Ze4GaY03pvO5PGYDJuRcA
         Fvs/TBwSibrQptr4eYdpEWZg1l1ESuFndScFmIc+ydfAtaSjbcRmHoFWhKVNZIqgWQXI
         UXuT8CPssB4wh0AQ4WTF1ybHzok7roWLWVrKgCue3+7Avp2Toa+8UKI3ISMq5xLU923Y
         YHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8nryFvk1Bj4PzhuiqOmRSj3Z/3v7Oa8Xck2ZOZUwFSQ=;
        b=bzIfPCfLsUTfdhjtKxtH1xDmIgzGMEOkMc3CNeMFKFzFm5A3ODJ6pg7RUubOrXw1KL
         EPnZFXP2JpbZDH6MC9CI7Z+qWZKcfZ7CXqHYKBCHMukxwzVMBUr9NFameR9m7UEJFCiv
         BCjkmTlV13OdgM96BJKJ/QOIEwDVRD/vaG4jIvD87ED8ToQ0vqPchBaq441UW5AcFLvh
         W7GeVwVCJO/kJBn2epIANl8o06TkgJUsVGx0uTI1Hs1JIZWWnfXH2yA9LpNcR0OOWHQc
         HxZOsKkraCgNG0LDmVrqGhKslLtx3x0Z668I1lW2JRk2siRoMtS591iv9Q3XONRgmnVh
         EV5Q==
X-Gm-Message-State: AOAM532GeL4gKf+Ap5ibjFvFJkbAQMPh7iWw7MQaQf8y/j9zeCAWj6To
	eQApDcyokAUo2KFtJCv6S9gb9dVB1M2qDr7vTnA=
X-Google-Smtp-Source: ABdhPJzDPpq7fdbPH7V6aIPzgkUatY6lns+DPZEw9FnuCfu87tpO7g9Y7QLQIFway9epm2J9CIf+XDeXZ4blrRK8n2o=
X-Received: by 2002:a05:6512:2205:: with SMTP id h5mr11481121lfu.233.1621877117752;
 Mon, 24 May 2021 10:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj-yODhEEFErtUxBeiw3O1YvEfV-hGOOW_uPNvo6x8mNYQ@mail.gmail.com>
 <20210521132914.140884-1-vinay.m.engg@gmail.com> <20210521132914.140884-4-vinay.m.engg@gmail.com>
 <CANNYZj-v-hcO19SSkYgYKSeOBj7f1u4zvSRkfcx5UAm=ndye_A@mail.gmail.com> <1681E8AC31CF1367.29978@lists.openembedded.org>
In-Reply-To: <1681E8AC31CF1367.29978@lists.openembedded.org>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Mon, 24 May 2021 22:55:05 +0530
Message-ID: <CANUMPcWnneba3LL1PEZEcgvEUn5pdLRQ6vRUr2BUwNmfsWc+8w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 4/5] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com, 
	Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Alex,

I have sent the v4 version of patches with "do_check" functionality
included in "rust.py"
Also, verified for qemuarm64 target with fresh run.

Please let me know in case of any corrections.

Regards,
Vinay

On Mon, May 24, 2021 at 10:42 AM Vinay Kumar via
lists.openembedded.org <vinay.m.engg=gmail.com@lists.openembedded.org>
wrote:
>
> Hi Alex,
>
> I made changes as you suggested, getting expected results.
> Verifying with a fresh run. Will send the final patch for review.
>
> Regards,
> Vinay
>
> On Sat, May 22, 2021 at 10:04 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > On Fri, 21 May 2021 at 15:29, Vinay Kumar <vinay.m.engg@gmail.com> wrote:
> >>
> >> +                       # Set TEST_DEVICE_ADDR to image ip
> >> +                       cmd  = "export TEST_DEVICE_ADDR=%s:12345;" % qemu.ip
> >> +                       runCmd(cmd)
> >> +
> >> +                        # Test execution
> >> +                       bitbake("{} -c check".format(recipe))
> >> +                       # Stop ssh background execution
> >> +                       t_thread.stop()
> >>
> >
> > TEST_DEVICE_ADDR set this way will not propagate into the task environment. The task itself consists only of:
> >
> > do_check () {
> >
> >     rust_runx test --no-fail-fast --bless --target "${TARGET_SYS}" > summary.txt 2> /dev/null
> > }
> >
> > so you can simply move that directly into selftest:
> >
> > runCmd("export TEST_DEVICE_ADDR=%s:12345 rust_runx test --no-fail-fast --bless --target "%s"" %(....))
> >
> > Alex
> >
>
> 
>
