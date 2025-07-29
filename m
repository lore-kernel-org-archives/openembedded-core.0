Return-Path: <sanakazi720@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9D3C83F26
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 13:34:42 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.7169.1753796075213091130
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 06:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m/VeYqs/;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: sanakazi720@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-75001b1bd76so3566409b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 06:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753796074; x=1754400874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rtueedixn6LeVuT/Eev5xwiQ5bdXxPZyu6JTbK5t07Y=;
        b=m/VeYqs/OaMZq1W/1bWZ2DB1jWWxxyFWAilRqYJqZDZPKyek2EQOO/wZYX1ztVMjdi
         nKJppg+jtda6Umjrb+bN3cQ63LCIXKlAepkKu4p2oKB25j1l7DX6HUV3tAUUQPO8Ieu4
         vjCdeRbqgd/fWvQE2MV3kaK0qL3gRIPXdvCrRoE7UPofm0HQ020hbQTe7FYraGue+MbX
         pjaiZ+bkRQQTxXLQuIvCc3E6E68JQgInPYLjLKNNj4+VULrjeI//IaXpAAqYiQBfkRu4
         a0Z2poW4EqrJzxpgQAk1Bu98N8QqocCIhXWLMWjEsvNwK/XL8m/8b/yZf9HJNyyj7Mx+
         hUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753796074; x=1754400874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rtueedixn6LeVuT/Eev5xwiQ5bdXxPZyu6JTbK5t07Y=;
        b=pECjfMY4fzhjgXsye+PI7awcs+KKp3x1p1xtd5SiAdq8j4jOpj7YttHCueYqJCw2XQ
         fHGOmu4wdDO6KDr0OFi0B3npwpTu9l5SHLzQYnoIQ9+m2i7YLJ2ex6GljCATTkHprePh
         9YBZfqHakopmRyu6/bT+xZVheLwzFQaei2vMrlt1LTPTa9uDo272+mq0wPrQNmM523nb
         emK12M3RFEsmCb1WcfEEkXplVj3tO6TKxQNwwGLGJXtYw/ISG3ZY/0oc+As3e0j9bPTV
         RTYas2CPYUvqCbB+pzgy8PiPHUcSq7bwZaXW0lO3bsRZzFv/fwqXYRZeSW0gze4xKwtC
         jvyQ==
X-Gm-Message-State: AOJu0YzN0GZ5SVSEZrwglUgIhYgTPRbaHJI/V9m1IEmx2x+jaumBugta
	C9yo78A5BaNXP0z58h7GCJS0ZJKuGMvGaJEmxgj1bzPN7tOHP/erCuVCt+lBxg==
X-Gm-Gg: ASbGncuakkTN2qOfdS0NSvFQ6YtHJNZi4qlt3/oboXfzrndPUNk6nXq9IsuNmGBeo+h
	ks1Xd4kgsK/HqTxlCvC9/opHsyNm+v9mB9yzwF38yd4i2h466TKKOinALGdz3mlEgB5kjGsV8q/
	cZvtdP/cEXvEBo0gVGoaun1QSFDvTfPVMi+Fhl4qPIcukA6vVFBUQtjr+4PeZkHfUAAio4MQDbF
	0Fluzv2bOoF/FvezDBXT78IMd/imJbnVLKtOHRGzfSiH2WmjnStl0upoEbMe9GJqxnMWytEcJxa
	62BRQTur0aT4IN5HsKIYh6ealN8Dk3UIWoyIPJN/+A9lSsy2qb6r5irsbwkwewiRuhTHiGy6N7+
	myydRPGQ1Ed+3pYX8idGHtzsrpo/2bAN+wb07y6wXlg==
X-Google-Smtp-Source: AGHT+IF9T17zEtWMXSt3qBZJGV1CuFFQB/zLxA/FfK+2cFsB1UUCmp5/1RlnHS1RpRwd0a29mmy8mQ==
X-Received: by 2002:a05:6a00:2d83:b0:742:a02e:dd8d with SMTP id d2e1a72fcca58-763348bbde2mr21997946b3a.20.1753796074149;
        Tue, 29 Jul 2025 06:34:34 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c17:edc1:b501:bac2:47be:4207])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76702db3843sm5962394b3a.23.2025.07.29.06.34.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 06:34:33 -0700 (PDT)
From: Sana Kazi <sanakazi720@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] linux-libc-headers: Backport 'Fix invalid conversion in cn_proc.h'
Date: Tue, 29 Jul 2025 19:04:17 +0530
Message-Id: <20250729133417.943008-1-sanakazi720@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 13:34:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221078

Backport change to fix error:

/usr/include/linux/cn_proc.h:72:17: error: invalid conversion from
'unsigned int' to 'proc_cn_event' [-fpermissive]
   72 |         ev_type &= PROC_EVENT_ALL;
      |                 ^
      |                 unsigned int

This issue is fixed for 6.10, therefore not required in master.
Upstream-Status: Backport [https://github.com/torvalds/linux/commit/06e785aeb9ea8a43d0a3967c1ba6e69d758e82d4]

Signed-off-by: Sana Kazi <sanakazi720@gmail.com>
---
 ...-Fix-invalid-conversion-in-cn_proc.h.patch | 39 +++++++++++++++++++
 .../linux-libc-headers_6.6.bb                 |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-connector-Fix-invalid-conversion-in-cn_proc.h.patch

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-connector-Fix-invalid-conversion-in-cn_proc.h.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-connector-Fix-invalid-conversion-in-cn_proc.h.patch
new file mode 100644
index 0000000000..bd4a44c1be
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-connector-Fix-invalid-conversion-in-cn_proc.h.patch
@@ -0,0 +1,39 @@
+From 06e785aeb9ea8a43d0a3967c1ba6e69d758e82d4 Mon Sep 17 00:00:00 2001
+From: Matt Jan <zoo868e@gmail.com>
+Date: Tue, 14 May 2024 12:10:46 +0800
+Subject: [PATCH] connector: Fix invalid conversion in cn_proc.h
+
+The implicit conversion from unsigned int to enum
+proc_cn_event is invalid, so explicitly cast it
+for compilation in a C++ compiler.
+/usr/include/linux/cn_proc.h: In function 'proc_cn_event valid_event(proc_cn_event)':
+/usr/include/linux/cn_proc.h:72:17: error: invalid conversion from 'unsigned int' to 'proc_cn_event' [-fpermissive]
+   72 |         ev_type &= PROC_EVENT_ALL;
+      |                 ^
+      |                 |
+      |                 unsigned int
+
+Signed-off-by: Matt Jan <zoo868e@gmail.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+
+Upstream-Status: Backport [https://github.com/torvalds/linux/commit/06e785aeb9ea8a43d0a3967c1ba6e69d758e82d4]
+---
+ include/uapi/linux/cn_proc.h | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/include/uapi/linux/cn_proc.h b/include/uapi/linux/cn_proc.h
+index f2afb7cc4926..18e3745b86cd 100644
+--- a/include/uapi/linux/cn_proc.h
++++ b/include/uapi/linux/cn_proc.h
+@@ -69,8 +69,7 @@ struct proc_input {
+
+ static inline enum proc_cn_event valid_event(enum proc_cn_event ev_type)
+ {
+-	ev_type &= PROC_EVENT_ALL;
+-	return ev_type;
++	return (enum proc_cn_event)(ev_type & PROC_EVENT_ALL);
+ }
+
+ /*
+-- 
+2.50.1
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb
index d68de6ec7e..11e7524fed 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb
@@ -8,6 +8,7 @@ SRC_URI:append:libc-musl = "\
 
 SRC_URI += "\
     file://0001-kbuild-install_headers.sh-Strip-_UAPI-from-if-define.patch \
+    file://0001-connector-Fix-invalid-conversion-in-cn_proc.h.patch \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-- 
2.25.1


