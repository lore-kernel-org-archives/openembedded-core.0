Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TCYRm-0006Lc-Oe
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 18:08:50 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 14 Sep 2012 08:56:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,423,1344236400"; d="scan'208";a="192814830"
Received: from unknown (HELO [10.255.13.94]) ([10.255.13.94])
	by azsmga001.ch.intel.com with ESMTP; 14 Sep 2012 08:56:02 -0700
Message-ID: <50535392.70605@linux.intel.com>
Date: Fri, 14 Sep 2012 08:56:02 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Peter Seebach <peter.seebach@windriver.com>
References: <cover.1347559925.git.peter.seebach@windriver.com>
In-Reply-To: <cover.1347559925.git.peter.seebach@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] pseudo update to 1.4.1
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
X-List-Received-Date: Fri, 14 Sep 2012 16:08:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/13/2012 11:29 AM, Peter Seebach wrote:
> The patches here are trivial. The upstream fixes are pretty
> non-trivial, but have been used moderately extensively on a handful
> of hosts, and appear to work. Long story short, pseudo could cause
> rm to fail on files >2GB on 32-bit hosts which didn't use a 64-bit
> off_t. Fixing this required addressing a surprising number of
> assumptions, but it appears to work now.
>
> The following changes since commit 835654994574c158d6324218ebe000bd2ef9a792:
>    Darren Hart (1):
>          rt: Add hwlatdetect to rt images
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib seebs/pseudo141
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/pseudo141
>
> Peter Seebach (1):
>    pseudo_1.4.1.bb: update to pseudo 1.4.1, fixing 32-bit host problems
>
>   meta/recipes-devtools/pseudo/pseudo_1.4.1.bb |    8 ++++++++
>   meta/recipes-devtools/pseudo/pseudo_1.4.bb   |    8 --------
>   meta/recipes-devtools/pseudo/pseudo_git.bb   |    6 +++---
>   3 files changed, 11 insertions(+), 11 deletions(-)
>   create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.1.bb
>   delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.bb
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
>


