Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QpUWT-0005Jr-U7
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Aug 2011 02:13:50 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Aug 2011 17:09:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,326,1309762800"; 
   d="scan'208";a="4609825"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Aug 2011 17:09:23 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 10:42:57 -0700
Message-Id: <8070639def46a42285d7bbd4812692d1dcb8a713.1312565996.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1312565996.git.nitin.a.kamble@intel.com>
References: <cover.1312565996.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/3] siteinfo.bbclass: add entries for new x86_64 ABI x32 target
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
X-List-Received-Date: Sat, 06 Aug 2011 00:13:50 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/classes/siteinfo.bbclass |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 9dacd58..a61b5e5 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -42,12 +42,14 @@ def siteinfo_data(d):
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
+        "linux-gnu": "common-linux common-glibc",
+        "linux-gnux32": "common-linux common-glibc",
         "linux-gnueabi": "common-linux common-glibc",
         "linux-gnuspe": "common-linux common-glibc",
         "linux-uclibc": "common-linux common-uclibc",
@@ -68,6 +70,14 @@ def siteinfo_data(d):
         "powerpc-linux-uclibcspe": "powerpc-linux powerpc32-linux powerpc-linux-uclibc",
         "powerpc64-linux-gnuspe": "powerpc-linux powerpc64-linux",
         "powerpc64-linux": "powerpc-linux",
+        "x86_64-cygwin": "bit-64",
+        "x86_64-darwin": "bit-64",
+        "x86_64-darwin9": "bit-64",
+        "x86_64-linux": "bit-64",
+        "x86_64-linux-uclibc": "bit-64",
+        "x86_64-linux-gnu": "bit-64 x86_64-linux",
+        "x86_64-linux-gnux32": "bit-32 ix86-common",
+        "x86_64-mingw32": "bit-64",
     }
 
     hostarch = d.getVar("HOST_ARCH", True)
-- 
1.7.6



