Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9EF196F81D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 11:09:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 13 Mar 2014 04:09:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,646,1389772800"; d="scan'208";a="491174227"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 13 Mar 2014 04:09:27 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Mar 2014 13:12:39 +0200
Message-Id: <cover.1394709053.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH v2 0/2] Add new comm tools to testapps
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Mar 2014 11:09:30 -0000

V2 removed wrong change of PR.

Add new tools related to connman and ofono into the
packagegroup-core-tools-testapps packagegroup.
Useful for investigating/debugging comm issues/features.

The following changes since commit 463cd34f8c17c67c4f3adf3468424730b22f3974:

  Create gstreamer-1.0 package groups (2014-03-12 06:15:09 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/tools-testapps
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/tools-testapps

Cristian Iorga (2):
  packagegroup-core-tools-testapp: added 3G tools
  packagegroup-core-tools-testapps: added connman tools and tests

 .../recipes-core/packagegroups/packagegroup-core-tools-testapps.bb | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
1.8.3.2


