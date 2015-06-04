Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 511D17580C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 18:41:29 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 04 Jun 2015 11:41:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,554,1427785200"; d="scan'208";a="737234176"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.173])
	by fmsmga002.fm.intel.com with ESMTP; 04 Jun 2015 11:41:29 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jun 2015 13:42:57 -0500
Message-Id: <07825c738353263369f428bd4db48ad230176dca.1433443273.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1433443273.git.anibal.limon@linux.intel.com>
References: <cover.1433443273.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1433443273.git.anibal.limon@linux.intel.com>
References: <cover.1433443273.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 2/4] distrodata: Remove unnecessary include of package_regex.inc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Jun 2015 18:41:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This causes a warning when follow documentation to use distrodata
class that points to include,

	include conf/distro/include/distro_alias.inc
	include conf/distro/include/recipe_color.inc
	include conf/distro/include/maintainers.inc
	include conf/distro/include/upstream_tracking.inc
	include conf/distro/include/package_regex.inc
	INHERIT+= "distrodata"

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/distrodata.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 83aa381..e1fc6dd 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -1,4 +1,3 @@
-include conf/distro/include/package_regex.inc
 addhandler distro_eventhandler
 distro_eventhandler[eventmask] = "bb.event.BuildStarted"
 python distro_eventhandler() {
-- 
1.9.1


