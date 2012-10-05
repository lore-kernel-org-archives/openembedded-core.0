Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TKAa9-0003MR-9I
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 18:16:57 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Oct 2012 09:03:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,541,1344236400"; d="scan'208";a="152859787"
Received: from unknown (HELO [10.255.13.203]) ([10.255.13.203])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Oct 2012 09:03:34 -0700
Message-ID: <506F04D6.1050904@linux.intel.com>
Date: Fri, 05 Oct 2012 09:03:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Scott Garman <scott.a.garman@intel.com>
References: <cover.1349302333.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1349302333.git.scott.a.garman@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] runqemu multiple unfs instances fix
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
X-List-Received-Date: Fri, 05 Oct 2012 16:16:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/03/2012 03:13 PM, Scott Garman wrote:
> Hello,
>
> Here's a bugfix to allow multiple instances of unfs-based qemu to
> run. A bit thank you to Rudolf J Streif for proposing the final
> commit in this series.
>
> Scott
>
> The following changes since commit ae9dbd0e1e26ba2b35cbd08ec731aee62adedc23:
>
>    distrodata: Update distrocheck functions (2012-10-03 17:37:24 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib sgarman/runqemu-unfs-fix-oe
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgarman/runqemu-unfs-fix-oe
>
> Scott Garman (3):
>    runqemu-export-rootfs: use consistent whitespace
>    runqemu-export-rootfs: improve rpcbind error detection
>    runqemu: allow multiple unfs instances to run simultaneously
>
>   scripts/runqemu-export-rootfs |  113 +++++++++++++++++++++++------------------
>   scripts/runqemu-internal      |    4 +-
>   2 files changed, 66 insertions(+), 51 deletions(-)
>
Merged these into OE-Core

Thanks
	Sau!



