Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web11.162.1630174317051935650
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=C9hhtKgA;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.46, mailfrom: steve@sakoman.com)
Received: by mail-io1-f46.google.com with SMTP id q3so13530941iot.3
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bZGAqwG3swnbLg+0+Yg1dh0j9VLImQ8pWAbpKKjAEds=;
        b=C9hhtKgAMBCf0E+U68RdrgzMUcWWPVBONFCweQc659ERccduJ8sfcV1FOfjB9i7+20
         l9R5TrFLPdr5H87zP3nk7lugF1omIrIhJLmmNdGXuR6nkPcCOKKNoHM64MhRK/or0Ma9
         6DlGSszzw/dQZD6NS0siBcf2lS/6ma2HHHEi7/t8lPRu3OXI+alyDJrs8mG1IK0rkXiI
         BpOyEBx0DW8r9bBGoKmaZ2PKqFCwj2nDUpyEIG0FZdNzgi9zEsDwfaURh/A+8w4uOTbY
         qTCBSm3rnAy8TY5Mo5U/pZ5/fk2oauE6wTv9T8k7KoC7cFIi9gdrglfjX76BhJQ9pwlM
         g6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bZGAqwG3swnbLg+0+Yg1dh0j9VLImQ8pWAbpKKjAEds=;
        b=ZvKSclfqKrsvFz41VLJd+m5IGrm7pjTEKdQ4zNLHMp9Plw7hTPlzkM3GCMJtYs5rDR
         7gQnXcjqEplL2leKX72vAyKDhjvc1tr7qkyTDqs+cSE0uzORDjXZL+KdZ+Dx/R/Bw1JW
         9yshW4JunKb2JiXpc12kPy9ipf9tfV3gD02OGTNn1BTvcyqafZWO/g0KxXwz5d86xvaS
         qAhyI48JPEqgSqeAJiMddNFwGf3MB5QfHPtP6mQUBr2J+gBEbIHu69HEoN0ci/cnIaKS
         YO0XJnZGipQsbO5Bc459D+gaYEZTfY1CTGPsl8aatBVg/pgo8aF+eovjy23Ot0C4qRZP
         9xjw==
X-Gm-Message-State: AOAM530r3MRk6wJhtAu99/DkHhrV6yt0sOJQv7d3BjxQcnizp9X9/iT+
	EXt3fvvsaIWZ/EhhSf1DXQlqlzK0PlazBIPw
X-Google-Smtp-Source: ABdhPJwjihpD6huA93NoSOEkYcR0qw0VWLe738V+TvnJy8UFybt+PX288cQGI6AEowEq0uW/NM6/kw==
X-Received: by 2002:a6b:d209:: with SMTP id q9mr2273033iob.206.1630174315830;
        Sat, 28 Aug 2021 11:11:55 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.11.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:11:55 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/36] glibc: Security fix CVE-2021-33574
Date: Sat, 28 Aug 2021 08:10:49 -1000
Message-Id: <d468eb9c0fa5f8fbd15abda6d0f04e3d25c50c26.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: glibc.org
MR: 111508
Type: Security Fix
Disposition: Backport from  https://sourceware.org/git/glibc.git
ChangeID: 815edc154adc45d08d00995862409f13014f885f
Description:

This version of glibc does not have __pthread_attr_setaffinity_np so an adapted patch was taken from 2.28  (https://sourceware.org/bugzilla/attachment.cgi?id=13497) and https://sourceware.org/git/?p=glibc.git;a=commit;h=42d359350510506b87101cf77202fefcbfc790cb

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glibc/glibc/CVE-2021-33574_1.patch        | 72 ++++++++++++++++++
 .../glibc/glibc/CVE-2021-33574_2.patch        | 73 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.31.bb         |  2 +
 3 files changed, 147 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-33574_1.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-33574_2.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-33574_1.patch b/meta/recipes-core/glibc/glibc/CVE-2021-33574_1.patch
new file mode 100644
index 0000000000..cef0ce54ed
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2021-33574_1.patch
@@ -0,0 +1,72 @@
+From 42d359350510506b87101cf77202fefcbfc790cb Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@linux-m68k.org>
+Date: Thu, 27 May 2021 12:49:47 +0200
+Subject: [PATCH] Use __pthread_attr_copy in mq_notify (bug 27896)
+
+Make a deep copy of the pthread attribute object to remove a potential
+use-after-free issue.
+
+Upstream-Status: Backport
+CVE: CVE-2021-33574 patch#1
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ NEWS                                |  4 ++++
+ sysdeps/unix/sysv/linux/mq_notify.c | 15 ++++++++++-----
+ 2 files changed, 14 insertions(+), 5 deletions(-)
+
+Index: git/NEWS
+===================================================================
+--- git.orig/NEWS
++++ git/NEWS
+@@ -7,6 +7,10 @@ using `glibc' in the "product" field.
+ 
+ Version 2.31.1
+ 
++  CVE-2021-33574: The mq_notify function has a potential use-after-free
++  issue when using a notification type of SIGEV_THREAD and a thread
++  attribute with a non-default affinity mask.
++
+ The following bugs are resolved with this release:
+   [19519] iconv(1) with -c option hangs on illegal multi-byte sequences
+     (CVE-2016-10228)
+Index: git/sysdeps/unix/sysv/linux/mq_notify.c
+===================================================================
+--- git.orig/sysdeps/unix/sysv/linux/mq_notify.c
++++ git/sysdeps/unix/sysv/linux/mq_notify.c
+@@ -135,8 +135,11 @@ helper_thread (void *arg)
+ 	    (void) __pthread_barrier_wait (&notify_barrier);
+ 	}
+       else if (data.raw[NOTIFY_COOKIE_LEN - 1] == NOTIFY_REMOVED)
+-	/* The only state we keep is the copy of the thread attributes.  */
+-	free (data.attr);
++	{
++	  /* The only state we keep is the copy of the thread attributes.  */
++	  pthread_attr_destroy (data.attr);
++	  free (data.attr);
++	}
+     }
+   return NULL;
+ }
+@@ -257,8 +260,7 @@ mq_notify (mqd_t mqdes, const struct sig
+       if (data.attr == NULL)
+ 	return -1;
+ 
+-      memcpy (data.attr, notification->sigev_notify_attributes,
+-	      sizeof (pthread_attr_t));
++      __pthread_attr_copy (data.attr, notification->sigev_notify_attributes);
+     }
+ 
+   /* Construct the new request.  */
+@@ -272,7 +274,10 @@ mq_notify (mqd_t mqdes, const struct sig
+ 
+   /* If it failed, free the allocated memory.  */
+   if (__glibc_unlikely (retval != 0))
+-    free (data.attr);
++    {
++      pthread_attr_destroy (data.attr);
++      free (data.attr);
++    }
+ 
+   return retval;
+ }
diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-33574_2.patch b/meta/recipes-core/glibc/glibc/CVE-2021-33574_2.patch
new file mode 100644
index 0000000000..396cd7fc0e
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2021-33574_2.patch
@@ -0,0 +1,73 @@
+From 217b6dc298156bdb0d6aea9ea93e7e394a5ff091 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Tue, 1 Jun 2021 17:51:41 +0200
+Subject: [PATCH] Fix use of __pthread_attr_copy in mq_notify (bug 27896)
+
+__pthread_attr_copy can fail and does not initialize the attribute
+structure in that case.
+
+If __pthread_attr_copy is never called and there is no allocated
+attribute, pthread_attr_destroy should not be called, otherwise
+there is a null pointer dereference in rt/tst-mqueue6.
+
+Fixes commit 42d359350510506b87101cf77202fefcbfc790cb
+("Use __pthread_attr_copy in mq_notify (bug 27896)").
+
+Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+
+https://sourceware.org/bugzilla/attachment.cgi?id=13497
+
+Upstream-Status: Backport
+CVE: CVE-2021-33574 patch#2
+Signed-off-by: Armin Kuster &lt;akuster@mvista.com&gt;
+
+---
+Index: git/sysdeps/unix/sysv/linux/mq_notify.c
+===================================================================
+--- git.orig/sysdeps/unix/sysv/linux/mq_notify.c
++++ git/sysdeps/unix/sysv/linux/mq_notify.c
+@@ -260,7 +260,34 @@ mq_notify (mqd_t mqdes, const struct sig
+       if (data.attr == NULL)
+ 	return -1;
+ 
+-      __pthread_attr_copy (data.attr, notification->sigev_notify_attributes);
++      memcpy (data.attr, notification->sigev_notify_attributes,
++        sizeof (pthread_attr_t));
++
++      struct pthread_attr *source =
++     (struct pthread_attr *) (notification->sigev_notify_attributes);
++      struct pthread_attr *target = (struct pthread_attr *) (data.attr);
++      cpu_set_t *newp;
++      cpu_set_t *cpuset = source->cpuset;
++      size_t cpusetsize = source->cpusetsize;
++
++      /* alloc a new memory for cpuset to avoid use after free */
++      if (cpuset != NULL && cpusetsize > 0)
++   {
++     newp = (cpu_set_t *) malloc (cpusetsize);
++     if (newp == NULL)
++       {
++         free(data.attr);
++         return -1;
++       }
++
++     memcpy (newp, cpuset, cpusetsize);
++     target->cpuset = newp;
++   }
++      else
++   {
++     target->cpuset = NULL;
++     target->cpusetsize = 0;
++   }
+     }
+ 
+   /* Construct the new request.  */
+@@ -273,7 +300,7 @@ mq_notify (mqd_t mqdes, const struct sig
+   int retval = INLINE_SYSCALL (mq_notify, 2, mqdes, &se);
+ 
+   /* If it failed, free the allocated memory.  */
+-  if (__glibc_unlikely (retval != 0))
++   if (retval != 0 && data.attr != NULL)
+     {
+       pthread_attr_destroy (data.attr);
+       free (data.attr);
diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
index 8742efc36f..2e950dfeda 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -67,6 +67,8 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0028-inject-file-assembly-directives.patch \
            file://0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
            file://CVE-2020-29573.patch \
+           file://CVE-2021-33574_1.patch \
+           file://CVE-2021-33574_2.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.25.1

