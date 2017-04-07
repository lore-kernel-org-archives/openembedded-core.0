Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 53D2377CF1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 09:47:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v379lGuX021181
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Apr 2017 02:47:16 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 7 Apr 2017 02:47:15 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Apr 2017 02:47:07 -0700
Message-ID: <cover.1491557671.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
MIME-Version: 1.0
Subject: [PATCH 0/8 V2] fixes for runqemu and runqemu + rm_work
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
X-List-Received-Date: Fri, 07 Apr 2017 09:47:16 -0000
Content-Type: text/plain

* V2:
  - Fixed "ERROR - name 'p' is not defined"
  - Add Qi's patch.

// Robert

The following changes since commit 901659a51cd53625a93f57a9c5865e90a07ec09d:

  oeqa/runtime/utils/targetbuildproject: use parent classes defaults tmpdir (2017-04-06 10:13:34 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/qemu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/qemu

Chen Qi (2):
  qemuboot.bbclass: add two vars for use by runqemu
  runqemu: make use of two new vars

Robert Yang (6):
  runqemu: fix 2 typos
  runqemu: support env vars explicitly
  runqemu: use self.rootfs to replace self.nfs_dir
  runqemu: run without arguments
  runqemu: use realpath for imgdir
  runqemu: do not rely on grepping images

 meta/classes/qemuboot.bbclass |   8 ++-
 scripts/runqemu               | 140 ++++++++++++++++++++++++------------------
 2 files changed, 87 insertions(+), 61 deletions(-)

-- 
2.11.0.rc2.dirty


