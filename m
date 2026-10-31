Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3740.1793405759587732044
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=kLuzt86y;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so8104765e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405758; x=1794010558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XJyI0grHAWQ2SKe1I9yHMJY+ZwqKLuwF46fLMNFDNn0=;
        b=kLuzt86yLVazcHQEFCYCns5wN9dtJwivn4PursazcQWzpsfWy4DHKf1u9DuDHt0xaA
         Mb1hUA7lLBd311HV+qYUp9fdgYP76tdKDITPRrHpNhrGGr5wYue+z76tsiEKBxfEBCA3
         Y7+UgH8bPyg4vMS7MuAsgRhq3anP2iRr91eMgz/ucB378TQoHwlE7hpNYCDpGERvJ9+e
         tomKUMH3bz9e79uUXruCEeoEH6Rt5OUXLKQdmUM+Y/zTbUMECSCm4O0pdwr7T4/47gMy
         q1ZwSUMnJbioWjIioJHLjbLt3XsMaTiV4G5LksKaR+t/BVlumoz+eix9V0cDEHkbCgc+
         Ggrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405758; x=1794010558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XJyI0grHAWQ2SKe1I9yHMJY+ZwqKLuwF46fLMNFDNn0=;
        b=ImVebGdQWo7gHjgkY8lOV8DzFrRqjh+DOpq2icV1DLWTRZUNJLjGQQLm7SRkEKSnYC
         VsmXRXdmdnGGQVvoFLq/qardkNxnp3K4JbUjz540ReKSnxEtPDTroS+83iyY8LLUru1Q
         Ux8BTEUltnQyKnW6IsDdr3hxXYz3Hun14LUminhBXOHodh9qPQe1FTa960MX204+stZM
         cKLx0N6TCtWXDC/fo+FG2KaERz4vZ8Q70/LIwt4YuwH1LwvcQ00EV7sypV+9872P3hyg
         Texa2Z1Z2CeMFAdIVmxRRf2fOE0pezS/+M3Um+/O0D2Y8hZh31E6HPdnPKf7EslpRPm0
         Pfhg==
X-Gm-Message-State: AFq9FYK8pia3FVVwNwQ4zUo0TpgS+WgbIawUt8BgsLwEKvKLJuo0MOfF
	8KSPAQheccQRKkMs8xHUUr5U5WejVPl3ZdCR4NSRz/7X/WzmToRxsAllEuk0KtbsCaq/tlRVeVs
	Ge4sQsmI=
X-Gm-Gg: AYBFou1VpF9GyAf01XuNsYL/69iATvuSWQfamMmr0yOy3GI7zPgqft4Dekz5jF05FX3
	8vOvTUqtgH0GB59H3KFBLk3ixl3/Re1o72odjr4k2ZKysm3SvLrC3QY51zq3A/regRah+TVy0ab
	/UwiQ6ZGdV8q/BTJVv2b9D1NYs/vgOXr5PkZhlnOljZniJsykooqldlBj/yAVCGH+FyCFm1JB7w
	Su99l1sVLX7HksL4eFIh92JvXP45wbzn/xmDrwPxMZfbyiFEuEb2EhkUOXr5daQyPXRiRDYHIFn
	/yDG9kwG6zK6t4x018mVDlf6nAgIYC+wsuuNMxnhnj+wS2TPFGrL6Iz48G6kwVaWp4ydAPnUph1
	mt8WmN3JR02GWqTUUGAhbhXzg374mQo6Z/9VMHmrbQAhlEvxZVCZi30VT392uaPPCueEWimgjQN
	lyHOioxvV911p5zKbcFXCBCLfi9jNwLIaVCJWEwUPqKcW2tpDwbHHDRMESpKLf29RXvnBfg0UYa
	15N1Fxxb4dAam925d44uWuqdNAUttXDnYsmGGQI3WwgwQaKkrgEsYOjLXLW/btgvf5zgDeCxW3S
	LHH973ytrwNgwq6ppcdGDsARR5mAbQMTKlhadEwPAY3AHqMTroBeBBrpW+rjhRsphPyXZMQzC8/
	YB1PNQ07EGo+D5VLjrJiTjZnckhlX
X-Received: by 2002:a05:600c:524c:b0:4a1:fcfa:2a07 with SMTP id 5b1f17b1804b1-4ac1960dd8dmr86629295e9.30.1793405757841;
        Fri, 30 Oct 2026 17:15:57 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.15.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:15:57 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 25/55] glibc: patch CVE-2026-19542
Date: Sat, 31 Oct 2026 01:14:46 +0100
Message-ID: <63acfcce6e0d6f926b5328d52407be935332493c.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249100
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch [1] which is [2] backported to 2.41 (oldest release still
receiving security updates) which is mentioned in [3].

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=9318c2571576017d280a31b7b9ab576c9b696b1a
[2] https://sourceware.org/git/?p=glibc.git;a=commit;h=e2789c46e3bfdcd67a82bea9946b315c179e83d3
[3] https://security-tracker.debian.org/tracker/CVE-2026-19542

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: fixed a 3.41 -> 2.41 typo in branch name]
---
 .../glibc/glibc/0035-CVE-2026-19542.patch     | 99 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0035-CVE-2026-19542.patch

diff --git a/meta/recipes-core/glibc/glibc/0035-CVE-2026-19542.patch b/meta/recipes-core/glibc/glibc/0035-CVE-2026-19542.patch
new file mode 100644
index 00000000000..5c82606792c
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0035-CVE-2026-19542.patch
@@ -0,0 +1,99 @@
+From 9318c2571576017d280a31b7b9ab576c9b696b1a Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 14 Aug 2026 13:41:16 +0200
+Subject: [PATCH] misc: Fix out-of-bounds array write in tdelete (bug 34506)
+
+Allocate the maximum array sizes directly, instead of resizing
+the arrays as needed.  This eliminates alloca usage from the
+function, and fixes the out-of-bounds accesses.  The asserts
+guard against the bug coming back if the balancing of the tree
+turns out not to work correctly.
+
+Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+(cherry picked from commit e2789c46e3bfdcd67a82bea9946b315c179e83d3)
+
+CVE: CVE-2026-19542
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=9318c2571576017d280a31b7b9ab576c9b696b1a]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ misc/tsearch.c | 31 +++++++++++--------------------
+ 1 file changed, 11 insertions(+), 20 deletions(-)
+
+diff --git a/misc/tsearch.c b/misc/tsearch.c
+index d15260baed..350fe15bf0 100644
+--- a/misc/tsearch.c
++++ b/misc/tsearch.c
+@@ -85,6 +85,7 @@
+ #include <assert.h>
+ #include <stdalign.h>
+ #include <stddef.h>
++#include <stdint.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #include <search.h>
+@@ -406,12 +407,13 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
+   int cmp;
+   node *rootp = (node *) vrootp;
+   node root, unchained;
+-  /* Stack of nodes so we remember the parents without recursion.  It's
+-     _very_ unlikely that there are paths longer than 40 nodes.  The tree
+-     would need to have around 250.000 nodes.  */
+-  int stacksize = 40;
++  /* Stack of nodes so we remember the parents without recursion.  The
++     stack size is a conservative approximation of the maximum height
++     of a red-black tree, based on size of the address space.
++     Actual numbers are closer to 57 (32 bit) and 117 (63 bit).  */
++  enum { stacksize = 2 * UINTPTR_WIDTH };
+   int sp = 0;
+-  node **nodestack = alloca (sizeof (node *) * stacksize);
++  node *nodestack[stacksize];
+ 
+   if (rootp == NULL)
+     return NULL;
+@@ -424,14 +426,7 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
+   root = DEREFNODEPTR(rootp);
+   while ((cmp = (*compar) (key, root->key)) != 0)
+     {
+-      if (sp == stacksize)
+-	{
+-	  node **newstack;
+-	  stacksize += 20;
+-	  newstack = alloca (sizeof (node *) * stacksize);
+-	  nodestack = memcpy (newstack, nodestack, sp * sizeof (node *));
+-	}
+-
++      assert (sp < stacksize);
+       nodestack[sp++] = rootp;
+       p = DEREFNODEPTR(rootp);
+       if (cmp < 0)
+@@ -470,13 +465,7 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
+       node upn;
+       for (;;)
+ 	{
+-	  if (sp == stacksize)
+-	    {
+-	      node **newstack;
+-	      stacksize += 20;
+-	      newstack = alloca (sizeof (node *) * stacksize);
+-	      nodestack = memcpy (newstack, nodestack, sp * sizeof (node *));
+-	    }
++	  assert (sp < stacksize);
+ 	  nodestack[sp++] = parentp;
+ 	  parentp = up;
+ 	  upn = DEREFNODEPTR(up);
+@@ -541,6 +530,7 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
+ 		  SETNODEPTR(pp,q);
+ 		  /* Make sure pp is right if the case below tries to use
+ 		     it.  */
++		  assert (sp < stacksize);
+ 		  nodestack[sp++] = pp = LEFTPTR(q);
+ 		  q = RIGHT(p);
+ 		}
+@@ -625,6 +615,7 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
+ 		  SETLEFT(p,RIGHT(q));
+ 		  SETRIGHT(q,p);
+ 		  SETNODEPTR(pp,q);
++		  assert (sp < stacksize);
+ 		  nodestack[sp++] = pp = RIGHTPTR(q);
+ 		  q = LEFT(p);
+ 		}
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index b7f6278c95a..eb198427d1a 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -67,6 +67,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0032-CVE-2026-5450.patch \
            file://0033-CVE-2026-6791.patch \
            file://0034-CVE-2026-6368.patch \
+           file://0035-CVE-2026-19542.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
