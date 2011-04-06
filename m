Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Q7OQZ-00028g-W4
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 10:49:28 +0200
Received: by iye7 with SMTP id 7so1331160iye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Apr 2011 01:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=JPxMsQfR7jQJBOGIa82zuiC33dVLtiqkDGbtQqI8OAU=;
	b=UjC1w79/sHE8oJ5mp68+EwvOHZD4CdVG4iVR2z4/KKo0BrLubLJklHrBEvWDQifhWK
	763UsRAOXzIItRnDQfwQJWh8+n5VP2uIQ/lImnimQsLv7cugZVjWZcRa7LgFLo5Apt6g
	rlPQqfZIjyOTuYECO6e4gBbH+UekC4EmS3NYk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=cKjCJXrRi1YeECKEPwUCOA6CdnTjnMJcQ0fEfdFES4hm3bvUAgmPXg2VyCWrr5dfj2
	wws5u3vtBrJ+akC3FoBMekGEQucN0Kyv0R0mf/xM9za7IRyNySTCEjMK41wymv6zQPAz
	q5LPHechM3xug0fexNCJmpm2GQM/KgmDuhK+U=
MIME-Version: 1.0
Received: by 10.231.3.76 with SMTP id 12mr677502ibm.166.1302079637550; Wed, 06
	Apr 2011 01:47:17 -0700 (PDT)
Received: by 10.231.19.204 with HTTP; Wed, 6 Apr 2011 01:47:17 -0700 (PDT)
In-Reply-To: <1302001365.24596.459.camel@rex>
References: <1302001365.24596.459.camel@rex>
Date: Wed, 6 Apr 2011 10:47:17 +0200
Message-ID: <BANLkTim4ouc6ssOhfU4Dd8OfEq81MfC_gQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, poky@yoctoproject.org
Subject: Re: Proposed Multilib Implementation Brainstorming
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Apr 2011 08:49:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/4/5 Richard Purdie <richard.purdie@linuxfoundation.org>:

[...]
>
> Does this make sense to everyone, are there any questions/ objections/
> concerns/ things I've missed?

I think most embedded systems would only use one lib. To take your
lib/lib64 example:
If I am developing for an embedded system I know whether it will run
as 32 or 64 bit, so there is no need to have both.

multilib has its merits when it comes to supporting multiple hardware systems.
However as in the embedded world one is typically targeting a specific
hardware configuration.
(actually I don't recall having seen requests for multilib on the ML
before, although I could have missed it).

Also I'm somewhat worried by the actual complexity this adds (to the
build process and the recipes, and timewise probably also to the
bootstrap process as additional packages have to be built).

Not sure if that is a desirable route forward, but if we (we as in OE
members + developers) feel that OE should go that way, I would
sugggest to have a way to opt-in or opt-out

Frans


