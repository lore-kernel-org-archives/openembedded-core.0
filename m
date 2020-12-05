Received: from pbcl.net (pbcl.net [159.69.221.92])
 by mx.groups.io with SMTP id smtpd.web09.10831.1607207020771934196
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Dec 2020 14:23:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pbcl.net, ip: 159.69.221.92, mailfrom: pb@pbcl.net)
Received: from pb by pbcl.net with local (Exim 4.92)
	(envelope-from <pb@pbcl.net>)
	id 1klfxp-00089C-Vi; Sat, 05 Dec 2020 23:23:37 +0100
Date: Sat, 5 Dec 2020 23:23:37 +0100
From: "Phil Blundell" <pb@pbcl.net>
To: Sinan Kaya <okaya@kernel.org>
Cc: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH v4 1/3] introduce lib_subpackage
Message-ID: <20201205222337.GW30831@pbcl.net>
References: <20201203232826.28519-1-okaya@kernel.org>
 <20201204110142.GV30831@pbcl.net>
 <d7593470-039f-e4c4-e4a9-36c475cf99c0@kernel.org>
MIME-Version: 1.0
In-Reply-To: <d7593470-039f-e4c4-e4a9-36c475cf99c0@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 04, 2020 at 08:30:01AM -0500, Sinan Kaya wrote:
> +Richard,
> 
> On 12/4/2020 6:01 AM, Phil Blundell via lists.openembedded.org wrote:
> > On Thu, Dec 03, 2020 at 11:28:24PM +0000, Sinan Kaya wrote:
> >> This subclass allows us to easily split a recipe into
> >> subpackages.
> > 
> > "lib_subpackage" seems a slightly odd name for something that isn't
> > dealing with libraries.  What's the etymology of that?
> 
> I'm open to giving it a better name. Richard pointed me to a file
> beginning with lib_foo.class for where this functionality could be
> hosted before.

I suppose the interesting question here, then, is "what is this class
actually for?"  The description above says that it "allows us to easily
split a recipe into subpackages" but doesn't say very much about what
the consequences of including the class actually are or under what
circumstances that's useful.

Reading between the lines the idea seems to be that this class is
appropriate for recipes that build a collection of utilities each of
which is essentially independent and is useful in its own right
without any of the others.  Is that right?

> >> +    d.appendVar("PACKAGES", " " + " ".join(packages))
> >> +    d.appendVar("PROVIDES", " " + " ".join(packages))
> > 
> > It seems a bit strange to be putting the same things in PACKAGES and
> > PROVIDES.  Is that actually necessary?
> 
> I want to be able to include procps-ps without the entire procps
> package. I was not able to do that without the above two lines.

What do you mean by "include procps-ps"?  It sounds like you're saying
you want to be able to introduce procps-ps to DEPENDS, is that right?

p.
