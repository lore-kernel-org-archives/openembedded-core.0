Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SQ2Bt-0000q0-Iw
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 21:59:53 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 03 May 2012 12:50:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="138597700"
Received: from unknown (HELO [10.255.12.171]) ([10.255.12.171])
	by azsmga001.ch.intel.com with ESMTP; 03 May 2012 12:50:06 -0700
Message-ID: <4FA2E16D.2080009@linux.intel.com>
Date: Thu, 03 May 2012 12:50:05 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1335909595.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1335909595.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 0/6] Recipe upgrades
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
X-List-Received-Date: Thu, 03 May 2012 19:59:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/01/2012 03:00 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> The following changes since commit d89f7b9cab1946a3267e3b0402f168f946d480b2:
>
>    documentation/Makefile: Fixed figures publishing bug (2012-05-01 20:50:56 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib nitin/upgrades
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/upgrades
>
> Nitin A Kamble (6):
>    qt4: fix compilation issue
This one got merged accidently and will cause some breakage until we get 
the updated version of glib-2.0 in, but other fixes are required also.

>    makedepend: upgrade from 1.0.3 to 1.0.4
>    quilt: upgrade from 0.51 to 0.60
>    gdb: upgrade from 7.4 to 7.4.1
>    python: upgrade from 2.7.2 to 2.7.3
>    distro-tracking: update as per recent recipe upgrades
>
>   meta/conf/distro/include/default-versions.inc      |    4 +-
>   .../conf/distro/include/distro_tracking_fields.inc |   20 +++++-----
>   meta/recipes-devtools/gdb/gdb-common.inc           |    6 ++--
>   ...canadian_7.4.bb =>  gdb-cross-canadian_7.4.1.bb} |    2 +-
>   .../gdb/{gdb-cross_7.4.bb =>  gdb-cross_7.4.1.bb}   |    0
>   .../gdb/{gdb_7.4.bb =>  gdb_7.4.1.bb}               |    0
>   ...thon-native_2.7.2.bb =>  python-native_2.7.3.bb} |    6 +---
>   meta/recipes-devtools/python/python.inc            |    8 ++--
>   .../python/python/04-default-is-optimized.patch    |   30 +++++++++------
>   .../python/fix_for_using_different_libdir.patch    |   30 +++++++++-------
>   .../python/sys_platform_is_now_always_linux2.patch |   39 --------------------
>   .../python/{python_2.7.2.bb =>  python_2.7.3.bb}    |    3 +-
>   .../quilt/{quilt-0.51.inc =>  quilt-0.60.inc}       |    4 +-
>   .../{quilt-native_0.51.bb =>  quilt-native_0.60.bb} |    2 +-
>   .../quilt/{quilt_0.51.bb =>  quilt_0.60.bb}         |    2 +-
>   .../{makedepend_1.0.3.bb =>  makedepend_1.0.4.bb}   |    5 +--
>   meta/recipes-qt/qt4/qt-4.8.1.inc                   |    1 +
>   .../qt4/qt-4.8.1/fix_conflicting_types.patch       |   29 +++++++++++++++
>   meta/recipes-qt/qt4/qt4-x11-free.inc               |    2 +-
>   19 files changed, 94 insertions(+), 99 deletions(-)
>   rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.4.bb =>  gdb-cross-canadian_7.4.1.bb} (88%)
>   rename meta/recipes-devtools/gdb/{gdb-cross_7.4.bb =>  gdb-cross_7.4.1.bb} (100%)
>   rename meta/recipes-devtools/gdb/{gdb_7.4.bb =>  gdb_7.4.1.bb} (100%)
>   rename meta/recipes-devtools/python/{python-native_2.7.2.bb =>  python-native_2.7.3.bb} (92%)
>   delete mode 100644 meta/recipes-devtools/python/python/sys_platform_is_now_always_linux2.patch
>   rename meta/recipes-devtools/python/{python_2.7.2.bb =>  python_2.7.3.bb} (98%)
>   rename meta/recipes-devtools/quilt/{quilt-0.51.inc =>  quilt-0.60.inc} (84%)
>   rename meta/recipes-devtools/quilt/{quilt-native_0.51.bb =>  quilt-native_0.60.bb} (83%)
>   rename meta/recipes-devtools/quilt/{quilt_0.51.bb =>  quilt_0.60.bb} (98%)
>   rename meta/recipes-graphics/xorg-util/{makedepend_1.0.3.bb =>  makedepend_1.0.4.bb} (82%)
>   create mode 100644 meta/recipes-qt/qt4/qt-4.8.1/fix_conflicting_types.patch
>

Merged into OE-Core

Thanks
	Sau!


