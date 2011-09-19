Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1R5Uio-0006fQ-Ph
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 05:40:43 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Sep 2011 20:35:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,403,1312182000"; d="scan'208";a="50248315"
Received: from unknown (HELO [10.255.14.162]) ([10.255.14.162])
	by azsmga001.ch.intel.com with ESMTP; 18 Sep 2011 20:35:23 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Sep 2011 22:35:08 -0500
Message-ID: <1316403308.2404.13.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: [PATCH 0/2] blktrace, sysprof updates
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
X-List-Received-Date: Mon, 19 Sep 2011 03:40:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This patchset updates the blktrace and sysprof recipes.

Tom Zanussi (2):
  blktrace: update to version 1.0.3
  sysprof: update to version 1.1.8

 .../blktrace/dso_linking_change_build_fix.patch    |   26 --------------------
 meta/recipes-kernel/blktrace/blktrace_git.bb       |   12 +++------
 meta/recipes-kernel/sysprof/sysprof_git.bb         |    9 ++----
 3 files changed, 7 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-kernel/blktrace/blktrace/dso_linking_change_build_fix.patch





