Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6A6DE60167
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Sep 2014 13:49:35 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id m15so4603915wgh.32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Sep 2014 06:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=4prBGPZrMu7fyps7GH+K3XgI+qjPOBbTeJ5g1cZM50A=;
	b=F/0MBHXkIus/tgHDwjVzqTO+IZYBE9UKmbksOmLfC0UeonqzoBbGbXy6g1NpRA7Rvd
	194sJqqjgm4g0e1rJTeqSh2fnTY4ypRfwdo8Mk8/2X5aUuXBDKNuMhEQjsfjS7TCe1Ds
	qGEka180ePiAAoLWwQiVBcOqm0nPxpBc1GBpqcZK0gMVVCaxkIs3eT8bbkR0NGz0iovE
	s8Kw1lKTUFOXuj85KDWV2qNEMS8EoQDnsTU5sLo9aFvskiMO2GltJSzfmH5FRVAl6wiP
	nNWLZgT6n5ziiqFZzlwG/W00re6cDz31k9u4CBC3DebV1MsTUP3nLBnivVZwvyeD9vvh
	UdMA==
X-Gm-Message-State: ALoCoQmW5Zl3EJh2cO8YtrFqJHJEeOZKnvS/4oW/7gctOpHipJoow0NHlF9N7wumEOE2CoQI/4ts
X-Received: by 10.180.198.50 with SMTP id iz18mr2783540wic.21.1410356976596;
	Wed, 10 Sep 2014 06:49:36 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id pn5sm18672936wjc.4.2014.09.10.06.49.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Sep 2014 06:49:35 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Sep 2014 14:49:08 +0100
Message-Id: <cover.1410356905.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 00/21] C-Pull
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
X-List-Received-Date: Wed, 10 Sep 2014 13:49:43 -0000

Hi,

Misc patches, kernel-dev upgrade, QA support for automated ptest execution.

The initial full nightly autobuilder run failed dramatically due to valgrind
failing to configure. This is now fixed, and verified with a run of
nightly-x86-64.

Ross

The following changes since commit 0d3c79524c95a7ab3b87c9dcb49746746900a18a:

  glibc: Incremental bump to 2.20 release branch (2014-09-10 11:33:26 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/mut-next

for you to fetch changes up to 0975ff62201ae6745fdf2e2e5a62c8157a73669e:

  nspr: Upgrade to 4.10.7 (2014-09-10 11:47:20 +0100)

----------------------------------------------------------------
Bruce Ashfield (7):
      linux-yocto/3.10: baytrail i/o updates
      lttng-modules: fix compilation for 3.17-rcX
      perf: fix v3.17 powerpc compilation issues
      linux-yocto: introduce v3.17
      linux-yocto/3.10: update valleyisland-io merge branch
      linux-yocto/3.14: configuration updates and feature merges.
      linux-yocto-dev: bump to v3.17+

Carlos Rafael Giani (1):
      kernel.bbclass: handle .dsp firmware

Chen Qi (1):
      bitbake.conf: use ??= for IMAGE_ROOTFS_SIZE

Jackie Huang (1):
      packagegroup-self-hosted: move graphics packages to graphics group

Lucian Musat (3):
      oeqa: Added package installer to oetest to aid in future automatic install of packages
      oeqa/utils/logparser.py: results based log parser utility
      oeqa/runtime: Automatic test for ptest

Otavio Salvador (1):
      packagegroup.bbclass: Use immediate expanded PACKAGE_ARCH value

Paul Eggleton (1):
      classes/buildhistory: fix for sstate class change

Ross Burton (4):
      e2fsprogs: remove chmod
      e2fsprogs: enable verbose build
      e2fsprogs: remove manual build of util/subst
      e2fsprogs: update acinclude.m4

Saul Wold (1):
      nspr: Upgrade to 4.10.7

Sona Sarmadi (1):
      pcihp: fix possible array out of bounds, CVE-2014-5388

 meta/classes/buildhistory.bbclass                  |    2 +-
 meta/classes/kernel.bbclass                        |    1 +
 meta/classes/packagegroup.bbclass                  |    8 +-
 meta/conf/bitbake.conf                             |    2 +-
 meta/lib/oeqa/oetest.py                            |    7 ++
 meta/lib/oeqa/runtime/_ptest.py                    |  124 +++++++++++++++++++
 meta/lib/oeqa/utils/logparser.py                   |  125 +++++++++++++++++++
 .../packagegroups/packagegroup-self-hosted.bb      |   10 +-
 .../e2fsprogs/e2fsprogs/acinclude.m4               |   53 +++++++-
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb |    7 +-
 ...1-Back-porting-security-fix-CVE-2014-5388.patch |   30 +++++
 meta/recipes-devtools/qemu/qemu_2.1.0.bb           |    1 +
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |    6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |    6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |    4 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |    4 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb |   21 ++++
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      |   16 +--
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      |   16 +--
 meta/recipes-kernel/linux/linux-yocto_3.17.bb      |   37 ++++++
 ...probes-should-calculate-alignment-and-eve.patch |  130 ++++++++++++++++++++
 ...e-kvm-instrumentation-compile-on-3.17-rc1.patch |   46 +++++++
 .../Update-statedump-to-3.17-nsproxy-locking.patch |   70 +++++++++++
 meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb   |    3 +
 meta/recipes-kernel/perf/perf.bb                   |    5 +
 .../nspr/nspr/fix-build-on-x86_64.patch            |   31 ++---
 .../nspr/remove-srcdir-from-configure-in.patch     |   19 +++
 .../nspr/nspr/trickly-fix-build-on-x86_64.patch    |   62 ----------
 .../nspr/{nspr_4.10.3.bb => nspr_4.10.7.bb}        |   13 +-
 30 files changed, 730 insertions(+), 131 deletions(-)
 create mode 100644 meta/lib/oeqa/runtime/_ptest.py
 create mode 100644 meta/lib/oeqa/utils/logparser.py
 create mode 100644 meta/recipes-devtools/qemu/files/0001-Back-porting-security-fix-CVE-2014-5388.patch
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_3.17.bb
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/Fix-noargs-probes-should-calculate-alignment-and-eve.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/Update-kvm-instrumentation-compile-on-3.17-rc1.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/Update-statedump-to-3.17-nsproxy-locking.patch
 create mode 100644 meta/recipes-support/nspr/nspr/remove-srcdir-from-configure-in.patch
 delete mode 100644 meta/recipes-support/nspr/nspr/trickly-fix-build-on-x86_64.patch
 rename meta/recipes-support/nspr/{nspr_4.10.3.bb => nspr_4.10.7.bb} (91%)

Bruce Ashfield (7):
  linux-yocto/3.10: baytrail i/o updates
  lttng-modules: fix compilation for 3.17-rcX
  perf: fix v3.17 powerpc compilation issues
  linux-yocto: introduce v3.17
  linux-yocto/3.10: update valleyisland-io merge branch
  linux-yocto/3.14: configuration updates and feature merges.
  linux-yocto-dev: bump to v3.17+

Carlos Rafael Giani (1):
  kernel.bbclass: handle .dsp firmware

Chen Qi (1):
  bitbake.conf: use ??= for IMAGE_ROOTFS_SIZE

Jackie Huang (1):
  packagegroup-self-hosted: move graphics packages to graphics group

Lucian Musat (3):
  oeqa: Added package installer to oetest to aid in future automatic
    install of packages
  oeqa/utils/logparser.py: results based log parser utility
  oeqa/runtime: Automatic test for ptest

Otavio Salvador (1):
  packagegroup.bbclass: Use immediate expanded PACKAGE_ARCH value

Paul Eggleton (1):
  classes/buildhistory: fix for sstate class change

Ross Burton (4):
  e2fsprogs: remove chmod
  e2fsprogs: enable verbose build
  e2fsprogs: remove manual build of util/subst
  e2fsprogs: update acinclude.m4

Saul Wold (1):
  nspr: Upgrade to 4.10.7

Sona Sarmadi (1):
  pcihp: fix possible array out of bounds, CVE-2014-5388

 meta/classes/buildhistory.bbclass                  |    2 +-
 meta/classes/kernel.bbclass                        |    1 +
 meta/classes/packagegroup.bbclass                  |    8 +-
 meta/conf/bitbake.conf                             |    2 +-
 meta/lib/oeqa/oetest.py                            |    7 ++
 meta/lib/oeqa/runtime/_ptest.py                    |  124 +++++++++++++++++++
 meta/lib/oeqa/utils/logparser.py                   |  125 +++++++++++++++++++
 .../packagegroups/packagegroup-self-hosted.bb      |   10 +-
 .../e2fsprogs/e2fsprogs/acinclude.m4               |   53 +++++++-
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb |    7 +-
 ...1-Back-porting-security-fix-CVE-2014-5388.patch |   30 +++++
 meta/recipes-devtools/qemu/qemu_2.1.0.bb           |    1 +
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |    6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |    6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |    4 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |    4 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb |   21 ++++
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      |   16 +--
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      |   16 +--
 meta/recipes-kernel/linux/linux-yocto_3.17.bb      |   37 ++++++
 ...probes-should-calculate-alignment-and-eve.patch |  130 ++++++++++++++++++++
 ...e-kvm-instrumentation-compile-on-3.17-rc1.patch |   46 +++++++
 .../Update-statedump-to-3.17-nsproxy-locking.patch |   70 +++++++++++
 meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb   |    3 +
 meta/recipes-kernel/perf/perf.bb                   |    5 +
 .../nspr/nspr/fix-build-on-x86_64.patch            |   31 ++---
 .../nspr/remove-srcdir-from-configure-in.patch     |   19 +++
 .../nspr/nspr/trickly-fix-build-on-x86_64.patch    |   62 ----------
 .../nspr/{nspr_4.10.3.bb => nspr_4.10.7.bb}        |   13 +-
 30 files changed, 730 insertions(+), 131 deletions(-)
 create mode 100644 meta/lib/oeqa/runtime/_ptest.py
 create mode 100644 meta/lib/oeqa/utils/logparser.py
 create mode 100644 meta/recipes-devtools/qemu/files/0001-Back-porting-security-fix-CVE-2014-5388.patch
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_3.17.bb
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/Fix-noargs-probes-should-calculate-alignment-and-eve.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/Update-kvm-instrumentation-compile-on-3.17-rc1.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/Update-statedump-to-3.17-nsproxy-locking.patch
 create mode 100644 meta/recipes-support/nspr/nspr/remove-srcdir-from-configure-in.patch
 delete mode 100644 meta/recipes-support/nspr/nspr/trickly-fix-build-on-x86_64.patch
 rename meta/recipes-support/nspr/{nspr_4.10.3.bb => nspr_4.10.7.bb} (91%)

-- 
1.7.10.4


