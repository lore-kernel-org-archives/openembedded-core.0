Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
 by mx.groups.io with SMTP id smtpd.web11.1560.1620934581806720395
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 12:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KJ+BanpO;
 spf=pass (domain: gmail.com, ip: 209.85.221.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f180.google.com with SMTP id k85so5639811vka.9
        for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 12:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cr3XkzhhS5mgg1qNI71KMBo5C7r5/NQPFmUcvddIkh4=;
        b=KJ+BanpO6OkwMMmE1b8STzLufulFLSMKyOLDPWpnJFXTXbbODc9d7mB09fP4yqLvAD
         qQj/65Hx0XZJJG6ASjMaNJdm8w2EUVwsmPJAKzSA/g9/788Kw1pDbGWpBUoNUnNh4RJz
         o+KUiYZtmUkcTsJcyIFZU/LF94bZypXBY6iLMNVAvxUsbVfDvrJuoMyqSV13TFxkalGX
         N4ahduyHN4Erpaw3IvvGpNbzK/198sJevuRmFuOcTiHH8nmhF2MTbVZPo+4OCHsjbKnk
         owp6mWLm9vsD6B+BxsEn+/nQ4NMrFvpYKNXopcM6fSuWDwE1KDIqJS9Jcx/EqJFMMzmw
         Uysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cr3XkzhhS5mgg1qNI71KMBo5C7r5/NQPFmUcvddIkh4=;
        b=XR4S2NMhYdcuel4nZ8YR3i2nTZNIteD3JXURe+VoNqBGT7WVewowMX89iuztQOBueP
         Nw+Gm4VCgsIjWGrK94C/9XrWieLmRp9OF3An8RM7cYkpuboMvuND1d+nRnfnRO1m+MeM
         /Lb7VLrJe9Uabl3N1rlRwb5h/m96Lwlr1hS0yQaetHx0xra+e0JvJ813IqqTk5ZrFKRr
         WQhf40x0fxwJMp/EtgMByD8qhM/xQrHhRe+Ch0l1cXOxjn4icxhG3zLp+BFIJEBCecm3
         o1d3BDnvwc0Gc7ehuZXngchrDCFns/ZGZQOW+PP8TJ2nJvKi/Q7E5tZlbWIczuIhFG24
         BLpg==
X-Gm-Message-State: AOAM533Xy/mqT8RyAtxsE704Cje0spe7eTImXfrPjByQrVl5FnyHWSwd
	CHQjpPCWIEGSGjfc1VmbcM6iUEPyoT8SoO1AArO+Qar+
X-Google-Smtp-Source: ABdhPJz1DnIsd5nL1sT433qNF9z7SfqliOO8Ua1vRtPtva5WH7PnKSyz88EA5eg1dmdW2qgRozx/Rh3YQ0ah0TKEUXM=
X-Received: by 2002:a1f:1d4a:: with SMTP id d71mr35198735vkd.0.1620934581011;
 Thu, 13 May 2021 12:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <CADkTA4OMd12mW9N37WtfUUHYZ=zQ9hsNb8sYanXU1q8MvLKj3w@mail.gmail.com>
 <1305.1620933899472438737@lists.openembedded.org>
In-Reply-To: <1305.1620933899472438737@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 13 May 2021 21:36:09 +0200
Message-ID: <CANNYZj_LDz9xV9iCW-N03xcGho0S12AaCQEvLb54UJw40FYPMw@mail.gmail.com>
Subject: Re: [OE-core] master/main branch renaming and bitbake
To: Benjamin Gilbert <bgilbert@backtick.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e7c99705c23b3d80"

--000000000000e7c99705c23b3d80
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 May 2021 at 21:25, Benjamin Gilbert <bgilbert@backtick.net>
wrote:

> Deleting the branch normally affects people who are in the project's
> developer community and pay attention to its announcements.  Those folks
> can then simply update their local checkouts and move on with their lives.
> Everyone else just clones the default branch and maybe checks out a
> particular tag or commit before building a package.  That workflow still
> works after the default branch is renamed.  Bitbake's additional checks are
> unusual, and impose a long-term compatibility constraint on upstream
> projects that they didn't sign up for.
>

They're not useless though. As a layer maintainer I absolutely want those
checks, as I want to be aware of any branch configuration changes upstream,
and to ensure I'm not accepting a change in source revision that points to
an unattached commit, or one from a branch that's not supposed to be used
at all.

Alex

--000000000000e7c99705c23b3d80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 13 May 2021 at 21:25, Benjamin Gilbert &lt;<a href=3D"mailto=
:bgilbert@backtick.net">bgilbert@backtick.net</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Deleting the branch normally a=
ffects people who are in the project&#39;s developer community and pay atte=
ntion to its announcements.=C2=A0 Those folks can then simply update their =
local checkouts and move on with their lives.=C2=A0 Everyone else just clon=
es the default branch and maybe checks out a particular tag or commit befor=
e building a package.=C2=A0 That workflow still works after the default bra=
nch is renamed.=C2=A0 Bitbake&#39;s additional checks are unusual, and impo=
se a long-term compatibility constraint on upstream projects that they didn=
&#39;t sign up for.<br></blockquote><div><br></div><div>They&#39;re not use=
less though. As a layer maintainer I absolutely want those checks, as I wan=
t to be aware of any branch configuration changes upstream, and to ensure I=
&#39;m not accepting a change in source revision that points to an unattach=
ed commit, or one from a branch that&#39;s not supposed to be used at all.<=
/div><div><br></div><div>Alex<br></div></div></div>

--000000000000e7c99705c23b3d80--
