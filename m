Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web10.5099.1590583405941615748
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 05:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jyU4orMY;
 spf=pass (domain: gmail.com, ip: 209.85.222.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id r9so3715911ual.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 05:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D7GAj602/PQPfG6jKKDTKfFtpx611WzD0nDfwj0f+aE=;
        b=jyU4orMYm8eieN2XvcRJ0X8aKejYeAUJS4bbIMlg4R/r1hBa+5Q27tuC6cXGL0dP4v
         9aEP3LRmbmEq4GY5zFBgZOkoTlNH55RObCl0IEMXCRJis6riaWDG+L5Wc0HRLx7qYsJc
         Ts//AhHCsRYfTFZmwKUFd7J/XG9LuVk0cXhkbjKUuo5IE00QL9BYtNCJBDHcVpo7znbW
         d+j11UXfY9uIYZO0csxu/M6tN4PaCdnpEbVtsnmgcg1C8PgyfA2lUU+CyoW9j4VPR7YR
         jfbb1uyn+OYiwa7vywZ7Il9Vui8fRZAwoRND6RR2s0hztfTWBXItNxPQkgoo01rZQubQ
         AyIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D7GAj602/PQPfG6jKKDTKfFtpx611WzD0nDfwj0f+aE=;
        b=rbgopizpF2Lb2cZX72EhgiMEQC79r8OSkn3FRgEnwQpRoP6eVZDcabOdZ+dA76JBsT
         ACUdi8V4L1Y1k8pJ1mJVJw7Gr2JJ+7DiM90wXXqKipKFCkDwQS6lA4WXqfpAq58YjQWE
         aRiIGb95s+LON4QuJnkCl4vpcG3L3qxNgLgR8UDC1gAl+X5Cs8iJJEeUlIvx0sxpNgRu
         m+/daNNEw0E3eHNFDRYyVYWAGFFBxkgunr/isYjs26IdbGdl4U+yZIV/+DMwECMVVoT9
         kbuWUwCut9qBtD4YO3WQmNaGNnGf06gEyFtchVH4sjZjSoUhl/1xYDVQR6vzCHQ8xg2I
         Keyw==
X-Gm-Message-State: AOAM532F4J6eFD3S4uMhcbkO7cTYYHCRKsjQdalYP16e/DdqIUK5eLO4
	EGltsjRNdDeWNK9ayS/TCvN7SaNDXHGpFgqAT2w=
X-Google-Smtp-Source: ABdhPJw0rJ6cDKe9nlQ65ekta/A+w4HsWcLZ3ecF4z78ywBSFlFYAtb0IFju7ehlyD1Noj0FxeFweaFK0Vg2k8LpbuA=
X-Received: by 2002:a9f:2a82:: with SMTP id z2mr4422928uai.71.1590583405054;
 Wed, 27 May 2020 05:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <qGlJFzBcawqf2UFr8E8EaYuftNrwyxaR9FaRpw7UDU7hVtXdCiCR9oZT9pWwRM-XXY-_OoOVLDeYazLfwnS7FbFIijyMlVVBGHDUc6R_EP8=@protonmail.ch>
In-Reply-To: <qGlJFzBcawqf2UFr8E8EaYuftNrwyxaR9FaRpw7UDU7hVtXdCiCR9oZT9pWwRM-XXY-_OoOVLDeYazLfwnS7FbFIijyMlVVBGHDUc6R_EP8=@protonmail.ch>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 27 May 2020 14:43:13 +0200
Message-ID: <CANNYZj-5X7R+u8DbcukZcCYcZH6iAdX6b-4Q9vcbFpA2yJMzig@mail.gmail.com>
Subject: Re: [OE-core] Issue with qemu and a shared sstate-cache used by different linux distribution supported by yocto
To: vygu <vygu@protonmail.ch>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d8105905a6a08e79"

--000000000000d8105905a6a08e79
Content-Type: text/plain; charset="UTF-8"

Can you please provide the lib names which are problematic?

Alex

On Wed, 27 May 2020 at 14:29, vygu via lists.openembedded.org <vygu=
protonmail.ch@lists.openembedded.org> wrote:

> Hello,
>
> Since the zeus serie (also with dunfell), we observe an issue with runqemu
> when we share the sstate-cache thanks to a mirror between different linux
> distribution supported by yocto.
>
> If we build a sstate-cache on a debian 10 x86_64 buildfarm,  and after
> that we use it on an ubuntu 18.04 x86_64, runqemu don't find several libs.
>
> We have reproduced this problem on two different pc with ubuntu 18.04 and
> 16.04.
>
> We don't have this problem, if we use the shared sstate-cache on another
> debian.
>
> In all cases, a  ldd on the qemu binary shows us the use of local/host
> libs, not the yocto libs.
>
> Is it an expected behavior? or not?
> Runqemu's libs have to come from the linux distribution or from the yocto
> build env?
>
> Cordially,
>
> vygu
>
>
>
> 
>

--000000000000d8105905a6a08e79
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Can you please provide the lib names which are proble=
matic?</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 27 May 2020 at 14:29,=
 vygu via <a href=3D"http://lists.openembedded.org">lists.openembedded.org<=
/a> &lt;vygu=3D<a href=3D"mailto:protonmail.ch@lists.openembedded.org">prot=
onmail.ch@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div>Hello,<br></div><div><br></div><div>=
Since the zeus serie (also with dunfell), we observe an issue with runqemu =
when we share the sstate-cache thanks to a mirror between different linux d=
istribution supported by yocto.<br></div><div><br></div><div><div>If we bui=
ld a sstate-cache on a debian 10 x86_64 buildfarm,=C2=A0 and after that we =
use it on an ubuntu 18.04 x86_64, runqemu don&#39;t find several libs.<br><=
br></div><div>We
 have reproduced this problem on two different pc with ubuntu 18.04 and 16=
.04. <br></div><div><br>We don&#39;t
have this problem, if we use the shared sstate-cache on another debian.</d=
iv><div><br></div><div>In all cases, a=C2=A0 ldd on the qemu binary shows u=
s the use of local/host libs, not the yocto libs. <br></div><div><br></div>=
<div>Is it an expected behavior? or not?<br></div></div><div>Runqemu&#39;s =
libs have to come from the linux distribution or from the yocto build env?<=
br></div><div><br></div><div>Cordially,<br></div><div><br></div><div>vygu<b=
r></div><div><br></div><div><div><br></div></div><div><br></div><br>
</blockquote></div>

--000000000000d8105905a6a08e79--
