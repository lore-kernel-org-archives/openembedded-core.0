Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qp5X5-0005MJ-M9
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 23:32:47 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 04 Aug 2011 14:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,319,1309762800"; 
   d="scan'208";a="4260474"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Aug 2011 14:28:17 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Aug 2011 08:01:54 -0700
Message-Id: <6f5d9933df00c226e73afe5398613021a6a58133.1312469790.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1312469789.git.nitin.a.kamble@intel.com>
References: <cover.1312469789.git.nitin.a.kamble@intel.com>
Subject: [PATCH 08/10] insane.bbclass: add entries for linux-gnu<ABI>
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

for x86_64 multiple ABIs now have these new names for the TARGET_OS.
Add entries for:
 linux-gnu32, linux-gnux32, linux-gnu64

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/classes/insane.bbclass |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 5fb0d98..15e7fc7 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -90,6 +90,15 @@ def package_qa_get_machine_dict():
                         "microblaze":   (47787,  0,    0,          False,         32),
                         "microblazeel": (47787,  0,    0,          True,          32),
                       },
+            "linux-gnu32" :       {
+                        "x86_64":     (62,     0,    0,          True,          32),
+                      },
+            "linux-gnux32" :       {
+                        "x86_64":     (62,     0,    0,          True,          32),
+                      },
+            "linux-gnu64" :       {
+                        "x86_64":     (62,     0,    0,          True,          64),
+                      },
        }
 
 
-- 
1.7.6



