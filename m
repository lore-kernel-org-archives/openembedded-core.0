Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QF7xj-0002Ty-5O
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 18:51:39 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Apr 2011 09:49:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,275,1301900400"; d="scan'208";a="739238445"
Received: from unknown (HELO helios) ([10.255.13.83])
	by orsmga001.jf.intel.com with SMTP; 27 Apr 2011 09:49:05 -0700
Received: by helios (sSMTP sendmail emulation); Wed, 27 Apr 2011 17:49:08 +0100
Message-Id: <cover.1303922644.git.paul.eggleton@linux.intel.com>
Old-Date: Wed, 27 Apr 2011 17:44:04 +0100
Date: Wed, 27 Apr 2011 17:49:08 +0100
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 0/1] initscripts: remove -i from halt/reboot arguments and allow override
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
X-List-Received-Date: Wed, 27 Apr 2011 16:51:39 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Removes -i from halt/reboot arguments to fix shutdown/reboot with NFS root,
and allows halt/reboot arguments to be overridden using a new HALTARGS
variable. Refer to bug [1] and discussion [2].

[1] http://bugzilla.pokylinux.org/show_bug.cgi?id=997
[2] https://lists.yoctoproject.org/pipermail/poky/2011-April/005395.html

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: paule/haltargs
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=paule/haltargs

Thanks,
    Paul Eggleton <paul.eggleton@linux.intel.com>
---


Paul Eggleton (1):
  initscripts: remove -i from halt/reboot arguments and allow override

 meta/recipes-core/initscripts/initscripts-1.0/halt |    2 +-
 .../initscripts/initscripts-1.0/reboot             |    2 +-
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    9 ++++++++-
 3 files changed, 10 insertions(+), 3 deletions(-)



