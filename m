Received: from pbcl.net (pbcl.net [159.69.221.92])
 by mx.groups.io with SMTP id smtpd.web10.4057.1591126350978638413
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 12:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pbcl.net, ip: 159.69.221.92, mailfrom: pb@pbcl.net)
Received: from pb by pbcl.net with local (Exim 4.92)
	(envelope-from <pb@pbcl.net>)
	id 1jgCeC-0003eZ-E9; Tue, 02 Jun 2020 21:32:28 +0200
Date: Tue, 2 Jun 2020 21:32:28 +0200
From: "Phil Blundell" <pb@pbcl.net>
To: Gregor Zatko <gzatko@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] update-alternatives: introduce new package as a opkg-utils spin-off
Message-ID: <20200602193228.GA10325@pbcl.net>
References: <20200602190925.384853-1-gzatko@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200602190925.384853-1-gzatko@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2020 at 09:09:25PM +0200, Gregor Zatko wrote:
> In some cases there is a need for update-alternatives script which gets built
> within opkg-utils recipe into a standalone package. However, this causes to
> many unnecessary dependencies, including Python, bc, OpenSSL etc. to be built.

Funny, it's almost as if 44b538eedab7c255051fa3375f9f2439cd2db3dd never
happened... :-)

p.

