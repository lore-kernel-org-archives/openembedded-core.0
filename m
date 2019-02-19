Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C98AA7C8C8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 01:43:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1J1hpJ8028406
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 17:43:51 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Mon, 18 Feb 2019 17:43:50 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Feb 2019 09:53:09 +0800
Message-ID: <cover.1550541019.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/5] PU: cups, dbus, dbus-test, diffutils, sudo
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
X-List-Received-Date: Tue, 19 Feb 2019 01:43:50 -0000
Content-Type: text/plain

The following changes since commit 4972d5dbd94a5a1fe9848e20730245f0f715501f:

  glib-2.0: Improve shared-mime-info dependency handling (2019-02-18 10:33:13 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/PU-20190219
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/PU-20190219

Chen Qi (5):
  cups: upgrade to 2.2.10
  dbus: upgrade to 1.12.12
  dbus-test: upgrade to 1.12.12
  diffutils: upgrade to 3.7
  sudo: upgrade to 1.8.27

 .../{dbus-test_1.12.10.bb => dbus-test_1.12.12.bb} |  4 +--
 .../dbus/{dbus_1.12.10.bb => dbus_1.12.12.bb}      |  4 +--
 .../cups/{cups_2.2.9.bb => cups_2.2.10.bb}         |  4 +--
 ...need_charset_alias-when-building-for-musl.patch | 33 ----------------------
 .../0001-explicitly-disable-replacing-getopt.patch | 30 --------------------
 .../{diffutils-3.6 => diffutils}/run-ptest         |  0
 .../{diffutils_3.6.bb => diffutils_3.7.bb}         |  6 ++--
 meta/recipes-extended/sudo/sudo.inc                |  2 +-
 .../sudo/{sudo_1.8.26.bb => sudo_1.8.27.bb}        | 25 ++++++++++++++--
 9 files changed, 32 insertions(+), 76 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.12.10.bb => dbus-test_1.12.12.bb} (95%)
 rename meta/recipes-core/dbus/{dbus_1.12.10.bb => dbus_1.12.12.bb} (97%)
 rename meta/recipes-extended/cups/{cups_2.2.9.bb => cups_2.2.10.bb} (40%)
 delete mode 100644 meta/recipes-extended/diffutils/diffutils-3.6/0001-Unset-need_charset_alias-when-building-for-musl.patch
 delete mode 100644 meta/recipes-extended/diffutils/diffutils-3.6/0001-explicitly-disable-replacing-getopt.patch
 rename meta/recipes-extended/diffutils/{diffutils-3.6 => diffutils}/run-ptest (100%)
 rename meta/recipes-extended/diffutils/{diffutils_3.6.bb => diffutils_3.7.bb} (77%)
 rename meta/recipes-extended/sudo/{sudo_1.8.26.bb => sudo_1.8.27.bb} (66%)

-- 
1.9.1


