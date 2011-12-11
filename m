Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RZsIN-0003re-TJ
	for openembedded-core@lists.openembedded.org;
	Sun, 11 Dec 2011 23:55:00 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Dec 2011 14:48:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="86045460"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.46])
	by orsmga002.jf.intel.com with ESMTP; 11 Dec 2011 14:48:00 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Dec 2011 14:47:45 -0800
Message-Id: <246aadbef55304abd18f434adc414148ae02d04d.1323643433.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323643433.git.sgw@linux.intel.com>
References: <cover.1323643433.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323643433.git.sgw@linux.intel.com>
References: <cover.1323643433.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 18/26] siteinfo: create a new siteinfo for x32-linux
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
X-List-Received-Date: Sun, 11 Dec 2011 22:55:00 -0000

From: "H.J. Lu" <hjl.tools@gmail.com>

X32 has different sizes for many types:

1. off_t and ino_t are 8 byte, instead of 4 byte.
2. pthread_mutex_t is 32byte, instead of 24 byte.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
---
 meta/classes/siteinfo.bbclass |    2 +-
 meta/site/x32-linux           |    9 +++++++++
 2 files changed, 10 insertions(+), 1 deletions(-)
 create mode 100644 meta/site/x32-linux

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 604c6ba..bf6af2b 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -76,7 +76,7 @@ def siteinfo_data(d):
         "x86_64-linux": "bit-64",
         "x86_64-linux-uclibc": "bit-64",
         "x86_64-linux-gnu": "bit-64 x86_64-linux",
-        "x86_64-linux-gnux32": "bit-32 ix86-common",
+        "x86_64-linux-gnux32": "bit-32 ix86-common x32-linux",
         "x86_64-mingw32": "bit-64",
     }
 
diff --git a/meta/site/x32-linux b/meta/site/x32-linux
new file mode 100644
index 0000000..7ce6551
--- /dev/null
+++ b/meta/site/x32-linux
@@ -0,0 +1,9 @@
+# general
+ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=16}
+ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=8}
+ac_cv_sizeof_ino_t=${ac_cv_sizeof_ino_t=8}
+ac_cv_sizeof_dev_t=${ac_cv_sizeof_dev_t=8}
+ac_cv_sys_file_offset_bits=${ac_cv_sys_file_offset_bits=64}
+
+# glib
+glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=32}
-- 
1.7.6.4



