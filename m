Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 61B32601F6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 09:40:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2S9eUwN012780
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 02:40:32 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 28 Mar 2016 02:40:29 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Mar 2016 02:40:21 -0700
Message-ID: <cover.1459157937.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/8] [jethro] Consolidated pull
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
X-List-Received-Date: Mon, 28 Mar 2016 09:40:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The following changes since commit 4d879cb8d7384ac4a96f22c1664b8875f2d8f615:

  devtool: extract: update SRCTREECOVEREDTASKS for kernel (2016-03-20 10:22:55 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/jethro-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/jethro-next

Bill Randle (1):
  systemd: fix segfault on shutdown

Brad Mouring (2):
  busybox-1.23: Backport patch to fix zcip false-conflict
  busybox_git: Fix SRCREV

Javier Viguera (1):
  bluez5: allow D-Bus to spawn obexd in systems without systemd

Khem Raj (1):
  ruby-native: Depend on openssl-native

Li Xin (1):
  gcc-cross-canadian.inc: add INSANE_SKIP_ to avoid build warning

Ross Burton (1):
  cdrtools: update SRC_URI

Ulrich Ölmann (1):
  nfs-utils: bugfix: adjust name of statd service unit

 meta/recipes-connectivity/bluez5/bluez5.inc        |   1 +
 ...-obexd-without-systemd-in-the-user-sessio.patch |  63 +++++++++++++
 .../files/bugfix-adjust-statd-service-name.patch   |  34 +++++++
 .../nfs-utils/nfs-utils_1.3.1.bb                   |   1 +
 ...wrong-comparison-of-source-IP-with-our-IP.patch |  38 ++++++++
 meta/recipes-core/busybox/busybox_1.23.2.bb        |   1 +
 meta/recipes-core/busybox/busybox_git.bb           |   2 +-
 .../0023-backported-fixes-for-null-messages.patch  | 101 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_225.bb           |   1 +
 .../cdrtools/cdrtools-native_3.01a31.bb            |   2 +-
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc   |   2 +
 meta/recipes-devtools/ruby/ruby.inc                |   2 +-
 12 files changed, 245 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/files/bugfix-adjust-statd-service-name.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-zcip-fix-wrong-comparison-of-source-IP-with-our-IP.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0023-backported-fixes-for-null-messages.patch

-- 
2.7.4


