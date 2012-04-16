Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SJoMs-0000fs-8a for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 18:01:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3GFq5UN001579
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 16:52:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00791-05 for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 16:52:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3GFpuAr001572
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 16:51:56 +0100
Message-ID: <1334591518.616.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2012 16:51:58 +0100
In-Reply-To: <CAGDS+nkaJZQ8KOZrSPdzDd0v9ObrhDLpMWL5Wqa-hE6Zr=H8zg@mail.gmail.com>
References: <1334569676.16992.67.camel@ted>
	<111FD132-7323-472B-8052-283E454DCB6E@dominion.thruhere.net>
	<1334574653.16992.74.camel@ted>
	<ED413D36-93A5-4400-B9E9-F86B6EE04CFA@dominion.thruhere.net>
	<CAGDS+nkaJZQ8KOZrSPdzDd0v9ObrhDLpMWL5Wqa-hE6Zr=H8zg@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] python: Fix re-execution problem due to patching configure and configure.in
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
X-List-Received-Date: Mon, 16 Apr 2012 16:01:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-04-16 at 08:31 -0700, Steve Sakoman wrote:
> On Mon, Apr 16, 2012 at 4:27 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> 
> >>> Since this changes the sources it needs a PR bump.
> >>
> >> It has no effect on the packaged output which was always the criteria
> >> for PR bumps as I understood things.
> >
> > But there's the exception for fixing failures like this so people don't have to -c clean(sstate) things.
> 
> Indeed, I had to do a manual -c cleansstate to get the benefit of this
> batch of rebuild fixes.  The rebuilds all failed otherwise.

I did go back and add in a bunch of PR fixes but evidently not
enough :/.

Cheers,

Richard



