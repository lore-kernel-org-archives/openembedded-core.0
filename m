Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24116C6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 16:08:34 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.195.1678896512313904622
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 09:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eTan/XF2;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id y15so15428998lfa.7
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 09:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678896510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iyk7Ng4YwYsk8PbNivPB9BGU/jcb+XrSAPBipf61ibs=;
        b=eTan/XF2tBOkBlTBHy1k8PVsGBzjZZKMHnO8b5sOet4nJTzI7H9ou2+XyOoIQn5fIH
         P6Zv8U3Anz09eJypUEdjDOwIsYOZqiESRvpALAR2hxUQPF06HkFilxCBHc0wH3QIMUqi
         FZH8+v6cNRYASDXNZoKAK2orHPuKDGViEXTky3u7ghvquJxpbacyKXqLIuptJkoguIpC
         RCzpAhz4BzHBUfMtzS4KCDNg75loBisZQhGK3wtkXaO4/beRqpkaNWkchNQYTeyHItgn
         /f/ca3HzlNaJbUvouz1OWGejSRBcqdhMKIdFa3oWnkRtfQJ5tXAqrQI72EaKLA4/XpwG
         Cnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678896510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iyk7Ng4YwYsk8PbNivPB9BGU/jcb+XrSAPBipf61ibs=;
        b=TuhqLUBIDfrPfSOq+fmtH2MDr9OTOv9i+rzDa4WTJ11KcA76ILBqhEhe6O7cJvfXu/
         z03El8EC6hHbAqUP1mfoBcAQO9YViHc6c2pR58dZDUeBE65/Ap+hH4tXoFQBjg64+dBi
         d817p9Ms450zfWkI+YtjmRGDzpWZ/lTHRvToWfsfzmAfQOdlwyAkeX2r5BRqbDHQ4nrn
         NiFiEqd7mAMhA5rL+3JF/eHIhEiGu+w2j1BNeG2i1i898Qjy7PLsDEEi1D7KeCHoJkth
         6flh878dg6q5z2jsn1efSQcHHxIvval2E+rDuarX6nRkVq+HuEQVVqrZpIcP7ZGAdtRe
         eUIg==
X-Gm-Message-State: AO0yUKXvEN/JJ7RAkNfKMdJqNdnBfpYHR1lG3caSESPfIYEsFsvW1KMI
	KH97X10Fq5mYW0F5uCK6ne2mWMlCOtpnqbnUzP8=
X-Google-Smtp-Source: AK7set/Tzd4waLz53wT6JZLRus7/h6nYFcAecT7dhSes17pD5164oFriG+Gq9LkXaXQHd8nLfiAGSx3oghD8uVcVXyc=
X-Received: by 2002:ac2:43d4:0:b0:4e0:822f:9500 with SMTP id
 u20-20020ac243d4000000b004e0822f9500mr2160032lfl.12.1678896510438; Wed, 15
 Mar 2023 09:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAkeoOSGvNNQOq78-Nh4hqqX-C1nYWjM7uMH_S+ofbHhxEDw@mail.gmail.com>
 <CANNYZj82PHeV-Gp2M4nkD2KniggLr=pSNjS6dMBP_P8PEzEDkw@mail.gmail.com>
In-Reply-To: <CANNYZj82PHeV-Gp2M4nkD2KniggLr=pSNjS6dMBP_P8PEzEDkw@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Wed, 15 Mar 2023 17:08:18 +0100
Message-ID: <CA+cAker9mJbz5seV7OuOqP8AqvzWogrc-oBnvt79XyHDS58nxA@mail.gmail.com>
Subject: Re: [OE-core] cargo, git dependencies and devtool
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001e905a05f6f28e61"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 16:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178649

--0000000000001e905a05f6f28e61
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On thanks, will keep you posted if I found a working situation setup for
this.

Le mer. 15 mars 2023, 16:57, Alexander Kanavin <alex.kanavin@gmail.com> a
=C3=A9crit :

> devtool simply isn't meant for recipes which pull multiple sources in
> SRC_URI. Also, we do not have a devtool maintainer :-/
>
> You can poke around its code to see if it can be addressed
> (easily-ish), but I suspect you have to write a different recipe for
> the 'myrepo' item which can then be 'devtool'-ed, and stage the output
> into sysroot, e.g. classical oe-core 'build dependecy' flow.
>
> Alex
>
> On Wed, 15 Mar 2023 at 16:53, Frederic Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> > Hello again list,
> >
> > I continue my investigation on developing a rust project within
> > openembedded environment. After discussion with some of you, I have a
> > project (binary) which will use some custom library crates (and so
> > these rely on other git repositories).
> >
> > In order to simply build the project I need to add this patch
> >
> https://patchwork.yoctoproject.org/project/oe-core/patch/20221030173815.1=
0212-2-alex.kiernan@gmail.com/
> > (with little modification to support uri like
> > "git://git@my_repo:7999/myproject.git")
> >
> > After that ports, the project was built successfully. Now I want to
> > develop in it ;) and so I use devtool (like I do for python or C
> > project) and I have another set issue.
> > I get back to having cargo trying to clone these git repos during the
> > build (which is forbidden since no network access is allowed except
> > during the fetch).
> >
> > I search a little and it seems it is the externalsrc.bbclass which
> > remove the git url in this line:
> >
> https://github.com/openembedded/openembedded-core/blob/master/meta/classe=
s/externalsrc.bbclass#L76
> >
> > I confirm that by issuing bitbake -e on my recipe and looking for
> > SRC_URI modifications.
> >
> > In my recipe I have something like:
> >
> > | SRC_URI +=3D " \
> > |    crate://crates.io/aho-corasick/0.7.20 \
> > |    crate://crates.io/async-broadcast/0.5.1 \
> > |    git://git@myserver
> :7999/myrepo.git;protocol=3Dssh;nobranch=3D1;name=3Dmy-crate;destsuffix=
=3Dmy-crate
> > | "
> > |  SRCREV_FORMAT .=3D "_my-crate"
> > | SRCREV_my-crate =3D "main"
> >
> > And after a "devtool modify" , the git dependency disappears ...
> > looking at the externalsrc class, it seems pretty straightforward to
> > know why the url_data.type with "git" doesn't end in local_srcuri.
> >
> > I would like to have advice on this if possible, if someone has
> > already encountered this use case in the past ?
> >
> > To my opinion, devtool should treat these SRC_URI alike but how can it
> > make the difference with the primary git repository (the one which
> > contains the top project) and the other git repositories ?
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#178582):
> https://lists.openembedded.org/g/openembedded-core/message/178582
> > Mute This Topic: https://lists.openembedded.org/mt/97630658/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000001e905a05f6f28e61
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">On thanks, will keep you posted if I found a working situ=
ation setup for this.=C2=A0</div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">Le mer. 15 mars 2023, 16:57, Alexander Kanavin &=
lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;=
 a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">devtool simply=
 isn&#39;t meant for recipes which pull multiple sources in<br>
SRC_URI. Also, we do not have a devtool maintainer :-/<br>
<br>
You can poke around its code to see if it can be addressed<br>
(easily-ish), but I suspect you have to write a different recipe for<br>
the &#39;myrepo&#39; item which can then be &#39;devtool&#39;-ed, and stage=
 the output<br>
into sysroot, e.g. classical oe-core &#39;build dependecy&#39; flow.<br>
<br>
Alex<br>
<br>
On Wed, 15 Mar 2023 at 16:53, Frederic Martinsons<br>
&lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">frederic.martinsons@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello again list,<br>
&gt;<br>
&gt; I continue my investigation on developing a rust project within<br>
&gt; openembedded environment. After discussion with some of you, I have a<=
br>
&gt; project (binary) which will use some custom library crates (and so<br>
&gt; these rely on other git repositories).<br>
&gt;<br>
&gt; In order to simply build the project I need to add this patch<br>
&gt; <a href=3D"https://patchwork.yoctoproject.org/project/oe-core/patch/20=
221030173815.10212-2-alex.kiernan@gmail.com/" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">https://patchwork.yoctoproject.org/project/oe-core/patch=
/20221030173815.10212-2-alex.kiernan@gmail.com/</a><br>
&gt; (with little modification to support uri like<br>
&gt; &quot;git://git@my_repo:7999/myproject.git&quot;)<br>
&gt;<br>
&gt; After that ports, the project was built successfully. Now I want to<br=
>
&gt; develop in it ;) and so I use devtool (like I do for python or C<br>
&gt; project) and I have another set issue.<br>
&gt; I get back to having cargo trying to clone these git repos during the<=
br>
&gt; build (which is forbidden since no network access is allowed except<br=
>
&gt; during the fetch).<br>
&gt;<br>
&gt; I search a little and it seems it is the externalsrc.bbclass which<br>
&gt; remove the git url in this line:<br>
&gt; <a href=3D"https://github.com/openembedded/openembedded-core/blob/mast=
er/meta/classes/externalsrc.bbclass#L76" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">https://github.com/openembedded/openembedded-core/blob/master=
/meta/classes/externalsrc.bbclass#L76</a><br>
&gt;<br>
&gt; I confirm that by issuing bitbake -e on my recipe and looking for<br>
&gt; SRC_URI modifications.<br>
&gt;<br>
&gt; In my recipe I have something like:<br>
&gt;<br>
&gt; | SRC_URI +=3D &quot; \<br>
&gt; |=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/aho-corasick/0.7.20=
" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/aho-corasick/0.=
7.20</a> \<br>
&gt; |=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/async-broadcast/0.5=
.1" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/async-broadca=
st/0.5.1</a> \<br>
&gt; |=C2=A0 =C2=A0 git://git@myserver:7999/myrepo.git;protocol=3Dssh;nobra=
nch=3D1;name=3Dmy-crate;destsuffix=3Dmy-crate<br>
&gt; | &quot;<br>
&gt; |=C2=A0 SRCREV_FORMAT .=3D &quot;_my-crate&quot;<br>
&gt; | SRCREV_my-crate =3D &quot;main&quot;<br>
&gt;<br>
&gt; And after a &quot;devtool modify&quot; , the git dependency disappears=
 ...<br>
&gt; looking at the externalsrc class, it seems pretty straightforward to<b=
r>
&gt; know why the url_data.type with &quot;git&quot; doesn&#39;t end in loc=
al_srcuri.<br>
&gt;<br>
&gt; I would like to have advice on this if possible, if someone has<br>
&gt; already encountered this use case in the past ?<br>
&gt;<br>
&gt; To my opinion, devtool should treat these SRC_URI alike but how can it=
<br>
&gt; make the difference with the primary git repository (the one which<br>
&gt; contains the top project) and the other git repositories ?<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#178582): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/178582" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1785=
82</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97630658=
/1686489" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/mt/97630658/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanav=
in@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kanavin@gmail.com</=
a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--0000000000001e905a05f6f28e61--

