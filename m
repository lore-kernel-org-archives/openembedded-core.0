Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF1DC4332F
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 08:08:49 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.3354.1637741328071347182
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GIdG8ptq;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 ay10-20020a05600c1e0a00b0033aa12cdd33so3503564wmb.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F1apHK8eKLoS1Dwp/I8bjKBr8qKV045vUdlZcUmnzaw=;
        b=GIdG8ptqrOsxiBQ0hCBAOKzm0ABBdbmECcKKjcw7yAbYCOdZcqt2FJGqjiDuwt068E
         Yp1NYK2Dkb7jrHQb42G2kjKfYA3ho0LJRVFeBQ5TPQ0QYpkOg/Xymd5J5LJSOHmPGlXr
         UeJX0zBuClPT7nXCaq6XFsuLLdRo+iy6JeBXuu9n5FvhHkcmgG3SFJxBnlmnH6Wt0wKo
         FTbIBQdJdCERnl14U8aGvDyDzLzanqTJ8KxrzCHRhgX8y3jnkpPyNUlk/Q6bUAFdntU8
         pLAFB2rWtWwGtKA1WC/tDNixIpyeKZqwg/BZWd4NncPhhkj7PoxUPxSawnVvrlivfL8K
         ZKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F1apHK8eKLoS1Dwp/I8bjKBr8qKV045vUdlZcUmnzaw=;
        b=MT+qjCSQEZsH9RgZ+FfG6XoVqlhhz5cOgFkgi2Vg33K7jAXYhfzJXzbz2KxXJu/YwF
         RFry2XU6ZHYNMlZO/44SIFLjYvE0kq3C2x7kMLlgRumjjCg7nDsOzna4NPNtzI99Zc0I
         hsP6ggxLwDp6MDQU00VvqJLUOqGQHxOD8dR4w6oyGIjI8QJnuHc3YpTrOa3Ss6mbjzVa
         WboLkCG8xFbFvknzF5FkwJeyynkCDOeUqcF1mSa4xfic2Ssj3xgqwefpU57O3i16zRDb
         9o7liRK3szxVDt3gGijqm5IscGhnpauaIryVi82wrLhXMfaiaUm48TbaYpa/Wn24EtQP
         rKhw==
X-Gm-Message-State: AOAM531Mv4UpcKIZEqCRv7Z2K3TtzcEN/7D7G8/rOtU1lGBjSaxMqjFL
	R2vYjZlUMGKwNt9UOLG0xpfwDku4YKovJw==
X-Google-Smtp-Source: 
 ABdhPJwjLHHuMJ/kSS0u2v9wKRQA8WchVh6K1ydQdzfu+hQuBxb7pR1eX1nec0G+l6aKhEqxRZdfnQ==
X-Received: by 2002:a7b:cbd8:: with SMTP id
 n24mr12318884wmi.150.1637741326560;
        Wed, 24 Nov 2021 00:08:46 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k37sm4220205wms.21.2021.11.24.00.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 00:08:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Hongxu Jia <hongxu.jia@windriver.com>,
	Armin Kuster <akuster@mvista.com>
Subject: [PATCH 19/21] bind: update 9.16.22 -> 9.16.23
Date: Wed, 24 Nov 2021 09:08:26 +0100
Message-Id: <20211124080828.530981-19-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211124080828.530981-1-alex@linutronix.de>
References: <20211124080828.530981-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 08:08:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158675

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...d-V-and-start-log-hide-build-options.patch | 35 ------------------
 ...1-avoid-start-failure-with-bind-user.patch |  0
 ...d-V-and-start-log-hide-build-options.patch | 37 +++++++++++++++++++
 ...ching-for-json-headers-searches-sysr.patch |  0
 .../bind/{bind-9.16.22 => bind-9.16.23}/bind9 |  0
 .../{bind-9.16.22 => bind-9.16.23}/conf.patch |  0
 .../generate-rndc-key.sh                      |  0
 ...t.d-add-support-for-read-only-rootfs.patch |  0
 .../make-etc-initd-bind-stop-work.patch       |  0
 .../named.service                             |  0
 .../bind/{bind_9.16.22.bb => bind_9.16.23.bb} |  2 +-
 11 files changed, 38 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bind/bind-9.16.22/0001-named-lwresd-V-and-start-log-hide-build-options.patch
 rename meta/recipes-connectivity/bind/{bind-9.16.22 => bind-9.16.23}/0001-avoid-start-failure-with-bind-user.patch (100%)
 create mode 100644 meta/recipes-connectivity/bind/bind-9.16.23/0001-named-lwresd-V-and-start-log-hide-build-options.patch
 rename meta/recipes-connectivity/bind/{bind-9.16.22 => bind-9.16.23}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.22 => bind-9.16.23}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.22 => bind-9.16.23}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.22 => bind-9.16.23}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.22 => bind-9.16.23}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.22 => bind-9.16.23}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.22 => bind-9.16.23}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.16.22.bb => bind_9.16.23.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.22/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.22/0001-named-lwresd-V-and-start-log-hide-build-options.patch
deleted file mode 100644
index 5bcc16c9b2..0000000000
--- a/meta/recipes-connectivity/bind/bind-9.16.22/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From a3af4a405baf5ff582e82aaba392dd9667d94bdc Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 27 Aug 2018 21:24:20 +0800
-Subject: [PATCH] `named/lwresd -V' and start log hide build options
-
-The build options expose build path directories, so hide them.
-[snip]
-$ named -V
-|built by make with *** (options are hidden)
-[snip]
-
-Upstream-Status: Inappropriate [oe-core specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
-Refreshed for 9.16.0
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- bin/named/include/named/globals.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: bind-9.16.0/bin/named/include/named/globals.h
-===================================================================
---- bind-9.16.0.orig/bin/named/include/named/globals.h
-+++ bind-9.16.0/bin/named/include/named/globals.h
-@@ -69,7 +69,7 @@ EXTERN const char *named_g_version     I
- EXTERN const char *named_g_product     INIT(PRODUCT);
- EXTERN const char *named_g_description INIT(DESCRIPTION);
- EXTERN const char *named_g_srcid       INIT(SRCID);
--EXTERN const char *named_g_configargs  INIT(CONFIGARGS);
-+EXTERN const char *named_g_configargs  INIT("*** (options are hidden)");
- EXTERN const char *named_g_builder     INIT(BUILDER);
- EXTERN in_port_t named_g_port	       INIT(0);
- EXTERN isc_dscp_t named_g_dscp	       INIT(-1);
diff --git a/meta/recipes-connectivity/bind/bind-9.16.22/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.23/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.22/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.16.23/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.23/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.23/0001-named-lwresd-V-and-start-log-hide-build-options.patch
new file mode 100644
index 0000000000..4dc6a5a2ae
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind-9.16.23/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -0,0 +1,37 @@
+From f5761bbaf743d291f3e7e859e69ebe61a1718cbf Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 27 Aug 2018 21:24:20 +0800
+Subject: [PATCH] `named/lwresd -V' and start log hide build options
+
+The build options expose build path directories, so hide them.
+[snip]
+$ named -V
+|built by make with *** (options are hidden)
+[snip]
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Refreshed for 9.16.0
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+---
+ bin/named/include/named/globals.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bin/named/include/named/globals.h b/bin/named/include/named/globals.h
+index 0572154..3147e04 100644
+--- a/bin/named/include/named/globals.h
++++ b/bin/named/include/named/globals.h
+@@ -69,7 +69,7 @@ EXTERN const char *named_g_version	  INIT(VERSION);
+ EXTERN const char *named_g_product	  INIT(PRODUCT);
+ EXTERN const char *named_g_description	  INIT(DESCRIPTION);
+ EXTERN const char *named_g_srcid	  INIT(SRCID);
+-EXTERN const char *named_g_configargs	  INIT(CONFIGARGS);
++EXTERN const char *named_g_configargs	  INIT("*** (options are hidden)");
+ EXTERN const char *named_g_builder	  INIT(BUILDER);
+ EXTERN in_port_t named_g_port		  INIT(0);
+ EXTERN isc_dscp_t named_g_dscp		  INIT(-1);
+-- 
+2.20.1
+
diff --git a/meta/recipes-connectivity/bind/bind-9.16.22/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.16.23/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.22/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.16.23/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.22/bind9 b/meta/recipes-connectivity/bind/bind-9.16.23/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.22/bind9
rename to meta/recipes-connectivity/bind/bind-9.16.23/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.16.22/conf.patch b/meta/recipes-connectivity/bind/bind-9.16.23/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.22/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.16.23/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.22/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.16.23/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.22/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.16.23/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.16.22/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.23/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.22/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.16.23/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.22/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.23/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.22/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.16.23/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.22/named.service b/meta/recipes-connectivity/bind/bind-9.16.23/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.22/named.service
rename to meta/recipes-connectivity/bind/bind-9.16.23/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.16.22.bb b/meta/recipes-connectivity/bind/bind_9.16.23.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.16.22.bb
rename to meta/recipes-connectivity/bind/bind_9.16.23.bb
index bde9a793b0..c1bf250c26 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.22.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.23.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "65e7b2af6479db346e2fc99bcfb6ec3240066468e09dbec575ebc7c57d994061"
+SRC_URI[sha256sum] = "dedb5e27aa9cb6a9ce3e872845887ff837b99e4e9a91a5e2fcd67cf6e1ef173c"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
-- 
2.20.1


