Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0BEB977565
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 16:47:54 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id j18so34995955ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Mar 2017 08:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=LEhOeZU/me1bCfWH4tIIbi0TJXKZmVZYn/zfiuOfdBw=;
	b=N6fTToPtxRnI4pS55kN3z0Hj9t6VjyDUttRl9EsIj6g2nMRL6EX89Sd2wb7Q/VOGU9
	9Xz20vJrJFw5svOlz/MVqHnVVLRmy/BtfrSIxuLlopHsh8xofZynTxXuts81R6RkEqe9
	OHsz26Rds6XMgD4aEyy+ZImUMt0dJlk/4vFPpazL73FhNsHXgPdpg2W0oprsFlhD3Xhp
	xLRB5hMqxeRpfzpwy5n/iKVIDeKp9uciaeKF3ZQIQlIrs/qKLnURcHU0My7AGMhc/HsA
	dpNEY2AbrpyCFz9MEfnDbdxBU0ME4wXC9oAJP60FoJboQthEd9HCU3JRiaMaO/1tJ/08
	5PNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=LEhOeZU/me1bCfWH4tIIbi0TJXKZmVZYn/zfiuOfdBw=;
	b=VkwZGT02i+dsi/ZZpX8fKzu4XNCf/oDn6DbhYFd0MCRU0exr4yCEEu+Sd6pwxoER1h
	Hczt+tL23cWy+ZvBxZ0/HM/lBPTbBtJLdx0kx6pMUAeZuJsHJEP8gWrXfQks/aDbYubV
	W+8u5W1nVRQbxNsn26RpMmBwD4YrT0l7YAO8hsJ+tRb5V7Oo18JAiqvxAdb5e5gMORRY
	ry8h0embYbbKm4euCvalpRWB97d1YXmoJmsnZnDgwU+9xkA6BSF+SEfloSLZZLzxSZnz
	kLGTb8XemaZGgd3O3m7dYU64OiUgiHOfgCFyP9X/sn4zg9xI5vyNMWfAvM7BbvBqxsC7
	abGg==
X-Gm-Message-State: AMke39nxyglXpdzUo11xxJirr3BRhAJI3eh1kOBSWkf8iiOsb/66gBk/m6LdnX59K/eDP80A
X-Received: by 10.107.50.71 with SMTP id y68mr358988ioy.77.1488386875817;
	Wed, 01 Mar 2017 08:47:55 -0800 (PST)
Received: from pohly-mobl1 (p5DE8E037.dip0.t-ipconnect.de. [93.232.224.55])
	by smtp.gmail.com with ESMTPSA id n6sm7112399itb.25.2017.03.01.08.47.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Mar 2017 08:47:54 -0800 (PST)
Message-ID: <1488386871.7785.175.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 01 Mar 2017 17:47:51 +0100
In-Reply-To: <1488384106.24526.36.camel@linuxfoundation.org>
References: <1487625169-22282-1-git-send-email-anibal.limon@linux.intel.com>
	<1488312568.7785.73.camel@intel.com>
	<1488340816.24526.26.camel@linuxfoundation.org>
	<1488352225.7785.83.camel@intel.com>
	<1488381139.24526.30.camel@linuxfoundation.org>
	<1488383463.7785.165.camel@intel.com>
	<1488384106.24526.36.camel@linuxfoundation.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] yocto-compat-layer.py: Add script to YP Compatible Layer validation
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
X-List-Received-Date: Wed, 01 Mar 2017 16:47:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-03-01 at 16:01 +0000, Richard Purdie wrote:
> On Wed, 2017-03-01 at 16:51 +0100, Patrick Ohly wrote:
> > On Wed, 2017-03-01 at 15:12 +0000, Richard Purdie wrote:
> > > 
> > > On Wed, 2017-03-01 at 08:10 +0100, Patrick Ohly wrote:
> > > > 
> > > > Is the "build single distro for different machines" scenario that
> > > > I
> > > > described part of the Yocto Compliance 2.0? Should there be tests
> > > > for
> > > > it?
> > > Right now its not
> > Okay, so the goal is a bit less ambitious than I had thought. I
> > wonder
> > whether that's useful, because at least the problems Ostro and AGL
> > (at
> > least as far as I understood it from lurking on their mailing list)
> > had
> > only happened when trying to combine multiple BSP layers *and*
> > actually
> > using the different machines in the same distro.
> > 
> > > 
> > > but I'd consider it.
> > At least I'd find that useful - not sure about others ;-}
> 
> I do like the idea, I'm also mindful of walking before running...

But bumping the requirements in the Yocto Compliance often will irritate
people, because they will have to redo the compliance testing more
often.

> > >  The question is can we write an
> > > easy generic test for it,
> > It's a bit more complicated than the existing tests, but I think it
> > is
> > doable.
> > 
> > > 
> > > and also clearly phrase the criteria in the
> > > list of compliance questions with a binary yes/no answer?
> > Does the BSP layer only modify machine-specific packages and only
> > when
> > the MACHINE(s) defined by the BSP layer are selected? [yes/no]
> > 
> > The "only when" part is covered by the existing tests (because they
> > keep
> > MACHINE constant). The missing part is comparing different MACHINE
> > sstamps.
> 
> That seems reasonable, unless the layer in question applying for
> compatibility is not a BSP layer but thats a minor detail.
> 
> I'm open to more details on what the test would look like.

I guess I now have the AR to write such a test? ;-}

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




