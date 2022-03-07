Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CFACC433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 17:30:23 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web12.803.1646674222558067648
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 09:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ux8JUG8F;
 spf=pass (domain: gmail.com, ip: 209.85.208.176,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id r22so5993854ljd.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 09:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ANnCdkj5+TfSk3v7FMEDgRNjHwBtvgQYER8GnNnKUkg=;
        b=Ux8JUG8Flbq2BDo9D1PVTXJaIYTVf6TQE9MaUMmHg+qJieQuGfUsrqAuEdjOyzTsqm
         EFNDIFUun3X/of6BVaLx8v7+uPUg6HOAJFHV/hNLlHE4hQ3EwFWCH+46fxtpzaBOCMZh
         cHn2QpQjSPeL78154PqC8WT6BfxPqu+ddwm6ifOIxS3YFB0/vYrzLoTiPnqfwpb1+mUO
         FZa7SqfuDzOgFjttnm8B8+AVVMTuSke+/H2sfpaGpR/ANd5Sr5dhDxHGs2E1eJOB2aWp
         CVETHOmDqW6fHLewWAYNuTr2Ei75YUXHfZzlmRUVeykfABQE1E48ICpeDH5ogzsfz0+E
         gIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ANnCdkj5+TfSk3v7FMEDgRNjHwBtvgQYER8GnNnKUkg=;
        b=sYk1+pijp8suz+BoBveQ/PE5TATfLzPL2E4pVh5iU70YCdeF04Gbbok2JVnL+9iPeo
         nBfvv3f5ZtwGvgV/GNknzX7Syx5JRtIv2iP0MNI9sHMX/WgOZ7dtq/0FUvkSbJUJSlw/
         nDZLBiWPoY52v+Inn2kTOTQmgc8dXuFMn+3ANTVSDWla0yfsRnw2pwZ8RqolrlD6lUNV
         MCzBMxkF979Syh5GCzUJURjzrmFp3PQ2j0ggU9y/83isc4eos+A8+RYer1qKBIE43Tc7
         ZDnBFWcj5WgCTj30rt4qRSMXk1LKdHt1tqiYTBX+KfP9NacoM8lclQkm8wdBfwHkTgJd
         Iy7g==
X-Gm-Message-State: AOAM5313/sAYEEHVlhbRDS6nUVK88vyxnvbJeTNxpPTNLLy+RUAbachs
	ZSxcPLV8AcTP0Y2ZL+ebfRwEjcXWDauZlF5nOiiztsxWjlI=
X-Google-Smtp-Source: 
 ABdhPJy0P6i4KTzpOczrXS7xtU2yCl9SAafMXHFod1rT1U0Vfj1G/RJ0TwCysPD+4NkQWx2DCDdYzb2EbS5oKXO842k=
X-Received: by 2002:a2e:9f12:0:b0:246:2893:391f with SMTP id
 u18-20020a2e9f12000000b002462893391fmr8105875ljk.216.1646674220624; Mon, 07
 Mar 2022 09:30:20 -0800 (PST)
MIME-Version: 1.0
References: <20220306210823.53177-1-quaresma.jose@gmail.com>
 <b5b62038-9549-114c-72b3-cc1acb633aa9@kernel.crashing.org>
In-Reply-To: <b5b62038-9549-114c-72b3-cc1acb633aa9@kernel.crashing.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 7 Mar 2022 17:30:09 +0000
Message-ID: 
 <CANPvuRnBFgnG4uqpLBqPORPsNBQyaOU1QewfwSkbtx5Cz8b1sA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sstate: inside the threadedpool don't write to
 the shared localdata
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fb2fef05d9a4372d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 17:30:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162856

--000000000000fb2fef05d9a4372d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mark Hatle <mark.hatle@kernel.crashing.org> escreveu no dia segunda,
7/03/2022 =C3=A0(s) 16:14:

> Note, it appears this bug is in honister as well.
>

is already a little old, dunfell needs this fix as well.

jose


>
> On 3/6/22 3:08 PM, Jose Quaresma wrote:
> > When inside the threadedpool we make a copy of the localdata
> > to avoid some race condition, so we need to use this new
> > localdata2 and stop write the shared localdata.
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >   meta/classes/sstate.bbclass | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> > index dc9a2c085b..7aca415159 100644
> > --- a/meta/classes/sstate.bbclass
> > +++ b/meta/classes/sstate.bbclass
> > @@ -988,7 +988,7 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse,
> currentcount=3D0, summary=3DTrue,
> >
> >               localdata2 =3D bb.data.createCopy(localdata)
> >               srcuri =3D "file://" + sstatefile
> > -            localdata.setVar('SRC_URI', srcuri)
> > +            localdata2.setVar('SRC_URI', srcuri)
> >               bb.debug(2, "SState: Attempting to fetch %s" % srcuri)
> >
> >               import traceback
> >
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162853):
> https://lists.openembedded.org/g/openembedded-core/message/162853
> Mute This Topic: https://lists.openembedded.org/mt/89597961/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000fb2fef05d9a4372d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Mark Hatle &lt;<a href=3D"mailto:mark=
.hatle@kernel.crashing.org">mark.hatle@kernel.crashing.org</a>&gt; escreveu=
 no dia segunda, 7/03/2022 =C3=A0(s) 16:14:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Note, it appears this bug is in honister as wel=
l.<br></blockquote><div><br></div><div>is already a little old, dunfell nee=
ds this fix as well.<br></div><div><br></div><div>jose</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
On 3/6/22 3:08 PM, Jose Quaresma wrote:<br>
&gt; When inside the threadedpool we make a copy of the localdata<br>
&gt; to avoid some race condition, so we need to use this new<br>
&gt; localdata2 and stop write the shared localdata.<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail=
.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/classes/sstate.bbclass | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass=
<br>
&gt; index dc9a2c085b..7aca415159 100644<br>
&gt; --- a/meta/classes/sstate.bbclass<br>
&gt; +++ b/meta/classes/sstate.bbclass<br>
&gt; @@ -988,7 +988,7 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse=
, currentcount=3D0, summary=3DTrue,<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0localdata2 =3D b=
b.data.createCopy(localdata)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srcuri =3D &quot=
;file://&quot; + sstatefile<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 localdata.setVar(&#39;SRC_U=
RI&#39;, srcuri)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 localdata2.setVar(&#39;SRC_=
URI&#39;, srcuri)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.debug(2, &quo=
t;SState: Attempting to fetch %s&quot; % srcuri)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0import traceback=
<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#162853): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/162853" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/162853</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89597961/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/89597961/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000fb2fef05d9a4372d--

