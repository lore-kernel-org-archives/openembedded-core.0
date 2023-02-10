Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A519C05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 00:18:22 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.911.1675988295483964274
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 16:18:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VGveFQ1M;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id g2so4482332ybk.8
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 16:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M4v0d3/fxEtUW/tplqHhvFbrXeO4fWgAG8rpV/GmjGI=;
        b=VGveFQ1My/bPXa81YoN5kXHp57PVkAC0QwkDP9RbD3CTgUlDWRM2eJo5SDnDy6SnYH
         m3y7jJvDaBcIAPlT9tuEdS4tGE9FRTe1yXLiwnISX1nCT6e+X6VCTzLOAsfQy1BQP5Fl
         XlLZO37xmhyAFivInKYHjhznSlJy47MHzSOkCXJQDyH7mwNScg/qA8VqK4LspF6rhRRa
         tPDCWEA5ezLzt6mcLXmlYGSAVKJXxZX/FLKyP0AFI2i2W1lC09EwUtNsT07w3SAk3iln
         8f3vCfzFPIL/Foy4XsoYAudwMkIIJlJM19l/r/B7715jAwGTRtCSF1K0pqCAayAIvF/K
         6XSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M4v0d3/fxEtUW/tplqHhvFbrXeO4fWgAG8rpV/GmjGI=;
        b=vXFinls2ChRH9IFU9IFWSbTushfmiTcJLLO34krZ7WcGcukFZSnqP+gldD9NSLVjSc
         tTet3dPRpVXNT0PT16OVx8x68Ny/Z2GsTpdSv9C8Q3hALDqQ6PB97OPtgsAOLaWISJ01
         1hBsZCgZE3rCeycBthp304WPtEqXh23qRrd4QFGv+R60j3/W6pKRy1WoRFLYk8h56VLb
         JQjXcNVaS9Ul+kYHb/wOeYbHWro/jekD/C4Z86x+o4YcC28t9uQnCHIF9Iwhz4Cea6m1
         +3yhrcEyZ5g8iRhgZesO6AwHaOoqlBT/NdAfNalhSJfcINxcXRF+uzpYdvOC+jc7z0C8
         e4Sw==
X-Gm-Message-State: AO0yUKVLqmwXqi3EhnK/gQIoIAMroRhFigvC9l99AKmYONriE1syv4pa
	9B4FPEONng0eY3FmSg9ubH62HljHrSVlOQ7zDtY=
X-Google-Smtp-Source: AK7set/hiDx08PG92ue1uRHgcNBA8WfpDiJh3Igpv78QVFzSyWTM2n1LUQPR3nz2ghAOB4SdKR5G9tqfBxd53hThq/Y=
X-Received: by 2002:a5b:2c5:0:b0:8af:5125:57d8 with SMTP id
 h5-20020a5b02c5000000b008af512557d8mr1405346ybp.358.1675988294485; Thu, 09
 Feb 2023 16:18:14 -0800 (PST)
MIME-Version: 1.0
References: <2E74248C-B3ED-4923-8731-DB10E38313F1@arm.com> <CAMKF1sq0NQYXkje-hcA6sTciMYUKC8VosJtUvP4kUn5LfX3ZoQ@mail.gmail.com>
In-Reply-To: <CAMKF1sq0NQYXkje-hcA6sTciMYUKC8VosJtUvP4kUn5LfX3ZoQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 9 Feb 2023 16:18:03 -0800
Message-ID: <CANx9H-DiwmEXBWc4hR28J=tKB00QUOyHJ4uLDbEiZuXPMxQSHw@mail.gmail.com>
Subject: Re: [OE-core] DNF5
To: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f0cb5905f44d6ef1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 00:18:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176971

--000000000000f0cb5905f44d6ef1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 9, 2023 at 10:15 AM Khem Raj <raj.khem@gmail.com> wrote:

> Is there some reading material for quick highlights of dnf5 and its futur=
e
> ?
>

The Fedora change wiki has some important caveats:
https://fedoraproject.org/wiki/Changes/ReplaceDnfWithDnf5

The above references this:
https://dnf5.readthedocs.io/en/latest/dnf5.8.html

This is probably the best source of what is planned:
https://github.com/rpm-software-management/dnf5/milestone/1

Rather long thread about status:
https://lists.fedoraproject.org/archives/list/devel@lists.fedoraproject.org=
/thread/DG7VBHCWGIQKN3QC3HHF2IZ4JL66ZO6Y/


> On Thu, Feb 9, 2023 at 4:05 AM Ross Burton <ross.burton@arm.com> wrote:
> >
> > Hi,
> >
> > At FOSDEM there were was a session about DNF 5 and someone (sorry if
> you=E2=80=99re reading this, I can=E2=80=99t remember your name) came to =
the stand to ask
> if we=E2=80=99ve looked at it.  I was aware of a DNF replacement but wasn=
=E2=80=99t aware
> that it had actually started making releases.
> >
> > I=E2=80=99ve just pushed a branch to poky-contrib:ross/dnf5 which adds =
recipes
> for DNF5 and any new dependencies (it also needs meta-oe right now, as so=
me
> dependencies are there).  It builds a dnf-native, but the blocker is that
> it doesn=E2=80=99t yet implement =E2=80=94repofrompath to add a repositor=
y without a
> corresponding configuration file, which is what we use at rootfs time.  W=
e
> can probably work around that by writing a temporary repo file, or just
> implement the feature upstream.
> >
> > If anyone is interested in helping the port to DNF5 then your help woul=
d
> be appreciated!
> >
> > Ross
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176965):
> https://lists.openembedded.org/g/openembedded-core/message/176965
> Mute This Topic: https://lists.openembedded.org/mt/96851390/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f0cb5905f44d6ef1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Feb 9, 2023 at 10:15 AM Khem Raj &lt;<a href=3D"mai=
lto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,2=
04,204)">Is there some reading material for quick highlights of dnf5 and it=
s future ?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">The Fedora chang=
e wiki has some important caveats:</div><div dir=3D"auto"><div><a href=3D"h=
ttps://fedoraproject.org/wiki/Changes/ReplaceDnfWithDnf5">https://fedorapro=
ject.org/wiki/Changes/ReplaceDnfWithDnf5</a></div><br></div><div dir=3D"aut=
o">The above references this:</div><div dir=3D"auto"><div><a href=3D"https:=
//dnf5.readthedocs.io/en/latest/dnf5.8.html">https://dnf5.readthedocs.io/en=
/latest/dnf5.8.html</a></div><br></div><div dir=3D"auto">This is probably t=
he best source of what is planned:</div><div dir=3D"auto"><div><a href=3D"h=
ttps://github.com/rpm-software-management/dnf5/milestone/1">https://github.=
com/rpm-software-management/dnf5/milestone/1</a></div><br></div><div dir=3D=
"auto">Rather long thread about status:</div><div dir=3D"auto"><div><a href=
=3D"https://lists.fedoraproject.org/archives/list/devel@lists.fedoraproject=
.org/thread/DG7VBHCWGIQKN3QC3HHF2IZ4JL66ZO6Y/">https://lists.fedoraproject.=
org/archives/list/devel@lists.fedoraproject.org/thread/DG7VBHCWGIQKN3QC3HHF=
2IZ4JL66ZO6Y/</a></div><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;pad=
ding-left:1ex;border-left-color:rgb(204,204,204)"><br>
On Thu, Feb 9, 2023 at 4:05 AM Ross Burton &lt;<a href=3D"mailto:ross.burto=
n@arm.com" target=3D"_blank">ross.burton@arm.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; At FOSDEM there were was a session about DNF 5 and someone (sorry if y=
ou=E2=80=99re reading this, I can=E2=80=99t remember your name) came to the=
 stand to ask if we=E2=80=99ve looked at it.=C2=A0 I was aware of a DNF rep=
lacement but wasn=E2=80=99t aware that it had actually started making relea=
ses.<br>
&gt;<br>
&gt; I=E2=80=99ve just pushed a branch to poky-contrib:ross/dnf5 which adds=
 recipes for DNF5 and any new dependencies (it also needs meta-oe right now=
, as some dependencies are there).=C2=A0 It builds a dnf-native, but the bl=
ocker is that it doesn=E2=80=99t yet implement =E2=80=94repofrompath to add=
 a repository without a corresponding configuration file, which is what we =
use at rootfs time.=C2=A0 We can probably work around that by writing a tem=
porary repo file, or just implement the feature upstream.<br>
&gt;<br>
&gt; If anyone is interested in helping the port to DNF5 then your help wou=
ld be appreciated!<br>
&gt;<br>
&gt; Ross<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#176965): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/176965" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/176965</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96851390/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
96851390/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f0cb5905f44d6ef1--

