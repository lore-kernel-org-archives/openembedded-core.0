Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C90C6FD1C
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 14:47:54 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.44793.1679496466338102929
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 07:47:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dAY4GuqY;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id br6so23740044lfb.11
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 07:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679496464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CAK08pSZKEUDspFNZqO2ha1MCp2mB3iI0RKsDV2lwS8=;
        b=dAY4GuqYgaDjjTHR39oTrKq6UfGwqobje9YdPVCz5tKTHDyNmhmm3yTNr6ozIrGPPN
         jf5v2F2dzjea9WsQcXmMwMSMvFKs9QmNQEf/a7g47l3LieNMtjNj1jVN0IUKOHaPzP41
         7xd84PRnqdBcadG5IINPWqmoY9HgkKMooxDLodBVocWO8/GhMKBNhDutvDV6n2IJOUcz
         WXBW/2+4U0t2kctj7fnp+ZPsZadBuPHel7kleVdbGlkSPx7++p9QmsvuCwMOmeLFxwNI
         GKL9k00VkVjqHs+7HoqhaNg4P1rbvey+Olarzsb4D8iS/IFmGTMnbdmstJEGwOJetbx0
         alnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679496464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CAK08pSZKEUDspFNZqO2ha1MCp2mB3iI0RKsDV2lwS8=;
        b=eJIcymVlDz8hNiq6KK/dIYG1MiFSaxc4wU5VBGs+RwbK4zH0GnukEVpUgCF1LaXF44
         xz2U7ZYko7dcVqoeRbGQotFDeqzQ2lt7ti5s6fDb60a/tY3AdNTTysl3hAn8gn+Z0da6
         nMOZoGmEez4Ilxs3RmeB0S2CHpsLE6N30u/dxsUuLJdPuEyNv3atWXNgaTLS3cy5PqYG
         VUrJ/xE2/gBCQxQztwxL7/SlxPWzO+Qk//XCXhrFwXbey97nnffIQiilFSagPh5wYKMY
         DYcfwKZgLhVXR4v+wwDbHbGxODSLmrBpqz1UM7Lb/h4SWFuLIKqog+TaRdmUXt1zJneZ
         zdPg==
X-Gm-Message-State: AO0yUKWuVpJ+qP07F/btgvW6RtU5dSQSwuR8GA6U9aOxQZratso2bv92
	phi8TEM1IjOCI0fgd+0rG1RHnFJB5reg+E4jajg=
X-Google-Smtp-Source: AK7set/YyPwKUV7gEGKcqytvCh8ehnZkOi20H9unqHcqny3efbBYeZ/R/leD2MRjVtQWOeg/UDlq5x0lVQSrgKB8Uwg=
X-Received: by 2002:a19:ee11:0:b0:4d5:ca42:aeec with SMTP id
 g17-20020a19ee11000000b004d5ca42aeecmr1977880lfb.12.1679496464250; Wed, 22
 Mar 2023 07:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAkeoOSGvNNQOq78-Nh4hqqX-C1nYWjM7uMH_S+ofbHhxEDw@mail.gmail.com>
 <CANNYZj82PHeV-Gp2M4nkD2KniggLr=pSNjS6dMBP_P8PEzEDkw@mail.gmail.com>
 <CA+cAker9mJbz5seV7OuOqP8AqvzWogrc-oBnvt79XyHDS58nxA@mail.gmail.com> <174CF21E177D19E0.11516@lists.openembedded.org>
In-Reply-To: <174CF21E177D19E0.11516@lists.openembedded.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Wed, 22 Mar 2023 15:47:32 +0100
Message-ID: <CA+cAkeohGO1F==7VHHVSC4ut800-eRKRFsEtKJmTcEM3Pm3xzA@mail.gmail.com>
Subject: Re: [OE-core] cargo, git dependencies and devtool
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org, 
	Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000273c1e05f77e3e6b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 14:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178947

--000000000000273c1e05f77e3e6b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I found a "real life" example of a crate that depends directly on another
crate via git :
https://gitlab.freedesktop.org/dbus/zbus/-/tree/main/zvariant

That's a demonstration of my current use cases and those exposed by Alex
Kiernan in
https://patchwork.yoctoproject.org/project/oe-core/patch/20221030173815.102=
12-2-alex.kiernan@gmail.com/

In the coming days (weeks maybe ?) I 'll submit a series with the above
mentioned patch, an example of a recipe
for zvariant (if I manage to) and the support of devtool for these kinds of
things.

Locally , for my professional use , I already have such a recipe and the
devtool support works.
So the work will be to write a correct recipe for this zvariant (which I
finally directly use in my project,
what a coincidence !), I guess I will have some trouble with the following
local dependency of zvariant:

zvariant_derive =3D { version =3D "=3D3.12.0", path =3D "../zvariant_derive=
" }

But I see what I manage to do in this regard.




Le jeu. 16 mars 2023, 17:09, Frederic Martinsons via lists.openembedded.org
<frederic.martinsons=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :

> I managed to get something working with little modification.
> I added a new variable in cargo_common.bbclass:
>
> # Contains a list of crate to be found via git protocol
> # that are in SRC_URI
> # This is useful when devtool'ing the main crate
> # and still patch the path of these dependencies
> # in cargo config file
> CARGO_GIT_DEPENDENCIES ?=3D ""
>
> Inside my recipe, I put my git repos in it and in externalsrc.bbclass
> I let those in local_srcuri.
>
> It seems to work for my needs but I still need to test more on poky maste=
r.
>
> Do you think such a method would be acceptable for being merged ?
>
> Note that it will not be useful (but harmless) if this patch
> <https://patchwork.yoctoproject.org/project/oe-core/patch/20221030173815.=
10212-2-alex.kiernan@gmail.com/> is
> not merged.
>
>
>
> On Wed, 15 Mar 2023 at 17:08, Fr=C3=A9d=C3=A9ric Martinsons <
> frederic.martinsons@gmail.com> wrote:
>
>> On thanks, will keep you posted if I found a working situation setup for
>> this.
>>
>> Le mer. 15 mars 2023, 16:57, Alexander Kanavin <alex.kanavin@gmail.com>
>> a =C3=A9crit :
>>
>>> devtool simply isn't meant for recipes which pull multiple sources in
>>> SRC_URI. Also, we do not have a devtool maintainer :-/
>>>
>>> You can poke around its code to see if it can be addressed
>>> (easily-ish), but I suspect you have to write a different recipe for
>>> the 'myrepo' item which can then be 'devtool'-ed, and stage the output
>>> into sysroot, e.g. classical oe-core 'build dependecy' flow.
>>>
>>> Alex
>>>
>>> On Wed, 15 Mar 2023 at 16:53, Frederic Martinsons
>>> <frederic.martinsons@gmail.com> wrote:
>>> >
>>> > Hello again list,
>>> >
>>> > I continue my investigation on developing a rust project within
>>> > openembedded environment. After discussion with some of you, I have a
>>> > project (binary) which will use some custom library crates (and so
>>> > these rely on other git repositories).
>>> >
>>> > In order to simply build the project I need to add this patch
>>> >
>>> https://patchwork.yoctoproject.org/project/oe-core/patch/20221030173815=
.10212-2-alex.kiernan@gmail.com/
>>> > (with little modification to support uri like
>>> > "git://git@my_repo:7999/myproject.git")
>>> >
>>> > After that ports, the project was built successfully. Now I want to
>>> > develop in it ;) and so I use devtool (like I do for python or C
>>> > project) and I have another set issue.
>>> > I get back to having cargo trying to clone these git repos during the
>>> > build (which is forbidden since no network access is allowed except
>>> > during the fetch).
>>> >
>>> > I search a little and it seems it is the externalsrc.bbclass which
>>> > remove the git url in this line:
>>> >
>>> https://github.com/openembedded/openembedded-core/blob/master/meta/clas=
ses/externalsrc.bbclass#L76
>>> >
>>> > I confirm that by issuing bitbake -e on my recipe and looking for
>>> > SRC_URI modifications.
>>> >
>>> > In my recipe I have something like:
>>> >
>>> > | SRC_URI +=3D " \
>>> > |    crate://crates.io/aho-corasick/0.7.20 \
>>> > |    crate://crates.io/async-broadcast/0.5.1 \
>>> > |    git://git@myserver
>>> :7999/myrepo.git;protocol=3Dssh;nobranch=3D1;name=3Dmy-crate;destsuffix=
=3Dmy-crate
>>> > | "
>>> > |  SRCREV_FORMAT .=3D "_my-crate"
>>> > | SRCREV_my-crate =3D "main"
>>> >
>>> > And after a "devtool modify" , the git dependency disappears ...
>>> > looking at the externalsrc class, it seems pretty straightforward to
>>> > know why the url_data.type with "git" doesn't end in local_srcuri.
>>> >
>>> > I would like to have advice on this if possible, if someone has
>>> > already encountered this use case in the past ?
>>> >
>>> > To my opinion, devtool should treat these SRC_URI alike but how can i=
t
>>> > make the difference with the primary git repository (the one which
>>> > contains the top project) and the other git repositories ?
>>> >
>>> >
>>> >
>>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178708):
> https://lists.openembedded.org/g/openembedded-core/message/178708
> Mute This Topic: https://lists.openembedded.org/mt/97630658/6213388
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> frederic.martinsons@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000273c1e05f77e3e6b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto">I found a &quot;real life&quot; example =
of a crate that depends directly on another crate via git : <a href=3D"http=
s://gitlab.freedesktop.org/dbus/zbus/-/tree/main/zvariant" target=3D"_blank=
">https://gitlab.freedesktop.org/dbus/zbus/-/tree/main/zvariant</a><div dir=
=3D"auto"><br></div><div dir=3D"auto">That&#39;s a demonstration of my curr=
ent use cases and those exposed by Alex Kiernan in=C2=A0</div><div dir=3D"a=
uto"><a href=3D"https://patchwork.yoctoproject.org/project/oe-core/patch/20=
221030173815.10212-2-alex.kiernan@gmail.com/">https://patchwork.yoctoprojec=
t.org/project/oe-core/patch/20221030173815.10212-2-alex.kiernan@gmail.com/<=
/a><br></div><div dir=3D"auto"><br></div><div>In the coming days (weeks may=
be ?) I &#39;ll submit a series with the above mentioned patch, an example =
of a recipe</div><div>for zvariant=C2=A0(if I manage to) and the support of=
 devtool for these kinds of things.</div><div><br></div><div>Locally , for =
my professional use , I already have such a recipe and the devtool support =
works.</div><div>So the work will be to write a correct recipe for this zva=
riant (which I finally directly use in my project,</div><div>what a coincid=
ence !), I guess I will have some trouble with the following local dependen=
cy of zvariant:</div><div><pre class=3D"gmail-code gmail-highlight" lang=3D=
"toml"><span lang=3D"toml" class=3D"gmail-line" id=3D"gmail-LC30"><span cla=
ss=3D"gmail-nn">zvariant_derive</span> <span class=3D"gmail-o">=3D</span> <=
span class=3D"gmail-p">{</span> <span class=3D"gmail-py">version</span> <sp=
an class=3D"gmail-p">=3D</span> <span class=3D"gmail-py">&quot;</span><span=
 class=3D"gmail-p">=3D</span><span class=3D"gmail-mf">3.12</span><span clas=
s=3D"err">.</span><span class=3D"gmail-mi">0</span><span class=3D"gmail-s">=
&quot;, path =3D &quot;</span><span class=3D"err">../zvariant_derive</span>=
<span class=3D"gmail-s">&quot; }</span></span>
<span lang=3D"toml" class=3D"gmail-line" id=3D"gmail-LC31"></span>
</pre><pre class=3D"gmail-code gmail-highlight" lang=3D"toml"><font face=3D=
"arial, sans-serif">But I see what I manage to do in this regard.</font></p=
re></div><div><br></div><div><br></div></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">Le jeu. 16 mars 2023, 17:09, F=
rederic Martinsons via <a href=3D"http://lists.openembedded.org" target=3D"=
_blank">lists.openembedded.org</a> &lt;frederic.martinsons=3D<a href=3D"mai=
lto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.ope=
nembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr">I managed to get something worki=
ng with little modification.<div>I added a new variable in cargo_common.bbc=
lass:</div><div><br></div><div># Contains a list of crate to be found via g=
it protocol <br># that are in SRC_URI<br># This is useful when devtool&#39;=
ing the main crate<br># and still patch the path of these dependencies<br>#=
 in cargo config file<br>CARGO_GIT_DEPENDENCIES ?=3D &quot;&quot;<br></div>=
<div><br></div><div>Inside my recipe, I put my git repos in it and in exter=
nalsrc.bbclass</div><div>I let those in local_srcuri.</div><div><br></div><=
div>It seems to work for my needs but I still need to test more on poky mas=
ter.</div><div><br></div><div>Do you think such a method would be acceptabl=
e for being merged ?</div><div><br></div><div>Note that it will not be usef=
ul=C2=A0(but harmless) if=C2=A0<a href=3D"https://patchwork.yoctoproject.or=
g/project/oe-core/patch/20221030173815.10212-2-alex.kiernan@gmail.com/" rel=
=3D"noreferrer" target=3D"_blank">this patch</a>=C2=A0is not merged.</div><=
div>=C2=A0</div><div><br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed, 15 Mar 2023 at 17:08, Fr=C3=A9d=C3=
=A9ric Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" rel=
=3D"noreferrer" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
auto">On thanks, will keep you posted if I found a working situation setup =
for this.=C2=A0</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Le mer. 15 mars 2023, 16:57, Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com" rel=3D"noreferrer" target=3D"_blank">ale=
x.kanavin@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">devtool simply isn&#39;t meant for recipes=
 which pull multiple sources in<br>
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
&lt;<a href=3D"mailto:frederic.martinsons@gmail.com" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt; wrote:<br>
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
221030173815.10212-2-alex.kiernan@gmail.com/" rel=3D"noreferrer noreferrer =
noreferrer" target=3D"_blank">https://patchwork.yoctoproject.org/project/oe=
-core/patch/20221030173815.10212-2-alex.kiernan@gmail.com/</a><br>
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
er/meta/classes/externalsrc.bbclass#L76" rel=3D"noreferrer noreferrer noref=
errer" target=3D"_blank">https://github.com/openembedded/openembedded-core/=
blob/master/meta/classes/externalsrc.bbclass#L76</a><br>
&gt;<br>
&gt; I confirm that by issuing bitbake -e on my recipe and looking for<br>
&gt; SRC_URI modifications.<br>
&gt;<br>
&gt; In my recipe I have something like:<br>
&gt;<br>
&gt; | SRC_URI +=3D &quot; \<br>
&gt; |=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/aho-corasick/0.7.20=
" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/aho-=
corasick/0.7.20</a> \<br>
&gt; |=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/async-broadcast/0.5=
.1" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">crates.io/as=
ync-broadcast/0.5.1</a> \<br>
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
&gt; <br>
&gt;<br>
</blockquote></div>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#178708): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/178708" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/178708</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97630658/6213=
388" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/97630658/6213388</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" rel=3D"noreferrer" target=3D"_blank">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:frederic.martin=
sons@gmail.com" rel=3D"noreferrer" target=3D"_blank">frederic.martinsons@gm=
ail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000273c1e05f77e3e6b--

