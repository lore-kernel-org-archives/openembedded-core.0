Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web10.2430.1607025124638532620
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 11:52:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eMRsFIVF;
 spf=pass (domain: gmail.com, ip: 209.85.217.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f67.google.com with SMTP id q10so1926644vsr.13
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 11:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qD00w4FKakQ56DrTt2qNdcVAjwc+0nGxChw9d+bIm7w=;
        b=eMRsFIVFVnqEJqac6CkkzFGxDBX3UbtAoMMa9aNtoz5OOxGZAMyKJk9ugaZMc42kUQ
         4vQmJp7u6+Jl02yqUHcT/YLL64/bxlQRPI4xyI318SVtVaPzIAo1QdAml/n1O2cKYHgj
         rB6AzTuyRlhwVe5v45SL8DYFVNl953b8y/dhSg4aWAeUp9BRYvJ37h1i1nmUxDRuODUP
         CDv2qpSEJLFJOIF9nG5ky9OsdiEWdPYtn7IpmdR1LDvVgOXWChvyVY5Ooz/5G3XLl8zl
         mwwFutMwcRV9qop5+eh8DZSsWAB63uIpFdiRH7kpKHP8Saf4Rtot67shKal0KrE2/f07
         HJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qD00w4FKakQ56DrTt2qNdcVAjwc+0nGxChw9d+bIm7w=;
        b=KvVoy5FJaLcTvSjre+WJk3rUIDRqjwiYyaA3npCszJirDRPgAdZfDPmZQr/hqwGWl9
         qSS2X9hM88cfMBjhOIKjRtrAIEQyoe3J+lYki0Jcn2Ir24CAQ4tRlFyH8JG7TV1VCpww
         DlArF+YlcU+lcrd8jAVbhPOCfHEIVS8CRR0AF1zwzA1y+VhGKm/jLeKZG3Ias66MfMyC
         hPvAaSwUeAbgUFahVY+F5gzqiL7B3UdBdC7Rnq2x3Bj2T+EjdQr5fQZUpzgMhXkUASAQ
         eqePrv6KQYmyAihLgMK+R6CzgT14CTHUAhhLa7TgkZvvVuzv5wagjGaFf2Wn2rzUZCty
         vzRw==
X-Gm-Message-State: AOAM532rQ1vBUIj/vwP+zVMhaX0plAEmdbHPGK0CeOMaN4fTNlrYroT3
	tZKdC2ndkZkA1//eNdiwaZzPV4vOEnNckjsw4iA=
X-Google-Smtp-Source: ABdhPJzpYO68WK/vM5NYiBddmX5mn+hEOF5LbP6+q8dAe5akxmhmmDX889Rm6hl8rHBOHnniki2IF+FUL2ye4aSofLk=
X-Received: by 2002:a67:7902:: with SMTP id u2mr402430vsc.41.1607025123829;
 Thu, 03 Dec 2020 11:52:03 -0800 (PST)
MIME-Version: 1.0
References: <20201203133727.12936-1-alex.kanavin@gmail.com>
 <20201203133727.12936-8-alex.kanavin@gmail.com> <CAMKF1sq+iTO90AcsPaMVcRXiqEaPYtfoar+LMTQwEWOoQx712g@mail.gmail.com>
In-Reply-To: <CAMKF1sq+iTO90AcsPaMVcRXiqEaPYtfoar+LMTQwEWOoQx712g@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 3 Dec 2020 20:51:52 +0100
Message-ID: <CANNYZj9TRbE2gOZtPGnVBmEm-V4gD-AxYFwbvrRtQUhCJ19CCA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 08/11] serf: do not install the static library
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a6acf305b594b168"

--000000000000a6acf305b594b168
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Dec 2020 at 20:30, Khem Raj <raj.khem@gmail.com> wrote:

>
> honestly, scons should be fixed here. Since it will be used in more
> than one places
> using host ar is never a good option for cross builds.
> if you dare reluctant to fix scons properly that's fine but at least
> create a tracker bug for it.
>

There you go:
https://github.com/SCons/scons/issues/3838

Alex

--000000000000a6acf305b594b168
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 3 Dec 2020 at 20:30, Khem Raj &lt=
;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br=
></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
honestly, scons should be fixed here. Since it will be used in more<br>
than one places<br>
using host ar is never a good option for cross builds.<br>
if you dare reluctant to fix scons properly that&#39;s fine but at least<br=
>
create a tracker bug for it.<br></blockquote><div><br></div><div>There you =
go:</div><div><a href=3D"https://github.com/SCons/scons/issues/3838">https:=
//github.com/SCons/scons/issues/3838</a></div><div><br></div><div>Alex<br><=
/div></div></div>

--000000000000a6acf305b594b168--
