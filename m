Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D81176011C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:01:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vB851xVB026078
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Dec 2017 21:01:59 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 7 Dec 2017 21:01:46 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 8 Dec 2017 13:03:12 +0800
Message-ID: <cover.1512709294.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] dbus/dbus-test: upgrade to 1.12.2
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
X-List-Received-Date: Fri, 08 Dec 2017 05:01:59 -0000
Content-Type: text/plain

The following changes since commit 4469acdf1d0338220f3fe2ecb5e079eea6fda375:

  lib/oe/utils: remove param_bool() (2017-12-02 11:25:34 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/dbus-1.12.2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/dbus-1.12.2

Chen Qi (2):
  dbus: upgrade to 1.12.2
  dbus-test: upgrade to 1.12.2

 .../{dbus-test_1.10.20.bb => dbus-test_1.12.2.bb}  |  4 +--
 meta/recipes-core/dbus/dbus/os-test.patch          | 35 ----------------------
 .../dbus/{dbus_1.10.20.bb => dbus_1.12.2.bb}       | 12 ++++----
 3 files changed, 9 insertions(+), 42 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.10.20.bb => dbus-test_1.12.2.bb} (93%)
 delete mode 100644 meta/recipes-core/dbus/dbus/os-test.patch
 rename meta/recipes-core/dbus/{dbus_1.10.20.bb => dbus_1.12.2.bb} (93%)

-- 
1.9.1


