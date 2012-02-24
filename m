Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1S0lXe-0002j9-OH
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 04:09:54 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 23 Feb 2012 19:01:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="114293474"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.62])
	by orsmga002.jf.intel.com with ESMTP; 23 Feb 2012 19:01:31 -0800
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2012 11:00:36 +0800
Message-Id: <cover.1330051744.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] Added new variable BBINCLUDES
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
X-List-Received-Date: Fri, 24 Feb 2012 03:09:55 -0000

This patch added a new variable BBINCLUDES to show the file dependency 
information. This kind of information could be used by others, i.e. recipe 
editors. 

The following changes since commit a1f23a7cc527afdd1ce6cc7cd6083ee78fde09b3:
  Otavio Salvador (1):
        update-rc.d.bbclass: do nothing for extended cross packages

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/bbincludes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/bbincludes

Lianhao Lu (1):
  bitbake.conf: Added new variable BBINCLUDES

 meta/conf/bitbake.conf |    2 ++
 meta/lib/oe/utils.py   |    9 +++++++++
 2 files changed, 11 insertions(+), 0 deletions(-)



