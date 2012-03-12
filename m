Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7Cno-000601-6I
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 22:29:12 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Mar 2012 14:20:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="117025422"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by orsmga001.jf.intel.com with ESMTP; 12 Mar 2012 14:19:31 -0700
Message-ID: <4F5E6863.2060203@linux.intel.com>
Date: Mon, 12 Mar 2012 14:19:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331017518.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1331017518.git.edwin.zhai@intel.com>
Subject: Re: [PATCH 0/4] Fixes for multilib and VTE, Mar 6, 2012
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
X-List-Received-Date: Mon, 12 Mar 2012 21:29:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/05/2012 11:23 PM, edwin.zhai@intel.com wrote:
> From: Zhai Edwin<edwin.zhai@intel.com>
>
> RP,
> 2 fixes for multilib.
> 1 for VTE, which just revert a simple commit after last VTE upgrade. Although
> doesn't hit the root cause, it fix the end user experience issue and is more
> light-weight than reverting whole VTE upgrade. We can revisit it for root cause
> in future.
>
> Thanks,
> edwin
>
> The following changes since commit a8dc76ee69cfe1ffe846c07a510e3a562a5b1a7f:
>
>    base.bbclass: Fix PACKAGECONFIG handling when no flags are set (2012-03-05 13:04:11 -0800)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib gzhai/master2
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2
>
> Dongxiao Xu (1):
>    multilib: extend all recipes in multilib.conf
>
Merged into OE-Core

> Zhai Edwin (3):
>    vte: fix scroll issue
Richard already replied to this one, you need to dig into this one a 
little more please.

>    self-hosted: Fix multiple libx11 error
I believe Richard fixed this in another way, please verify, I will also

>    shadow-sysroot: Fix for multilib
>
This was merged into OE-Core also

Thanks
	Sau!

>   meta/classes/useradd.bbclass                     |    2 +-
>   meta/conf/multilib.conf                          |  313 ++++++++++++++++++++--
>   meta/recipes-core/tasks/task-self-hosted.bb      |    4 +-
>   meta/recipes-support/vte/vte.inc                 |    3 +-
>   meta/recipes-support/vte/vte/scrollbar_fix.patch |  122 +++++++++
>   5 files changed, 424 insertions(+), 20 deletions(-)
>   create mode 100644 meta/recipes-support/vte/vte/scrollbar_fix.patch
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


