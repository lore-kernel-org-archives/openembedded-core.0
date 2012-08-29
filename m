Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T6qma-0005Yy-Uq
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 00:30:45 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 29 Aug 2012 15:18:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,335,1344236400"; d="scan'208";a="186634220"
Received: from unknown (HELO [10.255.13.94]) ([10.255.13.94])
	by azsmga001.ch.intel.com with ESMTP; 29 Aug 2012 15:18:27 -0700
Message-ID: <503E9533.3020802@linux.intel.com>
Date: Wed, 29 Aug 2012 15:18:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Peter Seebach <peter.seebach@windriver.com>
References: <cover.1346087164.git.peter.seebach@windriver.com>
In-Reply-To: <cover.1346087164.git.peter.seebach@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] v3: Move pseudo localstatedir outside of rootfs.
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
X-List-Received-Date: Wed, 29 Aug 2012 22:30:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/27/2012 11:32 AM, Peter Seebach wrote:
> On reflection, I like "rootfs.pseudo_state" better than
> "pseudo_state_rootfs". Also found a typo in which *one* reference
> had pseudo_state/rootfs rather than pseudo_state_rootfs. (My keyboard
> layout hates me.)
>
> This version has been actually tested complete with running the
> associated bitbake targets.
>
> The following changes since commit 4ef8960c8d2876914bb78cbdce5fae3c5297e942:
>    Khem Raj (1):
>          gcc-cross-intermediate, gcc-crosssdk-intermediate: Remove
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib seebs/varpseudo
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/varpseudo
>
> Peter Seebach (1):
>    runqemu-export-rootfs and friends: don't put pseudo db in target fs
>
>   .../installer/adt-installer/scripts/extract_rootfs |    8 ++++----
>   scripts/runqemu-export-rootfs                      |    2 +-
>   scripts/runqemu-extract-sdk                        |   15 +++++++++------
>   3 files changed, 14 insertions(+), 11 deletions(-)
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


