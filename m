Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web12.9981.1616401797203228559
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 01:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=neXc5MKe;
 spf=pass (domain: gmail.com, ip: 209.85.222.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id c13so5250297uao.10
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Mar 2021 01:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VXHJ49TfOqeMgPNJO1CCGJZ8k4FTtd60Y3kQm0HvdPE=;
        b=neXc5MKeBqfevJNQmNJOxIJdiZkGQrFMR3vhadgpBbHCCDdicN6F5HAjM9l4m4RCXE
         1PpRzAhAeyxAQvlwlJ8gYkqSqKLcP/eyNM4pFkGTTGWAtOK84SYCv3hn/n7T8iDwTv97
         i7jj+5KS1sEK2PQsR9Xl5BKxHjilmeZsRS/3AaXzk0uIPzFYwut2FLpRJnavLK7x12+3
         4TjDvfmvBGiaQreGLuTTqOR6M6dLORyr30kjuRs8lF1QRNYpquPYxinR8lzfXSY+fRsp
         7RXMr+KMtvNFyoRC308NWKiid6YSBXadVYQV60zIz9czi2v8BIeylwFlWVC2pdJ+ftoV
         2a9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VXHJ49TfOqeMgPNJO1CCGJZ8k4FTtd60Y3kQm0HvdPE=;
        b=RWk/mPdd5+RNrN4tYRW5Tzx6SqNYVgmRZDTNNOJ4swwQ5CLOtm31MTDZdVEWuwt+TP
         dxj5bKBy5lVEgCt/Zh1xeFlbmGq2eTL6toa5GKtnE2DE+pnuWLQxvfHtaPvyEqL1zj92
         io1IfvMYVVCgl48xI0i2pKbpCevtLzJNSOwi5NyEL4yRzxCsihRuOZjJfF2vTMgSlLQt
         3Zx4frxsjLqBF5AyqgyUOzE+9j7bsGR+7Yymzvuj6SuLjRroVvTOAsb0FvGEoIRscKgB
         9Fc88TXM7cIlBYi07cnm8V9PuQcyVuYIK8cXY7+x+pJKijs/sXGSMJin1JqJkrJX/kuG
         HkFw==
X-Gm-Message-State: AOAM532s2ImYAdN/XHaboz6RiFlzebrPwBuLKrGRlROJb3voOdV+zIIb
	RZ1zXMq2mQj5prvY5KsoycSelvtdLPjijwmq9Q4=
X-Google-Smtp-Source: ABdhPJxVEbjYygi+5Ga8jPa6HN6tndqEOCLkxvLFYHPV6V+v6kSYMElxVk+Oz6BnWTTDGKTI7H2Jx0guAYJ2mULYpgc=
X-Received: by 2002:ab0:7150:: with SMTP id k16mr3901349uao.71.1616401796137;
 Mon, 22 Mar 2021 01:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <166D65C2E097270E.28077@lists.openembedded.org> <20210322075103.9694-1-mingli.yu@windriver.com>
In-Reply-To: <20210322075103.9694-1-mingli.yu@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 22 Mar 2021 11:29:45 +0300
Message-ID: <CANNYZj-7gQg41Qpue1ZR3HCBHKQ8veD3TOwbvRYcD5=wv0Pj6A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/2] gettext-minimal: Disable the unnecessary check in iconv.m4
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000df854605be1bdea7"

--000000000000df854605be1bdea7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Note that this m4 file is copied verbatim from upstream gettext, and will
be again overwritten on next gettext upgrade. You should figure out what=
=E2=80=99s
wrong specifically in elfutils tree, and work with elfutils upstream to
resolve it.

Alex

On Mon 22. Mar 2021 at 10.51, Yu, Mingli <mingli.yu@windriver.com> wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
>
> The below m4 macros files shipped with recipe will be removed if the
> recipe use AM_GNU_GETTEXT.
> gettext.m4
> iconv.m4
> lib-ld.m4
> lib-link.m4
> lib-prefix.m4
> nls.m4 po.m4
> progtest.m4
>
> After elfutils upgrades to 0.183, it begins to use AM_GNU_GETTEXT as the
> commit (dd52d2ab Modernize gettext infrastructure) included, so the abov=
e
> m4 macros files such as iconv.m4 is removed and it's bad as we need to
> patch against iconv.m4 shipped with elfutils.
>
> BTW, the logic to Disable the unnecessary check in iconv.m4 comes since
> 2015 as [1], so move the related logic to gettext-minimal which provides
> iconv.m4 now to fix the gap.
>
> [1]
> https://git.openembedded.org/openembedded-core/commit/?id=3D3dd269e027fd=
a173ee40d671ea47da22300fd51d
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/iconv.m4 | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git
> a/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/iconv.m4
> b/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/iconv.m4
> index e593b7270a..e04476bb7f 100644
> --- a/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/iconv.m4
> +++ b/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/iconv.m4
> @@ -166,6 +166,7 @@ AC_DEFUN([AM_ICONV_LINK],
>        }
>    }
>  #endif
> +#if 0
>    /* Test against HP-UX 11.11 bug: No converter from EUC-JP to UTF-8 is
>       provided.  */
>    {
> @@ -189,6 +190,7 @@ AC_DEFUN([AM_ICONV_LINK],
>      if (cd4 !=3D (iconv_t)(-1))
>        iconv_close (cd4);
>    }
> +#endif
>    return result;
>  ]])],
>            [am_cv_func_iconv_works=3Dyes], ,
> --
> 2.17.1
>
>
>=20
>
>

--000000000000df854605be1bdea7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Note that this m4 file is copied verbatim from upstream g=
ettext, and will be again overwritten on next gettext upgrade. You should f=
igure out what=E2=80=99s wrong specifically in elfutils tree, and work with=
 elfutils upstream to resolve it.</div><div dir=3D"auto"><br></div><div dir=
=
=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Mon 22. Mar 2021 at 10.51, Yu, Mingli &lt;<a href=3D=
"mailto:mingli.yu@windriver.com">mingli.yu@windriver.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-c=
olor:rgb(204,204,204)">From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@wind=
river.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
<br>
The below m4 macros files shipped with recipe will be removed if the<br>
recipe use AM_GNU_GETTEXT.<br>
gettext.m4<br>
iconv.m4<br>
lib-ld.m4<br>
lib-link.m4<br>
lib-prefix.m4<br>
nls.m4 po.m4<br>
progtest.m4<br>
<br>
After elfutils upgrades to 0.183, it begins to use AM_GNU_GETTEXT as the<b=
r>
commit (dd52d2ab Modernize gettext infrastructure) included, so the above<=
br>
m4 macros files such as iconv.m4 is removed and it&#39;s bad as we need to=
<br>
patch against iconv.m4 shipped with elfutils.<br>
<br>
BTW, the logic to Disable the unnecessary check in iconv.m4 comes since<br=
>
2015 as [1], so move the related logic to gettext-minimal which provides<b=
r>
iconv.m4 now to fix the gap.<br>
<br>
[1] <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=
=3D3dd269e027fda173ee40d671ea47da22300fd51d" rel=3D"noreferrer" target=3D"=
_blank">https://git.openembedded.org/openembedded-core/commit/?id=3D3dd269e=
027fda173ee40d671ea47da22300fd51d</a><br>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" ta=
rget=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/iconv.m4 | 2 =
++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/iconv.=
m4 b/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/iconv.m4<br>
index e593b7270a..e04476bb7f 100644<br>
--- a/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/iconv.m4<br>
+++ b/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/iconv.m4<br>
@@ -166,6 +166,7 @@ AC_DEFUN([AM_ICONV_LINK],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
+#if 0<br>
=C2=A0 =C2=A0/* Test against HP-UX 11.11 bug: No converter from EUC-JP to =
UTF-8 is<br>
=C2=A0 =C2=A0 =C2=A0 provided.=C2=A0 */<br>
=C2=A0 =C2=A0{<br>
@@ -189,6 +190,7 @@ AC_DEFUN([AM_ICONV_LINK],<br>
=C2=A0 =C2=A0 =C2=A0if (cd4 !=3D (iconv_t)(-1))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0iconv_close (cd4);<br>
=C2=A0 =C2=A0}<br>
+#endif<br>
=C2=A0 =C2=A0return result;<br>
=C2=A0]])],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[am_cv_func_iconv_works=3Dyes], ,=
<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000df854605be1bdea7--
