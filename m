Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QnvsJ-0008N3-Ca for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 19:01:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p71GvZBT008843
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 17:57:35 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08397-03 for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2011 17:57:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p71GvQlC008837
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 17:57:30 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E36D800.1050906@mentor.com>
References: <1312208500-13381-1-git-send-email-galak@kernel.crashing.org>
	<1312209045.30326.515.camel@phil-desktop>
	<4727DFCB-0AA2-43D1-A0CA-58717D815FE8@kernel.crashing.org>
	<1312214835.30326.528.camel@phil-desktop> <4E36D800.1050906@mentor.com>
Date: Mon, 01 Aug 2011 17:57:13 +0100
Message-ID: <1312217833.2344.511.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] gcc: Add ability for tune files to pass in configure options to gcc
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
X-List-Received-Date: Mon, 01 Aug 2011 17:01:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-01 at 09:44 -0700, Tom Rini wrote:
> On 08/01/2011 09:07 AM, Phil Blundell wrote:
> > On Mon, 2011-08-01 at 09:37 -0500, Kumar Gala wrote:
> >> Not sure I understand the statement about disambiguate the resulting compilers, on PPC where I intend to utilize this we'd have the toolchains already named something like:
> > 
> > The thing about disambiguating was that, if you're going to modify the
> > configure opts for gcc-cross based (indirectly) on ${MACHINE} you need
> > to consider what happens if you have a single build directory that's
> > being used for multiple MACHINEs.
> 
> What, I think, Kumar is driving at is why are you saying MACHINE when
> it's a per core tune he's doing.  eg, every e5500 would do --with-cpu=e5500

The question is whether we'd like to get to the point of having more
toolchains or less toolchains. I'd personally like to get to the point
of less toolchains (e.g. one per arch) rather than more of them. We
already pass all the appropriate flags around in the ADT/sdk code and in
our own cross builds, we could easily add those to the default target
environment too. This would actually make it clearer what is going on to
the end user too rather than hiding the details into the gcc
compilation.

So all things considered, I don't think this is the best way to go...


Cheers,

Richard





