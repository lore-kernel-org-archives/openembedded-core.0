Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PuqNx-00071S-Kh
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 19:02:54 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Mar 2011 10:00:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,254,1297065600"; d="scan'208";a="396465362"
Received: from unknown (HELO localhost) ([10.255.12.100])
	by azsmga001.ch.intel.com with ESMTP; 02 Mar 2011 10:00:15 -0800
Message-Id: <0af09206acbf3b9cde581088e4430f1e8dc3bf2e.1299088353.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299088353.git.sgw@linux.intel.com>
References: <cover.1299088353.git.sgw@linux.intel.com>
Old-Date: Mon, 28 Feb 2011 19:34:45 +0800
Date: Wed, 02 Mar 2011 10:00:14 -0800
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 02 Mar 2011 19:07:46 +0100
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Liping Ke <liping.ke@intel.com>, Dongxiao Xu <dongxiao.xu@intel.com>,
	Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [PATCH 03/26] shadow: upgrade to 4.1.4.3 to fix security vulnerability
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
X-List-Received-Date: Wed, 02 Mar 2011 18:02:54 -0000

From: Yu Ke <ke.yu@intel.com>

For CVE-2011-0721: http://lists.debian.org/debian-security-announce/2011/msg00030.html

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../{shadow-4.1.4.2 => files}/login_defs_pam.sed   |    0
 .../shadow/{shadow-4.1.4.2 => files}/pam.d/chfn    |    0
 .../{shadow-4.1.4.2 => files}/pam.d/chpasswd       |    0
 .../shadow/{shadow-4.1.4.2 => files}/pam.d/chsh    |    0
 .../shadow/{shadow-4.1.4.2 => files}/pam.d/login   |    0
 .../{shadow-4.1.4.2 => files}/pam.d/newusers       |    0
 .../shadow/{shadow-4.1.4.2 => files}/pam.d/passwd  |    0
 .../shadow/{shadow-4.1.4.2 => files}/pam.d/su      |    0
 .../shadow/{shadow-4.1.4.2 => files}/securetty     |    0
 .../shadow-4.1.3-dots-in-usernames.patch           |    0
 .../shadow-4.1.4.2-env-reset-keep-locale.patch     |    0
 .../shadow-4.1.4.2-groupmod-pam-check.patch        |    0
 .../shadow-4.1.4.2-su_no_sanitize_env.patch        |    0
 .../shadow.automake-1.11.patch                     |    0
 .../{shadow_4.1.4.2.bb => shadow_4.1.4.3.bb}       |    4 ++--
 15 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/shadow/{shadow-4.1.4.2 => files}/login_defs_pam.sed (100%)
 rename meta/recipes-extended/shadow/{shadow-4.1.4.2 => files}/pam.d/chfn (100%)
 rename meta/recipes-extended/shadow/{shadow-4.1.4.2 => files}/pam.d/chpasswd (100%)
 rename meta/recipes-extended/shadow/{shadow-4.1.4.2 => files}/pam.d/chsh (100%)
 rename meta/recipes-extended/shadow/{shadow-4.1.4.2 => files}/pam.d/login (100%)
 rename meta/recipes-extended/shadow/{shadow-4.1.4.2 => files}/pam.d/newusers (100%)
 rename meta/recipes-extended/shadow/{shadow-4.1.4.2 => files}/pam.d/passwd (100%)
 rename meta/recipes-extended/shadow/{shadow-4.1.4.2 => files}/pam.d/su (100%)
 rename meta/recipes-extended/shadow/{shadow-4.1.4.2 => files}/securetty (100%)
 rename meta/recipes-extended/shadow/{shadow-4.1.4.2 => files}/shadow-4.1.3-dots-in-usernames.patch (100%)
 rename meta/recipes-extended/shadow/{shadow-4.1.4.2 => files}/shadow-4.1.4.2-env-reset-keep-locale.patch (100%)
 rename meta/recipes-extended/shadow/{shadow-4.1.4.2 => files}/shadow-4.1.4.2-groupmod-pam-check.patch (100%)
 rename meta/recipes-extended/shadow/{shadow-4.1.4.2 => files}/shadow-4.1.4.2-su_no_sanitize_env.patch (100%)
 rename meta/recipes-extended/shadow/{shadow-4.1.4.2 => files}/shadow.automake-1.11.patch (100%)
 rename meta/recipes-extended/shadow/{shadow_4.1.4.2.bb => shadow_4.1.4.3.bb} (70%)

diff --git a/meta/recipes-extended/shadow/shadow-4.1.4.2/login_defs_pam.sed b/meta/recipes-extended/shadow/files/login_defs_pam.sed
similarity index 100%
rename from meta/recipes-extended/shadow/shadow-4.1.4.2/login_defs_pam.sed
rename to meta/recipes-extended/shadow/files/login_defs_pam.sed
diff --git a/meta/recipes-extended/shadow/shadow-4.1.4.2/pam.d/chfn b/meta/recipes-extended/shadow/files/pam.d/chfn
similarity index 100%
rename from meta/recipes-extended/shadow/shadow-4.1.4.2/pam.d/chfn
rename to meta/recipes-extended/shadow/files/pam.d/chfn
diff --git a/meta/recipes-extended/shadow/shadow-4.1.4.2/pam.d/chpasswd b/meta/recipes-extended/shadow/files/pam.d/chpasswd
similarity index 100%
rename from meta/recipes-extended/shadow/shadow-4.1.4.2/pam.d/chpasswd
rename to meta/recipes-extended/shadow/files/pam.d/chpasswd
diff --git a/meta/recipes-extended/shadow/shadow-4.1.4.2/pam.d/chsh b/meta/recipes-extended/shadow/files/pam.d/chsh
similarity index 100%
rename from meta/recipes-extended/shadow/shadow-4.1.4.2/pam.d/chsh
rename to meta/recipes-extended/shadow/files/pam.d/chsh
diff --git a/meta/recipes-extended/shadow/shadow-4.1.4.2/pam.d/login b/meta/recipes-extended/shadow/files/pam.d/login
similarity index 100%
rename from meta/recipes-extended/shadow/shadow-4.1.4.2/pam.d/login
rename to meta/recipes-extended/shadow/files/pam.d/login
diff --git a/meta/recipes-extended/shadow/shadow-4.1.4.2/pam.d/newusers b/meta/recipes-extended/shadow/files/pam.d/newusers
similarity index 100%
rename from meta/recipes-extended/shadow/shadow-4.1.4.2/pam.d/newusers
rename to meta/recipes-extended/shadow/files/pam.d/newusers
diff --git a/meta/recipes-extended/shadow/shadow-4.1.4.2/pam.d/passwd b/meta/recipes-extended/shadow/files/pam.d/passwd
similarity index 100%
rename from meta/recipes-extended/shadow/shadow-4.1.4.2/pam.d/passwd
rename to meta/recipes-extended/shadow/files/pam.d/passwd
diff --git a/meta/recipes-extended/shadow/shadow-4.1.4.2/pam.d/su b/meta/recipes-extended/shadow/files/pam.d/su
similarity index 100%
rename from meta/recipes-extended/shadow/shadow-4.1.4.2/pam.d/su
rename to meta/recipes-extended/shadow/files/pam.d/su
diff --git a/meta/recipes-extended/shadow/shadow-4.1.4.2/securetty b/meta/recipes-extended/shadow/files/securetty
similarity index 100%
rename from meta/recipes-extended/shadow/shadow-4.1.4.2/securetty
rename to meta/recipes-extended/shadow/files/securetty
diff --git a/meta/recipes-extended/shadow/shadow-4.1.4.2/shadow-4.1.3-dots-in-usernames.patch b/meta/recipes-extended/shadow/files/shadow-4.1.3-dots-in-usernames.patch
similarity index 100%
rename from meta/recipes-extended/shadow/shadow-4.1.4.2/shadow-4.1.3-dots-in-usernames.patch
rename to meta/recipes-extended/shadow/files/shadow-4.1.3-dots-in-usernames.patch
diff --git a/meta/recipes-extended/shadow/shadow-4.1.4.2/shadow-4.1.4.2-env-reset-keep-locale.patch b/meta/recipes-extended/shadow/files/shadow-4.1.4.2-env-reset-keep-locale.patch
similarity index 100%
rename from meta/recipes-extended/shadow/shadow-4.1.4.2/shadow-4.1.4.2-env-reset-keep-locale.patch
rename to meta/recipes-extended/shadow/files/shadow-4.1.4.2-env-reset-keep-locale.patch
diff --git a/meta/recipes-extended/shadow/shadow-4.1.4.2/shadow-4.1.4.2-groupmod-pam-check.patch b/meta/recipes-extended/shadow/files/shadow-4.1.4.2-groupmod-pam-check.patch
similarity index 100%
rename from meta/recipes-extended/shadow/shadow-4.1.4.2/shadow-4.1.4.2-groupmod-pam-check.patch
rename to meta/recipes-extended/shadow/files/shadow-4.1.4.2-groupmod-pam-check.patch
diff --git a/meta/recipes-extended/shadow/shadow-4.1.4.2/shadow-4.1.4.2-su_no_sanitize_env.patch b/meta/recipes-extended/shadow/files/shadow-4.1.4.2-su_no_sanitize_env.patch
similarity index 100%
rename from meta/recipes-extended/shadow/shadow-4.1.4.2/shadow-4.1.4.2-su_no_sanitize_env.patch
rename to meta/recipes-extended/shadow/files/shadow-4.1.4.2-su_no_sanitize_env.patch
diff --git a/meta/recipes-extended/shadow/shadow-4.1.4.2/shadow.automake-1.11.patch b/meta/recipes-extended/shadow/files/shadow.automake-1.11.patch
similarity index 100%
rename from meta/recipes-extended/shadow/shadow-4.1.4.2/shadow.automake-1.11.patch
rename to meta/recipes-extended/shadow/files/shadow.automake-1.11.patch
diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.2.bb b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
similarity index 70%
rename from meta/recipes-extended/shadow/shadow_4.1.4.2.bb
rename to meta/recipes-extended/shadow/shadow_4.1.4.3.bb
index 224ae5e..c8aa223 100644
--- a/meta/recipes-extended/shadow/shadow_4.1.4.2.bb
+++ b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
@@ -8,7 +8,7 @@ SRC_URI += "file://shadow.automake-1.11.patch \
 	    file://shadow-4.1.4.2-groupmod-pam-check.patch \
 	    file://shadow-4.1.4.2-su_no_sanitize_env.patch"
 
-SRC_URI[md5sum] = "d593a9cab93c48ee0a6ba056db8c1997"
-SRC_URI[sha256sum] = "97987f6a7967a85e6aa0dba2a1d52db8bd69af5a717391de5693db768fb78990"
+SRC_URI[md5sum] = "b8608d8294ac88974f27b20f991c0e79"
+SRC_URI[sha256sum] = "633f5bb4ea0c88c55f3642c97f9d25cbef74f82e0b4cf8d54e7ad6f9f9caa778"
 
 EXTRA_OECONF_libc-uclibc += " --with-nscd=no "
-- 
1.7.1



