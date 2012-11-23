Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Tbvef-0000Qo-6B for openembedded-core@lists.openembedded.org;
	Fri, 23 Nov 2012 16:59:13 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qANFipFq002952;
	Fri, 23 Nov 2012 15:44:51 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29716-05; Fri, 23 Nov 2012 15:44:47 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qANFiedG002946
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 23 Nov 2012 15:44:42 GMT
Message-ID: <1353685480.1361.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Fri, 23 Nov 2012 15:44:40 +0000
In-Reply-To: <1353672970.13864.739.camel@phil-desktop>
References: <1353620179.10459.59.camel@ted>
	<1353621014.2000.16.camel@x121e.pbcl.net>
	<1353621779.10459.67.camel@ted>
	<1353665804.13864.713.camel@phil-desktop> <1353672077.1361.4.camel@ted>
	<1353672970.13864.739.camel@phil-desktop>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-cross: Explicitly depend on linux-libc-headers
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
X-List-Received-Date: Fri, 23 Nov 2012 15:59:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-11-23 at 12:16 +0000, Phil Blundell wrote:
> On Fri, 2012-11-23 at 12:01 +0000, Richard Purdie wrote:
> > I'm not sure "gratuitous" is entirely fair, the metadata as it stands
> > today is fairly linux centric.
> 
> For some (maybe large) parts of the metadata that's probably true, but
> gcc-cross does happen to be usable on non-linux with only minor
> adjustments to EXTRA_OECONF and it would be nice to keep it that way.
> 
> >I will however change this to use anonymous python despite the
> >performance and readability downsides 
> 
> Thank you.
> 
> >... since I appear to have hit some nerve.
> 
> I guess you could view it that way.  I am indeed sensitive to having my
> builds broken in easily-avoidable ways. 

I think the problem is that I can't reasonably know that you (or others)
are using the gcc-cross recipe for non-linux purposes. I've never seen
patches related to that or any other sign of it.

I now know this so I will try to account for it and the multitude of
other things I try and account for in future. You have implied this is
easily avoidable and it is, *if* you know what it is you're trying to
avoid (and can remember all of them).

Cheers,

Richard




