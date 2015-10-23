Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B6ADC759D5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 20:18:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9NKIYlt029322
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 23 Oct 2015 13:18:34 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 23 Oct 2015 13:18:34 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 23 Oct 2015 16:18:27 -0400
Message-ID: <cover.1445631234.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] linux-yocto: consolidated pull request
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
X-List-Received-Date: Fri, 23 Oct 2015 20:18:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi all,

Here is a slightly delayed consolidated pull request for the kernels, and
kernel tools. I've been fighting with boot issues, which have now been
resolved and were unrelated to this update.

I've avoided merging korg -stable updates for now to keep the kernel trees
consistent and not introduce any extra churn.

Everything I've included in this pull reques is either a bug fix to the
tools, or an addition of config/branches that won't impact existing users.

The tools fixes deal with an issue found with the yocto-bsp tool, and
another that Saul found when using a kernel-cache with a korg based tree.
I've run regression here, and everything looks sane.

Take what you think looks safe, and definitely feed it to the autobuilder
to see if I missed anything.

Cheers,

Bruce

The following changes since commit 505a82673ac2487df5ea343a6422c2fc47018831:

  build-appliance-image: Update to jethro head revision (2015-10-21 23:13:11 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  linux-yocto: axxia configuration updates
  linux-yocto/4.1: drm/i915: Fix the VBT child device parsing for BSW
  linux-yocto: nf_tables: Add nf_tables feature
  kern-tools: avoid duplicate .scc file processing
  linux-yocto: skip kernel meta data branches when finding machine
    branch
  linux-yocto/3.19: fix ARM boot with gcc5.x

 meta/classes/kernel-yocto.bbclass                      |  4 +++-
 .../recipes-kernel/kern-tools/kern-tools-native_git.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb       |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb        |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb     |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb      |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.14.bb          |  2 +-
 meta/recipes-kernel/linux/linux-yocto_3.19.bb          |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.1.bb           | 18 +++++++++---------
 9 files changed, 22 insertions(+), 20 deletions(-)

-- 
2.1.0


