Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1SBEPP-0000WB-8Q
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 01:00:41 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 23 Mar 2012 16:51:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122644340"
Received: from unknown (HELO cenodoxus.amr.corp.intel.com) ([10.255.15.233])
	by azsmga001.ch.intel.com with ESMTP; 23 Mar 2012 16:51:41 -0700
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 16:51:38 -0700
Message-Id: <cover.1332546190.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/8] License Fixes.
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
X-List-Received-Date: Sat, 24 Mar 2012 00:00:42 -0000

This patchset covers three main topics. The first, and most important is how
INCOMPATIBLE_LICENSE deals with LICENSE naming variations and pkg level licensing.

We now have the ability to set the recipe level license to one that is inherited by
all packages as well as the ability to override the main license. This allows us to 
specify that some packages may have incompatible licenses or the recipe may be 
incompatible, but the package itself isn't. I've included an example of this in
util-license.

Also included are fixes to the last of the license warnings.

And lastly, I've corrected some whitespace within license.bbclass according to the
style guide. 

The following changes since commit 6c77a0f0fa0c97bfbe93f4a930a1549566a7f016:

  taglib: Refresh patch after recent accidental breakage (2012-03-23 18:36:20 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib eflanagan/incompatible_license
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/incompatible_license

Elizabeth Flanagan (8):
  license.bbclass: Add spdx mapping to GPL-1.0
  license.bbclass: Whitespace standardization
  INCOMPATIBLE_LICENSE: support for spdx and pkg licenses
  util-linux: Example of pkg level INCOMPATIBLE_LICENSE
  license.bbclass: Style guide compliance
  common-licenses: Adding GPL-2.0-with-OpenSSL-exception
  common-license: Add ICU generic
  setserial: Correct LICENSE

 meta/classes/base.bbclass                          |   40 +++-
 meta/classes/license.bbclass                       |  172 +++++++------
 meta/classes/package.bbclass                       |   17 +-
 .../common-licenses/GPL-2.0-with-OpenSSL-exception |  285 ++++++++++++++++++++
 meta/files/common-licenses/ICU                     |   13 +
 meta/recipes-bsp/setserial/setserial_2.17.bb       |    4 +-
 meta/recipes-core/util-linux/util-linux_2.21.bb    |   10 +-
 7 files changed, 440 insertions(+), 101 deletions(-)
 create mode 100644 meta/files/common-licenses/GPL-2.0-with-OpenSSL-exception
 create mode 100644 meta/files/common-licenses/ICU



