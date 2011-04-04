Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Q6jue-0003G2-RR
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Apr 2011 15:33:50 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Apr 2011 06:31:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,297,1299484800"; d="scan'208";a="674972162"
Received: from unknown (HELO localhost) ([10.255.13.9])
	by fmsmga002.fm.intel.com with ESMTP; 04 Apr 2011 06:31:41 -0700
Message-Id: <cover.1301923706.git.josh@linux.intel.com>
Old-Date: Mon, 4 Apr 2011 14:28:26 +0100
Date: Mon, 04 Apr 2011 14:31:38 +0100
To: openembedded-core@lists.openembedded.org
CC: 
From: Joshua Lock <josh@linux.intel.com>
Subject: [PATCH 0/1] Clutter-1.6 fix
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
X-List-Received-Date: Mon, 04 Apr 2011 13:33:50 -0000

From: Joshua Lock <josh@linux.intel.com>

I found a couple of issues with the Clutter 1.6 recipes I submitted recently
which I've addressed in the attached patch.

As an aside I've noticed that we have a COMPATIBLE_MACHINE line in
clutter.inc, I think we're going to need to find a more suitable mechanism
for specifying compatible machines for this recipe set going forwards.

Any ideas? Perhaps some MACHINE_FEATURE which must exist for Clutter (and
other GL dependent recipes) to build?

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: josh/clutter
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/clutter

Thanks,
    Joshua Lock <josh@linux.intel.com>
---


Joshua Lock (1):
  clutter-1.6: fix tarball md5sum and add json-glib to dependencies

 meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

-- 
1.7.4.1



