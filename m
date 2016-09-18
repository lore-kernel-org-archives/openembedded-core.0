Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 81301731B0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 07:39:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8I7dVAl006823
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 00:39:31 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 18 Sep 2016 00:39:30 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 18 Sep 2016 00:39:22 -0700
Message-ID: <cover.1474183984.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH V2 0/8] runqemu fixes
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
X-List-Received-Date: Sun, 18 Sep 2016 07:39:33 -0000
Content-Type: text/plain

The following changes since commit d77fe838ab7631a19e90ff4226f0712e54aa4e22:

  scripts: add tool to scan for bashisms recipe shell scripts (2016-09-16 15:19:31 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/rq
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/rq

Joshua Lock (6):
  runqemu: add guidance to resolve issues with missing files
  qemuboot: write the full kernel filename, not the link name
  runqemu: clarify an INFO message
  qemuboot: also write the kernel link name to the conf file
  runqemu: try symlinks when kernel or rootfs can't be found
  runqemu: work even if a *.qemuboot.conf isn't found

Robert Yang (2):
  runqemu: use OECORE_NATIVE_SYSROOT from sdk
  runqemu: improve finding of rootfs, kernel and dtb

 meta/classes/qemuboot.bbclass |  13 ++++-
 scripts/runqemu               | 108 ++++++++++++++++++++++++++++++------------
 2 files changed, 90 insertions(+), 31 deletions(-)

-- 
2.9.0


