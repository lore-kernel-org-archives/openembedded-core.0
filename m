Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LC4-0000lF-0N
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:38:56 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 17:30:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="118170674"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by orsmga001.jf.intel.com with ESMTP; 15 Mar 2012 17:29:10 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:00 +0800
Message-Id: <b9072ce7c18d0ba95edf541b24329e4d54f8fa90.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 03/60] dbus-glib: upgrade to 0.98
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
X-List-Received-Date: Fri, 16 Mar 2012 00:38:56 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Signed-off-by: Shane Wang <shane.wang@intel.com>
Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../no-examples.patch                              |    0
 meta/recipes-core/dbus/dbus-glib_0.92.bb           |    6 ------
 meta/recipes-core/dbus/dbus-glib_0.98.bb           |    6 ++++++
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-core/dbus/{dbus-glib-0.92 => dbus-glib-0.98}/no-examples.patch (100%)
 delete mode 100644 meta/recipes-core/dbus/dbus-glib_0.92.bb
 create mode 100644 meta/recipes-core/dbus/dbus-glib_0.98.bb

diff --git a/meta/recipes-core/dbus/dbus-glib-0.92/no-examples.patch b/meta/recipes-core/dbus/dbus-glib-0.98/no-examples.patch
similarity index 100%
rename from meta/recipes-core/dbus/dbus-glib-0.92/no-examples.patch
rename to meta/recipes-core/dbus/dbus-glib-0.98/no-examples.patch
diff --git a/meta/recipes-core/dbus/dbus-glib_0.92.bb b/meta/recipes-core/dbus/dbus-glib_0.92.bb
deleted file mode 100644
index 988625b..0000000
--- a/meta/recipes-core/dbus/dbus-glib_0.92.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require dbus-glib.inc
-
-PR = "r2"
-
-SRC_URI[md5sum] = "b595b36890c4f9f8f5d5dec131c495f8"
-SRC_URI[sha256sum] = "5a7fd4cf937cdcb7f2eed61341b70ee0f2607450a50db381618598adf60dd40e"
diff --git a/meta/recipes-core/dbus/dbus-glib_0.98.bb b/meta/recipes-core/dbus/dbus-glib_0.98.bb
new file mode 100644
index 0000000..bd9389a
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-glib_0.98.bb
@@ -0,0 +1,6 @@
+require dbus-glib.inc
+
+PR = "r0"
+
+SRC_URI[md5sum] = "3f7f117dc7c8d899d9acfdcbf9253fb8"
+SRC_URI[sha256sum] = "297c81d6bb8b1c312e9b0ccfe91eb28ec0672756abb64dfb7bbe2b5f1ae5d111"
-- 
1.7.6



