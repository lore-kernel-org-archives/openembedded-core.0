Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q2QwW-00038s-R4 for openembedded-core@lists.openembedded.org;
	Wed, 23 Mar 2011 17:30:00 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2NGRvc8001573;
	Wed, 23 Mar 2011 16:27:57 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00448-06; Wed, 23 Mar 2011 16:27:53 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2NGRpFl001565
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 23 Mar 2011 16:27:51 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <EEB43C23-7673-4F6B-86BA-B3C15C52C744@dominion.thruhere.net>
References: <6CA3B184-AD05-4A9B-90CE-25AE38DECA39@dominion.thruhere.net>
	<AANLkTimcd8-9jd31uJe0EGLCit0YitBRmH9tuF8G50qn@mail.gmail.com>
	<1300894797.3018.7.camel@rex>
	<EEB43C23-7673-4F6B-86BA-B3C15C52C744@dominion.thruhere.net>
Date: Wed, 23 Mar 2011 16:27:49 +0000
Message-ID: <1300897669.3018.16.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] recipes-efl inside meta-oe or meta-efl next to meta-oe?
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
X-List-Received-Date: Wed, 23 Mar 2011 16:30:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-03-23 at 16:42 +0100, Koen Kooi wrote:
> Op 23 mrt 2011, om 16:39 heeft Richard Purdie het volgende geschreven:
> 
> > On Wed, 2011-03-23 at 08:19 -0700, Khem Raj wrote:
> >> On Wed, Mar 23, 2011 at 4:49 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> >>> Hi,
> >>> 
> >>> I'd like to import the EFL recipes Martin did from meta-shr into the meta-openembedded repo. Before I go bothering Martin about it, what would be the best place to put them?
> >>> 
> >>> Inside meta-oe:
> >>> 
> >>> meta-openembedded/
> >>>       meta-oe/
> >>>               recipes-efl
> >> 
> >> Can efl we layered directly on top of oe-core  ? i.e. without needing meta-oe
> >> in that case its better to be an independent layer. otherwise I would say put
> >> them under recipes-efl
> > 
> > I'd hope that it would be possible to run it on top of oe-core, at least
> > for its basic components. If its not possible, I'd like to understand
> > why so we can see if its possible to fix it.
> > 
> > Ultimately, we need to add some kind of layer dependency information
> > although we don't have an implementation of that yet.
> 
> I;m currently usng a low-tech README for that:
> 
> http://gitorious.org/angstrom/angstrom-layers/blobs/master/README
> 
> would be nice to come up with something machine parse-able.

That's the plan, have something in README's for now and then improve the
infrastructure over time to automate it.

We could define a simple convention of something like this in
layer.conf:

LAYERNAMES += "thislayername:<optionalversion>"

LAYERREQUIRES := '${@oe.util.layerrequirements(["layerA:versionA", "layerb:versionB"])}'

but its just random ideas off the top of my head at the moment!

Cheers,

Richard



