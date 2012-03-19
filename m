Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S9ffF-0004bQ-5x
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 17:42:33 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 Mar 2012 09:33:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="119169897"
Received: from unknown (HELO [10.255.15.160]) ([10.255.15.160])
	by orsmga001.jf.intel.com with ESMTP; 19 Mar 2012 09:33:40 -0700
Message-ID: <4F675FE4.3010503@linux.intel.com>
Date: Mon, 19 Mar 2012 09:33:40 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331924359.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1331924359.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 0/7] Misc Fixes and upgrades
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
X-List-Received-Date: Mon, 19 Mar 2012 16:42:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/16/2012 12:00 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> The following changes since commit 0676db79755b49b660f34e1c00769327fc299c58:
>
>    tcl: Fix bad RPATH QA warning (2012-03-16 16:47:44 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib nitin/misc
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc
>
> Nitin A Kamble (7):
>    automake: upgrade from 1.11.2 to 1.11.3
Not Merged

>    distro-tracking: update status of recipes
>    python: fix install when libdir is not "lib"
>    pciutils: fix a do_compile failure
>    python-pyrex: quite packaging warnings
>    python-pycurl: fix packaging warnings
>    git: fix packaging warnings
>
>   .../conf/distro/include/distro_tracking_fields.inc |   24 ++--
>   meta/recipes-bsp/pciutils/pciutils_3.1.9.bb        |    5 +
>   meta/recipes-devtools/automake/automake.inc        |    2 +-
>   ...utomake_1.11.2_fix_for_pkglibexec_SCRIPTS.patch |  118 --------------------
>   .../prefer-cpio-over-pax-for-ustar-archives.patch  |   30 +++--
>   .../automake/automake/python-libdir.patch          |   32 +++---
>   .../{automake_1.11.2.bb =>  automake_1.11.3.bb}     |    8 +-
>   meta/recipes-devtools/git/git.inc                  |    2 +
>   .../python/python-pycurl_7.19.0.bb                 |    4 +
>   meta/recipes-devtools/python/python-pyrex_0.9.9.bb |    4 +-
>   .../python/fix_for_using_different_libdir.patch    |   78 +++++++++++++
>   meta/recipes-devtools/python/python_2.7.2.bb       |    2 +
>   12 files changed, 143 insertions(+), 166 deletions(-)
>   delete mode 100644 meta/recipes-devtools/automake/automake/automake_1.11.2_fix_for_pkglibexec_SCRIPTS.patch
>   rename meta/recipes-devtools/automake/{automake_1.11.2.bb =>  automake_1.11.3.bb} (85%)
>   create mode 100644 meta/recipes-devtools/python/python/fix_for_using_different_libdir.patch
>

All but the automake update was merged into OE-Core

Thanks
	Sau!


