Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SjCHO-00088J-Ix
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 18:36:46 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Jun 2012 09:25:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="157966077"
Received: from unknown (HELO [10.255.12.180]) ([10.255.12.180])
	by orsmga001.jf.intel.com with ESMTP; 25 Jun 2012 09:25:54 -0700
Message-ID: <4FE89112.5070101@linux.intel.com>
Date: Mon, 25 Jun 2012 09:25:54 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1340319020.git.raj.khem@gmail.com>
In-Reply-To: <cover.1340319020.git.raj.khem@gmail.com>
Subject: Re: [PATCH 0/5] Fix uclibc packaging and update qemu git recipe
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
X-List-Received-Date: Mon, 25 Jun 2012 16:36:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/21/2012 03:54 PM, Khem Raj wrote:
> This patchset does following
>
> 1. Fixes uclibc packaging issues that came after packaging order rework
> 2. Upgrades qemu git recipes to latest on qemu git/master
>     This does not forward port any of the patches except the
>     ROM thats required to boot ppc.
>     This helps in using qemu for some of less uses architectures
>
> 3. Fix PACKAGECONFIG for qemu thats needed for qemu-git to work
>     without gl patches
> 4. Adds recipes for kconfig-frontends which I have resent in another tree
>
> The following changes since commit e2cc4a44d510e0d473d15f207c1c886db6a5ccf7:
>
>    [PATCH] guile: fix compilation on MIPS/PPC (2012-06-21 13:41:12 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib kraj/misc-updates
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-updates
>
> Khem Raj (5):
>    kconfig-frontends: New recipe
Khem,
As already noted, can you resubmit this patch, with the packaging update 
that I sent.

>    uclibc: Fix packaging to match the new package order
>    qemu.inc: Fix packageconfig options
Merged these 2
>    qemu-git: Move to tip of git
>    qemu_git: set empty PACKAGECONFIG
>
Richard commented on this, we need to have the GL patch updated also.

Sau!


>   meta/recipes-core/uclibc/uclibc.inc                |   28 ++++++++++---------
>   .../kconfig-frontends/kconfig-frontends_3.4.bb     |   28 ++++++++++++++++++++
>   .../recipes-devtools/qemu/qemu-git/powerpc_rom.bin |  Bin 0 ->  4096 bytes
>   meta/recipes-devtools/qemu/qemu.inc                |    2 +-
>   meta/recipes-devtools/qemu/qemu_git.bb             |   19 ++++---------
>   5 files changed, 50 insertions(+), 27 deletions(-)
>   create mode 100644 meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
>   create mode 100644 meta/recipes-devtools/qemu/qemu-git/powerpc_rom.bin
>


