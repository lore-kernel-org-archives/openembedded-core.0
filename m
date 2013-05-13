Received: from mail-we0-f176.google.com ([74.125.82.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1Uc1R0-0004mj-EP
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 00:41:56 +0200
Received: by mail-we0-f176.google.com with SMTP id p60so6512061wes.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 15:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=7KDgTa9o2RP+Wy5d/avWIgFWmZpyj06n6M6LbEg7MGY=;
	b=aNGdGiUdm0rBsoUzYDMdEpF7GXSpdskqhnYJJwUiiPAJ6fzZP2om/f4ry8Uab5KtdT
	rlkvEEp8PTdHnzx5PXM0Wqx7Rf5SpDEcjTUWkfa3G0opdY4ZI4TQLx3/6rQNLffJ2dKN
	gCXkhEh4BFeNiesWVozddlB41VcTa11lSN2MwNGkiLJpzZtgwaGzC98RYH7veta+i5Rj
	onkCNrUANL3zre7NIvEDPUXMs2P586n/CPJGsFcV0wyjaRaZTtEdM/lOcauUjr+7QLJ3
	yxnt3ehnV6pvjtpPVCTVroEVyAq2n0QIF2lxg8Z3y+wZZSTHAcU2yFwDlISO3aqP4j1T
	yXqQ==
MIME-Version: 1.0
X-Received: by 10.180.185.44 with SMTP id ez12mr509191wic.7.1368483804254;
	Mon, 13 May 2013 15:23:24 -0700 (PDT)
Received: by 10.194.5.132 with HTTP; Mon, 13 May 2013 15:23:24 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1305131751080.14773@oneiric>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<CAHUNapT_QZr6OwgbyahtxQ16DuRZSgbQrTYg63k-qark8H-_Rw@mail.gmail.com>
	<CADkTA4PzaR2ERLBArRSPxpX5U=NtXfG4_2NBBymMwmONZQSV6Q@mail.gmail.com>
	<CAHUNapTYnSeB0yfXdxtRjqk49y8VHO9KPR_RjxgsN5rWCvDvdg@mail.gmail.com>
	<alpine.DEB.2.02.1305131536070.2354@oneiric>
	<CAHUNapSAjqkiNCy4bBxp_7JLmMDRc0omMYggfgZ33KhbEyqbZw@mail.gmail.com>
	<alpine.DEB.2.02.1305131558330.23405@oneiric>
	<CADkTA4MSXBhGpZAzUzdWTZEgvsvkXp9EOO8PPgKX2-LSw3pTgA@mail.gmail.com>
	<alpine.DEB.2.02.1305131650030.12354@oneiric>
	<CADkTA4O7Ls7sPfKXcLnR_ordcHKnGqkPCRtrDjWm7xXeUDgqaA@mail.gmail.com>
	<alpine.DEB.2.02.1305131704540.13080@oneiric>
	<CAHUNapSJe0JNi2EikxLTFtTaoNWm3m9+_Lk68qreY+vSbdQsrg@mail.gmail.com>
	<alpine.DEB.2.02.1305131712570.13256@oneiric>
	<CAHUNapTaTrZ8A8zMiaAiqwYbZx09s096EHNDRCo0nOw5-EO8HA@mail.gmail.com>
	<alpine.DEB.2.02.1305131729130.13480@oneiric>
	<CAHUNapQcmVKd2iruA5ubzLBLJx6asQZK5Y_NhgBPZRnFUfUxcQ@mail.gmail.com>
	<alpine.DEB.2.02.1305131751080.14773@oneiric>
Date: Mon, 13 May 2013 18:23:24 -0400
Message-ID: <CAHUNapSqVKos+4Er1Y0=4hmUxwvXMP=iw3Urs2iDn1kFQAs7TQ@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Add qemumips64 machine support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 May 2013 22:42:07 -0000
Content-Type: multipart/alternative; boundary=001a11c2257408989b04dca0f73c

--001a11c2257408989b04dca0f73c
Content-Type: text/plain; charset=ISO-8859-1

Okay, I'm going to start over :-)

I have a layer, meta-poky, which is:
$ git remote -v
contrib git://git.pokylinux.org/poky-contrib (fetch)
contrib git://git.pokylinux.org/poky-contrib (push)
origin  git://git.yoctoproject.org/poky (fetch)
origin  git://git.yoctoproject.org/poky (push)

Currently I have the master branch checked out from
origin: f7afeeb75993b159bb8959e0309bc5eb3978a8fb


I also have openembedded-core, which is:
$ git remote -v
contrib git://git.openembedded.org/openembedded-core-contrib (fetch)
contrib git://git.openembedded.org/openembedded-core-contrib (push)
origin  git://git.openembedded.org/openembedded-core (fetch)
origin  git://git.openembedded.org/openembedded-core (push)

Currently I have Khem's branch checked
out: b0592ab08273e17cb1511384ad189281f88c8b03


For my layers I'm only using:
meta-poky/meta-yocto (which I need so I can build an image with poky)
openembedded-core/meta (which I need for Khem's work, including the
qemumips64 MACHINE)


My understanding is that the things in openembedded-core/meta are meant to
replace
the corresponding directories from meta-poky/meta, which is why I'm not
including
meta-poky as a layer.

I am very confused by Robert's ability to build successfully with only the
following two layers:

BBLAYERS ?= " \
  /home/rpjday/oe/dist/layers/oe-core/meta \
  /home/rpjday/oe/dist/layers/openembedded-core-contrib/meta \
  "

Since, as far as I can tell, neither of them includes what is required to
build a poky image.
But I'll be trying out what Robert has done to see if I can get what he's
getting :-)
Maybe I'm still confused over all this meta-openembedded/openembedded-core
stuff.

--001a11c2257408989b04dca0f73c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Okay, I&#39;m going to start over :-)<div><br></div><div s=
tyle>I have a layer, meta-poky, which is:</div><div style><div>$ git remote=
 -v</div><div>contrib git://<a href=3D"http://git.pokylinux.org/poky-contri=
b">git.pokylinux.org/poky-contrib</a> (fetch)</div>
<div>contrib git://<a href=3D"http://git.pokylinux.org/poky-contrib">git.po=
kylinux.org/poky-contrib</a> (push)</div><div>origin =A0git://<a href=3D"ht=
tp://git.yoctoproject.org/poky">git.yoctoproject.org/poky</a> (fetch)</div>=
<div>
origin =A0git://<a href=3D"http://git.yoctoproject.org/poky">git.yoctoproje=
ct.org/poky</a> (push)</div><div><br></div><div style>Currently I have the =
master branch checked out from origin:=A0f7afeeb75993b159bb8959e0309bc5eb39=
78a8fb</div>
<div><br></div><div><br></div><div style>I also have openembedded-core, whi=
ch is:</div><div style><div>$ git remote -v</div><div>contrib git://<a href=
=3D"http://git.openembedded.org/openembedded-core-contrib">git.openembedded=
.org/openembedded-core-contrib</a> (fetch)</div>
<div>contrib git://<a href=3D"http://git.openembedded.org/openembedded-core=
-contrib">git.openembedded.org/openembedded-core-contrib</a> (push)</div><d=
iv>origin =A0git://<a href=3D"http://git.openembedded.org/openembedded-core=
">git.openembedded.org/openembedded-core</a> (fetch)</div>
<div>origin =A0git://<a href=3D"http://git.openembedded.org/openembedded-co=
re">git.openembedded.org/openembedded-core</a> (push)</div><div><br></div><=
div style>Currently I have Khem&#39;s branch checked out:=A0b0592ab08273e17=
cb1511384ad189281f88c8b03</div>
<div style><br></div><div style><br></div><div style>For my layers I&#39;m =
only using:</div><div style>meta-poky/meta-yocto (which I need so I can bui=
ld an image with poky)<br></div><div style>openembedded-core/meta (which I =
need for Khem&#39;s work, including the qemumips64 MACHINE)<br>
</div><div style><br></div><div style><br></div><div style>My understanding=
 is that the things in openembedded-core/meta are meant to replace</div><di=
v style>the corresponding directories from meta-poky/meta, which is why I&#=
39;m not including</div>
<div style>meta-poky as a layer.</div><div style><br></div><div style>I am =
very confused by Robert&#39;s ability to build successfully with only the f=
ollowing two layers:</div><div style><br></div><div style><div>BBLAYERS ?=
=3D &quot; \</div>
<div>=A0 /home/rpjday/oe/dist/layers/oe-core/meta \</div><div>=A0 /home/rpj=
day/oe/dist/layers/openembedded-core-contrib/meta \</div><div>=A0 &quot;</d=
iv><div><br></div><div style>Since, as far as I can tell, neither of them i=
ncludes what is required to build a poky image.</div>
<div style>But I&#39;ll be trying out what Robert has done to see if I can =
get what he&#39;s getting :-)</div><div style>Maybe I&#39;m still confused =
over all this meta-openembedded/openembedded-core stuff.</div></div></div>
</div></div>

--001a11c2257408989b04dca0f73c--
