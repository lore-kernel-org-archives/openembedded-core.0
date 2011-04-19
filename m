Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QCJah-0005TW-Ig for openembedded-core@lists.openembedded.org;
	Wed, 20 Apr 2011 00:40:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3JMbqcg009137
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2011 23:37:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08559-10 for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2011 23:37:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3JMbkPZ009131
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2011 23:37:46 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTi=shye_RULY2_AZuz9Kca8+N_qNxQ@mail.gmail.com>
References: <BANLkTini7EDvr-GoW1AP3aaQWjv6tYjOLQ@mail.gmail.com>
	<1303225305.5518.219.camel@rex>
	<BANLkTi=shye_RULY2_AZuz9Kca8+N_qNxQ@mail.gmail.com>
Date: Tue, 19 Apr 2011 23:37:33 +0100
Message-ID: <1303252653.5518.293.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: gcc 4.6 recipes naming
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
X-List-Received-Date: Tue, 19 Apr 2011 22:40:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-04-19 at 10:33 -0700, Khem Raj wrote:
> On Tue, Apr 19, 2011 at 8:01 AM, Richard Purdie
> > I think this is just going to confuse people to be honest. I'm happy to
> > stick to the 4.6.0 naming, then move to 4.6.1 and so forth over time.
> > People expect to see the .X number else they just get confused about
> > which patch revision we're at.
> >
> > What I'm thinking we will do differently to OE is not to have every
> > point release available but try and stick to the latest. The exception
> > would be when there is a problem in the point release version which we
> > don't have a fix for.
> 
> usually later minor release will always be better (since they are bugfixes only)
> so chances are less that we will regress

Agreed, I'm just being clear what the expectations are! :)

> > Does that sound reasonable?
> >
> 
> Yes having just one minor release at a time makes it easier certainly.
> I was trying to make it easy to push updates and we could avoid some
> git operations and logs would be straighter too since recipes would live
> longer otherwise we will be git mv'ing them every 6 months when release happens.

I think this is fine, we do this for the other recipes too.

Cheers,

Richard






