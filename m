Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RW31J-00071B-3q for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 10:33:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB19QnYS012695;
	Thu, 1 Dec 2011 09:26:49 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11727-09; Thu,  1 Dec 2011 09:26:45 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB19QdYE012689
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 1 Dec 2011 09:26:40 GMT
Message-ID: <1322731606.17484.88.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Dec 2011 09:26:46 +0000
In-Reply-To: <20111201015251.GA30618@sakrah.homelinux.org>
References: <4ED0CC76.4040606@emagii.com> <1322579029.7964.0.camel@ted>
	<FBD66FA7-8184-4933-AB82-124F18225ECF@dominion.thruhere.net>
	<1322582613.7964.3.camel@ted>
	<20111201015251.GA30618@sakrah.homelinux.org>
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
X-List-Received-Date: Thu, 01 Dec 2011 09:33:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-30 at 17:52 -0800, Khem Raj wrote:
> On (29/11/11 16:03), Richard Purdie wrote:
> > > Assuming your statement is true, why isn't the hash style fixed in
> > > the .inc? Meta-oe uses the ones from OE-core, so if the include files
> > > are sane, the toolchain for meta-oe is sane.
> > 
> > Its fixed by a patch so someone needs to backport that patch to the gcc
> > 4.5 patch set.
> 
> I have intentionally not ported the patch back to 4.5 but let me see if
> I can find some spare hours

Don't take my comments as a request to do so btw, personally speaking I
don't see it as a problem. I just wanted to be clear about what was
missing.

Cheers,

Richard



