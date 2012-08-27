Received: from [192.55.52.88] (helo=mga01.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T66NL-0001EN-QP
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Aug 2012 22:57:36 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Aug 2012 13:45:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,322,1344236400"; d="scan'208";a="214562839"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.136])
	by fmsmga002.fm.intel.com with ESMTP; 27 Aug 2012 13:45:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Aug 2012 21:45:13 +0100
Message-Id: <cover.1346099015.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] Signature generation for bitbake-diffsigs
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
X-List-Received-Date: Mon, 27 Aug 2012 20:57:36 -0000

This is the OE-Core part of the changes for bitbake-diffsigs just posted
to the bitbake-devel mailing list.


The following change since commit 1677b736bca5dc46db522da1874459d2de77209d:

  terminal.py: use unique ids for screen sessions (2012-08-25 14:44:31 +0100)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/bbdiffsigs-oe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/bbdiffsigs-oe

Paul Eggleton (1):
  lib/oe/sstatesig.py: add signature data query function

 meta/lib/oe/sstatesig.py |   81 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

-- 
1.7.9.5



