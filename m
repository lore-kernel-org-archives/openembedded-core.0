Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QN26k-00011A-7n for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 14:13:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JCAgdK007728
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 13:10:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07427-07 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 13:10:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JCAZZ4007722
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 13:10:36 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <7AA87FA4-77D9-4D52-9D91-1BB909F268A6@dominion.thruhere.net>
References: <cover.1305800693.git.lianhao.lu@intel.com>
	<53BCC7D4-31CB-43AA-A5DD-CC1730DDD0B2@dominion.thruhere.net>
	<1305805104.3424.484.camel@rex>
	<7AA87FA4-77D9-4D52-9D91-1BB909F268A6@dominion.thruhere.net>
Date: Thu, 19 May 2011 13:10:33 +0100
Message-ID: <1305807033.3424.504.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/5] network based PR service
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
X-List-Received-Date: Thu, 19 May 2011 12:13:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-19 at 13:51 +0200, Koen Kooi wrote:
> Op 19 mei 2011, om 13:38 heeft Richard Purdie het volgende geschreven:
> 
> > On Thu, 2011-05-19 at 12:54 +0200, Koen Kooi wrote:
> >> Op 19 mei 2011, om 12:29 heeft Lianhao Lu het volgende geschreven:
> >> 
> >>> From: Lianhao Lu <lianhao.lu@intel.com>
> >>> 
> >>> This series of 5 patches implemented the network based PR service and enabled 
> >>> the poky to use it during the task do_package and do_package_write_xxx. By 
> >>> using the network based PR service and the basichash for BB_SIGNATURE_HANDLER, 
> >>> the poky user may not need to bump the PR manually everytime he/she changes 
> >>> the recipe. The package will get automatically rebuilt and new revision number 
> >>> reflecting the change will be included in the package feed.
> >> 
> >> Does it have a public/private mode? In the angstrom case, we only want
> >> developers to 'submit' PR bumps and users only retrieve them.
> > 
> > It doesn't look like it but it wouldn't be hard to only submit PR
> > changes if some kind of token was present.
> > 
> > The big question would be, if a user tried building something for which
> > PR no record was on the server and didn't have submit privileges, what
> > should the server return and how should the build behave? Hard error?
> > 
> > If its not a hard error, you are likely to run into local
> > reproducibility issues and also conflicts with the server?
> 
> I would go for a warning on the client side and an error in the log in
> the server side. If the server people care enough they'll check the
> log for errors and add the missing info.

How is the client meant to continue on when the value it gets from the
server is effectively a "don't know" reply? Default to 0?

Thinking about it, its probably fine as long as it defaulted back to
"lr" or something to show there was likely a local change that caused it
to deviate from what was on the server. It just needs to be clear it
doesn't correspond to the upstream server.

> I think we need to give this a try and see what improvements we need.

Agreed.

Cheers,

Richard



