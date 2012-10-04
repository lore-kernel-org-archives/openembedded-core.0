Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TJl85-0007bI-8o for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 15:06:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q94CrDAq006806;
	Thu, 4 Oct 2012 13:53:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06441-01; Thu,  4 Oct 2012 13:53:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q94Cr6aQ006796
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 4 Oct 2012 13:53:07 +0100
Message-ID: <1349355189.18301.89.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Thu, 04 Oct 2012 13:53:09 +0100
In-Reply-To: <1349352468.32611.164.camel@phil-desktop>
References: <1349352468.32611.164.camel@phil-desktop>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Only one copy of bitbake should be run against a build directory
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
X-List-Received-Date: Thu, 04 Oct 2012 13:06:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-10-04 at 13:07 +0100, Phil Blundell wrote:
> Since updating my copy of bitbake to one which does this extra locking,
> I've come to realise that the constraint of having only one copy of
> bitbake running is a bit of a nuisance when making use of devshells.  I
> used to quite often have one or two long-running devshells for packages
> that I was actively working on, and then in parallel with that would use
> bitbake to recompile other things.  With the new locking mechanism, as
> soon as I have a single devshell open I am now prohibited from using
> bitbake for anything else in that same build directory.
> 
> Would it be reasonable to exempt devshells from that locking or is there
> some compelling reason why they need to be serialised?

The reason it was added was that there were too many people shooting
themselves in the foot with multiple bitbake processes running without
them realising it. I has "saved" me a few times too.

I'm not sure how you'd allow devshell but not anything else,
particularly as there may be tasks that run before the devshell task
gets executed.

I'd be fine with a --ignore-the-lockfile-I-know-what-I-am-doing type
option, then on your own head be it ;-).

Cheers,

Richard




