Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1ShU8c-0001CV-N3
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 01:16:38 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id B0B9F30411
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 19:05:44 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2012 16:05:47 -0700
Message-Id: <cover.1340233133.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: B0B9F30411.1EB7B
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/6] denzil pull request 4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jun 2012 23:16:38 -0000

Hello,

This is the fourth pull request for the oe-core denzil branch, based on
a set of commits I've been testing from my sgarman/denzil-next branch.
At the time I'm composing this, my previous pull request hasn't been
merged yet, so I created this pull against my previous branch,
sgarman/denzil-next-pull3.

Once this branch gets merged, we will generate the first denzil release
candidate, which will undergo a full QA pass.

These commits have undergone the following testing on the autobuilder:

nightly:
http://autobuilder.yoctoproject.org:8010/builders/nightly/builds/521

nightly-multilib:
http://autobuilder.yoctoproject.org:8010/builders/nightly-multilib/builds/117

nightly-non-gpl3:
http://autobuilder.yoctoproject.org:8010/builders/nightly-non-gpl3/builds/118

nightly-tiny:
http://autobuilder.yoctoproject.org:8010/builders/nightly-tiny/builds/100

nightly-meta-intel (still finishing):
http://autobuilder.yoctoproject.org:8010/builders/nightly-meta-intel/builds/107

I'll note these tests were done with the poky-based tree.

Scott

The following changes since commit eedf8f8d9a7324b33dec71a5c52f8d980dc78752:

  eglibc: added ac_cv_path_ to CACHED_CONFIGUREVARS (2012-06-15 09:40:13 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgarman/denzil-next-testing
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgarman/denzil-next-pull4

Anders Darander (1):
  qt4-embedded: fix QT_ARCH usage in QT_CONFIG_FLAGS

Bruce Ashfield (5):
  linux-yocto/3.2: configuration and pch merge
  linux-yocto: intel BSP config changes
  linux-yocto: policy cleanups
  linux-yocto/3.2: update to v3.2.18
  linux-yocto/3.0: update to v3.0.32

 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb   |    6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.0.bb      |   16 ++++++++--------
 meta/recipes-kernel/linux/linux-yocto_3.2.bb      |   18 +++++++++---------
 meta/recipes-qt/qt4/qt4-embedded.inc              |    2 +-
 6 files changed, 28 insertions(+), 28 deletions(-)

-- 
1.7.9.5



