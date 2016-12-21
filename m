Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 502CD771DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 16:19:10 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id g23so26934059wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 08:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JmHcMWlKnNZZgCCX3TR19KmwndJ2oAvgb2wAPTOkgZA=;
	b=1grfVz0XfUoXXiEGSKsm+E/onzb/8EuVODTyvB7ZxnkrBR1+t02aCUAlKQZDWq0/qQ
	s7fOKcG5o9iBNJzvJnf3s0OVAcefLGrVtkUaDzoP1ejfh7wESWTYQ+GavtaDhlovdt7A
	CFBAWZksxyPRWiP8GWJlQjxjD8p/D6n2De6Xcrpfo8hkGfft1wocqYVaYOohbZ+EUjsv
	hpBD9Vm1WSJgcM72NiutIScypqmZSxCpWT+iJ9eWopnI0NBpjzd/zY0GOEbc4d5iFNIG
	EGOXsJKm063089ZIOBdJmHKU9ymfZDgpiXlbuVXrWX12gTsQ3xfJ8BP2rlB3ej8MxxM0
	6RdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JmHcMWlKnNZZgCCX3TR19KmwndJ2oAvgb2wAPTOkgZA=;
	b=TA3orwiiVVneG+IzJzbckOJZGgdTl5+VdOFNGd03Wtt420H4+Vt++NQq3V2kwrFfJ7
	I6BiDmzTyPkts4tYNDCj5dnr3JgPbs7h0w4urSivCSw8Ou8pIdWUeOXSREJLcDPWnslF
	zF4nng8KMuExLZgFUw6XWu+1R6UwOO+ncHkHtR7lwQvpyrnebZf86dK3esbMkhh9ZmHz
	WcV72TV8oqQNDFYhtt/Q5v4Sjz/u/b5dtUV79UisTPu3IXUYE5ip1SjIBC3guiHShrHr
	z0eQVcNmODGdnGak5iErfubDQvqFS45MlUuWC4KAClymJBxvh79XhTQRDJFHD0fi0Jey
	3wqA==
X-Gm-Message-State: AIkVDXIKbEPJ77TQbTrVntDUqYxpovV4A8OZy4oFehp1RZEbLRbUFZioE6Y4ftcvYo3E1qxW
X-Received: by 10.28.64.67 with SMTP id n64mr4927247wma.34.1482337151474;
	Wed, 21 Dec 2016 08:19:11 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	k11sm27725930wmf.24.2016.12.21.08.19.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Dec 2016 08:19:10 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2016 16:19:08 +0000
Message-Id: <cover.1482337069.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 00/26] Consolidated pull
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
X-List-Received-Date: Wed, 21 Dec 2016 16:19:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A selection of patches from the list, some wic/selftest improvements, and most
importantly the ncurses fix for util-linux-native!

Ross

The following changes since commit 8ccf396c7284acd7e0fdf95473d317d23d05475f:

  Revert "selftest/wic: extending test coverage for WIC script options" (2016-12-20 17:06:38 +0000)

are available in the git repository at:

  ssh://git@git.yoctoproject.org/poky-contrib ross/mut

for you to fetch changes up to 2df1397b1894cd7cd67a33dde96e60fcc72c78f5:

  ncurses.inc: add v6 binconfig-disabled entries (2016-12-20 18:16:19 +0000)

----------------------------------------------------------------
Alejandro Hernandez (1):
      example-recipe: Fix LDFLAGS compilation issue on newly created recipes

Andre McCurdy (1):
      glew: build for EGL in non-X11 distros

André Draszik (1):
      initscripts: populate-volatile: suppress read-only-rootfs warnings

David Vincent (1):
      kernel: Fix symlinks

Dengke Du (2):
      Revert "subversion: fix "svnadmin create" fail on x86"
      apr: fix off_t size can't match when configure and in target glibc

Ed Bartosh (2):
      wic: look for wks files in <layer>/wic
      wic: add kickstart file for MPC8315

Edwin Plauchu (1):
      ruby: upgrade to 2.3.3

Jair Gonzalez (4):
      selftest/wic: adding Testopia ID numbers to test cases missing it
      selftest/wic: code cleanup
      selftest/wic: reorganizing test methods by functionality
      selftest/wic: extending test coverage for WIC script options

Khem Raj (4):
      systemd: point to correct resolv.conf when resolved is enabled
      x264: Fix build on mips architectures
      gnutls: Do not use libunistring prefix
      gstreamer1.0-libav: Fix build on mips64

Maciej Borzecki (2):
      oeqa/utils/commands.py: allow use of binaries from native sysroot
      wic: add --fixed-size wks option

Mans Rullgard (1):
      initscripts: populate-volatile: don't run commands in background

Paul Eggleton (2):
      devtool: modify: fix usage on the kernel
      packagegroup-core-standalone-sdk-target: add libssp

Trevor Woerner (1):
      ncurses.inc: add v6 binconfig-disabled entries

Zheng Ruoqin (1):
      shared-mime-info 1.6 -> 1.8

Zubair Lutfullah Kakakhel (2):
      openssl: Add support for many MIPS configurations
      arch-mips: Add MIPS 64r6 N32 tune

 meta/classes/binconfig-disabled.bbclass            |   1 +
 meta/classes/insane.bbclass                        |   2 +
 meta/classes/kernel.bbclass                        |   6 +-
 meta/classes/siteinfo.bbclass                      |   2 +
 meta/conf/machine/include/tune-mips64r6.inc        |  26 ++
 meta/lib/oeqa/selftest/wic.py                      | 370 +++++++++++++--------
 meta/lib/oeqa/utils/commands.py                    |   9 +-
 meta/recipes-connectivity/openssl/openssl.inc      |  24 +-
 .../initscripts-1.0/populate-volatile.sh           |   8 +-
 meta/recipes-core/ncurses/ncurses.inc              |   5 +-
 .../packagegroup-core-standalone-sdk-target.bb     |   5 +
 meta/recipes-core/systemd/systemd_232.bb           |  11 +-
 .../ruby/{ruby_2.3.1.bb => ruby_2.3.3.bb}          |   4 +-
 .../0001-fix-svnadmin-create-fail-on-x86.patch     |  56 ----
 .../subversion/subversion_1.9.5.bb                 |   1 -
 meta/recipes-graphics/glew/glew_2.0.0.bb           |  19 +-
 meta/recipes-kernel/linux/linux-dtb.inc            |   4 +-
 .../gstreamer1.0-libav/mips64_cpu_detection.patch  |  32 ++
 .../gstreamer/gstreamer1.0-libav_1.10.1.bb         |   1 +
 meta/recipes-multimedia/x264/x264_git.bb           |   1 +
 ..._t-size-doesn-t-match-in-glibc-when-cross.patch |  76 +++++
 meta/recipes-support/apr/apr_1.5.2.bb              |   1 +
 meta/recipes-support/gnutls/gnutls.inc             |   1 +
 .../shared-mime-info/shared-mime-info_1.6.bb       |   7 -
 .../shared-mime-info/shared-mime-info_1.8.bb       |   7 +
 .../recipes-example/example/example-recipe-0.1.bb  |   2 +-
 scripts/lib/devtool/standard.py                    |   2 +
 scripts/lib/wic/canned-wks/mpc8315e-rdb.wks        |   6 +
 scripts/lib/wic/engine.py                          |   7 +-
 scripts/lib/wic/help.py                            |  14 +-
 scripts/lib/wic/imager/direct.py                   |   2 +-
 scripts/lib/wic/ksparser.py                        |  41 ++-
 scripts/lib/wic/partition.py                       |  88 +++--
 scripts/lib/wic/utils/partitionedfs.py             |   2 +-
 34 files changed, 567 insertions(+), 276 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_2.3.1.bb => ruby_2.3.3.bb} (89%)
 delete mode 100644 meta/recipes-devtools/subversion/subversion/0001-fix-svnadmin-create-fail-on-x86.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/mips64_cpu_detection.patch
 create mode 100644 meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
 delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info_1.6.bb
 create mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info_1.8.bb
 create mode 100644 scripts/lib/wic/canned-wks/mpc8315e-rdb.wks

Alejandro Hernandez (1):
  example-recipe: Fix LDFLAGS compilation issue on newly created recipes

Andre McCurdy (1):
  glew: build for EGL in non-X11 distros

André Draszik (1):
  initscripts: populate-volatile: suppress read-only-rootfs warnings

David Vincent (1):
  kernel: Fix symlinks

Dengke Du (2):
  Revert "subversion: fix "svnadmin create" fail on x86"
  apr: fix off_t size can't match when configure and in target glibc

Ed Bartosh (2):
  wic: look for wks files in <layer>/wic
  wic: add kickstart file for MPC8315

Edwin Plauchu (1):
  ruby: upgrade to 2.3.3

Jair Gonzalez (4):
  selftest/wic: adding Testopia ID numbers to test cases missing it
  selftest/wic: code cleanup
  selftest/wic: reorganizing test methods by functionality
  selftest/wic: extending test coverage for WIC script options

Khem Raj (4):
  systemd: point to correct resolv.conf when resolved is enabled
  x264: Fix build on mips architectures
  gnutls: Do not use libunistring prefix
  gstreamer1.0-libav: Fix build on mips64

Maciej Borzecki (2):
  oeqa/utils/commands.py: allow use of binaries from native sysroot
  wic: add --fixed-size wks option

Mans Rullgard (1):
  initscripts: populate-volatile: don't run commands in background

Paul Eggleton (2):
  devtool: modify: fix usage on the kernel
  packagegroup-core-standalone-sdk-target: add libssp

Trevor Woerner (1):
  ncurses.inc: add v6 binconfig-disabled entries

Zheng Ruoqin (1):
  shared-mime-info 1.6 -> 1.8

Zubair Lutfullah Kakakhel (2):
  openssl: Add support for many MIPS configurations
  arch-mips: Add MIPS 64r6 N32 tune

 meta/classes/binconfig-disabled.bbclass            |   1 +
 meta/classes/insane.bbclass                        |   2 +
 meta/classes/kernel.bbclass                        |   6 +-
 meta/classes/siteinfo.bbclass                      |   2 +
 meta/conf/machine/include/tune-mips64r6.inc        |  26 ++
 meta/lib/oeqa/selftest/wic.py                      | 370 +++++++++++++--------
 meta/lib/oeqa/utils/commands.py                    |   9 +-
 meta/recipes-connectivity/openssl/openssl.inc      |  24 +-
 .../initscripts-1.0/populate-volatile.sh           |   8 +-
 meta/recipes-core/ncurses/ncurses.inc              |   5 +-
 .../packagegroup-core-standalone-sdk-target.bb     |   5 +
 meta/recipes-core/systemd/systemd_232.bb           |  11 +-
 .../ruby/{ruby_2.3.1.bb => ruby_2.3.3.bb}          |   4 +-
 .../0001-fix-svnadmin-create-fail-on-x86.patch     |  56 ----
 .../subversion/subversion_1.9.5.bb                 |   1 -
 meta/recipes-graphics/glew/glew_2.0.0.bb           |  19 +-
 meta/recipes-kernel/linux/linux-dtb.inc            |   4 +-
 .../gstreamer1.0-libav/mips64_cpu_detection.patch  |  32 ++
 .../gstreamer/gstreamer1.0-libav_1.10.1.bb         |   1 +
 meta/recipes-multimedia/x264/x264_git.bb           |   1 +
 ..._t-size-doesn-t-match-in-glibc-when-cross.patch |  76 +++++
 meta/recipes-support/apr/apr_1.5.2.bb              |   1 +
 meta/recipes-support/gnutls/gnutls.inc             |   1 +
 ...ed-mime-info_1.6.bb => shared-mime-info_1.8.bb} |   4 +-
 .../recipes-example/example/example-recipe-0.1.bb  |   2 +-
 scripts/lib/devtool/standard.py                    |   2 +
 scripts/lib/wic/canned-wks/mpc8315e-rdb.wks        |   6 +
 scripts/lib/wic/engine.py                          |   7 +-
 scripts/lib/wic/help.py                            |  14 +-
 scripts/lib/wic/imager/direct.py                   |   2 +-
 scripts/lib/wic/ksparser.py                        |  41 ++-
 scripts/lib/wic/partition.py                       |  88 +++--
 scripts/lib/wic/utils/partitionedfs.py             |   2 +-
 33 files changed, 562 insertions(+), 271 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_2.3.1.bb => ruby_2.3.3.bb} (89%)
 delete mode 100644 meta/recipes-devtools/subversion/subversion/0001-fix-svnadmin-create-fail-on-x86.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/mips64_cpu_detection.patch
 create mode 100644 meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
 rename meta/recipes-support/shared-mime-info/{shared-mime-info_1.6.bb => shared-mime-info_1.8.bb} (43%)
 create mode 100644 scripts/lib/wic/canned-wks/mpc8315e-rdb.wks

-- 
2.8.1


