Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1TGziY-0000K5-AK
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 00:04:30 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Sep 2012 14:51:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,492,1344236400"; d="scan'208";a="213873126"
Received: from envy.jf.intel.com (HELO envy) ([10.7.201.159])
	by orsmga002.jf.intel.com with ESMTP; 26 Sep 2012 14:51:38 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id q8QLoCvD027860;
	Wed, 26 Sep 2012 14:50:12 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q8QLoCC2027859;
	Wed, 26 Sep 2012 14:50:12 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Sep 2012 14:50:08 -0700
Message-Id: <4554f548bc1bf554a17dbae0250497010869b1d7.1348695851.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <c2df57712e4e2ce9e87121b063835f51e5a76d7c.1348695851.git.elizabeth.flanagan@intel.com>
References: <c2df57712e4e2ce9e87121b063835f51e5a76d7c.1348695851.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1348695851.git.elizabeth.flanagan@intel.com>
References: <cover.1348695851.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 2/3] bitbake.conf: parse license config
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
X-List-Received-Date: Wed, 26 Sep 2012 22:04:30 -0000

license.conf hasn't been being parsed. It probably should be.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/conf/bitbake.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 3496d2b..e168ef1 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -683,6 +683,7 @@ include conf/machine-sdk/${SDKMACHINE}.conf
 include conf/distro/${DISTRO}.conf
 include conf/distro/defaultsetup.conf
 include conf/documentation.conf
+include conf/licenses.conf
 require conf/sanity.conf
 
 ##################################################################
-- 
1.7.5.4



