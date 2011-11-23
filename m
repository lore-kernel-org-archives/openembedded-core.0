Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RT1bG-00066J-C6
	for openembedded-core@openembedded.org; Wed, 23 Nov 2011 02:26:11 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Nov 2011 17:18:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,556,1315206000"; d="scan'208";a="88336247"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.15])
	by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2011 17:18:29 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 22 Nov 2011 17:18:21 -0800
Message-Id: <cover.1322008856.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/7] Distro Tracking and Patch Status
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
X-List-Received-Date: Wed, 23 Nov 2011 01:26:11 -0000

Richard,

This should be a pretty straight forward set of changes
to the distro_tracking_fields and patch Status Updates.

Please review and pull.

Thanks
	Sau!


The following changes since commit 381c7857a5b303bf9eadd7fffc39d17a2b8e31f2:

  matchbox-wm: Fix variable type in _NET_WORKAREA setting (2011-11-22 15:13:16 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/distro_track
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/distro_track

Nitin A Kamble (1):
  at: update the upstream-status of patches

Saul Wold (2):
  distro_tracking: Refect Recipe Updates & Status
  distro_tracking_fields: Update after Manual Check

Scott Garman (1):
  distro_tracking: update manual checks for various recipes

Shane Wang (3):
  distro_tracking: update manual checks for recipes
  distro_tracking: update manual checks for recipes
  distro_tracking: update manual checks for recipes

 .../conf/distro/include/distro_tracking_fields.inc |  183 ++++++++++++--------
 .../at/at-3.1.12/configure-add-enable-pam.patch    |    2 +
 .../at/files/file_replacement_with_gplv2.patch     |    2 +
 .../at/files/nonstripbinaries.patch                |    1 +
 meta/recipes-extended/at/files/use-ldflags.patch   |    2 +
 5 files changed, 120 insertions(+), 70 deletions(-)

-- 
1.7.5.4



