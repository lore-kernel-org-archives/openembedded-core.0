Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.6546.1622198967779827970
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 03:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HC6+8XER;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: samuli.piippo@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id m8-20020a17090a4148b029015fc5d36343so2301177pjg.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 03:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4GNkHW1fANf7QbO4bt0J9IoBqbt2v6yD5eYKijp/A0w=;
        b=HC6+8XERNuxggLnwOqCruK04nuMb5LegHdkisJayxUQhQxx8RhnYorVgxyQKHSUFAn
         4smOZ60+ZCLblmk+FkHMiSsNRebZKHQfhcVRS2M9ppIAIFRlI2kRZoR2jgCzMFfb5uu+
         n5GzovobScLTMvILdyrfXxOAo/iFZPmVKr3KYIXkOgjhkCr2v60dGDrcKx67hM+rqe8Y
         fv1T7jmCFFVZ9iyVNUXhBkCxmlmjfOKzDZjLUb4YVzGGz/rzl6wty1bwE0jVUBdzWLNP
         QwtWJ1eXNvdPH2XFujRPvhc+miKqs5xnpgAB1CVt1jKxE1CxR1gtHc2ZW9YDjbb1hZ94
         5GaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4GNkHW1fANf7QbO4bt0J9IoBqbt2v6yD5eYKijp/A0w=;
        b=IDhk6l66E3Ujj5SikQEvTL3VgG498ZaQO6vAC+Q3ELgQ7AiV6pz8o6n8TXBIv3oZFM
         tvFwfWno4FRFblIE/jhVA9eTFYc1baV/Y2xmHy/Z9zdz0O73/iNVFCi36zr0PJ7K1daZ
         M5MkF2iH55Sgvd93xz9gI/uJbNF7IesC3LUmYMuTcpSbFtfcyY8aF3Vf7esQDouTEPFc
         grmWp40gcWJWudMLq/KLRprcrxJVbqUWbuvjTULv7TvFBneHOWMwaVOWo5SeRQzlEtte
         Us9PTt2P5oQMXbDl3hI3/+1X5on5dUSYUCPGEpuw7x2JVCiGEJSrl7zAG9Xx+a7p9yGM
         ujfA==
X-Gm-Message-State: AOAM530P5aFtOlSfs8+EbACJVdxvbAyI9gGIJjsvto2l4DAcJE1iO4KR
	eoM60WvUbNQyow677Sp+jBbWSv5FE26V48wKxgU=
X-Google-Smtp-Source: ABdhPJzU9qEwgXdOP8/UN9sthn0P6aIUpTb7RCWVozPcpMQf4lbDnijTjZj79PIB3QfAfOWKPfyKCoaTGKmMblg4zi8=
X-Received: by 2002:a17:90a:9511:: with SMTP id t17mr3790241pjo.108.1622198967318;
 Fri, 28 May 2021 03:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210521143328.3368988-1-samuli.piippo@qt.io> <ea6eee79c5a985e385579eda3786c515dbfdd5a1.camel@linuxfoundation.org>
 <CABXoSoUs-V6_0Tk7SrsDCewX3QudEzQitz2iPb=zMu1-MnY6kQ@mail.gmail.com> <4c5627bc3c5a1b6f882e3455ad15d4d4cf94f64c.camel@linuxfoundation.org>
In-Reply-To: <4c5627bc3c5a1b6f882e3455ad15d4d4cf94f64c.camel@linuxfoundation.org>
From: "Samuli Piippo" <samuli.piippo@gmail.com>
Date: Fri, 28 May 2021 13:49:16 +0300
Message-ID: <CABXoSoUBZYzMehyJ+FhrbSEa2PrZ3PXSjgYYEQB3NGM4ZYX9uw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] Revert "gcc-cross-canadian: Add symlink to real-ld alongside other symlinks"
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000033bb1b05c361a1f5"

--00000000000033bb1b05c361a1f5
Content-Type: text/plain; charset="UTF-8"

Tested this locally and gcc is trying to find the linker with the multilib
prefix, but that's not available in SDK.
[pid  3784] newfstatat(AT_FDCWD,
"/home/sapiippo/build/toolchain/sysroots/x86_64-pokysdk-linux/usr/libexec/mips-poky-linux/gcc/mips-poky-linux/11.1.0/mips-pokymllib32-linux-ld",
0x7ffe380d44a0, 0) = -1 ENOENT (No such file or directory)

The same works on bitbake builds, where lib32-gcc-cross-mips add the
symlink:
mips-pokymllib32-linux-ld ->
../../../../../bin/mips-pokymllib32-linux/mips-pokymllib32-linux-ld
(even though the binary is built in lib32-binutils-cross-mips)

So, the cross-canadian builds are missing all the multilib links in libexec
that are available in cross builds.

-samuli

On Wed, 26 May 2021 at 12:44, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2021-05-26 at 12:23 +0300, Samuli Piippo wrote:
> > Was the "gcc-cross-canadian: add symlinks for ld.bfd and ld.gold" change
> > included in that test build?
>
> Yes, it was.
>
> Cheers,
>
> Richard
>
>

--00000000000033bb1b05c361a1f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Tested this locally and gcc is trying to find the lin=
ker with the multilib prefix, but that&#39;s not available in SDK.</div><di=
v>[pid =C2=A03784] newfstatat(AT_FDCWD, &quot;/home/sapiippo/build/toolchai=
n/sysroots/x86_64-pokysdk-linux/usr/libexec/mips-poky-linux/gcc/mips-poky-l=
inux/11.1.0/mips-pokymllib32-linux-ld&quot;, 0x7ffe380d44a0, 0) =3D -1 ENOE=
NT (No such file or directory)<br></div><div></div><div><br></div><div>The =
same works on bitbake builds, where lib32-gcc-cross-mips add the symlink:</=
div><div></div><div>mips-pokymllib32-linux-ld -&gt; ../../../../../bin/mips=
-pokymllib32-linux/mips-pokymllib32-linux-ld</div><div>(even though the bin=
ary is built in lib32-binutils-cross-mips)</div><div><br></div><div>So, the=
 cross-canadian builds are missing all the multilib links in libexec that a=
re available in cross builds.<br></div><div><br></div><div>-samuli<br></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Wed, 26 May 2021 at 12:44, Richard Purdie &lt;<a href=3D"mailto:richard=
.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 2021=
-05-26 at 12:23 +0300, Samuli Piippo wrote:<br>
&gt; Was the &quot;gcc-cross-canadian: add symlinks for ld.bfd and ld.gold&=
quot; change=C2=A0<br>
&gt; included in that test build?<br>
<br>
Yes, it was.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--00000000000033bb1b05c361a1f5--
