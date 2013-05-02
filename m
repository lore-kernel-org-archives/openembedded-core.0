Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jukka.rissanen@linux.intel.com>) id 1UXvDL-0002Eh-LX
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 17:14:36 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 May 2013 07:56:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,597,1363158000"; d="scan'208";a="296567906"
Received: from sorvi.fi.intel.com ([10.237.72.154])
	by azsmga001.ch.intel.com with ESMTP; 02 May 2013 07:56:36 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 May 2013 17:56:32 +0300
Message-Id: <1367506593-11381-3-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1367506593-11381-1-git-send-email-jukka.rissanen@linux.intel.com>
References: <1367506593-11381-1-git-send-email-jukka.rissanen@linux.intel.com>
Subject: [PATCH v2 2/3] neard: Use SRCREV instead of SRCPV
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
X-List-Received-Date: Thu, 02 May 2013 15:14:44 -0000
X-List-Received-Date: Thu, 02 May 2013 15:14:44 -0000


Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 meta/recipes-connectivity/neard/neard_0.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/neard/neard_0.10.bb b/meta/recipes-connectivity/neard/neard_0.10.bb
index dc43f7e..b9198af 100644
--- a/meta/recipes-connectivity/neard/neard_0.10.bb
+++ b/meta/recipes-connectivity/neard/neard_0.10.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
 
 S = "${WORKDIR}/git"
 SRCREV = "eb486bf35e24d7d1db61350f5ab393a0c880523d"
-PV = "0.10+git${SRCPV}"
+PV = "0.10+git${SRCREV}"
 PR = "r0"
 
 inherit autotools pkgconfig systemd update-rc.d
-- 
1.7.11.7



