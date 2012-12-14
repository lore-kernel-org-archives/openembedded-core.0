Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1TjeZU-0003D9-9n
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Dec 2012 00:21:38 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Dec 2012 15:06:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,284,1355126400"; d="scan'208";a="234322300"
Received: from unknown (HELO localhost) ([10.255.13.198])
	by orsmga001.jf.intel.com with ESMTP; 14 Dec 2012 15:06:58 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	scott.a.garman@intel.com
Date: Fri, 14 Dec 2012 15:06:53 -0800
Message-Id: <cover.1355526236.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH 0/1][for-danny]bootimg: Use FAT 32 for images larger than 512MB
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
X-List-Received-Date: Fri, 14 Dec 2012 23:21:38 -0000

Please apply to danny (already in master).

The following changes since commit f609bf5525450bfdb8e0864d44c41cce7f9319c9:

  gdbm: Resolve host contamination issue (2012-10-10 22:44:51 +0100)

are available in the git repository at:

  git://git.infradead.org/users/dvhart/oe-core.git dvhart/danny/fixes
  http://git.infradead.org/users/dvhart/oe-core.git/shortlog/refs/heads/dvhart/danny/fixes

Darren Hart (1):
  bootimg: Use FAT 32 for images larger than 512MB

 meta/classes/bootimg.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
1.7.11.7



