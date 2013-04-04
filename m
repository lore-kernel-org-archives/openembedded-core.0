Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@intel.com>) id 1UNf6I-0002PL-Sr
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 10:00:56 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 04 Apr 2013 00:43:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,405,1363158000"; d="scan'208";a="222702045"
Received: from adamian-desktop.rb.intel.com ([10.237.105.55])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Apr 2013 00:43:35 -0700
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id 999B4560771; Thu,  4 Apr 2013 10:43:39 +0300 (EEST)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: richard.purdie@linuxfoundation.org, ross.burton@intel.com,
	openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2013 10:43:37 +0300
Message-Id: <1365061418-17214-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1365002436-5355-1-git-send-email-alexandru.damian@intel.com>
References: <1365002436-5355-1-git-send-email-alexandru.damian@intel.com>
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH v2] libproxy: add dependency on glib-2.0
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
X-List-Received-Date: Thu, 04 Apr 2013 08:01:06 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

libproxy uses glib-2.0, but the depends is missing

Fixes intermittent build errors.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/recipes-support/libproxy/libproxy_0.4.7.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libproxy/libproxy_0.4.7.bb b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
index 510c6b7..89f22b8 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.7.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7d7044444a7b1b116e8783edcdb44ff4 \
                     file://utils/proxy.c;beginline=1;endline=18;md5=55152a1006d7dafbef32baf9c30a99c0"
 
-DEPENDS = "gconf"
+DEPENDS = "gconf glib-2.0"
 
 PR = "r5"
 
-- 
1.7.10.4



