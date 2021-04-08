Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web08.4909.1617868718662793254
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 00:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pU+1P31m;
 spf=pass (domain: gmail.com, ip: 209.85.222.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id c2so435695uaj.3
        for <Openembedded-core@lists.openembedded.org>; Thu, 08 Apr 2021 00:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q6L8p2YtG4TAOZTffPQ+NwvlhVNQT8gIrxolcTMrOUY=;
        b=pU+1P31mg8IDn/kV/5pvF6XmqCEdzrlE71TayKdWaByMyj3SSXoClqgBeu3CqGefbW
         EBtAKYyAUV2u1lBlMKXLlwczCxJgv9tTgilDJaM5DQZ+QPL9jR5dIj0z8IGFfEXOtFqc
         XytLQ8LhW6qUIvvf19BWcIARP30NMY6BuD11YSQBH4t20GJfNE3ZfaaNRPzIYWNcl+f9
         eoXB1Zj6M5crb8lTWa4/2yKb3kKi67nR7sq7DHMwjYcw/kjpukgA2hD0Zn2qAYQ6yVPy
         7QkbAKw+zwc3/YwsQ5ie0MmNPIaG2TND8zyOEa658CxC2w0i+EhRBHRFAWmyypre0uSq
         /snA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q6L8p2YtG4TAOZTffPQ+NwvlhVNQT8gIrxolcTMrOUY=;
        b=DoyMlbqWjlZXWVCfNPAY/8RiCULqfhv28tMi05U6QNyhYzOg5xd1IdyfFZd6ZGG+jn
         eMAu5pwPs6pN7/N6iKFJcVrKyLLUgx4ih2cUX/x7K0/JqZ97B/f78XaLmYlukNvlnAbA
         HbXXpGSFyx0Z0IPI39oUFtaLV+bBl0kPbNpSyRmJnI/zUhc70YEHu3uehxIBhdmnFRR1
         mDLtmqWAnpmC+R1xJ64Dhv4ZiQntZBjTt5IiCE4M68eB4NqQ7+biZipVw89/nwhBMDZD
         PlXG3L4V9EFaCIB6/snWxCp1+VlKkNCSHUoru1HCgs6bZ1Qm0h01e1FMfX1Mg9imOCkJ
         h6XA==
X-Gm-Message-State: AOAM531OuD5HW/bl/WIrGgD2xZXQ4GVv2q/pbr8n4/+klh3qxVFGfiYW
	W19BoVv4a6NI50SEsw9/YfGJeMc4kbmLS6ZytR4=
X-Google-Smtp-Source: ABdhPJyD9a5DH6V2Mp3x3aJ2YKaxduc/DrbDSFAyLdJsKKxhHkETF9CHxh88Cwj1xWfaw9tmk2qyhXEv8h1RCFYXW04=
X-Received: by 2002:ab0:310a:: with SMTP id e10mr4868222ual.93.1617868717778;
 Thu, 08 Apr 2021 00:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <CANUMPcXbx5=c4GYhLC9U-4eytjoEDogJNsoMwA4wCn1d6AGZAQ@mail.gmail.com>
In-Reply-To: <CANUMPcXbx5=c4GYhLC9U-4eytjoEDogJNsoMwA4wCn1d6AGZAQ@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 8 Apr 2021 09:58:26 +0200
Message-ID: <CANNYZj_8Fm0TmSD-8EU2Gu9UkRYwT6AdgWGhOuuNDtXXFM1dRQ@mail.gmail.com>
Subject: Re: [OE-core] RUST test integration with oe-selftest.
To: Vinay Kumar <vinay.m.engg@gmail.com>
Cc: Patches and discussions about the oe-core layer <Openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Randy MacLeod <rwmacleod@gmail.com>, umesh kalappa0 <umesh.kalappa0@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000376b5705bf716a69"

--000000000000376b5705bf716a69
Content-Type: text/plain; charset="UTF-8"

Can you send the patch separately using 'git send-email' please? Otherwise,
it's very difficult to review, as it's impossible to write inline comments
to attachments.

Alex

On Thu, 8 Apr 2021 at 09:22, Vinay Kumar <vinay.m.engg@gmail.com> wrote:

> Hi,
>
> Please find the attached patch (rust-oe_selftest.patch) of rust cross
> testing through oe-selftest method for review.
> We have tested for x86, x86_64, mips, mips64, arm, arm64 and powerpc.
> Also, attached  test summary (test_result_summary.txt) of each target.
>
> #command to trigger rust testing:
> $oe-selftest -r rust.RustSelfTestSystemEmulated.test_rust
>
> Note:
>     1. In the case of x86_64 target we were seeing build error as
> below, since the target and build section in config.toml are
> identical.
>         `error: failed to run custom build command for `memchr v2.3.3`
>  (When manually entered in config.toml)
>
>         Also, through poky "Exception:
> configparser.DuplicateSectionError: Section
> 'target.x86_64-unknown-linux-gnu' already exists
>         config.tome
>
>         So, we have used "x86-poky-linux" as a target in case of
> x86_64. To consider this in the rust test we are setting the path  of
> "RUST_TARGET_PATH" to
>         "${STAGING_LIBDIR_NATIVE}/rustlib".
>
>     2. In the case of mips64 target, we made changes in
> "rust-common.bbclass" to generate a rust equivalent target
> "mips64-unknown-linux-gnuabi64" .
>
> Regards,
> Vinay
>
> 
>
>

--000000000000376b5705bf716a69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Can you send the patch separately using &#39;git send=
-email&#39; please? Otherwise, it&#39;s very difficult to review, as it&#39=
;s impossible to write inline comments to attachments.</div><div><br></div>=
<div>Alex<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Thu, 8 Apr 2021 at 09:22, Vinay Kumar &lt;<a href=3D"mailto=
:vinay.m.engg@gmail.com">vinay.m.engg@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
Please find the attached patch (rust-oe_selftest.patch) of rust cross<br>
testing through oe-selftest method for review.<br>
We have tested for x86, x86_64, mips, mips64, arm, arm64 and powerpc.<br>
Also, attached=C2=A0 test summary (test_result_summary.txt) of each target=
.<br>
<br>
#command to trigger rust testing:<br>
$oe-selftest -r rust.RustSelfTestSystemEmulated.test_rust<br>
<br>
Note:<br>
=C2=A0 =C2=A0 1. In the case of x86_64 target we were seeing build error a=
s<br>
below, since the target and build section in config.toml are<br>
identical.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 `error: failed to run custom build command for=
 `memchr v2.3.3`<br>
=C2=A0(When manually entered in config.toml)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Also, through poky &quot;Exception:<br>
configparser.DuplicateSectionError: Section<br>
&#39;target.x86_64-unknown-linux-gnu&#39; already exists<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 config.tome<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 So, we have used &quot;x86-poky-linux&quot; as=
 a target in case of<br>
x86_64. To consider this in the rust test we are setting the path=C2=A0 of=
<br>
&quot;RUST_TARGET_PATH&quot; to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${STAGING_LIBDIR_NATIVE}/rustlib&quot;.<=
br>
<br>
=C2=A0 =C2=A0 2. In the case of mips64 target, we made changes in<br>
&quot;rust-common.bbclass&quot; to generate a rust equivalent target<br>
&quot;mips64-unknown-linux-gnuabi64&quot; .<br>
<br>
Regards,<br>
Vinay<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000376b5705bf716a69--
