Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mihaix.lindner@linux.intel.com>) id 1SzlOT-0004o0-OC
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Aug 2012 11:20:33 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Aug 2012 02:07:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,744,1336374000"; d="scan'208";a="184127623"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.232.205])
	by orsmga002.jf.intel.com with ESMTP; 10 Aug 2012 02:07:38 -0700
Received: from moolinex.rb.intel.com (qa.rb.intel.com [10.237.100.11])
	by linux.intel.com (Postfix) with ESMTP id AF5FE2C8001;
	Fri, 10 Aug 2012 02:07:38 -0700 (PDT)
From: Mihai Lindner <mihaix.lindner@linux.intel.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Aug 2012 12:07:34 +0300
Message-Id: <cover.1344589278.git.mihaix.lindner@linux.intel.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH 0/1] sysklogd: removed tabs from syslog.conf
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
X-List-Received-Date: Fri, 10 Aug 2012 09:20:34 -0000

Yocto #2926: syslog.conf should not have tabs within the selector field.
Removed tabs from the selector field of syslog rules. Tabs or spaces
should be used, in syslog.conf, only when separating selectors from
actions.

Signed-off-by: Mihai Lindner <mihaix.lindner@linux.intel.com>
---
The following changes since commit 2dec760b79bb7e2e79c33c5127fa64685bd86a18:

  foomatic: fix perl path for target (2012-08-08 10:06:00 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib ml/syslog.conf
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ml/syslog.conf

Mihai Lindner (1):
  sysklogd: removed tabs from syslog.conf

 meta/recipes-extended/sysklogd/files/syslog.conf |   23 +++++++++++----------
 meta/recipes-extended/sysklogd/sysklogd_1.5.bb   |    2 +-
 2 files changed, 13 insertions(+), 12 deletions(-)

-- 
1.7.8.6



