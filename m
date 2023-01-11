Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE5BC46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 15:20:41 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.26363.1673450433962929167
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 07:20:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: aehs29@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id bp15so24008081lfb.13
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 07:20:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7TGJqVvBvkkQuxef0HI8u2rW4r+HhHVIG1BZpMR0q0=;
        b=Wv3Oevt/+sJB18Jx/5lA9BwTON1y7EHpdmRI/1nCaefiC+OOENYUOlvrWBZfsfRYIW
         OXgxeqHUJhWJpNF02I+7M5svkBsMaG7RDLT4hmk7GK1eXUk9jnNl1L5XkCEKDjN6xZ3o
         f+nHEvBggMcbiotFd8nZMJpfGra5YNdb+zUxn93VJaIS61FQUv/PnPuQ2+VDrYdrPodm
         1aaJjpsucskNt/GEZQo8ytGjzBR1jBLKavWUNLEgGEuKpQjr/UDdYvoJYvkmcAG07Td6
         yzaaezkMnnq1d20lYqqx1XK0MTi2VK/VaCrHmM2PL29u+q9AAwQIIav10hYD/nV6Ey0M
         oCyA==
X-Gm-Message-State: AFqh2kqDrKvmhLPdaJNe5jHA9YMUITPPGZ6oreT8aExy6l3u12D86fuq
	qeGAJrz/w0iMPvYDE4vUeZ7brhtqF+F1wFpP
X-Google-Smtp-Source: AMrXdXsDm+3qmTA5Rw9plITW6VBqAelAjdN1hnB1E5l53pDZ0/CGZVxJgj6coMumvvZ50jFN3DvQQg==
X-Received: by 2002:ac2:50d9:0:b0:4cb:2c19:ec21 with SMTP id h25-20020ac250d9000000b004cb2c19ec21mr11106846lfm.0.1673450431468;
        Wed, 11 Jan 2023 07:20:31 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id s1-20020a056512202100b00492ca820e15sm2763606lfs.270.2023.01.11.07.20.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 07:20:30 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id f34so24003025lfv.10
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 07:20:30 -0800 (PST)
X-Received: by 2002:a05:6512:260f:b0:4cb:88c:c798 with SMTP id
 bt15-20020a056512260f00b004cb088cc798mr2859734lfb.227.1673450430257; Wed, 11
 Jan 2023 07:20:30 -0800 (PST)
MIME-Version: 1.0
References: <20230108191525.1312582-1-alejandro@enedino.org>
 <20230108191525.1312582-2-alejandro@enedino.org> <Y77TEGpCjI2TGdgI@mail.local>
In-Reply-To: <Y77TEGpCjI2TGdgI@mail.local>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Wed, 11 Jan 2023 09:20:19 -0600
X-Gmail-Original-Message-ID: <CAHMutrYyT3kcVih-h4GMKBgdjXQKHd+YnE-JX74D4fBXSgqw4w@mail.gmail.com>
Message-ID: <CAHMutrYyT3kcVih-h4GMKBgdjXQKHd+YnE-JX74D4fBXSgqw4w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] baremetal-helloworld: Move from skeleton to
 recipes-extended matching what rust-hello-world is doing
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000071dfa105f1fe8a37"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 15:20:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175752

--00000000000071dfa105f1fe8a37
Content-Type: text/plain; charset="UTF-8"

I'll send a v2 that includes the matainers.inc change

Alejandro

On Wed, Jan 11, 2023, 9:17 AM Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> Hello,
>
> This fails with:
>
> The following recipes do not have a maintainer assigned to them. Please
> add an entry to meta/conf/distro/include/maintainers.inc file.
> baremetal-helloworld
> (/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-extended/baremetal-example/
> baremetal-helloworld_git.bb)
>
> please run oe-selftest before submitting
>
>
> On 08/01/2023 12:15:24-0700, Alejandro Hernandez Samaniego wrote:
> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org>
> > ---
> >  .../baremetal-example}/baremetal-helloworld_git.bb                | 0
> >  1 file changed, 0 insertions(+), 0 deletions(-)
> >  rename {meta-skeleton/recipes-baremetal/baremetal-examples =>
> meta/recipes-extended/baremetal-example}/baremetal-helloworld_git.bb
> (100%)
> >
> > diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/
> baremetal-helloworld_git.bb b/meta/recipes-extended/baremetal-example/
> baremetal-helloworld_git.bb
> > similarity index 100%
> > rename from meta-skeleton/recipes-baremetal/baremetal-examples/
> baremetal-helloworld_git.bb
> > rename to meta/recipes-extended/baremetal-example/
> baremetal-helloworld_git.bb
> > --
> > 2.34.1
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#175637):
> https://lists.openembedded.org/g/openembedded-core/message/175637
> > Mute This Topic: https://lists.openembedded.org/mt/96137379/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--00000000000071dfa105f1fe8a37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>I&#39;ll send a v2 that includes the matainers.inc c=
hange</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alejandro=C2=A0<br=
><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Wed, Jan 11, 2023, 9:17 AM Alexandre Belloni &lt;<a href=3D"mail=
to:alexandre.belloni@bootlin.com">alexandre.belloni@bootlin.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">Hello,<br>
<br>
This fails with:<br>
<br>
The following recipes do not have a maintainer assigned to them. Please add=
 an entry to meta/conf/distro/include/maintainers.inc file.<br>
baremetal-helloworld (/home/pokybuild/yocto-worker/oe-selftest-fedora/build=
/meta/recipes-extended/baremetal-example/<a href=3D"http://baremetal-hellow=
orld_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">baremetal-hell=
oworld_git.bb</a>)<br>
<br>
please run oe-selftest before submitting<br>
<br>
<br>
On 08/01/2023 12:15:24-0700, Alejandro Hernandez Samaniego wrote:<br>
&gt; Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"ma=
ilto:alejandro@enedino.org" target=3D"_blank" rel=3D"noreferrer">alejandro@=
enedino.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../baremetal-example}/<a href=3D"http://baremetal-helloworld_gi=
t.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">baremetal-helloworld_=
git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
&gt;=C2=A0 1 file changed, 0 insertions(+), 0 deletions(-)<br>
&gt;=C2=A0 rename {meta-skeleton/recipes-baremetal/baremetal-examples =3D&g=
t; meta/recipes-extended/baremetal-example}/<a href=3D"http://baremetal-hel=
loworld_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">baremetal-h=
elloworld_git.bb</a> (100%)<br>
&gt; <br>
&gt; diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/<a hre=
f=3D"http://baremetal-helloworld_git.bb" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">baremetal-helloworld_git.bb</a> b/meta/recipes-extended/barem=
etal-example/<a href=3D"http://baremetal-helloworld_git.bb" rel=3D"noreferr=
er noreferrer" target=3D"_blank">baremetal-helloworld_git.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta-skeleton/recipes-baremetal/baremetal-examples/<a href=
=3D"http://baremetal-helloworld_git.bb" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">baremetal-helloworld_git.bb</a><br>
&gt; rename to meta/recipes-extended/baremetal-example/<a href=3D"http://ba=
remetal-helloworld_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">=
baremetal-helloworld_git.bb</a><br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#175637): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/175637" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1756=
37</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96137379=
/3617179" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/mt/96137379/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.=
belloni@bootlin.com" target=3D"_blank" rel=3D"noreferrer">alexandre.belloni=
@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div></div></div>

--00000000000071dfa105f1fe8a37--

