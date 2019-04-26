Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id CF6007DB05
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 13:52:28 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id a9so4572445wrp.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 06:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=WB23MAFuPMyQhRYxt+VFhCR1TSjMSR1i8+npqR6f2E4=;
	b=iJPjUYEAEBpSR1KJU4xCmq97nEHVvMwFOarWCbULavQO9LbVCn75xmpdK2Jiv+eAW9
	8E0WgGoOBULlUaycAMARUZM478Eh5KBR/9+N4jfp1pbeJIb3839PJ/d9RuMDsKjRWYSa
	KvI9jK3YuH9UlETddk+UatqMdqtWjRbV7dHzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=WB23MAFuPMyQhRYxt+VFhCR1TSjMSR1i8+npqR6f2E4=;
	b=nkTil51vxsi0JM+B3ZSHbFs+n3Ug+4VK5iT0cpgpToGq95pAZaNF6hRHTxd+aLhak1
	/giaDp8km48qIlu1Z8CsJVfhGQqTl5E8tceL028U1whD8uEnVKeT8RUst77fppLUbAHp
	SHSqr7DOTWos3FpT5MjCqjmT0VPTG1s/HGMuDnLw3esNvAp8h6nbnXeYMqnedKjXo4A7
	gsI7V3Q8BJ7PESXsWxmwDPbUewk0XqZrqEbibSYsHBDpzYWJslZcgnh4w4tt7f5Gc6WE
	vMGWNXmFZi3iVL1XnXFCrptOU35OxoAN10r44HCUYuwJ7i00i4hMvr8P/n1Tizv4MceR
	hrzg==
X-Gm-Message-State: APjAAAUcpQDHuhqZvC8ommn9JloydlBSeBtIxNHoyqBylpfI01ogWzhp
	0Ijxqozyi49kLtl6xEI5TPYZgQ==
X-Google-Smtp-Source: APXvYqzIo1ahNkYj+bW+k7AkpEyLO1ZKrckc9DX4EqRvXRtkoIfFPRk/RZY4nirT8oFddAEU/otfMg==
X-Received: by 2002:adf:f7d0:: with SMTP id a16mr4659012wrq.211.1556286749553; 
	Fri, 26 Apr 2019 06:52:29 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v129sm1619091wmf.22.2019.04.26.06.52.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 26 Apr 2019 06:52:28 -0700 (PDT)
Message-ID: <7f1fffeb42484cfec870f1a28a1ee5443de66f68.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tanu Kaskinen <tanuk@iki.fi>, Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Apr 2019 14:52:27 +0100
In-Reply-To: <ab836c42b9708c98ed658453e7a28620183cf9f8.camel@iki.fi>
References: <cover.1496979431.git.raj.khem@gmail.com>
	<c0e598696af9be3f567751a8641effb08431a7d2.1496979431.git.raj.khem@gmail.com>
	<CAJTo0La6u=Tzzsow5ZYwqmWHY8RzyvgVqT=J4J9UpKy8uKbb9A@mail.gmail.com>
	<CAMKF1srdVU0p-e4gPJx5rNEhk4aQdsiELuz+-1AsD_tgG6b_Gw@mail.gmail.com>
	<1497026309.2435.5.camel@iki.fi>
	<CAMKF1soH0BshzDQorBw7mmXGCgCg_OF=uc5pX1q=J_-ZPqtGMg@mail.gmail.com>
	<49993ca438e2a8b32473ad524404d8927c12d23e.camel@iki.fi>
	<CAMKF1so+LSFMd8+E1E7O1KGGNt2CZSdbC8sGfjVtNE9iDdNw1A@mail.gmail.com>
	<ab836c42b9708c98ed658453e7a28620183cf9f8.camel@iki.fi>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] pulseaudio: disable PIE flags when hardened flags are enabled
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
X-List-Received-Date: Fri, 26 Apr 2019 13:52:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2019-04-26 at 15:53 +0300, Tanu Kaskinen wrote:
> On Mon, 2019-04-22 at 14:28 -0600, Khem Raj wrote:
> > On Mon, Apr 22, 2019 at 6:33 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
> > 
> > > On Fri, 2017-06-09 at 10:10 -0700, Khem Raj wrote:
> > > > On Fri, Jun 9, 2017 at 9:38 AM, Tanu Kaskinen <tanuk@iki.fi>
> > > > wrote:
> > > > > On Fri, 2017-06-09 at 13:07 +0000, Khem Raj wrote:
> > > > > > On Fri, Jun 9, 2017 at 5:56 AM Burton, Ross <
> > > > > > ross.burton@intel.com>
> > > wrote:
> > > > > > > On 9 June 2017 at 04:41, Khem Raj <raj.khem@gmail.com>
> > > > > > > wrote:
> > > > > > > 
> > > > > > > > +SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
> > > > > > > > 
> > > > > > > 
> > > > > > > These tend to go into security-flags.inc, not the recipe.
> > > > > > > 
> > > > > > 
> > > > > > I know that's been the case but I think having a global
> > > > > > file is
> > > error prone
> > > > > > its better to have it in recipe context since it can get
> > > > > > attention at
> > > > > > upgrade time to test if this has been fixed in new release
> > > > > > etc
> > > > > 
> > > > > Do you mean that there's some bug in pulseaudio, and this is
> > > > > a
> > > > > workaround for it? Is the bug that there are textrels? Ross
> > > > > saw
> > > > > textrels in pulseaudio before (see the discussion starting at
> > > > > [1]), but
> > > > > I was unable to reproduce that. If you give instructions for
> > > > > reproducing the problem, I'll see if I can fix pulseaudio
> > > > > (until then
> > > > > I'm fine with having a workaround).
> > > > > 
> > > > 
> > > > yes there is a bug lurking when compiling with hardening flags
> > > > are
> > > turned on
> > > > so you can do something like
> > > > 
> > > > in local.conf
> > > > 
> > > > require conf/distro/include/security_flags.inc
> > > > 
> > > > then
> > > > 
> > > > MACHINE=qemux86 bitbake pulseaudio
> > > > 
> > > > it also happens on arm so qemuarm will reproduce it too.
> > > > 
> > > > some assembly code is probably missing using GOT relative
> > > > accesses
> > > 
> > > Resurrecting this ancient thread... I finally tried to reproduce
> > > this
> > > problem with the given instructions. No success. Have you still
> > > been
> > > running into this issue?
> > 
> > I don’t know for sure if this still exists but we did disable
> > assembly in
> > few packages which addresses this issue since in assembly PIC has
> > to be
> > respected
> > In hand written code
> > 
> > You might have to check if we did something similar for pulseaudio
> 
> There seem to be no such changes to the pulseaudio recipe. Some
> upstream fix seems unlikely as well. The only possibly relevant
> change
> that I could find was removing a buggy implementation of reading the
> cpuid register (the removed code was replaced with the __get_cpuid()
> macro that compilers provide in cpuid.h).
> 
> Oh well, if the problem reappears, let me know.

Shortly after this, Khem submitted:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=c91314ec160420a320007d552cec6c7da4d54833
and 
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=6733a7873ca121295a2e309a6915b9816e1ae36b

which I suspect made this other change unnecessary?

Cheers,

Richard


