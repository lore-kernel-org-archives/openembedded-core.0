Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web09.427.1620252919213844530
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 15:15:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XI5yXa98;
 spf=pass (domain: gmail.com, ip: 209.85.222.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id x9so1078018uao.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 15:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lt/cbNGZOUujvfOGwwkvRDjN8bCUTybFaor3ynXqTmM=;
        b=XI5yXa98dxFZFV7JLtYdvr1b3R0j/SBzyZPpM7TfU+zDFdB1ybHoUoNUpQiPFgFEEm
         AN+eFb0qi3kpOSZPQRCXKkeLnw6gZFoSdtP2C5CwfIP6Zd69ny7Jd6ZNJ8KpqBZjqYu4
         ycJELPZdI5ZcfUVU7uCmG468XKWzLDR+9l8g7mO5Z8RbiK7rf1yESugSyON+RR7z3WMU
         EmX9juBu6djZ67YWWNacjqk0gtBLlUmFn4e+phGJW3gSlPABr2Tm3jrfyVlJvzP5C2k6
         8J1EHHUSaz249ORp53qABkNhWzgfNenDDOFVVh1pYIS1xUTTj8tlCoytkcF/4egnr/J8
         1SKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lt/cbNGZOUujvfOGwwkvRDjN8bCUTybFaor3ynXqTmM=;
        b=RphY4DhzMq+YUV8VNwj9KuD04niiB/UkSL2Ay1Z4HVfbx/vtH4rZnyrXulfyILBIFc
         WHJBOuGmy93d3fXN6jCBeZobZEl6hicnX7NA5rJicS5ZJRceVvdtqWG+7KZDZgGcoE3X
         kExJpeI/cAAAmDqN9DONC8AmgoQ/ZD1i2SRUswX9BneVYC33BY8X5wZdtwJdhHHnFfN7
         ZwAC7unSdR4kKAvkdM3VuS7MKAY8fZDC7nT/jS3lQFN4rmu2REBcnQPfsytSPoMLXW5e
         m6HPqw38DY/fCMSWj1vNMw5pz/Lk4dtg3qeO+yU3hlanog72hsfmWo9P5u+brVlGBbY/
         8ZQg==
X-Gm-Message-State: AOAM5316Mn9/qs03EgZuZCmB6UkRM9pC2+e+FJX3cYknJdJ6JDI9Knue
	W+B/dEv3gTm0ABax/hH/D52Dy6j1dlqwe6YCTfQ=
X-Google-Smtp-Source: ABdhPJznitKWkgC4jYwpo5uqe8X0Q03YUVkcZTYw+UJKwogtw/s0OwUR4oVbcSc1nxi1IvDS5+9T8cMgBpmk73TLpHw=
X-Received: by 2002:ab0:77c1:: with SMTP id y1mr1266680uar.89.1620252918106;
 Wed, 05 May 2021 15:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-58-alex.kanavin@gmail.com> <CAMKF1spEqemKRZAwWnDMupsSmk7rteUef6P1HbmC0-KtsOjO_w@mail.gmail.com>
 <CANNYZj9scBK7xAZpR1A3Fs9AiC8MT_EZHqszbGfiAkZSZgMYwg@mail.gmail.com>
 <443c94b6db48ae6b7daae10b529b8ea420be4add.camel@linuxfoundation.org>
 <CAMKF1so4BWNatThY_tixepiRUvzH=kfE7_4BWHroj4RnzSVQyA@mail.gmail.com>
 <0dc03ad24ae6700f7757b6afca84c37758759d29.camel@linuxfoundation.org> <CAMKF1spWRv+mhtzRti5vpn8ja94CgrJLnJ5sSt10VaX_AUhHbg@mail.gmail.com>
In-Reply-To: <CAMKF1spWRv+mhtzRti5vpn8ja94CgrJLnJ5sSt10VaX_AUhHbg@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 6 May 2021 00:15:06 +0200
Message-ID: <CANNYZj_s-ks+QZDA1DTN1dwwYeNt1LanenaFbYPp3FiWDkVuOw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 58/61] gi-docgen: add a recipe and class
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a14bbb05c19c8723"

--000000000000a14bbb05c19c8723
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 May 2021 at 00:07, Khem Raj <raj.khem@gmail.com> wrote:

>
> > Reading that disclaimer, it seems to be saying they're making it work
> for gtk.
> > We're using it in the gtk related components it is being developed for
> so I'm
> > not sure there is an issue. What it says not to do is use it for general
> non-gtk
> > code. We're not using it outside gtk?
>
> This above says
>
> GI-DocGen is still in development. The recommended use of GI-DocGen is
> to add it as a sub-project to your Meson build system, and vendor it
> when releasing dist archives.
>
> we are trying to use it in system mode and not vendored along with
> packages which need it. Perhaps I am misunderstanding?
>

The options are:
- do not update pango and gdk-pixbuf
- update them but drop api documentation support from them, as they no
longer support gtk-doc
- update them and enable gi-docgen for them, through a recipe that ensures
we have reproducibility and consistency in what version of gi-docgen is
being used across consumer recipes.

The gi-docgen recipe outputs would only be provided at build time into
their sysroots, and won't be used otherwise. It's been tested on the AB,
and it works.

I think you're inventing a problem here that does not actually exist.

Alex

--000000000000a14bbb05c19c8723
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 6 May 2021 at 00:07, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><br>
&gt; Reading that disclaimer, it seems to be saying they&#39;re making it w=
ork for gtk.<br>
&gt; We&#39;re using it in the gtk related components it is being developed=
 for so I&#39;m<br>
&gt; not sure there is an issue. What it says not to do is use it for gener=
al non-gtk<br>
&gt; code. We&#39;re not using it outside gtk?<br>
<br>
This above says<br>
<br>
GI-DocGen is still in development. The recommended use of GI-DocGen is<br>
to add it as a sub-project to your Meson build system, and vendor it<br>
when releasing dist archives.<br>
<br>
we are trying to use it in system mode and not vendored along with<br>
packages which need it. Perhaps I am misunderstanding?<br></blockquote><div=
><br></div><div>The options are:</div><div>- do not update pango and gdk-pi=
xbuf</div><div>- update them but drop api documentation support from them, =
as they no longer support gtk-doc</div><div>- update them and enable gi-doc=
gen for them, through a recipe that ensures we have reproducibility and con=
sistency in what version of gi-docgen is being used across consumer recipes=
.</div><div><br></div><div>The gi-docgen recipe outputs would only be provi=
ded at build time into their sysroots, and won&#39;t be used otherwise. It&=
#39;s been tested on the AB, and it works.<br></div><div><br></div><div>I t=
hink you&#39;re inventing a problem here that does not actually exist.<br><=
/div><div><br></div><div></div><div>Alex<br></div></div></div>

--000000000000a14bbb05c19c8723--
