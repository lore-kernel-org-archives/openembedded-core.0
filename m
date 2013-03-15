Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UGKLb-0002gJ-K8 for openembedded-core@lists.openembedded.org;
	Fri, 15 Mar 2013 03:26:21 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2F2I6ap009190; Fri, 15 Mar 2013 02:18:06 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2r3v-Bcqx3HT; Fri, 15 Mar 2013 02:18:06 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2F2Hs6t009184
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 15 Mar 2013 02:18:00 GMT
Message-ID: <1363313340.14476.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 15 Mar 2013 02:09:00 +0000
In-Reply-To: <cover.1363287636.git.sgw@linux.intel.com>
References: <cover.1363287636.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/29] SystemD and other fixes
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
X-List-Received-Date: Fri, 15 Mar 2013 02:26:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-03-14 at 12:02 -0700, Saul Wold wrote:
> Richard,
> 
> I pulled Ross's non-controversial systemd patches, along with some updates
> that I have reviewed and built on the AB (still in progress, but looking green)
> 
> One item to verify is Martin's package.bbclass change.
> 
> Thanks
> 	Sau!
> 
> 
> The following changes since commit bd03014c8fd080e04dd0a96a6b4b9211568c1cf1:
> 
>   package_rpm: Ensure package dependencies have correct version numbers (2013-03-14 16:37:03 +0000)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Andrei Dinu (1):
>   psplash : update to latest SRCREV
>     afd4e228c606a9998feae44a3fed4474803240b7
> 
> Constantin Musca (1):
>   libxi: upgrade to 1.7
> 
> Cristian Iorga (4):
>   libical: add recipe back in oe-core
>   build-appliance-image: upgrade to newer poky revision.
>   build-appliance-image: ethernet connection type is now bridged
>   build-appliance-image: fix lost net connectivity after restart
> 
> Hongxu Jia (1):
>   qemu-native:fix do_compile failed on SLED 11.2
> 
> Khem Raj (2):
>   sudo: Compile mksigname and mksiglist for build host

Took all these patches except the above which I want to double check
whether there is an autotools method we can use for this now. Ross might
have some knowledge about this.

Cheers,

Richard

>   watchdog: Upgrade 5.12 -> 5.13
> 
> Laurentiu Palcu (4):
>   inputproto: upgrade to 2.3
>   xserver-xorg: upgrade to 1.14.0
>   xf86-video-intel: upgrade to 2.21.3
>   xf86-video-*: delete references to mibstore.h
> 
> Martin Jansa (2):
>   package.bbclass: add debug-without-src PACKAGE_DEBUG_SPLIT_STYLE
>   icecc: improve interaction with sstate
> 
> Olivier Guiter (1):
>   neard: Update reference commit sha1 and install script
> 
> Ross Burton (11):
>   connman: explicitly disable systemd if we don't want it enabled
>   polkit: explicitly disable systemd if we're using consolekit
>   xf86-video-intel: add explicit dependency on udev
>   avahi: explicitly disable systemd if we don't want it enabled
>   xkeyboard-config: remove long-gone build dependencies
>   systemd-compat-units: add missing systemd-systemctl-native dependency
>   busybox: enable swapon -p (91 byte increase)
>   systemd: busybox's swapon now supports -p
>   systemd: remove util-linux-mount dependency
>   systemd: set the location of the kill binary
>   systemd: remove libsystemd-daemon linkage in libudev
> 
> Zhenhua Luo (2):
>   binutils: fix ineffectual zero of cache and array bounds issue
>   elfutils: Fix size passed to snprintf for invalid sh_name case
> 
>  meta/classes/icecc.bbclass                         |  6 ++
>  meta/classes/package.bbclass                       |  6 ++
>  meta/recipes-connectivity/avahi/avahi.inc          |  2 +-
>  .../connman/connman-conf/qemuall/wired-setup       |  2 +-
>  meta/recipes-connectivity/connman/connman.inc      |  2 +-
>  .../neard/neard/{neard => neard.in}                | 14 +++-
>  meta/recipes-connectivity/neard/neard_0.9.bb       | 32 +++++----
>  meta/recipes-core/busybox/busybox-1.20.2/defconfig |  2 +-
>  meta/recipes-core/images/build-appliance-image.bb  |  4 +-
>  .../Yocto_Build_Appliance.vmx                      |  2 +-
>  meta/recipes-core/psplash/psplash_git.bb           |  4 +-
>  meta/recipes-core/systemd/systemd-compat-units.bb  |  2 +
>  .../systemd/systemd/udev-linkage.patch             | 62 ++++++++++++++++
>  meta/recipes-core/systemd/systemd_197.bb           |  8 +--
>  meta/recipes-devtools/binutils/binutils-2.23.1.inc |  5 +-
>  .../binutils-fix-ineffectual-zero-of-cache.patch   | 60 ++++++++++++++++
>  .../binutils-replace-strncat-with-strcat.patch     | 26 +++++++
>  .../binutils-fix-over-array-bounds-issue.patch     | 20 ++++++
>  ...ssed-to-snprintf-for-invalid-sh_name-case.patch | 27 +++++++
>  meta/recipes-devtools/elfutils/elfutils_0.148.bb   |  3 +-
>  .../fix-libcap-header-issue-on-some-distro.patch   | 84 ++++++++++++++++++++++
>  meta/recipes-devtools/qemu/qemu.inc                |  4 ++
>  meta/recipes-extended/polkit/polkit_0.104.bb       |  5 +-
>  meta/recipes-extended/sudo/sudo.inc                |  5 ++
>  .../watchdog/files/fix-ping-failure.patch          | 21 ++----
>  .../{watchdog_5.12.bb => watchdog_5.13.bb}         |  7 +-
>  .../xf86-video-fbdev/Remove-mibstore.h.patch       | 35 +++++++++
>  .../xorg-driver/xf86-video-fbdev_0.4.3.bb          |  2 +
>  ...-intel_2.21.0.bb => xf86-video-intel_2.21.3.bb} |  6 +-
>  .../xorg-driver/xf86-video-intel_git.bb            |  2 +-
>  .../xf86-video-vesa/Remove-mibstore.h.patch        | 37 ++++++++++
>  .../xorg-driver/xf86-video-vesa_2.3.2.bb           |  2 +
>  .../xf86-video-vmware/Kill-mibstore.patch          | 63 ++++++++++++++++
>  .../xorg-driver/xf86-video-vmware_13.0.0.bb        |  2 +
>  .../xorg-lib/{libxi_1.6.1.bb => libxi_1.7.bb}      |  6 +-
>  .../xorg-lib/xkeyboard-config_2.8.bb               |  2 +-
>  .../{inputproto_2.2.bb => inputproto_2.3.bb}       |  4 +-
>  .../xorg-xserver/xserver-xorg-1.13.1/aarch64.patch | 64 -----------------
>  .../xorg-xserver/xserver-xorg-1.14.0/aarch64.patch | 35 +++++++++
>  .../crosscompile.patch                             |  0
>  .../fix_compilation_when_not_using_xinerama.patch  | 21 ++++++
>  .../fix_open_max_preprocessor_error.patch          |  0
>  .../macro_tweak.patch                              |  0
>  .../mips64-compiler.patch                          |  0
>  ...erver-xorg_1.13.1.bb => xserver-xorg_1.14.0.bb} |  5 +-
>  .../libical/files/pthread-fix.patch                | 52 ++++++++++++++
>  meta/recipes-support/libical/libical_0.48.bb       | 17 +++++
>  47 files changed, 641 insertions(+), 129 deletions(-)
>  rename meta/recipes-connectivity/neard/neard/{neard => neard.in} (59%)
>  create mode 100644 meta/recipes-core/systemd/systemd/udev-linkage.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/binutils-fix-ineffectual-zero-of-cache.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/binutils-replace-strncat-with-strcat.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/binutils-fix-over-array-bounds-issue.patch
>  create mode 100644 meta/recipes-devtools/elfutils/elfutils/nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch
>  create mode 100644 meta/recipes-devtools/qemu/files/fix-libcap-header-issue-on-some-distro.patch
>  rename meta/recipes-extended/watchdog/{watchdog_5.12.bb => watchdog_5.13.bb} (78%)
>  create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-fbdev/Remove-mibstore.h.patch
>  rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.21.0.bb => xf86-video-intel_2.21.3.bb} (79%)
>  create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-vesa/Remove-mibstore.h.patch
>  create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-vmware/Kill-mibstore.patch
>  rename meta/recipes-graphics/xorg-lib/{libxi_1.6.1.bb => libxi_1.7.bb} (79%)
>  rename meta/recipes-graphics/xorg-proto/{inputproto_2.2.bb => inputproto_2.3.bb} (78%)
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.1/aarch64.patch
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/aarch64.patch
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.13.1 => xserver-xorg-1.14.0}/crosscompile.patch (100%)
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.14.0/fix_compilation_when_not_using_xinerama.patch
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.13.1 => xserver-xorg-1.14.0}/fix_open_max_preprocessor_error.patch (100%)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.13.1 => xserver-xorg-1.14.0}/macro_tweak.patch (100%)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.13.1 => xserver-xorg-1.14.0}/mips64-compiler.patch (100%)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.13.1.bb => xserver-xorg_1.14.0.bb} (84%)
>  create mode 100644 meta/recipes-support/libical/files/pthread-fix.patch
>  create mode 100644 meta/recipes-support/libical/libical_0.48.bb
> 




