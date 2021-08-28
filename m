Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web08.173.1630174321728894998
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=iSKIEXU/;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.170, mailfrom: steve@sakoman.com)
Received: by mail-il1-f170.google.com with SMTP id l10so10877374ilh.8
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VcI3k3Zz8UGLo4GK+4RPi2vZXXZx6OEum/RPFoJewKc=;
        b=iSKIEXU/+Hy/bdGK4w2OY7kjDPUQdwmSX5ruRzl9sKLEoeAFZ7mgPHh6RUHgS6OrYO
         QpnJ7Zs+pP4/bm/ayu4o8pUBn/rUdlN49LSjRUC9+TQ+0o5IQLSCxU/WpPCuzIAHrgMe
         sHetHS9KAIPRZ13fdtMSXiIoiDbYmCC7mtbJy6MR8jdh6dcr2+u2cu4lu9Opwv4aAu2h
         MRP1/icamO0TZDKN2HuvEAKSXF0iH4lKnwoe/mnSkAqndIIFfWYIfs7hYdUIp8dYyea4
         73XXlTKFfMdg/aYLX7z+HkCpya79MxMDse5oHjInXtwx+l4FYu+pD4YnfS9/rB79m9UR
         4j6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VcI3k3Zz8UGLo4GK+4RPi2vZXXZx6OEum/RPFoJewKc=;
        b=Thz4PK+caESxh7MCOHpl7KZhcG2AbJFodaAg1PWiTA5RI9Cv9rhoO+77RX4gJn/3nz
         Y7XdYCpVxsJQ8uSgEI2AglMm3BO8fhk+99xQsQLqxKSTZ+WJvT7+gkeaQoH0Ds2bc04b
         hnQb1Y3rdydnTOGZsfSsmg5sdwO4zRLR/zkC3bFTK/5XLIN/X25rB+Pus/4NBuu2sI/T
         RvnV3ta+3XJqqjm3LDjiRLJs/Hu+pXMgeyTnzYVGyF/r3tpcUMbjwj+4+Kp91XH/npYT
         wAwEzLs4qqmfomhd1BaBeHwxI3poSW0DXzvWvUinZDPJlzpI2Hbvvp1HWEEP5uivnnfW
         /xfw==
X-Gm-Message-State: AOAM531OnnQIVCOSXrnCO24M2UtUK0bIghxXkImRw05d1E7qM+sT/VaR
	FYhIbL3GsBmZGMmmGS5fN1JwX+i0E+bits9N
X-Google-Smtp-Source: ABdhPJyKolRr1OB1PfFXAb1cS2xSUi8QpSNa7Qb44aYvJQZWt6Hhj+chNXsr0ELwj8miA5TvFnfJNw==
X-Received: by 2002:a05:6e02:20c3:: with SMTP id 3mr10017787ilq.139.1630174320585;
        Sat, 28 Aug 2021 11:12:00 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.11.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:12:00 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/36] glibc: Security fix for CVE-2021-38604
Date: Sat, 28 Aug 2021 08:10:50 -1000
Message-Id: <f65b5b7c88092cdba0239939fead20992eb2ff48.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: glibc.org
MR: 112635
Type: Security Fix
Disposition: Backport from https://sourceware.org/git/?p=glibc.git;a=commit;h=b805aebd42364fe696e417808a700fdb9800c9e8
ChangeID: 53b105da48e604f6763bb04b7114f41bfb620d2f
Description:

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glibc/glibc/CVE-2021-38604.patch          | 41 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.31.bb         |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-38604.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-38604.patch b/meta/recipes-core/glibc/glibc/CVE-2021-38604.patch
new file mode 100644
index 0000000000..36fd4a61b2
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2021-38604.patch
@@ -0,0 +1,41 @@
+From b805aebd42364fe696e417808a700fdb9800c9e8 Mon Sep 17 00:00:00 2001
+From: Nikita Popov <npv1310@gmail.com>
+Date: Mon, 9 Aug 2021 20:17:34 +0530
+Subject: [PATCH] librt: fix NULL pointer dereference (bug 28213)
+
+Helper thread frees copied attribute on NOTIFY_REMOVED message
+received from the OS kernel.  Unfortunately, it fails to check whether
+copied attribute actually exists (data.attr != NULL).  This worked
+earlier because free() checks passed pointer before actually
+attempting to release corresponding memory.  But
+__pthread_attr_destroy assumes pointer is not NULL.
+
+So passing NULL pointer to __pthread_attr_destroy will result in
+segmentation fault.  This scenario is possible if
+notification->sigev_notify_attributes == NULL (which means default
+thread attributes should be used).
+
+Signed-off-by: Nikita Popov <npv1310@gmail.com>
+Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+
+Upstream-Status: Backport
+CVE: CVE-2021-38604
+Signed-off-by: Armin Kuser <akuster@mvista.com>
+
+---
+ sysdeps/unix/sysv/linux/mq_notify.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: git/sysdeps/unix/sysv/linux/mq_notify.c
+===================================================================
+--- git.orig/sysdeps/unix/sysv/linux/mq_notify.c
++++ git/sysdeps/unix/sysv/linux/mq_notify.c
+@@ -134,7 +134,7 @@ helper_thread (void *arg)
+ 	       to wait until it is done with it.  */
+ 	    (void) __pthread_barrier_wait (&notify_barrier);
+ 	}
+-      else if (data.raw[NOTIFY_COOKIE_LEN - 1] == NOTIFY_REMOVED)
++      else if (data.raw[NOTIFY_COOKIE_LEN - 1] == NOTIFY_REMOVED && data.attr != NULL)
+ 	{
+ 	  /* The only state we keep is the copy of the thread attributes.  */
+ 	  pthread_attr_destroy (data.attr);
diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
index 2e950dfeda..3a3586f1b9 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -69,6 +69,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://CVE-2020-29573.patch \
            file://CVE-2021-33574_1.patch \
            file://CVE-2021-33574_2.patch \
+           file://CVE-2021-38604.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.25.1

