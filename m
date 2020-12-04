Received: from pbcl.net (pbcl.net [159.69.221.92])
 by mx.groups.io with SMTP id smtpd.web08.12643.1607079704192362286
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 03:01:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pbcl.net, ip: 159.69.221.92, mailfrom: pb@pbcl.net)
Received: from pb by pbcl.net with local (Exim 4.92)
	(envelope-from <pb@pbcl.net>)
	id 1kl8qM-0001WT-Jm; Fri, 04 Dec 2020 12:01:42 +0100
Date: Fri, 4 Dec 2020 12:01:42 +0100
From: "Phil Blundell" <pb@pbcl.net>
To: Sinan Kaya <okaya@kernel.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [meta-oe][PATCH v4 1/3] introduce lib_subpackage
Message-ID: <20201204110142.GV30831@pbcl.net>
References: <20201203232826.28519-1-okaya@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20201203232826.28519-1-okaya@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 03, 2020 at 11:28:24PM +0000, Sinan Kaya wrote:
> This subclass allows us to easily split a recipe into
> subpackages.

"lib_subpackage" seems a slightly odd name for something that isn't
dealing with libraries.  What's the etymology of that?

> +    d.appendVar("PACKAGES", " " + " ".join(packages))
> +    d.appendVar("PROVIDES", " " + " ".join(packages))

It seems a bit strange to be putting the same things in PACKAGES and
PROVIDES.  Is that actually necessary?

p.

