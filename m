Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web11.29000.1623672439593373063
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jun 2021 05:07:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nQgmRUBf;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id j15so7651652vsf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jun 2021 05:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zVpPAJAHStnUWawAZzTqFzVHYD8cQXiJssU7XBp+PUA=;
        b=nQgmRUBfEh0YYjmH1Fu1RAmW/Sz8RUOYsPQcxkIJva6svh9DZiqb2PXEgfUml55Pps
         DqNfraH2ETRCt3I3LqNYO2O4zyl3FeUQxkYuClI/s3xoOXgs/PupX9weGgCN7V+TQLCb
         nJG060jhlTjSUyngEbolT6ih9G7mfLiDinJwExLxfEq6TMnfk9RwzUiOpJlUqVJfo/Hk
         OpEfF5eQqfUQR2j2yHlw77qT5JXMIjXw8KAshuXbWNYRgbF5kQx6OYoYSb4EM+NxcTZO
         CFyHQZ0J//Y2ek8Cy6YcroDxiPkQ/+CXi9G+qOrajP/yp+eWNXtO62Zyj96Qeo5eV06a
         sDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zVpPAJAHStnUWawAZzTqFzVHYD8cQXiJssU7XBp+PUA=;
        b=BGpl05H5wqljRL1PDk3fsrB7tP9e8gyctRJrcoS0rHZfFTH9y0Fjgq7Cvk9m4bOxwP
         KB5W3pln/CfwxskuvA9MLBq7s+VcAc/StqrtUJY3xBxQagiEduPArWHAKWja4xdEj/Cz
         mv4lAc6SjtZPmLlRPkKrt8CBs0PlqZHV96TxUiR60+P6X/CYQiQrebkfU/rQWsSlCxs2
         6HvRDnYnJuQrgZAatHAebdHq6xJh6GD+PnYU/fDFA07CumQ+p77AIj1j+IFcBs2O45kU
         zz8eBUQ0vm+bhv2FyF9gVdo0Nt/y90L289m7juFiwSYQRQRzUbBXev8SnL+pw0s3N5Ia
         XtiA==
X-Gm-Message-State: AOAM532kxlUMUtCWhgFgUZCts0DOBSSkDXrWmU/TEG/GnnJegpdgA6dJ
	rY91t6DvTPXNSCzRQKfSHJbIjR7RR0zmT9T2SZs=
X-Google-Smtp-Source: ABdhPJypfSLg64BkDUo6DuBO7q/ZvKSLjVUaQ8X3hj9ypmfGZKyxhUmoxxyNYpeciom5BlAfO3IZkhPUHkC1WPRtvOc=
X-Received: by 2002:a67:1502:: with SMTP id 2mr17672177vsv.54.1623672438752;
 Mon, 14 Jun 2021 05:07:18 -0700 (PDT)
MIME-Version: 1.0
References: <1622704403-26153-1-git-send-email-wangmy@fujitsu.com>
 <1622704403-26153-4-git-send-email-wangmy@fujitsu.com> <25117a5d416119bb7432e250b9d5377d073c4251.camel@linuxfoundation.org>
In-Reply-To: <25117a5d416119bb7432e250b9d5377d073c4251.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 14 Jun 2021 14:07:07 +0200
Message-ID: <CANNYZj89iHOP5mw2FLbt1Rqss=UE+E2C3KtXdzUswOaXSYwCiw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] util-linux: upgrade 2.36.2 -> 2.37
To: wangmy <wangmy@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000f189e605c4b8b2ac"

--000000000000f189e605c4b8b2ac
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Jun 2021 at 00:55, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2021-06-03 at 15:13 +0800, wangmy wrote:
> > avoid_parallel_tests.patch
> > Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch
> > removed since they are included in 2.37
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  ...d_2.36.2.bb => util-linux-libuuid_2.37.bb} |  0
> >  meta/recipes-core/util-linux/util-linux.inc   |  4 +-
> >  ...RA_LTLIBRARIES-instead-of-noinst_LTL.patch | 49 -------------------
> >  .../util-linux/avoid_parallel_tests.patch     | 20 --------
> >  ...til-linux_2.36.2.bb => util-linux_2.37.bb} |  0
> >  5 files changed, 1 insertion(+), 72 deletions(-)
> >  rename meta/recipes-core/util-linux/{util-linux-libuuid_2.36.2.bb =>
> util-linux-libuuid_2.37.bb} (100%)
> >  delete mode 100644
> meta/recipes-core/util-linux/util-linux/Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch
> >  delete mode 100644
> meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
> >  rename meta/recipes-core/util-linux/{util-linux_2.36.2.bb =>
> util-linux_2.37.bb} (100%)
>
> This threw warnings on the autobuilder:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/3794
>
> I aborted the build run.
>

I have to once again note that the best way to avoid patch fuzz and
incorrect rebasing (in this case,  avoid_parallel_tests.patch was dropped
even though it is *not* included in 2.37) is to use 'devtool upgrade'. Can
you please explain why you are doing manual work instead which causes those
issues?

Alex

--000000000000f189e605c4b8b2ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 4 Jun 2021 at 00:55, Richa=
rd Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard=
.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Thu, 2021-06-03 at 15:13 +0800, wangmy wrote:=
<br>
&gt; avoid_parallel_tests.patch<br>
&gt; Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch<br>
&gt; removed since they are included in 2.37<br>
&gt; <br>
&gt; Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" t=
arget=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0...<a href=3D"http://d_2.36.2.bb" rel=3D"noreferrer" target=3D"_=
blank">d_2.36.2.bb</a> =3D&gt; <a href=3D"http://util-linux-libuuid_2.37.bb=
" rel=3D"noreferrer" target=3D"_blank">util-linux-libuuid_2.37.bb</a>} |=C2=
=A0 0<br>
&gt; =C2=A0meta/recipes-core/util-linux/util-linux.inc=C2=A0 =C2=A0|=C2=A0 =
4 +-<br>
&gt; =C2=A0...RA_LTLIBRARIES-instead-of-noinst_LTL.patch | 49 -------------=
------<br>
&gt; =C2=A0.../util-linux/avoid_parallel_tests.patch=C2=A0 =C2=A0 =C2=A0| 2=
0 --------<br>
&gt; =C2=A0...<a href=3D"http://til-linux_2.36.2.bb" rel=3D"noreferrer" tar=
get=3D"_blank">til-linux_2.36.2.bb</a> =3D&gt; <a href=3D"http://util-linux=
_2.37.bb" rel=3D"noreferrer" target=3D"_blank">util-linux_2.37.bb</a>} |=C2=
=A0 0<br>
&gt; =C2=A05 files changed, 1 insertion(+), 72 deletions(-)<br>
&gt; =C2=A0rename meta/recipes-core/util-linux/{<a href=3D"http://util-linu=
x-libuuid_2.36.2.bb" rel=3D"noreferrer" target=3D"_blank">util-linux-libuui=
d_2.36.2.bb</a> =3D&gt; <a href=3D"http://util-linux-libuuid_2.37.bb" rel=
=3D"noreferrer" target=3D"_blank">util-linux-libuuid_2.37.bb</a>} (100%)<br=
>
&gt; =C2=A0delete mode 100644 meta/recipes-core/util-linux/util-linux/Autom=
ake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch<br>
&gt; =C2=A0delete mode 100644 meta/recipes-core/util-linux/util-linux/avoid=
_parallel_tests.patch<br>
&gt; =C2=A0rename meta/recipes-core/util-linux/{<a href=3D"http://util-linu=
x_2.36.2.bb" rel=3D"noreferrer" target=3D"_blank">util-linux_2.36.2.bb</a> =
=3D&gt; <a href=3D"http://util-linux_2.37.bb" rel=3D"noreferrer" target=3D"=
_blank">util-linux_2.37.bb</a>} (100%)<br>
<br>
This threw warnings on the autobuilder:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/15/build=
s/3794" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/15/builds/3794</a><br>
<br>
I aborted the build run.<br></blockquote><div><br></div><div>I have to once=
 again note that the best way to avoid patch fuzz and incorrect rebasing (i=
n this case,=C2=A0 avoid_parallel_tests.patch was dropped even though it is=
 *not* included in 2.37) is to use &#39;devtool upgrade&#39;. Can you pleas=
e explain why you are doing manual work instead which causes those issues?<=
/div><div><br></div><div>Alex<br></div></div></div></div></div>

--000000000000f189e605c4b8b2ac--
