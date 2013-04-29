Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UWvQP-0005MC-9X for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 23:16:27 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3TKxRbA021394; Mon, 29 Apr 2013 21:59:27 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yn26hCRlfvzs; Mon, 29 Apr 2013 21:59:26 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3TKxK8Q021381
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 29 Apr 2013 21:59:22 +0100
Message-ID: <1367269058.5379.74.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, yocto
	<yocto@yoctoproject.org>
Date: Mon, 29 Apr 2013 21:57:38 +0100
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: Status Update
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
X-List-Received-Date: Mon, 29 Apr 2013 21:17:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I've promised to start sending out some kind of status updates. I have a
few things that are worth communicating and we have a kind of fresh
start with 1.5 so here goes. This one turned out lengthier than I'd
like, I'm not planning on writing an essay in future!

I'm also hoping this email will save me repeating myself in meetings.

Pending Patches
===============

Having been concentrating on 1.4 release issues, I have then been
concentrating on overhauling the bugs in the bugzilla for the 1.5
planning rather than reviewing/merging patches. I just merged a load of
different patches into master thanks to some work from Saul pulling them
together and testing them and am working on going through any stragglers
as time permits.

1.4 Released
============

1.4 ("dylan") is now released. There seems to be a trend for people to
start testing late in the cycle and this means we can't get various
fixes into the release if issues are found. With this in mind I'm
proposing we follow up with a point release (1.4.1) in roughly six
weeks.

Point Releases
==============

I'd actually like to see us have faster turnaround on point releases.
Right now, the biggest bottleneck is the QA process since QAing a point
release *and* weekly 1.5 dev work is problematic. The QA automation work
planned for 1.5 should help with this a lot. In the meantime we're going
to do what we can for faster point release turnarounds including
planning a 1.3.2 soon as well.

1.5 Planning
============

There have been a lot of ideas put into the bugzilla. I along with
various other people have looked through them and tried to prioritise
things with a view to figuring out what we can do in 1.5. The themes are
now on https://wiki.yoctoproject.org/wiki/Yocto_1.5_Features which
summarise the key development targets we could pick out from the
individual ideas.

Plans are starting to get locked in but its not too late to add
enhancement requests to the bugzilla. If there is anything anyone feels
very strongly should be scheduled differently, please let me/us know.
There are a number of things going into the future state as we simply
don't have the resources to do everything, much as I'd like to.

Spending a little time "away"
=============================

The Yocto Project is very full on for me and I've been in the thick of
things since we started planning 0.9 back in 2010. For various reasons I
have a significant chunk of vacation time built up and to be honest, six
releases and three years later, I could use a break from things. There
never is, or will be "a good time" to do that.

I'm therefore planning to semi-disappear half way through the 1.5 cycle,
probably for around six weeks. The exact plan is still to be determined
but in that time I will ask a small team of people (Paul/Ross/Saul?) to
put pull requests together and I will handle those but I will step back
from a lot of the other day to day things.

Just to confuse things, in some of that time I will likely be playing
with some embedded devices and home automation so I may post the odd
patch but it will be as a user and I will not be doing my usual patch
review/architect role other than on the consolidated tree.

I'm warning people about this now so there are no excuses when people
need me for something and I'm not around. If you need input from me, get
it early in the 1.5 cycle.

Cheers,

Richard



