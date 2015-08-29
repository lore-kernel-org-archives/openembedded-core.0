Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E27F7760FB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Aug 2015 15:45:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 29 Aug 2015 08:45:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,429,1437462000"; d="scan'208";a="778139773"
Received: from ngniech-mobl.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.254.55.139])
	by fmsmga001.fm.intel.com with ESMTP; 29 Aug 2015 08:45:05 -0700
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1440790956.git.akuster808@gmail.com>
From: Saul Wold <sgw@linux.intel.com>
Message-ID: <55E15167.4040302@linux.intel.com>
Date: Fri, 28 Aug 2015 23:29:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <cover.1440790956.git.akuster808@gmail.com>
Subject: Re: [PATCH 00/15] For Dizzy 1.7.3a v2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 29 Aug 2015 15:45:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Armin,

I added the bitbake patch to my sgw/dizzy branch and threw it against 
the Autobuilder.

There where a few failures, some of which may be expected, others need 
more investigation:

arm64
mip64
  - I don't think that dizzy had support for those yet.


deb-non-deb
  - did these ever work for dizzy?

wic
  - New build target

It's still finishing up right now.

Sau!


On 08/28/2015 12:44 PM, Armin Kuster wrote:
> Rebased against Dizzy this time.
>
> Please consider this changes for Dizzy 1.7.3
>
> The following changes since commit 137f52ac3a3cf6dc9eed27178c37e9ce235341d8:
>
>    grub-efi: Add backslash lost from previous commit (2015-08-20 21:42:31 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
>    http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy-next
>
> Alejandro Hernandez (1):
>    qemurunner: Improves checking for server and target IPs on qemus
>      parameters
>
> Aníbal Limón (1):
>    license_class: fix license.manifest shows LICENSE field differently to
>      recipe
>
> Martin Jansa (2):
>    connman-conf: fix SRC_URI_append
>    license.bbclass: fix unexpected operator for LICENSE values with space
>
> Paul Eggleton (1):
>    oeqa/utils/qemurunner: fix logging
>
> Petter Mabäcker (1):
>    meta: set proper S value
>
> Richard Purdie (3):
>    runqueue: Add message to explain the problem if diffsigs multiple
>      tasks don't exist
>    fetch2: Extend mirroruri handlling
>    sstate: Use SSTATE_DIR for FILESPATH
>
> Ross Burton (1):
>    oeqa/QemuRunner: don't use bb for logging
>
> Sona Sarmadi (4):
>    bind9.9.5: CVE-2015-5477
>    qemu: CVE-2014-7840
>    qemu-vnc: CVE-2014-7815
>    qemu-slirp: CVE-2014-3640
>
> Yi Zhao (1):
>    oeqa/selftest: fix test_incremental_image_generation for changes in
>      log output
>
>   bitbake/lib/bb/fetch2/__init__.py                  |  1 +
>   bitbake/lib/bb/runqueue.py                         |  2 +
>   meta/classes/license.bbclass                       | 15 ++---
>   meta/classes/sstate.bbclass                        |  4 +-
>   meta/lib/oeqa/selftest/buildoptions.py             | 11 ++--
>   meta/lib/oeqa/utils/qemurunner.py                  | 73 ++++++++++++----------
>   meta/recipes-bsp/alsa-state/alsa-state.bb          |  2 +
>   meta/recipes-bsp/hostap/hostap-conf_1.0.bb         |  2 +
>   meta/recipes-bsp/keymaps/keymaps_1.0.bb            |  2 +
>   .../bind/bind/bind9_9_5-CVE-2015-5477.patch        | 45 +++++++++++++
>   meta/recipes-connectivity/bind/bind_9.9.5.bb       |  1 +
>   meta/recipes-connectivity/connman/connman-conf.bb  |  8 ++-
>   .../ppp-dialin/ppp-dialin_0.1.bb                   |  2 +
>   .../init-ifupdown/init-ifupdown_1.0.bb             |  2 +
>   .../initrdscripts/initramfs-boot_1.0.bb            |  2 +
>   .../initrdscripts/initramfs-framework_1.0.bb       |  2 +
>   .../initrdscripts/initramfs-live-boot_1.0.bb       |  2 +
>   .../initramfs-live-install-efi-testfs_1.0.bb       |  2 +
>   .../initramfs-live-install-efi_1.0.bb              |  2 +
>   .../initramfs-live-install-testfs_1.0.bb           |  2 +
>   .../initrdscripts/initramfs-live-install_1.0.bb    |  2 +
>   meta/recipes-core/initscripts/initscripts_1.0.bb   |  2 +
>   .../systemd/systemd-systemctl-native.bb            |  2 +
>   .../sysvinit/sysvinit-inittab_2.88dsf.bb           |  2 +-
>   meta/recipes-core/udev/udev-extraconf_1.1.bb       |  2 +
>   meta/recipes-devtools/opkg/opkg-collateral.bb      |  2 +
>   .../recipes-devtools/qemu/qemu/CVE-2014-7840.patch | 57 +++++++++++++++++
>   .../qemu/qemu/slirp-CVE-2014-3640.patch            | 48 ++++++++++++++
>   .../qemu/qemu/vnc-CVE-2014-7815.patch              | 53 ++++++++++++++++
>   meta/recipes-devtools/qemu/qemu_2.1.0.bb           |  3 +
>   .../run-postinsts/run-postinsts_1.0.bb             |  2 +
>   .../shadow/shadow-securetty_4.2.1.bb               |  2 +
>   .../xorg-xserver/xserver-xf86-config_0.1.bb        |  2 +
>   .../modutils-initscripts/modutils-initscripts.bb   |  3 +
>   meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb        |  2 +
>   .../ptest-runner/ptest-runner_1.0.bb               |  2 +
>   36 files changed, 318 insertions(+), 50 deletions(-)
>   create mode 100644 meta/recipes-connectivity/bind/bind/bind9_9_5-CVE-2015-5477.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2014-7840.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu/slirp-CVE-2014-3640.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu/vnc-CVE-2014-7815.patch
>

