Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3791F6A543
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 05:37:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r575bj8b027942
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Jun 2013 22:37:45 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.158) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 6 Jun 2013 22:37:45 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Jun 2013 13:37:43 +0800
Message-ID: <cover.1370583392.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] trace-cmd: backport three patches
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
X-List-Received-Date: Fri, 07 Jun 2013 05:37:45 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

The following changes since commit 8a2ac668d99f7d64c2acffc3a39cedb2d152be6e:

  lrzsz: check locale.h in configure (2013-06-04 15:53:45 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/trace-cmd
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/trace-cmd

Roy.Li (1):
  trace-cmd: backport three patches

 ...dd-checks-for-invalid-pointers-to-fix-seg.patch |   61 +++++++++++++
 ...o-not-call-stop_threads-if-doing-latency-.patch |   38 ++++++++
 ...etting-plugin-to-nop-clears-data-before-i.patch |   96 ++++++++++++++++++++
 meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb     |    8 +-
 4 files changed, 201 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch
 create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch
 create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch

-- 
1.7.10.4


