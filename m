Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web11.1255.1620240745108837257
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 11:52:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eyopzXj5;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id h18so1630304vsp.8
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 11:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VK1ZaAJ8rCX0fsgfF+E5VOU1M6UvdWrY8FZF9e5u6cA=;
        b=eyopzXj5bZWD6z9a0nZIfpMCE0ALqXkuZhKSmlqIxNJSP80X1EG4emol31E62BRsT1
         gusKRGwQHh4C05du9WR9JHdr0Jy06o5cVrl3675+Z99kpQT6LKVK/fqNeu44wZW5AuA+
         UQlsNrS6Lj2OWNMTsDAmuXuHmR3oWMHnzazS+HWgM/LkanfWm4htgplSlPS6r+0n9cgC
         fmprMjMsF7rstOmzziHdcKtYySuOPDM0ehITGXsXguD62wR3Fs4FHvW/9SJDtjZyMA3n
         jmzVmO1wsphKUMHvEaIxXjOqs1WJ7vIzMNFK30sEyw2SPH0AGabPMfOWt1iP55VJpirH
         7Ojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VK1ZaAJ8rCX0fsgfF+E5VOU1M6UvdWrY8FZF9e5u6cA=;
        b=SFSfVufU7KfiT7eTgq7E+CxqXpuDSPeO8UIc8hl7erU417Jz49dGVsLH8fV/rLBHbs
         vzsYupP5Sxj3MFhuztlz7+zmMAiYlT6vkwQmWMXEmOpKQK0aMf85p0C23wIOR8lw1mxl
         sxH36eJzFRFBD3+3gi+rXv4CR9gsiDgd7MUycbYB/RiodoVLiswYPJZyvIYaKnqOwxE3
         79grqJrdB9MTm1td51QEL/YvYqHF++U3T3vuP4MEgr403gLUwXjwgYoqEcvoCivk3nmB
         6P0HqnPF9xVgBWXbuBIdm+zXyy6OylZCrB67undrZUcJUSBm4+PB8UJfeR5D5QO5YE7v
         vtug==
X-Gm-Message-State: AOAM531tEjW6KZ3zld81EZhhkonxS/0WJPDZspuBpg8NSkC0UfxDyYSz
	vroOI2mJdhlDnXCMmpoOyHo1RunFEz0w1SiCN54=
X-Google-Smtp-Source: ABdhPJzpwzlK69jztZgOS8qKIi2zQnJEGPEB1Flt/eKpjhKDJkSnGZnIbpBCCnSqlVeF6ceHQFg45qMO69OBt1VOxzE=
X-Received: by 2002:a67:c401:: with SMTP id c1mr190723vsk.51.1620240742885;
 Wed, 05 May 2021 11:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-23-alex.kanavin@gmail.com> <CAMKF1srGBpzk-BiFnSM_+1pEoCByUkcPrJo2VDmSRUwGgbn18Q@mail.gmail.com>
In-Reply-To: <CAMKF1srGBpzk-BiFnSM_+1pEoCByUkcPrJo2VDmSRUwGgbn18Q@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 5 May 2021 20:52:12 +0200
Message-ID: <CANNYZj8Q7GLF_6oLZQ9oZYO3nMKkThZnj7CZGL=duS1u_wQicA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 23/61] powertop: update 2.13 -> 2.14
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ee2dfa05c199b1f3"

--000000000000ee2dfa05c199b1f3
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 May 2021 at 20:13, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, May 5, 2021 at 8:20 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >
> > Drop awful ncurses hack; please make a proper patch with a configure
> > option and PACKAGECONFIG.
> >
>
> Lets not delete this unless its causing trouble as it will break
> existing functionality that users might be depending upon.
> if there is better fix please propose that instead
>

Sorry, no. If I do not understand what it does, the version update is
incompatible with it,
and there is no trouble detected by the AB from dropping it, then it has to
go.

Alex

--000000000000ee2dfa05c199b1f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 5 May 2021 at 20:13, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">On Wed, May 5, 2021 at 8:20 AM Alexander Kana=
vin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.ka=
navin@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Drop awful ncurses hack; please make a proper patch with a configure<b=
r>
&gt; option and PACKAGECONFIG.<br>
&gt;<br>
<br>
Lets not delete this unless its causing trouble as it will break<br>
existing functionality that users might be depending upon.<br>
if there is better fix please propose that instead<br></blockquote><div><br=
></div><div>Sorry, no. If I do not understand what it does, the version upd=
ate is incompatible with it,<br></div><div>and there is no trouble detected=
 by the AB from dropping it, then it has to go.<br></div><div><br></div><di=
v>Alex<br></div></div></div>

--000000000000ee2dfa05c199b1f3--
