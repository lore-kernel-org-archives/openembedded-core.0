Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QoivX-0002CB-CC
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 23:24:31 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Aug 2011 14:20:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,312,1309762800"; d="scan'208";a="34056987"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 03 Aug 2011 14:19:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 14:19:42 -0700
Message-Id: <128dc2a86e91e4410193e488253ded48944815dd.1312394851.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312394851.git.sgw@linux.intel.com>
References: <cover.1312394851.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312394851.git.sgw@linux.intel.com>
References: <cover.1312394851.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 29/33] Various siteinfo: Drop rp-pppoe variables
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
X-List-Received-Date: Wed, 03 Aug 2011 21:24:31 -0000

From: Tom Rini <tom_rini@mentor.com>

These variables were wrong on big-endian machines and this recipe is now
handled in meta-oe (along with the siteinfo files).

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/site/arm-linux           |    3 ---
 meta/site/ix86-common         |    3 ---
 meta/site/mips-linux          |    4 ----
 meta/site/mips-linux-uclibc   |    3 ---
 meta/site/mipsel-linux        |    3 ---
 meta/site/mipsel-linux-uclibc |    3 ---
 meta/site/sh-common           |    3 ---
 7 files changed, 0 insertions(+), 22 deletions(-)

diff --git a/meta/site/arm-linux b/meta/site/arm-linux
index 2f4974b..14b1889 100644
--- a/meta/site/arm-linux
+++ b/meta/site/arm-linux
@@ -158,6 +158,3 @@ ac_cv_func_pthread_attr_getstack=${ac_cv_func_pthread_attr_getstack=yes}
 ac_cv_member_struct_sockaddr_sa_len=${ac_cv_member_struct_sockaddr_sa_len=no}
 ac_cv_gnet_have_abstract_sockets=${ac_cv_gnet_have_abstract_sockets=no}
 gnet_sockaddr_family_field_name=${gnet_sockaddr_family_field_name=ss_family}
-
-# rp-pppoe
-rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index 0aa54c7..512c9a0 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -147,9 +147,6 @@ ac_cv_pread=${ac_cv_pread=no}
 ac_cv_pwrite=${ac_cv_pwrite=no}
 php_cv_lib_cookie_io_functions_use_off64_t=${php_cv_lib_cookie_io_functions_use_off64_t=yes}
 
-# rp-pppoe
-rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
-
 # rsync
 rsync_cv_HAVE_BROKEN_LARGEFILE=${rsync_cv_HAVE_BROKEN_LARGEFILE=no}
 rsync_cv_HAVE_SOCKETPAIR=${rsync_cv_HAVE_SOCKETPAIR=yes}
diff --git a/meta/site/mips-linux b/meta/site/mips-linux
index b1f8be2..876d997 100644
--- a/meta/site/mips-linux
+++ b/meta/site/mips-linux
@@ -45,10 +45,6 @@ libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
 # ncftp
 wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
 wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
-wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
-
-# rp-pppoe
-rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
 
 # db
 db_cv_align_t=${db_cv_align_t='unsigned long long'}
diff --git a/meta/site/mips-linux-uclibc b/meta/site/mips-linux-uclibc
index b1f8be2..73167bb 100644
--- a/meta/site/mips-linux-uclibc
+++ b/meta/site/mips-linux-uclibc
@@ -47,9 +47,6 @@ wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
 wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
 wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
 
-# rp-pppoe
-rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
-
 # db
 db_cv_align_t=${db_cv_align_t='unsigned long long'}
 db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
diff --git a/meta/site/mipsel-linux b/meta/site/mipsel-linux
index 3c70af0..15eded8 100644
--- a/meta/site/mipsel-linux
+++ b/meta/site/mipsel-linux
@@ -47,9 +47,6 @@ wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
 wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
 wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
 
-# rp-pppoe
-rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
-
 # db
 db_cv_align_t=${db_cv_align_t='unsigned long long'}
 db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
diff --git a/meta/site/mipsel-linux-uclibc b/meta/site/mipsel-linux-uclibc
index cdf4757..f921cda 100644
--- a/meta/site/mipsel-linux-uclibc
+++ b/meta/site/mipsel-linux-uclibc
@@ -98,6 +98,3 @@ samba_cv_sysquotas_file=${samba_cv_sysquotas_file=lib/sysquotas_4A.c}
 # This cached value needs a local patch to pick it up, upstream 3.0.14a
 # doesn't cache it.
 samba_cv_LINUX_LFS_SUPPORT=${samba_cv_LINUX_LFS_SUPPORT=yes}
-
-# rp-pppoe
-rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
diff --git a/meta/site/sh-common b/meta/site/sh-common
index d2db0c6..c386266 100644
--- a/meta/site/sh-common
+++ b/meta/site/sh-common
@@ -200,9 +200,6 @@ bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=missing}
 mysql_cv_func_atomic_sub=${mysql_cv_func_atomic_sub=no}
 mysql_cv_func_atomic_add=${mysql_cv_func_atomic_add=no}
 
-# rp-pppoe
-rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
-
 # gettext
 am_cv_func_working_getline=${am_cv_func_working_getline=yes}
 
-- 
1.7.3.4



