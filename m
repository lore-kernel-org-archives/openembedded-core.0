Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 733336FFAB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 07:28:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6P7SY9S009107
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 00:28:34 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Jul 2016 00:28:34 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2016 00:28:27 -0700
Message-ID: <cover.1469431638.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/7] Fix udev dirs
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
X-List-Received-Date: Mon, 25 Jul 2016 07:28:36 -0000
Content-Type: text/plain

The following changes since commit 0a2df616a5c3316704742f1dcf37b450920e0280:

  boost: fix CVE-2012-2677 (2016-07-21 07:45:01 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/udev
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/udev

Robert Yang (7):
  bitbake.conf: add eudev's udevdir to FILES_${PN}
  systemd: install udev.pc
  libinput: fix udevdir
  ofono: remove duplicated udev setting from FILES_${PN}
  mdadm: remove duplicated udev setting from FILES_${PN}
  xf86-input-vmmouse: remove duplicated udev setting from FILES_${PN}
  eudev: don't move udev directory

 meta/conf/bitbake.conf                                         |  1 +
 meta/recipes-connectivity/ofono/ofono.inc                      |  2 +-
 meta/recipes-core/systemd/systemd_230.bb                       |  2 ++
 meta/recipes-core/udev/eudev_3.2.bb                            | 10 +---------
 meta/recipes-extended/mdadm/mdadm_3.4.bb                       |  2 --
 meta/recipes-graphics/wayland/libinput_1.3.0.bb                |  6 +++++-
 meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.1.0.bb |  2 +-
 7 files changed, 11 insertions(+), 14 deletions(-)

-- 
2.9.0


