Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3CFA6605FF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 07:29:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3B7THb9000560
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 00:29:17 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 11 Apr 2016 00:29:17 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Apr 2016 00:29:03 -0700
Message-ID: <cover.1460359568.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 00/14] [jethro] Consolidated pull
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
X-List-Received-Date: Mon, 11 Apr 2016 07:29:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The following changes since commit 4d879cb8d7384ac4a96f22c1664b8875f2d8f615:

  devtool: extract: update SRCTREECOVEREDTASKS for kernel (2016-03-20 10:22:55 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/jethro-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/jethro-next

Awais Belal (2):
  systemd-serialgetty: allow baud rate overriding
  lttng-tools: fix regression tests hang

Bill Randle (1):
  systemd: fix segfault on shutdown

Brad Mouring (2):
  busybox-1.23: Backport patch to fix zcip false-conflict
  busybox_git: Fix SRCREV

Christopher Larson (1):
  systemd: chown hwdb.bin to root:root for do_rootfs

Javier Viguera (1):
  bluez5: allow D-Bus to spawn obexd in systems without systemd

Juro Bystricky (1):
  python3: fix building nativesdk-python3

Khem Raj (1):
  ruby-native: Depend on openssl-native

Li Xin (1):
  gcc-cross-canadian.inc: add INSANE_SKIP_ to avoid build warning

Lukas Bulwahn (1):
  boost: ensure boost to remain an empty metapackage

Ross Burton (2):
  cdrtools: update SRC_URI
  ncurses: update SRC_URI

Ulrich Ölmann (1):
  nfs-utils: bugfix: adjust name of statd service unit

 meta/recipes-connectivity/bluez5/bluez5.inc        |   1 +
 ...-obexd-without-systemd-in-the-user-sessio.patch |  63 +++
 .../files/bugfix-adjust-statd-service-name.patch   |  34 ++
 .../nfs-utils/nfs-utils_1.3.1.bb                   |   1 +
 ...wrong-comparison-of-source-IP-with-our-IP.patch |  38 ++
 meta/recipes-core/busybox/busybox_1.23.2.bb        |   1 +
 meta/recipes-core/busybox/busybox_git.bb           |   2 +-
 meta/recipes-core/ncurses/ncurses_5.9.bb           |   6 +-
 .../systemd-serialgetty/serial-getty@.service      |   2 +-
 .../0023-backported-fixes-for-null-messages.patch  | 101 +++++
 meta/recipes-core/systemd/systemd_225.bb           |   2 +
 .../cdrtools/cdrtools-native_3.01a31.bb            |   2 +-
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc   |   2 +
 meta/recipes-devtools/python/python3_3.4.3.bb      |   1 +
 meta/recipes-devtools/ruby/ruby.inc                |   2 +-
 .../lttng/lttng-tools/Fix-regression-tests.patch   | 480 +++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb     |   1 +
 meta/recipes-support/boost/boost.inc               |   1 +
 18 files changed, 734 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/files/bugfix-adjust-statd-service-name.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-zcip-fix-wrong-comparison-of-source-IP-with-our-IP.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0023-backported-fixes-for-null-messages.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/Fix-regression-tests.patch

-- 
2.7.4


