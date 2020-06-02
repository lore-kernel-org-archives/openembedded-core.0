Received: from pbcl.net (pbcl.net [159.69.221.92])
 by mx.groups.io with SMTP id smtpd.web11.4592.1591128010541477398
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 13:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pbcl.net, ip: 159.69.221.92, mailfrom: pb@pbcl.net)
Received: from pb by pbcl.net with local (Exim 4.92)
	(envelope-from <pb@pbcl.net>)
	id 1jgD4y-0003sX-L7; Tue, 02 Jun 2020 22:00:08 +0200
Date: Tue, 2 Jun 2020 22:00:08 +0200
From: "Phil Blundell" <pb@pbcl.net>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Andreas Oberritter <obi@opendreambox.org>
Subject: Re: [OE-core] [PATCH v3] glibc: move ld.so.conf back to main package
Message-ID: <20200602200008.GB2207@pbcl.net>
References: <1614B0E5E96C4272.14405@lists.openembedded.org>
 <20200602121722.32623-1-rasmus.villemoes@prevas.dk>
MIME-Version: 1.0
In-Reply-To: <20200602121722.32623-1-rasmus.villemoes@prevas.dk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2020 at 02:17:22PM +0200, Rasmus Villemoes wrote:
> In case of a read-only rootfs, one could add some logic to remove them
> if one really wants to shave those few dozens of bytes off.

Note that there's also a slight runtime performance penalty associated
with having these files in place if they're not doing anything useful.
It'd be nice to try to make sure that nothing regresses in that area.

p.

