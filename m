Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1ScmQU-00047r-Gu
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 01:47:38 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 Jun 2012 16:37:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="154476633"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga002.jf.intel.com with ESMTP; 07 Jun 2012 16:37:05 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy.jf.intel.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	q57NbJi4006571 for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jun 2012 16:37:19 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q57NbJoD006570
	for openembedded-core@lists.openembedded.org;
	Thu, 7 Jun 2012 16:37:19 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2012 16:37:05 -0700
Message-Id: <776c4b947a27f11117fd9ce412627c26f54efef8.1339111944.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
References: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1339111944.git.elizabeth.flanagan@intel.com>
References: <cover.1339111944.git.elizabeth.flanagan@intel.com>
Subject: [Consolidated Pull 17/22] connman: Document the ACL-breaking sed
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
X-List-Received-Date: Thu, 07 Jun 2012 23:47:38 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 58e3f56..4fb7b43 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -53,6 +53,9 @@ USERADD_PARAM_${PN} = "--system --no-create-home \
 
 inherit autotools pkgconfig update-rc.d useradd
 
+# This allows *everyone* to access ConnMan over DBus, without any access
+# control.  Really the at_console flag should work, which would mean that
+# both this and the xuser patch can be dropped.
 do_compile_append() {
 	sed -i -e s:deny:allow:g src/connman-dbus.conf
 }
-- 
1.7.5.4



