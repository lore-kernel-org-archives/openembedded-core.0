Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RWGan-00005F-Pq
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 01:03:05 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Dec 2011 15:56:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,281,1320652800"; d="scan'208";a="97666300"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.234])
	by fmsmga002.fm.intel.com with ESMTP; 01 Dec 2011 15:56:19 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2011 23:56:00 +0000
Message-Id: <cover.1322782677.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [RFC PATCH 0/2] introduce buildhistory.bbclass
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
X-List-Received-Date: Fri, 02 Dec 2011 00:03:06 -0000

Here is the initial version of buildhistory.bbclass. It provides (most
of) the functionality of testlab.bbclass and all functionality of
packagehistory.bbclass.

Changes/improvements over testlab:
* Supports both rpm and ipk-based images
* Works even if packaging data is removed in the final image
* File listing is tidier and excludes date/time info so changes are more
  obvious
* Produces a separate package list with just the package names (i.e. not
  the full file name).
* Optional git commit occurs at the end of the build and is done outside
  of fakeroot
* Can optionally push git commit to a remote repository

Todo items:
* There is no recording of licenses into the build history, in favour of
  Beth Flanagan's upcoming work on license.bbclass. I appreciate some may
  want this tracked in buildhistory - please comment. Could be something
  to add afterwards when Beth's work is integrated.
* Deb-based packaging is not supported because I am unable to test it
  (see Yocto bug #1802).

Note that an earlier version of this was merged accidentally to OE-core;
this was subsequently reverted to allow proper review.


Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

The following changes since commit e57935dc18d576feb1003b48e7cdc72a444131b8:

  Revert "classes/buildhistory: add new output history collection class" (2011-12-01 23:00:52 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory

Paul Eggleton (2):
  classes/buildhistory: add new output history collection class
  classes/buildhistory: merge in package history functionality

 meta/classes/buildhistory.bbclass |  359 +++++++++++++++++++++++++++++++++++++
 meta/classes/rootfs_ipk.bbclass   |   27 +++-
 meta/classes/rootfs_rpm.bbclass   |   41 ++++-
 3 files changed, 421 insertions(+), 6 deletions(-)
 create mode 100644 meta/classes/buildhistory.bbclass

-- 
1.7.5.4



