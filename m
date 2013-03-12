Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1UFXr0-0004TI-VK
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 23:39:31 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 12 Mar 2013 15:22:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,833,1355126400"; d="scan'208";a="213632525"
Received: from unknown (HELO localhost) ([10.255.12.139])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Mar 2013 15:22:44 -0700
From: tom.zanussi@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Mar 2013 17:22:40 -0500
Message-Id: <cover.1363126772.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/1] Bump perf epoch
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
X-List-Received-Date: Tue, 12 Mar 2013 22:39:32 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

The perf renaming patch essentially changed version backwards to 1.0 from 3.4,
which was unintended.  This patch bumps the epoch so we can keep the recipe
name versionless.

The following changes since commit 4da406cd50cf02a63ed76810a670aba1eb561c79:

  gst-plugins-gl: allow empty packages (2013-03-12 18:33:30 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/bump-perf-epoch
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/bump-perf-epoch

Tom Zanussi (1):
  perf: bump PE

 meta/recipes-kernel/perf/perf.bb | 1 +
 1 file changed, 1 insertion(+)

-- 
1.7.11.4



