Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.3221.1608066439995174972
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 13:07:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MhYZtjwX;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id jx16so29705625ejb.10
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 13:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mf/KmPQpV+WatRWZ40Ffm+11fprvpeTEiHKTWhs5Fq0=;
        b=MhYZtjwXQyppyacTtH9xQmF6wCu8gn8Zye6NNTTSyvBIDbB5Bf3juvhOrI/rqANWlB
         Ohx28lilf9BPWqzsDt2YgV3mHdtvE6iUrNL6HDnGu/YEnahl+UMrcgekatEq39zQ1dll
         FsH8qWxCLfG4DBin5e42ku++d594F2vWETkCruEZw/rYKpZg0H719q8Nzy5cr6xhy8Hi
         K1fO4h3FDseTjKaHDKBXdNvh5Tn1yRjzEkea3lZuRrJvMW+Ws5Il+rZr7YRRvjnE1gJz
         oPUhrEHYzqfTsncpozzC6D+pSdaxswo13L4IU+QmA/Wia2Nmml8RJSnH5BLRHDAwPGUu
         lJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mf/KmPQpV+WatRWZ40Ffm+11fprvpeTEiHKTWhs5Fq0=;
        b=o4QyZg04Ury60HmLPugI5MScqQZe3FmUWk3kKUSJP8jh2pMxQ/YWfqrJKwo2oBwGIC
         lUP/lGm+6bj9fNMuAyYj9NKaMH3j0ZSsOWavZvhnVTiPRuMTUvMcekuESttTlVdvAtmg
         JYro0Kf7mwCUCqWpGTv0DzadlbsgxryXq/uMkbjjDCWLs3xPMrvh1ZIq70O9ZER5LXuP
         ku9p8Fqcd+gb8v8oMcRe+0vIZiKjo4TxUpC/fzPblmYd4qNTj1RVulwYfZ0tXQ2uEk0x
         2zOaCXCVn8TFrz3H9LOJvlU7ABe5JuTKgpTee49MWnsSuOyzVvoUx6lgmlZOk3fYen1Y
         0M+A==
X-Gm-Message-State: AOAM533lB2nRGqgRfwhkVDg1nyQIrWYOBZhIfmI6APzhxlgHsxk558MU
	bU7s8N4uGvMRWX93/ljnpUX5o8WqRSSSlEyxzec=
X-Google-Smtp-Source: ABdhPJz0K1APS7vB+4OUXxMYqZHg7bKAErPtige8lMyye2cw6x7oaH7vfx7DdJOSPACuBF1UbdPNHTMt5s+YnH3kuqE=
X-Received: by 2002:a17:906:ce2b:: with SMTP id sd11mr29282923ejb.334.1608066438424;
 Tue, 15 Dec 2020 13:07:18 -0800 (PST)
MIME-Version: 1.0
References: <20201215193506.13053-1-okaya@kernel.org> <CADkTA4OWM5PJXSgp7SMu+n0071YE-3wkaoV2JUPCuf5u=XdAnQ@mail.gmail.com>
 <8861f46e-fc85-2af4-fb2a-0aed9cb89791@kernel.org> <CADkTA4M6bbosSG3nhoe5uNm3ZF-qUZisOiCbnevnRVGCr_tLpQ@mail.gmail.com>
 <ec673a83-2804-2ffd-4b5d-0230c55ebcc2@kernel.org>
In-Reply-To: <ec673a83-2804-2ffd-4b5d-0230c55ebcc2@kernel.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 15 Dec 2020 16:07:07 -0500
Message-ID: <CADkTA4Na6u=3cc=B_DKoty1ZAuYaX3_wg70-cqsoEwpPT6cCtQ@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v3] sudo: split into smaller tools package
To: Sinan Kaya <okaya@kernel.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 15, 2020 at 3:09 PM Sinan Kaya <okaya@kernel.org> wrote:
>
> On 12/15/2020 2:57 PM, Bruce Ashfield wrote:
> >> Interesting, I didn't know that RRECOMMENDS can be turned off.
> >> I was hoping to do a non-invasive change for existing users.
> > A good goal!
> >
> > It's this variable:
> > https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#var-NO_RECOMMENDATIONS
>
> Would you be interested in setting it as default for the tiny distro
> with a patch?

I'm not the maintainer of that reference distro, but if something
really wants to control what is install and not have optional things
creep in, turning off the recommends is a good idea.

It would have to be run through some tests of course, because
something may be relying on those packages.

Bruce



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
