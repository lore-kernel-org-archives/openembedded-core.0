Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qp5X4-0005NQ-Ro
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 23:32:47 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 04 Aug 2011 14:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,319,1309762800"; 
   d="scan'208";a="4260473"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Aug 2011 14:28:17 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Aug 2011 08:01:53 -0700
Message-Id: <e1221aaa052c50fad49df099d2c2979f3664e4ba.1312469790.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1312469789.git.nitin.a.kamble@intel.com>
References: <cover.1312469789.git.nitin.a.kamble@intel.com>
Subject: [PATCH 07/10] siteinfo.bbclass: add entries for new x86_64 ABI targets
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
X-List-Received-Date: Thu, 04 Aug 2011 21:32:48 -0000

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
1.7.6



