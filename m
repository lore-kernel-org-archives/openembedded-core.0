Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rk7rW-0007l6-5A
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 06:33:38 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 08 Jan 2012 21:26:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="93743566"
Received: from unknown (HELO [10.255.13.28]) ([10.255.13.28])
	by azsmga001.ch.intel.com with ESMTP; 08 Jan 2012 21:26:09 -0800
Message-ID: <4F0A7A71.2040600@linux.intel.com>
Date: Sun, 08 Jan 2012 21:26:09 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325784550.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1325784550.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 0/7] Misc Fixes
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
X-List-Received-Date: Mon, 09 Jan 2012 05:33:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2012 09:30 AM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
>
> Here are fixes related to x32&  automake-1.11.2.
>
> Thanks,
> Nitin
>
> The following changes since commit 7f837eb05f924996c89283ec8b74e46f6b5cd343:
>
>    bitbake/runqueue: Improve the setscene logging (2012-01-05 13:04:19 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib nitin/work
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/work
>
> Nitin A Kamble (7):
>    python-pycairo: fix for x32
>    libevent: fix compilation for x32
>    libxxf86dga: fix compilation with x32 toolchain
>    vte: update patch header
>    automake-1.11.2: backport pkglibexec_SCRIPTS fix
>    mc: remove not needed fix for automake 1.11.2
>    systemtap: remove not needed fix for automake 1.11.2
>
Merged all of thexe execpt the libxxf86dga, due to comments, which have 
been addressed.

Will merge that one in the next block.

Thanks
	Sau!

>   ...utomake_1.11.2_fix_for_pkglibexec_SCRIPTS.patch |  118 ++++++++++++++++++++
>   meta/recipes-devtools/automake/automake_1.11.2.bb  |    5 +-
>   .../python/python-pycairo_1.10.0.bb                |    6 +-
>   .../mc/files/fix_for_automake_1.11.2.patch         |   69 ------------
>   meta/recipes-extended/mc/mc_4.8.1.bb               |    3 +-
>   .../libxxf86dga-1.1.2_fix_for_x32.patch            |   30 +++++
>   .../recipes-graphics/xorg-lib/libxxf86dga_1.1.2.bb |    5 +-
>   .../systemtap/fix_for_automake_1.11.2.patch        |   46 --------
>   meta/recipes-kernel/systemtap/systemtap_git.bb     |    6 +-
>   .../libevent/libevent-2.0.16_fix_for_x32.patch     |   47 ++++++++
>   meta/recipes-support/libevent/libevent_2.0.16.bb   |    5 +-
>   meta/recipes-support/vte/vte/introspection.patch   |    8 ++
>   12 files changed, 219 insertions(+), 129 deletions(-)
>   create mode 100644 meta/recipes-devtools/automake/automake/automake_1.11.2_fix_for_pkglibexec_SCRIPTS.patch
>   delete mode 100644 meta/recipes-extended/mc/files/fix_for_automake_1.11.2.patch
>   create mode 100644 meta/recipes-graphics/xorg-lib/libxxf86dga/libxxf86dga-1.1.2_fix_for_x32.patch
>   delete mode 100644 meta/recipes-kernel/systemtap/systemtap/fix_for_automake_1.11.2.patch
>   create mode 100644 meta/recipes-support/libevent/libevent/libevent-2.0.16_fix_for_x32.patch
>


