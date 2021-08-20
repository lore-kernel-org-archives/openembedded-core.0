Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.80888.1629437254836006667
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 22:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WVo6Vv9o;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id o10so5382292plg.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 22:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zzl7xCRzQ5itOeLDRE+rkPkj41LpCDqyQWD/f/98rZk=;
        b=WVo6Vv9oQbObLC9eXFWejTEqTgc7iZLJ9DCrGITiGNbZMQPbY4n4p3G/hzpw37Ad3/
         CcNnXLwK3SR5bZSVt37Ya0ysTVQdc5zsk0uLR6RdUm5wOFy0ieO2Hx3dkF0bZ88bVifG
         /eY58EUos/pfRjKoZK6Y3ZEKMUeebSavS5L1OrmnO2kK5h1r7q7JmB6xiW+vqhO91Fq4
         anmsNw29Tj4MTHodqJm3oLSz6Pmp0Gi3QyahIdE8ROWPOFyuVkidz6QwNMQ4kJC7ACBd
         w1bhV5N0oLgzJOma0UrNDjVBC6BqaiboYQBOv1vyfWH9SgxRoOUk7vSn4CzGv3f7LoFC
         O9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zzl7xCRzQ5itOeLDRE+rkPkj41LpCDqyQWD/f/98rZk=;
        b=i092Yq94BGXs9FkSKp61KrulDY59chVhwXlhJoLlJVfBdD+pf7rrPl0bNcLnYhStLs
         A5FsoxhTlrr8owxlIoiH3wBEOObyZEwPnTdiVxTbC/iV6pfqZwalpD2nhW+zEvDBhyOE
         tistQUqWDaIEHJO1LnQiUg5h+i4ZGKE49ftHcNTPH+fPaJ3PyHsgsNQAta12mRx3oS85
         2rRQpDkUdJ3SP8MPESZEOb2tJm0WwAyucpxoVJZkVM56f+G2ehF7hGYzNNMVm2iHr/9V
         19l06d3ejLRyWEk7RL5c8ax9oBVL+UlJmpw1CKI0+bE6W3y77Fh4NgcjkGLkC1SRPRZi
         /TrQ==
X-Gm-Message-State: AOAM5319+X7oTnr8iLDm/3glqwoxSdMfLVoCtzaSjFjqn2mdoSc5g9jq
	0hD2Az/Ks1UPvErG+FidvGjKSQhbeS8vjQ==
X-Google-Smtp-Source: ABdhPJwMyLxml5XLMyHAoc6pEQggqOg6f6NsUMysUWXi2RPZ856p5qnLi605rPwE0tS4P7nezTc4GQ==
X-Received: by 2002:a17:902:8bc4:b029:12b:8470:e29e with SMTP id r4-20020a1709028bc4b029012b8470e29emr15170449plo.2.1629437254191;
        Thu, 19 Aug 2021 22:27:34 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:ff71:9627:ab75:ea06])
        by smtp.gmail.com with ESMTPSA id c7sm3642131pjc.31.2021.08.19.22.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 22:27:33 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [Dunfell][PATCH 2/7] glibc: Security fix for CVE-2021-38604
Date: Thu, 19 Aug 2021 22:27:27 -0700
Message-Id: <20210820052732.2606-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820052732.2606-1-akuster808@gmail.com>
References: <20210820052732.2606-1-akuster808@gmail.com>
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

