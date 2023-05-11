Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A44C7EE22
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 07:42:14 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.53660.1683790931180507235
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 00:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=MHGBAXMS;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3f42c865534so27346405e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 00:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683790929; x=1686382929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qzbEHpqKE0/F/a3Z6xmXCoC2gTXLM9nskPmazW/7g4M=;
        b=MHGBAXMSuIU62pTkgurKgQCQ4ZvifSAzOeoodZ94PkdbSnUK9HibatbMJ7wB3Z4LQ6
         s04HwPyPwoGohf7Bwmbou5y1tIGU1nTZJ3rSG76WOwgDt/AnNOOSpna5kb5uVLZod7Rm
         GyTo4LGgctyhlwB7hKx8HUwdfoo6IL8TJFuM4fJxMDbBzgFt24SNOQWbhFJj8GGHYnLf
         jLoAPy6pC+3hzaYKyysk8BtZ7yHjC5RmzPmJA6nfcrl9eFdKjnYhmIEQs10WZVy4YuF5
         qcDeywCnjwEdBlIVU63PDur/62MgtHyQu7HIuDOKiAhZ++ARGKvwFykLq9JZxwROcFaF
         zVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683790929; x=1686382929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzbEHpqKE0/F/a3Z6xmXCoC2gTXLM9nskPmazW/7g4M=;
        b=l16iN/lqtb6TTcp3b3mzQF342rmiVyO/Hug8KnhEJXoa7PcfF74B7Q42KbnjGiuutw
         Zvw98B/Bvfz4n13MD+9JygMPdW7un2Mw8suDbM2YhcdkRPD6UfWzYRRGA8gxIUAFfcq2
         RW/q92X7iSrAJ7ZBzSDES86gjmnnsYPvX9J+g+RPrUtsmK7OC4zGqGbGiZZY5fCqGZLb
         Mcmjv+U0c6+KIyEHe3S/vWVb44h90tgABzVcZkmORwvrauxX/XiaBD/engKt+jTOqEjE
         tpR+UEWxviZBRmemYseYAcq6OHhNlvxp89F0eGu3vyAbU3tfluJo1A5Obwzp8wh4b5Wu
         d05g==
X-Gm-Message-State: AC+VfDxLhLP/F4773x4HzuOI2zTg+CPROlKvL0v3Yr2DCyDft8JL1owr
	OsjmWtHaybuQmR0F2rOpWOaD2NfNZPUZhFEBRxA=
X-Google-Smtp-Source: ACHHUZ53kKFWQjzdjAwlnWouB1vb6PliiDE+uja8V2wR9/UENFASCpZE4cYwpuoTT+oooIJ8oFa/X9JzcjuesupI4bw=
X-Received: by 2002:a7b:ce05:0:b0:3f4:2b86:28c5 with SMTP id
 m5-20020a7bce05000000b003f42b8628c5mr6898076wmc.38.1683790929247; Thu, 11 May
 2023 00:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1678709427.git.Martin.Jansa@gmail.com> <06c7db2b170b9cf47c803ea12c83b58f886074b2.1678709427.git.Martin.Jansa@gmail.com>
 <45473015.fMDQidcC6G@linc>
In-Reply-To: <45473015.fMDQidcC6G@linc>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 11 May 2023 09:41:55 +0200
Message-ID: <CA+chaQdxp=E_mNZ15daXhb3EyHwqiStB09c2vWG-k2AWAQu28A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 09/14] image-artifact-names: add
 IMAGE_MACHINE_SUFFIX variable
To: Paul Eggleton <bluelightning@bluelightning.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000036c35305fb6620cd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 07:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181130

--00000000000036c35305fb6620cd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

I'm sorry about that, will make sure this is supported again in final state
with all [YOCTO #12937] changes where the *_NAME and *_LINK_NAME variables
are reversed:

-IMAGE_NAME ?=3D "${IMAGE_LINK_NAME}${IMAGE_VERSION_SUFFIX}"
-IMAGE_LINK_NAME ?=3D
"${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_NAME_SUFFIX}"
+IMAGE_NAME ?=3D
"${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_NAME_SUFFIX}"
+IMAGE_LINK_NAME ?=3D "${IMAGE_NAME}${IMAGE_VERSION_SUFFIX}"

and versioned hardlinks (instead of symlinks) *_LINK_NAME are created by
separate task. Which will respect *_LINK_NAME variables being set to empty
to disable creating them.

I've just added another commit to my [YOCTO #12937] staging branch
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/artif=
acts
to respect empty *_LINK_NAME variables also for kernel artifacts.

Cheers,

On Wed, Apr 19, 2023 at 12:43=E2=80=AFAM Paul Eggleton <
bluelightning@bluelightning.org> wrote:

> Hi Martin
>
> On Tuesday, 14 March 2023 01:15:36 NZST Martin Jansa wrote:
> > * to make it easier for projects to avoid default -${MACHINE} suffix if
> >   the ${MACHINE} named DEPLOY_DIR_IMAGE works better for them
> >
> > * also use IMAGE_LINK_NAME in IMAGE_NAME to make it more clear
> >   that IMAGE_NAME is the same as IMAGE_LINK_NAME but with version
> >   suffix
> >
> > * adding it as separate variable helps us to catch the cases
> >   where we didn't respect ${IMAGE_LINK_NAME} variable and just used
> >   the common default ${IMAGE_BASENAME}-${MACHINE}.
> >
> > [YOCTO #12937]
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes-recipe/image-artifact-names.bbclass  | 15 ++++++++++++---
> >  meta/classes-recipe/kernel-artifact-names.bbclass |  2 +-
> >  2 files changed, 13 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/classes-recipe/image-artifact-names.bbclass
> > b/meta/classes-recipe/image-artifact-names.bbclass index
> > 9dc25b6dde..ac2376d59a 100644
> > --- a/meta/classes-recipe/image-artifact-names.bbclass
> > +++ b/meta/classes-recipe/image-artifact-names.bbclass
> > @@ -11,11 +11,20 @@
> >  IMAGE_BASENAME ?=3D "${PN}"
> >  IMAGE_VERSION_SUFFIX ?=3D "-${DATETIME}"
> >  IMAGE_VERSION_SUFFIX[vardepsexclude] +=3D "DATETIME SOURCE_DATE_EPOCH"
> > -IMAGE_NAME ?=3D "${IMAGE_BASENAME}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
> > -IMAGE_LINK_NAME ?=3D "${IMAGE_BASENAME}-${MACHINE}"
> > +IMAGE_NAME ?=3D "${IMAGE_LINK_NAME}${IMAGE_VERSION_SUFFIX}"
> > +IMAGE_LINK_NAME ?=3D "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}"
>
> So there's a minor unfortunate side-effect of this in that you can no
> longer
> just set IMAGE_LINK_NAME =3D "" to drop the symlinks - a minority use cas=
e,
> but
> something I have used. Of course you can just re-set the value of
> IMAGE_NAME.
> I am making a note in the manual and migration guide.
>
> Cheers
> Paul
>
>
>
>
>

--00000000000036c35305fb6620cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Paul,<div><br></div><div>I&#39;m sorry about that, will=
 make sure this is supported again in final state with all=C2=A0[YOCTO #129=
37] changes where the *_NAME and *_LINK_NAME variables are reversed:</div><=
div><br></div><div>-IMAGE_NAME ?=3D &quot;${IMAGE_LINK_NAME}${IMAGE_VERSION=
_SUFFIX}&quot;<br>-IMAGE_LINK_NAME ?=3D &quot;${IMAGE_BASENAME}${IMAGE_MACH=
INE_SUFFIX}${IMAGE_NAME_SUFFIX}&quot;<br>+IMAGE_NAME ?=3D &quot;${IMAGE_BAS=
ENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_NAME_SUFFIX}&quot;<br>+IMAGE_LINK_NAME=
 ?=3D &quot;${IMAGE_NAME}${IMAGE_VERSION_SUFFIX}&quot;<br></div><div><br></=
div><div>and versioned hardlinks (instead of symlinks) *_LINK_NAME are crea=
ted by separate task. Which will respect *_LINK_NAME variables being set to=
 empty to disable creating them.</div><div><br></div><div>I&#39;ve just add=
ed another commit to my [YOCTO #12937] staging branch <a href=3D"https://gi=
t.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/artifacts">http=
s://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/artifacts=
</a> to respect empty *_LINK_NAME variables also for kernel artifacts.</div=
><div><br></div><div>Cheers,</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 19, 2023 at 12:43=E2=80=AFAM =
Paul Eggleton &lt;<a href=3D"mailto:bluelightning@bluelightning.org">blueli=
ghtning@bluelightning.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Hi Martin<br>
<br>
On Tuesday, 14 March 2023 01:15:36 NZST Martin Jansa wrote:<br>
&gt; * to make it easier for projects to avoid default -${MACHINE} suffix i=
f<br>
&gt;=C2=A0 =C2=A0the ${MACHINE} named DEPLOY_DIR_IMAGE works better for the=
m<br>
&gt; <br>
&gt; * also use IMAGE_LINK_NAME in IMAGE_NAME to make it more clear<br>
&gt;=C2=A0 =C2=A0that IMAGE_NAME is the same as IMAGE_LINK_NAME but with ve=
rsion<br>
&gt;=C2=A0 =C2=A0suffix<br>
&gt; <br>
&gt; * adding it as separate variable helps us to catch the cases<br>
&gt;=C2=A0 =C2=A0where we didn&#39;t respect ${IMAGE_LINK_NAME} variable an=
d just used<br>
&gt;=C2=A0 =C2=A0the common default ${IMAGE_BASENAME}-${MACHINE}.<br>
&gt; <br>
&gt; [YOCTO #12937]<br>
&gt; <br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-recipe/image-artifact-names.bbclass=C2=A0 | 15 ++++=
++++++++---<br>
&gt;=C2=A0 meta/classes-recipe/kernel-artifact-names.bbclass |=C2=A0 2 +-<b=
r>
&gt;=C2=A0 2 files changed, 13 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes-recipe/image-artifact-names.bbclass<br>
&gt; b/meta/classes-recipe/image-artifact-names.bbclass index<br>
&gt; 9dc25b6dde..ac2376d59a 100644<br>
&gt; --- a/meta/classes-recipe/image-artifact-names.bbclass<br>
&gt; +++ b/meta/classes-recipe/image-artifact-names.bbclass<br>
&gt; @@ -11,11 +11,20 @@<br>
&gt;=C2=A0 IMAGE_BASENAME ?=3D &quot;${PN}&quot;<br>
&gt;=C2=A0 IMAGE_VERSION_SUFFIX ?=3D &quot;-${DATETIME}&quot;<br>
&gt;=C2=A0 IMAGE_VERSION_SUFFIX[vardepsexclude] +=3D &quot;DATETIME SOURCE_=
DATE_EPOCH&quot;<br>
&gt; -IMAGE_NAME ?=3D &quot;${IMAGE_BASENAME}-${MACHINE}${IMAGE_VERSION_SUF=
FIX}&quot;<br>
&gt; -IMAGE_LINK_NAME ?=3D &quot;${IMAGE_BASENAME}-${MACHINE}&quot;<br>
&gt; +IMAGE_NAME ?=3D &quot;${IMAGE_LINK_NAME}${IMAGE_VERSION_SUFFIX}&quot;=
<br>
&gt; +IMAGE_LINK_NAME ?=3D &quot;${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}&q=
uot;<br>
<br>
So there&#39;s a minor unfortunate side-effect of this in that you can no l=
onger <br>
just set IMAGE_LINK_NAME =3D &quot;&quot; to drop the symlinks - a minority=
 use case, but <br>
something I have used. Of course you can just re-set the value of IMAGE_NAM=
E. <br>
I am making a note in the manual and migration guide.<br>
<br>
Cheers<br>
Paul<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000036c35305fb6620cd--

