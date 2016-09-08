Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B38717732E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 10:26:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u88AQna2002832
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Sep 2016 03:26:49 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 8 Sep 2016 03:26:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Sep 2016 03:26:47 -0700
Message-ID: <cover.1473330368.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/1] qemu: 2.6.0 -> 2.7.0
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
X-List-Received-Date: Thu, 08 Sep 2016 10:26:49 -0000
Content-Type: text/plain

The following changes since commit 872a83be6e86005f6426c90073ece56de4534ac0:

  linux-yocto/4.4/4.8: uvesafb: provide option to specify timeout for task completion (2016-09-08 08:25:03 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/qemu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/qemu

Robert Yang (1):
  qemu: 2.6.0 -> 2.7.0

 .../qemu/0001-configure-support-vte-2.91.patch     | 79 ----------------------
 .../qemu/qemu/add-ptest-in-makefile.patch          | 19 +++---
 .../qemu/{qemu_2.6.0.bb => qemu_2.7.0.bb}          |  5 +-
 3 files changed, 11 insertions(+), 92 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-configure-support-vte-2.91.patch
 rename meta/recipes-devtools/qemu/{qemu_2.6.0.bb => qemu_2.7.0.bb} (79%)

-- 
2.9.0


