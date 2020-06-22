Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web10.18890.1592837305932955763
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 07:48:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nKNLMysY;
 spf=pass (domain: linaro.org, ip: 209.85.166.169, mailfrom: arthur.she@linaro.org)
Received: by mail-il1-f169.google.com with SMTP id z2so16132471ilq.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 07:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9hgkRCNUOk3NzQ/BFEBnfSR9vvGIm6rUligpV3kD2bE=;
        b=nKNLMysYGRISGUN7SwYV8cFQ8etX3kWVLIYdG2N6lOZc5rUwn41MTy5BlI5NU6XQ5I
         P/ZJf705ePaAjpsEktatoOAbVzrn0rN7GKv7PfbjCOoLAGyEd+DhKhvY+YyzSNG/2V6p
         FbshnbtTszz2W7j3u1WEKAtGHT0cqpsjJ4kzGSJUhnqhi06mSCxsjXOii3QDwffh46HS
         EMXP8EO5UBL/QCaNjGsZRXfYTKj2EptxSaTq0AVxvQakiHu/XLGyj+1dt3lbxbJYYrpp
         Mj5Gxvq73zSK/7z4NfiySOvS7eR0MLagSU94iJ00v27bl1SkIAVcUaopCtG/K1f4zywQ
         H5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9hgkRCNUOk3NzQ/BFEBnfSR9vvGIm6rUligpV3kD2bE=;
        b=lgfrY3ihg07khQKM0vzKONBXYFMz1mq1XhNOJPxNP/N19bJCARMCo5xTjz9tTVRkZS
         Yak16DyiImNKsKTXTb7Slvfz5XvemFqXgSxu7b0GTc60DL6PW34PHLlCneieOiG+trJA
         D8RuiXuChrNMouD6oJWvgipmAB4EzVAqHFgaXLSyGS0o4/qn8uilg5eAXjZ8BtZkolqk
         wXVBBwMeaCmdJbZk3UE5MzNE1PkpBUJGJ+EhzpBj0mNi+cY+mD4u2pJs7uGV3NsSILkR
         kkFDR9v+23Chq5jseIRt+0JTwVHB0PZJWk3l53geege2g0urIRATYWdlm6tgf+ifaQ6+
         Ibeg==
X-Gm-Message-State: AOAM532HC1KHqilXkWDOYYqoP0m7cqc1QfzBOOdvubdSMntpZ86mN1Oa
	axpNOZDv52c1T9lFyyCanKToxvk5ipkcH5lXQdaeag==
X-Google-Smtp-Source: ABdhPJxMNL0qcftJCTcgI6lu5M0UztqHYvlGYL5ZeTM4nnKp4uznvV2w78gOjcfNAHK+Ociwml6jwNStj8+mJSDnep8=
X-Received: by 2002:a05:6e02:dc5:: with SMTP id l5mr17156793ilj.216.1592837305229;
 Mon, 22 Jun 2020 07:48:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200619180922.57663-1-arthur.she@linaro.org> <386362e4937341d265b2e10d87dc472eb2e4f7fa.camel@linuxfoundation.org>
 <29c3a83a8625e9f8fff5c758adc3e5d46589e8b4.camel@intel.com>
In-Reply-To: <29c3a83a8625e9f8fff5c758adc3e5d46589e8b4.camel@intel.com>
From: "Arthur She" <arthur.she@linaro.org>
Date: Mon, 22 Jun 2020 07:48:14 -0700
Message-ID: <CAJ8hLzGS6s9N-DMBZafm_JynGJsbZOSRLV8tSGY56bL_anmTHg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3] igt-gpu-tools: add new package
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c37e1705a8ad55e9"

--000000000000c37e1705a8ad55e9
Content-Type: text/plain; charset="UTF-8"

Hi Anuj,
I did a test build.
These two packages were needed by chamelium.
I'll disable chamelium and resend the patch.

Thanks,

Arthur

On Sun, Jun 21, 2020 at 5:07 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:

> Hi Arthur,
>
> On Fri, 2020-06-19 at 23:14 +0100, Richard Purdie wrote:
> > On Fri, 2020-06-19 at 11:09 -0700, Arthur She wrote:
> > > igt-gpu-tools is a collection of tools for development and testing
> > > of
> > > the DRM
> > > drivers. (https://gitlab.freedesktop.org/drm/igt-gpu-tools)
> > > This recipe is originally copied from meta-intel and added the
> > > following
> > > modifications
> > > 1. Enable ARM architecture
> > > 2. Enable igt-runner and Chamelium
> > > 3. Build git HEAD code instead of a specific version
> > > The original recipe in the meta-intel will be removed and replaced
> > > by
> > > this one to avoid having a duplicate recipe.
> > > It is applicable to be submitted to oe-core, because it provides
> > > a core validation functionality that is needed by all providing DRM
> > > drivers and not just to a single arch.
> > >
> > > Signed-off-by: Arthur She <arthur.she@linaro.org>
> >
> > Looks like it has a number of dependencies not in OE-Core?
> >
> > WARNING: Nothing PROVIDES 'xmlrpc-c' (but /home/pokybuild/yocto-
> > worker/a-full/build/meta/recipes-graphics/igt-gpu-tools/igt-gpu-
> > tools_git.bb DEPENDS on or otherwise requires it)
> > WARNING: Nothing PROVIDES 'gsl' (but /home/pokybuild/yocto-worker/a-
> > full/build/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> > DEPENDS on or otherwise requires it)
> >
>
> xmlrpc-c and gsl are optional dependencies and looks like are only
> needed for chamelium. Could you please turn the option
> chamelium=enabled into a PACKAGECONFIG and turn that off by default?
>
> Thanks,
>
> Anuj
>

--000000000000c37e1705a8ad55e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Anuj,<div>I did a test build.</div><div>These two packa=
ges were needed by chamelium.</div><div>I&#39;ll disable chamelium and rese=
nd the patch.</div><div><br></div><div>Thanks,</div><div><br></div><div>Art=
hur</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Sun, Jun 21, 2020 at 5:07 PM Mittal, Anuj &lt;<a href=3D"mailto=
:anuj.mittal@intel.com">anuj.mittal@intel.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Hi Arthur,<br>
<br>
On Fri, 2020-06-19 at 23:14 +0100, Richard Purdie wrote:<br>
&gt; On Fri, 2020-06-19 at 11:09 -0700, Arthur She wrote:<br>
&gt; &gt; igt-gpu-tools is a collection of tools for development and testin=
g<br>
&gt; &gt; of<br>
&gt; &gt; the DRM<br>
&gt; &gt; drivers. (<a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-t=
ools" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/d=
rm/igt-gpu-tools</a>)<br>
&gt; &gt; This recipe is originally copied from meta-intel and added the<br=
>
&gt; &gt; following<br>
&gt; &gt; modifications<br>
&gt; &gt; 1. Enable ARM architecture<br>
&gt; &gt; 2. Enable igt-runner and Chamelium<br>
&gt; &gt; 3. Build git HEAD code instead of a specific version<br>
&gt; &gt; The original recipe in the meta-intel will be removed and replace=
d<br>
&gt; &gt; by<br>
&gt; &gt; this one to avoid having a duplicate recipe.<br>
&gt; &gt; It is applicable to be submitted to oe-core, because it provides<=
br>
&gt; &gt; a core validation functionality that is needed by all providing D=
RM<br>
&gt; &gt; drivers and not just to a single arch.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Arthur She &lt;<a href=3D"mailto:arthur.she@linaro=
.org" target=3D"_blank">arthur.she@linaro.org</a>&gt;<br>
&gt; <br>
&gt; Looks like it has a number of dependencies not in OE-Core?<br>
&gt; <br>
&gt; WARNING: Nothing PROVIDES &#39;xmlrpc-c&#39; (but /home/pokybuild/yoct=
o-<br>
&gt; worker/a-full/build/meta/recipes-graphics/igt-gpu-tools/igt-gpu-<br>
&gt; <a href=3D"http://tools_git.bb" rel=3D"noreferrer" target=3D"_blank">t=
ools_git.bb</a> DEPENDS on or otherwise requires it)<br>
&gt; WARNING: Nothing PROVIDES &#39;gsl&#39; (but /home/pokybuild/yocto-wor=
ker/a-<br>
&gt; full/build/meta/recipes-graphics/igt-gpu-tools/<a href=3D"http://igt-g=
pu-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">igt-gpu-tools_git.bb<=
/a><br>
&gt; DEPENDS on or otherwise requires it)<br>
&gt; <br>
<br>
xmlrpc-c and gsl are optional dependencies and looks like are only<br>
needed for chamelium. Could you please turn the option<br>
chamelium=3Denabled into a PACKAGECONFIG and turn that off by default?<br>
<br>
Thanks,<br>
<br>
Anuj<br>
</blockquote></div>

--000000000000c37e1705a8ad55e9--
