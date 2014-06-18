Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 99AF96FE01
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 02:36:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5I2axn1005836
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 19:36:59 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 17 Jun 2014 19:36:59 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Jun 2014 10:38:12 +0800
Message-ID: <cover.1403059033.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/3] Remove udev-utils and add 'udevadm' to udev package
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
X-List-Received-Date: Wed, 18 Jun 2014 02:37:06 -0000
Content-Type: text/plain

The following changes since commit f506d0660c9949485268a92724ac770b5457b0ca:

  linux-yocto/3.10: update to v3.10.43 (2014-06-17 17:56:42 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/remove-udev-utils
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/remove-udev-utils

Chen Qi (3):
  udev: remove udev-utils, add 'udevadm' to udev package
  systemd: remove udev-utils, move 'udevadm' to udev package
  initramfs-framework: get rid of udev-utils

 .../initrdscripts/initramfs-framework_1.0.bb       |    2 +-
 meta/recipes-core/systemd/systemd_213.bb           |    9 +++------
 meta/recipes-core/udev/udev.inc                    |    8 +++-----
 3 files changed, 7 insertions(+), 12 deletions(-)

-- 
1.7.9.5


