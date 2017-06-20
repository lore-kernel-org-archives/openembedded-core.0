Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 90C7071A70
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 09:59:01 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jun 2017 02:58:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,364,1493708400"; d="scan'208";a="1143025246"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.22.183])
	by orsmga001.jf.intel.com with ESMTP; 20 Jun 2017 02:58:58 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Jun 2017 10:58:53 +0100
Message-Id: <20170620095853.30808-2-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170620095853.30808-1-joshua.g.lock@intel.com>
References: <20170620095853.30808-1-joshua.g.lock@intel.com>
Subject: [PATCH 2/2] lib/oe/distro_check: drop Mandriva from create_distro_packages_list()
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

Mandriva is no longer maintained, with its last release having been in
2011. It's no longer useful as a yard-stick distro, therefore drop it from
distro_check.create_distro_packages_list()

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/lib/oe/distro_check.py | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index 7a727dd..e775c3a 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -83,13 +83,6 @@ def get_latest_released_opensuse_source_package_list(d):
     package_names |= get_source_package_list_from_url("http://download.opensuse.org/update/leap/%s/oss/src/" % latest, "updates", d)
     return latest, package_names
 
-def get_latest_released_mandriva_source_package_list(d):
-    "Returns list of all the name os packages in the latest mandriva distro"
-    latest = find_latest_numeric_release("http://distrib-coffee.ipsl.jussieu.fr/pub/linux/MandrivaLinux/official/", d)
-    package_names = get_source_package_list_from_url("http://distrib-coffee.ipsl.jussieu.fr/pub/linux/MandrivaLinux/official/%s/SRPMS/main/release/" % latest, "main", d)
-    package_names |= get_source_package_list_from_url("http://distrib-coffee.ipsl.jussieu.fr/pub/linux/MandrivaLinux/official/%s/SRPMS/main/updates/" % latest, "updates", d)
-    return latest, package_names
-
 def get_latest_released_clear_source_package_list(d):
     latest = find_latest_numeric_release("https://download.clearlinux.org/releases/", d)
     package_names = get_source_package_list_from_url("https://download.clearlinux.org/releases/%s/clear/source/SRPMS/" % latest, "main", d)
@@ -162,7 +155,6 @@ def create_distro_packages_list(distro_check_dir, d):
                             ("Ubuntu", get_latest_released_ubuntu_source_package_list),
                             ("Fedora", get_latest_released_fedora_source_package_list),
                             ("openSUSE", get_latest_released_opensuse_source_package_list),
-                            ("Mandriva", get_latest_released_mandriva_source_package_list),
                             ("Clear", get_latest_released_clear_source_package_list),
                            )
 
-- 
2.9.4


