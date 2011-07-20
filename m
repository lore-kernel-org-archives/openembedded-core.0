Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qjad5-00063V-4p
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 19:32:15 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 20 Jul 2011 10:28:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,236,1309762800"; d="scan'208";a="32604319"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by fmsmga001.fm.intel.com with ESMTP; 20 Jul 2011 10:28:03 -0700
Message-ID: <4E271023.4080101@linux.intel.com>
Date: Wed, 20 Jul 2011 10:28:03 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311034342.git.raj.khem@gmail.com>
In-Reply-To: <cover.1311034342.git.raj.khem@gmail.com>
Subject: Re: [PATCH 00/16] Make core-image-minimal core-image-sato buildable with uclibc
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
X-List-Received-Date: Wed, 20 Jul 2011 17:32:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/18/2011 05:17 PM, Khem Raj wrote:
> This patch is V3 of the recents posts I have been doing from kraj/uclibc-oecore
> branch. With this patchset now core-image-minimal is buildable and bootable
> for all arches in oe-core. Core-image-sato is buildable but I have not tried to
> boot it first attemp hung but then I have been trying to build eglibc based
> core-image-sato and make sure that that boots.
>
> The following changes since commit 3d2c1ca9096790e4c6922b65b83ea1dffb90c362:
>
>    util-linux: Replace sigsetmask with posix compliant functions (2011-07-15 18:52:49 -0700)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib kraj/uclibc-oecore
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc-oecore
>
> Khem Raj (16):
>    bitbake.conf: Change TERM default fallback to XTERM instead of
>      GNOME_TERM
>    oe-buildenv-internal: Replace POKYMODE POKYLIBC with TCMODE and
>      TCLIBC
>    default-distrovars: Add largefile and argp to DISTRO_FEATURES
>    acl,attr: Fix build failures when NLS is disabled on uclibc
>    classes/gettext: Do not disable nls for non target recipes
>    libxdamage,libxft,libxrandr: Add missing dependency on virtual/libx11
>    tzcode,tzdata: Update tzdata to 2011h
>    task-core-x11-sato: Add empty NETWORK_MANAGER for uclibc
>    uclibc_0.9.32: Implement sync_file_range2.
This got merged, but need the patch to have a Comment, Upstream-Status 
and Signed-off-by added to it.

>    oprofile: Fix build when query_module is not there
>    powertop: Add lintl to linker commandline on uclibc
>    pimlico/dates: Fix build on uclibc
>    binutils: Fix build when compiling target binutils recipe with gcc
>      4.6
>    clutter-box2d: Replace use of finite macro with C99 compliant
>      isfinite()
>    sysprof: Define NT_GNU_BUILD_ID if undefined
>    mesa-xlib: Dont use locales with uclibc
There are comments about this one on the list.

15/16 got merged, but please submit an update to uclibc_0.9.32 patch.

Thanks
	Sau!

>
>   meta/classes/gettext.bbclass                       |    2 +-
>   meta/conf/bitbake.conf                             |    4 +-
>   meta/conf/distro/include/default-distrovars.inc    |    3 +-
>   .../uclibc/uclibc-0.9.32/sync_file_range2.patch    |   15 ++++
>   meta/recipes-core/uclibc/uclibc_0.9.32.bb          |    3 +-
>   .../binutils/binutils/clone-shadow.patch           |   79 ++++++++++++++++++++
>   meta/recipes-devtools/binutils/binutils_2.21.1.bb  |    3 +-
>   .../recipes-extended/tzcode/tzcode-native_2011g.bb |    7 +-
>   .../tzdata/{tzdata_2011g.bb =>  tzdata_2011h.bb}    |    8 +-
>   .../clutter/clutter-box2d/isfinite.patch           |   19 +++++
>   meta/recipes-graphics/clutter/clutter-box2d_git.bb |    6 +-
>   .../mesa/mesa-xlib/uclibc_locale.patch             |   18 +++++
>   meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb     |    3 +-
>   meta/recipes-graphics/xorg-lib/libxdamage_1.1.3.bb |    4 +-
>   meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb     |    4 +-
>   meta/recipes-graphics/xorg-lib/libxrandr_1.3.1.bb  |    4 +-
>   .../oprofile/oprofile-no-query-modules.patch       |   29 +++++++
>   meta/recipes-kernel/oprofile/oprofile_0.9.6.bb     |    3 +-
>   meta/recipes-kernel/powertop/powertop_1.13.bb      |   11 ++-
>   .../sysprof/files/define-NT_GNU_BUILD_ID.patch     |   22 ++++++
>   meta/recipes-kernel/sysprof/sysprof_git.bb         |    5 +-
>   meta/recipes-sato/pimlico/dates.inc                |    2 +-
>   .../uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch      |   37 +++++++++
>   meta/recipes-sato/pimlico/dates_git.bb             |    6 +-
>   meta/recipes-sato/tasks/task-core-x11-sato.bb      |    2 +
>   meta/recipes-support/attr/acl_2.2.51.bb            |    2 +-
>   meta/recipes-support/attr/attr.inc                 |    4 -
>   meta/recipes-support/attr/attr_2.4.46.bb           |    2 +-
>   meta/recipes-support/attr/ea-acl.inc               |    3 +
>   scripts/oe-buildenv-internal                       |    2 +-
>   30 files changed, 271 insertions(+), 41 deletions(-)
>   create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/sync_file_range2.patch
>   create mode 100644 meta/recipes-devtools/binutils/binutils/clone-shadow.patch
>   rename meta/recipes-extended/tzdata/{tzdata_2011g.bb =>  tzdata_2011h.bb} (96%)
>   create mode 100644 meta/recipes-graphics/clutter/clutter-box2d/isfinite.patch
>   create mode 100644 meta/recipes-graphics/mesa/mesa-xlib/uclibc_locale.patch
>   create mode 100644 meta/recipes-kernel/oprofile/oprofile/oprofile-no-query-modules.patch
>   create mode 100644 meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
>   create mode 100644 meta/recipes-sato/pimlico/dates/uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch
>


