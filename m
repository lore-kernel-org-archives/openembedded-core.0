Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B9F4172F50
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 06:41:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v366fdrw005385
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Apr 2017 23:41:39 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 5 Apr 2017 23:41:38 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Apr 2017 23:41:32 -0700
Message-ID: <cover.1491460816.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
MIME-Version: 1.0
Subject: [PATCH 0/6] fixes for runqemu
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
X-List-Received-Date: Thu, 06 Apr 2017 06:41:39 -0000
Content-Type: text/plain

The following changes since commit 3a1cce659156ef2654a55a6e3c6922fa2dc780e4:

  glibc: fix nativesdk ldd RTLDLIST (2017-04-05 23:22:06 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/qemu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/qemu

Robert Yang (6):
  runqemu: fix 2 typos
  runqemu: support env vars explicitly
  runqemu: use self.rootfs to replace self.nfs_dir
  runqemu: run without arguments
  runqemu: use realpath for imgdir
  runqemu: do not rely on grepping images

 meta/classes/qemuboot.bbclass |   3 +
 scripts/runqemu               | 130 +++++++++++++++++++++++-------------------
 2 files changed, 75 insertions(+), 58 deletions(-)

-- 
2.11.0.rc2.dirty


