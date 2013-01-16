Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TvVIM-0005Ug-GH
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 16:53:04 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 Jan 2013 07:37:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,479,1355126400"; d="scan'208";a="244657696"
Received: from unknown (HELO localhost) ([10.255.14.217])
	by azsmga001.ch.intel.com with ESMTP; 16 Jan 2013 07:37:20 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org,
	martin.jansa@gmail.com
Date: Wed, 16 Jan 2013 09:37:18 -0600
Message-Id: <cover.1358350412.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.11.4
Subject: [PATCH 0/1] lttng PE bump
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
X-List-Received-Date: Wed, 16 Jan 2013 15:53:04 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

This fixes the problem reported by Martin Jansa, which is due to a missing PE
in the new lttng-ust recipe when it was renamed:

ERROR: Package version for package lttng-ust-dbg went backwards which would break package feeds from (1:0.16-r1 to 0:2.1.0-r0)
ERROR: Package version for package lttng-ust-staticdev went backwards which would break package feeds from (1:0.16-r1 to 0:2.1.0-r0)
ERROR: Package version for package lttng-ust-dev went backwards which would break package feeds from (1:0.16-r1 to 0:2.1.0-r0)
ERROR: Package version for package lttng-ust-doc went backwards which would break package feeds from (1:0.16-r1 to 0:2.1.0-r0)
ERROR: Package version for package lttng-ust-locale went backwards which would break package feeds from (1:0.16-r1 to 0:2.1.0-r0)
ERROR: Package version for package lttng-ust went backwards which would break package feeds from (1:0.16-r1 to 0:2.1.0-r0)

The following changes since commit 7bfb98568a1d7ba8dbd95332d65cd19faec6c725:

  bitbake: hig.py: refactor into individual components (2013-01-16 12:51:33 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/lttng-pe-bump
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/lttng-pe-bump

Tom Zanussi (1):
  lttng-ust: bump PE

 meta/recipes-kernel/lttng/lttng-ust_2.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

-- 
1.7.11.4



