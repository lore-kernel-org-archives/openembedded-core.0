Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.8389.1625226004677091025
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 04:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cCa3+8PN;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id a18so17514275lfs.10
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jul 2021 04:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wJOz8gLnvwEY6t6idkPFjD0u48uS5k1DOjLtnv52H9M=;
        b=cCa3+8PNYtwYX+P0sxQL0PjC626vA5aYjXfG4hiz/u1FUENnXv/KR2VlvPmPUPP1z6
         +La5Zlf2AGJ9zc73QwG+Wga50R3T/bCDWE+Tm576qm7JSopKTfA6vPy54i7tN+iKBFga
         F8pV0Tk1wvURSZhdqLfcW9HbTl/64Bip0tDKsaMQTvjshDtjgN/xsCQnUe4iaZgf/Gc/
         mJ3gr52sGBLGaTVZBVyY47rGAWBA65mku3lhV6q6wcjX5y6w55yk4aiwhBvU2HDZ2jh6
         ROnH7dZczkstSvvDfueyXsFsXSbqwVtov1YPLZMQEftHMrAi4KxsltESpvKQhKxLd92N
         WzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wJOz8gLnvwEY6t6idkPFjD0u48uS5k1DOjLtnv52H9M=;
        b=mrg1ty5Rff6kTIjF6fnlSQqbFli4t8ewO6o6fYv1PXBnmM8bSPZ/D5xiTkHa9UU+Ox
         MpfzBvs1loSEVmRwjTL6HI0cpnox0j/z+JXnzllIvhVjXB1G1o4n90dhcsCgGUxAvYeN
         sszLFOc+Rfow/tdKOXMKJYCWLfPJmvlg/pzjQ6APbv8ph/ilnT1O4FJyQ6UDMxD+ZT9b
         Lo8vjgEeXmUJhHRczqKF5ttEbk1sX9xUPi9lGhZZylqXqOogELzMQ1vppCmdvB9r0H4H
         R0Bt2CEq0dJaa3ko//rJDDor7YRHccZmjcam2ZWsM9KTzLo8yQ+3wCV8/CwrMvyE1lti
         QjvA==
X-Gm-Message-State: AOAM533JczvURPQRqiFB4S0dqR0XqbB/nPUB6VMaiD2XqftwjMqNdwC6
	qWZE+Z3nz+e4EchGzewo0ODz1hbGEf5FNJ/ySSQ=
X-Google-Smtp-Source: ABdhPJz9gEZovpaQ7BI0f0Xpk6fbOq9pmDPcS2K1lp0gaWin6na1BOVFk1fZIowo5U4CKdYVRpg5vp3WHQbV15xo4gg=
X-Received: by 2002:a05:6512:36d8:: with SMTP id e24mr3607678lfs.8.1625226002948;
 Fri, 02 Jul 2021 04:40:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210429113046.172473-1-vinay.m.engg@gmail.com>
 <4064cc6aa03b56a7e3aa5e403fc4c17ed5bef77d.camel@intel.com>
 <CANUMPcUyz7S_ynQGEtoq03TjnD-ccJZF9=Vfin+QGe7TW_GkEg@mail.gmail.com>
 <eba9f2cbb58cee3ae79e3db6ffd968d2f1c0d5c1.camel@intel.com>
 <CANUMPcXF9CyFh0ETfgHdR6w-qKb-i7Hr7h68wyE_+_7xu3y+dQ@mail.gmail.com> <f744803f-849c-905f-fe7b-70b7b6a8730b@windriver.com>
In-Reply-To: <f744803f-849c-905f-fe7b-70b7b6a8730b@windriver.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Fri, 2 Jul 2021 17:09:51 +0530
Message-ID: <CANUMPcWSPPT-vHifj3GO+TKJ_fGV7xodoHJy8eLpJt6sdwp7yw@mail.gmail.com>
Subject: Re: [OE-core] [hardknott][PATCH] Binutils: Fix CVE-2021-20197
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>, 
	"vinay.kumar@blackfigtech.com" <vinay.kumar@blackfigtech.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"rwmacleod@gmail.com" <rwmacleod@gmail.com>, "umesh.kalappa0@gmail.com" <umesh.kalappa0@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Randy, Anuj,

Sent for review with 3 separate patches.
https://lists.openembedded.org/g/openembedded-core/message/153462

Regards,
Vinay

On Tue, Jun 29, 2021 at 6:56 PM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2021-05-07 10:48 a.m., Vinay Kumar wrote:
> > Hi Anuj,
> >
> >>> Right now, the patch header is wrong as it's not the upstream commit that it is claiming to be.
> >
> > Created 3 patches.
> > For the patch of commit "d3edaa91d4cf7202ec14342410194841e2f67f12"
> > planning to use
> > below patch header from the commit it is cherry picked.
> > Also, mentioning that in "Upstream-Status" section as below,
> > ====================================
> >>From 95b91a043aeaeb546d2fea556d84a2de1e917770 Mon Sep 17 00:00:00 2001
> > From: Alan Modra <amodra@gmail.com>
> > Date: Mon, 1 Feb 2021 02:04:41 +1030
> > Subject: [PATCH] pr27270 and pr27284, ar segfaults and wrong file mode
> >
> >          PR 27270
> >          PR 27284
> >          PR 26945
> >          * ar.c: Don't include libbfd.h.
> >          (write_archive): Replace xmalloc+strcpy with xstrdup.  Use
> >          bfd_stat rather than fstat on iostream.  Move stat and fd tests
> >          outside of _WIN32 ifdef.  Delete skip_stat variable.
> >          * arsup.c (temp_name, real_ofd): New static variables.
> >          (ar_open): Use make_tempname and bfd_fdopenw.
> >          (ar_save): Adjust to suit ar_open changes.  Move stat output
> >          of _WIN32 ifdef.
> >          * objcopy.c: Don't include libbfd.h.
> >          (copy_file): Use bfd_stat.
> >
> > Upstream-Status:
> > Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=95b91a043aeaeb546d2fea556d84a2de1e917770]
> > Used commit "d3edaa91d4cf7202ec14342410194841e2f67f12" cherry picked from commit
> > "95b91a043aeaeb546d2fea556d84a2de1e917770"
> > CVE: CVE-2021-20197
> > Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> > ====================================
> >
> > Other 2 commits ids patch headers are identical to the cherry picked
> > from commits.
> >
> > Regards,
> > Vinay
> >
>
> Seems that this patch was not merged to hardknott.
> I didn't see the version split into 3 patch on the list.
>
> Vinay, can you please re-submit if you agree
> that splitting it up into 3 patches makes sense.
>
> --
> # Randy MacLeod
> # Wind River Linux
