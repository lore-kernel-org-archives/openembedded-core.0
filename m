Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5EDFC35FFF
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 18:38:55 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.2867.1742323130337733424
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 11:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gdR7jQcz;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so6125487a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742323129; x=1742927929; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuJt1g/9ppwR1m/5BtS6hGuBR2Z96SDqB5DNVxB93qg=;
        b=gdR7jQcz55BZfVVkqBsmS6A1lysNaP6lSH6rbxvYJnXGQlRy8jeUkHPDVKdccklsXb
         ecB8m4bqGZ3Zd1zmY0YlnOtejOOkSlpLQXRCZChV69PuEa30iCsAEBXcgYbY3GqyDKuJ
         mQTfRmVzKmCy+YjZuVYHjEWIh05q/OsWOUQWWhaicfRxF/e0KTsYwUDj1sDi//GaJaZ4
         jYoRXtDjJaR+oCplIIVrUoBZ8lg6Eioq8iMrXXJvJcgNib1T3DFAf0JNp+qpUpcPuyDP
         u4U5pPC5j5YaKBSxM+Fuow8ORM1WmqLsvdnfydSOBga06zV1rAxzLJL3soO605mojCk2
         8I7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742323129; x=1742927929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YuJt1g/9ppwR1m/5BtS6hGuBR2Z96SDqB5DNVxB93qg=;
        b=eClU63wjkmd3ZOIFeYn5wcTHEowU0mnZDyJImsyOIskoxPpz2xV/nWe8kQV+i77/9B
         TCbuEC/cAtcKd0LexjA1a0DZWK/OjG9/JiWyh7vD9JB4DGb5P6Ks4WXifFZo4fnFbrJa
         AYiklcITZjw+Jks9Id1qLx5M4vtMIXWiVQfGYdyEZKV/vev39IbnM52BjJ0IkOAV48T6
         +GQS6nd7oKRqm0hQUZ0EXPqpKXr1Kq4xYmj+8LTom/35gVvkXy2DxkXtZV/FOWolQ74R
         Qe1L7rKjN2NQXrGmf1p3+f9IELiNC5HaPEaoH1lUZvm45x5YtCYZsxsUsQtWlIzUU88W
         Ru0A==
X-Gm-Message-State: AOJu0YxitY3GYDnbzjyd7Axdk/O9RqPNdGwomffL3OPtl5+SyxqVitgk
	L6caw7w34RCpMtKo5QOAIM3V3Gz1okmYAgmbfwztFJu9txSylU1A3vM0fzsh
X-Gm-Gg: ASbGncvD6vyM4wtD992A9qRAC03YkDw5uzkH/k9avRNF+60aOcf7+dUUTRvJchX0zut
	7dMSXYRBDeCw7KU11bRsRkD6KDeGJe+Rxxd9DBfY2VfWf23w7eLQ7sTEcGwlLs4Yaf47hg0mq3P
	lftSu6O17Pvl0gL92C/Onr6F1+SlrNsibPB+OaWmQu5LmfyEL4QYh5Xek15lKsCVsCc5g1gsoZS
	zvIgYOxJLl0l6cpzhAQNUzfNh8/alMrtggWk01K6t1FZOeWoar7NpQYXLzuZCLEDxM0ETptH3c1
	LpDzWbYx89M0fpLGrd7O45xy6JbXt/Vv0DkPuPDfmLhQA0I=
X-Google-Smtp-Source: AGHT+IFYlhWdV/htYbPL3w/G92EBCBQMWTYI5LTEE8zZHKwfALQOeUEBxAk/HL71QkSz0hDuZ3FK6g==
X-Received: by 2002:a17:90b:3b4e:b0:2fc:a3b7:108e with SMTP id 98e67ed59e1d1-301a5b00646mr4301136a91.4.1742323129447;
        Tue, 18 Mar 2025 11:38:49 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153afee51sm8537489a91.28.2025.03.18.11.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 11:38:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 06/25] bluez: Fix build with GCC-15
Date: Tue, 18 Mar 2025 11:38:21 -0700
Message-ID: <20250318183842.2256284-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318183842.2256284-1-raj.khem@gmail.com>
References: <20250318183842.2256284-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 18:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213232

gcc-15 switched to -std=c23 by default:

    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212

As a result `bluez` fails the build as:

    src/shared/ad.c:1090:24: error: incompatible types when returning type '_Bool' but 'const char *' was expected
     1090 |                 return false;
          |                        ^~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  3 +
 ...-shared-ad-fix-std-c23-build-failure.patch | 34 +++++++++++
 ...ared-shell-fix-std-c23-build-failure.patch | 34 +++++++++++
 ...tt-helpers-fix-std-c23-build-failure.patch | 58 +++++++++++++++++++
 4 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-shared-ad-fix-std-c23-build-failure.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0002-shared-shell-fix-std-c23-build-failure.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0003-shared-gatt-helpers-fix-std-c23-build-failure.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index d31f4e2295e..d6268721037 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -70,6 +70,9 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
            file://0001-gdbus-define-MAX_INPUT-for-musl.patch \
+           file://0001-shared-ad-fix-std-c23-build-failure.patch \
+           file://0002-shared-shell-fix-std-c23-build-failure.patch \
+           file://0003-shared-gatt-helpers-fix-std-c23-build-failure.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-shared-ad-fix-std-c23-build-failure.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-shared-ad-fix-std-c23-build-failure.patch
new file mode 100644
index 00000000000..82eaed79298
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-shared-ad-fix-std-c23-build-failure.patch
@@ -0,0 +1,34 @@
+From 5c4cbf5cb95e4fc1a53545af52b420a8008b3ffa Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Wed, 20 Nov 2024 13:02:56 +0000
+Subject: [PATCH 1/3] shared/ad: fix -std=c23 build failure
+
+gcc-15 switched to -std=c23 by default:
+
+    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
+
+As a result `bluez` fails the build as:
+
+    src/shared/ad.c:1090:24: error: incompatible types when returning type '_Bool' but 'const char *' was expected
+     1090 |                 return false;
+          |                        ^~~~~
+
+Upstream-Status: Backport [https://web.git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=da5b5b0ecb1ead38676768ef78d46449d404bdc0]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/shared/ad.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/shared/ad.c b/src/shared/ad.c
+index d08ce7a..dac381b 100644
+--- a/src/shared/ad.c
++++ b/src/shared/ad.c
+@@ -1087,7 +1087,7 @@ bool bt_ad_add_name(struct bt_ad *ad, const char *name)
+ const char *bt_ad_get_name(struct bt_ad *ad)
+ {
+ 	if (!ad)
+-		return false;
++		return NULL;
+ 
+ 	return ad->name;
+ }
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0002-shared-shell-fix-std-c23-build-failure.patch b/meta/recipes-connectivity/bluez5/bluez5/0002-shared-shell-fix-std-c23-build-failure.patch
new file mode 100644
index 00000000000..9ea622601b1
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0002-shared-shell-fix-std-c23-build-failure.patch
@@ -0,0 +1,34 @@
+From 408510d751e9482fe965e5dd96fbac7f9ee2ef62 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Wed, 20 Nov 2024 13:03:29 +0000
+Subject: [PATCH 2/3] shared/shell: fix -std=c23 build failure
+
+gcc-15 switched to -std=c23 by default:
+
+    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
+
+As a result `bluez` fails the build as:
+
+    src/shared/shell.c:365:24: error: incompatible types when returning type '_Bool' but 'struct input *' was expected
+      365 |                 return false;
+          |                        ^~~~~
+
+Upstream-Status: Backport [https://web.git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=4d60826865c760cc4e5718b6414746a394768110]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/shared/shell.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/shared/shell.c b/src/shared/shell.c
+index a8fa876..aa6c16c 100644
+--- a/src/shared/shell.c
++++ b/src/shared/shell.c
+@@ -362,7 +362,7 @@ static struct input *input_new(int fd)
+ 
+ 	io = io_new(fd);
+ 	if (!io)
+-		return false;
++		return NULL;
+ 
+ 	input = new0(struct input, 1);
+ 	input->io = io;
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0003-shared-gatt-helpers-fix-std-c23-build-failure.patch b/meta/recipes-connectivity/bluez5/bluez5/0003-shared-gatt-helpers-fix-std-c23-build-failure.patch
new file mode 100644
index 00000000000..996bb048acf
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0003-shared-gatt-helpers-fix-std-c23-build-failure.patch
@@ -0,0 +1,58 @@
+From 7c07bb10f57c80467bc3079d45dac4d3839927d0 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Wed, 20 Nov 2024 13:03:55 +0000
+Subject: [PATCH 3/3] shared/gatt-helpers: fix -std=c23 build failure
+
+gcc-15 switched to -std=c23 by default:
+
+    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
+
+As a result `bluez` fails the build as:
+
+    src/shared/gatt-helpers.c:1136:24: error: incompatible types when returning type '_Bool' but 'struct bt_gatt_request *' was expected
+     1136 |                 return false;
+          |                        ^~~~~
+    src/shared/gatt-helpers.c:1250:24: error: incompatible types when returning type '_Bool' but 'struct bt_gatt_request *' was expected
+     1250 |                 return false;
+          |                        ^~~~~
+    src/shared/gatt-helpers.c:1478:24: error: incompatible types when returning type '_Bool' but 'struct bt_gatt_request *' was expected
+     1478 |                 return false;
+          |                        ^~~~~
+
+Upstream-Status: Backport [https://web.git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=6f3111eb680df9c13502aacd65554846a9e13a3f]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/shared/gatt-helpers.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/shared/gatt-helpers.c b/src/shared/gatt-helpers.c
+index 50fcb26..f1fa630 100644
+--- a/src/shared/gatt-helpers.c
++++ b/src/shared/gatt-helpers.c
+@@ -1133,7 +1133,7 @@ struct bt_gatt_request *bt_gatt_discover_included_services(struct bt_att *att,
+ 	uint8_t pdu[6];
+ 
+ 	if (!att)
+-		return false;
++		return NULL;
+ 
+ 	op = new0(struct bt_gatt_request, 1);
+ 	op->att = att;
+@@ -1247,7 +1247,7 @@ struct bt_gatt_request *bt_gatt_discover_characteristics(struct bt_att *att,
+ 	uint8_t pdu[6];
+ 
+ 	if (!att)
+-		return false;
++		return NULL;
+ 
+ 	op = new0(struct bt_gatt_request, 1);
+ 	op->att = att;
+@@ -1475,7 +1475,7 @@ struct bt_gatt_request *bt_gatt_discover_descriptors(struct bt_att *att,
+ 	uint8_t pdu[4];
+ 
+ 	if (!att)
+-		return false;
++		return NULL;
+ 
+ 	op = new0(struct bt_gatt_request, 1);
+ 	op->att = att;

