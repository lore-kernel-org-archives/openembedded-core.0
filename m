Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1QziBd-0002XY-BL
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Sep 2011 06:50:33 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 02 Sep 2011 21:45:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,323,1312182000"; d="scan'208";a="13704582"
Received: from unknown (HELO [10.255.14.13]) ([10.255.14.13])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Sep 2011 21:45:34 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 02 Sep 2011 23:45:21 -0500
Message-ID: <1315025121.31478.140.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: [PATCH 0/2] systemtap: upgrade to 1.6
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
X-List-Received-Date: Sat, 03 Sep 2011 04:50:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This patchset upgrades systemtap to 1.6.  The 1.6 version of
systemtap also has improved support for arm, so this also
enables it for arm and adds it to qemuarm.

This upgrade was successfully tested on qemux86, qemux86-64,
qemuppc, qemuarm, and sugarbay.  The results and the tests
can be found at the end of the systemtap section on the yocto
wiki:

https://wiki.yoctoproject.org/wiki/Tracing_and_Profiling#systemtap

Tom Zanussi (2):
  systemtap: upgrade to 1.6
  task-core-tools: add systemtap to qemuarm

 meta/recipes-core/tasks/task-core-tools.bb         |    4 +-
 .../fix_for_compilation_with_gcc-4.6.0.patch       |  119
--------------------
 meta/recipes-kernel/systemtap/systemtap_git.bb     |   15 +--
 3 files changed, 9 insertions(+), 129 deletions(-)
 delete mode 100644
meta/recipes-kernel/systemtap/systemtap/fix_for_compilation_with_gcc-4.6.0.patch





