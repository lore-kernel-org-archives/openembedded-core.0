Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 07AA2757EE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 19:48:20 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 02 Jun 2015 12:48:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,541,1427785200"; d="scan'208";a="719544796"
Received: from krithika-mobl2.amr.corp.intel.com (HELO
	alimon-ThinkPad-W540.amr.corp.intel.com) ([10.254.180.132])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jun 2015 12:48:22 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jun 2015 14:49:46 -0500
Message-Id: <94023cd9d2c980be76f0e9fad16ab6ccc6e48fc5.1433274434.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1433274434.git.anibal.limon@linux.intel.com>
References: <cover.1433274434.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1433274434.git.anibal.limon@linux.intel.com>
References: <cover.1433274434.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] distrodata: Remove unnecessary include of package_regex.inc
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
X-List-Received-Date: Tue, 02 Jun 2015 19:48:21 -0000
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


