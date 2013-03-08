Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1UDlay-0002nN-VK
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 01:55:38 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 Mar 2013 16:39:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,804,1355126400"; d="scan'208";a="266410940"
Received: from unknown (HELO localhost) ([10.255.13.90])
	by azsmga001.ch.intel.com with ESMTP; 07 Mar 2013 16:39:00 -0800
From: tom.zanussi@linux.intel.com
To: openembedded-core@lists.openembedded.org, bruce.ashfield@windriver.com,
	dvhart@linux.intel.com
Date: Thu,  7 Mar 2013 18:38:57 -0600
Message-Id: <cover.1362702690.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/2] perf recipe update
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
X-List-Received-Date: Fri, 08 Mar 2013 00:55:55 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

With the 3.8 kernel update, we need a new perf recipe to match.   Well,
not really, because there's nothing 3.4-specific about the current one,
and there's nothing tying it to a specific version of the kernel.

This acknowledges that by getting rid fo the version number.  It also
adds a minor cleanup to rename the current include file to something
more appropriate.

The following changes since commit d823759b4594143d522eae0b2a2498436a6dcb1e:

  core-image.bbclass: support read-only rootfs (2013-03-07 11:20:02 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/rename-perf-v0
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/rename-perf-v0

Tom Zanussi (2):
  perf: rename perf.inc to perf-features.inc
  perf: rename perf_3.4 to perf

 meta/recipes-kernel/perf/{perf.inc => perf-features.inc} | 0
 meta/recipes-kernel/perf/{perf_3.4.bb => perf.bb}        | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/perf/{perf.inc => perf-features.inc} (100%)
 rename meta/recipes-kernel/perf/{perf_3.4.bb => perf.bb} (99%)

-- 
1.7.11.4



