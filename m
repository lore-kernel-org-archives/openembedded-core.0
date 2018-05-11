Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E57674F51
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 02:19:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4B2IVsn010613
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 19:18:57 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 10 May 2018 19:18:26 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 May 2018 10:20:15 +0800
Message-ID: <cover.1526004301.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/6] Upgrade gawk, sysstat, dbus, dbus-test, dbus-glib and sudo
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
X-List-Received-Date: Fri, 11 May 2018 02:19:07 -0000
Content-Type: text/plain

The following changes since commit f4c938c47424424b89cde2269bd92cebc9a6ac1a:

  packagegroup: Do not add libssp to SDK (2018-05-09 10:47:51 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/PU-20180511
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/PU20180511

Chen Qi (6):
  gawk: upgrade to 4.2.1
  sysstat: upgrade to 11.7.3
  dbus: upgrade to 1.12.8
  dbus-test: upgrade to 1.12.8
  dbus-glib: upgrade to 0.110
  sudo: upgrade to 1.8.23

 meta/recipes-core/dbus/dbus-glib.inc                                | 4 +---
 meta/recipes-core/dbus/dbus-glib_0.108.bb                           | 4 ----
 meta/recipes-core/dbus/dbus-glib_0.110.bb                           | 4 ++++
 meta/recipes-core/dbus/{dbus-test_1.12.2.bb => dbus-test_1.12.8.bb} | 4 ++--
 meta/recipes-core/dbus/{dbus_1.12.2.bb => dbus_1.12.8.bb}           | 4 ++--
 meta/recipes-extended/gawk/{gawk_4.2.0.bb => gawk_4.2.1.bb}         | 4 ++--
 meta/recipes-extended/sudo/sudo.inc                                 | 5 +++--
 meta/recipes-extended/sudo/{sudo_1.8.22.bb => sudo_1.8.23.bb}       | 6 +++---
 .../sysstat/{sysstat_11.7.1.bb => sysstat_11.7.3.bb}                | 4 ++--
 9 files changed, 19 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-core/dbus/dbus-glib_0.108.bb
 create mode 100644 meta/recipes-core/dbus/dbus-glib_0.110.bb
 rename meta/recipes-core/dbus/{dbus-test_1.12.2.bb => dbus-test_1.12.8.bb} (95%)
 rename meta/recipes-core/dbus/{dbus_1.12.2.bb => dbus_1.12.8.bb} (98%)
 rename meta/recipes-extended/gawk/{gawk_4.2.0.bb => gawk_4.2.1.bb} (89%)
 rename meta/recipes-extended/sudo/{sudo_1.8.22.bb => sudo_1.8.23.bb} (86%)
 rename meta/recipes-extended/sysstat/{sysstat_11.7.1.bb => sysstat_11.7.3.bb} (53%)

-- 
1.9.1


