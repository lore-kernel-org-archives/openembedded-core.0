Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 793DA719E2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 09:59:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jun 2017 02:58:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,364,1493708400"; d="scan'208";a="1143025241"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.22.183])
	by orsmga001.jf.intel.com with ESMTP; 20 Jun 2017 02:58:57 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Jun 2017 10:58:52 +0100
Message-Id: <20170620095853.30808-1-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.4
Subject: [PATCH 1/2] lib/oe/distro_check: update openSUSE to use Leap url formats
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
X-List-Received-Date: Tue, 20 Jun 2017 09:59:01 -0000

Since openSUSE switched to their dual development model of Leap and
Tumbleweed the urls we need to check for package lists has changed. Update
get_latest_released_opensuse_source_package_list() to use the new Leap
urls.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/lib/oe/distro_check.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index 37f04ed..7a727dd 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -77,10 +77,10 @@ def get_latest_released_fedora_source_package_list(d):
 
 def get_latest_released_opensuse_source_package_list(d):
     "Returns list of all the name os packages in the latest opensuse distro"
-    latest = find_latest_numeric_release("http://download.opensuse.org/source/distribution/",d)
+    latest = find_latest_numeric_release("http://download.opensuse.org/source/distribution/leap", d)
 
-    package_names = get_source_package_list_from_url("http://download.opensuse.org/source/distribution/%s/repo/oss/suse/src/" % latest, "main", d)
-    package_names |= get_source_package_list_from_url("http://download.opensuse.org/update/%s/src/" % latest, "updates", d)
+    package_names = get_source_package_list_from_url("http://download.opensuse.org/source/distribution/leap/%s/repo/oss/suse/src/" % latest, "main", d)
+    package_names |= get_source_package_list_from_url("http://download.opensuse.org/update/leap/%s/oss/src/" % latest, "updates", d)
     return latest, package_names
 
 def get_latest_released_mandriva_source_package_list(d):
@@ -161,7 +161,7 @@ def create_distro_packages_list(distro_check_dir, d):
                             ("Debian", get_latest_released_debian_source_package_list),
                             ("Ubuntu", get_latest_released_ubuntu_source_package_list),
                             ("Fedora", get_latest_released_fedora_source_package_list),
-                            ("OpenSuSE", get_latest_released_opensuse_source_package_list),
+                            ("openSUSE", get_latest_released_opensuse_source_package_list),
                             ("Mandriva", get_latest_released_mandriva_source_package_list),
                             ("Clear", get_latest_released_clear_source_package_list),
                            )
-- 
2.9.4


