Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2008D77087
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Apr 2016 09:58:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u339wPnL005520
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 3 Apr 2016 02:58:25 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 3 Apr 2016 02:58:24 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 3 Apr 2016 02:58:23 -0700
Message-ID: <cover.1459677330.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
MIME-Version: 1.0
Subject: [PATCH 0/1 V2] linux-yocto 4.4: enable overlayfs by default
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
X-List-Received-Date: Sun, 03 Apr 2016 09:58:27 -0000
Content-Type: text/plain

* V2
  Rebase the patch based on Bruce's recent changes on kernel.

* V1
  Initial version.

// Robert

The following changes since commit 322904f62f11e794543362f04212242567c556a0:

  selftest/signing: Use packagedata to obtain PR value for signing test (2016-03-31 23:55:13 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib 637f6783157bb0e9449d153133485401bcf2dbb1
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=637f6783157bb0e9449d153133485401bcf2dbb1

Robert Yang (1):
  linux-yocto 4.4: enable overlayfs by default

 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.8.0


