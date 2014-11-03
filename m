Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id 158266E63E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 16:08:46 +0000 (UTC)
Received: by mail-qa0-f49.google.com with SMTP id i13so8404427qae.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Nov 2014 08:08:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0GYinD4U5w8gnRBnPhaY2WNlvvnB8MEiVRkl0cQeVIQ=;
	b=IKnMrujri8nPL8EY7kKNag84AsQEBmgmUo49JzgRPzbE4PmsQKOsdxw6vCRB9bc+we
	4GbkXoqH0oKFFK6xPYrcV0Qd14G9Or0Ckrx3bO1xJNu3iTyGE4GeayyHw2x9dFeQI2NW
	KCCTHpuxYifshoBXwpbr7bOXyA2LiIK2uC5zV2+E1eYVlJA65P9XJBCoo+XWxc5x8SQ9
	l9pqU0GMHJr1HfPK2iUNtJywl1Rq/XdMtsO90BehMMET6v2M6oRJXFApMgJh3gxb4HcO
	GG6Jeekrapyy4OMAa4itBAvWtVY+kXGdkYVChgZ9KWhpQXcm7zi0c4E4JcKhr9rZvOfn
	ttNg==
X-Gm-Message-State: ALoCoQmnmlILTcdGRQ6jx+Wu2ejiF69yQ3VeRHny3vDMcpCXupGvRibeTDK5e6tj0/izNxJxXE/X
X-Received: by 10.140.96.101 with SMTP id j92mr62181345qge.87.1415030926685;
	Mon, 03 Nov 2014 08:08:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Mon, 3 Nov 2014 08:08:26 -0800 (PST)
In-Reply-To: <9D7813D1-1BDC-4B46-BE6D-CF05049314E5@linaro.org>
References: <1411387952-22717-1-git-send-email-koen.kooi@linaro.org>
	<1C408B9F-5383-488A-AE4C-E18D69800825@dominion.thruhere.net>
	<CAJTo0LYOHMZCoGS342Wnh06LbJWUS1K_aDFfDWG4gxeFswm7EA@mail.gmail.com>
	<A5FE6A94-E1CA-4E02-8B98-D018F14888F7@dominion.thruhere.net>
	<CAJTo0LYm6rqFtJ5jTq=cTGnJDHrYaj7f94RmWR_Lh-LkKqKaiA@mail.gmail.com>
	<07F08083-4EDE-4CC7-AAA7-53019C7978C0@dominion.thruhere.net>
	<1415016627.5111.9.camel@ted>
	<9D7813D1-1BDC-4B46-BE6D-CF05049314E5@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Nov 2014 16:08:26 +0000
Message-ID: <CAJTo0LaeFG5ceKK1a1ugPEHyQ5z1dz6YVqY7Y0gPyD6vyWY=BA@mail.gmail.com>
To: Koen Kooi <koen.kooi@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpng 1.6.13: fix build for aarch64
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
X-List-Received-Date: Mon, 03 Nov 2014 16:08:52 -0000
Content-Type: multipart/alternative; boundary=001a113a9d8abb539b0506f68f20

--001a113a9d8abb539b0506f68f20
Content-Type: text/plain; charset=UTF-8

On 3 November 2014 15:24, Koen Kooi <koen.kooi@linaro.org> wrote:

> It's been over a month and libpng is still broken, so I refuse to classify
> this new process as 'helpful' or as 'appreciated' at this point.


Remember that 1.7 was frozen solid for several weeks of that month, so no
it wouldn't have been merged in that time period.  It's only just
re-opened: master is currently 80 patches ahead of dizzy, 35 in the C-Pull
I sent last night, and another 33 in my staging branch right now so it's
not like we're taking it easy right now.

Some context: during September it was obvious that various parties had an
interest in aarch64 (Linaro and Wind River).  Patches to fix build failures
were being sent sporadically, a qemuarm64 machine was submitted, but there
was no kernel for said machine to actually build.   At the time there was
no qemuarm64 machine that actually worked, so even merging the "simple"
fixes on just faith that they're correct would be reckless considering we
were freezing.  This is why I suggested[1] that someone with a vested
interest in aarch64 collate all the patches into a single branch and keep
it rebased to master so that when master opens, it can be tested on *all*
qemu architectures and merged.  It appears that this hasn't happened.  Will
Linaro be able to create a branch that incorporates all of the patches and
new machine that's been tested as a whole?

Ross

[1]
http://lists.openembedded.org/pipermail/openembedded-core/2014-September/097211.html

--001a113a9d8abb539b0506f68f20
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 November 2014 15:24, Koen Kooi <span dir=3D"ltr">&lt;<a href=3D"mailto=
:koen.kooi@linaro.org" target=3D"_blank">koen.kooi@linaro.org</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-s=
tyle:solid;padding-left:1ex">It&#39;s been over a month and libpng is still=
 broken, so I refuse to classify this new process as &#39;helpful&#39; or a=
s &#39;appreciated&#39; at this point.</blockquote></div><br>Remember that =
1.7 was frozen solid for several weeks of that month, so no it wouldn&#39;t=
 have been merged in that time period.=C2=A0 It&#39;s only just re-opened: =
master is currently 80 patches ahead of dizzy, 35 in the C-Pull I sent last=
 night, and another 33 in my staging branch right now so it&#39;s not like =
we&#39;re taking it easy right now.</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Some context: during September it was obvious=
 that various parties had an interest in aarch64 (Linaro and Wind River).=
=C2=A0 Patches to fix build failures were being sent sporadically, a qemuar=
m64 machine was submitted, but there was no kernel for said machine to actu=
ally build. =C2=A0 At the time there was no qemuarm64 machine that actually=
 worked, so even merging the &quot;simple&quot; fixes on just faith that th=
ey&#39;re correct would be reckless considering we were freezing.=C2=A0 Thi=
s is why I suggested[1] that someone with a vested interest in aarch64 coll=
ate all the patches into a single branch and keep it rebased to master so t=
hat when master opens, it can be tested on *all* qemu architectures and mer=
ged.=C2=A0 It appears that this hasn&#39;t happened.=C2=A0 Will Linaro be a=
ble to create a branch that incorporates all of the patches and new machine=
 that&#39;s been tested as a whole?</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">[1]=C2=A0<a href=3D"http://lists.openembedded.=
org/pipermail/openembedded-core/2014-September/097211.html">http://lists.op=
enembedded.org/pipermail/openembedded-core/2014-September/097211.html</a></=
div></div>

--001a113a9d8abb539b0506f68f20--
