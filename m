Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 29AE877333
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 15:30:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v11FUbLp001498
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 1 Feb 2017 07:30:38 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 1 Feb 2017 07:30:37 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 1 Feb 2017 10:30:26 -0500
Message-ID: <cover.1485962567.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/10] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 01 Feb 2017 15:30:44 -0000
Content-Type: text/plain

Hi all,

Here is the next batch of kernel updates. These were gathered in preparation
for the removal of the 4.8 kernel and to make 4.9 the default/latest available.

I'll follow up with patches to make 4.9 the default to the appropriate lists.

Change summary:

  - stable updates
  - 4.9-rt refresh (via Paul Gortmaker)
  - kernel configuration tweaks.

  - I fixed the configuration warning that Martin Jansa reported in commit:

       [ kernel-yocto/meta: common-pc: add pci-siov to feature fragments ]

  - the kern-tools capability of merging feature branches at build time:

       [ kern-tools: re-enable scc merge command ]

   - Saul fixed and issue with kernel-devsrc packaging, and that fix will head
     upstream as well.

       [ ver_linux: Use /usr/bin/awk instead of /bin/awk ]

Cheers,

Bruce

The following changes since commit ec3d83f9a90288403b96be25da855fa280aadd8d:

  xmlto: Don't hardcode the path to tail (2017-01-31 23:47:33 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (10):
  linux-yocto/4.9: update to 4.9.4
  kernel-yocto/features: enable TPM
  kern-tools: re-enable scc merge command
  kernel-yocto: ecryptfs, NFC and CAN bus config updates
  ver_linux: Use /usr/bin/awk instead of /bin/awk
  linux-yocto/4.9: update to v4.9.6
  kernel-yocto/meta: common-pc: add pci-siov to feature fragments
  linux-yocto/4.9: update to -rt3
  kernel-yocto: log the BSP definition file
  linux-yocto/4.9: yaffs2 fixes

 meta/classes/kernel-yocto.bbclass                    | 17 ++++++++++++++++-
 .../kern-tools/kern-tools-native_git.bb              |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb      |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb      |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb    |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.8.bb         |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.9.bb         | 20 ++++++++++----------
 8 files changed, 36 insertions(+), 21 deletions(-)

-- 
2.5.0


