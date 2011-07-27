Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QmDJ0-0004Z1-4Y
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 01:14:22 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Jul 2011 16:10:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,279,1309762800"; d="scan'208";a="35283200"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by fmsmga001.fm.intel.com with ESMTP; 27 Jul 2011 16:10:04 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 16:10:00 -0700
Message-Id: <dad0b8b2f1868d8a9c16b0569de03771abfbcafe.1311806842.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <610ee02966da6261e12eca830bdebf9c2cc090e9.1311806842.git.nitin.a.kamble@intel.com>
References: <610ee02966da6261e12eca830bdebf9c2cc090e9.1311806842.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1311806842.git.nitin.a.kamble@intel.com>
References: <cover.1311806842.git.nitin.a.kamble@intel.com>
Subject: [PATCH 3/4] insane.bbclass: add entries for linux-gnu<ABI>
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
X-List-Received-Date: Wed, 27 Jul 2011 23:14:22 -0000

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
1.7.4.4



