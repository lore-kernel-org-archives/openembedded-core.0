Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DA8AF6FFED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 07:35:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uAT7Zoo0023802
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Nov 2016 23:35:50 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 28 Nov 2016 23:35:49 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Nov 2016 23:35:44 -0800
Message-ID: <cover.1480404884.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/5] runqemu: fixes for cpio.gz, nfs and slirp
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
X-List-Received-Date: Tue, 29 Nov 2016 07:35:52 -0000
Content-Type: text/plain

The following changes since commit af280990bff4a484fd8a18e3442b56a0a39b7611:

  Revert "classes/populate_sdk_ext: require uninative" (2016-11-28 14:49:37 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/qemu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/qemu

Robert Yang (5):
  runqemu: fix checking for <file>.cpio.gz
  qemuboot.bbclass: use IMGDEPLOYDIR
  runqemu-export-rootfs: fix inconsistent var names
  runqemu: support mutiple qemus running when nfs
  runqemu: set default device and hostfwd for slirp

 meta/classes/qemuboot.bbclass              |   5 +-
 meta/conf/machine/include/qemuboot-x86.inc |   1 -
 meta/conf/machine/qemuarm64.conf           |   1 -
 scripts/runqemu                            | 111 ++++++++++++++++++++++-------
 scripts/runqemu-export-rootfs              |  21 +++---
 5 files changed, 96 insertions(+), 43 deletions(-)

-- 
2.9.0


