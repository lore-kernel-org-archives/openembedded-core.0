Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RisKI-0006B9-0K
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 19:46:11 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jan 2012 10:38:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="109151072"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.127])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jan 2012 10:38:42 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 10:38:35 -0800
Message-Id: <cover.1325788605.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/2] non-GPLv3 fixes
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
X-List-Received-Date: Thu, 05 Jan 2012 18:46:11 -0000

Richard,

Better commit messages.

These fixes are for the non-GPLv3 build

Sau!

The following changes since commit 563828bad19a242bba9ce3db461bb5807037dfdf:

  multilib: Abstract class extension code into classextend.py (2012-01-05 12:36:08 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (2):
  util-linux: Update patch for non-GPLv3
  gnutls: remove gettext patch for non-GPLv3

 .../util-linux-2.20.1/remove-lscpu.patch           |   94 +------------------
 meta/recipes-support/gnutls/gnutls_2.12.14.bb      |   13 ++-
 2 files changed, 15 insertions(+), 92 deletions(-)

-- 
1.7.6.4



