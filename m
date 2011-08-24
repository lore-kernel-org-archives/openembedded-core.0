Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QwMdu-00079M-1z for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 01:13:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7ON92h2024589;
	Thu, 25 Aug 2011 00:09:02 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23761-03; Thu, 25 Aug 2011 00:08:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7ON8nMP024583
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 25 Aug 2011 00:08:55 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
In-Reply-To: <cover.1314218753.git.bruce.ashfield@windriver.com>
References: <cover.1314218753.git.bruce.ashfield@windriver.com>
Date: Wed, 24 Aug 2011 16:08:46 -0700
Message-ID: <1314227326.5939.149.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: Re: [PATCH 0/4] linux-yocto: consolidated kernel pull request
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
X-List-Received-Date: Wed, 24 Aug 2011 23:13:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Bruce,

On Wed, 2011-08-24 at 16:50 -0400, Bruce Ashfield wrote:
> Here's a consolidated kernel pull request that fixes a series
> of bugs that have been around for a while and fixes some of the
> remaining issues from the -rt work that completed last week.
> 
> Darren: I also updated the -rt source revs and recipe with some
> streamlining that builds on top of changse that merged last week.
> 
> The patches have the details of the bugs and fixes.
> 
> cc: Darren Hart <dvhart@linux.intel.com>
> 
> The following changes since commit f852199ff598069bbecad4146f13377753df1648:
> 
>   linux-yocto: update meta SRCREVs for beagleboard config changes (2011-08-24 16:29:22 -0400)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib kernel-oe
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe
> 
> Bruce Ashfield (4):
>   kern-tools: allow flexible branch points
>   linux-yocto-rt: update qemuppc support and streamline variables
>   linux-yocto: update machines and default configuration
>   linux-yocto/2.6.37: apmd + get time of day fixes

I took the first two of these. The other two didn't apply and I didn't
feel happy taking them. I tried to look at the git tree above and I
couldn't see the patches there...

Cheers,

Richard



