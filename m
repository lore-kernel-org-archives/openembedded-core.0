Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1TE30D-0008JO-Vk
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 20:58:34 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Sep 2012 11:45:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,444,1344236400"; d="scan'208";a="207237159"
Received: from jlbirch-mobl1.amr.corp.intel.com (HELO localhost)
	([10.7.199.154])
	by orsmga002.jf.intel.com with ESMTP; 18 Sep 2012 11:45:52 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org, Saul Wold <sgw@linux.intel.com>
Date: Tue, 18 Sep 2012 11:45:13 -0700
Message-Id: <cover.1347993827.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
Subject: [PATCH 0/1] mkefidisk.sh: Add script to do an EFI install on the host
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
X-List-Received-Date: Tue, 18 Sep 2012 18:58:34 -0000

The following changes since commit 7887b99646d8e1e736ad6e4a306e47df9955221e:

  local.conf.sample: change valgrind support architecture comment (2012-09-14 17:05:59 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/user-contrib/dvhart/oe-core dvhart/efidisk
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=dvhart/efidisk

Darren Hart (1):
  mkefidisk.sh: Add script to do an EFI install on the host

 scripts/contrib/mkefidisk.sh | 255 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 255 insertions(+)
 create mode 100755 scripts/contrib/mkefidisk.sh

-- 
1.7.11.4



