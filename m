Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QmDIy-0004Z1-6n
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 01:14:20 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Jul 2011 16:10:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,279,1309762800"; d="scan'208";a="35283199"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by fmsmga001.fm.intel.com with ESMTP; 27 Jul 2011 16:10:04 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 16:09:59 -0700
Message-Id: <368d4cd746ace1a99c7eced1e00275e0eec27573.1311806842.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <610ee02966da6261e12eca830bdebf9c2cc090e9.1311806842.git.nitin.a.kamble@intel.com>
References: <610ee02966da6261e12eca830bdebf9c2cc090e9.1311806842.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1311806842.git.nitin.a.kamble@intel.com>
References: <cover.1311806842.git.nitin.a.kamble@intel.com>
Subject: [PATCH 2/4] siteinfo.bbclass: add entries for new x86_64 ABI targets
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
X-List-Received-Date: Wed, 27 Jul 2011 23:14:20 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/classes/siteinfo.bbclass |   14 +++++++++++++-
 1 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 9dacd58..daa7946 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -42,12 +42,15 @@ def siteinfo_data(d):
         "sh4": "endian-little bit-32 sh-common",
         "sparc": "endian-big bit-32",
         "viac3": "endian-little bit-32 ix86-common",
-        "x86_64": "endian-little bit-64",
+        "x86_64": "endian-little", # bitinfo specified in targetinfo
     }
     osinfo = {
         "darwin": "common-darwin",
         "darwin9": "common-darwin",
         "linux": "common-linux common-glibc",
+        "linux-gnu32": "common-linux common-glibc",
+        "linux-gnux32": "common-linux common-glibc",
+        "linux-gnu64": "common-linux common-glibc",
         "linux-gnueabi": "common-linux common-glibc",
         "linux-gnuspe": "common-linux common-glibc",
         "linux-uclibc": "common-linux common-uclibc",
@@ -68,6 +71,15 @@ def siteinfo_data(d):
         "powerpc-linux-uclibcspe": "powerpc-linux powerpc32-linux powerpc-linux-uclibc",
         "powerpc64-linux-gnuspe": "powerpc-linux powerpc64-linux",
         "powerpc64-linux": "powerpc-linux",
+        "x86_64-cygwin": "bit-64",
+        "x86_64-darvin": "bit-64",
+        "x86_64-darvin9": "bit-64",
+        "x86_64-linux": "bit-64",
+        "x86_64-linux-uclibc": "bit-64",
+        "x86_64-linux-gnu32": "bit-32 ix86-common",
+        "x86_64-linux-gnux32": "bit-32 ix86-common",
+        "x86_64-linux-gnu64": "bit-64 x86_64-linux",
+        "x86_64-mingw32": "bit-64",
     }
 
     hostarch = d.getVar("HOST_ARCH", True)
-- 
1.7.4.4



