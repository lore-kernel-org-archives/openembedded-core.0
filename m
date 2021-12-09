Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5CBDC433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 14:08:16 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web08.11749.1639058895483742477
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 06:08:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AsZMR75V;
 spf=pass (domain: gmail.com, ip: 209.85.221.171,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f171.google.com with SMTP id h1so3891240vkh.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 06:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/84/hm0Fi1IIerjzxIaJvHHO3CUPuztX2kM01/zS1Hk=;
        b=AsZMR75VVyiFeLFoAGQEzLwkX7/xwGa83xP7o8ljqpKSHQhxMsdsgowXn+OiMyEC1m
         nR4CLPolX9Wehn5y+iXvuegOKNCD5QAxr5JCcF+NSN00uWbYP7/7jUc4dmgwHM8j14ru
         KHpZXckRT7/Ro/SbmICT7NRRNMIHuDOeWpMMDod5mRZ+aOwrAK8g2jWLfBDv3HwItOBf
         r26plMQEdqCnF8p9AGzmPY1x9OGSobLGbAjFharSTmohwfs809+dh+PIFPKOxPQ/k6Zx
         iq85Q79IgdyUgM9nEzf8NedyzW3FlJGjV+cl2EB/NzR1Ulf1dbApw23LEdC9YCBWOBoT
         t4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/84/hm0Fi1IIerjzxIaJvHHO3CUPuztX2kM01/zS1Hk=;
        b=Q5tcOGCGrSobBrlxS67hUgI0s2WE6KHnOuWvPVPn2wg6s8eiP8l6xm78fOiiyLrHSG
         kffPZRFESzJCjOIPImB9OCwOpbUUjc+rHtj7KX3vvRROpnu8UDUAdXen6LUaGhF5/fcR
         pedtGxkQphEalCv/PJtsiIjDOYNgQ5Xa3sHE7RvusxDBAC766rCZph4abKdXLBc9Ezml
         dK65ojN3ricvzDbGt//U5cKm2zj1VggYS2+OpFFBq8K0UGE9r7exF/B3rqGaAflECG6d
         Zt9HO+4u0vaiY7iovCXp4KZqjUNiB7vLY+Vf37XYEVvh5OtZvtfW0UCSN4mX9SzMdzaX
         o1Ew==
X-Gm-Message-State: AOAM532EVGzILbXlpudRtvbvJugQrRrz4HYcULvmf66RWal59udlE0m8
	iriOqjuG/Y25gIYC0lhqvlQKrqIQgSxgoDNBFRw=
X-Google-Smtp-Source: 
 ABdhPJzxCOchwr7kLX41BF7O/9oHvC3j7ijJ05xAGykDuWwUT24b1LLvaNkNvmc9WL5w3eKAZRK9sN0/DfV711DFxB4=
X-Received: by 2002:a05:6122:c6f:: with SMTP id
 i47mr9395980vkr.20.1639058894591;
 Thu, 09 Dec 2021 06:08:14 -0800 (PST)
MIME-Version: 1.0
References: <20211208215947.1979470-1-alex@linutronix.de>
 <20211208215947.1979470-5-alex@linutronix.de>
 <2b5536624c6324dd6f73dd6fa3d53e05c33eb64f.camel@linuxfoundation.org>
 <AM9PR09MB46422CD393A3298518687FF7A8709@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB46422CD393A3298518687FF7A8709@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Dec 2021 15:08:02 +0100
Message-ID: 
 <CANNYZj8JP0J5WeNw7h3qgh1kKCMFpoUDC3kVW-nsnFTnhzyH_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/29] serf: mark patches as inappropriate for
 upstream submission
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>, Ross Burton <ross@burtonini.com>
Content-Type: multipart/alternative; boundary="0000000000002d9ad105d2b723a5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 14:08:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159450

--0000000000002d9ad105d2b723a5
Content-Type: text/plain; charset="UTF-8"

I think we only have a single doc that needs to be updated first:

https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status

The question is, how? Presumably, I need to make some kind of official
proposal to OE organization, and not just edit the wiki without asking?

Alex

On Thu, 9 Dec 2021 at 14:56, Konrad Weihmann <kweihmann@outlook.com> wrote:

>
>
> On 09.12.21 14:45, Richard Purdie wrote:
> > On Wed, 2021-12-08 at 22:59 +0100, Alexander Kanavin wrote:
> >> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> >> ---
> >>   .../0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch   | 3 ++-
> >>   ...p.creating.directories.without.sandbox-install.prefix.patch | 3 ++-
> >>   2 files changed, 4 insertions(+), 2 deletions(-)
> >>
> >> diff --git
> a/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
> b/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
> >> index e6172ef5aa..5b8fb70639 100644
> >> ---
> a/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
> >> +++
> b/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
> >> @@ -6,7 +6,8 @@ Subject: [PATCH] buckets/ssl_buckets.c: do not use
> ERR_GET_FUNC
> >>   Upstream removed it in
> >>   https://github.com/openssl/openssl/pull/16004
> >>
> >> -Upstream-Status: Pending
> >> +Upstream is defunct: last release in 2015, last commit in 2019.
> >> +Upstream-Status: Inappropriate [no upstream]
> >>   Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> >>   ---
> >>    buckets/ssl_buckets.c | 3 +--
> >> diff --git
> a/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
> b/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
> >> index 91640d6044..cf00dbf5ac 100644
> >> ---
> a/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
> >> +++
> b/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
> >> @@ -31,7 +31,8 @@ ERROR: scons install execution failed.
> >>     and the installed paths (including the paths inside libserf*.pc)
> >>     look correct
> >>
> >> -Upstream-Status: Pending
> >> +Upstream is defunct: last release in 2015, last commit in 2019
> >> +Upstream-Status: Inappropriate [no upstream]
> >>
> >>   Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >>
> >
> > I'm still not convinced this is the right thing to do. I appreciate what
> the
> > docs say but I also think we may need to evolve.
> >
> > Let's imagine we do have an "Inactive-Upstream" status for a minute and
> this
> > patch changes to:
> >
> > Upstream-Status: Inactive-Upstream [last release 2015, last commit 2019]
> >
> > If you now happen to be changing the recipe due to a new release, this
> is going
> > to trigger some kind of thought/action by seeing that status in that we
> might
> > now be able to upstream the patches. If it just says "Inappropriate", it
> won't
> > trigger the response we'd like.
> >
> > We're also going to eventually end up with a whole pile of
> "Inappropriate"
> > patches, it may be useful to keep an open mind on whether any
> subdivision of
> > those would be helpful.
> >
> > Does this make sense to anyone else?
>
> It would makes sense, but then the support and the docs has to
> backported again, otherwise cherry-picking won't be easy for older
> releases. But yeah I'm with you that Inappropriate looks odd in this
> context - still this is stated in the docs, we always refer to, so a doc
> update needs to come in first IMO
>
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#159448):
> https://lists.openembedded.org/g/openembedded-core/message/159448
> > Mute This Topic: https://lists.openembedded.org/mt/87599630/3647476
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> kweihmann@outlook.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--0000000000002d9ad105d2b723a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think we only have a single doc that needs to be up=
dated first:</div><div><br></div><div><a href=3D"https://www.openembedded.o=
rg/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstr=
eam-Status">https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelin=
es#Patch_Header_Recommendations:_Upstream-Status</a></div><div><br></div><d=
iv>The question is, how? Presumably, I need to make some kind of official p=
roposal to OE organization, and not just edit the wiki without asking?</div=
><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Thu, 9 Dec 2021 at 14:56, Konrad Weih=
mann &lt;<a href=3D"mailto:kweihmann@outlook.com">kweihmann@outlook.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 09.12.21 14:45, Richard Purdie wrote:<br>
&gt; On Wed, 2021-12-08 at 22:59 +0100, Alexander Kanavin wrote:<br>
&gt;&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutr=
onix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0.../0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC=
.patch=C2=A0 =C2=A0| 3 ++-<br>
&gt;&gt;=C2=A0 =C2=A0...p.creating.directories.without.sandbox-install.pref=
ix.patch | 3 ++-<br>
&gt;&gt;=C2=A0 =C2=A02 files changed, 4 insertions(+), 2 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-support/serf/serf/0001-buckets-ssl_bucke=
ts.c-do-not-use-ERR_GET_FUNC.patch b/meta/recipes-support/serf/serf/0001-bu=
ckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch<br>
&gt;&gt; index e6172ef5aa..5b8fb70639 100644<br>
&gt;&gt; --- a/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do=
-not-use-ERR_GET_FUNC.patch<br>
&gt;&gt; +++ b/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do=
-not-use-ERR_GET_FUNC.patch<br>
&gt;&gt; @@ -6,7 +6,8 @@ Subject: [PATCH] buckets/ssl_buckets.c: do not use=
 ERR_GET_FUNC<br>
&gt;&gt;=C2=A0 =C2=A0Upstream removed it in<br>
&gt;&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/openssl/openssl/pull/160=
04" rel=3D"noreferrer" target=3D"_blank">https://github.com/openssl/openssl=
/pull/16004</a><br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt; -Upstream-Status: Pending<br>
&gt;&gt; +Upstream is defunct: last release in 2015, last commit in 2019.<b=
r>
&gt;&gt; +Upstream-Status: Inappropriate [no upstream]<br>
&gt;&gt;=C2=A0 =C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto=
:alex@linutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt;&gt;=C2=A0 =C2=A0---<br>
&gt;&gt;=C2=A0 =C2=A0 buckets/ssl_buckets.c | 3 +--<br>
&gt;&gt; diff --git a/meta/recipes-support/serf/serf/SConstruct.stop.creati=
ng.directories.without.sandbox-install.prefix.patch b/meta/recipes-support/=
serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.pref=
ix.patch<br>
&gt;&gt; index 91640d6044..cf00dbf5ac 100644<br>
&gt;&gt; --- a/meta/recipes-support/serf/serf/SConstruct.stop.creating.dire=
ctories.without.sandbox-install.prefix.patch<br>
&gt;&gt; +++ b/meta/recipes-support/serf/serf/SConstruct.stop.creating.dire=
ctories.without.sandbox-install.prefix.patch<br>
&gt;&gt; @@ -31,7 +31,8 @@ ERROR: scons install execution failed.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0and the installed paths (including the paths in=
side libserf*.pc)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0look correct<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt; -Upstream-Status: Pending<br>
&gt;&gt; +Upstream is defunct: last release in 2015, last commit in 2019<br=
>
&gt;&gt; +Upstream-Status: Inappropriate [no upstream]<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;=C2=A0 =C2=A0Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Mart=
in.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt; <br>
&gt; I&#39;m still not convinced this is the right thing to do. I appreciat=
e what the<br>
&gt; docs say but I also think we may need to evolve.<br>
&gt; <br>
&gt; Let&#39;s imagine we do have an &quot;Inactive-Upstream&quot; status f=
or a minute and this<br>
&gt; patch changes to:<br>
&gt; <br>
&gt; Upstream-Status: Inactive-Upstream [last release 2015, last commit 201=
9]<br>
&gt; <br>
&gt; If you now happen to be changing the recipe due to a new release, this=
 is going<br>
&gt; to trigger some kind of thought/action by seeing that status in that w=
e might<br>
&gt; now be able to upstream the patches. If it just says &quot;Inappropria=
te&quot;, it won&#39;t<br>
&gt; trigger the response we&#39;d like.<br>
&gt; <br>
&gt; We&#39;re also going to eventually end up with a whole pile of &quot;I=
nappropriate&quot;<br>
&gt; patches, it may be useful to keep an open mind on whether any subdivis=
ion of<br>
&gt; those would be helpful.<br>
&gt; <br>
&gt; Does this make sense to anyone else?<br>
<br>
It would makes sense, but then the support and the docs has to <br>
backported again, otherwise cherry-picking won&#39;t be easy for older <br>
releases. But yeah I&#39;m with you that Inappropriate looks odd in this <b=
r>
context - still this is stated in the docs, we always refer to, so a doc <b=
r>
update needs to come in first IMO<br>
<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Richard<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#159448): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/159448" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/159448</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87599630=
/3647476" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/87599630/3647476</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:kweihmann@outlook.com=
" target=3D"_blank">kweihmann@outlook.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div>

--0000000000002d9ad105d2b723a5--

