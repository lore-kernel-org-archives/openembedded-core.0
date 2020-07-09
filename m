Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
 by mx.groups.io with SMTP id smtpd.web10.3019.1594261172909090326
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 19:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=yja++uae;
 spf=pass (domain: linaro.org, ip: 209.85.166.65, mailfrom: arthur.she@linaro.org)
Received: by mail-io1-f65.google.com with SMTP id a12so677859ion.13
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2020 19:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xN7FYLmzkQYHjNZdpgpS0XQTSnI2lz5PsxMpNypscJY=;
        b=yja++uaeQnW8pCFv+OFBFM61KDQ/IS4M8p6iJyXt/KMzRjjw3/A9nudDPWaZlHRkSZ
         2YASTH5x4rR2G8LIfSK9fmETnMfcvJmR9j+YYRzQ8Y0ZzaMBtKWZLCYGblpo4GtKHYQL
         Fek2YT3oVEpME909n4DMMmq2KfR8SHHUrRBSl5Seju9Iqbu/wMLrdygCiEj6+FN1d29/
         6B2L9OAVpsgHhJO8+IdNGxsX9ZRb+iptQ6EX+Ma9g3p+iTLJfNaN72qqR0h+wALcRXnI
         7O2geKwi18deFdz8Vh3vwcOv5+On7d6mVaw3qkGMV/EgDVPxGJPQ/4gPmC3w98Uo8cXV
         ST5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xN7FYLmzkQYHjNZdpgpS0XQTSnI2lz5PsxMpNypscJY=;
        b=py/2CX/qA5oTWfddQwDxHJLym0WhgcauDJNm74X5sCr2R4+do0OULu+GRGcVvVMo0F
         MB8FTz4qp3iB7lb5oCvR4RC5uqXtC0VDhlepJG0dEgcboYAD95Zx0QTTxncyfr46Awy0
         wdZwLIR8PusurerjycVrgUCdWiecFpP2fK5Jx8ax0lGrxu9H8fsyFQLmTldHVU7x6ltE
         rVyFGgmG7srygdlp6cdtsgopmyFL8ZCtmdrcAYCjw/cQ1kSNO9KODdlxQIUGFqLLgUNz
         7HGZVukyhXJ52KK7k/CaOf+tpQH7DjMwRtHSgkiUVSjZ9OdbiWWZu6IfufbHH5PEfyaf
         37Sg==
X-Gm-Message-State: AOAM533DCjNOOqp3gW7rrbcpEbW5/+GD2x+TpkKlz/EUgcO44kd2I4gU
	XtkhSv4lv/Oo8FmFCqzQfgeHmepVlIXVLpJy6hP5Cg==
X-Google-Smtp-Source: ABdhPJxGKj0/GjOBXnJUFo0cT6yN8+sCXU/0gSdp/yv+vCoJdecK0lRtGmY10kwOUO5rL8Iixw1vcVlG1qjlJujU0ms=
X-Received: by 2002:a6b:7610:: with SMTP id g16mr35222459iom.115.1594261172316;
 Wed, 08 Jul 2020 19:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200707210917.231615-1-arthur.she@linaro.org>
 <511a56908795531f547003a26af933a02c711583.camel@intel.com>
 <CAJ8hLzGd7Yvxz6=56FSLXs3VMpX4vr5gcY3WwwVrYBzEuka0hA@mail.gmail.com> <3b9022a2bc437d6df7d2adecd951bc4988af9d32.camel@intel.com>
In-Reply-To: <3b9022a2bc437d6df7d2adecd951bc4988af9d32.camel@intel.com>
From: "Arthur She" <arthur.she@linaro.org>
Date: Wed, 8 Jul 2020 19:19:21 -0700
Message-ID: <CAJ8hLzFfWWZmGSjZCChUSLzTdp+kzSE91EREp6kNSn_c+S+ZXQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] igt-gpu-tools: Add PACKAGECONFIG for Chamelium support
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000db027505a9f8da7b"

--000000000000db027505a9f8da7b
Content-Type: text/plain; charset="UTF-8"

Hi Anuj,
Thanks for your explanation.
I've sent patch v2 out.

Thanks,
Arthur

On Wed, Jul 8, 2020 at 6:29 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:

> On Tue, 2020-07-07 at 18:01 -0700, Arthur She wrote:
> > Hi Anuj,
> > Thanks for your review.
> > I don't need to put "-Dchamelium=disabled" in the EXTRA_OEMESON.
> > Because chamelium is disabled by default.
> > Is it correct?
>
> Yes, since it's disabled by default, -Dchamelium=disabled is already
> being passed to EXTRA_OEMESON.
>
> In this change, if you add chamelium to PACKAGECONFIG, it will pass
> both -Dchamelium=enabled and -Dchamelium=disabled to EXTRA_OEMESON
> which is incorrect. It probably works for you because PACKAGECONFIG
> arguments are added last ...
>
> Thanks,
>
> Anuj
>
> >
> > Thanks,
> > Arthur
> >
> > On Tue, Jul 7, 2020 at 4:43 PM Mittal, Anuj <anuj.mittal@intel.com>
> > wrote:
> > > On Tue, 2020-07-07 at 14:09 -0700, Arthur She wrote:
> > > > Chamelium is a hardware device that can be used for external
> > > display
> > > > test automation [1].
> > > > It is disabled by default and can be turned on through
> > > PACKAGECONFIG.
> > > >
> > > > [1] https://www.chromium.org/chromium-os/testing/chamelium
> > > >
> > > > Signed-off-by: Arthur She <arthur.she@linaro.org>
> > > > ---
> > > >  meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb | 4
> > > +++-
> > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-
> > > tools_git.bb
> > > > b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> > > > index f60880c292..29031e64dc 100644
> > > > --- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> > > > +++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> > > > @@ -20,7 +20,9 @@ RDEPENDS_${PN}-tests += "bash"
> > > >
> > > >  PACKAGE_BEFORE_PN = "${PN}-benchmarks ${PN}-tests"
> > > >
> > > > -EXTRA_OEMESON = "-Ddocs=disabled -Drunner=enabled"
> > > > +PACKAGECONFIG[chamelium] = "-Dchamelium=enabled,-
> > > > Dchamelium=disabled,gsl xmlrpc-c"
> > > > +
> > > > +EXTRA_OEMESON = "-Ddocs=disabled -Drunner=enabled
> > > > -Dchamelium=disabled"
> > >
> > > This is disabling chamelium even if it's enabled using
> > > PACKAGECONFIG.
> > >
> > > Thanks,
> > >
> > > Anuj
>

--000000000000db027505a9f8da7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Anuj,<div>Thanks for your explanation.</div><div>I&#39;=
ve sent patch v2 out.</div><div><br></div><div>Thanks,</div><div>Arthur</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Wed, Jul 8, 2020 at 6:29 PM Mittal, Anuj &lt;<a href=3D"mailto:anuj.mi=
ttal@intel.com">anuj.mittal@intel.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On Tue, 2020-07-07 at 18:01 -0700, Art=
hur She wrote:<br>
&gt; Hi Anuj,<br>
&gt; Thanks for your review.<br>
&gt; I don&#39;t need to put &quot;-Dchamelium=3Ddisabled&quot; in the EXTR=
A_OEMESON.<br>
&gt; Because chamelium is disabled by default.<br>
&gt; Is it correct?<br>
<br>
Yes, since it&#39;s disabled by default, -Dchamelium=3Ddisabled is already<=
br>
being passed to EXTRA_OEMESON.<br>
<br>
In this change, if you add chamelium to PACKAGECONFIG, it will pass<br>
both -Dchamelium=3Denabled and -Dchamelium=3Ddisabled to EXTRA_OEMESON<br>
which is incorrect. It probably works for you because PACKAGECONFIG<br>
arguments are added last ...<br>
<br>
Thanks,<br>
<br>
Anuj<br>
<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Arthur<br>
&gt; <br>
&gt; On Tue, Jul 7, 2020 at 4:43 PM Mittal, Anuj &lt;<a href=3D"mailto:anuj=
.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt; On Tue, 2020-07-07 at 14:09 -0700, Arthur She wrote:<br>
&gt; &gt; &gt; Chamelium is a hardware device that can be used for external=
<br>
&gt; &gt; display<br>
&gt; &gt; &gt; test automation [1].<br>
&gt; &gt; &gt; It is disabled by default and can be turned on through<br>
&gt; &gt; PACKAGECONFIG.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; [1] <a href=3D"https://www.chromium.org/chromium-os/testing/=
chamelium" rel=3D"noreferrer" target=3D"_blank">https://www.chromium.org/ch=
romium-os/testing/chamelium</a><br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Arthur She &lt;<a href=3D"mailto:arthur.she@l=
inaro.org" target=3D"_blank">arthur.she@linaro.org</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 meta/recipes-graphics/igt-gpu-tools/<a href=3D"http://=
igt-gpu-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">igt-gpu-tools_gi=
t.bb</a> | 4<br>
&gt; &gt; +++-<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-<br=
>
&gt; &gt; <a href=3D"http://tools_git.bb" rel=3D"noreferrer" target=3D"_bla=
nk">tools_git.bb</a> <br>
&gt; &gt; &gt; b/meta/recipes-graphics/igt-gpu-tools/<a href=3D"http://igt-=
gpu-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">igt-gpu-tools_git.bb=
</a><br>
&gt; &gt; &gt; index f60880c292..29031e64dc 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-graphics/igt-gpu-tools/<a href=3D"http://=
igt-gpu-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">igt-gpu-tools_gi=
t.bb</a><br>
&gt; &gt; &gt; +++ b/meta/recipes-graphics/igt-gpu-tools/<a href=3D"http://=
igt-gpu-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">igt-gpu-tools_gi=
t.bb</a><br>
&gt; &gt; &gt; @@ -20,7 +20,9 @@ RDEPENDS_${PN}-tests +=3D &quot;bash&quot;=
<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 PACKAGE_BEFORE_PN =3D &quot;${PN}-benchmarks ${PN}-tes=
ts&quot;<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; -EXTRA_OEMESON =3D &quot;-Ddocs=3Ddisabled -Drunner=3Denable=
d&quot;<br>
&gt; &gt; &gt; +PACKAGECONFIG[chamelium] =3D &quot;-Dchamelium=3Denabled,-<=
br>
&gt; &gt; &gt; Dchamelium=3Ddisabled,gsl xmlrpc-c&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +EXTRA_OEMESON =3D &quot;-Ddocs=3Ddisabled -Drunner=3Denable=
d<br>
&gt; &gt; &gt; -Dchamelium=3Ddisabled&quot;<br>
&gt; &gt; <br>
&gt; &gt; This is disabling chamelium even if it&#39;s enabled using<br>
&gt; &gt; PACKAGECONFIG.<br>
&gt; &gt; <br>
&gt; &gt; Thanks,<br>
&gt; &gt; <br>
&gt; &gt; Anuj<br>
</blockquote></div>

--000000000000db027505a9f8da7b--
