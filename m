Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sg8Nx-0008Qm-Tu
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jun 2012 07:50:54 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jun 2012 22:40:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181103289"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.105])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2012 22:40:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2012 22:39:49 -0700
Message-Id: <91c32c1a797481c5e396e657cfe2044f27511658.1339911478.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 05/23] site/x86_64-linux-uclibc: Cache definitions of guint32/guint64
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
X-List-Received-Date: Sun, 17 Jun 2012 05:50:54 -0000

From: Khem Raj <raj.khem@gmail.com>

Without this glib 2.32.x wont build.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/site/x86_64-linux-uclibc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/site/x86_64-linux-uclibc b/meta/site/x86_64-linux-uclibc
index bad2ed9..2d269f7 100644
--- a/meta/site/x86_64-linux-uclibc
+++ b/meta/site/x86_64-linux-uclibc
@@ -60,6 +60,9 @@ am_cv_func_working_getline=${am_cv_func_working_getline=yes}
 
 # glib-2.0
 glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
+ac_cv_alignof_guint32=4
+ac_cv_alignof_guint64=8
+ac_cv_alignof_unsigned_long=8
 
 # libidl
 libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-- 
1.7.7.6



