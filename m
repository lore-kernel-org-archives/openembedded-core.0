Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 49BB460670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 15:36:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4QFaBb5010875
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 26 May 2016 08:36:11 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 26 May 2016 08:36:10 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 26 May 2016 11:36:08 -0400
Message-ID: <cover.1464276666.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: tom.zanussi@intel.com, saul.wold@intel.com,
	openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] linux-yocto: intel staging and bxt backports
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
X-List-Received-Date: Thu, 26 May 2016 15:36:13 -0000
Content-Type: text/plain

Hi all,

We have a couple of patches to integrate broxton backports, and to
create some intel staging branches.

From the patch:
[
  To provide timely support for Intel platforms, without risking
  issues with other platforms, we create intel branches from the
  common variants.

  i.e. We now have standard/intel, which is from standard/base

  These branches will be managed like any other in the tree, and
  will get common -stable, -rt, bugs and CVE updates.
]

For the 4.4 tree, I had to rename standard/preempt-rt to standard/preempt-rt/base
to accomodate the new child branch. So until this is merged, there will be
a short window where the linux-yocto 4.4 repo and the KBRANCH in the
preempt-rt recipe disagree on the right name.

Cheers,

Bruce

The following changes since commit 2718e843b3502afa1e21510bb6b9c4720f75124c:

  yocto-bsps: update to 4.4.11 (2016-05-26 11:34:14 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  linux-yocto:4.4: broxton backports
  linux-yocto: create intel branches

 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 18 +++++++++---------
 6 files changed, 17 insertions(+), 17 deletions(-)

-- 
2.5.0


