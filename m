Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U3kKD-0001Vf-QD
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 10:33:04 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 Feb 2013 01:16:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,628,1355126400"; d="scan'208";a="282550288"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.51])
	by orsmga002.jf.intel.com with ESMTP; 08 Feb 2013 01:16:53 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2013 09:16:50 +0000
Message-Id: <cover.1360314954.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/1] Minor Smart improvement
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
X-List-Received-Date: Fri, 08 Feb 2013 09:33:04 -0000

The following change since commit 688e9485980de0f29aa00e24ce53a3efd3a3a7cc:

  qemu.bbclass: fix segfaults when running through pseudo (2013-02-07 16:50:40 +0000)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/smart-yaml
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/smart-yaml

Paul Eggleton (1):
  python-smartpm: show friendly error if YAML output requested without
    PyYAML

 .../python/python-smartpm/smart-yaml-error.patch   |   86 ++++++++++++++++++++
 .../python/python-smartpm_1.4.1.bb                 |    1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-yaml-error.patch

-- 
1.7.10.4



