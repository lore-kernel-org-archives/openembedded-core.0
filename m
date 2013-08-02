Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F1F7B60667
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 07:52:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r727ql43003375
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Aug 2013 00:52:48 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 2 Aug 2013 00:52:45 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Aug 2013 15:52:55 +0800
Message-ID: <cover.1375429844.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH 0/4] fix bashism for a few scripts
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
X-List-Received-Date: Fri, 02 Aug 2013 07:52:46 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

I used the checkbashism command to check our OE repo.
This patchset fixes the auto-detected bashism.

The following changes since commit bd1c441a210cae03fb6006c996227211cc29056b:

  bitbake: bitbake: runqueue: add warning if invalidating invalid task (2013-07-29 15:25:09 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/fix-bashism
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/fix-bashism

Chen Qi (4):
  scripts/contrib/mkefidisk.sh: fix bashism
  qtdemo-init: fix bashism
  xtscal: fix bashism
  initramfs-framework: fix bashism

 .../initrdscripts/initramfs-framework/finish       |    5 +++--
 .../initrdscripts/initramfs-framework/init         |   13 +++++++------
 .../xtscal/xtscal/30xTs_Calibrate.sh               |    2 +-
 meta/recipes-qt/qt-demo/qt-demo-init/qtdemo-init   |    8 ++++----
 scripts/contrib/mkefidisk.sh                       |    8 ++++----
 5 files changed, 19 insertions(+), 17 deletions(-)

-- 
1.7.9.5


