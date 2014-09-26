Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3B11860809
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 21:15:30 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id r20so250134wiv.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 14:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=jo3rPst5a8Cg1KJaeljZFVkTUtK6Q4X2S5RpHNq6ZNE=;
	b=aHIncvc12Qxm7fmaQjhNE0o8LprNf25NBhNCvOE0HLkFy6NoYFtmCqsTadujxUXS1Z
	+UJ76TWV6osvU33xn+T7LZ32ps0kCK4W2vVWvaEbUABGoUYZgClQJW6BItaHfVdnyiZl
	BUHXBwXIT8IifQFnYL/mU0yUUiqbwvhxgWKm4R6evpnwceBtQgc3M8O6gpx/1lzyFkG3
	6DyVECdXawdKh6AKasLA1pEtFg23fCgXkkWBhOleLZqY1uq7vDv1Vqc7+8CyfanKYEWN
	k6F9r7KXLYwjHDYikYLGpn7OeIN9d+E+k3MQva7Eq55z9KMDZ/jO+xwbuAzkGQ9JvvEs
	d4Mg==
X-Gm-Message-State: ALoCoQmwTTSfxaY4MCNGZ9qrhhJ5CDBMU0/YyiAYF1DHPIvYya9tQwZl5ml5G/MlROzmQ3LDYdu5
X-Received: by 10.180.75.49 with SMTP id z17mr48456288wiv.3.1411766131701;
	Fri, 26 Sep 2014 14:15:31 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fv1sm7419555wjb.35.2014.09.26.14.15.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Sep 2014 14:15:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Sep 2014 22:15:25 +0100
Message-Id: <cover.1411764853.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 00/32] Consolidated pull
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
X-List-Received-Date: Fri, 26 Sep 2014 21:15:33 -0000

Hi,

This consolidated pull has been through the AB.  There was a failing in the SDK
which has been fixed in this series.  There's also a failure in the sanity tests
for systemd but this has been intermittently occuring in master so we should
investigate this independently.

Ross

The following changes since commit 8ac8eca2e3bd8c78e2b31ea974930ed0243258a3:

  build-appliance-image: Update to dizzy head revision (2014-09-23 22:10:26 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/mut

for you to fetch changes up to 09f73439e776f898521f0dca71f1f75b9b872d30:

  nss.inc: Fix LICENSE (2014-09-26 00:15:37 +0100)

----------------------------------------------------------------
Chen Qi (3):
      acpid: use ${PN} for SYSTEMD_SERVICE
      volatile-binds: use ${PN} for SYSTEMD_SERVICE
      dhcp: use ${PN} for SYSTEMD_SERVICES

Chong Lu (1):
      perf: fix issue about package splitting

Elizabeth Flanagan (1):
      nss.inc: Fix LICENSE

Hongxu Jia (2):
      texinfo: fix QA Error while doc compress enabled
      man/texinfo: conditionally add gzip/bzip2/xz to RDEPENDS

Jackie Huang (1):
      gst-plugins-base: fix build failure for x86

Jonathan Liu (4):
      qt-mobility: fix source URL
      qt4: fix bug tracker URLs for patches
      meta-toolchain-qt: fix up old reference to Nokia and typo
      licenses.conf: remove link to deleted License_Audit wiki page

Konrad Scherer (1):
      bitbake: Improve error message when prserver cannot bind to supplied host address

Lucian Musat (1):
      oeqa/utils: Added filter to LogResults decorator to enforce custom log level.

Michael Gloff (1):
      syslog: Change unused variable declaration LOCAL=0 to LOG_LOCAL=1

Nobuhiro Iwamatsu (1):
      packagegroup-core-standalone-sdk-target: Add libgcov-dev to on device SDK

Peter A. Bigot (2):
      systemd: disable resolv.conf symlink unless resolved is enabled
      git: add Git perl module to perltools package

Richard Purdie (3):
      sstate: Change overlapping files warning to a fatal error
      bitbake: fetch: Extend testing of subdir unpack parameter and fix
      bitbake: hob: Fix sstate mirrors mangling

Robert Yang (2):
      coreutils: selinux/flask.h should respect to with_selinux
      sstate.bbclass: update the timestamps after install

Ross Burton (4):
      gnomebase: fix indentation
      monitordisk: don't log when not monitoring a filesystem for inodes
      curl: add a PACKAGECONFIG for librtmp
      bash: fix CVE-2014-6271

Roxana (1):
      bitbake: fetch: SRC_URI parameter "subdir" does not work for local files

Roy Li (2):
      pinentry: add recipes
      gnupg: add pinentry into RRECOMMENDS

Wenzong Fan (1):
      libpam / xtests: remove bash dependency

Yi Zhao (1):
      qtdemo-init: Make qtdemo startup correctly

 bitbake/lib/bb/fetch2/__init__.py                  |    7 +-
 bitbake/lib/bb/monitordisk.py                      |    6 +-
 bitbake/lib/bb/tests/fetch.py                      |    7 +
 .../lib/bb/ui/crumbs/hig/simplesettingsdialog.py   |    5 +-
 bitbake/lib/prserv/serv.py                         |   13 +-
 meta/classes/gnomebase.bbclass                     |   14 +-
 meta/classes/sstate.bbclass                        |    5 +-
 meta/conf/licenses.conf                            |    1 -
 meta/lib/oeqa/utils/decorators.py                  |    6 +
 meta/recipes-bsp/acpid/acpid.inc                   |    3 +-
 meta/recipes-connectivity/dhcp/dhcp.inc            |   10 +-
 meta/recipes-core/busybox/files/syslog             |    2 +-
 .../coreutils-8.22/fix-selinux-flask.patch         |   39 ++++
 meta/recipes-core/coreutils/coreutils_8.22.bb      |    1 +
 .../packagegroup-core-standalone-sdk-target.bb     |    1 +
 ...es.d-etc.conf-disable-resolv.conf-symlink.patch |   35 +++
 meta/recipes-core/systemd/systemd_216.bb           |    1 +
 meta/recipes-core/volatile-binds/volatile-binds.bb |    2 +-
 meta/recipes-devtools/git/git.inc                  |   18 +-
 .../bash/bash-3.2.48/cve-2014-6271.patch           |   77 +++++++
 .../recipes-extended/bash/bash/cve-2014-6271.patch |  114 ++++++++++
 meta/recipes-extended/bash/bash_3.2.48.bb          |    1 +
 meta/recipes-extended/bash/bash_4.3.bb             |    1 +
 meta/recipes-extended/man/man_1.6g.bb              |   13 ++
 .../libpam-xtests-remove-bash-dependency.patch     |  226 ++++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.1.6.bb          |    3 +-
 meta/recipes-extended/texinfo/texinfo_5.2.bb       |   15 +-
 meta/recipes-kernel/perf/perf.bb                   |    4 +-
 ...le-Fix-build-on-x86-if-emmintrin.h-is-ava.patch |   37 ++++
 .../gstreamer/gst-plugins-base_0.10.36.bb          |    4 +-
 meta/recipes-qt/meta/meta-toolchain-qt.inc         |    4 +-
 meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init   |   10 +-
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |    2 +-
 ...-const-usage-that-causes-compile-failure-.patch |    2 +-
 .../qt4/qt4-4.8.6/0012-Add-2bpp-support.patch      |    2 +-
 meta/recipes-support/curl/curl_7.37.1.bb           |    1 +
 meta/recipes-support/gnupg/gnupg_2.0.26.bb         |    1 +
 meta/recipes-support/nss/nss.inc                   |    2 +-
 meta/recipes-support/pinentry/pinentry_0.8.4.bb    |   31 +++
 39 files changed, 672 insertions(+), 54 deletions(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.22/fix-selinux-flask.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-tmpfiles.d-etc.conf-disable-resolv.conf-symlink.patch
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/cve-2014-6271.patch
 create mode 100644 meta/recipes-extended/bash/bash/cve-2014-6271.patch
 create mode 100644 meta/recipes-extended/pam/libpam/libpam-xtests-remove-bash-dependency.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch
 create mode 100644 meta/recipes-support/pinentry/pinentry_0.8.4.bb

Chen Qi (3):
  acpid: use ${PN} for SYSTEMD_SERVICE
  volatile-binds: use ${PN} for SYSTEMD_SERVICE
  dhcp: use ${PN} for SYSTEMD_SERVICES

Chong Lu (1):
  perf: fix issue about package splitting

Elizabeth Flanagan (1):
  nss.inc: Fix LICENSE

Hongxu Jia (2):
  texinfo: fix QA Error while doc compress enabled
  man/texinfo: conditionally add gzip/bzip2/xz to RDEPENDS

Jackie Huang (1):
  gst-plugins-base: fix build failure for x86

Jonathan Liu (4):
  qt-mobility: fix source URL
  qt4: fix bug tracker URLs for patches
  meta-toolchain-qt: fix up old reference to Nokia and typo
  licenses.conf: remove link to deleted License_Audit wiki page

Konrad Scherer (1):
  bitbake: Improve error message when prserver cannot bind to supplied
    host address

Lucian Musat (1):
  oeqa/utils: Added filter to LogResults decorator to enforce custom
    log level.

Michael Gloff (1):
  syslog: Change unused variable declaration LOCAL=0 to LOG_LOCAL=1

Nobuhiro Iwamatsu (1):
  packagegroup-core-standalone-sdk-target: Add libgcov-dev to on device
    SDK

Peter A. Bigot (2):
  systemd: disable resolv.conf symlink unless resolved is enabled
  git: add Git perl module to perltools package

Richard Purdie (3):
  sstate: Change overlapping files warning to a fatal error
  bitbake: fetch: Extend testing of subdir unpack parameter and fix
  bitbake: hob: Fix sstate mirrors mangling

Robert Yang (2):
  coreutils: selinux/flask.h should respect to with_selinux
  sstate.bbclass: update the timestamps after install

Ross Burton (4):
  gnomebase: fix indentation
  monitordisk: don't log when not monitoring a filesystem for inodes
  curl: add a PACKAGECONFIG for librtmp
  bash: fix CVE-2014-6271

Roxana (1):
  bitbake: fetch: SRC_URI parameter "subdir" does not work for local
    files

Roy Li (2):
  pinentry: add recipes
  gnupg: add pinentry into RRECOMMENDS

Wenzong Fan (1):
  libpam / xtests: remove bash dependency

Yi Zhao (1):
  qtdemo-init: Make qtdemo startup correctly

 bitbake/lib/bb/fetch2/__init__.py                  |    7 +-
 bitbake/lib/bb/monitordisk.py                      |    6 +-
 bitbake/lib/bb/tests/fetch.py                      |    7 +
 .../lib/bb/ui/crumbs/hig/simplesettingsdialog.py   |    5 +-
 bitbake/lib/prserv/serv.py                         |   13 +-
 meta/classes/gnomebase.bbclass                     |   14 +-
 meta/classes/sstate.bbclass                        |    5 +-
 meta/conf/licenses.conf                            |    1 -
 meta/lib/oeqa/utils/decorators.py                  |    6 +
 meta/recipes-bsp/acpid/acpid.inc                   |    3 +-
 meta/recipes-connectivity/dhcp/dhcp.inc            |   10 +-
 meta/recipes-core/busybox/files/syslog             |    2 +-
 .../coreutils-8.22/fix-selinux-flask.patch         |   39 ++++
 meta/recipes-core/coreutils/coreutils_8.22.bb      |    1 +
 .../packagegroup-core-standalone-sdk-target.bb     |    1 +
 ...es.d-etc.conf-disable-resolv.conf-symlink.patch |   35 +++
 meta/recipes-core/systemd/systemd_216.bb           |    1 +
 meta/recipes-core/volatile-binds/volatile-binds.bb |    2 +-
 meta/recipes-devtools/git/git.inc                  |   18 +-
 .../bash/bash-3.2.48/cve-2014-6271.patch           |   77 +++++++
 .../recipes-extended/bash/bash/cve-2014-6271.patch |  114 ++++++++++
 meta/recipes-extended/bash/bash_3.2.48.bb          |    1 +
 meta/recipes-extended/bash/bash_4.3.bb             |    1 +
 meta/recipes-extended/man/man_1.6g.bb              |   13 ++
 .../libpam-xtests-remove-bash-dependency.patch     |  226 ++++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.1.6.bb          |    3 +-
 meta/recipes-extended/texinfo/texinfo_5.2.bb       |   15 +-
 meta/recipes-kernel/perf/perf.bb                   |    4 +-
 ...le-Fix-build-on-x86-if-emmintrin.h-is-ava.patch |   37 ++++
 .../gstreamer/gst-plugins-base_0.10.36.bb          |    4 +-
 meta/recipes-qt/meta/meta-toolchain-qt.inc         |    4 +-
 meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init   |   10 +-
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |    2 +-
 ...-const-usage-that-causes-compile-failure-.patch |    2 +-
 .../qt4/qt4-4.8.6/0012-Add-2bpp-support.patch      |    2 +-
 meta/recipes-support/curl/curl_7.37.1.bb           |    1 +
 meta/recipes-support/gnupg/gnupg_2.0.26.bb         |    1 +
 meta/recipes-support/nss/nss.inc                   |    2 +-
 meta/recipes-support/pinentry/pinentry_0.8.4.bb    |   31 +++
 39 files changed, 672 insertions(+), 54 deletions(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.22/fix-selinux-flask.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-tmpfiles.d-etc.conf-disable-resolv.conf-symlink.patch
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/cve-2014-6271.patch
 create mode 100644 meta/recipes-extended/bash/bash/cve-2014-6271.patch
 create mode 100644 meta/recipes-extended/pam/libpam/libpam-xtests-remove-bash-dependency.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.36/audioresample-Fix-build-on-x86-if-emmintrin.h-is-ava.patch
 create mode 100644 meta/recipes-support/pinentry/pinentry_0.8.4.bb

-- 
1.7.10.4


