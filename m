Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34F3C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 21:17:14 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.880.1646687833916221773
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 13:17:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=Gjt8p5d/;
 spf=pass (domain: burtonini.com, ip: 209.85.221.41,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f41.google.com with SMTP id t11so25368945wrm.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 13:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CU20c0WHaDFd4JhNfU5nAhgiJc8r19bzOe2pHvN6Lsk=;
        b=Gjt8p5d/jM8oKc2mL1jA2l9hR+l330bimaTRg+l2ulvlFielzOlW2FJirhJ7MRHHbD
         CCEamP7RHn5zX12wDM6G5mJeY4uw1ldW7YiGGKNW4mk+xm7PZxgNK4UEfTy7opjELZI7
         ROkLTkPHIx4Sw+zpFsQ6DHRD4Nnv9OeEu4qgGiAErnqUrY28JppAmFzIGRkFj3fVNTnN
         cMUYOp1XFVw+JLH3HYfORCGEtpwDnmDt1t4x0X8IZxue3gTg/I5CILJMAX4mlXlJ+PJ2
         cQU3e37mObE+uRn8B5KgKTzq01ygnLDz5pmlyeBrz+vvM1naWQrnavqhSuAQumLh9wAp
         fwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CU20c0WHaDFd4JhNfU5nAhgiJc8r19bzOe2pHvN6Lsk=;
        b=5/qjT4AOr+MD3rjTVOAIMEVFk9x2MZvQRXYnKriIYCMTQbGP7G9Cj7iGAPO8eclOAF
         rQelKJKnGAMnxKvk/PIDSBeMGasrx4SZWAiPHAIi32cDk84NO7TjzHrjlW6qtUHxy4sC
         bEu/EA2dZ/oZ/4UtL02V4N1H0whAGZ82yOYwtYm2J6777AZnklmprs9zrmGj3INdv102
         e7zJk6Xc3TmFgtYUFqUK0lj7QRuf2bV9JscDlDXsHQnw5pzwbGQPDvZkmcVHj50ElXRj
         h1U0tL56EDqWg0+tbnuEW1vAJ00cwfFKoTeTEGWLjZ0JnFY9Ii6B08Ouly0KToj6kK9W
         7lmw==
X-Gm-Message-State: AOAM533n2z6othtbwtOw883lUoz4+WylQQakes5R55YQQqj5joqQjsUe
	5pko5128KlhBJWPCi0eIV0jnDTFJ0jTBzfrzAjoswA==
X-Google-Smtp-Source: 
 ABdhPJxbq1NvGDYTBqNbFL49tIvAEnmmL3dfidpQiuZBxfPaIxqshg//Thpe7fCLLUhhkkvf9NdU/fjWuziYILPnmOo=
X-Received: by 2002:a5d:45ca:0:b0:1ea:9bf9:ce5a with SMTP id
 b10-20020a5d45ca000000b001ea9bf9ce5amr9753479wrs.620.1646687832272; Mon, 07
 Mar 2022 13:17:12 -0800 (PST)
MIME-Version: 1.0
References: <20220307194236.3837684-1-ross.burton@arm.com>
 <AM9PR09MB4642242FEC1B96DD9711A1C8A8089@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB4642242FEC1B96DD9711A1C8A8089@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 7 Mar 2022 21:17:01 +0000
Message-ID: 
 <CAAnfSTt9RmJY4ab8NOk7s-UDXg+fLV3=VxWfAqFP_0ygVKsN-g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] pip_install_wheel: don't lazy assign
 PIPINSTALLARGS
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004c866b05d9a7630e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 21:17:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162865

--0000000000004c866b05d9a7630e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Personally I can=E2=80=99t see any reason to extend the pip install argumen=
ts. What
option do you think would be used by a recipe?

Ross

On Mon, 7 Mar 2022 at 20:06, Konrad Weihmann <kweihmann@outlook.com> wrote:

>
> On 07.03.22 20:42, Ross Burton wrote:
> > If we expect users to extend this we should use =3D, as otherwise a rec=
ipe
> > that does +=3D will replace the default value.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >   meta/classes/pip_install_wheel.bbclass | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/pip_install_wheel.bbclass
> b/meta/classes/pip_install_wheel.bbclass
> > index c1680a24ed..febcc8e445 100644
> > --- a/meta/classes/pip_install_wheel.bbclass
> > +++ b/meta/classes/pip_install_wheel.bbclass
> > @@ -10,7 +10,7 @@ PIP_INSTALL_PACKAGE ?=3D
> "${@guess_pip_install_package_name(d)}"
> >   PIP_INSTALL_DIST_PATH ?=3D "${@d.getVar('SETUPTOOLS_SETUP_PATH') or
> d.getVar('B')}/dist"
> >   PYPA_WHEEL ??=3D
> "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-*-*.whl"
> >
> > -PIP_INSTALL_ARGS ?=3D "\
> > +PIP_INSTALL_ARGS =3D "\
> >       -vvvv \
> >       --ignore-installed \
> >       --no-cache \
> >
> >
>
> Hmm all of the classes use ?=3D and I think for a reason - this isn't the
> fault of the bbclass but of the recipe in the end, as +=3D is known to
> cause this depending on where the additions have been added (before the
> inherit or after it) - I think the better way would be to use
> PIP_INSTALL_ARGS:append in the actual recipe - guess the fallout would
> be way less than the one I expect from this change.
>
> The big question is if that should changeable by the user or not - I
> personally think it should be
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#162860):
> https://lists.openembedded.org/g/openembedded-core/message/162860
> > Mute This Topic: https://lists.openembedded.org/mt/89621292/3647476
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> kweihmann@outlook.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000004c866b05d9a7630e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Personally I can=E2=80=99t see any reason to extend the p=
ip install arguments. What option do you think would be used by a recipe?</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Ross</div><div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 7 Mar 20=
22 at 20:06, Konrad Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.com">k=
weihmann@outlook.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-sty=
le:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
On 07.03.22 20:42, Ross Burton wrote:<br>
&gt; If we expect users to extend this we should use =3D, as otherwise a re=
cipe<br>
&gt; that does +=3D will replace the default value.<br>
&gt; <br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" =
target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/classes/pip_install_wheel.bbclass | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip=
_install_wheel.bbclass<br>
&gt; index c1680a24ed..febcc8e445 100644<br>
&gt; --- a/meta/classes/pip_install_wheel.bbclass<br>
&gt; +++ b/meta/classes/pip_install_wheel.bbclass<br>
&gt; @@ -10,7 +10,7 @@ PIP_INSTALL_PACKAGE ?=3D &quot;${@guess_pip_install_=
package_name(d)}&quot;<br>
&gt;=C2=A0 =C2=A0PIP_INSTALL_DIST_PATH ?=3D &quot;${@d.getVar(&#39;SETUPTOO=
LS_SETUP_PATH&#39;) or d.getVar(&#39;B&#39;)}/dist&quot;<br>
&gt;=C2=A0 =C2=A0PYPA_WHEEL ??=3D &quot;${PIP_INSTALL_DIST_PATH}/${PIP_INST=
ALL_PACKAGE}-*-*.whl&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -PIP_INSTALL_ARGS ?=3D &quot;\<br>
&gt; +PIP_INSTALL_ARGS =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-vvvv \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--ignore-installed \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--no-cache \<br>
&gt; <br>
&gt; <br>
<br>
Hmm all of the classes use ?=3D and I think for a reason - this isn&#39;t t=
he <br>
fault of the bbclass but of the recipe in the end, as +=3D is known to <br>
cause this depending on where the additions have been added (before the <br=
>
inherit or after it) - I think the better way would be to use <br>
PIP_INSTALL_ARGS:append in the actual recipe - guess the fallout would <br>
be way less than the one I expect from this change.<br>
<br>
The big question is if that should changeable by the user or not - I <br>
personally think it should be<br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#162860): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/162860" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/162860</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89621292=
/3647476" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/89621292/3647476</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:kweihmann@outlook.com=
" target=3D"_blank">kweihmann@outlook.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div></div>

--0000000000004c866b05d9a7630e--

