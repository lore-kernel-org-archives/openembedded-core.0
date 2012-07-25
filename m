Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Su6jB-0008IT-SP
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 20:54:34 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2012 11:43:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="173137539"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.21])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2012 11:43:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2012 19:42:53 +0100
Message-Id: <e3908dd6678604933b39f7b4befb4f4486a5cd37.1343241383.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343241383.git.paul.eggleton@linux.intel.com>
References: <cover.1343241383.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343241383.git.paul.eggleton@linux.intel.com>
References: <cover.1343241383.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/7] classes/package_deb: add PackageArch field
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
X-List-Received-Date: Wed, 25 Jul 2012 18:54:34 -0000

If we want to query the PACKAGE_ARCH from the installed package (as we
do in order to be able to do a pkgdata lookup for example) then we need
to have this stored in its own field as this is not always the same as
the Architecture field for deb packages.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/package_deb.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index d09baea..48511df 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -290,6 +290,7 @@ python do_package_deb () {
         fields.append(["Maintainer: %s\n", ['MAINTAINER']])
         fields.append(["Architecture: %s\n", ['DPKG_ARCH']])
         fields.append(["OE: %s\n", ['PN']])
+        fields.append(["PackageArch: %s\n", ['PACKAGE_ARCH']])
         fields.append(["Homepage: %s\n", ['HOMEPAGE']])
 
         # Package, Version, Maintainer, Description - mandatory
-- 
1.7.9.5



