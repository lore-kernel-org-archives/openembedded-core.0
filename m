Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RYWx9-00031h-1i
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 06:55:31 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Dec 2011 21:48:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="83495564"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 07 Dec 2011 21:48:36 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org,
	hjl.tools@gmail.com
Date: Wed,  7 Dec 2011 21:48:30 -0800
Message-Id: <d0022f0732ce2e1d892c0dab20cbf0a466ec0698.1323323130.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <664f652792df901dbc42d813b299093fa719a66a.1323323130.git.nitin.a.kamble@intel.com>
References: <664f652792df901dbc42d813b299093fa719a66a.1323323130.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1323323130.git.nitin.a.kamble@intel.com>
References: <cover.1323323130.git.nitin.a.kamble@intel.com>
Subject: [PATCH 08/11] siteinfo: create a new siteinfo for x32-linux
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
X-List-Received-Date: Thu, 08 Dec 2011 05:55:31 -0000

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



