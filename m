Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QoFJj-0001ta-SK for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 15:47:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p72DhB2e015733;
	Tue, 2 Aug 2011 14:43:11 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14687-09; Tue,  2 Aug 2011 14:43:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p72Dh2w9015727
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 2 Aug 2011 14:43:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <9C87AA3D-2AE6-4C57-B903-0D939E577BB8@kernel.crashing.org>
References: <1312208500-13381-1-git-send-email-galak@kernel.crashing.org>
	<1312209045.30326.515.camel@phil-desktop>
	<4727DFCB-0AA2-43D1-A0CA-58717D815FE8@kernel.crashing.org>
	<1312214835.30326.528.camel@phil-desktop> <4E36D800.1050906@mentor.com>
	<1312217833.2344.511.camel@rex>
	<9C87AA3D-2AE6-4C57-B903-0D939E577BB8@kernel.crashing.org>
Date: Tue, 02 Aug 2011 14:42:45 +0100
Message-ID: <1312292565.2344.595.camel@rex>
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
X-List-Received-Date: Tue, 02 Aug 2011 13:47:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-02 at 08:11 -0500, Kumar Gala wrote:
> On Aug 1, 2011, at 11:57 AM, Richard Purdie wrote:
> 
> > On Mon, 2011-08-01 at 09:44 -0700, Tom Rini wrote:
> >> On 08/01/2011 09:07 AM, Phil Blundell wrote:
> >>> On Mon, 2011-08-01 at 09:37 -0500, Kumar Gala wrote:
> >>>> Not sure I understand the statement about disambiguate the resulting compilers, on PPC where I intend to utilize this we'd have the toolchains already named something like:
> >>> 
> >>> The thing about disambiguating was that, if you're going to modify the
> >>> configure opts for gcc-cross based (indirectly) on ${MACHINE} you need
> >>> to consider what happens if you have a single build directory that's
> >>> being used for multiple MACHINEs.
> >> 
> >> What, I think, Kumar is driving at is why are you saying MACHINE when
> >> it's a per core tune he's doing.  eg, every e5500 would do --with-cpu=e5500
> > 
> > The question is whether we'd like to get to the point of having more
> > toolchains or less toolchains. I'd personally like to get to the point
> > of less toolchains (e.g. one per arch) rather than more of them. We
> > already pass all the appropriate flags around in the ADT/sdk code and in
> > our own cross builds, we could easily add those to the default target
> > environment too. This would actually make it clearer what is going on to
> > the end user too rather than hiding the details into the gcc
> > compilation.
> > 
> > So all things considered, I don't think this is the best way to go...
> > 
> 
> How is this done or exported to the user of an ADT/sdk toolchain?

There is a script included in the toolchain tarball which contains the
appropriate information. I don't have one handy to check but I suspect
Jessica will have. Jessica?

Cheers,

Richard



