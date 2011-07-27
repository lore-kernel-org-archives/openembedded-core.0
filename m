Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QlyuX-00028l-U4
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 09:52:10 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jul 2011 00:47:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,275,1309762800"; d="scan'208";a="31949374"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 27 Jul 2011 00:47:34 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 00:47:17 -0700
Message-Id: <7f9b1ed3edb4bd9e8e23e6d191248a0c28d924e6.1311752531.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
Subject: [Consolidated & Tested 27/35] siteinfo: Move the rp-pppoe entry to common-linux
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
X-List-Received-Date: Wed, 27 Jul 2011 07:52:10 -0000

From: Tom Rini <tom_rini@mentor.com>

More oe.dev re-sync.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/site/arm-linux           |    3 ---
 meta/site/common-linux        |    3 +++
 meta/site/ix86-common         |    3 ---
 meta/site/mips-linux          |    3 ---
 meta/site/mips-linux-uclibc   |    3 ---
 meta/site/mipsel-linux        |    3 ---
 meta/site/mipsel-linux-uclibc |    2 --
 meta/site/sh-common           |    3 ---
 8 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/meta/site/arm-linux b/meta/site/arm-linux
index 96a1dde..1211ad4 100644
--- a/meta/site/arm-linux
+++ b/meta/site/arm-linux
@@ -171,6 +171,3 @@ ac_cv_func_pthread_attr_getstack=${ac_cv_func_pthread_attr_getstack=yes}
 ac_cv_member_struct_sockaddr_sa_len=${ac_cv_member_struct_sockaddr_sa_len=no}
 ac_cv_gnet_have_abstract_sockets=${ac_cv_gnet_have_abstract_sockets=no}
 gnet_sockaddr_family_field_name=${gnet_sockaddr_family_field_name=ss_family}
-
-# rp-pppoe
-rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
diff --git a/meta/site/common-linux b/meta/site/common-linux
index 7cdfb63..981100c 100644
--- a/meta/site/common-linux
+++ b/meta/site/common-linux
@@ -23,3 +23,6 @@ bash_cv_unusable_rtsigs=${bash_cv_unusable_rtsigs=no}
 # mysql
 ac_cv_sys_restartable_syscalls=${ac_cv_sys_restartable_syscalls=yes}
 ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes}
+
+# rp-pppoe
+rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index cacf7ee..fa32bb2 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -187,9 +187,6 @@ ac_cv_pread=${ac_cv_pread=no}
 ac_cv_pwrite=${ac_cv_pwrite=no}
 php_cv_lib_cookie_io_functions_use_off64_t=${php_cv_lib_cookie_io_functions_use_off64_t=yes}
 
-# rp-pppoe
-rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
-
 # rsync
 rsync_cv_HAVE_BROKEN_LARGEFILE=${rsync_cv_HAVE_BROKEN_LARGEFILE=no}
 rsync_cv_HAVE_SOCKETPAIR=${rsync_cv_HAVE_SOCKETPAIR=yes}
diff --git a/meta/site/mips-linux b/meta/site/mips-linux
index 495df5f..f6442ce 100644
--- a/meta/site/mips-linux
+++ b/meta/site/mips-linux
@@ -63,9 +63,6 @@ wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
 wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
 wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
 
-# rp-pppoe
-rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
-
 # db3
 db_cv_align_t=${db_cv_align_t='unsigned long long'}
 db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
diff --git a/meta/site/mips-linux-uclibc b/meta/site/mips-linux-uclibc
index 495df5f..f6442ce 100644
--- a/meta/site/mips-linux-uclibc
+++ b/meta/site/mips-linux-uclibc
@@ -63,9 +63,6 @@ wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
 wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
 wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
 
-# rp-pppoe
-rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
-
 # db3
 db_cv_align_t=${db_cv_align_t='unsigned long long'}
 db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
diff --git a/meta/site/mipsel-linux b/meta/site/mipsel-linux
index 0959883..76c0dc0 100644
--- a/meta/site/mipsel-linux
+++ b/meta/site/mipsel-linux
@@ -64,9 +64,6 @@ wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
 wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
 wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
 
-# rp-pppoe
-rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
-
 # db3
 db_cv_align_t=${db_cv_align_t='unsigned long long'}
 db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
diff --git a/meta/site/mipsel-linux-uclibc b/meta/site/mipsel-linux-uclibc
index 25fa8b5..838bdff 100644
--- a/meta/site/mipsel-linux-uclibc
+++ b/meta/site/mipsel-linux-uclibc
@@ -113,5 +113,3 @@ samba_cv_sysquotas_file=${samba_cv_sysquotas_file=lib/sysquotas_4A.c}
 # doesn't cache it.
 samba_cv_LINUX_LFS_SUPPORT=${samba_cv_LINUX_LFS_SUPPORT=yes}
 
-# rp-pppoe
-rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
diff --git a/meta/site/sh-common b/meta/site/sh-common
index 7fe36cc..b6b0bf5 100644
--- a/meta/site/sh-common
+++ b/meta/site/sh-common
@@ -230,9 +230,6 @@ cv_mono_sizeof_sunpath=108
 mysql_cv_func_atomic_sub=${mysql_cv_func_atomic_sub=no}
 mysql_cv_func_atomic_add=${mysql_cv_func_atomic_add=no}
 
-# rp-pppoe
-rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
-
 # gettext
 am_cv_func_working_getline=${am_cv_func_working_getline=yes}
 
-- 
1.7.3.4



