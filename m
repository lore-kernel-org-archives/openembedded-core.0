Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RXnZv-0003ol-9s
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 06:28:31 +0100
Received: by yenq1 with SMTP id q1so1491784yen.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2011 21:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ZfGFP/qTxUnW5+1Nd5AOouibnUmNIIsSqWeMFc+th6I=;
	b=X3T7Q6GLWFiUQXSireBMp2oSX7czyXX5W2PvUAVAozGoBD8pYsefTPHXNZf1r49GIa
	WYLre3RWUB/3AFmuWbwy4fYMmnEwxsHTU8EevPlxIbCvg89dLQidjFH2QqlnPvHEBkwZ
	yK2k/bPXYjMPIrvz+9ybIdiKQnyS3bBsyKFv8=
Received: by 10.236.124.6 with SMTP id w6mr16492449yhh.94.1323148903380;
	Mon, 05 Dec 2011 21:21:43 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id l19sm57929084anc.14.2011.12.05.21.21.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Dec 2011 21:21:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Dec 2011 21:21:20 -0800
Message-Id: <eb2ba07928df06460ad8d27bb7ccf3a881ed0f4a.1323148566.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <2f734b193f63f8fe0625c758bc5c696bf93166ac.1323148566.git.raj.khem@gmail.com>
References: <2f734b193f63f8fe0625c758bc5c696bf93166ac.1323148566.git.raj.khem@gmail.com>
In-Reply-To: <cover.1323148566.git.raj.khem@gmail.com>
References: <cover.1323148566.git.raj.khem@gmail.com>
Subject: [PATCH 5/6] eglibc: Update 2.14 recipes to latest SVN tip
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
X-List-Received-Date: Tue, 06 Dec 2011 05:28:31 -0000

Adjust patches to apply on new sourcebase

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../eglibc-2.14/glibc-2.14-libdl-crash.patch       |   66 ++++++++++----------
 meta/recipes-core/eglibc/eglibc_2.14.bb            |    2 +-
 2 files changed, 35 insertions(+), 33 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-2.14/glibc-2.14-libdl-crash.patch b/meta/recipes-core/eglibc/eglibc-2.14/glibc-2.14-libdl-crash.patch
index e1f135c..1c30c9d 100644
--- a/meta/recipes-core/eglibc/eglibc-2.14/glibc-2.14-libdl-crash.patch
+++ b/meta/recipes-core/eglibc/eglibc-2.14/glibc-2.14-libdl-crash.patch
@@ -12,11 +12,11 @@ http://mailman.archlinux.org/pipermail/arch-commits/2011-June/137142.html
 http://svn.mandriva.com/cgi-bin/viewvc.cgi/packages/cooker/glibc/current/SOURCES/glibc-2.14-libdl-crash.patch?view=markup&pathrev=691343
 http://repos.archlinuxppc.org/wsvn/filedetails.php?repname=packages&path=%2Fglibc%2Ftrunk%2Fglibc-2.14-libdl-crash.patch
 
-diff --git a/elf/dl-close.c b/elf/dl-close.c
-index 73b2a2f..9bd91e3 100644
---- a/elf/dl-close.c
-+++ b/elf/dl-close.c
-@@ -119,17 +119,8 @@ _dl_close_worker (struct link_map *map)
+Index: libc/elf/dl-close.c
+===================================================================
+--- libc.orig/elf/dl-close.c	2011-12-05 20:16:38.000000000 -0800
++++ libc/elf/dl-close.c	2011-12-05 20:17:15.863326893 -0800
+@@ -119,17 +119,8 @@
    if (map->l_direct_opencount > 0 || map->l_type != lt_loaded
        || dl_close_state != not_pending)
      {
@@ -35,12 +35,12 @@ index 73b2a2f..9bd91e3 100644
 +	dl_close_state = rerun;
  
        /* There are still references to this object.  Do nothing more.  */
-       if (__builtin_expect (GLRO(dl_debug_mask) & DL_DEBUG_FILES, 0))
-diff --git a/elf/dl-deps.c b/elf/dl-deps.c
-index 9e30594..3890d00 100644
---- a/elf/dl-deps.c
-+++ b/elf/dl-deps.c
-@@ -478,6 +478,7 @@ _dl_map_object_deps (struct link_map *map,
+       if (__builtin_expect (GLRO_dl_debug_mask & DL_DEBUG_FILES, 0))
+Index: libc/elf/dl-deps.c
+===================================================================
+--- libc.orig/elf/dl-deps.c	2011-12-05 20:16:38.000000000 -0800
++++ libc/elf/dl-deps.c	2011-12-05 20:19:33.179326877 -0800
+@@ -478,6 +478,7 @@
  		  nneeded * sizeof needed[0]);
  	  atomic_write_barrier ();
  	  l->l_initfini = l_initfini;
@@ -48,7 +48,7 @@ index 9e30594..3890d00 100644
  	}
  
        /* If we have no auxiliary objects just go on to the next map.  */
-@@ -681,6 +682,7 @@ Filters not supported with LD_TRACE_PRELINKING"));
+@@ -678,6 +679,7 @@
    l_initfini[nlist] = NULL;
    atomic_write_barrier ();
    map->l_initfini = l_initfini;
@@ -56,18 +56,20 @@ index 9e30594..3890d00 100644
    if (l_reldeps != NULL)
      {
        atomic_write_barrier ();
-@@ -689,5 +691,5 @@ Filters not supported with LD_TRACE_PRELINKING"));
+@@ -686,7 +688,7 @@
        _dl_scope_free (old_l_reldeps);
      }
    if (old_l_initfini != NULL)
 -      map->l_orig_initfini = old_l_initfini;
-+    _dl_scope_free (old_l_initfini);
- }
-diff --git a/elf/dl-libc.c b/elf/dl-libc.c
-index 7be9483..a13fce3 100644
---- a/elf/dl-libc.c
-+++ b/elf/dl-libc.c
-@@ -265,13 +265,13 @@ libc_freeres_fn (free_mem)
++      _dl_scope_free (old_l_initfini);
+ 
+   if (errno_reason)
+     _dl_signal_error (errno_reason == -1 ? 0 : errno_reason, objname,
+Index: libc/elf/dl-libc.c
+===================================================================
+--- libc.orig/elf/dl-libc.c	2011-10-22 09:34:03.000000000 -0700
++++ libc/elf/dl-libc.c	2011-12-05 20:17:15.863326893 -0800
+@@ -265,13 +265,13 @@
  
    for (Lmid_t ns = 0; ns < GL(dl_nns); ++ns)
      {
@@ -82,7 +84,7 @@ index 7be9483..a13fce3 100644
  	  while (lnp != NULL)
  	    {
  	      struct libname_list *old = lnp;
-@@ -279,6 +279,10 @@ libc_freeres_fn (free_mem)
+@@ -279,6 +279,10 @@
  	      if (! old->dont_free)
  		free (old);
  	    }
@@ -93,11 +95,11 @@ index 7be9483..a13fce3 100644
  	}
  
        if (__builtin_expect (GL(dl_ns)[ns]._ns_global_scope_alloc, 0) != 0
-diff --git a/elf/rtld.c b/elf/rtld.c
-index 4a9109e..617e30e 100644
---- a/elf/rtld.c
-+++ b/elf/rtld.c
-@@ -2251,6 +2251,7 @@ ERROR: ld.so: object '%s' cannot be loaded as audit interface: %s; ignored.\n",
+Index: libc/elf/rtld.c
+===================================================================
+--- libc.orig/elf/rtld.c	2011-10-22 09:34:03.000000000 -0700
++++ libc/elf/rtld.c	2011-12-05 20:17:15.863326893 -0800
+@@ -2264,6 +2264,7 @@
  	      lnp->dont_free = 1;
  	      lnp = lnp->next;
  	    }
@@ -105,11 +107,11 @@ index 4a9109e..617e30e 100644
  
  	  if (l != &GL(dl_rtld_map))
  	    _dl_relocate_object (l, l->l_scope, GLRO(dl_lazy) ? RTLD_LAZY : 0,
-diff --git a/include/link.h b/include/link.h
-index e877104..051b99a 100644
---- a/include/link.h
-+++ b/include/link.h
-@@ -192,6 +192,9 @@ struct link_map
+Index: libc/include/link.h
+===================================================================
+--- libc.orig/include/link.h	2011-10-22 09:32:35.000000000 -0700
++++ libc/include/link.h	2011-12-05 20:17:15.863326893 -0800
+@@ -192,6 +192,9 @@
  						 during LD_TRACE_PRELINKING=1
  						 contains any DT_SYMBOLIC
  						 libraries.  */
@@ -119,7 +121,7 @@ index e877104..051b99a 100644
  
      /* Collected information about own RPATH directories.  */
      struct r_search_path_struct l_rpath_dirs;
-@@ -240,9 +243,6 @@ struct link_map
+@@ -240,9 +243,6 @@
  
      /* List of object in order of the init and fini calls.  */
      struct link_map **l_initfini;
diff --git a/meta/recipes-core/eglibc/eglibc_2.14.bb b/meta/recipes-core/eglibc/eglibc_2.14.bb
index 5019875..fd384f4 100644
--- a/meta/recipes-core/eglibc/eglibc_2.14.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.14.bb
@@ -1,6 +1,6 @@
 require eglibc.inc
 
-SRCREV = "15225"
+SRCREV = "15870"
 
 DEPENDS += "gperf-native"
 PR = "r1"
-- 
1.7.5.4



