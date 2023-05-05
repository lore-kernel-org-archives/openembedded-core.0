Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF464C77B7D
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 19:33:10 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.4922.1683315181238266752
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 12:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=bHMLwsTh;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4f00d41df22so18057264e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 12:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683315179; x=1685907179;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ObqaQFV/81DhaTp/QUNsZrRD+5X8Q4Gzq7WEcNkXVZY=;
        b=bHMLwsThf+4SaWltSRB6mcd20d3vDqZ+FLaBxTMbPdy74OCuI4zIG2mDblGIOo8IC2
         r6FDAneCqTEn2GZ+p8vnE4p4Y8AorEBnof14eMacXOF4NTbGy4JQl26jbhAJtJz1jB3b
         gzKgV/HN2ulLYTUzKg7UAD1kidcTKFcF2jYah0TbeFNLkW6ulkxxA3jhyvrH6Q4NiPkw
         m2MaDlDQfWcS5+OG9OIFsCsmQ3vp1W7aKzdS0m5m6DL39EeTil0J/UfjQ+J7CS4HqQf8
         A/5p1qoDadc8rdwEvdC3w3rGm1T+l3+OrB1y0Ck9wpLYfFn68YxhWp5jdl5y2tFqXvIF
         aS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683315179; x=1685907179;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObqaQFV/81DhaTp/QUNsZrRD+5X8Q4Gzq7WEcNkXVZY=;
        b=B7xLzUn0SkYVIWnyrJflGz1vKbjEmOixLuXOYGVujBhLHr3tj+NOB7zG2sBuC2p4oi
         7sFMCBtNJHgiz1Prjd8sgG9RB97TmOGNkmQsJZN+D5sOPeaDoaCAKOgck9AFSJlQ2VHE
         U4Xf27N/GLlqIbSqtjaAkrJFpNc3MqE4L0BXXXsUI7JVTtZJuQG8XiV5biycecE561To
         7lH1639SwgBthIzNoVNO5NitpCL+ZiY4YUgCZcdZaF0MLb1v5w2Dff1z8n1QpnDCEorE
         5UGFjVe4w1GIhujVxF4znnPMhaKxRRG09dI3AD3Q0/3HNDtIx9GJm2beJnKDiTah/TqA
         WkPw==
X-Gm-Message-State: AC+VfDzuHEF0zxmoi2T+hRNERADJubA8Q4N79SeR3ueIdqE++x2riWoE
	1dajaOSUMq7kDtO1vwDiNffo/iyZvOGzVTGpP8uMBjzu
X-Google-Smtp-Source: ACHHUZ6VM6ttwWwGkQE3xxOlcziYfPS72ubbMUp3GGk+xYle/QhH3plavpYSc4osEm4I9QqB9ouSJKDRqm2NkJ+ZZdE=
X-Received: by 2002:ac2:4254:0:b0:4ef:ef9f:f24f with SMTP id
 m20-20020ac24254000000b004efef9ff24fmr856601lfl.13.1683315179118; Fri, 05 May
 2023 12:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAkeqg4CdA5F73-z1dXLvQHz+2HqiDRQPC9ndTZM89BAmmaA@mail.gmail.com>
 <3bb6883c-fe42-f670-497a-56805f06d296@bootlin.com>
In-Reply-To: <3bb6883c-fe42-f670-497a-56805f06d296@bootlin.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Fri, 5 May 2023 21:32:47 +0200
Message-ID: <CA+cAkepsWdH78vbNbioRZrPtUYO8uvRXPkH_-5k-dxzow-F=Cw@mail.gmail.com>
Subject: Re: [OE-core] Contributing, how it works?
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004be3a205faf75b2b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 19:33:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180977

--0000000000004be3a205faf75b2b
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 May 2023 at 21:21, Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Hi Frederic
>
> On 05.05.23 at 19:17, Frederic Martinsons wrote:
> > Hello list
> >
> > I'm wondering if there are documentations on how contribution are
> > managed for the project.
> >
> > I try to find some but didn't manage to. There are easily reachable
> > doc about how to contribute of course (how to make patches, fixe your
> > identity, send mail via git... etc) but I didn't find what I usually
> > find on other open source project (CONTRIBUTING.md file most of the
> > time) like
> >   - what are the tests do should I run before submitting (I learnt by
> > practice about test image or bitbake selftest for example) ?
> >   - is there a specific configuration that I should test before
> > submitting (poky is ok, or should I also test another distro)?
> >   - does some commit writing rules exist ? (some projects want commits
> > to begin with a prefix, usually the software component that is
> > modified by the patch for example)
> >  - what are the coding rules you should follow, if any? (having common
> > coding rules helps greatly the review of patches, pylint for python
> > code for example, and I saw there are some bitbake recipes linter from
> > meta-sca layer)
> >
> > Long story short, I really would like to know what are the different
> > steps a patch should go through before being merged into master (and
> > as a side question, what are the steps for a patch to be backported
> > into one of the LTS branch).
> >
> > I'm deeply sorry if all these questions are obvious to you and have
> > been already answered somewhere, in that case, please just give me the
> > link.
> >
> > I recently started to contribute to yocto / oe and I think it will
> > help me to make better contributions if I know more of how it works
> > "under the hood".
>
>
> Thanks for starting this thread! We precisely have plans to consolidate
> docs on how to contribute.
>
> See   https://www.openembedded.org/wiki/Document_Consolidation and
> https://wiki.yoctoproject.org/wiki/Maintainers_Manual for a list of
> documents we want to consolidate.
>
> Cheers
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com


Oh great ! thank you Michael, be sure I will read those links.
And thanks everyone for giving all these documents, I'll have a busy
weekend to look at them all.

 Again, I think having a focus point which gathers all these docs would be
a great help but maybe
the link you gave Michael will be a starting point.

By the way, I'm starting to think that I should write an article (blog
post, tweet, whatever ...) about
my journey about yocto/oe contributions, it may help future contributors.

 But since I never write a publicly available article, it may
not be in the coming weeks.... (and I should improve my skills in writing
before going there)

--0000000000004be3a205faf75b2b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, 5 May 2023 at 21:21, Michael =
Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com">michael.op=
denacker@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hi Frederic<br>
<br>
On 05.05.23 at 19:17, Frederic Martinsons wrote:<br>
&gt; Hello list<br>
&gt;<br>
&gt; I&#39;m wondering if there are documentations on how contribution are =
<br>
&gt; managed for the project.<br>
&gt;<br>
&gt; I try to find some but didn&#39;t manage to. There are easily reachabl=
e <br>
&gt; doc about how to contribute of course (how to make patches, fixe your =
<br>
&gt; identity, send mail via git... etc) but I didn&#39;t find what I usual=
ly <br>
&gt; find on other open source project (CONTRIBUTING.md file most of the <b=
r>
&gt; time) like<br>
&gt; =C2=A0 - what are the tests do should I run before submitting (I learn=
t by <br>
&gt; practice about test image or bitbake selftest for example) ?<br>
&gt; =C2=A0 - is there a specific configuration that I should test before <=
br>
&gt; submitting (poky is ok, or should I also test another distro)?<br>
&gt; =C2=A0 - does some commit writing rules exist ? (some projects want co=
mmits <br>
&gt; to begin with a prefix, usually the software component that is <br>
&gt; modified by the patch for example)<br>
&gt; =C2=A0- what are the coding rules you should follow, if any? (having c=
ommon <br>
&gt; coding rules helps greatly the review of patches, pylint for python <b=
r>
&gt; code for example, and I saw there are some bitbake recipes linter from=
 <br>
&gt; meta-sca layer)<br>
&gt;<br>
&gt; Long story short, I really would like to know what are the different <=
br>
&gt; steps a patch should go through before being merged into master (and <=
br>
&gt; as a side question, what are the steps for a patch to be backported <b=
r>
&gt; into one of the LTS branch).<br>
&gt;<br>
&gt; I&#39;m deeply sorry if all these questions are obvious to you and hav=
e <br>
&gt; been already answered somewhere, in that case, please just give me the=
 <br>
&gt; link.<br>
&gt;<br>
&gt; I recently started to contribute to yocto / oe and I think it will <br=
>
&gt; help me to make better contributions if I know more of how it works <b=
r>
&gt; &quot;under the hood&quot;.<br>
<br>
<br>
Thanks for starting this thread! We precisely have plans to consolidate <br=
>
docs on how to contribute.<br>
<br>
See =C2=A0 <a href=3D"https://www.openembedded.org/wiki/Document_Consolidat=
ion" rel=3D"noreferrer" target=3D"_blank">https://www.openembedded.org/wiki=
/Document_Consolidation</a> and <br>
<a href=3D"https://wiki.yoctoproject.org/wiki/Maintainers_Manual" rel=3D"no=
referrer" target=3D"_blank">https://wiki.yoctoproject.org/wiki/Maintainers_=
Manual</a> for a list of <br>
documents we want to consolidate.<br>
<br>
Cheers<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a></blockquote><div><br></div><div>Oh great ! thank you Mich=
ael, be sure I will read those links.</div><div>And thanks everyone for giv=
ing all these documents, I&#39;ll have a busy weekend to look at them all.<=
/div><div><br></div><div>=C2=A0Again, I think having a focus point which ga=
thers all these docs would be a great help but maybe</div><div>the link you=
 gave Michael will be a starting point.</div><div><br></div><div>By the way=
, I&#39;m starting to think that I should write an article (blog post, twee=
t, whatever ...) about=C2=A0</div><div>my journey about yocto/oe contributi=
ons, it may help future=C2=A0contributors.</div><div><br></div><div>=C2=A0B=
ut since I never write a publicly available article, it may</div><div>not b=
e in the coming weeks.... (and I should improve my skills in writing before=
 going there)</div><div><br></div></div></div>

--0000000000004be3a205faf75b2b--

