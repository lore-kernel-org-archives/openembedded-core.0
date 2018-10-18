Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 83CA279C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 16:10:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9IGADKG010984
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 09:10:13 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 18 Oct 2018 09:10:12 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Oct 2018 23:28:48 +0800
Message-ID: <cover.1539876421.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [PATCH 0/1] udev-hwdb: fix postinstall scripts failures when multilib enabled
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
X-List-Received-Date: Thu, 18 Oct 2018 16:10:12 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 4ef016683d986cc5291e494789ff5a49b28030eb:

  bitbake: test/data: Add new tests for task checksum changing/not changing (2018-10-18 10:59:27 +0100)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/udev
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/udev

Kai Kang (1):
  udev-hwdb: fix postinstall scripts failures when multilib enabled

 meta/recipes-core/systemd/systemd_239.bb     | 13 ++++++-------
 meta/recipes-core/udev/eudev_3.2.5.bb        | 11 +++++------
 scripts/postinst-intercepts/update_udev_hwdb |  6 ++++++
 3 files changed, 17 insertions(+), 13 deletions(-)
 create mode 100644 scripts/postinst-intercepts/update_udev_hwdb

-- 
2.18.0


