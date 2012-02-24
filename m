Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S14Ik-0004vl-GE
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Feb 2012 00:11:46 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Feb 2012 15:03:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="111677762"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.58])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2012 15:03:22 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2012 15:03:22 -0800
Message-Id: <1330124602-8252-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] distro_check: fix the fedora URL for rleases as they seem to have moved
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
X-List-Received-Date: Fri, 24 Feb 2012 23:11:46 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/lib/oe/distro_check.py |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index 630e88d..cc836de 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -99,12 +99,12 @@ def get_source_package_list_from_url(url, section):
 
 def get_latest_released_fedora_source_package_list():
     "Returns list of all the name os packages in the latest fedora distro"
-    latest = find_latest_numeric_release("http://download.fedora.redhat.com/pub/fedora/linux/releases/")
+    latest = find_latest_numeric_release("http://archive.fedoraproject.org/pub/fedora/linux/releases/")
 
-    package_names = get_source_package_list_from_url("http://download.fedora.redhat.com/pub/fedora/linux/releases/%s/Fedora/source/SRPMS/" % latest, "main")
+    package_names = get_source_package_list_from_url("http://archive.fedoraproject.org/pub/fedora/linux/releases/%s/Fedora/source/SRPMS/" % latest, "main")
 
 #    package_names += get_source_package_list_from_url("http://download.fedora.redhat.com/pub/fedora/linux/releases/%s/Everything/source/SPRMS/" % latest, "everything")
-    package_names += get_source_package_list_from_url("http://download.fedora.redhat.com/pub/fedora/linux/updates/%s/SRPMS/" % latest, "updates")
+    package_names += get_source_package_list_from_url("http://archive.fedoraproject.org/pub/fedora/linux/updates/%s/SRPMS/" % latest, "updates")
 
     package_list=clean_package_list(package_names)
         
-- 
1.7.7.6



