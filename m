Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	by mail.openembedded.org (Postfix) with ESMTP id BD13778D39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 17:29:51 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id l15-v6so11221698lji.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 10:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3dtxrOkfAauSodXq3fhmMJdq0D0giXOezlQgCB8hBXY=;
	b=scx3s5kgrekglGpKpgV0n6f39pztrFnhn/ihY1K/Rf7BuuUN9lgZbmN/pG7iC4i85o
	faqVYzXd+LXH3M/7uFFNrnBD0wf00Z9JJWB/4gUgGwMjknBm8qner6BGiVnI9Tf35/3i
	2Ayw7cN9Z69g9NU07af4PpegPsh3AdljWdJoik+QNm/fWIow1wocLyS0nRoUrXzUEFO8
	Pf48+icpfjxkITNE+TnfOOLjwrDu6ihnYDSJ/Uh4xrCZ6y3DM1cIQ8sCEoCsTGu0t3bh
	1Sh1DsgTqii/xa3YSSXHAQYnSOO1ebCQBtIUVOQXIV/5af9Zob5yzcKWe7GKD019YRQa
	x00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3dtxrOkfAauSodXq3fhmMJdq0D0giXOezlQgCB8hBXY=;
	b=olcbTNT5l+wYHOWPZNHyA94rFlH2CBrgKfhOdkkidNOHsqytUQVbSHxPB36W92ry7Z
	/oNRBhJlXTRiMNPdaP642BvbFs/YXDeZhdcvyKrr0lwqtJZzdNoUPIRig7l6I2gg/0rn
	Umr9y4+jTTO5JHsIDQFmDpKEcIlNbSKvJZWwb//Sko3vLkwsq95RWnSbc4vgozhv9ObP
	9UJhYI6e3OTdGOEJaZGMH9BzgNIDo9ytkE9uAQY6rzQJJXYm3qq3KKUg8B/Nd7F6sZYZ
	O4vwXxkvNfjvJiyG3N+xlZpxRmn5ctWE9E3ALDUNvL+7EwCGWEp6LcT+5XaD15GfQ5OD
	bVgw==
X-Gm-Message-State: AOUpUlE3S6fMLMTPc7w90ko2FMHRqVnR0ogp3UTCK3zTyqy+iH+W4H+l
	3rnQR7aFAQv7c6wzXlgPuZrmwr22ph7dHvo96Y4=
X-Google-Smtp-Source: AAOMgpe6EsvvR1ypYJso8ZjrcdrJ3T5L362lNiWB09AEEfLKNIAAuHp71RxdmCZBwMTX9NfBaFFN+//w9m0DRsngHz0=
X-Received: by 2002:a2e:80d3:: with SMTP id
	r19-v6mr13150707ljg.85.1532971792280; 
	Mon, 30 Jul 2018 10:29:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:6f11:0:0:0:0:0 with HTTP; Mon, 30 Jul 2018 10:29:51
	-0700 (PDT)
In-Reply-To: <CAJTo0LbCA4OfxodE0ac60VHYwHm8fCRgQqWjJmQ_svVjeHc-dA@mail.gmail.com>
References: <1532937321-4077-1-git-send-email-christopher.w.clark@gmail.com>
	<CAJTo0LbCA4OfxodE0ac60VHYwHm8fCRgQqWjJmQ_svVjeHc-dA@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Mon, 30 Jul 2018 10:29:51 -0700
Message-ID: <CACMJ4Ga-rcim=ffoVsx2Yo4hRT28wTBi8bR7z32upO-28ffxEw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6] binutils : enable x86_64-pep for producing EFI binaries on x86-64
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
X-List-Received-Date: Mon, 30 Jul 2018 17:29:52 -0000
Content-Type: multipart/alternative; boundary="0000000000002130d405723acfce"

--0000000000002130d405723acfce
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 30, 2018 at 4:29 AM, Burton, Ross <ross.burton@intel.com> wrote:

> On 30 July 2018 at 08:55, Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
> > Add x86_64-pep emulation support to the set enabled for x86_64 targets
> > to enable the linker to produce Portable Executables for EFI binaries.
> >
> > Enables building the x86-64 EFI variant of the Xen hypervisor for
> > the OpenXT Project.
> >
>

> Is just passing --enable-targets=all not an option?

It is a possible option, but I prefer not to. Here's why:

This binutils software, and definitely the cross variant that is built, is
one that a lot of trust ends up being placed in. It runs on the build
servers (typically a privileged environment, eg. on the internal intranet,
with access to proprietary source code, sometimes signature keys, shared
network storage, etc.) and processes a _lot_ of input data (source code)
obtained from third parties.

In addition to that, it then produces the binaries that are run on the
target systems.

Since it is difficult to fully audit every version of all of the input,
always, it does make sense to take additional care with the tools that
process it.

I think it's reasonable, and advisable, to want the default to be to
minimize the build for this component, and narrow its functionality to that
required to produce executables for the target architecture that the build
is for.

Christopher

--0000000000002130d405723acfce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Jul 30, 2018 at 4:29 AM, Burton, Ross <span dir=3D"ltr">&lt;<a =
href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On 30 July 2018 at 08:55, Christopher Clark<br>
<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5">&lt;<a href=3D"mailto:c=
hristopher.w.clark@gmail.com">christopher.w.clark@gmail.com</a><wbr>&gt; wr=
ote:<br>
&gt; Add x86_64-pep emulation support to the set enabled for x86_64 targets=
<br>
&gt; to enable the linker to produce Portable Executables for EFI binaries.=
<br>
&gt;<br>
&gt; Enables building the x86-64 EFI variant of the Xen hypervisor for<br>
&gt; the OpenXT Project.<br>
&gt;<br></div></div></blockquote><div><span style=3D"font-size:small;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial;float:none;display:inline"><br></span></div><div><span style=
=3D"font-size:small;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial;float:none;display:inline">&gt; Is j=
ust passing --enable-targets=3Dall not an option?</span><br style=3D"font-s=
ize:small;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial"><br></div><div><div>It is a possible option, =
but I prefer not to. Here&#39;s why:</div><div><br></div><div>This binutils=
 software, and definitely the cross variant that is built, is one that a lo=
t of trust ends up being placed in. It runs on the build servers (typically=
 a privileged environment, eg. on the internal intranet, with access to pro=
prietary source code, sometimes signature keys, shared network storage, etc=
.) and processes a _lot_ of input data (source code) obtained from third pa=
rties.</div><div><br></div><div>In addition to that, it then produces the b=
inaries that are run on the target systems.</div><div><br></div><div>Since =
it is difficult to fully audit every version of all of the input, always, i=
t does make sense to take additional care with the tools that process it.</=
div><div><br></div><div>I think it&#39;s reasonable, and advisable, to want=
 the default to be to minimize the build for this component, and narrow its=
 functionality to that required to produce executables for the target archi=
tecture that the build is for.</div><div><br></div><div>Christopher</div></=
div><div><br></div></div></div></div>

--0000000000002130d405723acfce--
