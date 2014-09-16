Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 651D17122B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 18:42:18 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id em10so655388wid.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 11:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ciICVfmjmU19NKgs3G5qM9iAk6j/DzpT8ahrtY0Sbq4=;
	b=M5jYYKVaLCCiPFthCqbLEBlLfAX96B/Ii81fpGgPmtv+NUigkRuTRVuF6qiLMGv6i4
	13z8/NjqOzi+UskcoRbEoDJpV/yeIMfXxS+wGwo20XGW4iNmgLnSuNxGwnkQQNGdRMtG
	O2UzpWS0GyjODIv2TZQWp3MxDdDMFrg1BmHOlr6AJqiEQqbH9V280/GIAs9ibE3zkWLq
	pj639NGwbRSFCNWMJLQ/nYtSpMGjq1cQA0y1WNWOqG2J9hJyO8wKS/9BJE53sDvYiATz
	uATrlNlVMZD1eMQhmghkAk9L1h+u5AGHCpPYlSqn1/bZzbep9Dw2B2B1zGIsgajYqvWr
	9+UQ==
X-Gm-Message-State: ALoCoQmOrZkQ8vJOdeo9Wg9hWa70azdxVnQSVJWuUdCGmeXKT2DtgzelbyCfqyGa2TRFk4sGhFFC
X-Received: by 10.194.78.170 with SMTP id c10mr45340096wjx.22.1410892939263;
	Tue, 16 Sep 2014 11:42:19 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id t1sm2791787wiy.8.2014.09.16.11.42.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Sep 2014 11:42:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Sep 2014 19:41:52 +0100
Message-Id: <cover.1410892758.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 00/20] Consolidated pull
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
X-List-Received-Date: Tue, 16 Sep 2014 18:42:25 -0000

Hi,

This is a subset of the branch that was on the AB last night.  That failed in a
few places:

* gcc configure failed during a race.  This race is fixed in the c-pull.
* qemu build. Looks like a race, and doesn't replicate.  Noted but tricky to
  replicate.
* smart QA fail.  /usr/bin/python isn't executable... but is in the image.
  #6484 is similar so I've re-opened, but again hard to replicate.

(this pull is against master-next)

Ross

The following changes since commit fceef0cace6670a8c5f15cd2f31a191176732730:

  bitbake: data_smart: Fix remove operator and its interaction with data expansion (2014-09-13 08:52:49 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/mut

for you to fetch changes up to 54101aca28cc839e9dec4d203c39490d20dcb7fd:

  gcc-configure/gcc-common: Move preconfigure definition to common include (2014-09-16 19:39:06 +0100)

----------------------------------------------------------------
Chen Qi (3):
      portmap: fix INITSCRIPT_PARAMS
      portmap: add systemd service file
      systemd: fix to use ${libdir} for libraries

Chong Lu (1):
      i2c-tools: create i2c-tools-misc package for perl scripts

Cristian Iorga (1):
      build-appliance-image: remove hardwired path

Hongxu Jia (1):
      lttng-tools: add PACKAGECONFIG to support --enable-python-bindings and lttng-ust

Jackie Huang (1):
      libgcrypt: Fix ARM assembly when building __PIC__

Joe Slater (1):
      at-spi2-core: fix DBIND_CHECK_ALIGNOF m4 macro

Marie Kowalczyk (1):
      gstreamer1.0-plugins-bad.inc: Add rtmp support in gstreamer.

Peter Kjellerstedt (1):
      shadow: Make useradd work correctly with --root again

Richard Purdie (5):
      sstatesig/sstate: Add support for locked down sstate cache usage
      sstatesig: Improve to handle locking of multiple machines
      sstate: Fix incorrect return value handling
      license: Improve disk usage
      gcc-configure/gcc-common: Move preconfigure definition to common include

Robert Yang (2):
      sstate.bbclass: fix sstate_hardcode_path()
      grub-efi: Replace _BSD_SOURCE macro with _DEFAULT_SOURCE

Ross Burton (1):
      rsync: remove trailing whitespace

Roy Li (1):
      rsync: Add PACKAGECONFIG for acl/attr

Wenzong Fan (1):
      dropbear: add pam modules dependencies

 meta/classes/license.bbclass                       |    9 +-
 meta/classes/sstate.bbclass                        |    8 +-
 meta/lib/oe/sstatesig.py                           |   89 +++++++++++
 .../grub/files/grub-efi-fix-with-glibc-2.20.patch  |   32 ++++
 meta/recipes-bsp/grub/grub-efi_2.00.bb             |    1 +
 meta/recipes-connectivity/portmap/portmap.inc      |    7 +-
 .../portmap/portmap/portmap.service                |   10 ++
 meta/recipes-connectivity/portmap/portmap_6.0.bb   |    7 +-
 meta/recipes-core/dropbear/dropbear.inc            |    7 +
 .../Yocto_Build_Appliance.vmx                      |    2 +-
 meta/recipes-core/systemd/systemd_216.bb           |    4 +-
 meta/recipes-devtools/gcc/gcc-common.inc           |   10 ++
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   10 --
 meta/recipes-devtools/i2c-tools/i2c-tools_3.1.1.bb |   12 +-
 meta/recipes-devtools/rsync/rsync_3.1.0.bb         |   11 +-
 ...o-not-read-login.defs-before-doing-chroot.patch |   46 ++++++
 meta/recipes-extended/shadow/shadow.inc            |    1 +
 meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb     |   19 ++-
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |    2 +-
 meta/recipes-support/atk/at-spi2-core_2.12.0.bb    |    5 +-
 .../atk/files/core_acinclude_m4.patch              |   40 +++++
 ...ibgcrypt-1.6.1-make-arm-asm-fPIC-friendly.patch |  169 ++++++++++++++++++++
 meta/recipes-support/libgcrypt/libgcrypt_1.6.1.bb  |    2 +
 scripts/gen-lockedsig-cache                        |   40 +++++
 24 files changed, 512 insertions(+), 31 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/grub-efi-fix-with-glibc-2.20.patch
 create mode 100644 meta/recipes-connectivity/portmap/portmap/portmap.service
 create mode 100644 meta/recipes-extended/shadow/files/0001-Do-not-read-login.defs-before-doing-chroot.patch
 create mode 100644 meta/recipes-support/atk/files/core_acinclude_m4.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/libgcrypt-1.6.1-make-arm-asm-fPIC-friendly.patch
 create mode 100755 scripts/gen-lockedsig-cache

Chen Qi (3):
  portmap: fix INITSCRIPT_PARAMS
  portmap: add systemd service file
  systemd: fix to use ${libdir} for libraries

Chong Lu (1):
  i2c-tools: create i2c-tools-misc package for perl scripts

Cristian Iorga (1):
  build-appliance-image: remove hardwired path

Hongxu Jia (1):
  lttng-tools: add PACKAGECONFIG to support --enable-python-bindings
    and lttng-ust

Jackie Huang (1):
  libgcrypt: Fix ARM assembly when building __PIC__

Joe Slater (1):
  at-spi2-core: fix DBIND_CHECK_ALIGNOF m4 macro

Marie Kowalczyk (1):
  gstreamer1.0-plugins-bad.inc: Add rtmp support in gstreamer.

Peter Kjellerstedt (1):
  shadow: Make useradd work correctly with --root again

Richard Purdie (5):
  sstatesig/sstate: Add support for locked down sstate cache usage
  sstatesig: Improve to handle locking of multiple machines
  sstate: Fix incorrect return value handling
  license: Improve disk usage
  gcc-configure/gcc-common: Move preconfigure definition to common
    include

Robert Yang (2):
  sstate.bbclass: fix sstate_hardcode_path()
  grub-efi: Replace _BSD_SOURCE macro with _DEFAULT_SOURCE

Ross Burton (1):
  rsync: remove trailing whitespace

Roy Li (1):
  rsync: Add PACKAGECONFIG for acl/attr

Wenzong Fan (1):
  dropbear: add pam modules dependencies

 meta/classes/license.bbclass                       |    9 +-
 meta/classes/sstate.bbclass                        |    8 +-
 meta/lib/oe/sstatesig.py                           |   89 +++++++++++
 .../grub/files/grub-efi-fix-with-glibc-2.20.patch  |   32 ++++
 meta/recipes-bsp/grub/grub-efi_2.00.bb             |    1 +
 meta/recipes-connectivity/portmap/portmap.inc      |    7 +-
 .../portmap/portmap/portmap.service                |   10 ++
 meta/recipes-connectivity/portmap/portmap_6.0.bb   |    7 +-
 meta/recipes-core/dropbear/dropbear.inc            |    7 +
 .../Yocto_Build_Appliance.vmx                      |    2 +-
 meta/recipes-core/systemd/systemd_216.bb           |    4 +-
 meta/recipes-devtools/gcc/gcc-common.inc           |   10 ++
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   10 --
 meta/recipes-devtools/i2c-tools/i2c-tools_3.1.1.bb |   12 +-
 meta/recipes-devtools/rsync/rsync_3.1.0.bb         |   11 +-
 ...o-not-read-login.defs-before-doing-chroot.patch |   46 ++++++
 meta/recipes-extended/shadow/shadow.inc            |    1 +
 meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb     |   19 ++-
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |    2 +-
 meta/recipes-support/atk/at-spi2-core_2.12.0.bb    |    5 +-
 .../atk/files/core_acinclude_m4.patch              |   40 +++++
 ...ibgcrypt-1.6.1-make-arm-asm-fPIC-friendly.patch |  169 ++++++++++++++++++++
 meta/recipes-support/libgcrypt/libgcrypt_1.6.1.bb  |    2 +
 scripts/gen-lockedsig-cache                        |   40 +++++
 24 files changed, 512 insertions(+), 31 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/grub-efi-fix-with-glibc-2.20.patch
 create mode 100644 meta/recipes-connectivity/portmap/portmap/portmap.service
 create mode 100644 meta/recipes-extended/shadow/files/0001-Do-not-read-login.defs-before-doing-chroot.patch
 create mode 100644 meta/recipes-support/atk/files/core_acinclude_m4.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/libgcrypt-1.6.1-make-arm-asm-fPIC-friendly.patch
 create mode 100755 scripts/gen-lockedsig-cache

-- 
1.7.10.4


