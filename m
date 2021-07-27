Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web09.5648.1627411141268274832
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 11:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UYGxiNSE;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id f13so6436541plj.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jul 2021 11:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2QJxsEp1wnPeMXp3HmiLu8Bo4sCwVasyH9aYYIohACM=;
        b=UYGxiNSEjIFs7NpzUX38btiy2LOcS61d+eRueUyJwbMONq3cljs1mPA9/sSQ3DPq0K
         oiNtAJAd2lpDjElsXW/EGIt9Mc1b05V/OEfMn52lR39Yaxx/ixFvY5ZPRCHsx7nIyh4B
         VwH5VRS6n6ZkdOAcNqJH5DIS7k+YTTVY58/0Y5uXFWM3ge9z6VVlrRipGJXlQ4Q9LLEG
         SxXAv78qcKVk/7mexj5GziYD6ameJQ0uA3PNB1/tKPyJlVD27iSt9RPOgp4MGsHyDOjd
         AfcNr8Ycfv84zgBNjMHZ7wwipsh90jkkFTIjzTVtKAKa3MkXUnOEBQaNUwwYmdV0rVT4
         K3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2QJxsEp1wnPeMXp3HmiLu8Bo4sCwVasyH9aYYIohACM=;
        b=hBk9NKDShOcILRoz1a8Dc6spkc25Qpa7+FT8Usrcr6ZSy028zN/KIpRSgf/elcUbD7
         iZXTsDB7d2Y9ZVrdlpG9yJiAqzkXg7kjZTEFQn74Tkvs/kBVPCCMc0wDcjQ8RMgf9qQs
         H9K2B8O+8hMhMUTP2Kxz+cZGMOY/zBBCvuTy53dOabVEtkz2Mqd4+WmdMjPPYwD1TjIj
         nlE01mwdsFORZ/wS3NTVI1LfBorY+mWv5HHDZrI0jVR/vPpzAEhCQVSciFCcpgzcDWQm
         XC9xrZY3B6OEvc/V6R8XiDrQCq8qY8fMxPycmRuxUdeVM8QcGn5+8mZQS0oIDZLD+7Jm
         qgLQ==
X-Gm-Message-State: AOAM531S6qOOwcReB0BE40N5eun9NmSTWcbccSLowsE/JXWq24ayGhbh
	q3Ypfqb50DDgdy7vOSXKSgPsDWrymKP90A==
X-Google-Smtp-Source: ABdhPJxljvyQ39TW1cSbYZ7UZLwbX4nExfrs/H+G3cY9xz3Cw1wESU3SX+Zkgv7bQHezzNtYZQtLzQ==
X-Received: by 2002:a17:90a:d816:: with SMTP id a22mr16556235pjv.180.1627411140316;
        Tue, 27 Jul 2021 11:39:00 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id t17sm4148189pfg.93.2021.07.27.11.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 11:38:59 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH] glibc: Fix CVE-2021-33574
Date: Tue, 27 Jul 2021 11:38:31 -0700
Message-Id: <20210727183831.100545-1-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Source: https://sourceware.org/git/glibc.git
Tracking -- https://sourceware.org/bugzilla/show_bug.cgi?id=27896

Backported upstream commit 42d359350510506b87101cf77202fefcbfc790cb to
glibc-2.33 source with dependent commit id 217b6dc298156bdb0d6aea9ea93e7e394a5ff091.

Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=42d359350510506b87101cf77202fefcbfc790cb]

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 .../glibc/glibc/CVE-2021-33574.patch          | 61 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.33.bb         |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-33574.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-33574.patch b/meta/recipes-core/glibc/glibc/CVE-2021-33574.patch
new file mode 100644
index 0000000000..fd73b23c88
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2021-33574.patch
@@ -0,0 +1,61 @@
+From 42d359350510506b87101cf77202fefcbfc790cb Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@linux-m68k.org>
+Date: Thu, 27 May 2021 12:49:47 +0200
+Subject: [PATCH] Use __pthread_attr_copy in mq_notify (bug 27896)
+
+Make a deep copy of the pthread attribute object to remove a potential
+use-after-free issue.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=42d359350510506b87101cf77202fefcbfc790cb]
+CVE: CVE-2021-33574
+Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
+---
+diff --git a/sysdeps/unix/sysv/linux/mq_notify.c b/sysdeps/unix/sysv/linux/mq_notify.c
+index cc575a0cdd8..6f46d29d1dc 100644
+--- a/sysdeps/unix/sysv/linux/mq_notify.c
++++ b/sysdeps/unix/sysv/linux/mq_notify.c
+@@ -133,8 +133,11 @@ helper_thread (void *arg)
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
+@@ -255,8 +258,14 @@ mq_notify (mqd_t mqdes, const struct sigevent *notification)
+       if (data.attr == NULL)
+ 	return -1;
+ 
+-      memcpy (data.attr, notification->sigev_notify_attributes,
+-	      sizeof (pthread_attr_t));
++      int ret = __pthread_attr_copy (data.attr,
++				     notification->sigev_notify_attributes);
++      if (ret != 0)
++	{
++	  free (data.attr);
++	  __set_errno (ret);
++	  return -1;
++	}
+     }
+ 
+   /* Construct the new request.  */
+@@ -269,8 +278,11 @@ mq_notify (mqd_t mqdes, const struct sigevent *notification)
+   int retval = INLINE_SYSCALL (mq_notify, 2, mqdes, &se);
+ 
+   /* If it failed, free the allocated memory.  */
+-  if (__glibc_unlikely (retval != 0))
+-    free (data.attr);
++  if (retval != 0 && data.attr != NULL)
++    {
++      pthread_attr_destroy (data.attr);
++      free (data.attr);
++    }
+ 
+   return retval;
+ }
diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
index 925efe8cc6..e9f01a14c5 100644
--- a/meta/recipes-core/glibc/glibc_2.33.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -57,6 +57,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch \
            file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
            file://mte-backports.patch \
+           file://CVE-2021-33574.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.31.1

