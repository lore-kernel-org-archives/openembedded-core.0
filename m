Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sg8O1-0008Qm-9L
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jun 2012 07:50:58 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jun 2012 22:40:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181103313"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.105])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2012 22:40:12 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2012 22:40:04 -0700
Message-Id: <acfae1cb935b7e7b4621b9057b7996cb91acd277.1339911478.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 20/23] cleanup-workdir: update help text
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
X-List-Received-Date: Sun, 17 Jun 2012 05:51:02 -0000

From: Kang Kai <kai.kang@windriver.com>

Update the help text to tell user that the files and dirs under WORKDIR
which are not created by Yocto will be deleted.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 scripts/cleanup-workdir |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/cleanup-workdir b/scripts/cleanup-workdir
index 156a259..c748846 100755
--- a/scripts/cleanup-workdir
+++ b/scripts/cleanup-workdir
@@ -65,8 +65,11 @@ def main():
     parser = optparse.OptionParser(
         usage = """%prog
 
-Remove the obsolete packages' build directories in WORKDIR.
-This script must be ran under BUILDDIR after source file \"oe-init-build-env\".""")
+%prog removes the obsolete packages' build directories in WORKDIR.
+This script must be ran under BUILDDIR after source file \"oe-init-build-env\".
+
+Any file or directory under WORKDIR which is not created by Yocto
+will be deleted. Be CAUTIOUS.""")
 
     options, args = parser.parse_args(sys.argv)
 
-- 
1.7.7.6



