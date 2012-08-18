Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T2mXC-0002OA-QZ for openembedded-core@lists.openembedded.org;
	Sat, 18 Aug 2012 19:10:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7IGw23s019328;
	Sat, 18 Aug 2012 17:58:02 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19304-01; Sat, 18 Aug 2012 17:57:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7IGvrPo019321
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sat, 18 Aug 2012 17:57:54 +0100
Message-ID: <1345309072.27428.65.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Sat, 18 Aug 2012 17:57:52 +0100
In-Reply-To: <cover.1345059176.git.bruce.ashfield@windriver.com>
References: <cover.1345059176.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 0/4] linux-yocto: consolidated update
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
X-List-Received-Date: Sat, 18 Aug 2012 17:10:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-08-15 at 16:06 -0400, Bruce Ashfield wrote:
> Here's a consolidated update that I've had under test in one
> way or another for 3 weeks now. Tom Z and others have also been
> using parts of this for their work, so it has seen a reasonably
> wide set of testers.
> 
> This series further streamlines working with linux-yocto* based
> recipes/repositories by breaking the last branch based triggers
> in the tooling. Branches were the most important piece of 
> information when working with the tools and a linux-yocto repository,
> but this has now been generalized, and BSP descriptions (among
> other things) are now found by MACHINE and kernel type only. 
> 
> With this, KBRANCH now becomes what it was supposed to be, an 
> human readible indication of the branch that is supposed to be
> built, and one that the kern-tools will validate. If that branch
> is not validated, an error is thrown. If the default branch is
> left as-is, then the in-tree description leaves you on the 
> proper branch and all is well.
> 
> I also have a collection of bug fixes to the tools, including
> support for having a meta branch not called 'meta'.
> 
> I'd recommend that this go through some AB tests, and I'll be
> around if there's a corner case that I managed to miss.

I think 

http://autobuilder.yoctoproject.org:8010/builders/nightly-tiny/builds/199/steps/shell_34/logs/stdio

is due to something in this series...

Cheers,

Richard



