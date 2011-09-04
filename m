Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1R04GL-0007Qa-Em
	for openembedded-core@lists.openembedded.org;
	Sun, 04 Sep 2011 06:24:54 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Sep 2011 21:18:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,326,1312182000"; d="scan'208";a="47948231"
Received: from unknown (HELO [10.255.14.13]) ([10.255.14.13])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2011 21:18:48 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 03 Sep 2011 23:18:29 -0500
Message-ID: <1315109909.31478.149.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: [PATCH 0/2][v2] systemtap: upgrade to 1.6
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
X-List-Received-Date: Sun, 04 Sep 2011 04:24:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This patchset upgrades systemtap to 1.6.  The 1.6 version of
systemtap also has inproved support for arm, so this enables
it for arm and adds it to qemuarm.

This upgrade was successfully tested on qemux86, qemux86-64,
qemuppc, and qemuarm.  The results and the tests can be found
at the end of the systemtap section on the yocto wiki:

[v2] changes: address feedback from Saul:
   PV changed, so update PR for systemtap recipe

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





