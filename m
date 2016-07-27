Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EA75F606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 09:27:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6R9Rw0q002919
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 02:27:58 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 27 Jul 2016 02:27:57 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2016 02:27:48 -0700
Message-ID: <cover.1469609666.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH V2 0/9] Fix udev dirs
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
X-List-Received-Date: Wed, 27 Jul 2016 09:27:59 -0000
Content-Type: text/plain

* V2
  - lib/udev/rules.d -> lib/udev in bitbake.conf
  - Remove duplicated udev setting for more recipes

// Robert

The following changes since commit b32d430c3c7dccf3a8d06ab492d648893a05950f:

  dpkg: use snapshot.debian.org for SRC_URI (2016-07-26 08:56:08 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/udev
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/udev

Robert Yang (9):
  bitbake.conf: add eudev's udevdir to FILES_${PN}
  systemd: install udev.pc
  libinput: fix udevdir
  ofono: remove duplicated udev setting from FILES_${PN}
  mdadm: remove duplicated udev setting from FILES_${PN}
  xf86-input-vmmouse: remove duplicated udev setting from FILES_${PN}
  eudev: don't move udev directory
  pcmciautils: remove duplicated udev setting from FILES_${PN}
  bluez5: remove duplicated udev setting from FILES_${PN}

 meta/conf/bitbake.conf                                         |  3 ++-
 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb                |  2 --
 meta/recipes-connectivity/bluez5/bluez5.inc                    |  2 +-
 meta/recipes-connectivity/ofono/ofono.inc                      |  2 +-
 meta/recipes-core/systemd/systemd_230.bb                       |  2 ++
 meta/recipes-core/udev/eudev_3.2.bb                            | 10 +---------
 meta/recipes-extended/mdadm/mdadm_3.4.bb                       |  2 --
 meta/recipes-graphics/wayland/libinput_1.3.0.bb                |  4 +++-
 meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.1.0.bb |  2 +-
 9 files changed, 11 insertions(+), 18 deletions(-)

-- 
2.9.0


