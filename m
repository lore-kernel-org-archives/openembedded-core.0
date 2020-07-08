Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web10.1493.1594170122494336345
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2020 18:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WjhhXkZP;
 spf=pass (domain: linaro.org, ip: 209.85.166.67, mailfrom: arthur.she@linaro.org)
Received: by mail-io1-f67.google.com with SMTP id f23so45272859iof.6
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2020 18:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AhGMWH3EQyNXLhjgCjiQsMIza338oUhePGXbG6F7XSE=;
        b=WjhhXkZP4zS4NflXKT3rwEd81+WddQYXj795GlmAQiJ9+F4wKwitfJX7HkL40j3+Tt
         kXeTCdZVnyexciOa8uPNQUy6jtkO9f/UYzx2+ZCvFKwwHlYnlg3P3ZOkqPTi18X7tBmU
         wv0c5jW+z18X20FWjgrkBDfWh0pJQakpusmjQFDDiFiuWxWWsIsrNa43VMVwJce/XLYr
         rWXgQo3iG6tEPJ5yE2dscxvDPoDHIACRaB8puz/itAY453Czr0fB2OewxwXFEaSbLVpB
         ySuLbb0+125NnFlZCbpYig0kftWTkLMzt932zUwNGA/BNqtJa4T+x9w73zKMcckIgPVG
         s0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AhGMWH3EQyNXLhjgCjiQsMIza338oUhePGXbG6F7XSE=;
        b=e3iOWJFmCPT+jIs31baSh43QMEpcDD8y9ZWB72UEg7XmugJi1TTItsClaIB7ed1lUn
         SglmQkQkTrhdkqmV7v0ziDkQ1RaK+CK3xGhdvbtCho5HKEFJyC3agRC46d2V6cS3dprw
         mL9hZsMIk9S35JykWlSMy0r7xZ+B/9zzNggZQeXEupE5Fxpe8E53+P6T9wDxFVgt1YXe
         /p0yxr+Y4ayW7bZxQnF5rlALnTpZLol2eddsc2Bzp+5hXvgdv+Fk+agaSB+nu1MwYT9x
         TMqJ0LEbot8vpROWfaDuJ+UZYzvOnnMsJjendr8LqnX9scGLNcpQasV5HJ7BgzSvSXoT
         9waA==
X-Gm-Message-State: AOAM532+XbC1XShgB8THC637xtNJrXWtRhoQxHVU3f34485LGe6lbafR
	DIvWcrCdkQnjwi2VyOUuslZPuxUrhc+ZSF/orPuiGdWV4e72eQ==
X-Google-Smtp-Source: ABdhPJzonzwbg8HhSv0bIIbJ78RtTBlvOQoI8tNS5nUZ6kKpgmQOHCjVREwOO2wEM6vaLTEBCwQj+/yGkLv3kwAhKas=
X-Received: by 2002:a02:a797:: with SMTP id e23mr35529217jaj.81.1594170121791;
 Tue, 07 Jul 2020 18:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200707210917.231615-1-arthur.she@linaro.org> <511a56908795531f547003a26af933a02c711583.camel@intel.com>
In-Reply-To: <511a56908795531f547003a26af933a02c711583.camel@intel.com>
From: "Arthur She" <arthur.she@linaro.org>
Date: Tue, 7 Jul 2020 18:01:50 -0700
Message-ID: <CAJ8hLzGd7Yvxz6=56FSLXs3VMpX4vr5gcY3WwwVrYBzEuka0hA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] igt-gpu-tools: Add PACKAGECONFIG for Chamelium support
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d2412a05a9e3a796"

--000000000000d2412a05a9e3a796
Content-Type: text/plain; charset="UTF-8"

Hi Anuj,
Thanks for your review.
I don't need to put "-Dchamelium=disabled" in the EXTRA_OEMESON.
Because chamelium is disabled by default.
Is it correct?

Thanks,
Arthur

On Tue, Jul 7, 2020 at 4:43 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:

> On Tue, 2020-07-07 at 14:09 -0700, Arthur She wrote:
> > Chamelium is a hardware device that can be used for external display
> > test automation [1].
> > It is disabled by default and can be turned on through PACKAGECONFIG.
> >
> > [1] https://www.chromium.org/chromium-os/testing/chamelium
> >
> > Signed-off-by: Arthur She <arthur.she@linaro.org>
> > ---
> >  meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> > b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> > index f60880c292..29031e64dc 100644
> > --- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> > +++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> > @@ -20,7 +20,9 @@ RDEPENDS_${PN}-tests += "bash"
> >
> >  PACKAGE_BEFORE_PN = "${PN}-benchmarks ${PN}-tests"
> >
> > -EXTRA_OEMESON = "-Ddocs=disabled -Drunner=enabled"
> > +PACKAGECONFIG[chamelium] = "-Dchamelium=enabled,-
> > Dchamelium=disabled,gsl xmlrpc-c"
> > +
> > +EXTRA_OEMESON = "-Ddocs=disabled -Drunner=enabled
> > -Dchamelium=disabled"
>
> This is disabling chamelium even if it's enabled using PACKAGECONFIG.
>
> Thanks,
>
> Anuj
>

--000000000000d2412a05a9e3a796
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Anuj,<div>Thanks for your review.</div><div>I don&#39;t=
 need to put &quot;-Dchamelium=3Ddisabled&quot; in the EXTRA_OEMESON.</div>=
<div>Because chamelium is disabled by default.</div><div>Is it correct?</di=
v><div><br></div><div>Thanks,</div><div>Arthur</div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 7, 2020 at =
4:43 PM Mittal, Anuj &lt;<a href=3D"mailto:anuj.mittal@intel.com">anuj.mitt=
al@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Tue, 2020-07-07 at 14:09 -0700, Arthur She wrote:<br>
&gt; Chamelium is a hardware device that can be used for external display<b=
r>
&gt; test automation [1].<br>
&gt; It is disabled by default and can be turned on through PACKAGECONFIG.<=
br>
&gt; <br>
&gt; [1] <a href=3D"https://www.chromium.org/chromium-os/testing/chamelium"=
 rel=3D"noreferrer" target=3D"_blank">https://www.chromium.org/chromium-os/=
testing/chamelium</a><br>
&gt; <br>
&gt; Signed-off-by: Arthur She &lt;<a href=3D"mailto:arthur.she@linaro.org"=
 target=3D"_blank">arthur.she@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-graphics/igt-gpu-tools/<a href=3D"http://igt-gpu-to=
ols_git.bb" rel=3D"noreferrer" target=3D"_blank">igt-gpu-tools_git.bb</a> |=
 4 +++-<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-graphics/igt-gpu-tools/<a href=3D"http://igt=
-gpu-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">igt-gpu-tools_git.b=
b</a> <br>
&gt; b/meta/recipes-graphics/igt-gpu-tools/<a href=3D"http://igt-gpu-tools_=
git.bb" rel=3D"noreferrer" target=3D"_blank">igt-gpu-tools_git.bb</a><br>
&gt; index f60880c292..29031e64dc 100644<br>
&gt; --- a/meta/recipes-graphics/igt-gpu-tools/<a href=3D"http://igt-gpu-to=
ols_git.bb" rel=3D"noreferrer" target=3D"_blank">igt-gpu-tools_git.bb</a><b=
r>
&gt; +++ b/meta/recipes-graphics/igt-gpu-tools/<a href=3D"http://igt-gpu-to=
ols_git.bb" rel=3D"noreferrer" target=3D"_blank">igt-gpu-tools_git.bb</a><b=
r>
&gt; @@ -20,7 +20,9 @@ RDEPENDS_${PN}-tests +=3D &quot;bash&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PACKAGE_BEFORE_PN =3D &quot;${PN}-benchmarks ${PN}-tests&quot;<b=
r>
&gt;=C2=A0 <br>
&gt; -EXTRA_OEMESON =3D &quot;-Ddocs=3Ddisabled -Drunner=3Denabled&quot;<br=
>
&gt; +PACKAGECONFIG[chamelium] =3D &quot;-Dchamelium=3Denabled,-<br>
&gt; Dchamelium=3Ddisabled,gsl xmlrpc-c&quot;<br>
&gt; +<br>
&gt; +EXTRA_OEMESON =3D &quot;-Ddocs=3Ddisabled -Drunner=3Denabled<br>
&gt; -Dchamelium=3Ddisabled&quot;<br>
<br>
This is disabling chamelium even if it&#39;s enabled using PACKAGECONFIG.<b=
r>
<br>
Thanks,<br>
<br>
Anuj<br>
</blockquote></div>

--000000000000d2412a05a9e3a796--
