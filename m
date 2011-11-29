Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVQG5-0000ma-59 for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 17:10:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pATG3Vvb015562;
	Tue, 29 Nov 2011 16:03:31 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14826-09; Tue, 29 Nov 2011 16:03:26 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pATG3OWr015556
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 29 Nov 2011 16:03:25 GMT
Message-ID: <1322582613.7964.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 29 Nov 2011 16:03:33 +0000
In-Reply-To: <FBD66FA7-8184-4933-AB82-124F18225ECF@dominion.thruhere.net>
References: <4ED0CC76.4040606@emagii.com> <1322579029.7964.0.camel@ted>
	<FBD66FA7-8184-4933-AB82-124F18225ECF@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: ulf@emagii.com, "Garman, Scott A" <scott.a.garman@intel.com>
Subject: Re: Feedback on building openembedded-core for qemuarm. Excerpts from buildlog
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
X-List-Received-Date: Tue, 29 Nov 2011 16:10:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-29 at 16:50 +0100, Koen Kooi wrote:
> Op 29 nov. 2011, om 16:03 heeft Richard Purdie het volgende geschreven:
> 
> > On Sat, 2011-11-26 at 12:24 +0100, Ulf Samuelsson wrote:
> >> Downloaded the latest, and tried building console-image for qemuarm.
> >> Host = Ubuntu 11.04 i686.
> >> 
> >> Looked through the build log, and thought I'd share it with the list.
> > 
> > Thanks for doing this, its valuable feedback.
> > 
> >> A number of warnings (see below)
> > 
> > We're trying to work through addressing those. Some of them are from
> > versions in meta-oe where there is a fix for the error in OECore (such
> > as the libgcc linker hash style).
> 
> Assuming your statement is true, why isn't the hash style fixed in
> the .inc? Meta-oe uses the ones from OE-core, so if the include files
> are sane, the toolchain for meta-oe is sane.

Its fixed by a patch so someone needs to backport that patch to the gcc
4.5 patch set.

Cheers,

Richard



