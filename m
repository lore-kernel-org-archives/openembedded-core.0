Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RzyqA-0004wo-0k for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 00:09:46 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1LN1QNN021309
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 23:01:26 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21169-02 for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 23:01:21 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1LN1Jvn021303
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 23:01:20 GMT
Message-ID: <1329865279.20261.92.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 21 Feb 2012 23:01:19 +0000
In-Reply-To: <CAGDS+nne1Xbe6XGPuLXqyMLOC_7uqYKFkbRuW77Ub672kpL7BA@mail.gmail.com>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<c68f6de298c35c25638ea3a5adeb06c97cd74036.1328510189.git.raj.khem@gmail.com>
	<4F30DC16.1050506@linux.intel.com>
	<CAMKF1sqTc3PA_4xNbp1751tA73pRazsvrFdwhomdELtb-25ZGg@mail.gmail.com>
	<4F314A73.8070406@linux.intel.com>
	<20120207231245.GA13160@sakrah.homelinux.org>
	<4F31BF7B.4040303@linux.intel.com>
	<CAMKF1sqCgiu0TnTj_rgvDgZ5+JE3uX+Y_5KvKmcfd4LDOAoF2Q@mail.gmail.com>
	<CAGDS+nmdBg8QyBPx6iuG0p0aaPfAU3kvE6jJbekvC2ne0XBedw@mail.gmail.com>
	<54DBF0D0-65DA-4444-8EF5-3E14ED8FE44F@dominion.thruhere.net>
	<20120213074852.GA3832@jama.jama.net>
	<CAGDS+nne1Xbe6XGPuLXqyMLOC_7uqYKFkbRuW77Ub672kpL7BA@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 12/20] zlib: Upgrade 1.2.5 -> 1.2.6
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
X-List-Received-Date: Tue, 21 Feb 2012 23:09:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-02-13 at 05:23 -0800, Steve Sakoman wrote:
> Indeed!  I gave up on trying to determine an exhaustive list and just
> blew away tmp and sstate and rebuilt everything -- including package
> repositories :-(
> 
> We need to find a way to prevent or warn of disruptive changes like
> this zlib patch.  For those of us trying to make a living using Yocto,
> losing a day of productivity to things like this really stings.

I agree this change sucked and showed us we have some real issues. I
will point out that if we had been using the basichash signature
generator, it would likely have picked up this change and rebuild all
the appropriate pieces.

This illustrates why we do really need to switch to the basichash
dependency model even if some things are going to rebuild a bit more
often as humans make bad judges of what needs rebuilding...

Cheers,

Richard



