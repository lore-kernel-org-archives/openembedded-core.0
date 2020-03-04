Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2EFE06106C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 09:37:02 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id r18so709377vso.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 01:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ByJIr3YgHLjtbvN1UdjBYJbvnqeCmYZU1NlsbcqWSQ8=;
	b=oYYwpUwOalZaA3N6PVvUg2eMgcq5uPy+6rYPE7RZmBTrEFqhl0QGNXpRrqO0cEytU8
	cVRR6qBoPytjxiVFDL37Z/eNeT89y1tjQzBtJu+PYiwPrS5ZKuJ9aXYDcT2brp/gDbFO
	+gZ01VgaN04Y90hCGksG1k/IHru1nly7R2li6MvpvlXEiwQEZaiMGvNzHQzMgPP9C59y
	rIRiIsTSD8K2zdv88I2DVf2f2deEQ680erksHXrq4GfOAGuw5tibrR8INauoqDlCdzpd
	zN5Pi33hi5RDyHFaXqxEEJuP1e0aGOkuiqh8DkTK5RwxgTiEpv6VvUd5ERlI2+Gi56jY
	g6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ByJIr3YgHLjtbvN1UdjBYJbvnqeCmYZU1NlsbcqWSQ8=;
	b=CZxjSwJRx2wA/A24Gk4G2s6vZ4u74ih8oquhCA1IWCifrzGxXC4dk6prLIyu2/fhEe
	ces+948L1CWcRKA+McUdr1/c5l7WeAeI7IujBeqHloV0MhMwthGDLvCA+7gZbzgzoSt1
	oNx0fuijlbKXodud1Vvtqm1AHVhgv670PbCfazuV6tnG6YN09UWOfJaUjFhxOJIz8hfs
	CX61j5TTvMAtiYsO9z5h5KezZrAQtlXbLb8J7OUxErCD+mR/dKPKKV28mAYgFc/92Ziw
	I/ssw2/HdhIGQxPdXqtfmifpIC0ZoR9nlr9E0vq8F42Ja88TQ6jwg/oCUtyubZGjxzz5
	nOEw==
X-Gm-Message-State: ANhLgQ1qZUn4yxw7FgHQtbZJxNyXL2GsM2ue8SmVczuJmQy+FTI4N1Gi
	W8j6WR87Da9NuP8v27/EuK0IQK5IZrY+hA0Wqy49fQ==
X-Google-Smtp-Source: ADFU+vvpCrCLjyTHIk0dfvwA6UvetBmggxY7/GCeTTr/V1qZAxa8jqTRO/6jNswlJ2f/zfIfis4T29GyXqha1haSrBU=
X-Received: by 2002:a05:6102:4af:: with SMTP id
	r15mr1156303vsa.35.1583314623926; 
	Wed, 04 Mar 2020 01:37:03 -0800 (PST)
MIME-Version: 1.0
References: <20200223193408.5602-1-bunk@stusta.de>
	<CAMKF1sqOPEw+uDZO81+j5MWxZBVjjgag6eT+jXYL958ic1Ysmg@mail.gmail.com>
	<20200224051745.GA6683@localhost>
	<e43b3057-37d5-7a35-b988-7307cc7fd67f@gmail.com>
	<20200227132729.GA6240@localhost>
	<CANNYZj8zWJVwAz+N3ikC+bw7iJba7OVbCs0dTsZgNo_PRkrY3A@mail.gmail.com>
	<20200304090507.GA7923@localhost>
In-Reply-To: <20200304090507.GA7923@localhost>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Mar 2020 10:36:52 +0100
Message-ID: <CANNYZj9FbH=Poibo03-7tU=QhJjO5vu3kKHGpCgMCNd9=xVAVQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 1/2] nss: Move to meta-oe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Mar 2020 09:37:03 -0000
Content-Type: multipart/alternative; boundary="000000000000ba17f905a00429b5"

--000000000000ba17f905a00429b5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You are misinterpreting the announcement. The security updates are provided
by users as patches to the mailing list, maintainers merely collect and
integrate them. There is no promise from the project to do anything else,
and LTS doesn=E2=80=99t change that, it only extends the maintainer duty fr=
om one
year to two. Moving a recipe in or out of core does not fundamentally
change how much attention it gets w.r.t. security fixes.

Alex

On Wed 4. Mar 2020 at 10.05, Adrian Bunk <bunk@stusta.de> wrote:

> On Thu, Feb 27, 2020 at 03:03:18PM +0100, Alexander Kanavin wrote:
> > On Thu, 27 Feb 2020 at 14:28, Adrian Bunk <bunk@stusta.de> wrote:
> >
> > > >...
> > >
> > > It is a crypto library with a history of unfixed CVEs in supported
> > > stable Yocto releases.
> > >
> >
> > If the issue is unfixed CVEs, then I do not think it's particularly
> > relevant which layer the recipe is in. Stable release maintainers are n=
ot
> > expected to 'track and fix CVEs', that one is on users.
>
> Yesterdays LTS announcement makes it clear that the Yocto project does
> provide regular security updates for supported stable branches:
>
> <--  snip  -->
>
> Yocto Project releases are usually maintained for one year.
> Beyond this period, releases move to community support, which means
> they only receive occasional patches for critical defects and updates,
> and no regular defect fixes and security updates.
>
> <--  snip  -->
>
>
> > Alex
>
> cu
> Adrian
>

--000000000000ba17f905a00429b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">You are misinterpreting the announcement. The securi=
ty updates are provided by users as patches to the mailing list, maintainer=
s merely collect and integrate them. There is no promise from the project t=
o do anything else, and LTS doesn=E2=80=99t change that, it only extends th=
e maintainer duty from one year to two. Moving a recipe in or out of core d=
oes not fundamentally change how much attention it gets w.r.t. security fix=
es.=C2=A0</div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</di=
v><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Wed 4. Mar 2020 at 10.05, Adrian Bunk &lt;<a href=3D"mailto:bunk@stusta=
.de">bunk@stusta.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
On Thu, Feb 27, 2020 at 03:03:18PM +0100, Alexander Kanavin wrote:<br>
&gt; On Thu, 27 Feb 2020 at 14:28, Adrian Bunk &lt;<a href=3D"mailto:bunk@s=
tusta.de" target=3D"_blank">bunk@stusta.de</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; &gt;...<br>
&gt; &gt;<br>
&gt; &gt; It is a crypto library with a history of unfixed CVEs in supporte=
d<br>
&gt; &gt; stable Yocto releases.<br>
&gt; &gt;<br>
&gt; <br>
&gt; If the issue is unfixed CVEs, then I do not think it&#39;s particularl=
y<br>
&gt; relevant which layer the recipe is in. Stable release maintainers are =
not<br>
&gt; expected to &#39;track and fix CVEs&#39;, that one is on users.<br>
<br>
Yesterdays LTS announcement makes it clear that the Yocto project does <br>
provide regular security updates for supported stable branches:<br>
<br>
&lt;--=C2=A0 snip=C2=A0 --&gt;<br>
<br>
Yocto Project releases are usually maintained for one year.<br>
Beyond this period, releases move to community support, which means<br>
they only receive occasional patches for critical defects and updates,<br>
and no regular defect fixes and security updates.<br>
<br>
&lt;--=C2=A0 snip=C2=A0 --&gt;<br>
<br>
<br>
&gt; Alex<br>
<br>
cu<br>
Adrian<br>
</blockquote></div></div>

--000000000000ba17f905a00429b5--
