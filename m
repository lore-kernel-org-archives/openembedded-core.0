Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web11.6254.1596631412423599973
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 05:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lNXEpxnb;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id l23so18685303edv.11
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 05:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JZxmkprluhsE6EEgpizzxibdVIdNKx9Nd2WdgnKt8Wc=;
        b=lNXEpxnbsqmuTOz6wiXhpsc7hm5bjFeYo5GBol3ZpVXnU9EpnBAtUXU9kqgyuHdY2A
         qZuq2CcDg0apo9kxr6omcI8QlKlikQs4FZEHGqld7vzZiKPFYIprbaypMU0ZdW4aINj1
         5T24iDvsL/6PRWnLR7SuJFd9FngYSbgIAh1nq9QMtCorq/4E91U16pvrdHV8Io3RWmBL
         og4VlbLy93TbnIGlfUz6S9GEuF6QtIq4SxK2oVIWRxmvum+4U6EctUjnAjnnj/2BXlQX
         wuX39AEwv2239MVyMc/e+2qkP6VWMMPYt1EIUkL7q0YnWsXKAqJBkiRciM6r7zfMyd5p
         C/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JZxmkprluhsE6EEgpizzxibdVIdNKx9Nd2WdgnKt8Wc=;
        b=Yf3WXJuT7lluRW3GS99rsC4iBhnxjQw8r8EfnQZRE+Eaa30vu+rZxzsJkRJ9r51Mh0
         xNhsysWkqWMRvXQ+PZUYPNXqxPxD8G+FjOwtGHnuB9D/CgDuZ3tKO4eniEYz5GCDegay
         l5sbcnDFV3WYWVuxehnob5aPNR3qt6S6n9G9bPegIAkhRltEz58Qv6uvi64LDrRMb+Ee
         Y3d5wRbpBzy+/rvWAcK8AtSXX7WbD4jMUF6uPsrMYePR1W+7H51JFAi7CLEarm9kRNTV
         8yRcMZi2lr3lQq8pK9fog2mf7iqzfX0gHL9Qsw9tAH2CpP+6r7YNGhbT1/rT3uZISA8r
         H0Ig==
X-Gm-Message-State: AOAM533YxT618gGjDFBV4YoWLq0Ta0ov/2Fqy79lsqHJxl4c2fG9RBCS
	hJwPG/Tq94SHbOZo09kOvO4jJGQ1FweSlO2zvQE=
X-Google-Smtp-Source: ABdhPJzZ2vcF9qtfHreWxz5UCStsd+M4BgunZUmftFd8Ps4wODvqdGLz7VsNRdeh5oATDcGNi0RGJu/9FWFLAZrbG9c=
X-Received: by 2002:aa7:cd6c:: with SMTP id ca12mr2471805edb.365.1596631410753;
 Wed, 05 Aug 2020 05:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1594989620.git.bruce.ashfield@gmail.com> <3d609c832b9475706c45ace895aed899a6670542.camel@linuxfoundation.org>
In-Reply-To: <3d609c832b9475706c45ace895aed899a6670542.camel@linuxfoundation.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 5 Aug 2020 08:43:19 -0400
Message-ID: <CADkTA4P-M6+KX1oWz-ueub0vr15rCo2Y+wt=J4Nzju7Dt_fvBg@mail.gmail.com>
Subject: Re: [PATCH 0/4] kernel/yocto: conslidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>, Ross Burton <ross@burtonini.com>, 
	Jon Mason <Jon.Mason@arm.com>, Kevin Hao <kexin.hao@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000013442405ac20b83c"

--00000000000013442405ac20b83c
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 5, 2020 at 7:06 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2020-07-17 at 08:56 -0400, bruce.ashfield@gmail.com wrote:
> > Here's my latest set of patches.
> >
> > For 5.4: a -stable update, and -rt bug fix
> >
> > For the build: a tweak to the config generation (as reported
> > and discussed on the mailing list)
> >
> > For 5.8 (aka the next reference kernel): a fix for devsrc and
> > on target kernel building. With this tweak, I have all of the
> > refrences booting and passing most tests on 5.8, so we are in
> > good shape on that front. I'll be doing libc-headers testing
> > next.
> >
> > I ran these through the AB and local testing, no issues popped
> > up, except a warning on qemuarm-alt in my last run. It was
> > about a console login and didn't look related to the change,
> > but I'm keeping my eye on it.
>
> Thanks, I ran this combined with Khem's binutils change through the
> autobuilder and your changes are likely fine but we need more work to
> get binutils in. Basically:
>
> * meta-arm needs to add the kernel patch for perf
> * meta-intel needs to add the kernel patch for perf
> * the hardware BSPs need to add the kernel patch for perf
>
> I've added a few maintainers/people to the address list to try and sort
> that out. Who is going to handle the hardware platforms?
>

I have a meta-yocto-bsp bump that I did for the latest 5.4, it'll have that
fix as well. I can send it out now for the reference platforms.

Bruce



>
> Cheers,
>
> Richard
>
>
>
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000013442405ac20b83c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Aug 5, 2020 at 7:06 AM Richard Purdie &lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfo=
undation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Fri, 2020-07-17 at 08:56 -0400, <a href=3D"mailto:bruce.ashf=
ield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a> wrote:<br>
&gt; Here&#39;s my latest set of patches.<br>
&gt; <br>
&gt; For 5.4: a -stable update, and -rt bug fix<br>
&gt; <br>
&gt; For the build: a tweak to the config generation (as reported<br>
&gt; and discussed on the mailing list)<br>
&gt; <br>
&gt; For 5.8 (aka the next reference kernel): a fix for devsrc and<br>
&gt; on target kernel building. With this tweak, I have all of the<br>
&gt; refrences booting and passing most tests on 5.8, so we are in<br>
&gt; good shape on that front. I&#39;ll be doing libc-headers testing<br>
&gt; next.<br>
&gt; <br>
&gt; I ran these through the AB and local testing, no issues popped<br>
&gt; up, except a warning on qemuarm-alt in my last run. It was<br>
&gt; about a console login and didn&#39;t look related to the change,<br>
&gt; but I&#39;m keeping my eye on it.<br>
<br>
Thanks, I ran this combined with Khem&#39;s binutils change through the<br>
autobuilder and your changes are likely fine but we need more work to<br>
get binutils in. Basically:<br>
<br>
* meta-arm needs to add the kernel patch for perf<br>
* meta-intel needs to add the kernel patch for perf<br>
* the hardware BSPs need to add the kernel patch for perf<br>
<br>
I&#39;ve added a few maintainers/people to the address list to try and sort=
<br>
that out. Who is going to handle the hardware platforms?<br></blockquote><d=
iv><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">I =
have a meta-yocto-bsp bump that I did for the latest 5.4, it&#39;ll have th=
at fix as well. I can send it out now for the reference platforms.</div><di=
v class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D=
"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--00000000000013442405ac20b83c--
