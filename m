Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1F78178275
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 15:28:35 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id f79so3644199ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 08:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=tGjqQEA9Sf5M3CZLOo0J95Ei6G7tgpdeLLVupsMQ8AM=;
	b=Iy5NZU2Y6hRqvSOslPHZKOgDhCkyl2AEpYzXn2vDwVyMtI+wWH59mIodv8VRXhqSd4
	2TW6AjOn++586Cw4HUmLXnGO3W/tULOBOmtFYfOFzBRoFEwHs5zn9DJl8vJEYarsvu9G
	86sBkGffVO5pWebPaNlccGjZ24dOjpYNipND7Mz3PO4m9gMwbLvc9nMNxPL8149OCxoB
	TAXi5VXo2K2X53AjbMXQnrUWAhoa1jgcKI2BILvXZ3uR0z4i3PH0p5Q3CmXuMkLRDVHQ
	Paw5Z6G5UwZETOpkXhCRLFalh4gnUufYO0aRoQTuKWhNtzEa5BwVc1HO5YPymeLVeYjh
	/Czw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tGjqQEA9Sf5M3CZLOo0J95Ei6G7tgpdeLLVupsMQ8AM=;
	b=L4OxSZdrHG91UxgrEV0zfwVBWED1lZHs5OKYaxU3iRackwRtoXdjF+90n55x2GHiBk
	rwR+iC/6qbxUfms9qSarABYdgC33Y2eg/MZ/Pi3Nzmi93rc/dHto7pj1ZxmDW0WpRvrd
	k7aV9ZJaRHgnd87FzGUkLFQEZCY7yBNSr8cg/S4qtlZaYGxyarNe8V1wks62iOZM/qal
	/6QLxUFGNq9qI0ZfPDClyERAhDg9FpsYD9XFY778NFFTO4nMnS0duIpYqWGnp1mwxhpV
	+mfRzSs3yQ5bjZ54Ucm5iFRjAoxdsHhmRzfD5bLJsx2xHGX16Fd3w6n3T55EenU9GqF9
	mY0A==
X-Gm-Message-State: AODbwcD2BMu1Oxxu/5tUrEr1N9ScafC5NGZ8/Zs9NYoi5R6VRSgg+fyz
	uwzgPuxRfHNeIQ==
X-Received: by 10.107.59.138 with SMTP id i132mr7633837ioa.227.1496935716844; 
	Thu, 08 Jun 2017 08:28:36 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	66sm336626iov.21.2017.06.08.08.28.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 08 Jun 2017 08:28:35 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1496935714.8427.7.camel@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Patrick Ohly
	<patrick.ohly@intel.com>, openembedded-core@lists.openembedded.org
Date: Thu, 08 Jun 2017 10:28:34 -0500
In-Reply-To: <1496932400.6630.250.camel@linuxfoundation.org>
References: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
	<1496850184.21235.1.camel@gmail.com>
	<1496912216.6630.225.camel@linuxfoundation.org>
	<1496930142.8427.2.camel@gmail.com>
	<1496932400.6630.250.camel@linuxfoundation.org>
X-Mailer: Evolution 3.22.6 (3.22.6-2.fc25) 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 08 Jun 2017 15:28:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-06-08 at 15:33 +0100, Richard Purdie wrote:
> On Thu, 2017-06-08 at 08:55 -0500, Joshua Watt wrote:
> > On Thu, 2017-06-08 at 09:56 +0100, Richard Purdie wrote:
> > > 
> > > On Wed, 2017-06-07 at 10:43 -0500, Joshua Watt wrote:
> > > > 
> > > > On Wed, 2017-06-07 at 17:31 +0200, Patrick Ohly wrote:
> > > > > 
> > > > > 
> > > > > As discussed in the "[Openembedded-architecture] Yocto
> > > > > Compatible
> > > > > 2.0
> > > > > + signature changes" mail thread, changes in a .bbappend
> > > > > cannot
> > > > > be
> > > > > done unconditionally. Making _append and _remove depend on
> > > > > overrides
> > > > > which get set based on DISTRO_FEATURES is one way of
> > > > > achieving
> > > > > this.
> > > > > 
> > > > > The oe.utils.optional_includes() helper function has not been
> > > > > discussed before. It's an attempt to address concerns by
> > > > > developers
> > > > > that having to write code for (potentially complex) condition
> > > > > checking
> > > > > is error prone and hard to read.
> > > > 
> > > > I promise I'm not trying to start a flame war here, and perhaps
> > > > there
> > > > is history behind this that I'm not aware of but...
> > > > 
> > > > Why doesn't bitbake support some sort of "if" statement? It
> > > > seems
> > > > like most of what we are trying to do could be accomplished
> > > > with
> > > > much
> > > > less fuss if one could simply do this in the bb file:
> > > > 
> > > >  if bb.utils.contains('DISTRO_FEATURES', 'my-feature', d):
> > > >     include foo.inc
> > > 
> > > This wouldn't actually solve as much of the problem as you think
> > > it
> > > might at first glance and probably causes others, at least as I
> > > understand it (as someone who's worked on bitbake's override
> > > code).
> > > 
> > > For example, at what point does this get evaluated? Most bitbake
> > > variables are expanded at usage time, not parse time but here,
> > > the
> > > way
> > > the parser works today, it would have to do an immediate
> > > expansion
> > > of
> > > DISTRO_FEATURES to decide whether to include this file (or code
> > > block).
> > 
> > Doesn't this same argument apply to doing a conditional include of
> > a
> > file? When bitbake goes to resolve the file name while evaluating
> > the
> > AST, it has to evaluate DISTRO_FEATURES which might not be
> > complete.
> > If
> > the conditional in an "if" statement were also evaluated when
> > evaluating the AST, I believe the following snipet:
> > 
> >  require ${@ oe.utils.optional_includes(d, 'foo-feature:bar.inc') }
> > 
> > Would be (functionally) identical to something (sort of) like:
> > 
> >  if oe.utils.optional_includes(d, 'foo-feature:True'):
> >      <All of the content of bar.inc>
> > 
> > Without requiring splitting the recipe content up into multiple
> > files.
> 
> I did say the problem applied to the require syntax, yes.
> 
> Put another way, my big worry is that the if syntax will make people
> start to want if syntax for things other than include style
> operations
> and try and do other things other than "inclusion" type work with it.
> We'll also need to then start dealing with nesting and most likely
> other complications as well as pushing us to having to deal with
> immediate expansion problems.
> 
> One of the strengths of the current syntax we have to day is that it
> makes most things possible but does try and encourage you to do
> things
> "the right way". In adding an if syntax like this I suspect we're on
> a
> path which won't lead to a good place. I appreciate this isn't an
> exact
> science answer :/.
> 
> 
> To recap on how we get here, there is a problem of selective content
> inclusion in distros/layers. Right now you tend to have to buy into
> everything in a layer or nothing. This is bad for usability and
> adoption of components in layers. Sometimes its not practical to
> separate everything into isolated layers.
> 
> We've therefore tried to come up with a way of handling this adding
> minimal changes but allowing the configuration we need.
> 
> We do need to try and limit the scope of the usage of this as there
> is
> a fundamental issue, namely immediate expansion. I know most users
> will
> not realise there is even a problem with this.
> 
> *If* we limit the scope to DISTRO_FEATURES, we stand a reasonable
> chance of being able to limit the occasions a user runs into this.
> 
> On the other hand, if we add a generic if syntax, encourage usage of
> any variable and so on I think we're setting ourselves up for
> failure.

Sure. I wouldn't suggest using an if statement for "just anything", you
can surely do terrible things that way. It would (by convention) be
restricted to the same sorts of things that the conditional includes
allow now. On a similar token, you can do the same sorts of terrible
things with conditional includes as currently proposed because it has
the same enforcement policy (i.e. "by convention").

On the other hand, perhaps the range of terrible things that can be
done extends to more than just how you conditionally include something.
*What* is conditionally included might also require some scrutiny. As
you have alluded to, overrides are probably the best option for
variables, so putting them in a conditional include file is probably
not ideal. Forcing people to move the things that have to be
conditional to a separate file might actually be detrimental in a
number of ways:
 1) It might encourage recipe writers to do more in the include file
than they maybe should so that they don't have to make a plethora of
files.
 2) It might make it harder to verify that what the recipe writers did
is correct since the context of what they are doing is removed from the
parent recipe.

IIRC the conditional syntax (if or conditional include) is really
mostly needed for the parts of bitbake that don't allow overrides
(addtask and such). If that is the desired restriction, it would not be
difficult to have bitbake enforce that by only allowing the subset of
things that don't support overrides to be in the body of a if
statement. This would be more difficult with conditional includes
unless some other bitbake syntax was added.

> 
> Patrick for example mentioned IMAGE_FEATURES. This one is fraught
> with
> problems since:
> 
> a) Its a recipe level setting so using it in a base configuration
> context would end badly
> 
> b) Users change this in a variety of places some of which would be
> bitten by the immediate expansion problem even just in recipe context

Yes, that is an annoying problem. But it is neither made better or
worse by the decision to use if vs conditional include (since they have
the same semantics).

> 

> So no, I really don't like the idea of the if syntax, attractive as
> it
> may look at first.

If that's the consensus, than I'm fine with that. From my perspective,
conditional includes are just another (more difficult to use) form of
an "if" statement, and making it difficult to do things conditionally
doesn't necessarily make it better for anyone.



> 
> Cheers,
> 
> Richard
> 
> 


