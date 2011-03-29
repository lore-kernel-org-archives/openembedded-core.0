Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q4awK-0005eF-37 for openembedded-core@lists.openembedded.org;
	Tue, 29 Mar 2011 17:34:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2TFWg9Y021983
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2011 16:32:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21807-03 for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2011 16:32:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2TFWYXw021977
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2011 16:32:34 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4D91C35B.50708@mlbassoc.com>
References: <600E597B-5D02-419E-A378-5EE511B848FA@dominion.thruhere.net>
	<4D90DA4A.3030605@mentor.com>  <4D91C35B.50708@mlbassoc.com>
Date: Tue, 29 Mar 2011 16:32:28 +0100
Message-ID: <1301412748.24596.58.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Using meta-toolchain output as prebuilt toolchains
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
X-List-Received-Date: Tue, 29 Mar 2011 15:34:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-03-29 at 05:32 -0600, Gary Thomas wrote:
> On 03/28/2011 12:58 PM, Tom Rini wrote:
> > On 03/27/2011 04:44 AM, Koen Kooi wrote:
> >> What is the preferred way of 'importing' prebuilt toolchains into OE-core? In oe.dev I can use this: http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/meta/external-toolchain-angstrom.bb to 'import' an angstrom toolchain built with 'bitbake meta-toolchain', but I'm not sure how to do that in OE-core.
> >>
> >> My actual use case is actually 2 use-cases:
> >>
> >> 1) Hand people a prebuilt angstrom toolchain and migrate them to OE while keeping the toolchain
> >> 2) "Get started in 10 minutes" type of thing, I suspect an sstate mirror might be better.
> >>
> >> So any suggestions for #2 as well?
> >
> > sstate is the best way to catch #2 and I know in general there's "look
> > at this URI for the file you want" bits.  I haven't yet started kicking
> > the tires on sstate as hard as I have for packaged-staging however.
> 
> This is the approach I've been working on to pass on to my customers.  The
> idea that I can give them a packaged bundle which includes prebuilt tools
> is far more attractive than a simple poky (or oe-core plus layers) tree
> which involves many hours of building to produce a simple image.
> 
> Hopefully, the sstate method will become more stable over time.  The problem
> I've had with it recently is that there are so many variables which are used
> to decide if the sstate data is valid (see Richard's description on how this
> works) that if the smallest thing changes, the whole lot becomes useless :-(
> so it's really only valid for a [fairly] static repository.

It depends what changes your customers expect to make and whether with
those changes you consider the prebuilt data still to be valid. I agree
that the defaults do tend towards detecting even small changes. I think
over time we'll get a better feel for the things that should/shouldn't
be included in there. It is almost totally customisable and what we're
missing now is some good "policy" type data.

Cheers,

Richard




