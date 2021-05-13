Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web09.14411.1620917007339965214
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 07:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uEVLG/GS;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id x17so9421942vsc.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 07:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OaEihg3A20hsKSmsRuQ6o5o+OCJYSvTH3cJ91vokzt8=;
        b=uEVLG/GSihbYEUueQWKKXn2MoWC8GohO4zVQDhBUbH+D6kpfxSQrzXJgF8G0O+qT38
         Yufsdqf6cz60EFkfcqp9BN1YO4wYl38Se7/wRDkQDbbn3E6oW0J1XLkxOW1uYp5W5bXu
         4kJTIvfcTXZTHqFeXzvCGxN7+qlHmHs4V68uL82mo0DTpdhRxTdLVOFQM+qj4fx6qDIc
         apu36QMBC+J0VpUvKqHsJOimnK/lXQ/Z/dEIddCBrMkxxwU5xofCyJ3GSQAiTro1v/gZ
         8Imfb5hDeLDg0QY4mvsb0JuXy7H6ABFTyR84cRJZ8fq+3c57Cp24ov5LQ90k+UcamyL7
         f7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OaEihg3A20hsKSmsRuQ6o5o+OCJYSvTH3cJ91vokzt8=;
        b=RudCA3hQVaovKVvtJFLZFimbv/ZCPhBr1nDH7ywlzxH+AUkL2UW/UNl4lJ9LSv1s1l
         9MeApYfYpXzIxAMY3WS1/o8C4Me4NGQNW7Kz1SfpSNPz2STy1J2oXY4z3jwcFxfpJVmc
         eP6+q7S5oMk6TDQ7HqxYwHvJchAKszxfAtvdFXMebwJ3Kt+825yqU/3V3qSPmbBRsg4E
         g9GMmcEf2590IUwEDLk2fxfxdj+SnoILggK5pPcOlgpMfMu9dcPuTkqbyxBsqGM/x4Yb
         cZUUMWvuE7Ocri4xKeeCxcOY6y5tH+hRGEM+ynSg2fnpeTgYBN3GdXgo2eMLEFUn/Zq4
         bQTQ==
X-Gm-Message-State: AOAM533+Dk5rTs18P4Q4TOa8PYRuPPKoWBpDc07hDKeLAwa+AMT48JeD
	eJi+4AywdEAF7uYTu8rAkV4iVw/iL0YqcsRQTAIWEnSX
X-Google-Smtp-Source: ABdhPJy3uBdu0V4jZmVq57YIgYuxJvfHq+65rsVjtEwwp9El/Bnt5lkyUCI8ivBneFLMM/m6cOLInm4tPm8EVbP2hCI=
X-Received: by 2002:a67:d715:: with SMTP id p21mr29560630vsj.31.1620917006383;
 Thu, 13 May 2021 07:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210513143632.1211604-1-mac@mcrowe.com>
In-Reply-To: <20210513143632.1211604-1-mac@mcrowe.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 13 May 2021 16:43:15 +0200
Message-ID: <CANNYZj8E6Rem_gy-NieFXyBBmb=qBB9rcX1C9D01dhtymFm9pQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libnotify: Make gtk+3 dependency optional
To: yocto@mac.mcrowe.com
Cc: OE-core <openembedded-core@lists.openembedded.org>, Mike Crowe <mac@mcrowe.com>
Content-Type: multipart/alternative; boundary="000000000000603c0d05c2372668"

--000000000000603c0d05c2372668
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 May 2021 at 16:36, Mike Crowe via lists.openembedded.org <yocto=
mac.mcrowe.com@lists.openembedded.org> wrote:

> +PACKAGECONFIG[gtk+] = "--enable-tests,--disable-tests,,gtk+3"
>

Was the --enable-tests scenario tested? Specifying gtk+3 after two ,,s
seems weird.

Alex

--000000000000603c0d05c2372668
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 13 May 2021 at 16:36, Mike Crowe via <a href=3D"http://lists=
.openembedded.org">lists.openembedded.org</a> &lt;yocto=3D<a href=3D"mailto=
:mac.mcrowe.com@lists.openembedded.org">mac.mcrowe.com@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">+PACKAGECONFIG[gtk+] =3D &quot;--enable-tests,--disable-tests,,gtk+3&quot=
;<br>

</blockquote><div><br></div><div>Was the --enable-tests scenario tested? Sp=
ecifying gtk+3 after two ,,s seems weird.</div><div><br></div><div>Alex<br>=
</div></div></div>

--000000000000603c0d05c2372668--
