Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QwrFn-00012B-H6
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 09:55:03 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Aug 2011 00:50:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="42138496"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga002.jf.intel.com with ESMTP; 26 Aug 2011 00:50:13 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2011 15:52:19 +0800
Message-Id: <cover.1314344548.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/5 v2][PULL] multilib: various fixes related with login, postinst, etc
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
X-List-Received-Date: Fri, 26 Aug 2011 07:55:03 -0000

Hi Richard,

This pull request contains several multilib fixes addressing issues like
login failure, missing init/postinst/postrm scripts, missing package files, etc.

Please help to review and pull.

Chages from v1:
Add a new patch that adds renaming logic for INITSCRIPT related variables, which
fixes the issue of no response of mouse/keyboard in multilib sato image.

With those fixes, pure multilib sato image lib64-core-image-sato works fine with
my current testings.

Thanks,
Dongxiao

The following changes since commit 81aa4bfbde871af1d569b64499c34a315bf6218e:

  classes/sanity: enhance the network connectivity test (2011-08-25 08:49:12 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/ml
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/ml

Dongxiao Xu (5):
  base-passwd: Use BPN in FILES paths
  bitbake.conf: Use BPN in FILES paths
  multilib.bbclass: Fix renaming logic for "FILES_", "RDEPENDS_", etc
  multilib.bbclass: add "pkg_postinst" and "pkg_postrm" as renaming
    elements
  multilib.bbclass: add renaming for INITSCRIPT related variables

 meta/classes/multilib.bbclass                      |   19 +++++++++----------
 meta/conf/bitbake.conf                             |    4 ++--
 .../recipes-core/base-passwd/base-passwd_3.5.22.bb |   10 +++++-----
 3 files changed, 16 insertions(+), 17 deletions(-)



