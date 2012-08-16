Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T252w-0000MM-5X
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 20:43:54 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 Aug 2012 11:31:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,780,1336374000"; d="scan'208";a="181895042"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by azsmga001.ch.intel.com with ESMTP; 16 Aug 2012 11:31:54 -0700
Message-ID: <502D3C9A.7050303@linux.intel.com>
Date: Thu, 16 Aug 2012 11:31:54 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1344639098.git.peter.seebach@windriver.com>
In-Reply-To: <cover.1344639098.git.peter.seebach@windriver.com>
Subject: Re: [PATCH 0/2] Make PNBLACKLIST work with multilibs, code cleanup
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
X-List-Received-Date: Thu, 16 Aug 2012 18:43:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2012 03:57 PM, Peter Seebach wrote:
> First, make PNBLACKLIST work with multilib builds.
>
> Second, just some quick cleanup of the multilib logic that handles
> PREFERRED_PROVIDER, PREFERRED_VERSION, and now also PNBLACKLIST.
>
> The following changes since commit 5290e82ecef08b5e573d7442627276d7b42c6b93:
>    Saul Wold (1):
>          foomatic: fix perl path for target
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib seebs/blacklist
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/blacklist
>
> Peter Seebach (2):
>    base.bbclass: Expand PNBLACKLIST across multilibs too
>    base.bbclass: Restructure multilib variable cloning
>
>   meta/classes/base.bbclass |   60 +++++++++++++++++++++++++-------------------
>   1 files changed, 34 insertions(+), 26 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


