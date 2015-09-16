Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 8CA4773243
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 08:34:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id CC5883C88766
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Sep 2015 09:34:27 +0100
Message-Id: <cover.1442390752.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.4.3
Subject: [PATCH 00/14] Proposed Fido changes
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
X-List-Received-Date: Wed, 16 Sep 2015 08:34:35 -0000

Please consider the following changes for the fido branch.

The branch has successfully passed an autobuilder run:

https://autobuilder.yoctoproject.org/main/builders/nightly/builds/547

The following changes since commit 5a1839ecc9a2191252019ddd5c253098006f5bc3:

  tzdata: update to 2015d (2015-09-01 21:41:24 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/fido-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/fido-next

Alejandro Hernandez (1):
  qemurunner: Improves checking for server and target IPs on qemus
    parameters

Armin Kuster (2):
  bind: CVE-2015-1349 CVE-2015-4620 CVE-2015-5722
  openssh: CVE-2015-6563 CVE-2015-6564 CVE-2015-6565

George McCollister (1):
  wic: fix path parsing, use last occurrence

Li Zhou (1):
  libunwind: Security Advisory - libunwind - CVE-2015-3239

Martin Jansa (3):
  rootfs.py: Allow to override postinst-intercepts location
  postinst_intercept: allow to pass variables with spaces
  rootfs.py: show intercept script output in log.do_rootfs

Paul Eggleton (1):
  oeqa/utils/qemurunner: fix logging

Richard Purdie (1):
  runqemu: Handle device names like tapX@NONE

Ross Burton (1):
  oeqa/QemuRunner: don't use bb for logging

Saul Wold (1):
  oprofileui: Use inherit gettext

Sona Sarmadi (2):
  gnutls: CVE-2015-3308
  libtasn1: CVE-2015-3622

 meta/lib/oe/rootfs.py                              |   8 +-
 meta/lib/oeqa/utils/qemurunner.py                  |  73 +--
 .../bind/bind/CVE-2015-1349.patch                  |  60 +++
 .../bind/bind/CVE-2015-4620.patch                  |  36 ++
 .../bind/bind/CVE-2015-5722.patch                  | 490 +++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.9.5.bb       |   3 +
 .../openssh/openssh/CVE-2015-6563.patch            |  36 ++
 .../openssh/openssh/CVE-2015-6564.patch            |  34 ++
 .../openssh/openssh/CVE-2015-6565.patch            |  35 ++
 meta/recipes-connectivity/openssh/openssh_6.7p1.bb |   6 +-
 meta/recipes-kernel/oprofile/oprofileui.inc        |   2 +-
 .../better-fix-for-double-free-CVE-2015-3308.patch |  65 +++
 .../eliminated-double-free-CVE-2015-3308.patch     |  33 ++
 meta/recipes-support/gnutls/gnutls_3.3.12.bb       |   2 +
 .../gnutls/libtasn1/libtasn1-CVE-2015-3622.patch   |  44 ++
 meta/recipes-support/gnutls/libtasn1_4.0.bb        |   1 +
 ...rf-opcodes-can-cause-references-beyond-th.patch |  29 ++
 meta/recipes-support/libunwind/libunwind_1.1.bb    |   1 +
 scripts/lib/wic/plugin.py                          |   2 +-
 scripts/postinst-intercepts/postinst_intercept     |   2 +-
 scripts/runqemu-internal                           |   2 +-
 21 files changed, 922 insertions(+), 42 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-1349.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-4620.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-5722.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-6563.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-6564.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-6565.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/better-fix-for-double-free-CVE-2015-3308.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/eliminated-double-free-CVE-2015-3308.patch
 create mode 100644 meta/recipes-support/gnutls/libtasn1/libtasn1-CVE-2015-3622.patch
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/0001-Invalid-dwarf-opcodes-can-cause-references-beyond-th.patch

-- 
2.4.3


