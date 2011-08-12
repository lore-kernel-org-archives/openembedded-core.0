Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QrfOQ-0006py-Ar
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 02:14:30 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Aug 2011 17:09:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,359,1309762800"; d="scan'208";a="40701215"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.248])
	by fmsmga001.fm.intel.com with ESMTP; 11 Aug 2011 17:09:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 17:09:50 -0700
Message-Id: <cover.1313107646.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/1] fix RPM rootfs issue for ATTEMPTONLY
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
X-List-Received-Date: Fri, 12 Aug 2011 00:14:30 -0000

Richard:

This issue was introduced with the recent IMAGE_FEATURES changes, 
since the ATTEMPTONLY was not really being used it had not been updated 
for some of the MultiLib changes, this fixes that situation.

Thanks
	Sau!

The following changes since commit a92d56058b21913570bb17ae416c3b00afce055e:

  gnome-doc-utils: respect python-dir setting EXTRA_OECONF (2011-08-11 19:13:38 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (1):
  package_rpm: fix up attemptonly code

 meta/classes/package_rpm.bbclass |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

-- 
1.7.3.4



