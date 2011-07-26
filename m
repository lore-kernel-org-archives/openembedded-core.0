Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qljyb-0007wU-Fn
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 17:55:22 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Jul 2011 08:51:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,270,1309762800"; d="scan'208";a="31638868"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 26 Jul 2011 08:51:06 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 02:25:21 -0700
Message-Id: <8d43cc48ca1bf055f3553fed79cf72bb3f611657.1311672205.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1311672205.git.nitin.a.kamble@intel.com>
References: <cover.1311672205.git.nitin.a.kamble@intel.com>
Subject: [RFC x32 1/1] insane.bbclass: add entries for linux-gnu<ABI>
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
X-List-Received-Date: Tue, 26 Jul 2011 15:55:22 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

for x86_64 we have multiple ABIs now. Add entries for
linux-gnu32, linux-gnux32, linux-gn64u

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



