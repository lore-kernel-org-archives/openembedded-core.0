Received: from pbcl.net (pbcl.net [159.69.221.92])
 by mx.groups.io with SMTP id smtpd.web11.4366.1591127383321787799
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 12:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pbcl.net, ip: 159.69.221.92, mailfrom: pb@pbcl.net)
Received: from pb by pbcl.net with local (Exim 4.92)
	(envelope-from <pb@pbcl.net>)
	id 1jgCuq-0003n5-VD; Tue, 02 Jun 2020 21:49:40 +0200
Date: Tue, 2 Jun 2020 21:49:40 +0200
From: "Phil Blundell" <pb@pbcl.net>
To: Gregor Zatko <gzatko@gmail.com>
Cc: Denys Dmytriyenko <denis@denix.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] update-alternatives: introduce new package as a opkg-utils spin-off
Message-ID: <20200602194940.GA2207@pbcl.net>
References: <20200602190925.384853-1-gzatko@gmail.com>
 <20200602192721.GU17660@denix.org>
 <70201ad445cf106e80c44c3c5fb831501a2efda8.camel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <70201ad445cf106e80c44c3c5fb831501a2efda8.camel@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2020 at 09:43:45PM +0200, Gregor Zatko wrote:
> - if you take a look at 
> http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/tree/update-alternatives
> you'll simply see it's a shellscript; if we wanted to have it without
> bash we'd need a C++
> implementation, am I right?

No, I think the point is that the shell script only needs /bin/sh.  If it
required bash specifically then it would have #!/bin/bash at the top.

But, isn't rpmdeps supposed to sort that out automatically in any case?

p.

