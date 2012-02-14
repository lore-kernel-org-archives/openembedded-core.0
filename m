Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RxIo0-0005Bh-F0
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 14:52:28 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Feb 2012 05:44:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="117410036"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.250])
	by fmsmga001.fm.intel.com with ESMTP; 14 Feb 2012 05:44:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2012 13:44:06 +0000
Message-Id: <e9c7cfe292d115a658caa8c7a57e2b6d5408a22b.1329226937.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1329226937.git.paul.eggleton@linux.intel.com>
References: <cover.1329226937.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1329226937.git.paul.eggleton@linux.intel.com>
References: <cover.1329226937.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] scripts/combo-layer: add branch option to example config
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
X-List-Received-Date: Tue, 14 Feb 2012 13:52:28 -0000

Minor improvements to the example combo-layer config file:
* Add the recently added branch option to the optional options section
* Mention in comments that last_revision gets updated during "update"
* Tidy up some more grammar

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/combo-layer.conf.example |   13 +++++++++----
 1 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/scripts/combo-layer.conf.example b/scripts/combo-layer.conf.example
index 3865829..010a692 100644
--- a/scripts/combo-layer.conf.example
+++ b/scripts/combo-layer.conf.example
@@ -14,13 +14,18 @@ local_repo_dir = /home/kyu3/src/test/bitbake
 dest_dir = bitbake
 
 # the last update revision.
-# "init" will set this automatically, however if it is empty when "update"
-# is run, the tool will start from the first commit.
+# "init" will set this to the latest revision automatically, however if it
+# is empty when "update" is run, the tool will start from the first commit.
+# Note that this value will get updated by "update" if the component repo's
+# latest revision changed and the operation completes successfully.
 last_revision =
 
-# optional options
+# optional options:
 
-# file_filter: only include the interested file
+# branch: specify the branch in the component repo to pull from
+# (master if not specified)
+
+# file_filter: only include the specified file(s)
 # file_filter = [path] [path] ...
 # example:
 #   file_filter = src/  : only include the subdir src
-- 
1.7.5.4



