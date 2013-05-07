Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UZhYD-0006xk-EQ for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 15:03:29 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r47ClWD9004629; Tue, 7 May 2013 13:47:32 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Pq0T8J0ZEv66; Tue,  7 May 2013 13:47:32 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r47ClOv8004592
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 7 May 2013 13:47:26 +0100
Message-ID: <1367930701.27116.31.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, yocto
	<yocto@yoctoproject.org>
Date: Tue, 07 May 2013 13:45:01 +0100
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
X-List-Received-Date: Tue, 07 May 2013 13:03:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

In summary its been a fairly quiet week, there are number of different
holidays in different geos.

Pending Patches
===============

There has been a steady stream of 1.5 patches starting to appear. With
Saul's help these have been tested on the autobuilder and then many have
been merged into master. There were some race issues with one of the
sstate performance improvements but that is now resolved as far as I
know. We're making slow/steady progress on gcc 4.8.

1.5 planning is well underway now and some people are starting to work
on the implementation of features.

1.4.1
=====

Paul is going to maintain the 1.4 series. He's already queued up several
of the fixes that didn't make 1.4 and these are now undergoing testing
on the autobuilder. If anyone has any changes to propose for 1.4.1, now
is the time. We're not looking at features or upgrades but will consider
bug fixes.

1.3.2
=====

I've merged a lot of queued changes that Ross prepared for 1.3.2 and
this is now undergoing testing.

Python 3
========

I've been asked when bitbake will work under python3 several times now.
The first question is which python 3 as there are big differences
between them. I'm still not sure which python 3.X we'd end up wanting to
target.

I've done a bit of research and the changes we need to make are mostly
of the annoying kind. I have had bitbake build a few things (e.g.
pseudo-native) with a hacked up bitbake and metadata. The current
roadblock is the oe.types functionality and I think I'll need Chris'
help to fix this since some functionality it relies on was removed in
3.x.

I've a series I'll send out which deals with the simple issues. 

There are several cases we'll have to put in "hacky" code to make things
work for both py2 and py3, the most annoying being octal file
permissions. There is no syntax which works in both so we're facing
having to write them in hexidecimal if we want both to work. When I have
spare time I'll continue to work on it and try and get a more complete
build working.

Cheers,

Richard




