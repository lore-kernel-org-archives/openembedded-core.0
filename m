Return-Path: <valentin.popa@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 80ACD6F595
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 11:12:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Mar 2014 04:12:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,654,1389772800"; d="scan'208";a="498446466"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.47])
	by fmsmga002.fm.intel.com with ESMTP; 14 Mar 2014 04:12:41 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Mar 2014 13:12:25 +0200
Message-Id: <1394795545-6093-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH_V2] mips64-linux: set ac_cv_sizeof_ssize_t
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Mar 2014 11:12:44 -0000

Set ac_cv_sizeof_ssize_t for mips64;
mips-common will not overwrite it.

"ssize_t is a posix define which is architecture specific whose value
is signed size_t, glibc/uclibc for mips64/n64 linux platform defines
it to be equivalent of 'long' and long here is 8bytes because
mips64/n64 follows LP64 model. In OpenEmbedded our default ABI for
mips64 platforms is N64, having said that autoconf decides to poke at
the platform for finding these kind of sizes which fails when you are
doing cross compiling hence we have to cache it." - Khem Raj

[YOCTO #5935]

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 meta/site/mips64-linux | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/site/mips64-linux b/meta/site/mips64-linux
index 4449c96..ed0fbbe 100644
--- a/meta/site/mips64-linux
+++ b/meta/site/mips64-linux
@@ -35,6 +35,7 @@ glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
 ac_cv_alignof_guint32=4
 ac_cv_alignof_guint64=8
 ac_cv_alignof_unsigned_long=8
+ac_cv_sizeof_ssize_t=8
 
 # libpcap
 ac_cv_linux_vers=${ac_cv_linux_vers=2}
-- 
1.8.3.2


