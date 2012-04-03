Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFCSw-000586-HT
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 00:44:42 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Apr 2012 15:35:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="128379000"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by orsmga002.jf.intel.com with ESMTP; 03 Apr 2012 15:35:12 -0700
Message-ID: <4F7B7B20.2050808@linux.intel.com>
Date: Tue, 03 Apr 2012 15:35:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1332884952.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1332884952.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/2] Update pseudo to version 1.3
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
X-List-Received-Date: Tue, 03 Apr 2012 22:44:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/27/2012 02:57 PM, Mark Hatle wrote:
> Update pseudo to version 1.3 in order to fix Yocto Project bug #2181.
>
>> From the pseudo author:
>
> This patch updates pseudo to 1.3.  The biggest change is the creation of
> a new popen() wrapper, which fixes some strange PSEUDO_PREFIX errors that
> could occur running certain commands (those using os.popen()) outside of
> the pseudo environment after pseudo had been used.  However, this also
> uses the upstream versions of the opendir and renameat patches, merges in
> a new option for static linking of sqlite (and adds that configuration
> option to pseudo.inc), and merges in the oe-config patch.  So we're back
> to zero patches in tree and a clean upstream pseudo.
>
> In addition, a separate patch to the scripts/bitbake was created that should
> help ensure that on an upgrade of pseudo-native, pseudo-native is built
> prior to the main build.  Similarly to how things work when pseudodone
> does not exist.
>
> Testing notes...
> This was tested by starting with existing master, building core-image-minimal,
> then updating to the new version of pseudo recipes, and rerunning the
> core-image-minimal build.  The test was performed with both NO32LIBS=1 and
> NO32LIBS=0.  Testing was successful.
>
> The following changes since commit 7b01671f54f70c28c98457058c51ffefcb07c0e8:
>
>    nspr 4.8.9: failed to build on x86_64 board (2012-03-27 13:26:37 +0100)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/poky-contrib mhatle/pseudo
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mhatle/pseudo
>
> Mark Hatle (1):
>    scripts/bitbake: Update to help rebuild pseudo-native
>
> Peter Seebach (1):
>    Pseudo: Update to 1.3
>
>   meta/recipes-devtools/pseudo/pseudo.inc            |    4 +-
>   .../recipes-devtools/pseudo/pseudo/oe-config.patch |   58 -----
>   meta/recipes-devtools/pseudo/pseudo/opendir.patch  |   94 --------
>   meta/recipes-devtools/pseudo/pseudo/renameat.patch |  229 --------------------
>   .../pseudo/pseudo/static_sqlite.patch              |   17 --
>   meta/recipes-devtools/pseudo/pseudo_1.2.bb         |   12 -
>   meta/recipes-devtools/pseudo/pseudo_1.3.bb         |    8 +
>   meta/recipes-devtools/pseudo/pseudo_git.bb         |   10 +-
>   scripts/bitbake                                    |   36 +++-
>   9 files changed, 45 insertions(+), 423 deletions(-)
>   delete mode 100644 meta/recipes-devtools/pseudo/pseudo/oe-config.patch
>   delete mode 100644 meta/recipes-devtools/pseudo/pseudo/opendir.patch
>   delete mode 100644 meta/recipes-devtools/pseudo/pseudo/renameat.patch
>   delete mode 100644 meta/recipes-devtools/pseudo/pseudo/static_sqlite.patch
>   delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.2.bb
>   create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.3.bb
>

Merged into OE-Core

Thanks
	Sau!



