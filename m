Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UJ8Ch-0007G1-Rz
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 21:04:46 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 22 Mar 2013 12:47:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,893,1355126400"; d="scan'208";a="217880803"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.1])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Mar 2013 12:47:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 19:47:40 +0000
Message-Id: <110eb8ac18a25271db0203b78e0447d6ace009b9.1363981627.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363981627.git.paul.eggleton@linux.intel.com>
References: <cover.1363981627.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1363981627.git.paul.eggleton@linux.intel.com>
References: <cover.1363981627.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 2/2] classes/buildhistory: trim trailing spaces in file listings
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Mar 2013 20:04:55 -0000
X-List-Received-Date: Fri, 22 Mar 2013 20:04:55 -0000

These are mildly annoying when viewing git diffs of the buildhistory
repository, so let's just get rid of them.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index b559ebf..3892326 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -391,7 +391,7 @@ buildhistory_get_sdk_installed() {
 buildhistory_list_files() {
 	# List the files in the specified directory, but exclude date/time etc.
 	# This awk script is somewhat messy, but handles where the size is not printed for device files under pseudo
-	( cd $1 && find . -ls | awk '{ if ( $7 ~ /[0-9]/ ) printf "%s %10-s %10-s %10s %s %s %s\n", $3, $5, $6, $7, $11, $12, $13 ; else printf "%s %10-s %10-s %10s %s %s %s\n", $3, $5, $6, 0, $10, $11, $12 }' | sort -k5 > $2 )
+	( cd $1 && find . -ls | awk '{ if ( $7 ~ /[0-9]/ ) printf "%s %10-s %10-s %10s %s %s %s\n", $3, $5, $6, $7, $11, $12, $13 ; else printf "%s %10-s %10-s %10s %s %s %s\n", $3, $5, $6, 0, $10, $11, $12 }' | sort -k5 | sed 's/ *$//' > $2 )
 }
 
 
-- 
1.7.10.4



