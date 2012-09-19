Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TEGnN-0002AF-Hh
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 11:42:13 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Sep 2012 02:29:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,447,1344236400"; d="scan'208";a="194452728"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.32])
	by azsmga001.ch.intel.com with ESMTP; 19 Sep 2012 02:29:30 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2012 12:32:38 +0300
Message-Id: <cover.1348046845.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1]insane.bbclass: add library dir sanity check
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
X-List-Received-Date: Wed, 19 Sep 2012 09:42:13 -0000

    Check in ${PKGD} for libraries in wrong locations.
    Trigger a warning if so.
    Eg. Catch recipe installing /lib/bar.so when ${base_libdir}="lib32"
    or installing in /usr/lib64 when ${libdir}="/usr/lib"

The following changes since commit 7887b99646d8e1e736ad6e4a306e47df9955221e:

  local.conf.sample: change valgrind support architecture comment (2012-09-14 17:05:59 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib rmoisan/tmp1
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rmoisan/tmp1

Radu Moisan (1):
  insane.bbclass: add library dir sanity check

 meta/classes/insane.bbclass |   39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

-- 
1.7.9.5



