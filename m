Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6388D660F9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 10:40:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4FAe2e0000665
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 03:40:02 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 15 May 2014 03:40:00 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 May 2014 18:40:22 +0800
Message-ID: <cover.1400150280.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/3] live image misc fixes
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
X-List-Received-Date: Thu, 15 May 2014 10:40:05 -0000
Content-Type: text/plain

The purpose of this patchset is to make our live image work correctly after the
following commit.

    commit acfe3014d41de5e87cdbc58d0396349c6b9c3ffd
    udev-extraconf: update mount.sh to use /run/media instead of /media

These patches are tested against the core-image-minimal iso image for both booting and installing.

//Chen Qi


The following changes since commit 58417093d7ce83c8a2f683a356fddc23aaee5e8e:

  wic: Extend indirect string connection to support image names and rootfs (2014-05-13 19:35:06 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/live-image-misc-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/live-image-misc-fixes

Chen Qi (3):
  udev-extraconf: fix the misuse of /run/media
  init-live.sh: list block devices correctly
  initrdscripts: fix for /run/media

 .../initrdscripts/files/init-install-efi-testfs.sh |   14 +++++++-------
 .../initrdscripts/files/init-install-efi.sh        |   14 +++++++-------
 .../initrdscripts/files/init-install-testfs.sh     |    4 ++--
 .../initrdscripts/files/init-install.sh            |    4 ++--
 meta/recipes-core/initrdscripts/files/init-live.sh |   20 ++++++++++----------
 meta/recipes-core/udev/udev-extraconf/mount.sh     |    2 +-
 6 files changed, 29 insertions(+), 29 deletions(-)

-- 
1.7.9.5


