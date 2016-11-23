Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3691171987
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 03:17:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAN3HdVx003050
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 22 Nov 2016 19:17:39 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 22 Nov 2016 19:17:39 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 22 Nov 2016 22:17:36 -0500
Message-ID: <cover.1479871002.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/1] grub/grub-efi: fix conflict
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
X-List-Received-Date: Wed, 23 Nov 2016 03:17:40 -0000
Content-Type: text/plain

The following changes since commit 43e652f3d1fee5ce7fad67e6400315eab1b34270:

  devtool: add "rename" subcommand (2016-11-07 11:04:22 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/fix-grub
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/fix-grub

Hongxu Jia (1):
  grub/grub-efi: fix conflict

 meta/recipes-bsp/grub/grub-efi_2.00.bb | 12 +++++++++---
 meta/recipes-bsp/grub/grub2.inc        |  4 ----
 meta/recipes-bsp/grub/grub_2.00.bb     | 18 +++++++++++-------
 3 files changed, 20 insertions(+), 14 deletions(-)

-- 
2.8.1


