Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A3F706E78E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 09:42:02 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Mar 2014 02:42:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,646,1389772800"; d="scan'208";a="497621586"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 13 Mar 2014 02:42:02 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Mar 2014 11:45:10 +0200
Message-Id: <cover.1394703743.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/2] Add new comm tools to testapps
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
X-List-Received-Date: Thu, 13 Mar 2014 09:42:05 -0000

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

 .../packagegroups/packagegroup-core-tools-testapps.bb            | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
1.8.3.2


