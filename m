Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.5970.1627412747270925857
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 12:05:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z148lV2q;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id ds11-20020a17090b08cbb0290172f971883bso6065409pjb.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jul 2021 12:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2Sxt5+RK9Rl0BVq5GYbXyWj/O6bR9i3rfKQFoWKLuuc=;
        b=Z148lV2qqKlTeYi+8ZPDrBVZWqASUJ77tA+JKN0kGQiYt9BaauBySGVuuUQYBXQfPG
         KnbXNXLfgkz9Kn1q8QNCVnPAqvJhadkI0XXP+uL9IIcjLea0jSzkRCd9euPEQ3xzu3vO
         fGWeGvdnz3maDZV1YnR7Y7Hsyk+XKo+EBZzrutnT1okkxQxWFEiFrjB6TgLqnfB5bgMC
         BzFlwIX4Wnj6HOcHhOmtf74Z+9TqqYCXiEUuvuzPRlGOI5P+pwWsCciAg3S/VnMtqs/P
         4WPLgpE2OMTNdPoBQFqg7bdMJXCWVpmtFRGuL8Bt3cqEx5gMPydeEHdL6IbnEjPZWSmJ
         ucDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2Sxt5+RK9Rl0BVq5GYbXyWj/O6bR9i3rfKQFoWKLuuc=;
        b=dIicSIf5byJAe4rc4fHphT8SW7ywZTeuB/5A+GEH9fFMneoPGi1DCbJmAVK1i/O1aa
         8NvbemXVsVk2W1JWiKkoEWo0OLR8LBCYHyy0NYRotg5UOIhFburGXraAxOtkRduK3ygn
         aWhKgl/JmsPyLLU3vmMZKS4CL8L1XCJuZjfhZLEnTRp0iH7CnYM3oWfvxPpi02zlBnxh
         mSns5RssPuKx4s9Ud3zKyE0hVq74VpvNtc68ucOJUneulSmZpDx9+1ElM5Gv3flmO3cz
         ycgQfIAJDi21Kb/h2SB+Xdl9J9WDQP51dmuAJ3w184/kigL8mH4QXs3PTgrQGKlMoAv5
         +D7Q==
X-Gm-Message-State: AOAM5324Hq0tX5pgO5u+6aoff1Poolz9SIxN2xj7fw/3nWtIhTWp5pde
	fDluoXt8frDoXZfXiOqE6Y8ylw92c83FMQ==
X-Google-Smtp-Source: ABdhPJy6hQxU7u9wgh9/49EPrvydjCU0+FIV1vVb/C/yuQkTV0DwUFTS/E+UxVfYM+TI6iOLttY26A==
X-Received: by 2002:aa7:96dc:0:b029:32e:1b8f:2a3d with SMTP id h28-20020aa796dc0000b029032e1b8f2a3dmr24845526pfq.43.1627412746465;
        Tue, 27 Jul 2021 12:05:46 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id lk5sm3532835pjb.53.2021.07.27.12.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 12:05:45 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [hardknott][PATCH] glibc: Fix CVE-2021-33574
Date: Tue, 27 Jul 2021 12:05:28 -0700
Message-Id: <20210727190528.110938-1-vinay.m.engg@gmail.com>
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
index 75a1f36d6b..4b54a0dd59 100644
--- a/meta/recipes-core/glibc/glibc_2.33.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -61,6 +61,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0033-x86-Handle-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch \
            file://CVE-2021-27645.patch \
            file://0001-nptl-Remove-private-futex-optimization-BZ-27304.patch \
+           file://CVE-2021-33574.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.31.1

