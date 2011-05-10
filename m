Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfVG-0001SG-7k
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:29:02 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 May 2011 22:26:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,345,1301900400"; d="scan'208";a="690502000"
Received: from unknown (HELO localhost) ([10.255.12.75])
	by fmsmga002.fm.intel.com with ESMTP; 09 May 2011 22:26:17 -0700
Message-Id: <d879b2f2d3532c9faa17a256afb631d1939be87d.1305004776.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
Old-Date: Thu, 5 May 2011 11:26:28 -0500
Date: Mon, 09 May 2011 22:26:16 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 07/30] insane: add micrblaze target info
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
X-List-Received-Date: Tue, 10 May 2011 05:29:02 -0000

From: Adrian Alonso <aalonso@secretlab.ca>

* package_qa_get_machine_dict
* Add microblaze dic entry for QA
* Prebuilt toolchain triplet microblaze-unknown-linux-gnu-
* TARGET_OS is linux-gnu for this toolchain

Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
---
 meta/classes/insane.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 742be5e..e9d4bfa 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -85,7 +85,9 @@ def package_qa_get_machine_dict():
             "linux-uclibcspe" : {
                         "powerpc":    (20,     0,    0,          False,         32),
                       },
-
+            "linux-gnu" :       {
+                        "microblaze": (47787,  0,    0,          False,         32),
+                      },
        }
 
 
-- 
1.7.1.1



