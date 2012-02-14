Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RxIkD-0004rp-Jg
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 14:48:33 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Feb 2012 05:40:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="109850984"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.250])
	by orsmga002.jf.intel.com with ESMTP; 14 Feb 2012 05:40:22 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2012 13:40:13 +0000
Message-Id: <c93570a53d9ad6562e887f89ca0e2c70e54e6472.1329226672.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1329226672.git.paul.eggleton@linux.intel.com>
References: <cover.1329226672.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1329226672.git.paul.eggleton@linux.intel.com>
References: <cover.1329226672.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/7] classes/buildhistory: sort FILELIST in package info
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
X-List-Received-Date: Tue, 14 Feb 2012 13:48:34 -0000

The FILELIST order can vary depending on the order the files were
written which may change between builds with no ill effect, so sort the
list prior to writing it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 0ee6a33..3fbe3a8 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -186,6 +186,7 @@ python buildhistory_emit_pkghistory() {
 				fstat = os.lstat(os.path.join(root, f))
 				pkginfo.size += fstat.st_size
 				filelist.append(os.sep + os.path.join(relpth, f))
+		filelist.sort()
 		pkginfo.filelist = " ".join(filelist)
 
 		write_pkghistory(pkginfo, d)
-- 
1.7.5.4



