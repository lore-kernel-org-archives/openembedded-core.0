Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web09.638.1620941609545963093
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 14:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=WH/Bjqwt;
 spf=none, err=SPF record not found (domain: verbum.org, ip: 64.147.123.25, mailfrom: walters@verbum.org)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 6C62011F4
	for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 17:33:26 -0400 (EDT)
Received: from imap10 ([10.202.2.60])
  by compute1.internal (MEProxy); Thu, 13 May 2021 17:33:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=k1Ex3l
	jnMrhhcK6ceX/GG6h+AsLsqVzOAKc4yVMAhtk=; b=WH/BjqwtRqStrtNw9bV4IZ
	8l5RPXNEWDUsFY79bBtY12yta+Jz5LLoJwSH8nV6mqCoF/i8iNo6y4S51Ig3cbD+
	l++hY+n0x9cZOk4372THx/ksjTCR28r0r/M+IlvJlhXooOqKucxvjLFmtzVaywKe
	9y55NbzrIDjeplZ2Z+KTvjr8dehW/+crfFmUn1kNGY8wIzZNb+iO9+YhY83BQxLb
	0ImEUJyCwQg6ua2623uwwmPqvXr6KegfhcJumHEaIqL0d+37Zm5Tgd2PK+3BfM8V
	YeTociFMYgDm/Y0RAvDqEwQWBQI3vOl8e9L6lFXHVMZ9zkbgVRjN+8hPobH2Meow
	==
X-ME-Sender: <xms:JZudYMrZdzAwtMLQosc-KFan8Bypf6oP5WFBIenmtLGtqq1BqipurQ>
    <xme:JZudYCpT4YoaVw4s4XleVDMDE1X9BiNR-ME6ADNderQN2RDOX4dKKdpdbHColHB0Z
    tKC1-mG5549GQDZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehgedgudeivdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesth
    dtredtreertdenucfhrhhomhepfdevohhlihhnucghrghlthgvrhhsfdcuoeifrghlthgv
    rhhssehvvghrsghumhdrohhrgheqnecuggftrfgrthhtvghrnhepteegieevleffkedvle
    eujeegtddthfdtuddvhefgiefhgeevhffhkefgueeivefgnecuffhomhgrihhnpehgihht
    hhhusgdrtghomhdphihotghtohhprhhojhgvtghtrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfigrlhhtvghrshesvhgvrhgsuhhm
    rdhorhhg
X-ME-Proxy: <xmx:JZudYBN9wKAWw38dMWzCV7g6MMG1b1U9guOggLlNdmlJrxbOza2dIA>
    <xmx:JZudYD6_u25KB-PbchilMOdutR_vbMXglkzqIODva8YaUmw5wsp92Q>
    <xmx:JZudYL7lLSH9bSX8XXemAsqANbAg8D0z8kaCS0mRYdqllN5aXCeOew>
    <xmx:JpudYOJfRMIUCWapyi5qWqSPQgx_LWX_C66xPG7dlTkMVdONIIGiiA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B04644E0128; Thu, 13 May 2021 17:33:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <720f0aff-891d-4186-b637-4b5e2ba0a598@www.fastmail.com>
In-Reply-To: 
 <7ebd5f52982311726a6aebd89eba9cae07bdf999.camel@linuxfoundation.org>
References: <ca363208-ab63-44c4-92e7-98b1788a8a8c@www.fastmail.com>
 <CANNYZj9_4WC91DoTeXcsVAJi=kS2DRXHTHE5L6Wgbb2PJfTimA@mail.gmail.com>
 <255c6c61-af04-4866-bb2f-0ddc50ca6391@www.fastmail.com>
 <CANNYZj-PSq4bAQpy3s=8Vuqk-PcstZZFPzr710VXfS3Lj8Aiow@mail.gmail.com>
 <CANNYZj8yZ5Ays2dsPV5jkptLea0faY2uqd5_n6SeOFZdoqV8Gw@mail.gmail.com>
 <CAJ86T=UjJ8J3aUL7YX03oa1fy7zAwPk9vp+=yYxGNfEKsNt6oQ@mail.gmail.com>
 <5ceca668cfce15ebd8874fdaa9c01949fe1d95fc.camel@linuxfoundation.org>
 <d1c5ed38-605f-4fa8-8ece-09a9dcc43890@www.fastmail.com>
 <7ebd5f52982311726a6aebd89eba9cae07bdf999.camel@linuxfoundation.org>
Date: Thu, 13 May 2021 17:33:02 -0400
From: "colin walters" <walters@verbum.org>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] master/main branch renaming and bitbake
Content-Type: text/plain



On Thu, May 13, 2021, at 4:08 PM, Richard Purdie wrote:
>
> The advice to anyone hitting this issue is to add in the correct branch
> to the SRC_URI. It is simple and easy to do, can be in bbappends 
> or even changed via anonymous python and similar if necessary. We've already
> found the issue with several core recipes, we simply updated them and most 
> users didn't notice. I would even likely take that kind of change into older
> otherwise unmaintained branches and I think I did so in at least one case in
> the past.

What I am uncertain about is: how quickly does that translate into us being able to remove the old branch?

We're not the first project to do this and we won't be the last, so having a solution here will be good.

Hmm actually I notice systemd upstream did the rename a while ago and they're not carrying a `master` branch.  What's the difference between systemd and ostree here?

Is it the use of `SRCREV`?  Or no, in the systemd case is it because it's set to a tag?
https://github.com/openembedded/openembedded-core/blob/2621dbbc1181808f18ca4ae79408d0d5b557670f/meta/recipes-core/systemd/systemd.inc#L18

ostree is also using tags, is the recipe just broken in not using tags?

> I appreciate the tooling could do all kinds of magic things. I have a strong
> preference for not adding magic into it, or over complicating it, it is already
> horrendously complicated and a nightmare to test. I appreciate nobody believes
> me, I only do my best to maintain it. The code is here for anyone interested:
> 
> http://git.yoctoproject.org/cgit.cgi/poky/tree/bitbake/lib/bb/fetch2/git.py

Yeah, understood.

> I'd also note you can add ;nobranch=1 to the urls or ;usehead=1. Those do
> have side effects, I will not recommend them, or accept them for general use
> in layers I maintain, they're considered developer options. I was reminded
> recently that we have seen bugs the branch parameter has caught where a 
> revision was not where we thought it was so these do catch real world issues.

Well I hope the result of this discussion is a recommended best practice at least.
If recommending using a tag works, that seems good to me.
