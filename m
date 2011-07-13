Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QgpBk-0003D5-6k
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 04:28:36 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2011 19:24:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,523,1304319600"; d="scan'208";a="27001814"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.13.215])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2011 19:24:37 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 19:24:29 -0700
Message-Id: <cover.1310523561.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] Quieten network connectivity check
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
X-List-Received-Date: Wed, 13 Jul 2011 02:28:36 -0000

The network sanity check is quite noisy atm, this patch addresses the noise
of complaining about checksums for the non scm sources.

I still need to work out a clean way to quieten the info messages that the
fetch is running, i.e.

 NOTE: fetch http://autobuilder.yoctoproject.org/sources/git2_git.yoctoproject.org.yocto-firewall-test.tar.gz
 NOTE: fetch https://eula-downloads.yoctoproject.org/index.php
 NOTE: fetch http://bugzilla.yoctoproject.org/report.cgi

Ideas welcome ;-)

The following changes since commit a6e9edb7b4b5b0bdb067a59d691d33fba8948963:

  sato-sdk: add clutter for sato-sdk image (2011-07-12 15:23:35 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/sanity
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/sanity

Joshua Lock (1):
  sanity: don't warn about SRC_URI checksums for connectivity test uris

 meta/classes/sanity.bbclass |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

-- 
1.7.6



