Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SRmKu-000771-Vk for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 17:28:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q48FIWjr004281;
	Tue, 8 May 2012 16:18:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03358-08; Tue,  8 May 2012 16:18:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q48FIMoA004275
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 8 May 2012 16:18:23 +0100
Message-ID: <1336490307.30349.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Tue, 08 May 2012 16:18:27 +0100
In-Reply-To: <cover.1336487836.git.bruce.ashfield@windriver.com>
References: <cover.1336487836.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 0/2] linux-yocto: streamlined repository support + fixes
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
X-List-Received-Date: Tue, 08 May 2012 15:28:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-05-08 at 10:47 -0400, Bruce Ashfield wrote:
> Richard/Saul,
> 
> This pull requests represents some changes that I've been running here
> for the past 1.5 months. It is a re-working of the tools and recipes to
> allow more repository types to support the kern tools (branching and
> fragments). 
> 
> It's one largish patch that consolidates recipe updates, tool changes
> and streamlining of the patching phase.
> 
> This is step one, there are several more to follow after this merges
> into the tree. Namely:
>   
>   - updated documents on what an inheriting recipe needs to do
>   - movement of the linux-yocto-custom recipe from meta-kernel-dev
>     to somewhere more visible
>   - updates to meta-kernel-dev to fix those recipes
>   - removal of the 2.6.37 recipe and introduction of the 3.4 kernel
>     recipe
>   - additional streamlining of the tools (more code deleted!).
> 
> I've converted the linux-yocto* recipes (except for 2.6.37, since I'll be
> removing it shortly) and have built 3.0, 3.2 and -dev kernels for all the
> boards I can. It's ready to go, but can also use a run through a 
> nightly build before it merged (the changes were a bit tricky with a lot
> of existing use cases to ensure were not broken).
> 
> FYI: I stacked this on top of my last pull request, let me know if this
> needs to be rebased.
> 
> Cheers,
> 
> Bruce
> 
> The following changes since commit e116928e3a1af803b9c6fa06236902ad730f7bf8:
> 
>   linux-yocto/3.0: mm/msync: tweak tmpfs patch for syscall msync (2012-05-08 10:18:56 -0400)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib zedd/kernel-dev
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-dev
> 
> Bruce Ashfield (2):
>   linux-yocto: streamline support for multiple upstream repo types
>   kern-tools: integrate minor fixes

Merged to master, thanks (along with the previous requests).

Richard



