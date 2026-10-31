Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3742.1793405763703231585
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=oG/J9ph5;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so10908965e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405762; x=1794010562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aqmdWtKznIjZ3teWeP1yQrf0EEuIDYwfR2aDUfUeDz8=;
        b=oG/J9ph5HkiNvKGqAGerVmdkFKv/qluJHb26Q9EWlVLLaq6l+f/A+8lJrbvDfS9pbM
         aWa1B6gfejfhVvm/95k5SQFjEoBGWyWo+Vb++9Ba/CVgbM+hiRhN1CmhqZ+3Zaa8ZdHB
         PxrY1aWqdZE1VU3vjWpeJrK6urM4lNcX/SgZ7zNo4kSO5uwtJ97GBEKh1va0bKgIylt/
         nFoyKoLCUROM5kBopyeT/QU0gwmAsZvKjOH9jY2MWJwLUfMicPSce/E91GgyedbU3pag
         jxMeXgvS9vacLq4GULLX+f+p++oqn4iJcxDBilk4/Q/FIJbIs5iLhiIfD4uu4WnBKZZk
         CrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405762; x=1794010562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aqmdWtKznIjZ3teWeP1yQrf0EEuIDYwfR2aDUfUeDz8=;
        b=BKsSFEsRfwvnoakzl8VPRRzLjPTtR22s1+j0dqsOTY4k1r7syPTuX6/rW3Ub7ypfhs
         QrUQBcKlgU4ukX/9ZVczYTNNR0FqTot97CupKaUm3+pTGDKX9TbOdRWZMtuSKcsnADVu
         mSuH/71tvQBK9aaSWe4fg5kZNuWvdHYpTn6J3H1Y0WHV1di3ksujtZFAZ1W5gxISxutY
         lqEN/DF/LPO+KDxoXVEMht3CJ4m0x40lxbLZZ0j4K66mfP+RmP6YfgiqzrEsj7UPMUZ3
         YMwslYIDCui0vNKNntrsuJcHYrC06xEqIvZ4m+i0yIg5FYWYIzYCRxjOshZ6X4zeDgIz
         GBSg==
X-Gm-Message-State: AFq9FYJ7PAS6mAyOX7MbyY+OscuCuJuTcORcuiFK1Dt3mvyIdnyBKBSm
	3iC5401waI0kBTDW20jYLG+bGpvFVORQYuwUX1uqE7S4QaB4K5KJtH5BDOzmiNuLzzOEWg29KIU
	0tsIp4yI=
X-Gm-Gg: AYBFou36giICmyZW7wXatc8pd+8FrbVYPuRr+kk7ln+ulWnnqWagYt/hSh34PFGTkQJ
	6ryU9bn8xQDk03dTon+v9Nm414ZcMTUTT0G1MoU6EWTWwZxsH6cU/7iGPzZmhPdkoX5GZkGbQkf
	Lx/qPBXH9TKrEOjatL7VJRPLYbmfxugP2JZViJ57z5USS+XHaHH06+rhgRvmtpHudAOJiE6Qs5+
	HQ2wx1eZhdD4HglXf8eRVqqOdOKoVltSD3IWNSRsC3lc4hlaVMMurpkuzJ3+0Vh4ToxV6BryKQ9
	lfSp2sA1duD/KgD93Yx3R4kv2inx3AXwYkhJzq8Nabarr5Jf9RUd9q4nVtEOlnmxLAs3nBWCtxX
	yRjovFG87UTxpPlcl7i6BBMqK8YypN8SJQprldPe387uwd8SG4YkT4zoMzbrYzohxyKTeeHIxXO
	fswoghqC7fwn0Y8uXtcf2NJgnB1WkAY/5CA4YRoCnCH2/DgUv31qrLB1BV/OA2omk1dP58bRK/t
	Ih6QV1GGvi8ubqNeXUV84GDziv3+QU4TDv499P2abWH8NpdyPqPyHyvbshkdNvJQuI7LGmyynIV
	X9u/eEq297qSJhB5LI6A0moTv41oTHi7t+06qxCmR+OAjS4CIXgr7nTLr/ra30MGRCj67J82edI
	SWjwGezhXX8OEonrMVCa4qZHsPwdZ
X-Received: by 2002:a05:600c:4f52:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-4ac18e5d029mr94999295e9.26.1793405761820;
        Fri, 30 Oct 2026 17:16:01 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.16.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:16:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 32/55] glibc: patch CVE-2026-89092
Date: Sat, 31 Oct 2026 01:14:53 +0100
Message-ID: <c30a7621120d893a80d00cf0ceae860052214fd6.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249107
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE from 2.41 branch (oldest release
still receiving security updates).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: fixed a 3.41 -> 2.41 typo in branch name]
---
 .../glibc/glibc/0047-CVE-2026-89092.patch     | 245 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
 2 files changed, 246 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0047-CVE-2026-89092.patch

diff --git a/meta/recipes-core/glibc/glibc/0047-CVE-2026-89092.patch b/meta/recipes-core/glibc/glibc/0047-CVE-2026-89092.patch
new file mode 100644
index 00000000000..8df9dc904e4
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0047-CVE-2026-89092.patch
@@ -0,0 +1,245 @@
+From fa3ea0362354af7370abb5fe8c6f31a32a73af8e Mon Sep 17 00:00:00 2001
+From: DJ Delorie <dj@redhat.com>
+Date: Mon, 28 Sep 2026 14:27:16 +0200
+Subject: [PATCH] CVE-2026-89092: nscd: replace alloca with malloc in aicache,
+ hstcache
+
+This changes the alloca fallback to a malloc fallback
+in the addrinfo and host cache code.
+
+This fixes bug 34624.
+
+Co-authored-by: Florian Weimer <fweimer@redhat.com>
+Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+(cherry picked from commit cbf59b836645b6ac69ad8c47a560598bc4942ecc)
+
+CVE: CVE-2026-89092
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=fa3ea0362354af7370abb5fe8c6f31a32a73af8e]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ nscd/aicache.c  | 27 ++++++++++++++++++---------
+ nscd/hstcache.c | 47 ++++++++++++++++++++++++++++++++++-------------
+ 2 files changed, 52 insertions(+), 22 deletions(-)
+
+diff --git a/nscd/aicache.c b/nscd/aicache.c
+index 6f47236627..1ac86b86d8 100644
+--- a/nscd/aicache.c
++++ b/nscd/aicache.c
+@@ -93,7 +93,9 @@ addhstaiX (struct database_dyn *db, int fd, request_header *req,
+   int32_t ttl = INT32_MAX;
+   ssize_t total = 0;
+   char *key_copy = NULL;
+-  bool alloca_used = false;
++  /* If not NULL, dataset is a temporary dataset not inserted into the
++     database, and needs to be free'd.  */
++  void *dataset_alloc = NULL;
+   time_t timeout = MAX_TIMEOUT_VALUE;
+ 
+   while (!no_more)
+@@ -164,10 +166,12 @@ addhstaiX (struct database_dyn *db, int fd, request_header *req,
+ 	      /* We cannot permanently add the result in the moment.  But
+ 		 we can provide the result as is.  Store the data in some
+ 		 temporary memory.  */
+-	      dataset = (struct dataset *) alloca (total + req->key_len);
++	      dataset = (struct dataset *) malloc (total + req->key_len);
++	      if (dataset == NULL)
++		goto out;
+ 
+ 	      /* We cannot add this record to the permanent database.  */
+-	      alloca_used = true;
++	      dataset_alloc = dataset;
+ 	    }
+ 
+ 	  /* Fill in the address and address families.  */
+@@ -336,10 +340,12 @@ addhstaiX (struct database_dyn *db, int fd, request_header *req,
+ 	      /* We cannot permanently add the result in the moment.  But
+ 		 we can provide the result as is.  Store the data in some
+ 		 temporary memory.  */
+-	      dataset = (struct dataset *) alloca (total + req->key_len);
++	      dataset = (struct dataset *) malloc (total + req->key_len);
++	      if (dataset == NULL)
++		goto out;
+ 
+ 	      /* We cannot add this record to the permanent database.  */
+-	      alloca_used = true;
++	      dataset_alloc = dataset;
+ 	    }
+ 
+ 	  /* Fill in the address and address families.  */
+@@ -391,8 +397,7 @@ addhstaiX (struct database_dyn *db, int fd, request_header *req,
+ 						   resp)) == 0)
+ 	    {
+ 	      /* The data has not changed.  We will just bump the
+-		 timeout value.  Note that the new record has been
+-		 allocated on the stack and need not be freed.  */
++		 timeout value.  */
+ 	      dh->timeout = dataset->head.timeout;
+ 	      dh->ttl = dataset->head.ttl;
+ 	      ++dh->nreloads;
+@@ -410,7 +415,9 @@ addhstaiX (struct database_dyn *db, int fd, request_header *req,
+ 		  key_copy = (char *) newp + (key_copy - (char *) dataset);
+ 
+ 		  dataset = memcpy (newp, dataset, total + req->key_len);
+-		  alloca_used = false;
++
++		  free (dataset_alloc);
++		  dataset_alloc = NULL;
+ 		}
+ 
+ 	      /* Mark the old record as obsolete.  */
+@@ -488,7 +495,7 @@ next_nip:
+  out:
+   __resolv_context_put (ctx);
+ 
+-  if (dataset != NULL && !alloca_used)
++  if (dataset != NULL && dataset_alloc == NULL)
+     {
+       /* If necessary, we also propagate the data to disk.  */
+       if (db->persistent)
+@@ -514,6 +521,8 @@ next_nip:
+   scratch_buffer_free (&tmpbuf4);
+   scratch_buffer_free (&canonbuf);
+ 
++  free (dataset_alloc);
++
+   return timeout;
+ }
+ 
+diff --git a/nscd/hstcache.c b/nscd/hstcache.c
+index 7b3a8ab1ea..11af5cb34a 100644
+--- a/nscd/hstcache.c
++++ b/nscd/hstcache.c
+@@ -15,7 +15,6 @@
+    You should have received a copy of the GNU General Public License
+    along with this program; if not, see <https://www.gnu.org/licenses/>.  */
+ 
+-#include <alloca.h>
+ #include <assert.h>
+ #include <errno.h>
+ #include <error.h>
+@@ -187,7 +186,7 @@ cache_addhst (struct database_dyn *db, int fd, request_header *req,
+       /* Determine the I/O structure.  */
+       size_t h_name_len = strlen (hst->h_name) + 1;
+       size_t h_aliases_cnt;
+-      uint32_t *h_aliases_len;
++      uint32_t *h_aliases_len = NULL;
+       size_t h_addr_list_cnt;
+       char *addresses;
+       char *aliases;
+@@ -201,7 +200,13 @@ cache_addhst (struct database_dyn *db, int fd, request_header *req,
+       for (cnt = 0; hst->h_aliases[cnt] != NULL; ++cnt)
+ 	++h_aliases_cnt;
+       /* Determine the length of all aliases.  */
+-      h_aliases_len = (uint32_t *) alloca (h_aliases_cnt * sizeof (uint32_t));
++      if (h_aliases_cnt > 0)
++	{
++	  h_aliases_len = (uint32_t *) reallocarray (NULL, h_aliases_cnt,
++						     sizeof (uint32_t));
++	  if (h_aliases_len == NULL)
++	    return MAX_TIMEOUT_VALUE;
++	}
+       total = 0;
+       for (cnt = 0; cnt < h_aliases_cnt; ++cnt)
+ 	{
+@@ -215,8 +220,11 @@ cache_addhst (struct database_dyn *db, int fd, request_header *req,
+ 	++h_addr_list_cnt;
+ 
+       if (h_addr_list_cnt == 0)
+-	/* Invalid entry.  */
+-	return MAX_TIMEOUT_VALUE;
++	{
++	  /* Invalid entry.  */
++	  free (h_aliases_len);
++	  return MAX_TIMEOUT_VALUE;
++	}
+ 
+       total += (sizeof (struct dataset)
+ 		+ h_name_len
+@@ -227,8 +235,10 @@ cache_addhst (struct database_dyn *db, int fd, request_header *req,
+ 	 change.  Allocate memory on the cache since it is likely
+ 	 discarded anyway.  If it turns out to be necessary to have a
+ 	 new record we can still allocate real memory.  */
+-      bool alloca_used = false;
+       dataset = NULL;
++      /* If not NULL, dataset is a temporary dataset not inserted into
++	 the database, and needs to be free'd.  */
++      void *dataset_alloc = NULL;
+ 
+       /* If the record contains more than one IP address (used for
+ 	 load balancing etc) don't cache the entry.  This is something
+@@ -244,10 +254,15 @@ cache_addhst (struct database_dyn *db, int fd, request_header *req,
+ 	  /* We cannot permanently add the result in the moment.  But
+ 	     we can provide the result as is.  Store the data in some
+ 	     temporary memory.  */
+-	  dataset = (struct dataset *) alloca (total + req->key_len);
++	  dataset = (struct dataset *) malloc (total + req->key_len);
++	  if (dataset == NULL)
++	    {
++	      free (h_aliases_len);
++	      return MAX_TIMEOUT_VALUE;
++	    }
+ 
+ 	  /* We cannot add this record to the permanent database.  */
+-	  alloca_used = true;
++	  dataset_alloc = dataset;
+ 	}
+ 
+       timeout = datahead_init_pos (&dataset->head, total + req->key_len,
+@@ -270,7 +285,8 @@ cache_addhst (struct database_dyn *db, int fd, request_header *req,
+       cp = dataset->strdata;
+ 
+       cp = mempcpy (cp, hst->h_name, h_name_len);
+-      cp = mempcpy (cp, h_aliases_len, h_aliases_cnt * sizeof (uint32_t));
++      if (h_aliases_cnt > 0)
++	cp = mempcpy (cp, h_aliases_len, h_aliases_cnt * sizeof (uint32_t));
+ 
+       /* The normal addresses first.  */
+       addresses = cp;
+@@ -282,6 +298,8 @@ cache_addhst (struct database_dyn *db, int fd, request_header *req,
+       for (cnt = 0; cnt < h_aliases_cnt; ++cnt)
+ 	cp = mempcpy (cp, hst->h_aliases[cnt], h_aliases_len[cnt]);
+ 
++      free (h_aliases_len);
++
+       assert (cp
+ 	      == dataset->strdata + total - offsetof (struct dataset,
+ 						      strdata));
+@@ -307,8 +325,7 @@ cache_addhst (struct database_dyn *db, int fd, request_header *req,
+ 			 dh->allocsize - offsetof (struct dataset, resp)) == 0)
+ 	    {
+ 	      /* The data has not changed.  We will just bump the
+-		 timeout value.  Note that the new record has been
+-		 allocated on the stack and need not be freed.  */
++		 timeout value.  */
+ 	      assert (h_addr_list_cnt == 1);
+ 	      dh->ttl = dataset->head.ttl;
+ 	      dh->timeout = dataset->head.timeout;
+@@ -334,7 +351,9 @@ cache_addhst (struct database_dyn *db, int fd, request_header *req,
+ 		      key_copy = (char *) newp + (key_copy - (char *) dataset);
+ 
+ 		      dataset = memcpy (newp, dataset, total + req->key_len);
+-		      alloca_used = false;
++
++		      free (dataset_alloc);
++		      dataset_alloc = NULL;
+ 		    }
+ 		}
+ 
+@@ -362,7 +381,7 @@ cache_addhst (struct database_dyn *db, int fd, request_header *req,
+ 	 the current cache handling cannot handle and it is more than
+ 	 questionable whether it is worthwhile complicating the cache
+ 	 handling just for handling such a special case. */
+-      if (! alloca_used)
++      if (dataset_alloc == NULL)
+ 	{
+ 	  /* If necessary, we also propagate the data to disk.  */
+ 	  if (db->persistent)
+@@ -393,6 +412,8 @@ cache_addhst (struct database_dyn *db, int fd, request_header *req,
+ 
+ 	  pthread_rwlock_unlock (&db->lock);
+ 	}
++      free (dataset_alloc);
++      dataset_alloc = NULL;
+     }
+ 
+   if (__builtin_expect (!all_written, 0) && debug_level > 0)
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index 3b27328c21a..0fe9c41662b 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -75,6 +75,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0040-CVE-2026-18374-01.patch \
            file://0041-CVE-2026-18374-02.patch \
            file://0042-CVE-2026-8674.patch \
+           file://0047-CVE-2026-89092.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
