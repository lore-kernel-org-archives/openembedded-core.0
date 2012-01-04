Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RiEm5-00033z-2v
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 01:32:15 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jan 2012 16:24:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="102885989"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jan 2012 16:24:49 -0800
Message-ID: <4F039C51.4030407@linux.intel.com>
Date: Tue, 03 Jan 2012 16:24:49 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325101673.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325101673.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 00/16] Misc Qt4 and udev changes pending from O.S. Systems
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
X-List-Received-Date: Wed, 04 Jan 2012 00:32:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/28/2011 11:55 AM, Otavio Salvador wrote:
> This patchset includes our pending changes for Qt4 and udev. The udev
> patchset does a great cleanup on the udev package reducing a lot the
> delta between OE-Core and Meta-OE. Am working at updating the udev to
> 175 but those patches are the basis for this.
>
> Those has been tested under imx53qsb and O.S. Systems' x86 based
> machine definition using internal images running Qt4, Qt4-Embedded,
> SysV and SystemD.
>
> The following changes since commit 8f348ccad083d6c02c200652ff6295e701e88f0d:
>
>    coreutils: ensure --color works so DEPEND on libcap (2011-12-24 10:05:35 +0000)
>
> are available in the git repository at:
>    git://github.com/OSSystems/oe-core master
>    https://github.com/OSSystems/oe-core/tree/HEAD
>
> Otavio Salvador (16):
>    qt4-graphics-system: add
>    qt4e.bbclass: add QT_BASE_NAME for use in recipes
>    qt4x11.bbclass: add QT_BASE_NAME for use in recipes
>    qt4-embedded.inc: use QT_BASE_NAME from qt4e.bbclass
>    qt4-x11-free.inc: use QT_BASE_NAME from qt4x11.bbclass

I already commented on these with xserver-common

>    udev: drop 145 version
>    udev-extraconf: move mount.blacklist to udev-extraconf dir
>    udev: reorganize files of 164 version
>    udev: use tabs for init script (no code changes)
>    udev: skip mounting /dev on tmpfs if it is on devtmpfs
These first 5 were merged into OE-Core

>    udev: ensure /dev/pts and /dev/shm does exists
>    udev: improve udev-cache robustness
>    udev: use 'echo' instead of 'echo -n' in init script
>    udev: run depmod if modules.dep doesn't exist
>    udev: split utilities onto udev-utils
>    udev: remove commented code from init script (no code changes)
>
Richard is reviewing this in more detail.

Thanks
	Sau!


>   meta/classes/qt4e.bbclass                          |    1 +
>   meta/classes/qt4x11.bbclass                        |    1 +
>   meta/recipes-core/udev/files/fix-alignment.patch   |   26 -
>   meta/recipes-core/udev/files/init                  |  212 ------
>   meta/recipes-core/udev/files/local.rules           |   22 -
>   meta/recipes-core/udev/files/noasmlinkage.patch    |   39 -
>   meta/recipes-core/udev/files/permissions.rules     |   81 --
>   meta/recipes-core/udev/files/tmpfs.patch           |   17 -
>   meta/recipes-core/udev/files/udev-cache            |   20 -
>   meta/recipes-core/udev/files/udev.rules            |   98 ---
>   meta/recipes-core/udev/files/udev_network_queue.sh |   35 -
>   meta/recipes-core/udev/files/udevsynthesize.patch  |  778 --------------------
>   meta/recipes-core/udev/files/udevsynthesize.sh     |   51 --
>   meta/recipes-core/udev/udev-145/enable-gudev.patch |   50 --
>   meta/recipes-core/udev/udev-145/init               |   59 --
>   meta/recipes-core/udev/udev-145/local.rules        |   33 -
>   meta/recipes-core/udev/udev-145/noasmlinkage.patch |   50 --
>   meta/recipes-core/udev/udev-145/unbreak.patch      |   26 -
>   meta/recipes-core/udev/udev-164/init               |   59 --
>   meta/recipes-core/udev/udev-164/permissions.rules  |  131 ----
>   meta/recipes-core/udev/udev-164/run.rules          |   14 -
>   meta/recipes-core/udev/udev-164/udev.rules         |  116 ---
>   .../udev/{files =>  udev-extraconf}/mount.blacklist |    0
>   meta/recipes-core/udev/udev-new.inc                |   91 ---
>   meta/recipes-core/udev/udev.inc                    |  108 ++--
>   .../udev/{files =>  udev}/devfs-udev.rules          |    0
>   meta/recipes-core/udev/udev/init                   |   76 ++
>   meta/recipes-core/udev/{files =>  udev}/links.conf  |    0
>   .../udev/{udev-164 =>  udev}/local.rules            |    0
>   meta/recipes-core/udev/{files =>  udev}/mount.sh    |    0
>   meta/recipes-core/udev/{files =>  udev}/network.sh  |    0
>   .../udev/{udev-145 =>  udev}/permissions.rules      |    0
>   .../recipes-core/udev/{udev-145 =>  udev}/run.rules |    0
>   .../udev/{files =>  udev}/udev-166-v4l1-1.patch     |    0
>   meta/recipes-core/udev/udev/udev-cache             |   34 +
>   meta/recipes-core/udev/udev/udev-cache.default     |    4 +
>   .../udev/{udev-145 =>  udev}/udev.rules             |    0
>   meta/recipes-core/udev/udev_145.bb                 |   55 --
>   meta/recipes-core/udev/udev_164.bb                 |    4 +-
>   .../qt4-graphics-system/qt4-graphics-system_1.0.bb |   24 +
>   meta/recipes-qt/qt4/qt4-embedded.inc               |    3 +-
>   meta/recipes-qt/qt4/qt4-x11-free.inc               |    3 +-
>   42 files changed, 208 insertions(+), 2113 deletions(-)
>   delete mode 100644 meta/recipes-core/udev/files/fix-alignment.patch
>   delete mode 100755 meta/recipes-core/udev/files/init
>   delete mode 100644 meta/recipes-core/udev/files/local.rules
>   delete mode 100644 meta/recipes-core/udev/files/noasmlinkage.patch
>   delete mode 100644 meta/recipes-core/udev/files/permissions.rules
>   delete mode 100644 meta/recipes-core/udev/files/tmpfs.patch
>   delete mode 100644 meta/recipes-core/udev/files/udev-cache
>   delete mode 100644 meta/recipes-core/udev/files/udev.rules
>   delete mode 100644 meta/recipes-core/udev/files/udev_network_queue.sh
>   delete mode 100644 meta/recipes-core/udev/files/udevsynthesize.patch
>   delete mode 100644 meta/recipes-core/udev/files/udevsynthesize.sh
>   delete mode 100644 meta/recipes-core/udev/udev-145/enable-gudev.patch
>   delete mode 100644 meta/recipes-core/udev/udev-145/init
>   delete mode 100644 meta/recipes-core/udev/udev-145/local.rules
>   delete mode 100644 meta/recipes-core/udev/udev-145/noasmlinkage.patch
>   delete mode 100644 meta/recipes-core/udev/udev-145/unbreak.patch
>   delete mode 100644 meta/recipes-core/udev/udev-164/init
>   delete mode 100644 meta/recipes-core/udev/udev-164/permissions.rules
>   delete mode 100644 meta/recipes-core/udev/udev-164/run.rules
>   delete mode 100644 meta/recipes-core/udev/udev-164/udev.rules
>   rename meta/recipes-core/udev/{files =>  udev-extraconf}/mount.blacklist (100%)
>   delete mode 100644 meta/recipes-core/udev/udev-new.inc
>   rename meta/recipes-core/udev/{files =>  udev}/devfs-udev.rules (100%)
>   create mode 100644 meta/recipes-core/udev/udev/init
>   rename meta/recipes-core/udev/{files =>  udev}/links.conf (100%)
>   rename meta/recipes-core/udev/{udev-164 =>  udev}/local.rules (100%)
>   rename meta/recipes-core/udev/{files =>  udev}/mount.sh (100%)
>   rename meta/recipes-core/udev/{files =>  udev}/network.sh (100%)
>   rename meta/recipes-core/udev/{udev-145 =>  udev}/permissions.rules (100%)
>   rename meta/recipes-core/udev/{udev-145 =>  udev}/run.rules (100%)
>   rename meta/recipes-core/udev/{files =>  udev}/udev-166-v4l1-1.patch (100%)
>   create mode 100644 meta/recipes-core/udev/udev/udev-cache
>   create mode 100644 meta/recipes-core/udev/udev/udev-cache.default
>   rename meta/recipes-core/udev/{udev-145 =>  udev}/udev.rules (100%)
>   delete mode 100644 meta/recipes-core/udev/udev_145.bb
>   create mode 100644 meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
>


