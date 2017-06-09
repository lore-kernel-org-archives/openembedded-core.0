Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id D00A278299
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 13:50:23 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id k93so33322011ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 06:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8lAxTj/bCykX0EEky3aHGglsiecV5ceO37PFu8rVmn4=;
	b=sCvjsyygWR3xN6k9fcPrCMTLMbx8j7kBbDa6ESaPTDpakiey1h234ojcG+IpN9MZ2B
	I3Xtl8FXYXxWj8WD1/MxjjWn6l0mZISBROSE4c2X36s1RtQWb5ml2i1XKzSG022xxGhx
	3o1GFGfn8QTsjzoHLOiUgjRgPPQX0/kvxA6wGMB0q3r8D3Siq2qoeDdtx8udYRkW3nSR
	emVO6gZQe6jonLBVvGhi7UEuSMBuLI4ukoK1ldA4sksuvAEN1w6tLCP+NQwABu+uHwMB
	qWIyQ1WELjDXFQTrYVayb/CxAyb7XKC/QD1ZxbBItixaeL0Oy+oP+93d5Ta8UWaDfP+W
	QtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8lAxTj/bCykX0EEky3aHGglsiecV5ceO37PFu8rVmn4=;
	b=TJQtogRGRhuUhGWzCUoSR19/QPV/ojld40tZNH0hdF7huiPJh/qOJZTfbB1L+lHASb
	gKDajbiNASurhuPybkMYVLTPbQWK9on1lbHviFC7UXzws4XjkUUSZqq9P8E7sz3m9UwF
	qpbLYx3F6b0XVtuHhe3CnAR46sFCRxxa+IK6i46E236sLs8i1lP9WyFSYhtwKuCmCDeB
	kMaYwVmEMd+kCAK7MVLClyxYofVZdrjUcfmfUcBpD4npowcJ6Pbmtae/XRW9aeKmzv1s
	Lnk2XU3Oj5ctpQ02kA8eSrpIvr97NhYpanvOT8Abrt1Xt/tgi77KFo0jz0rhW9T+eVVT
	6rng==
X-Gm-Message-State: AODbwcAIWjLHp97glZ3q7qHQQMx7qDjEIIbGN5TwaABa6sYwjnCmQqoA
	ZYG1pEf3wcKSrg==
X-Received: by 10.107.2.17 with SMTP id 17mr25049124ioc.24.1497016224918;
	Fri, 09 Jun 2017 06:50:24 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	u4sm1158695itu.1.2017.06.09.06.50.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 09 Jun 2017 06:50:24 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1497016223.3131.7.camel@gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Fri, 09 Jun 2017 08:50:23 -0500
In-Reply-To: <1496950316.30163.152.camel@intel.com>
References: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
	<1496850184.21235.1.camel@gmail.com>
	<1496912216.6630.225.camel@linuxfoundation.org>
	<1496930142.8427.2.camel@gmail.com>
	<1496932400.6630.250.camel@linuxfoundation.org>
	<1496935714.8427.7.camel@gmail.com>
	<1496950316.30163.152.camel@intel.com>
X-Mailer: Evolution 3.22.6 (3.22.6-2.fc25) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Yocto Compatible 2.0 support code
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
X-List-Received-Date: Fri, 09 Jun 2017 13:50:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-06-08 at 21:31 +0200, Patrick Ohly wrote:
> On Thu, 2017-06-08 at 10:28 -0500, Joshua Watt wrote:
> > Sure. I wouldn't suggest using an if statement for "just anything",
> > you
> > can surely do terrible things that way. It would (by convention) be
> > restricted to the same sorts of things that the conditional
> > includes
> > allow now. On a similar token, you can do the same sorts of
> > terrible
> > things with conditional includes as currently proposed because it
> > has
> > the same enforcement policy (i.e. "by convention").
> 
> I'm starting to wonder whether this "convention" can be strengthened
> with additional warnings. The code which currently evaluates the
> include
> parameter could record in the datastore the original expression and
> what
> it evaluated to, then later when the recipe gets finalized, an event
> handler can check whether evaluating the expression still gives the
> same
> result.
> 
> This would also be useful for "inherit". I remember struggling to
> understand why certain image type classes kept getting inherited
> despite
> changing IMAGE_FSTYPES - it turned out, that change had to be made
> earlier.
> 
> That's neither an argument for nor against the "if" check - the same
> could be done for that. Just something that occurred to me.
> 
> > On the other hand, perhaps the range of terrible things that can be
> > done extends to more than just how you conditionally include
> > something.
> > *What* is conditionally included might also require some scrutiny.
> > As
> > you have alluded to, overrides are probably the best option for
> > variables, so putting them in a conditional include file is
> > probably
> > not ideal. Forcing people to move the things that have to be
> > conditional to a separate file might actually be detrimental in a
> > number of ways:
> >  1) It might encourage recipe writers to do more in the include
> > file
> > than they maybe should so that they don't have to make a plethora
> > of
> > files.
> >  2) It might make it harder to verify that what the recipe writers
> > did
> > is correct since the context of what they are doing is removed from
> > the
> > parent recipe.
> > 
> > IIRC the conditional syntax (if or conditional include) is really
> > mostly needed for the parts of bitbake that don't allow overrides
> > (addtask and such). If that is the desired restriction, it would
> > not be
> > difficult to have bitbake enforce that by only allowing the subset
> > of
> > things that don't support overrides to be in the body of a if
> > statement. This would be more difficult with conditional includes
> > unless some other bitbake syntax was added.
> 
> There's some truth to that IMHO, but I'm uncertain whether it
> warrants
> introducing entirely new syntax. In refkit, I only ran into one
> particular case were an include file was necessary.

I'd be curious to see that. How big was the .inc file?

> 
> > If that's the consensus, than I'm fine with that. From my
> > perspective,
> > conditional includes are just another (more difficult to use) form
> > of
> > an "if" statement, and making it difficult to do things
> > conditionally
> > doesn't necessarily make it better for anyone.
> 
> Making it hard sends the message that it shouldn't be used lightly.
> Documentation will have to make clear that conditional includes are
> the
> last resort when everything else isn't usable.
> 


