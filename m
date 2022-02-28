Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 520ACC433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 02:49:32 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.16012.1646016571124554536
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Feb 2022 18:49:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L7eLQqFE;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id f18so7832058qtb.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Feb 2022 18:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V0YpeJ4kh8AibZs9IKSaxWJSswQQfwYIVyCsqT50NbE=;
        b=L7eLQqFE9/q50YOrNO1pnwyb88XTvK/QZRXpt5GyyIi7AHD1i1yqffJvncooTJU485
         dK3HtmRfFxJgHIQ3Ikh1G4h4outtGW7/ziykMYNnGBtSL10n/NeFHbzoZiTBkh2ecGFM
         zsgm3ndiIISCEVVf3irS0JpRg1t4J6XaHUaZkBIx8rZvoUVwRBHPGVn51pTODRjrQeQ7
         63OnI/3nCZgdfUfBI7CoXgSqzqQ1Yf4jWz3tx6Yw5INl4IYtH9nGgjRatE0ME9Hsq91t
         EUgmqGr2gUTTXRdsJLHaJ+lmR9UMJPKuitzAvNB/bO7+y5xQ/YupuzDB+F8g1Sjv4GmS
         vg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V0YpeJ4kh8AibZs9IKSaxWJSswQQfwYIVyCsqT50NbE=;
        b=lodX2VXwD8oDfjFoE66rpeuUxwYkhWydvPMXMyqwrIj/8NZhgTjbSDu5H+theJLPbh
         AfK2yW4LAUg1cKQiGbw5O0dazWoreYgr3/XnsVVuJcQ3ZvhYi0fXIDS4UyxrgAAKL8eA
         tiNeHx6CpXbELb+FLr1ALtB9GXce0qWOhNL6nKL+SXzt3iqENgB/G4J9kjYbJODtBc0o
         pVX2U5/Vo7xiCVp1Inw738uLjk7urB+BNoNkwOWibIO+30Q6LJzY3xK79rafva+ohLy1
         E/bo1dNsM6epi2lBG7bbwLTeXtKlTx9F+sXG+jf3EJ1tTsym02Y4ocaApqMnWv7oOUDt
         opEQ==
X-Gm-Message-State: AOAM5331VSSsPnvif5LSIANWVnRWevvru4CLrNy8VyjSIF3jmbGeiQzT
	Bb9y65E0qxPem64ZSUc6pbNeRraVTPAi2OJ8Qas=
X-Google-Smtp-Source: 
 ABdhPJymqLOmmxAM+BMdaweKFyOnj1jvQJWDghLCeJ6RLrl63d8Bd4L9/fYxuZPGWhgbS4CLhovVkgquVM1XoeqA3ng=
X-Received: by 2002:a05:622a:104c:b0:2de:377e:25d9 with SMTP id
 f12-20020a05622a104c00b002de377e25d9mr14859745qte.229.1646016570076; Sun, 27
 Feb 2022 18:49:30 -0800 (PST)
MIME-Version: 1.0
References: <20220226082142.119063-1-richard.purdie@linuxfoundation.org>
 <AM9PR09MB464226CEBC12C7654CE46946A8009@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB464226CEBC12C7654CE46946A8009@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Feb 2022 18:49:19 -0800
Message-ID: 
 <CAMKF1srKz5tnnOB+-VNUvRy3xNfGFCeCxoNmFZHibp7gCF_anA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pip_install_wheel: Use BPN instead of PN to
 construct PYPI_PACKAGE default
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Tim Orling <ticotimo@gmail.com>,
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f430ec05d90b18f6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 02:49:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162447

--000000000000f430ec05d90b18f6
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 27, 2022 at 2:30 AM Konrad Weihmann <kweihmann@outlook.com>
wrote:

> Some more observations when using the current state of the pip/wheels
> patch series (from today's master)
>
> - when using recipes that inherit setuptools (but not pypi) and do have
> a "python3-..." prefix in the recipe name - the name guessing fails. IMO
> it would be best to strip the "python3-" prefix in the guessing too
>
> - when using recipes that do not have a version matching *exactly* the
> one from setup.py|pyproject.toml the wheel glob `PYPA_WHEEL ??=
> "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-${PV}-*.whl"` fails
>   - examples:
>         - PV = "1.2.3+${SRCREV}" for recipes that have additional patches
> on it
>         - recipe name is python3-foo_git.bb
>
> In my opinion it doesn't make sense to have ${PV} in that glob - a
> simple asterisk would match all of them easily - or this there any real
> life example where a single python project builds several packages with
> different versions in the same workspace?


Right this would avoid overwriting this in many recipes agreed


>
> - another thing is SETUPTOOLS_INSTALL_ARGS ?= "--root=${D}
> --prefix=${prefix}" breaks a recipe that was previously installing files
> to "/etc" aka ${sysconfdir} - these are now installed into /usr/etc,
> which doesn't look right. For reference the project is
> https://github.com/HewlettPackard/reconbf
>
> In a sense of a more painless transition these issues should be
> addressed before any release
>
> On 26.02.22 09:21, Richard Purdie wrote:
> > This fixes the name for native and nativesdk recipes.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >   meta/classes/pip_install_wheel.bbclass | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/pip_install_wheel.bbclass
> b/meta/classes/pip_install_wheel.bbclass
> > index 9f9feda6ee0..5b7e5cd7064 100644
> > --- a/meta/classes/pip_install_wheel.bbclass
> > +++ b/meta/classes/pip_install_wheel.bbclass
> > @@ -2,7 +2,7 @@ DEPENDS:append = " python3-pip-native"
> >
> >   def guess_pip_install_package_name(d):
> >       '''https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode'
> ''
> > -    return (d.getVar('PYPI_PACKAGE') or d.getVar('PN')).replace('-',
> '_')
> > +    return (d.getVar('PYPI_PACKAGE') or d.getVar('BPN')).replace('-',
> '_')
> >
> >   PIP_INSTALL_PACKAGE ?= "${@guess_pip_install_package_name(d)}"
> >   PIP_INSTALL_DIST_PATH ?= "${B}/dist"
> >
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162432):
> https://lists.openembedded.org/g/openembedded-core/message/162432
> Mute This Topic: https://lists.openembedded.org/mt/89406689/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000f430ec05d90b18f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Feb 27, 2022 at 2:30 AM Konrad Weihmann &lt;<a href=
=3D"mailto:kweihmann@outlook.com">kweihmann@outlook.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-co=
lor:rgb(204,204,204)">Some more observations when using the current state o=
f the pip/wheels <br>
patch series (from today&#39;s master)<br>
<br>
- when using recipes that inherit setuptools (but not pypi) and do have <br=
>
a &quot;python3-...&quot; prefix in the recipe name - the name guessing fai=
ls. IMO <br>
it would be best to strip the &quot;python3-&quot; prefix in the guessing t=
oo<br>
<br>
- when using recipes that do not have a version matching *exactly* the <br>
one from setup.py|pyproject.toml the wheel glob `PYPA_WHEEL ??=3D <br>
&quot;${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-${PV}-*.whl&quot;` fa=
ils<br>
=C2=A0 - examples:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - PV =3D &quot;1.2.3+${SRCREV}&quot; for recipe=
s that have additional patches on it<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - recipe name is <a href=3D"http://python3-foo_=
git.bb" rel=3D"noreferrer" target=3D"_blank">python3-foo_git.bb</a><br>
<br>
In my opinion it doesn&#39;t make sense to have ${PV} in that glob - a <br>
simple asterisk would match all of them easily - or this there any real <br=
>
life example where a single python project builds several packages with <br=
>
different versions in the same workspace?</blockquote><div dir=3D"auto"><br=
></div><div dir=3D"auto">Right this would avoid overwriting this in many re=
cipes agreed=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-l=
eft-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D=
"auto"><br>
<br>
- another thing is SETUPTOOLS_INSTALL_ARGS ?=3D &quot;--root=3D${D} <br>
--prefix=3D${prefix}&quot; breaks a recipe that was previously installing f=
iles <br>
to &quot;/etc&quot; aka ${sysconfdir} - these are now installed into /usr/e=
tc, <br>
which doesn&#39;t look right. For reference the project is <br>
<a href=3D"https://github.com/HewlettPackard/reconbf" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/HewlettPackard/reconbf</a><br>
<br>
In a sense of a more painless transition these issues should be <br>
addressed before any release<br>
<br>
On 26.02.22 09:21, Richard Purdie wrote:<br>
&gt; This fixes the name for native and nativesdk recipes.<br>
&gt; <br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/classes/pip_install_wheel.bbclass | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip=
_install_wheel.bbclass<br>
&gt; index 9f9feda6ee0..5b7e5cd7064 100644<br>
&gt; --- a/meta/classes/pip_install_wheel.bbclass<br>
&gt; +++ b/meta/classes/pip_install_wheel.bbclass<br>
&gt; @@ -2,7 +2,7 @@ DEPENDS:append =3D &quot; python3-pip-native&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0def guess_pip_install_package_name(d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;&#39;&#39;<a href=3D"https://www.python=
.org/dev/peps/pep-0491/#escaping-and-unicode&#39;" rel=3D"noreferrer" targe=
t=3D"_blank">https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode=
&#39;</a>&#39;&#39;<br>
&gt; -=C2=A0 =C2=A0 return (d.getVar(&#39;PYPI_PACKAGE&#39;) or d.getVar(&#=
39;PN&#39;)).replace(&#39;-&#39;, &#39;_&#39;)<br>
&gt; +=C2=A0 =C2=A0 return (d.getVar(&#39;PYPI_PACKAGE&#39;) or d.getVar(&#=
39;BPN&#39;)).replace(&#39;-&#39;, &#39;_&#39;)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0PIP_INSTALL_PACKAGE ?=3D &quot;${@guess_pip_install_packag=
e_name(d)}&quot;<br>
&gt;=C2=A0 =C2=A0PIP_INSTALL_DIST_PATH ?=3D &quot;${B}/dist&quot;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#162432): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/162432" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/162432</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89406689/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/89406689/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f430ec05d90b18f6--

