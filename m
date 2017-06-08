Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id D925478261
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 13:55:42 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id k93so20406252ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 06:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=58qqEWJ22qsij/ZqWxZuIp7S/mAr1NX38iD+DDbTGt0=;
	b=lMypEtId5nhX79QA/zyWkfamIe7OrnK1E9zUfowGT4CMNpqTvpBO3DwG+sJw3yeAXL
	RZecDI8Xx2vJyEEsyVdwItS4aEDVjW9rtGCpl40tH+NlTrYEDtMFM1S1Kt5PIK0VPWzp
	/C3z8V6hUUdxxkX+iz9qVB1WwQB6XWTeDswa+wuU/nyqyM6QhXLveJxcQCbuGq30+GR3
	6tTIF1eDkm01Cmcxy3+wKTcwOvdp556FmWhH7HzyAzyj1CliWmQujrplIOSm+ylV+/cw
	hU7Fut1u3iX7cSwVJqdnzz1KU2dLPRDxMGrHjz8e9FhbdK17hQsSCBsry8vPBxv4PQru
	EBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=58qqEWJ22qsij/ZqWxZuIp7S/mAr1NX38iD+DDbTGt0=;
	b=EIFOXpW0WymayuC251gOifacZeO+r7pjv5olSqpm4diyrzuM9ajPnwMvwlWUESqR30
	ZE7tvLT2Sa/IKa97y7byEhQPKnM6R4SB6wbWmN/PIm0tmikOAgFjXzm9zyRPf6Pb278q
	ejX2kWTZbxi1ug81hjxilnXvALS6YGoZoTssIDa0/3Qv/5aDyOKH4YzFFiUcMuXNfkn5
	KDoHTRosbXCQociOb0LtXdl9N8ABqUQSfdyFeIV459HYvY6Ih12B5/TISt9vesUAqa3W
	kwip2CaFP2pdzRpNyF8D+AvXyK6P6JOzjHLy+7jriJofYeOU3ZCz9PEFTW7RJWy4o0ds
	jRZA==
X-Gm-Message-State: AODbwcAFvKWm6H+WES2RD0RKqchSFBjKS9873RqjQwahJbkRyHeT/pQN
	6bLFT9EnGGVq5Q==
X-Received: by 10.107.135.224 with SMTP id r93mr26674818ioi.36.1496930144418; 
	Thu, 08 Jun 2017 06:55:44 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	l19sm2174254ioe.3.2017.06.08.06.55.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 08 Jun 2017 06:55:43 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1496930142.8427.2.camel@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Patrick Ohly
	<patrick.ohly@intel.com>, openembedded-core@lists.openembedded.org
Date: Thu, 08 Jun 2017 08:55:42 -0500
In-Reply-To: <1496912216.6630.225.camel@linuxfoundation.org>
References: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
	<1496850184.21235.1.camel@gmail.com>
	<1496912216.6630.225.camel@linuxfoundation.org>
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
X-List-Received-Date: Thu, 08 Jun 2017 13:55:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-06-08 at 09:56 +0100, Richard Purdie wrote:
> On Wed, 2017-06-07 at 10:43 -0500, Joshua Watt wrote:
> > On Wed, 2017-06-07 at 17:31 +0200, Patrick Ohly wrote:
> > > 
> > > As discussed in the "[Openembedded-architecture] Yocto Compatible
> > > 2.0
> > > + signature changes" mail thread, changes in a .bbappend cannot
> > > be
> > > done unconditionally. Making _append and _remove depend on
> > > overrides
> > > which get set based on DISTRO_FEATURES is one way of achieving
> > > this.
> > > 
> > > The oe.utils.optional_includes() helper function has not been
> > > discussed before. It's an attempt to address concerns by
> > > developers
> > > that having to write code for (potentially complex) condition
> > > checking
> > > is error prone and hard to read.
> > 
> > I promise I'm not trying to start a flame war here, and perhaps
> > there
> > is history behind this that I'm not aware of but...
> > 
> > Why doesn't bitbake support some sort of "if" statement? It seems
> > like most of what we are trying to do could be accomplished with
> > much
> > less fuss if one could simply do this in the bb file:
> > 
> >  if bb.utils.contains('DISTRO_FEATURES', 'my-feature', d):
> >     include foo.inc
> 
> This wouldn't actually solve as much of the problem as you think it
> might at first glance and probably causes others, at least as I
> understand it (as someone who's worked on bitbake's override code).
> 
> For example, at what point does this get evaluated? Most bitbake
> variables are expanded at usage time, not parse time but here, the
> way
> the parser works today, it would have to do an immediate expansion of
> DISTRO_FEATURES to decide whether to include this file (or code
> block).

Doesn't this same argument apply to doing a conditional include of a
file? When bitbake goes to resolve the file name while evaluating the
AST, it has to evaluate DISTRO_FEATURES which might not be complete. If
the conditional in an "if" statement were also evaluated when
evaluating the AST, I believe the following snipet:

 require ${@ oe.utils.optional_includes(d, 'foo-feature:bar.inc') }

Would be (functionally) identical to something (sort of) like:

 if oe.utils.optional_includes(d, 'foo-feature:True'):
     <All of the content of bar.inc>

Without requiring splitting the recipe content up into multiple files.


> So ok, lets assume we change bitbake massively and defer the
> expansion
> somehow. What if foo.inc influences the contents of DISTRO_FEATURES?
> Should it then "unparse" foo.inc if my-feature was removed? or error?
> or silently ignore that?
> 
> bitbake's main conditional today is through overrides and these do
> allow a controlled delayed expansion of metadata in most cases. In
> some
> cases such as include and inherit statements there is still the
> immediate expansion issue above but at least there aren't huge
> changes
> to the parser required to make it work so its the best of both
> worlds.

I was curious as to what it would it would actually take to make "if"
statements like the one I described above work (and I wanted to learn
more about the bitbake internals), so I did a proof of concept on
GitHub:
https://github.com/JPEWdev/poky/commit/998a00f122154bb509d22b412fba0773
97f6e433

It's actually not particularly terrible IMHO, but I'm sure it could be
better.

I can repost it to the bitbake mailing list as an RFC if you think that
would be helpful.

> 
> > One could even eliminate the separate inc file and simply put its
> > contents under the conditional (as much fun as it seems to have to
> > open
> > a new file just to see what a recipe is doing with a distro
> > feature...)
> > 
> > It would also appear that this could make a lot of other things
> > simpler as well (and may even negate the need to backfill
> > DISTRO_FEATURES into overrides?)
> 
> See if the above gives food for thought on that...
> 
> The big problems are the corner cases. If we do add new syntax it
> needs
> to avoid these as we already have some pretty nasty ones, thankfully
> most people don't hit them though.

That's fine. I"m not particularly trying to say that an "if" statement
is the magic bullet for corner cases, but I think it is equivalent
functionality to conditional includes and more readable and
maintainable for people writing recipes. Maybe that means
DISTRO_FEATURES still need to become OVERRIDES, IDK.

> 
> Cheers,
> 
> Richard


