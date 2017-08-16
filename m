Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6532571B32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 11:52:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7GBqd2u028941
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 04:52:39 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 16 Aug 2017 04:52:38 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Aug 2017 19:57:14 +0800
Message-ID: <cover.1502884438.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V4 0/4] Persistent /var/log support
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
X-List-Received-Date: Wed, 16 Aug 2017 11:52:38 -0000
Content-Type: text/plain

Changes since V3:
Rebased against latest master.

The following changes since commit 6016ec177af2406cacfeb3276dfcb8bfc3df8fce:

  poky.conf: Enable vulkan by default (2017-08-16 00:04:39 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/persistent-var-log
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/persistent-var-log

Chen Qi (4):
  bitbake.conf: add VOLATILE_LOG_DIR variable
  base-files: respect VOLATILE_LOG_DIR
  initscripts: support persistent /var/log
  package.bbclass: support persistent /var/log

 meta/classes/package.bbclass                       |  2 +-
 meta/conf/bitbake.conf                             |  4 ++
 meta/files/fs-perms-persistent-log.txt             | 66 ++++++++++++++++++++++
 meta/recipes-core/base-files/base-files_3.0.14.bb  |  4 +-
 .../initscripts/initscripts-1.0/volatiles          |  1 -
 meta/recipes-core/initscripts/initscripts_1.0.bb   |  3 +
 6 files changed, 76 insertions(+), 4 deletions(-)
 create mode 100644 meta/files/fs-perms-persistent-log.txt

-- 
1.9.1


