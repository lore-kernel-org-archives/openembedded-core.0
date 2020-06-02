Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.3115.1591069149949083837
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 20:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Opj6kNud;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id g18so9546672qtu.13
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 20:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MAiAXfJcI2PtG9SqslwO3xDik5NzHtj9M+YLF9WXImw=;
        b=Opj6kNudRA1qKB9K8YWxGMEZAiJrIn/P5dIRV5nAuTB6XJ0BCDFGgT7It0Vc4JzbVa
         RAEYz1Tg8QIFftDcNT69wMyf+5FWxZRCWPOiMRVsRMA7auepZqTG0iazAhn3e/7caUq5
         YufFhfyk8kIdzRustrSzusMOYXpcBIxkBK/Zv7AIT6v9KHtnwmZ7MKrmxtYvLBnSDWbI
         dy1uGQK55dxT8zZxU7qygZr89CmuJ1yqw+70ks/JTwnCNmoSs4wT6GDPs9zXalxLokDE
         O8eZmUnG66apYia2TgvG0EI2BZisuHB/oQbqQmdMZR/FUCwp1CFHniXfJpFa8zexXZ0q
         8r0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MAiAXfJcI2PtG9SqslwO3xDik5NzHtj9M+YLF9WXImw=;
        b=RA0C7ilSMMWtdLUvSrmRfJg/FDO0xwgo8rqrpsTTs9rvP83iVi9yA4EuIH+a6rgx3A
         w3pK8HznzlXltSZN56MNtECuX/MM0kZYggiNu5s/yhVyNNkYtdWGqWeWOvTEzO4nwpr+
         bJuTPUAEYbaOHHyUJl1Wl8ApMnwaRWi7bRTTEmC341pjvLnVNnwgkae8o5DhPx4x+ARg
         OdCNM3pAOMuWaVFuWby3eJ0p8eaVH3m3/fZyk07ujt4DFF0QiXw+A8si1pBsrhrhtZbS
         /bNXiXYC3UldiZdti2AamrgOWWBHZybizAaUcYEeR+ROHYp0kam00pkKvC7pBkB+gZnb
         Z4lA==
X-Gm-Message-State: AOAM5331ianFY1ijvBAkLr27BC26J69ORdH2e0txOdLa9d4yH7hh3tyF
	XwW2s4PfAa05q9ogtfxKurusX9TvwNu/gzkE/JY=
X-Google-Smtp-Source: ABdhPJzKUUBp3tJ681hVD9RH0QUZcBNHWQnjhEGDZjMeOfqhR8CCPkaqim7RWni1dMfGs59GeQa0O2webDCMDZ/oHIQ=
X-Received: by 2002:ac8:44b3:: with SMTP id a19mr25098364qto.285.1591069148843;
 Mon, 01 Jun 2020 20:39:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200531155254.10283-1-alex.kanavin@gmail.com> <20200531155254.10283-25-alex.kanavin@gmail.com>
In-Reply-To: <20200531155254.10283-25-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 1 Jun 2020 20:38:58 -0700
Message-ID: <CAMKF1soXy1fbdSiN0+MCawu3yttoVzarN3jk6bh8he70g3BGSw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 25/70] stress-ng: mark as incompatible with musl
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006e164505a711a78e"

--0000000000006e164505a711a78e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 31, 2020 at 8:54 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Newer versions make use of ustat() which is absent in musl.
>

https://www.man7.org/linux/man-pages/man2/ustat.2.html

Says it=E2=80=99s removed from glibc 2.28 as well and yes musl never shipp=
ed
ustat.h so I wonder how it still
Works on glibc

>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-extended/stress-ng/stress-ng_0.11.12.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.11.12.bb
> b/meta/recipes-extended/stress-ng/stress-ng_0.11.12.bb
> index ba93efc4c8..45f4bb41ad 100644
> --- a/meta/recipes-extended/stress-ng/stress-ng_0.11.12.bb
> +++ b/meta/recipes-extended/stress-ng/stress-ng_0.11.12.bb
> @@ -22,3 +22,5 @@ inherit bash-completion
>  do_install() {
>      oe_runmake DESTDIR=3D${D} install
>  }
> +
> +COMPATIBLE_HOST_libc-musl =3D 'null'
> --
> 2.26.2
>
>=20
>

--0000000000006e164505a711a78e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, May 31, 2020 at 8:54 AM Alexander Kanavin &lt;<a h=
ref=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Newer versions make use of ustat()=
 which is absent in musl.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"><div><a href=3D=
"https://www.man7.org/linux/man-pages/man2/ustat.2.html">https://www.man7.o=
rg/linux/man-pages/man2/ustat.2.html</a></div><br></div><div dir=3D"auto">S=
ays it=E2=80=99s removed from glibc 2.28 as well and yes musl never shipped=
 ustat.h so I wonder how it still</div><div dir=3D"auto">Works on glibc=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/stress-ng/<a href=3D"http://stress-ng_0.11.12.=
bb" rel=3D"noreferrer" target=3D"_blank">stress-ng_0.11.12.bb</a> | 2 ++<br=
>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-extended/stress-ng/<a href=3D"http://stress-ng_0=
.11.12.bb" rel=3D"noreferrer" target=3D"_blank">stress-ng_0.11.12.bb</a> b/=
meta/recipes-extended/stress-ng/<a href=3D"http://stress-ng_0.11.12.bb" rel=
=
=3D"noreferrer" target=3D"_blank">stress-ng_0.11.12.bb</a><br>
index ba93efc4c8..45f4bb41ad 100644<br>
--- a/meta/recipes-extended/stress-ng/<a href=3D"http://stress-ng_0.11.12.=
bb" rel=3D"noreferrer" target=3D"_blank">stress-ng_0.11.12.bb</a><br>
+++ b/meta/recipes-extended/stress-ng/<a href=3D"http://stress-ng_0.11.12.=
bb" rel=3D"noreferrer" target=3D"_blank">stress-ng_0.11.12.bb</a><br>
@@ -22,3 +22,5 @@ inherit bash-completion<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0oe_runmake DESTDIR=3D${D} install<br>
=C2=A0}<br>
+<br>
+COMPATIBLE_HOST_libc-musl =3D &#39;null&#39;<br>
-- <br>
2.26.2<br>
<br>
<br>
</blockquote></div></div>

--0000000000006e164505a711a78e--
