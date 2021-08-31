Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web12.4947.1630413941130928438
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Aug 2021 05:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm2 header.b=JmjrbZT3;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25, mailfrom: andrei@gherzan.com)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 84F4D3200A1C
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Aug 2021 08:45:36 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute5.internal (MEProxy); Tue, 31 Aug 2021 08:45:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type; s=fm2; bh=XwmwhDn7prIoOE7zSqeoWbpeFN6PBX9
	mKzrFt5WnR30=; b=JmjrbZT3gXvgGfFEAevqbeSLpx6Z2G6zZTX5zhO+FI4LZTP
	lPGxczpR3oSzs99fL+5oPoj0QfZdyKUwe0F3kiwDxNTjEKlRX5TamGfqO4jPLmpY
	tp3/0mwqT2ENRbQ+6erZNY1yP89UreXdernkCxMc5OP7w/vyxymeIXlbs7Jneb9v
	B/vA+szYocdxx7X2asOo/hvaO5ZH1QRD7W6gm5r+J7gL8KCtEewqFY1huUvyhTFb
	vchLQNqnAmV+C8OGQAOF+FsnSRL8yjRAra+ZIZ7EozQqabcBwecNAMeSMABng82+
	4eiS4HAEj/bB6l2ZX3dNDWVGkQJmZoesS+lNrVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=XwmwhD
	n7prIoOE7zSqeoWbpeFN6PBX9mKzrFt5WnR30=; b=OkgL0YxeYAncw+e/9JX1ac
	gDrVQEC1FRoVdGAyVAvB8/VNhJ1n/yjn1Ym0yH3sLnVqAATfchXWVJDn+yIqFs95
	ESDGzI0XSwoizmEdwk3dFbgLGpD3hj9HSaUv1kDxEFDhuRH31VwYzBXwrfvI5o/S
	8gBqIwyCzNrCYE26qJkDicT4yFa+R9cCW5wzsE8h14JsRe8qZhbeSz3v2CuIeBdX
	G6wfw90vKTITA2XnqrVBzDUGQ80ZTaDXMUYow+mQdPzz1iclF/oZsBCQWuo8X8eJ
	0tMj1FOBhmTGIm76l2Wz9iP9ZU0QaBhH4gNfo4eEyULGn4eBHOKRO6OZRmAn3rig
	==
X-ME-Sender: <xms:byQuYZ4jhWBGs90QZZS5Oupj9_sH9vxTuHO_hQFdHVEXxUEXNM8ZJg>
    <xme:byQuYW46Tth8CkOWoMBXAa0yr_H3tYrTzMK_ltgpCus1omnUxousFiPl6lNbEMBlp
    wh5eCLUF3hc1vy3vPc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvuddgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderreejnecuhfhrohhmpedftehnughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgv
    ihesghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepkeffvdfhgfegvedugf
    ffleelgeelhfdtjeeuhfevteeiheeilefgffevkeefgedvnecuffhomhgrihhnpeihohgt
    thhophhrohhjvggtthdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:byQuYQcNlpqleTX_iD1BDRPqI0IBx4HpNWkxBxTE2uIoYfq5Mk5q_g>
    <xmx:byQuYSJC7_ony2cajteMrzAZgB3K15krHGeM6nu3e8bLjLxBGvslng>
    <xmx:byQuYdJ45XwCUmDi7AmrP-Z9m2cHkLcQjdVichYLT5RFDjaFW-Yh_A>
    <xmx:cCQuYSUkb_bGbZZ1fX0gNgef206YR3eUulC-yYgW6T-caPXbzwnh7w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D66B03C0F62; Tue, 31 Aug 2021 08:45:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1124-g8f1c7cb9de-fm-20210824.001-g8f1c7cb9
Mime-Version: 1.0
Message-Id: <b052a428-da00-4a55-9027-65828171b1f6@www.fastmail.com>
In-Reply-To: <169E47906AF45A5C.6361@lists.openembedded.org>
References: <20210823135250.767173-1-andrei@gherzan.com>
 <CAOSpxdYA6FchYLNRASehUkPcQkdHkjRJyjE6VaX0z--y6m3BWg@mail.gmail.com>
 <d248b212e6724aac56ae6b1638e438f25d350486.camel@linuxfoundation.org>
 <169E47906AF45A5C.6361@lists.openembedded.org>
Date: Tue, 31 Aug 2021 13:45:11 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [dunfell][PATCH 1/2] bitbake: fetch2: fix handling of `\` in file:// SRC_URI
Content-Type: text/plain

Hey,

On Tue, 24 Aug 2021, at 16:25, Andrei Gherzan wrote:
> On Tue, 24 Aug 2021, at 15:24, Richard Purdie wrote:
> > On Tue, 2021-08-24 at 04:20 -1000, Steve Sakoman wrote:
> > > On Mon, Aug 23, 2021 at 3:53 AM Andrei Gherzan <andrei@gherzan.com> wrote:
> > > > 
> > > > From: Leif Middelschulte <leif.middelschulte@klsmartin.com>
> > > > 
> > > > Using backslashes in file:// URIs was broken.
> > > > Either the resolver would fail or the subsequent `cp` command.
> > > > Try to avoid this by putting the filenames into quotes.
> > > > 
> > > > Fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=8161
> > > > 
> > > > (Bitbake rev: aa857fa2e9cf3b0e43a9049b04ec4b0b3c779b11)
> > > 
> > > Patches for bitbake should be sent to: bitbake-devel@lists.openembedded.org
> > > 
> > > I tried applying this patch, but found that it caused errors on the autobuilder:
> > > 
> > > https://errors.yoctoproject.org/Errors/Build/129189/
> > > 
> > 
> > We dropped wildcard support in master but that is still present in dunfell. That
> > means we can't quote things as we are relying on expansion of the wildcards for
> > some SRC_URIs. This could be difficult to fix with the compatibility constraints
> > of an older release funfortunately :/.
> 
> Got it now. That's going to be painful indeed. I can't think of an easy 
> way out of this either.

Can you guys think of a way forward with this? Or shall we just drop it and consider it unsupported?

Andrei
