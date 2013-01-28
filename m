Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TzktC-0002lu-Gm
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 10:20:32 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0S94qdQ002169
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 01:04:52 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.328.9; Mon, 28 Jan 2013 01:04:50 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Jan 2013 17:05:04 +0800
Message-ID: <cover.1359362547.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/6] Readonly rootfs support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2013 09:20:32 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Use union mount to support read-only rootfs.

The following changes since commit b2869b6810728a5f003ddad335fd7f6512181a57:

  ref-manual: Added a general reference and link to kernel-dev (2013-01-27 13:56:06 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/readonly-rootfs-unionfs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/readonly-rootfs-unionfs

Chen Qi (6):
  sysvinit: add ROOTFS_READ_ONLY variable to rcS-default
  image.bbclass: add a hook funtion to support readonly rootfs
  core-image.bbclass: support read-only rootfs
  populate-volatile.sh: improve this script
  initscripts: let populate-volatile.sh create the /tmp link
  initscripts: add read-only-rootfs-hook.sh script

 meta/classes/core-image.bbclass                    |    4 +
 meta/classes/image.bbclass                         |   18 ++
 .../initscripts/initscripts-1.0/bootmisc.sh        |    9 +-
 .../initscripts-1.0/populate-volatile.sh           |  287 ++++++++++----------
 .../initscripts-1.0/read-only-rootfs-hook.sh       |   19 ++
 .../initscripts/initscripts-1.0/volatiles          |    1 +
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    3 +
 meta/recipes-core/sysvinit/sysvinit/rcS-default    |    4 +
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |    2 +-
 9 files changed, 194 insertions(+), 153 deletions(-)
 create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh

-- 
1.7.9.5



