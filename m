Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1T58Fi-0000KL-PI
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Aug 2012 06:45:42 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Aug 2012 21:33:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,309,1344236400"; d="scan'208";a="137711323"
Received: from unknown (HELO localhost) ([10.255.12.244])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Aug 2012 21:33:16 -0700
From: tom.zanussi@intel.com
To: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Date: Fri, 24 Aug 2012 23:32:41 -0500
Message-Id: <cover.1345867875.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.11.4
Subject: [PATCH 0/1] add ia32-base.inc
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
X-List-Received-Date: Sat, 25 Aug 2012 04:45:43 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

This adds ia32-base to meta/conf/machine/include.  See the following
link for details:

  https://bugzilla.yoctoproject.org/show_bug.cgi?id=2996

The following changes since commit 86a6410fcbfb43e74aa1c9c995a21129d8434f75:

  build-appliance-image: Add vmx* files and build zip file (2012-08-24 17:32:57 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/ia32-base-again.v1
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/ia32-base-again.v1

Tom Zanussi (1):
  ia32-base.inc: new include file

 meta/conf/machine/include/ia32-base.inc | 58 +++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 meta/conf/machine/include/ia32-base.inc

-- 
1.7.11.4



