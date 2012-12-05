Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TgHGZ-0007oG-HA for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 16:52:07 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB5FbhtX019400;
	Wed, 5 Dec 2012 15:37:43 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18639-07; Wed,  5 Dec 2012 15:37:39 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB5FbZAZ019394
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 5 Dec 2012 15:37:35 GMT
Message-ID: <1354721845.25268.118.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 05 Dec 2012 15:37:25 +0000
In-Reply-To: <20121205152442.GC3396@jama.jama.net>
References: <1354716839.25268.105.camel@ted>
	<20121205144539.GA3396@jama.jama.net> <1354720793.25268.115.camel@ted>
	<20121205152442.GC3396@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Switch to PR server model for PR bumps - 1 week
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Dec 2012 15:52:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-12-05 at 16:24 +0100, Martin Jansa wrote:
> On Wed, Dec 05, 2012 at 03:19:53PM +0000, Richard Purdie wrote:
> > On Wed, 2012-12-05 at 15:45 +0100, Martin Jansa wrote:
> > Added to the page: "As implemented, values from the PR service are
> > included into the PR field as an addition of the form ".X" so r0 becomes
> > r0.1, r0.2 and so on. This allows existing PR values to be used for
> > whatever reasons allowing manual PR bumps should it be necessary."
> > 
> > (should cover both questions)
> > 
> > As for removing PR, as recipes are upgraded, I'm expecting we will
> > remove PR values so we should get a smooth transition. We can still have
> > PR values, it will just become an exception rather than the rule.
> 
> So default "hidden" r0 is still used in such cases and PRSERV adds again
> just .X.

Exactly.

> Thanks for answers.

They were good questions :)

Cheers,

Richard




