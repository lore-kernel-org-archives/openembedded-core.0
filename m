Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S8Dez-000825-O4
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 17:36:17 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Mar 2012 09:27:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129392035"
Received: from unknown (HELO [10.255.15.152]) ([10.255.15.152])
	by fmsmga001.fm.intel.com with ESMTP; 15 Mar 2012 09:27:24 -0700
Message-ID: <4F62186C.3030501@linux.intel.com>
Date: Thu, 15 Mar 2012 09:27:24 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331756004.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1331756004.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/2] ncurses packaging fix [v3]
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
X-List-Received-Date: Thu, 15 Mar 2012 16:36:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/14/2012 01:15 PM, Scott Garman wrote:
> Hello,
>
> This fixes the ncurses library packaging.
>
> v3 of this pull request uses do_split_packages to package the libraries
> in base_libdir, and includes a commit which bumps PR for all recipes
> which DEPEND on ncurses.
>
> Scott
>
> The following changes since commit 8567549a743cb5be157e7988e1f9227d91f48850:
>
>    Revert "alsa-tools: update to 1.0.25" (2012-03-14 15:53:45 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib sgarman/ncurses-pkg-fix3-oe
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/ncurses-pkg-fix3-oe
>
> Scott Garman (2):
>    ncurses: fix packaging of moved libraries
>    PR bump for all recipes that DEPEND on ncurses
>
>   meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    2 +-
>   meta/recipes-core/ncurses/ncurses.inc              |    6 ++++--
>   meta/recipes-core/readline/readline_5.2.bb         |    2 +-
>   meta/recipes-core/readline/readline_6.2.bb         |    2 +-
>   meta/recipes-core/uclibc/uclibc.inc                |    2 +-
>   meta/recipes-core/util-linux/util-linux_2.21.bb    |    2 +-
>   meta/recipes-devtools/cmake/cmake.inc              |    2 +-
>   meta/recipes-devtools/gdb/gdb-common.inc           |    2 +-
>   meta/recipes-extended/bash/bash_3.2.48.bb          |    2 +-
>   meta/recipes-extended/bash/bash_4.2.bb             |    2 +-
>   meta/recipes-extended/less/less_444.bb             |    2 +-
>   meta/recipes-extended/mc/mc_4.7.5.2.bb             |    2 +-
>   meta/recipes-extended/mc/mc_4.8.1.bb               |    2 +-
>   meta/recipes-extended/procps/procps_3.2.8.bb       |    2 +-
>   meta/recipes-extended/psmisc/psmisc_22.16.bb       |    2 +-
>   meta/recipes-extended/screen/screen_4.0.3.bb       |    2 +-
>   meta/recipes-extended/texinfo/texinfo_4.13a.bb     |    2 +-
>   meta/recipes-kernel/latencytop/latencytop_0.5.bb   |    2 +-
>   meta/recipes-kernel/powertop/powertop_1.13.bb      |    2 +-
>   .../recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb |    2 +-
>   meta/recipes-support/attr/attr_2.4.46.bb           |    2 +-
>   meta/recipes-support/sqlite/sqlite3_3.7.10.bb      |    2 +-
>   meta/recipes-support/vte/vte_0.28.2.bb             |    2 +-
>   23 files changed, 26 insertions(+), 24 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


