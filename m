Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA7BC433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Oct 2021 13:10:14 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web08.76.1633439413552404990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 06:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i+8gAr5x;
 spf=pass (domain: gmail.com, ip: 209.85.222.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id y3so9414339uar.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 06:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yq2truCoicUuhVCLLJrOi05zucAv8iehyTGq8Z+qHEo=;
        b=i+8gAr5x7g6WWARMhxi/P4dyFmps1vjaPo+q6jT9QAc9zRFHweVkTyYwjinfHTqI9I
         H0ByfOt3U/zKmUDHeNZhd1oVzRhyrm60cOvZr2LncqyfeRj7oq7KHu9NJK7W/0drdpNi
         OzMmvdnHCJnIbG+23+eNn5h6gDOYuYzkZoDx7BC+9uaHGX13Z/LChNi4/0/7a166Gd7b
         fvy2TKIwl/EyLOjVhuZkiCcl63ijt4+JjttGCwjjQNMYqn5FAZVWAL8Vm6NJylpGuQYQ
         PeWeeaeXBcXx2tWhbW+jEgK+9jd69ehrdKN6ijMU/1Fg44HsPH0wXIzWCSTVE6ezrE5d
         rA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yq2truCoicUuhVCLLJrOi05zucAv8iehyTGq8Z+qHEo=;
        b=wutD9/XKEw6cVD7EI4mYgJq7LQDenVSTwrhpn0dyrY2UuFdXreS2N4YxWXyGTK5VVm
         AJKHlziPQzEpByE4Eqf85WSOQYm+nUsME2UMXAVVjec3lYiy+jnNMzFjDJcEbkhgNcG+
         xTTeiytJj8l7XxU2FtA5UTh/Xn5mdmsVCSmuqZST4OdJTzN7jYrV6MI+BBHvyp2pTNei
         bCypZOSZoEpOmgK4NKyX26Fl5/e8yxMwbU4s37pdbKmn9E9l77SWcQz7povMeqVuTmly
         OA6yzd8BlKQEzIYRYI4IamhXfHO+yY3ZQnD6mrESp9dsdbW7H540lJDaDGdkKogZc5cr
         DPew==
X-Gm-Message-State: AOAM531SDyKny1+xaVkx9fQzGCgna3a6YS7qrjvN6WUZbZTissTW1nKc
	yezqaUq/R5blT5aG7WEliWEKcEL14fsNhT1l4w0=
X-Google-Smtp-Source: 
 ABdhPJyfvof5MhiBYLoVCTWtRLk5JjSWhsiUef4BWJLhZ/tpHAOOaM0iVGhzo4c7x61agGOrbknjmnbP3mhmNmy2bJo=
X-Received: by 2002:ab0:3c93:: with SMTP id a19mr9797330uax.93.1633439412646;
 Tue, 05 Oct 2021 06:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <37b61ef2-5ea9-7e90-75fe-50cc662d9124@weidmueller.com>
 <6318d76222b819d3a165d405fc48dbcbadf29085.camel@linuxfoundation.org>
 <50d4d79f-a7cd-fd0a-0c6d-597b6dc4ca6a@weidmueller.com>
In-Reply-To: <50d4d79f-a7cd-fd0a-0c6d-597b6dc4ca6a@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 5 Oct 2021 15:10:00 +0200
Message-ID: 
 <CANNYZj8Fns4xWre3_ajv-5QADpCi0f+WS2wRXCKXezOgj5fhzg@mail.gmail.com>
Subject: Re: [OE-core] Improve npm support to run build scripts
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f3f5d105cd9abfa4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Oct 2021 13:10:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156646

--000000000000f3f5d105cd9abfa4
Content-Type: text/plain; charset="UTF-8"

I think the supposed workflow with the new npm.class was to use 'devtool
create' which would run some npm magic to to create a single recipe that
has all of the npm-fetched dependencies inside SRC_URI. Have you tried that?

A layer with thousands of recipes seems totally intractable.

Alex

On Tue, 5 Oct 2021 at 14:48, Stefan Herbrechtsmeier <
stefan.herbrechtsmeier-oss@weidmueller.com> wrote:

> Hi Richard,
>
> Am 05.10.2021 um 13:09 schrieb Richard Purdie:
> > Thanks for bring this up, I've been wondering on the status of our npm
> support.
>
> Do you know any npm users?
>
> > On Tue, 2021-10-05 at 12:04 +0200, Stefan Herbrechtsmeier wrote:
> >> I must improve the npm support for our use cases but need some
> >> fundamental decisions to proceed. I need to build express and angular
> >> applications from git repositories.
> >>
> >> I have the following changes in my pipeline until now:
> >> - Support npm packages with missing execute mode for directories
> >> - Reduce command calls in npm run
> >> - Add support for local tarball and local link sources
> >> - Rework crunch license to recognize more variants
> >> - Move known license checksums to CSV file
> >> - Pass README as fallback to guess license if a license is missing
> >> - Add support to pass build arguments to npm install
> >> - Add support to run build scripts with native packages
> >> - Parallelize the populate of the npm cache
> >>
> >> The build (install) of npm packages leads to problems because of old
> >> versions in the dependency tree. For example, older versions of packages
> >> are incompatible with the Node.js version and older versions of node-gyp
> >> require Python 2.
> >
> > Hopefully over time the python2 issue should reduce and fade at least.
> The
> > node.js version is trickier.
>
> The current implementation works like an project with embedded external
> dependencies. I both cases I have to patch the embedded dependencies or
> replace them with external DEPENDS.
>
> >> I see three solutions to integrate npm packages:
> >> - Build npm packages from the npm project outside of OE and only fetch
> >> the data.
> >> - Fork the npm project repository and fix everything inside the fork.
> >> Use the fork direct or create patches from the fork to build inside OE.
> >> - Create recipes per project and incompatible version to fix everything
> >> in OE and reduce redundancy.
> >>
> >> The last solution keeps everything in OE and benefit from the existing
> >> OE functions like download proxy as well as license, CVE and version
> >> check. But it increases the initial costs and makes only sense if there
> >> is an interest in an meta-nodejs layer.
> >
> > The latter solution sounds like the only really viable option from an OE
> > perspective since we do need the proxy/CVE/license handling, it is a
> huge part
> > of our value and without it, it isn't really OE.
>
> The problem are the many different packages. An Angular project could
> have more than 1000 different project. Thereby some dependencies only
> differ in the version or needed only for development like a development
> server or a unit test framework.
>
> > Creating a meta-nodejs layer isn't an issue if there are people willing
> to look
> > after it.
>
> Is a layer with more more than 1000 recipes thinkable?
>
> Regards
>    Stefan
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156644):
> https://lists.openembedded.org/g/openembedded-core/message/156644
> Mute This Topic: https://lists.openembedded.org/mt/86089523/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000f3f5d105cd9abfa4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think the supposed workflow with the new npm.class =
was to use &#39;devtool create&#39; which would run some npm magic to to cr=
eate a single recipe that has all of the npm-fetched dependencies inside SR=
C_URI. Have you tried that?</div><div><br></div><div>A layer with thousands=
 of recipes seems totally intractable.<br></div><div><br></div><div>Alex<br=
></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 5 Oct 2021 at 14:48, Stefan Herbrechtsmeier &lt;<a href=3D"m=
ailto:stefan.herbrechtsmeier-oss@weidmueller.com">stefan.herbrechtsmeier-os=
s@weidmueller.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Hi Richard,<br>
<br>
Am 05.10.2021 um 13:09 schrieb Richard Purdie:<br>
&gt; Thanks for bring this up, I&#39;ve been wondering on the status of our=
 npm support.<br>
<br>
Do you know any npm users?<br>
<br>
&gt; On Tue, 2021-10-05 at 12:04 +0200, Stefan Herbrechtsmeier wrote:<br>
&gt;&gt; I must improve the npm support for our use cases but need some<br>
&gt;&gt; fundamental decisions to proceed. I need to build express and angu=
lar<br>
&gt;&gt; applications from git repositories.<br>
&gt;&gt;<br>
&gt;&gt; I have the following changes in my pipeline until now:<br>
&gt;&gt; - Support npm packages with missing execute mode for directories<b=
r>
&gt;&gt; - Reduce command calls in npm run<br>
&gt;&gt; - Add support for local tarball and local link sources<br>
&gt;&gt; - Rework crunch license to recognize more variants<br>
&gt;&gt; - Move known license checksums to CSV file<br>
&gt;&gt; - Pass README as fallback to guess license if a license is missing=
<br>
&gt;&gt; - Add support to pass build arguments to npm install<br>
&gt;&gt; - Add support to run build scripts with native packages<br>
&gt;&gt; - Parallelize the populate of the npm cache<br>
&gt;&gt;<br>
&gt;&gt; The build (install) of npm packages leads to problems because of o=
ld<br>
&gt;&gt; versions in the dependency tree. For example, older versions of pa=
ckages<br>
&gt;&gt; are incompatible with the Node.js version and older versions of no=
de-gyp<br>
&gt;&gt; require Python 2.<br>
&gt; <br>
&gt; Hopefully over time the python2 issue should reduce and fade at least.=
 The<br>
&gt; node.js version is trickier.<br>
<br>
The current implementation works like an project with embedded external <br=
>
dependencies. I both cases I have to patch the embedded dependencies or <br=
>
replace them with external DEPENDS.<br>
<br>
&gt;&gt; I see three solutions to integrate npm packages:<br>
&gt;&gt; - Build npm packages from the npm project outside of OE and only f=
etch<br>
&gt;&gt; the data.<br>
&gt;&gt; - Fork the npm project repository and fix everything inside the fo=
rk.<br>
&gt;&gt; Use the fork direct or create patches from the fork to build insid=
e OE.<br>
&gt;&gt; - Create recipes per project and incompatible version to fix every=
thing<br>
&gt;&gt; in OE and reduce redundancy.<br>
&gt;&gt;<br>
&gt;&gt; The last solution keeps everything in OE and benefit from the exis=
ting<br>
&gt;&gt; OE functions like download proxy as well as license, CVE and versi=
on<br>
&gt;&gt; check. But it increases the initial costs and makes only sense if =
there<br>
&gt;&gt; is an interest in an meta-nodejs layer.<br>
&gt; <br>
&gt; The latter solution sounds like the only really viable option from an =
OE<br>
&gt; perspective since we do need the proxy/CVE/license handling, it is a h=
uge part<br>
&gt; of our value and without it, it isn&#39;t really OE.<br>
<br>
The problem are the many different packages. An Angular project could <br>
have more than 1000 different project. Thereby some dependencies only <br>
differ in the version or needed only for development like a development <br=
>
server or a unit test framework.<br>
<br>
&gt; Creating a meta-nodejs layer isn&#39;t an issue if there are people wi=
lling to look<br>
&gt; after it.<br>
<br>
Is a layer with more more than 1000 recipes thinkable?<br>
<br>
Regards<br>
=C2=A0 =C2=A0Stefan<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#156644): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/156644" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/156644</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86089523/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86089523/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000f3f5d105cd9abfa4--

