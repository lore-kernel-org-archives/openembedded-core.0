Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AE36F7608F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 05:57:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4E5vQST017839
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 May 2018 22:57:27 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Sun, 13 May 2018 22:57:26 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 May 2018 13:59:20 +0800
Message-ID: <cover.1526277424.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/6] Upgrade gawk, sysstat, dbus, dbus-test, dbus-glib and sudo
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
X-List-Received-Date: Mon, 14 May 2018 05:57:26 -0000
Content-Type: text/plain

Changes in V2:
* Remove retrospection related codes in dbus recipe
* Remove the meaningless session.conf installation in dbus recipe

The following changes since commit 5479654eeaaa0f81bfff54ca49369c87f1658705:

  rm_work: Stop appending _setscene to do_image_complete_setscene stamps (2018-05-11 07:49:38 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/PU20180511
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/PU20180511

Chen Qi (6):
  gawk: upgrade to 4.2.1
  sysstat: upgrade to 11.7.3
  dbus: upgrade to 1.12.8
  dbus-test: upgrade to 1.12.8
  dbus-glib: upgrade to 0.110
  sudo: upgrade to 1.8.23

 meta/recipes-core/dbus/dbus-glib.inc                         |  4 +---
 meta/recipes-core/dbus/dbus-glib_0.108.bb                    |  4 ----
 meta/recipes-core/dbus/dbus-glib_0.110.bb                    |  4 ++++
 .../dbus/{dbus-test_1.12.2.bb => dbus-test_1.12.8.bb}        |  4 ++--
 meta/recipes-core/dbus/{dbus_1.12.2.bb => dbus_1.12.8.bb}    | 12 ++----------
 meta/recipes-extended/gawk/{gawk_4.2.0.bb => gawk_4.2.1.bb}  |  4 ++--
 meta/recipes-extended/sudo/sudo.inc                          |  5 +++--
 .../recipes-extended/sudo/{sudo_1.8.22.bb => sudo_1.8.23.bb} |  8 ++++----
 .../sysstat/{sysstat_11.7.1.bb => sysstat_11.7.3.bb}         |  4 ++--
 9 files changed, 20 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-core/dbus/dbus-glib_0.108.bb
 create mode 100644 meta/recipes-core/dbus/dbus-glib_0.110.bb
 rename meta/recipes-core/dbus/{dbus-test_1.12.2.bb => dbus-test_1.12.8.bb} (95%)
 rename meta/recipes-core/dbus/{dbus_1.12.2.bb => dbus_1.12.8.bb} (92%)
 rename meta/recipes-extended/gawk/{gawk_4.2.0.bb => gawk_4.2.1.bb} (89%)
 rename meta/recipes-extended/sudo/{sudo_1.8.22.bb => sudo_1.8.23.bb} (81%)
 rename meta/recipes-extended/sysstat/{sysstat_11.7.1.bb => sysstat_11.7.3.bb} (53%)

-- 
1.9.1


