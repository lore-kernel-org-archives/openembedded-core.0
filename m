Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B928477CF9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 09:21:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3B9LVBk028327
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 02:21:32 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 11 Apr 2017 02:21:31 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Apr 2017 02:21:24 -0700
Message-ID: <cover.1491902179.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
MIME-Version: 1.0
Subject: [PATCH 0/7 V3] fixes for runqemu
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
X-List-Received-Date: Tue, 11 Apr 2017 09:21:36 -0000
Content-Type: text/plain

* V3:
  - Fixed wic's test cases.
  - Remove Qi's patch since it was broken, and there are other solutions in the
    mailing list:
    http://lists.openembedded.org/pipermail/openembedded-core/2017-April/135464.html

* V2:
  - Fixed "ERROR - name 'p' is not defined"
  - Add Qi's patch.

// Robert

The following changes since commit ec2931852b2a097c9c8cb0d7288f5ca1d79f401c:

  Revert "staging: Fix sysroot problem with populate_sysroot dependencies on do_fetch" (2017-04-11 00:56:58 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/qemu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/qemu

Robert Yang (7):
  runqemu: support env vars explicitly
  runqemu: use self.rootfs to replace self.nfs_dir
  runqemu: run without arguments
  runqemu: do not rely on grepping images
  selftest/wic.py: vda -> sda
  wic-image-minimal.wks: vda -> sda
  qemux86-directdisk.wks: vda -> sda

 .../recipes-test/images/wic-image-minimal.wks      |   8 +-
 meta/classes/qemuboot.bbclass                      |   3 +
 meta/lib/oeqa/selftest/wic.py                      |   6 +-
 scripts/lib/wic/canned-wks/qemux86-directdisk.wks  |   2 +-
 scripts/runqemu                                    | 122 ++++++++++++---------
 5 files changed, 79 insertions(+), 62 deletions(-)

-- 
2.11.0.rc2.dirty


