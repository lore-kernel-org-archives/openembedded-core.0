Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 18B4A60CFC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Nov 2014 07:50:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAO7o8h5014421
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Nov 2014 23:50:09 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 23 Nov 2014 23:50:08 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Nov 2014 15:49:31 +0800
Message-ID: <cover.1416815305.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/5] Upgrade dbus and dbus-glib
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
X-List-Received-Date: Mon, 24 Nov 2014 07:50:12 -0000
Content-Type: text/plain

The following changes since commit edaeb8940813b620090a0797ad3b6a076897512d:

  bitbake: cooker.py: fix loginfo op being set to an invalid value (2014-11-12 17:04:50 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/dbus
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/dbus

Chong Lu (5):
  dbus: Upgrade to 1.8.10
  dbus-test: Upgrade to 1.8.10
  dbus-glib: Upgrade to 0.102
  connman-gnome: fix dbus interface name
  upstream_tracking.inc: update entries for dbus

 .../conf/distro/include/upstream_tracking.inc      |   2 +-
 .../connman-gnome-fix-dbus-interface-name.patch    | 187 +++++++++++++++++++++
 .../connman/connman-gnome_0.7.bb                   |   7 +-
 .../obsolete_automake_macros.patch                 |  15 --
 meta/recipes-core/dbus/dbus-glib.inc               |   1 -
 .../no-examples.patch                              |   0
 .../test-install-makefile.patch                    |  57 ++++---
 meta/recipes-core/dbus/dbus-glib_0.100.2.bb        |   5 -
 meta/recipes-core/dbus/dbus-glib_0.102.bb          |   5 +
 .../{dbus-test_1.8.2.bb => dbus-test_1.8.10.bb}    |   0
 meta/recipes-core/dbus/dbus_1.8.10.bb              |   4 +
 meta/recipes-core/dbus/dbus_1.8.2.bb               |   4 -
 12 files changed, 234 insertions(+), 53 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/connman-gnome-fix-dbus-interface-name.patch
 delete mode 100644 meta/recipes-core/dbus/dbus-glib-0.100.2/obsolete_automake_macros.patch
 rename meta/recipes-core/dbus/{dbus-glib-0.100.2 => dbus-glib}/no-examples.patch (100%)
 rename meta/recipes-core/dbus/{dbus-glib-0.100.2 => dbus-glib}/test-install-makefile.patch (66%)
 delete mode 100644 meta/recipes-core/dbus/dbus-glib_0.100.2.bb
 create mode 100644 meta/recipes-core/dbus/dbus-glib_0.102.bb
 rename meta/recipes-core/dbus/{dbus-test_1.8.2.bb => dbus-test_1.8.10.bb} (100%)
 create mode 100644 meta/recipes-core/dbus/dbus_1.8.10.bb
 delete mode 100644 meta/recipes-core/dbus/dbus_1.8.2.bb

-- 
1.9.1


