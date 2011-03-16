Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1PzuwG-0005AD-Ls
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 18:55:17 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Mar 2011 10:52:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,195,1299484800"; d="scan'208";a="667971751"
Received: from unknown (HELO helios) ([10.255.12.144])
	by fmsmga002.fm.intel.com with SMTP; 16 Mar 2011 10:52:22 -0700
Received: by helios (sSMTP sendmail emulation); Wed, 16 Mar 2011 17:52:21 +0000
Message-Id: <cover.1300297594.git.paul.eggleton@linux.intel.com>
Old-Date: Wed, 16 Mar 2011 17:46:34 +0000
Date: Wed, 16 Mar 2011 17:52:21 +0000
To: openembedded-core@lists.openembedded.org
CC: 
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 0/1] check bitbake wrapper/pseudo functionality
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
X-List-Received-Date: Wed, 16 Mar 2011 17:55:17 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

This patch detects basic problems with the bitbake wrapper and pseudo.

(previously sent to poky@yoctoproject.org, forgot to CC)

Fixes [YOCTO #653]

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: paule/master-pseudo-sanity
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=paule/master-pseudo-sanity

Thanks,
    Paul Eggleton <paul.eggleton@linux.intel.com>
---


Paul Eggleton (1):
  sanity: detect if bitbake wrapper is not being used or pseudo is
    broken

 meta/classes/sanity.bbclass |   25 ++++++++++++++++++++++++-
 scripts/bitbake             |    3 +++
 scripts/poky-env-internal   |    2 +-
 3 files changed, 28 insertions(+), 2 deletions(-)



