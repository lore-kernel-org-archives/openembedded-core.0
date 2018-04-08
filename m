Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6075A75583
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Apr 2018 07:55:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w387t2Wv032440
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 8 Apr 2018 00:55:02 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.197) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Sun, 8 Apr 2018 00:55:01 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 8 Apr 2018 15:56:06 +0800
Message-ID: <cover.1523174112.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] rpm: build without dbus for rpm-native
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
X-List-Received-Date: Sun, 08 Apr 2018 07:55:02 -0000
Content-Type: text/plain

The following changes since commit 29f65bda6d2c9fea4adb125c4857ee64f9312b9f:

  nativesdk-glibc: Split glibc and libcrypt to use libxcrypt instead (2018-04-07 22:34:45 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/rpm-native-dbus
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/rpm-native-dbus

Chen Qi (1):
  rpm: build without dbus for rpm-native

 .../0001-configure.ac-add-option-for-dbus.patch    | 42 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.1.bb            |  6 ++--
 2 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-configure.ac-add-option-for-dbus.patch

-- 
1.9.1


