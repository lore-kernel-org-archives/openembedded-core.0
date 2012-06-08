Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Scx4n-0002aO-CJ for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 13:10:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q58AxFVP014579;
	Fri, 8 Jun 2012 11:59:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13899-06; Fri,  8 Jun 2012 11:59:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q58Awwx0014571
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 8 Jun 2012 11:59:07 +0100
Message-ID: <1339153130.30460.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Fri, 08 Jun 2012 11:58:50 +0100
In-Reply-To: <cover.1339098507.git.bruce.ashfield@windriver.com>
References: <cover.1339098507.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: Re: [PATCH 0/9] linux-yocto: consolidated pull request
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
X-List-Received-Date: Fri, 08 Jun 2012 11:10:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-06-07 at 15:59 -0400, Bruce Ashfield wrote:
> Richard/Saul,
> 
> Here's a 9 patch series that is a collection of work that's been
> brewing for about three weeks.
> 
> Highlights include:
> 
>   - removal of the 2.6.37 recipe, it's time is now gone
>   - addition of the 3.4 kernel recipe
>       - configuration fixups and audits within that 3.4 kernel
>       - kernel *only* support for mips64 mti emulation
>   - -stable updates for supported kernels 3.2.18, 3.0.32
>   - machine fixes/configurations for the 3.2 and 3.0 kernels
>   - kern tool updates, streamlining and fixes
> 
> I've built and booted the qemu* machines on 3.4, and have been doing
> this for several weeks now. Built and boot tests have also happened
> on the 3.0 and 3.2 trees as well. Some BSP layers are already using
> these changes.
> 
> The tools changes set the stage for some follow on changes that 
> I'm nearly done for the next oe-core/yocto release, but they are
> useful by themselves, so I'm getting them out of my queue.
> 
> I'll follow up to other lists with updates to recipes and configs
> that reference the modified kernels.
> 
> BSP layers can be updated as appropriate, since all these changes
> have been pushed to the various kernel trees.
> 
> Cheers,
> 
> Bruce
> 
> The following changes since commit df8f55a919b3cc602ce1f1c51630c7edf6e36b55:
> 
>   ltp: Add patch to correct failing build (2012-06-05 23:05:00 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib zedd/kernel-oe
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe
> 
> Bruce Ashfield (9):
>   kern-tools: remove unused code, meta branch and directory assumptions
>   linux-yocto/3.2: update to v3.2.18
>   linux-yocto/3.0: update to v3.0.32
>   linux-yocto: remove v2.6.37 recipe
>   linux-yocto: add machine aliases for yocto BSPs
>   linux-yocto: add 3.4 recipe
>   linux-yocto/3.2: fri2 and chiefriver machine updates
>   linux-yocto/3.0: add cedartrail kernel features
>   kern-tools: anchor KMACHINE test

Merged to master, thanks.

Richard



