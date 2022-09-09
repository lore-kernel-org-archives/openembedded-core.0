Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3483ECAAA1
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 23:20:07 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web09.58.1662765598678965340
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 16:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NPjwke84;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id
 p15-20020a056830130f00b006544f5228e3so2031307otq.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 16:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=tDBNwtXS9zeaEseV560e4zU21eWS/nmnyFqNKZB/ySY=;
        b=NPjwke84pD2Wu2p837z4GWCAZwTH/W0/2dswmDzxpvaudb4FQYuTscRgdLe/Tw04SI
         02RStXyYhmKMGoqX5jIyKSrM/XPDkl9uBGqpvrb7tZGfdFq3yBt7z4mPYEtApygPhpzj
         UEby7knKnqNURCrdfXMZRiYA+hKUKb/5JfBBu7x24IZk2jfokZiqofgWRHk9emSJ9abI
         6av2lElUFn019CbPC4GcUxri2J8dq3lRNQtpeTBgDpADqE0JKUg+L1A+ie8iwJk5AM0A
         7B1j/W3WzZv8pev1AT8EVM/ViEmofpgEGSu7LIIaG0RheoZXX3J0ezxwg/5rvcGhbIS4
         18Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=tDBNwtXS9zeaEseV560e4zU21eWS/nmnyFqNKZB/ySY=;
        b=ERB/8a4QViVHix/EnudOknVAidjUI3f83gv/vKqFw291m9hl3CqJheF12G31eXSHeV
         pj3/ZpKrFS8l/SseN21dWiFqOSszPatdPdx/2TqH45lOdOXmOSw4uckTyO1egrO6zj1N
         330XnFuvDDQx1Q2B2z+utQozck1Eu01Oj0M+SS8OXpnU2ISZKb05xxNox0PNmGKOeIRQ
         mJ8A9tY6H0ZsFwy5lcSLr4tGJarFX/FjoFz9ENl6/yAkyKQm5w1BpBaW7Pc37eH6OBf+
         Q4tWNiE+pRdZvv1iuInMARcOLJbW7NcnnrthVjJXM+wYCoOHJdons6YuNA1DfSXDJS+Z
         SlBQ==
X-Gm-Message-State: ACgBeo3bAxZfGzO/KNjM3B9JwS34niY1/pizeKgccZPQv2kwTrPFCKww
	h9t9YJ+IYG1A3nq7hgeyZUbVM9RSs9sKJwgyS/4=
X-Google-Smtp-Source: 
 AA6agR4PTLAC68GkjCYb9Qrdc9ZRbjdRtUBJGN/iJWW+llI4yCU1EvspEjI0JKlAOyOR4HfvXIHO7q4NOwDExIe8Fp0=
X-Received: by 2002:a05:6830:22e7:b0:637:3879:3d5e with SMTP id
 t7-20020a05683022e700b0063738793d5emr6366679otc.111.1662765597830; Fri, 09
 Sep 2022 16:19:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220909165204.12656-1-raj.khem@gmail.com>
 <CAJ86T=VFBpQku9_Kh52u8jveG7XHxXEEDEaLcs+toYFDopKGzg@mail.gmail.com>
In-Reply-To: 
 <CAJ86T=VFBpQku9_Kh52u8jveG7XHxXEEDEaLcs+toYFDopKGzg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Sep 2022 16:19:46 -0700
Message-ID: 
 <CAMKF1so7DE-86oMDrLMZGxOWKJZM9oChZY0r_w5Eo8VeY35C-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] bitbake.conf: Define TC_CXX_RUNTIME
To: Andre McCurdy <armccurdy@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cdb52b05e846c80f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 23:20:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170512

--000000000000cdb52b05e846c80f
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 9, 2022 at 12:51 PM Andre McCurdy <armccurdy@gmail.com> wrote:

> On Fri, Sep 9, 2022 at 9:52 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > This variable is used to denote the C/C++ compiler runtime to use.
> > Right now there are few alternatives out of the core which could
> > use this variable to define this property, the values it can take
> > are 'gnu' for gcc runtime. 'llvm' for using compiler-rt+libc++ and
> > 'android' to use android runtime. Default settings is to use gnu
> > which is current silent default also.
>
> Seems like you made a conscious decision to refer to the gcc runtime
> library as "gnu" instead of "gcc". What was the reasoning? Using "gcc"
> would seem to be clearer unless it clashes with some gcc upstream
> naming convention.


Good question. Historically to avoid confusion with recipe with same name
when llvm was not a recipe and runtime in clang world is outside the
compiler



>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Document the variable
> > v3: Rename to TC_CXX_RUNTIME
> >
> >  documentation/ref-manual/variables.rst | 6 ++++++
> >  meta/conf/bitbake.conf                 | 1 +
> >  2 files changed, 7 insertions(+)
> >
> > diff --git a/documentation/ref-manual/variables.rst
> b/documentation/ref-manual/variables.rst
> > index cf817e9540..2d28c3d2f7 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -7973,6 +7973,12 @@ system and gives an overview of their function
> and contents.
> >        toolchain. You can use ``meta-sourcery`` as a template for adding
> >        support for other external toolchains.
> >
> > +   :term:`TC_CXX_RUNTIME`
> > +      Specifies the C/C++ STL and runtime variant to use during
> > +      the build process. Default value is 'gnu'
> > +
> > +      You can select "gnu", "llvm", or "android".
> > +
> >     :term:`TEMPLATECONF`
> >        Specifies the directory used by the build system to find templates
> >        from which to build the ``bblayers.conf`` and ``local.conf``
> files.
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 52a36d788b..62cdd9aa9c 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -389,6 +389,7 @@ FILESYSTEM_PERMS_TABLES ?= "${@'files/fs-perms.txt'
> if oe.types.boolean(d.getVar
> >
> >  TCMODE ??= "default"
> >  TCLIBC ??= "glibc"
> > +TC_CXX_RUNTIME ??= "gnu"
> >  TMPDIR ?= "${TOPDIR}/tmp"
> >
> >  CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' +
> str(d.getVar('MACHINE'))][bool(d.getVar('MACHINE'))]}${@['', '/' +
> str(d.getVar('SDKMACHINE'))][bool(d.getVar('SDKMACHINE'))]}"
> > --
> > 2.37.3
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#170499):
> https://lists.openembedded.org/g/openembedded-core/message/170499
> > Mute This Topic: https://lists.openembedded.org/mt/93577585/3619030
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> armccurdy@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--000000000000cdb52b05e846c80f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Sep 9, 2022 at 12:51 PM Andre McCurdy &lt;<a href=
=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">On Fri, Sep 9, 2022 at 9:52 AM Khem Raj &lt=
;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com=
</a>&gt; wrote:<br>
&gt;<br>
&gt; This variable is used to denote the C/C++ compiler runtime to use.<br>
&gt; Right now there are few alternatives out of the core which could<br>
&gt; use this variable to define this property, the values it can take<br>
&gt; are &#39;gnu&#39; for gcc runtime. &#39;llvm&#39; for using compiler-r=
t+libc++ and<br>
&gt; &#39;android&#39; to use android runtime. Default settings is to use g=
nu<br>
&gt; which is current silent default also.<br>
<br>
Seems like you made a conscious decision to refer to the gcc runtime<br>
library as &quot;gnu&quot; instead of &quot;gcc&quot;. What was the reasoni=
ng? Using &quot;gcc&quot;<br>
would seem to be clearer unless it clashes with some gcc upstream<br>
naming convention.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto=
">Good question. Historically to avoid confusion with recipe with same name=
 when llvm was not a recipe and runtime in clang world is outside the compi=
ler=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; v2: Document the variable<br>
&gt; v3: Rename to TC_CXX_RUNTIME<br>
&gt;<br>
&gt;=C2=A0 documentation/ref-manual/variables.rst | 6 ++++++<br>
&gt;=C2=A0 meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 2 files changed, 7 insertions(+)<br>
&gt;<br>
&gt; diff --git a/documentation/ref-manual/variables.rst b/documentation/re=
f-manual/variables.rst<br>
&gt; index cf817e9540..2d28c3d2f7 100644<br>
&gt; --- a/documentation/ref-manual/variables.rst<br>
&gt; +++ b/documentation/ref-manual/variables.rst<br>
&gt; @@ -7973,6 +7973,12 @@ system and gives an overview of their function =
and contents.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 toolchain. You can use ``meta-sourcery`` as=
 a template for adding<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 support for other external toolchains.<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0:term:`TC_CXX_RUNTIME`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Specifies the C/C++ STL and runtime variant to u=
se during<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 the build process. Default value is &#39;gnu&#39=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 You can select &quot;gnu&quot;, &quot;llvm&quot;=
, or &quot;android&quot;.<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0:term:`TEMPLATECONF`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Specifies the directory used by the build s=
ystem to find templates<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 from which to build the ``bblayers.conf`` a=
nd ``local.conf`` files.<br>
&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; index 52a36d788b..62cdd9aa9c 100644<br>
&gt; --- a/meta/conf/bitbake.conf<br>
&gt; +++ b/meta/conf/bitbake.conf<br>
&gt; @@ -389,6 +389,7 @@ FILESYSTEM_PERMS_TABLES ?=3D &quot;${@&#39;files/f=
s-perms.txt&#39; if oe.types.boolean(d.getVar<br>
&gt;<br>
&gt;=C2=A0 TCMODE ??=3D &quot;default&quot;<br>
&gt;=C2=A0 TCLIBC ??=3D &quot;glibc&quot;<br>
&gt; +TC_CXX_RUNTIME ??=3D &quot;gnu&quot;<br>
&gt;=C2=A0 TMPDIR ?=3D &quot;${TOPDIR}/tmp&quot;<br>
&gt;<br>
&gt;=C2=A0 CACHE =3D &quot;${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@[&#39;&#39=
;, &#39;/&#39; + str(d.getVar(&#39;MACHINE&#39;))][bool(d.getVar(&#39;MACHI=
NE&#39;))]}${@[&#39;&#39;, &#39;/&#39; + str(d.getVar(&#39;SDKMACHINE&#39;)=
)][bool(d.getVar(&#39;SDKMACHINE&#39;))]}&quot;<br>
&gt; --<br>
&gt; 2.37.3<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#170499): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/170499" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/170499</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93577585=
/3619030" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/93577585/3619030</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:armccurdy@gmail.com" =
target=3D"_blank">armccurdy@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000cdb52b05e846c80f--

