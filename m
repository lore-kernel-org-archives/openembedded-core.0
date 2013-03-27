Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1UKj0M-0002Vr-CL
	for Openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 06:34:37 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 26 Mar 2013 22:16:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,915,1355126400"; d="scan'208";a="312454414"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by fmsmga002.fm.intel.com with ESMTP; 26 Mar 2013 22:16:25 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org,
	elizabeth.flanagan@intel.com
Date: Tue, 26 Mar 2013 22:16:23 -0700
Message-Id: <cover.1364361172.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/1] fix a build issue for psplash recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Mar 2013 05:34:43 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This was detected on the autobuilder. More details are in the commit.

Thanks,
Nitin

The following changes since commit bdca49274173153b1b0a72887de6321b4756b684:

  classes/rm_work: rename RM_WORK_WHITELIST to RM_WORK_EXCLUDE (2013-03-26 21:19:51 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (1):
  psplash_git.bb: fix do_compile by correcting the script path

 meta/recipes-core/psplash/psplash_git.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

-- 
1.7.3.4



