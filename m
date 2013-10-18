Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 926146CC79
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 02:32:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9I2WpDn025864
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 19:32:51 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 17 Oct 2013 19:32:51 -0700
Message-ID: <52609DD1.60805@windriver.com>
Date: Fri, 18 Oct 2013 10:32:49 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1381944889.git.sgw@linux.intel.com>
In-Reply-To: <cover.1381944889.git.sgw@linux.intel.com>
Subject: Re: [CONSOLIDATED PULL 00/30] Package Updated & Fixes
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
X-List-Received-Date: Fri, 18 Oct 2013 02:32:51 -0000
Content-Type: multipart/alternative;
	boundary="------------020809010504090702050506"

--------------020809010504090702050506
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/2013 01:54 AM, Saul Wold wrote:
> Richard,
>
> This is set of updates and fixes that I have reviewed and run through
> the autobuilder.
>
> I have included the kernel-grub.bbclass as it's a standalone class, right
> now it's RPM only it seems.
>
> Sau!
>
>
>
> The following changes since commit 2b179d90eacc58f0b217f64407782a9174362850:
>
>    update-rcd.bbclass: fix host/target test (2013-10-16 14:50:58 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib sgw/stage
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
>
> Chase Maupin (1):
>    udev: update local rules for new touchscreen device
>
> Hongxu Jia (1):
>    kernel-grub.bbclass: a method to install/update for bzImage

Hi Saul,

Please hold on this, I will send V2.

Change in V2:
  - Don't check for '$D' to be empty to support cross-install/cross-upgrade
    situation;
  - Use $grubcfg instead of hardcoded '/boot/grub/*';

//Hongxu

>
> Jack Mitchell (2):
>    grub: add patch to support 256 byte inodes
>    crond: remove UID check in init script
>
> Jeffrey C Honig (1):
>    initscripts: insure checkroot.sh runs before anything writing to the
>      file
>
> Laurentiu Palcu (10):
>    byacc: upgrade to 20130925
>    xkeyboard-config: upgrade to 2.10.1
>    xauth: upgrade to 1.0.8
>    xf86-input-evdev: upgrade to 2.8.2
>    libdrm: upgrade to 2.4.47
>    xset: upgrade to 1.2.3
>    xf86-video-intel: upgrade to 2.21.15
>    xinput: upgrade to 1.6.1
>    xprop: upgrade to 1.2.2
>    xf86-video-fbdev: upgrade to 0.4.4
>
> Ross Burton (4):
>    cairo: add explicit dependency on zlib
>    wayland: upgrade to 1.3.0
>    weston: upgrade to 1.3.0
>    weston-init: start weston on a new VT
>
> Saul Wold (9):
>    sysstat: upgrade to 10.1.7
>    xz: Add nativesdk for Python3 nativesdk dependency
>    kmod: Add patch to fix seperate build dir of ptest
>    kmod: Update to Rev 15 via git
>    check: add check recipe for kbd to use for creating unit tests
>    kbd: Update to 2.0.0
>    base-passwd: upgrade to 3.5.28
>    ca-certificates: Clarify in Description that certs are Debian based
>    packagegroup-core-basic: libuser has a hard depenency on libpam
>
> Ting Liu (2):
>    perf: flag __SANE_USERSPACE_TYPES__ to include int-ll64.h for
>      powerpc64
>    socat: add dependency on tcp-wrappers
>
>   meta/classes/kernel-grub.bbclass                   |  79 ++++++++++++++++
>   .../grub-0.97/grub-support-256byte-inode.patch     | 101 +++++++++++++++++++++
>   meta/recipes-bsp/grub/grub_0.97.bb                 |  11 ++-
>   meta/recipes-connectivity/socat/socat_1.7.2.2.bb   |   2 +-
>   .../add_shutdown.patch                             |   0
>   .../base-passwd-3.5.28/disable-docs.patch          |  24 +++++
>   .../input.patch                                    |   0
>   .../nobash.patch                                   |   0
>   ...base-passwd_3.5.26.bb => base-passwd_3.5.28.bb} |  11 ++-
>   meta/recipes-core/initscripts/initscripts_1.0.bb   |   2 +-
>   .../kbd-1.15.2/Allow-resizecons-on-x86_64.patch    |  28 ------
>   .../kbd/{kbd_1.15.2.bb => kbd_2.0.0.bb}            |  19 ++--
>   meta/recipes-core/udev/udev/local.rules            |   4 +-
>   .../byacc/{byacc_20130304.bb => byacc_20130925.bb} |   4 +-
>   meta/recipes-extended/cronie/cronie/crond.init     |   8 --
>   .../packagegroups/packagegroup-core-basic.bb       |   2 +-
>   ...-Makefile-to-allow-for-parallel-execution.patch |  34 -------
>   meta/recipes-extended/sysstat/sysstat.inc          |   4 +-
>   .../{sysstat_10.1.6.bb => sysstat_10.1.7.bb}       |   4 +-
>   meta/recipes-extended/xz/xz_5.1.2alpha.bb          |   2 +-
>   meta/recipes-graphics/cairo/cairo.inc              |   2 +-
>   .../drm/{libdrm_2.4.46.bb => libdrm_2.4.47.bb}     |   4 +-
>   .../wayland/{wayland_1.1.0.bb => wayland_1.3.0.bb} |  19 ++--
>   meta/recipes-graphics/wayland/weston-init.bb       |   2 +
>   meta/recipes-graphics/wayland/weston-init/init     |   2 +-
>   meta/recipes-graphics/wayland/weston/groups.patch  |  47 ----------
>   .../wayland/weston/install-examples.patch          |  18 ----
>   .../wayland/weston/weston-launch-shell.patch       |  74 ---------------
>   .../wayland/{weston_1.1.0.bb => weston_1.3.0.bb}   |  17 ++--
>   .../xorg-app/{xauth_1.0.7.bb => xauth_1.0.8.bb}    |   5 +-
>   .../xorg-app/{xinput_1.6.0.bb => xinput_1.6.1.bb}  |   5 +-
>   .../xorg-app/{xprop_1.2.1.bb => xprop_1.2.2.bb}    |   5 +-
>   .../xorg-app/{xset_1.2.2.bb => xset_1.2.3.bb}      |   5 +-
>   ...ut-evdev_2.8.1.bb => xf86-input-evdev_2.8.2.bb} |   4 +-
>   .../xf86-video-fbdev/Remove-mibstore.h.patch       |  35 -------
>   ...eo-fbdev_0.4.3.bb => xf86-video-fbdev_0.4.4.bb} |   6 +-
>   ...ntel_2.21.13.bb => xf86-video-intel_2.21.15.bb} |   4 +-
>   ...rd-config_2.9.bb => xkeyboard-config_2.10.1.bb} |   4 +-
>   meta/recipes-kernel/kmod/kmod-native_git.bb        |   3 +-
>   meta/recipes-kernel/kmod/kmod.inc                  |  13 +--
>   .../kmod/kmod/fix-seperatebuilddir.patch           |  34 +++++++
>   meta/recipes-kernel/kmod/kmod_git.bb               |   6 +-
>   meta/recipes-kernel/perf/perf.bb                   |   6 ++
>   .../ca-certificates/ca-certificates_20130610.bb    |   3 +-
>   meta/recipes-support/check/check_0.9.10.bb         |  20 ++++
>   meta/recipes-support/check/files/ptest.patch       |  29 ++++++
>   meta/recipes-support/check/files/run-ptest         |   3 +
>   47 files changed, 382 insertions(+), 332 deletions(-)
>   create mode 100644 meta/classes/kernel-grub.bbclass
>   create mode 100644 meta/recipes-bsp/grub/grub-0.97/grub-support-256byte-inode.patch
>   rename meta/recipes-core/base-passwd/{base-passwd-3.5.26 => base-passwd-3.5.28}/add_shutdown.patch (100%)
>   create mode 100644 meta/recipes-core/base-passwd/base-passwd-3.5.28/disable-docs.patch
>   rename meta/recipes-core/base-passwd/{base-passwd-3.5.26 => base-passwd-3.5.28}/input.patch (100%)
>   rename meta/recipes-core/base-passwd/{base-passwd-3.5.26 => base-passwd-3.5.28}/nobash.patch (100%)
>   rename meta/recipes-core/base-passwd/{base-passwd_3.5.26.bb => base-passwd_3.5.28.bb} (92%)
>   delete mode 100644 meta/recipes-core/kbd/kbd-1.15.2/Allow-resizecons-on-x86_64.patch
>   rename meta/recipes-core/kbd/{kbd_1.15.2.bb => kbd_2.0.0.bb} (58%)
>   rename meta/recipes-extended/byacc/{byacc_20130304.bb => byacc_20130925.bb} (74%)
>   delete mode 100644 meta/recipes-extended/sysstat/files/0001-Update-Makefile-to-allow-for-parallel-execution.patch
>   rename meta/recipes-extended/sysstat/{sysstat_10.1.6.bb => sysstat_10.1.7.bb} (40%)
>   rename meta/recipes-graphics/drm/{libdrm_2.4.46.bb => libdrm_2.4.47.bb} (46%)
>   rename meta/recipes-graphics/wayland/{wayland_1.1.0.bb => wayland_1.3.0.bb} (63%)
>   delete mode 100644 meta/recipes-graphics/wayland/weston/groups.patch
>   delete mode 100644 meta/recipes-graphics/wayland/weston/install-examples.patch
>   delete mode 100644 meta/recipes-graphics/wayland/weston/weston-launch-shell.patch
>   rename meta/recipes-graphics/wayland/{weston_1.1.0.bb => weston_1.3.0.bb} (83%)
>   rename meta/recipes-graphics/xorg-app/{xauth_1.0.7.bb => xauth_1.0.8.bb} (65%)
>   rename meta/recipes-graphics/xorg-app/{xinput_1.6.0.bb => xinput_1.6.1.bb} (64%)
>   rename meta/recipes-graphics/xorg-app/{xprop_1.2.1.bb => xprop_1.2.2.bb} (77%)
>   rename meta/recipes-graphics/xorg-app/{xset_1.2.2.bb => xset_1.2.3.bb} (74%)
>   rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.8.1.bb => xf86-input-evdev_2.8.2.bb} (83%)
>   delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-fbdev/Remove-mibstore.h.patch
>   rename meta/recipes-graphics/xorg-driver/{xf86-video-fbdev_0.4.3.bb => xf86-video-fbdev_0.4.4.bb} (44%)
>   rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.21.13.bb => xf86-video-intel_2.21.15.bb} (88%)
>   rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.9.bb => xkeyboard-config_2.10.1.bb} (87%)
>   create mode 100644 meta/recipes-kernel/kmod/kmod/fix-seperatebuilddir.patch
>   create mode 100644 meta/recipes-support/check/check_0.9.10.bb
>   create mode 100644 meta/recipes-support/check/files/ptest.patch
>   create mode 100644 meta/recipes-support/check/files/run-ptest
>


--------------020809010504090702050506
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 10/17/2013 01:54 AM, Saul Wold
      wrote:<br>
    </div>
    <blockquote cite="mid:cover.1381944889.git.sgw@linux.intel.com"
      type="cite">
      <pre wrap="">Richard,

This is set of updates and fixes that I have reviewed and run through
the autobuilder.

I have included the kernel-grub.bbclass as it's a standalone class, right 
now it's RPM only it seems.

Sau!



The following changes since commit 2b179d90eacc58f0b217f64407782a9174362850:

  update-rcd.bbclass: fix host/target test (2013-10-16 14:50:58 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  <a class="moz-txt-link-freetext" href="http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage">http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage</a>

Chase Maupin (1):
  udev: update local rules for new touchscreen device

Hongxu Jia (1):
  kernel-grub.bbclass: a method to install/update for bzImage</pre>
    </blockquote>
    <br>
    Hi Saul,<br>
    <br>
    Please hold on this, I will send V2.<br>
    <br>
    <pre wrap="">Change in V2:
 - Don't check for '$D' to be empty to support cross-install/cross-upgrade
   situation;
 - Use $grubcfg instead of hardcoded '<i class="moz-txt-slash"><span class="moz-txt-tag">/</span>boot/grub<span class="moz-txt-tag">/</span></i>*';</pre>
    //Hongxu<br>
    <br>
    <blockquote cite="mid:cover.1381944889.git.sgw@linux.intel.com"
      type="cite">
      <pre wrap="">

Jack Mitchell (2):
  grub: add patch to support 256 byte inodes
  crond: remove UID check in init script

Jeffrey C Honig (1):
  initscripts: insure checkroot.sh runs before anything writing to the
    file

Laurentiu Palcu (10):
  byacc: upgrade to 20130925
  xkeyboard-config: upgrade to 2.10.1
  xauth: upgrade to 1.0.8
  xf86-input-evdev: upgrade to 2.8.2
  libdrm: upgrade to 2.4.47
  xset: upgrade to 1.2.3
  xf86-video-intel: upgrade to 2.21.15
  xinput: upgrade to 1.6.1
  xprop: upgrade to 1.2.2
  xf86-video-fbdev: upgrade to 0.4.4

Ross Burton (4):
  cairo: add explicit dependency on zlib
  wayland: upgrade to 1.3.0
  weston: upgrade to 1.3.0
  weston-init: start weston on a new VT

Saul Wold (9):
  sysstat: upgrade to 10.1.7
  xz: Add nativesdk for Python3 nativesdk dependency
  kmod: Add patch to fix seperate build dir of ptest
  kmod: Update to Rev 15 via git
  check: add check recipe for kbd to use for creating unit tests
  kbd: Update to 2.0.0
  base-passwd: upgrade to 3.5.28
  ca-certificates: Clarify in Description that certs are Debian based
  packagegroup-core-basic: libuser has a hard depenency on libpam

Ting Liu (2):
  perf: flag __SANE_USERSPACE_TYPES__ to include int-ll64.h for
    powerpc64
  socat: add dependency on tcp-wrappers

 meta/classes/kernel-grub.bbclass                   |  79 ++++++++++++++++
 .../grub-0.97/grub-support-256byte-inode.patch     | 101 +++++++++++++++++++++
 meta/recipes-bsp/grub/grub_0.97.bb                 |  11 ++-
 meta/recipes-connectivity/socat/socat_1.7.2.2.bb   |   2 +-
 .../add_shutdown.patch                             |   0
 .../base-passwd-3.5.28/disable-docs.patch          |  24 +++++
 .../input.patch                                    |   0
 .../nobash.patch                                   |   0
 ...base-passwd_3.5.26.bb =&gt; base-passwd_3.5.28.bb} |  11 ++-
 meta/recipes-core/initscripts/initscripts_1.0.bb   |   2 +-
 .../kbd-1.15.2/Allow-resizecons-on-x86_64.patch    |  28 ------
 .../kbd/{kbd_1.15.2.bb =&gt; kbd_2.0.0.bb}            |  19 ++--
 meta/recipes-core/udev/udev/local.rules            |   4 +-
 .../byacc/{byacc_20130304.bb =&gt; byacc_20130925.bb} |   4 +-
 meta/recipes-extended/cronie/cronie/crond.init     |   8 --
 .../packagegroups/packagegroup-core-basic.bb       |   2 +-
 ...-Makefile-to-allow-for-parallel-execution.patch |  34 -------
 meta/recipes-extended/sysstat/sysstat.inc          |   4 +-
 .../{sysstat_10.1.6.bb =&gt; sysstat_10.1.7.bb}       |   4 +-
 meta/recipes-extended/xz/xz_5.1.2alpha.bb          |   2 +-
 meta/recipes-graphics/cairo/cairo.inc              |   2 +-
 .../drm/{libdrm_2.4.46.bb =&gt; libdrm_2.4.47.bb}     |   4 +-
 .../wayland/{wayland_1.1.0.bb =&gt; wayland_1.3.0.bb} |  19 ++--
 meta/recipes-graphics/wayland/weston-init.bb       |   2 +
 meta/recipes-graphics/wayland/weston-init/init     |   2 +-
 meta/recipes-graphics/wayland/weston/groups.patch  |  47 ----------
 .../wayland/weston/install-examples.patch          |  18 ----
 .../wayland/weston/weston-launch-shell.patch       |  74 ---------------
 .../wayland/{weston_1.1.0.bb =&gt; weston_1.3.0.bb}   |  17 ++--
 .../xorg-app/{xauth_1.0.7.bb =&gt; xauth_1.0.8.bb}    |   5 +-
 .../xorg-app/{xinput_1.6.0.bb =&gt; xinput_1.6.1.bb}  |   5 +-
 .../xorg-app/{xprop_1.2.1.bb =&gt; xprop_1.2.2.bb}    |   5 +-
 .../xorg-app/{xset_1.2.2.bb =&gt; xset_1.2.3.bb}      |   5 +-
 ...ut-evdev_2.8.1.bb =&gt; xf86-input-evdev_2.8.2.bb} |   4 +-
 .../xf86-video-fbdev/Remove-mibstore.h.patch       |  35 -------
 ...eo-fbdev_0.4.3.bb =&gt; xf86-video-fbdev_0.4.4.bb} |   6 +-
 ...ntel_2.21.13.bb =&gt; xf86-video-intel_2.21.15.bb} |   4 +-
 ...rd-config_2.9.bb =&gt; xkeyboard-config_2.10.1.bb} |   4 +-
 meta/recipes-kernel/kmod/kmod-native_git.bb        |   3 +-
 meta/recipes-kernel/kmod/kmod.inc                  |  13 +--
 .../kmod/kmod/fix-seperatebuilddir.patch           |  34 +++++++
 meta/recipes-kernel/kmod/kmod_git.bb               |   6 +-
 meta/recipes-kernel/perf/perf.bb                   |   6 ++
 .../ca-certificates/ca-certificates_20130610.bb    |   3 +-
 meta/recipes-support/check/check_0.9.10.bb         |  20 ++++
 meta/recipes-support/check/files/ptest.patch       |  29 ++++++
 meta/recipes-support/check/files/run-ptest         |   3 +
 47 files changed, 382 insertions(+), 332 deletions(-)
 create mode 100644 meta/classes/kernel-grub.bbclass
 create mode 100644 meta/recipes-bsp/grub/grub-0.97/grub-support-256byte-inode.patch
 rename meta/recipes-core/base-passwd/{base-passwd-3.5.26 =&gt; base-passwd-3.5.28}/add_shutdown.patch (100%)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd-3.5.28/disable-docs.patch
 rename meta/recipes-core/base-passwd/{base-passwd-3.5.26 =&gt; base-passwd-3.5.28}/input.patch (100%)
 rename meta/recipes-core/base-passwd/{base-passwd-3.5.26 =&gt; base-passwd-3.5.28}/nobash.patch (100%)
 rename meta/recipes-core/base-passwd/{base-passwd_3.5.26.bb =&gt; base-passwd_3.5.28.bb} (92%)
 delete mode 100644 meta/recipes-core/kbd/kbd-1.15.2/Allow-resizecons-on-x86_64.patch
 rename meta/recipes-core/kbd/{kbd_1.15.2.bb =&gt; kbd_2.0.0.bb} (58%)
 rename meta/recipes-extended/byacc/{byacc_20130304.bb =&gt; byacc_20130925.bb} (74%)
 delete mode 100644 meta/recipes-extended/sysstat/files/0001-Update-Makefile-to-allow-for-parallel-execution.patch
 rename meta/recipes-extended/sysstat/{sysstat_10.1.6.bb =&gt; sysstat_10.1.7.bb} (40%)
 rename meta/recipes-graphics/drm/{libdrm_2.4.46.bb =&gt; libdrm_2.4.47.bb} (46%)
 rename meta/recipes-graphics/wayland/{wayland_1.1.0.bb =&gt; wayland_1.3.0.bb} (63%)
 delete mode 100644 meta/recipes-graphics/wayland/weston/groups.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston/install-examples.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston/weston-launch-shell.patch
 rename meta/recipes-graphics/wayland/{weston_1.1.0.bb =&gt; weston_1.3.0.bb} (83%)
 rename meta/recipes-graphics/xorg-app/{xauth_1.0.7.bb =&gt; xauth_1.0.8.bb} (65%)
 rename meta/recipes-graphics/xorg-app/{xinput_1.6.0.bb =&gt; xinput_1.6.1.bb} (64%)
 rename meta/recipes-graphics/xorg-app/{xprop_1.2.1.bb =&gt; xprop_1.2.2.bb} (77%)
 rename meta/recipes-graphics/xorg-app/{xset_1.2.2.bb =&gt; xset_1.2.3.bb} (74%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.8.1.bb =&gt; xf86-input-evdev_2.8.2.bb} (83%)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-fbdev/Remove-mibstore.h.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-video-fbdev_0.4.3.bb =&gt; xf86-video-fbdev_0.4.4.bb} (44%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.21.13.bb =&gt; xf86-video-intel_2.21.15.bb} (88%)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.9.bb =&gt; xkeyboard-config_2.10.1.bb} (87%)
 create mode 100644 meta/recipes-kernel/kmod/kmod/fix-seperatebuilddir.patch
 create mode 100644 meta/recipes-support/check/check_0.9.10.bb
 create mode 100644 meta/recipes-support/check/files/ptest.patch
 create mode 100644 meta/recipes-support/check/files/run-ptest

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------020809010504090702050506--
