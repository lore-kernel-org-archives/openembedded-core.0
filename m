Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A84AC38147
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 13:35:14 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.14939.1674048911687661115
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 05:35:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kIQiYLtF;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id e3so24723729wru.13
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 05:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LGTf+Rw5C+3tZtWEqRLZ+G09CO/INj6slf2bWUKBSeI=;
        b=kIQiYLtFQWK9UTGhtH6tkoRuBD7MHFNlWatquyHMbxx/VQvLASQAndhHuWwhPyeaLr
         4/0G6xpQ+4oezbYDJQT0dtd5nR3lW+OMHpPKDnpDietfh199qGrGhsozmrTENDn9lBb8
         IPxAurv526hjLIVr1Gj8X9bCVi8p04TYvj8qtr1B4S0AdkWpCJAWqvYos0ie2YgK3wO1
         DthHGWpbXg+gIqfnO7n6FmUOZ2PR8nNl4AgL5J5UV3XFT0EDlqLLoJYGatHX9rchifTJ
         FyfQsFHbTZI708UhI6Sr/eo8Y+6avSnQcKCdmkyXcUypffvP6qajWK+T7jQmfOpFhubl
         UVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LGTf+Rw5C+3tZtWEqRLZ+G09CO/INj6slf2bWUKBSeI=;
        b=A9jaayfjZHzzJgSKAgkZMDLvXfzDre3UM07EfgSR1AjcCm2jXuDSVoS2gW93mAllCK
         z1j5G/EmZhmCbMi1VZi+ucwfFsdUzYwCiZimkwapKSTCOOPr54HH976l+ZwuYgdOCC7o
         hfkK690eXHJmeSkKt5WIRI4OMe6zuluRMIKJ2sZv4Cb/UxlOYc3+dL8/tVRqkRadWJV+
         lS+EvKZzxyYY/RaBPxwdMQFhTK37qjhvN7yzmj01lRt9dt2uHgY1BaPYtu8qju0ostUj
         ae+xwAKTPnQ4zo8oedPAdoC9FyNlHb8/70vUWbaDhdhY/elfv67C/NH2gyjpGtbajSbI
         s3xA==
X-Gm-Message-State: AFqh2kqWDLWmMqCt/ZprH+N+LZKPznDGgyQKCi9OlyxVUMCz0zUWaHlM
	T/qv0xR8woJWGy5+tIIm8LJXyROFgrR2+tCjW4Q=
X-Google-Smtp-Source: AMrXdXuKJzYhxBm4zET5uWnu3WRJagoAhYRQGp8+igZlAMa3M2Z6PWixLnQeV9U6Z4jHPN4MO78tk/EhzLYe2Jttrpg=
X-Received: by 2002:a5d:604a:0:b0:2bd:f870:4e91 with SMTP id
 j10-20020a5d604a000000b002bdf8704e91mr171254wrt.548.1674048909931; Wed, 18
 Jan 2023 05:35:09 -0800 (PST)
MIME-Version: 1.0
References: <20230116153035.3226400-1-Martin.Jansa@gmail.com> <20230118135505.00343139@booty>
In-Reply-To: <20230118135505.00343139@booty>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 18 Jan 2023 14:34:57 +0100
Message-ID: <CA+chaQdbY9L=Bsmot-6ZoadVHjuRhY_+dyKLmAfOrLUxBzuO-A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: update submitted patch with backported version
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, kai.kang@windriver.com
Content-Type: multipart/alternative; boundary="0000000000009cf92705f289e231"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 13:35:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176094

--0000000000009cf92705f289e231
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 18, 2023 at 1:55 PM Luca Ceresoli <luca.ceresoli@bootlin.com>
wrote:

> Hello Martin,
>
> On Mon, 16 Jan 2023 16:30:35 +0100
> "Martin Jansa" <Martin.Jansa@gmail.com> wrote:
>
> > * this version was merged to main in:
> >
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/267dd1f4d571ee606141aa66f1665aa152b4e911
> >   and cherry-picked to staging/23.0 as well in:
> >
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/54cfb552abc50e8167cdc46d87455a9a414d7c65
> >
> >   and as a bonus it doesn't break the build with DEBUG_BUILD
> >   for newer toolchain, so we can apply it for target build as well, see:
> >   https://lists.openembedded.org/g/openembedded-core/message/169002
> >   https://lists.openembedded.org/g/openembedded-core/message/170930
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> There was a conflict while applying this patch on my testing branch due
> to a previous patch touching mesa.inc. It was simple enough so I have
> fixed it, but you might want to double check the resulting commit:
>
>
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=lucaceresoli/master-next-success&id=259d433461e246fa85ff0c0ffa98b91209e15d31


git log --oneline contrib/lucaceresoli/master-next --
meta/recipes-graphics/mesa/ | head -n 3
8b328a698cc mesa: update submitted patch with backported version
ab86331bf4a mesa: allow mesa (gbm) to compile without backend
256173b0245 mesa: update 22.2.3 -> 22.3.3

^^^ LGTM

--0000000000009cf92705f289e231
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Jan 18, 2023 at 1:55 PM Luca Cere=
soli &lt;<a href=3D"mailto:luca.ceresoli@bootlin.com">luca.ceresoli@bootlin=
.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hello Martin,<br>
<br>
On Mon, 16 Jan 2023 16:30:35 +0100<br>
&quot;Martin Jansa&quot; &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" targ=
et=3D"_blank">Martin.Jansa@gmail.com</a>&gt; wrote:<br>
<br>
&gt; * this version was merged to main in:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/comm=
it/267dd1f4d571ee606141aa66f1665aa152b4e911" rel=3D"noreferrer" target=3D"_=
blank">https://gitlab.freedesktop.org/mesa/mesa/-/commit/267dd1f4d571ee6061=
41aa66f1665aa152b4e911</a><br>
&gt;=C2=A0 =C2=A0and cherry-picked to staging/23.0 as well in:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/comm=
it/54cfb552abc50e8167cdc46d87455a9a414d7c65" rel=3D"noreferrer" target=3D"_=
blank">https://gitlab.freedesktop.org/mesa/mesa/-/commit/54cfb552abc50e8167=
cdc46d87455a9a414d7c65</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0and as a bonus it doesn&#39;t break the build with DEBUG_B=
UILD<br>
&gt;=C2=A0 =C2=A0for newer toolchain, so we can apply it for target build a=
s well, see:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openembedded-c=
ore/message/169002" rel=3D"noreferrer" target=3D"_blank">https://lists.open=
embedded.org/g/openembedded-core/message/169002</a><br>
&gt;=C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openembedded-c=
ore/message/170930" rel=3D"noreferrer" target=3D"_blank">https://lists.open=
embedded.org/g/openembedded-core/message/170930</a><br>
&gt; <br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
<br>
There was a conflict while applying this patch on my testing branch due<br>
to a previous patch touching mesa.inc. It was simple enough so I have<br>
fixed it, but you might want to double check the resulting commit:<br>
<br>
<a href=3D"https://git.openembedded.org/openembedded-core-contrib/commit/?h=
=3Dlucaceresoli/master-next-success&amp;id=3D259d433461e246fa85ff0c0ffa98b9=
1209e15d31" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.o=
rg/openembedded-core-contrib/commit/?h=3Dlucaceresoli/master-next-success&a=
mp;id=3D259d433461e246fa85ff0c0ffa98b91209e15d31</a></blockquote><div><br><=
/div>git log --oneline contrib/lucaceresoli/master-next -- meta/recipes-gra=
phics/mesa/ | head -n 3<br>8b328a698cc mesa: update submitted patch with ba=
ckported version<br>ab86331bf4a mesa: allow mesa (gbm) to compile without b=
ackend<br>256173b0245 mesa: update 22.2.3 -&gt; 22.3.3<br><div><br></div><d=
iv>^^^ LGTM</div></div></div>

--0000000000009cf92705f289e231--

