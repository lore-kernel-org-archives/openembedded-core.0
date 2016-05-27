Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C4CF873219
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 14:32:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4REWOTU029030
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 27 May 2016 07:32:24 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 27 May 2016 07:32:23 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 27 May 2016 10:32:19 -0400
Message-ID: <cover.1464359230.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: tom.zanussi@intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 0/3 v2] linux-yocto: linux-yocto: intel staging and bxt backports
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
X-List-Received-Date: Fri, 27 May 2016 14:32:30 -0000
Content-Type: text/plain

Hi all,

This pull request superceeds my other request by the same subject.
The only difference is that I now have a 3rd patch from Tom, that reverts
the branch name change for generic/qemux86*, since we didn't intend for
them to use the intel staging branches.

Cheers,

Bruce

The following changes since commit 2718e843b3502afa1e21510bb6b9c4720f75124c:

  yocto-bsps: update to 4.4.11 (2016-05-26 11:34:14 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto:4.4: broxton backports
  linux-yocto: create intel branches
  linux-yocto: only use intel branches for optimized platforms

 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 18 +++++++++---------
 6 files changed, 17 insertions(+), 17 deletions(-)

-- 
2.5.0


