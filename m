Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0333465CBB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 09:14:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u319Ek2F011529
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Apr 2016 02:14:46 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 1 Apr 2016 02:14:46 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Apr 2016 02:14:43 -0700
Message-ID: <cover.1459502011.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
MIME-Version: 1.0
Subject: [PATCH 0/3] Fixes for grub EFI
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
X-List-Received-Date: Fri, 01 Apr 2016 09:14:47 -0000
Content-Type: text/plain

The following changes since commit 322904f62f11e794543362f04212242567c556a0:

  selftest/signing: Use packagedata to obtain PR value for signing test (2016-03-31 23:55:13 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/efi
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=19f9e2e1bf005d885453ec2d5ead37de78c6bd0c

Robert Yang (3):
  init-install.sh: fix disk_size
  init-install-efi.sh: remove all root=foo from grub.cfg
  grub-efi.bbclass: don't use APPEND

 meta/classes/grub-efi.bbclass                                | 12 ++++++------
 .../initrdscripts/files/init-install-efi-testfs.sh           |  2 +-
 meta/recipes-core/initrdscripts/files/init-install-efi.sh    |  4 ++--
 meta/recipes-core/initrdscripts/files/init-install.sh        |  2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.8.0


