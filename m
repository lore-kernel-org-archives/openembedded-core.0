Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TnJJj-0000Mm-Df
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Dec 2012 02:28:38 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Dec 2012 17:13:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,351,1355126400"; d="scan'208";a="266649967"
Received: from unknown (HELO [10.255.12.150]) ([10.255.12.150])
	by fmsmga001.fm.intel.com with ESMTP; 24 Dec 2012 17:13:34 -0800
Message-ID: <50D8FDBE.4030203@linux.intel.com>
Date: Mon, 24 Dec 2012 17:13:34 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Radu Moisan <radu.moisan@intel.com>
References: <cover.1356022882.git.radu.moisan@intel.com>
In-Reply-To: <cover.1356022882.git.radu.moisan@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/28][RFC] systemd Integration
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
X-List-Received-Date: Tue, 25 Dec 2012 01:28:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/20/2012 09:11 AM, Radu Moisan wrote:
> I've rebased my branch, again :), with some cleanups here and there
> I also pushed a few patches suggested by Martin.
> Feel free to comment on everything.
>
> The following changes since commit 958162e96b4a4f23bca94500b5f20975633dd5c6:
>
>    bitbake: hob: use base image only if it was set (2012-12-14 17:31:31 +0000)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib rmoisan/systemd
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rmoisan/systemd
>
> Enrico Scholz (1):
>    systemd: move disable operation into prerm() script
>
> Holger Hans Peter Freyther (2):
>    systemd: Make the main systemd files proper CONFFILES
>    systemd: Introduce a create-volatile to create tmp directories
>
> Khem Raj (1):
>    systemd: Fix build when base_libdir is not /lib
>
> Martin Donnelly (2):
>    cgroups: Add INSANE_SKIP to avoid warning about .so file
>    Remove sysvinit mount related services if systemd is enabled
>
> Martin Jansa (2):
>    systemd-systemctl-native: fix FILESPATH to find systemctl
>    systemd: add PACKAGES_DYNAMIC
>
> Radu Moisan (20):
>    Systemd initial integration
>    Add DISTRO_FEATURES_INITMAN to DISTRO_FEATURES
>    Automatically set PREFERRED_PROVIDER_udev
>    Add systemd_base.bbclass
>    Include systemd-compat-units and avahi-systemd
>    Inherit the systemd_base class
>    set default.target to multi-user.target
>    wpa-supplicant: Fix indentation
>    dropbear: Fix indentation and cleanup
>    systemd: Some more cleanup
>    systemd: disable  source rcS-default
>    polkit: merge together the two instances of PACKAGECONFIG
>    systemd-native: update FILESPATH with *-native directory
>    systemd: Remove gitpkgv.bbclass
>    systemd: (temporary) remove dependency on cairo
>    initscripts: Cleanup recipe
>    systemd: disable sysfs.service
>    xserver-nodm-init: add systemd support
>    util-linux: Enable systemd support
>    lighttpd: Remove automake patch
>

Please be sure to build this with the INCOMPATIBLE_LICENSE = "GPLv3" 
settig, I saw the following issues on the Autobuilder.

>
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing PROVIDES 'xz' (but /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/meta/recipes-core/systemd/systemd_git.bb DEPENDS on or otherwise requires it)
> ERROR: xz was skipped: incompatible with license GPLv2+ & GPLv3+ & LGPLv2.1+
> ERROR: Nothing RPROVIDES 'udev-systemd' (but /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/meta/recipes-core/systemd/systemd_git.bb RDEPENDS on or otherwise requires it)
> ERROR: No eligible RPROVIDERs exist for 'udev-systemd'
> NOTE: Runtime target 'udev-systemd' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['udev-systemd']
> ERROR: Nothing RPROVIDES 'systemd' (but /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/meta/recipes-core/systemd/systemd_git.bb RDEPENDS on or otherwise requires it)
> ERROR: No eligible RPROVIDERs exist for 'systemd'
> NOTE: Runtime target 'systemd' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['systemd']
> ERROR: Nothing RPROVIDES 'systemd-dev' (but /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/meta/recipes-core/systemd/systemd_git.bb RDEPENDS on or otherwise requires it)
> ERROR: No eligible RPROVIDERs exist for 'systemd-dev'
> NOTE: Runtime target 'systemd-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['systemd-dev']
> NOTE: Runtime target 'systemd-serialgetty' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['systemd-serialgetty']
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks

Also, you do not provide very clear information at the beginning, but I 
assume to enable systemd, it's just setting DISTRO_FEATURE += "systemd", 
or is there more?

Sau!

>   meta/classes/base.bbclass                          |    7 +
>   meta/classes/systemd.bbclass                       |    1 +
>   meta/classes/systemd_base.bbclass                  |  218 +++++++++++++
>   meta/conf/distro/include/default-distrovars.inc    |    3 +-
>   meta/recipes-bsp/keymaps/files/keymaps.service     |    9 +
>   meta/recipes-bsp/keymaps/keymaps_1.0.bb            |    9 +-
>   meta/recipes-connectivity/avahi/avahi.inc          |   10 +-
>   meta/recipes-connectivity/connman/connman.inc      |    6 +
>   meta/recipes-connectivity/connman/connman_1.4.bb   |    3 +-
>   meta/recipes-connectivity/dhcp/dhcp.inc            |   15 +-
>   meta/recipes-connectivity/dhcp/files/dhcpd.service |   12 +
>   .../dhcp/files/dhcrelay.service                    |   10 +
>   .../openssh/openssh-6.0p1/sshd.socket              |   11 +
>   .../openssh/openssh-6.0p1/sshd@.service            |    9 +
>   .../openssh/openssh-6.0p1/sshdgenkeys.service      |   10 +
>   meta/recipes-connectivity/openssh/openssh_6.0p1.bb |   14 +-
>   .../wpa-supplicant/wpa-supplicant-1.0.inc          |   74 +++--
>   .../wpa-supplicant/wpa-supplicant_1.0.bb           |    2 +-
>   meta/recipes-core/busybox/busybox.inc              |   18 ++
>   meta/recipes-core/busybox/busybox_1.20.2.bb        |    4 +-
>   .../busybox/files/busybox-klogd.service.in         |    8 +
>   .../busybox/files/busybox-syslog.service.in        |   13 +
>   meta/recipes-core/dropbear/dropbear.inc            |   81 ++---
>   .../recipes-core/dropbear/dropbear/dropbear.socket |   10 +
>   .../dropbear/dropbear/dropbear@.service            |    9 +
>   .../dropbear/dropbear/dropbearkey.service          |   10 +
>   .../initscripts-1.0/{urandom => urandom.sh}        |    0
>   meta/recipes-core/initscripts/initscripts_1.0.bb   |  166 +++++-----
>   meta/recipes-core/libcgroup/libcgroup_0.37.1.bb    |    1 +
>   .../packagegroups/packagegroup-base.bb             |    4 +-
>   .../packagegroups/packagegroup-core-boot.bb        |    8 +-
>   meta/recipes-core/systemd/systemd-compat-units.bb  |   59 ++++
>   .../systemd/systemd-compat-units/machineid.service |   16 +
>   .../systemd-compat-units/run-postinsts.service     |   17 +
>   .../systemd/systemd-machine-units_1.0.bb           |   14 +
>   meta/recipes-core/systemd/systemd-serialgetty.bb   |   46 +++
>   .../systemd/systemd-serialgetty/LICENSE            |  339 ++++++++++++++++++++
>   .../systemd-serialgetty/serial-getty@.service      |   32 ++
>   meta/recipes-core/systemd/systemd-speed-hacks.bb   |   18 ++
>   .../systemd/systemd-systemctl-native.bb            |   20 ++
>   .../systemd/systemd-systemctl-native/systemctl     |  126 ++++++++
>   .../systemd/systemd/create-volatile.conf           |   10 +
>   meta/recipes-core/systemd/systemd/gtk-doc.make     |  230 +++++++++++++
>   meta/recipes-core/systemd/systemd/modprobe.rules   |   17 +
>   .../systemd/systemd/optional_secure_getenv.patch   |   19 ++
>   .../systemd/set_default_target_to_multi-user.patch |   13 +
>   .../systemd-pam-configure-check-uclibc.patch       |   26 ++
>   .../systemd/systemd/systemd-pam-fix-execvpe.patch  |   26 ++
>   .../systemd/systemd-pam-fix-fallocate.patch        |   82 +++++
>   .../systemd/systemd-pam-fix-getty-unit.patch       |   35 ++
>   .../systemd/systemd/systemd-pam-fix-mkostemp.patch |  166 ++++++++++
>   .../systemd/systemd/systemd-pam-fix-msformat.patch |  335 +++++++++++++++++++
>   .../recipes-core/systemd/systemd/touchscreen.rules |   18 ++
>   meta/recipes-core/systemd/systemd/var-run.conf     |    4 +
>   meta/recipes-core/systemd/systemd_git.bb           |  251 +++++++++++++++
>   meta/recipes-core/util-linux/util-linux.inc        |    9 +-
>   meta/recipes-extended/cronie/cronie/crond.service  |   10 +
>   meta/recipes-extended/cronie/cronie_1.4.8.bb       |   10 +-
>   .../lighttpd/files/lighttpd.service                |   13 +
>   meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb  |   11 +-
>   meta/recipes-extended/pam/libpam_1.1.6.bb          |    5 +-
>   meta/recipes-extended/polkit/polkit_0.104.bb       |   11 +-
>   meta/recipes-graphics/x11-common/x11-common_0.1.bb |    4 +-
>   .../x11-common/xserver-nodm-init.bb                |   19 +-
>   .../x11-common/xserver-nodm-init/xserver-nodm.conf |    1 +
>   .../xserver-nodm-init/xserver-nodm.service         |    9 +
>   66 files changed, 2604 insertions(+), 172 deletions(-)
>   create mode 100644 meta/classes/systemd.bbclass
>   create mode 100644 meta/classes/systemd_base.bbclass
>   create mode 100644 meta/recipes-bsp/keymaps/files/keymaps.service
>   create mode 100644 meta/recipes-connectivity/dhcp/files/dhcpd.service
>   create mode 100644 meta/recipes-connectivity/dhcp/files/dhcrelay.service
>   create mode 100644 meta/recipes-connectivity/openssh/openssh-6.0p1/sshd.socket
>   create mode 100644 meta/recipes-connectivity/openssh/openssh-6.0p1/sshd@.service
>   create mode 100644 meta/recipes-connectivity/openssh/openssh-6.0p1/sshdgenkeys.service
>   create mode 100644 meta/recipes-core/busybox/files/busybox-klogd.service.in
>   create mode 100644 meta/recipes-core/busybox/files/busybox-syslog.service.in
>   create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear.socket
>   create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear@.service
>   create mode 100644 meta/recipes-core/dropbear/dropbear/dropbearkey.service
>   rename meta/recipes-core/initscripts/initscripts-1.0/{urandom => urandom.sh} (100%)
>   create mode 100644 meta/recipes-core/systemd/systemd-compat-units.bb
>   create mode 100644 meta/recipes-core/systemd/systemd-compat-units/machineid.service
>   create mode 100644 meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
>   create mode 100644 meta/recipes-core/systemd/systemd-machine-units_1.0.bb
>   create mode 100644 meta/recipes-core/systemd/systemd-serialgetty.bb
>   create mode 100644 meta/recipes-core/systemd/systemd-serialgetty/LICENSE
>   create mode 100644 meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
>   create mode 100644 meta/recipes-core/systemd/systemd-speed-hacks.bb
>   create mode 100644 meta/recipes-core/systemd/systemd-systemctl-native.bb
>   create mode 100755 meta/recipes-core/systemd/systemd-systemctl-native/systemctl
>   create mode 100644 meta/recipes-core/systemd/systemd/create-volatile.conf
>   create mode 100644 meta/recipes-core/systemd/systemd/gtk-doc.make
>   create mode 100644 meta/recipes-core/systemd/systemd/modprobe.rules
>   create mode 100644 meta/recipes-core/systemd/systemd/optional_secure_getenv.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/set_default_target_to_multi-user.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/touchscreen.rules
>   create mode 100644 meta/recipes-core/systemd/systemd/var-run.conf
>   create mode 100644 meta/recipes-core/systemd/systemd_git.bb
>   create mode 100644 meta/recipes-extended/cronie/cronie/crond.service
>   create mode 100644 meta/recipes-extended/lighttpd/files/lighttpd.service
>   create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf
>   create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service
>


