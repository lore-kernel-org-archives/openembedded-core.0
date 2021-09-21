Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web12.2571.1632251120573376657
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 12:05:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mQYgp7i6;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id c7so1033561qka.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Sep 2021 12:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=STG5NrpULfJInRmGsuGXzp35OWBDmr7G3Te8cinXhr4=;
        b=mQYgp7i6vIQrxTXZB+AeynZS4ToZj5w/RjxPa+HHlvx302GxE+RiIlkQxOs7sobXzm
         ZsNkV++is9AtLHqgi8kgiYpEz0j7bpQ3cJypjhEjq4l7wvPAJ9KR/gd4rXeZz9PZt1Sh
         baTt+TFxLXMjo+OlpL7BpFOuC27R492RXxGKsxtresGEHgyh206YvXQYRzg+exUD22CL
         lA2YbZPwQ9++MrSGUYUsylnemHDDBJ7alBRsDc0z9KiHR6E3UhKn6NxkrT5LJH40cLzE
         XqJT2BovIiB2cTzZh1KXzHkuITQ6tikJN6dsw4XxjCkoaTFGEDsBkZ2DXpmyguSNZHW4
         gS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=STG5NrpULfJInRmGsuGXzp35OWBDmr7G3Te8cinXhr4=;
        b=lMUTxMVK00diz+b4ZZ8TaHIpaA/aKm6EwQKAC6HmGS3tkkvJB5I4ktJ7W+OJCSsQX5
         BQrXTkIOaQm3fwEAm+UtedooWRhrj+LEoqyVCdqcSSvV29lCN0nPJNmptmGe/jfg+zOz
         D4/Bu7+4qkX+Ds7T57vXpJQ95UB2ST/guShXWeBsMjwsV31q40dAp4pcGlpVtVo9j4Mg
         VWvmvCuigPu+/RNuC+YFrd4zZKXeAdUjiXseZjJiqENRDnE291j3AKRIanzmF4t2/fRD
         FpuTbxjM26ajez8pUmBkol0+MYmMYEbnyKG0C3V+E2VyighuWUnmTpqSwz7AelkRPqXY
         DvPA==
X-Gm-Message-State: AOAM533k5wkull2smUavn08JGg9lEEATtHIQGnKbbiul3n0jwqJYbA3F
	X1UwLpawP1b0uAk6hj+PGx6+AIqS2Ze/4L13Lh5J0Z4otwc=
X-Google-Smtp-Source: ABdhPJx6U+yQot3kNzUOhYB9QkLUb3DHNNDmLaOSuAAIAeMZ1/eOuox1QL86khcTiT+i/XZbASkgpKJn+jqh/0ILRHQ=
X-Received: by 2002:a05:620a:bc5:: with SMTP id s5mr30929126qki.47.1632251119479;
 Tue, 21 Sep 2021 12:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210921170217.2977601-1-raj.khem@gmail.com> <CAAnfSTt-jHFt5+927ohyv4mSz5NtBhcAR-VqtAe8cP4zh+dGVw@mail.gmail.com>
In-Reply-To: <CAAnfSTt-jHFt5+927ohyv4mSz5NtBhcAR-VqtAe8cP4zh+dGVw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 21 Sep 2021 12:05:08 -0700
Message-ID: <CAMKF1so96B-gVjQ=BEJCio2mJJSZoo5kyyxCDyswgUVbJxhcMA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] riscv: Add configure cache entries for libidl
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000292e9105cc861446"

--000000000000292e9105cc861446
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 21, 2021 at 11:16 AM Ross Burton <ross@burtonini.com> wrote:

> libidl was removed long ago, along with ORBit.  Can we just drop these
> entirely?


Check layer index if it does not appear there then I am fine with dropping
it entirely

>
>
> Ross
>
> On Tue, 21 Sept 2021 at 18:02, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > These were hidden in meta-networking
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/site/riscv32-linux | 3 +++
> >  meta/site/riscv64-linux | 3 +++
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/meta/site/riscv32-linux b/meta/site/riscv32-linux
> > index 97de628e22..acc32fd03c 100644
> > --- a/meta/site/riscv32-linux
> > +++ b/meta/site/riscv32-linux
> > @@ -9,3 +9,6 @@ glib_cv_uscore=${glib_cv_uscore=no}
> >
> >  # startup-notification
> >  lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
> > +
> > +# libidl
> > +libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
> > diff --git a/meta/site/riscv64-linux b/meta/site/riscv64-linux
> > index 38bc5f044d..cf78133ee0 100644
> > --- a/meta/site/riscv64-linux
> > +++ b/meta/site/riscv64-linux
> > @@ -9,3 +9,6 @@ glib_cv_uscore=${glib_cv_uscore=no}
> >
> >  # startup-notification
> >  lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
> > +
> > +# libidl
> > +libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
> > --
> > 2.33.0
> >
> >
> > 
> >
>

--000000000000292e9105cc861446
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Sep 21, 2021 at 11:16 AM Ross Burton &lt;<a href=3D=
"mailto:ross@burtonini.com">ross@burtonini.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">libidl was removed long ago, along with ORBit.=
=C2=A0 Can we just drop these entirely?</blockquote><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Check layer index if it does not appear there then I=
 am fine with dropping it entirely=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
" dir=3D"auto"><br>
<br>
Ross<br>
<br>
On Tue, 21 Sept 2021 at 18:02, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; These were hidden in meta-networking<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/site/riscv32-linux | 3 +++<br>
&gt;=C2=A0 meta/site/riscv64-linux | 3 +++<br>
&gt;=C2=A0 2 files changed, 6 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/site/riscv32-linux b/meta/site/riscv32-linux<br>
&gt; index 97de628e22..acc32fd03c 100644<br>
&gt; --- a/meta/site/riscv32-linux<br>
&gt; +++ b/meta/site/riscv32-linux<br>
&gt; @@ -9,3 +9,6 @@ glib_cv_uscore=3D${glib_cv_uscore=3Dno}<br>
&gt;<br>
&gt;=C2=A0 # startup-notification<br>
&gt;=C2=A0 lf_cv_sane_realloc=3D${lf_cv_sane_realloc=3Dyes}<br>
&gt; +<br>
&gt; +# libidl<br>
&gt; +libIDL_cv_long_long_format=3D${libIDL_cv_long_long_format=3Dll}<br>
&gt; diff --git a/meta/site/riscv64-linux b/meta/site/riscv64-linux<br>
&gt; index 38bc5f044d..cf78133ee0 100644<br>
&gt; --- a/meta/site/riscv64-linux<br>
&gt; +++ b/meta/site/riscv64-linux<br>
&gt; @@ -9,3 +9,6 @@ glib_cv_uscore=3D${glib_cv_uscore=3Dno}<br>
&gt;<br>
&gt;=C2=A0 # startup-notification<br>
&gt;=C2=A0 lf_cv_sane_realloc=3D${lf_cv_sane_realloc=3Dyes}<br>
&gt; +<br>
&gt; +# libidl<br>
&gt; +libIDL_cv_long_long_format=3D${libIDL_cv_long_long_format=3Dll}<br>
&gt; --<br>
&gt; 2.33.0<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div></div>

--000000000000292e9105cc861446--
