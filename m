Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RM16R-0002Nb-Cb
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 18:29:23 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Nov 2011 10:23:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="70882229"
Received: from amabrams-mobl.amr.corp.intel.com (HELO envy.home)
	([10.7.199.147])
	by orsmga001.jf.intel.com with ESMTP; 03 Nov 2011 10:23:10 -0700
Message-ID: <4EB26B6B.7050600@linux.intel.com>
Date: Thu, 03 Nov 2011 03:22:35 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <cover.1320340081.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1320340081.git.bruce.ashfield@windriver.com>
X-Enigmail-Version: 1.3.2
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 0/1] linux-yocto: update base to v3.0.8 + meta config changes
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
X-List-Received-Date: Thu, 03 Nov 2011 17:29:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 11/03/2011 10:11 AM, Bruce Ashfield wrote:
> Richard/Saul,
> 
> Here's a bump to 3.0.8 for the 3.0 kernel, and some config changes from TomZ.
> These are destined for master and separate from any point updates to the 1.1
> release.
> 

So typically we try to push to master and pull back to the point
releases. The linux-yocto infrastructure is a bit unique - how will you
be presenting the stable update and the preempt-rt update (you mentioned
below) for the point release?

--
Darren

> In case anyone cares my -dev kernel also has these changes, and it will take
> them to the latest kernel shortly.
> 
> This also doesn't bump the preempt-rt branches, since they'll be updated
> to the new -rt first, before taking the 3.0.x stable updates.
> 
> Built and booted for all the qemu targets.
> 
> cc: Tom Zanussi <tom.zanussi@intel.com>
> cc: Darren Hart <dvhart@linux.intel.com>
> 
> Cheers,
> 
> Bruce
> 
> The following changes since commit 9b76e6a2cfc5a4d779f3b06e3acc5ff7b8275470:
> 
>   meta: glib-2.0: don't apply qsort_r test removable patch for native version (2011-11-02 09:08:28 +0000)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib zedd/kernel
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
> 
> Bruce Ashfield (1):
>   linux-yocto_3.0: update base to v3.0.8 + meta config changes
> 
>  meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
>  meta/recipes-kernel/linux/linux-yocto_3.0.bb    |   18 +++++++++---------
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


