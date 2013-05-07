Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1UZiFl-0003A5-JF
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 15:48:44 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 May 2013 06:30:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,628,1363158000"; d="scan'208";a="333863348"
Received: from unknown (HELO localhost) ([10.255.12.242])
	by fmsmga002.fm.intel.com with ESMTP; 07 May 2013 06:30:02 -0700
From: tom.zanussi@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 08:30:00 -0500
Message-Id: <cover.1367933207.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/1] squelch kernel.bblass QA warning
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
X-List-Received-Date: Tue, 07 May 2013 13:48:49 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

This fixes QA warnings I'm seeing when building a 'traditional'
kernel recipe.

Please pull into both master and dylan.

The following changes since commit 9895d2c074156fee338d91aed7cfb0800477c622:

  maintainers.inc: update sbc pkg maintainer (2013-05-07 13:58:26 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/traditional-qawarn-fix
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/traditional-qawarn-fix

Tom Zanussi (1):
  kernel.bbclass: make FILES package-specific

 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.11.4



