Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.4557.1591127694073257292
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 12:54:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 750CC40C2F;
	Tue,  2 Jun 2020 19:54:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eL2A8vXFw_iG; Tue,  2 Jun 2020 19:54:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B329540A2D;
	Tue,  2 Jun 2020 19:54:50 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2A2CB173205; Tue,  2 Jun 2020 15:54:50 -0400 (EDT)
Date: Tue, 2 Jun 2020 15:54:50 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: pb@pbcl.net
Cc: Gregor Zatko <gzatko@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] update-alternatives: introduce new package as a opkg-utils spin-off
Message-ID: <20200602195450.GV17660@denix.org>
References: <20200602190925.384853-1-gzatko@gmail.com>
 <20200602192721.GU17660@denix.org>
 <70201ad445cf106e80c44c3c5fb831501a2efda8.camel@gmail.com>
 <20200602194940.GA2207@pbcl.net>
MIME-Version: 1.0
In-Reply-To: <20200602194940.GA2207@pbcl.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2020 at 09:49:40PM +0200, Phil Blundell via lists.openembedded.org wrote:
> On Tue, Jun 02, 2020 at 09:43:45PM +0200, Gregor Zatko wrote:
> > - if you take a look at 
> > http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/tree/update-alternatives
> > you'll simply see it's a shellscript; if we wanted to have it without
> > bash we'd need a C++
> > implementation, am I right?
> 
> No, I think the point is that the shell script only needs /bin/sh.  If it
> required bash specifically then it would have #!/bin/bash at the top.

The original opkg-utils recipe has this:
RDEPENDS_${PN} += "bash"

Note that update-alternatives goes into own package and doesn't have such 
RDEPS.


> But, isn't rpmdeps supposed to sort that out automatically in any case?
> 
> p.
> 

> 

