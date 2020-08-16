Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.17274.1597543031304590311
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 18:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A9274E2W;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id o2so6173240qvk.6
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 18:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PGjs19wDAHNMi7e2hKF/bwkmDLGxIrbInBo5j3bTcQk=;
        b=A9274E2W7UTuk9L7bhyachfjktJWK3C9kQG/NxIojjSalxeEF5ZtEulZP+3JQoxJx3
         7fRGvHEqMga+vRGud1l1QfNSe9F3dvvTLcmC5XpeFNdVhJsZgo5guo0LKo9JgFB5zeyx
         G0520JWRCT/LmVdcUWzikPp6uB+hnae0Yy2IBiDRKn/77rpPZdjwLDljauRomFp0Z9+o
         zJhurgLTxUFtNE1jWXoyIxrr/ZiCAuCUvb+pkGyZSCmhUyJieJhdNv4I7azt3+sBpNaC
         0VJXAjwzss41vugQds1X2UxUIlDQkpe35z3lgFypD73sv3IJKFj46YDTb3KPzlI5jxZu
         SyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PGjs19wDAHNMi7e2hKF/bwkmDLGxIrbInBo5j3bTcQk=;
        b=rDqrk1fRydg21Wb0XG2diFvule2tR7uaUn8BrSvvqgQ44YSNYaZbbK4uNNi8DhBhy7
         SiGVKr9mS5QF/8iUi4WRAXGnrImvCEhPQc4PmYKsdW3UZo2QEMzGgnGWLlVjHKJdRiI4
         zfwg+PihC1BwV38LBzUH1T+e7iW2FLBhuKERkwylD/xHWOi/zvKYSgzIRbiaK7N76Q+t
         IcMLMeF0WRm/o9P6LsC0uiGJGXleFGakyhdFuF05rsvXltO43MHpIsrdNABvXVdujIuy
         keyik3F2j9WfdTxlZmIlA9OezJUR6JJliKG6GjUsjTlUi9g0vyY2ld7itYNpnZy70Uzn
         +4lQ==
X-Gm-Message-State: AOAM530D21Snp7/83atvYz+ByuaXzJ/vM+zNKEyDkh4NR2BayF/kxusY
	P+jIPT8Ko00KP91C+rnC4kHrSy/gjUfQV+1b2hY=
X-Google-Smtp-Source: ABdhPJz2lvqcoj+mWaWMxUyH6CRnJurnPtZAUndxaRCuWr/tWyHyJCNs2DB7XuHh7aHgmDBcNCsXY6skBlb+WwlDWJ4=
X-Received: by 2002:a0c:fbd1:: with SMTP id n17mr9127491qvp.4.1597543030424;
 Sat, 15 Aug 2020 18:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200804082019.76320-1-jacob.kroon@gmail.com> <CAMKF1soyMVB0jpLRA0v8WnCMaJ8DHf=id0xyvdoJ+78CL=UKwA@mail.gmail.com>
 <9e59ca1e-26f3-08a2-d43d-c4d4545d031a@gmail.com> <CAMKF1srkVAXV4NS7xL2mA+D8z7v4x612qjFG_0H_XFmvG3tx3A@mail.gmail.com>
 <CAMKF1sonGf4BT-XtktYVO02MtO_XA_SN_8N55WjjKgKafUPXJA@mail.gmail.com> <22b4b3f49bd9ca309ffe4c5fac7a3431fc43ce4b.camel@linuxfoundation.org>
In-Reply-To: <22b4b3f49bd9ca309ffe4c5fac7a3431fc43ce4b.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 15 Aug 2020 18:56:44 -0700
Message-ID: <CAMKF1srCFjrVimzDWU69Z=SaGu5gayYG7qi34Wo7pEqAG06osA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc10: Don't default back to -fcommon
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Jacob Kroon <jacob.kroon@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 15, 2020 at 3:10 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2020-08-04 at 23:17 -0700, Khem Raj wrote:
> > here is a recent build with clang11 which also switched to using
> > -fno-common and errors are pretty much same you will see with gcc10
> > with this patch to revert the -fcommon defaults.
> >
> > https://errors.yoctoproject.org/Errors/Build/107234/?limit=100
> >
> > I was waiting for upstream packages to get fixed before switching the
> > defaults back to -fno-common.
>
> Khem requested I revisit this. I see at least:
>
> a) perf failures pretty much everywhere

This is interesting

| x86_64-poky-linux-gcc: error: unrecognized command-line option
'-m64/include/uapi/asm-generic/errno.h'

I wonder if its some kernel update which is causing this, it seems to
be missing a space in commandline somewhere

> b) kexec-tools in no-x11 build

I think I dealt with this in meta-oe perhaps we need to use -fcommon in cflags.

> c) cpio build failures in testimage
>
cpio needs a patch to build see
https://git.openembedded.org/openembedded-core/commit/?id=ca6e5511b59b585de793ff6424c7c6ccfcd8e61e
I guess we need to either patch cpio with this patch on target before
building or pass -fcommon to the test so this patch is not needed

Thanks for the run, I will try to look into it, I think for cpio build
failure perhaps we need to pass

> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1264
>
> the world builds haven't completed yet.
>
> So looks much better but still a few things need fixes.
>
> Cheers,
>
> Richard
>
>
