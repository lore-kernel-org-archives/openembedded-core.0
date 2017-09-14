Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B816B7856E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 09:13:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8E9DJbY029281
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 02:13:19 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 14 Sep 2017 02:13:18 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Sep 2017 02:13:16 -0700
Message-ID: <cover.1505380364.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 0/2] fix e2fsprogs and systemd-machine-units
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
X-List-Received-Date: Thu, 14 Sep 2017 09:13:18 -0000
Content-Type: text/plain

The following changes since commit 7b501954198c2a810b2c03096accb27339cfd1f9:

  runqemu: let qemuparams override previous settings (2017-09-14 02:11:35 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/2fixes
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/2fixes

Robert Yang (2):
  e2fsprogs: set dir's mode correctly
  systemd-machine-units: update LIC_FILES_CHKSUM

 .../systemd/systemd-machine-units_1.0.bb           |  2 +-
 ...c-create_inode.c-set-dir-s-mode-correctly.patch | 41 ++++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb |  1 +
 3 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-set-dir-s-mode-correctly.patch

-- 
2.10.2


