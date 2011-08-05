Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QpUWU-0005Jr-VF
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Aug 2011 02:13:51 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Aug 2011 17:09:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,326,1309762800"; 
   d="scan'208";a="4609827"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Aug 2011 17:09:23 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 10:42:58 -0700
Message-Id: <33b5563b912eb78c7a4813ad6b2522b36111483d.1312565996.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <8070639def46a42285d7bbd4812692d1dcb8a713.1312565996.git.nitin.a.kamble@intel.com>
References: <8070639def46a42285d7bbd4812692d1dcb8a713.1312565996.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1312565996.git.nitin.a.kamble@intel.com>
References: <cover.1312565996.git.nitin.a.kamble@intel.com>
Subject: [PATCH 2/3] insane.bbclass: add entries for linux-gnux32
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
X-List-Received-Date: Sat, 06 Aug 2011 00:13:51 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

For x86_64 new ABI : x32, there is a new
name for the TARGET_OS: linux-gnux32

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/classes/insane.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 5fb0d98..0267fad 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -90,6 +90,9 @@ def package_qa_get_machine_dict():
                         "microblaze":   (47787,  0,    0,          False,         32),
                         "microblazeel": (47787,  0,    0,          True,          32),
                       },
+            "linux-gnux32" :       {
+                        "x86_64":     (62,     0,    0,          True,          32),
+                      },
        }
 
 
-- 
1.7.6



