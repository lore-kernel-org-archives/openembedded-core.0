Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1990C36007
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:28 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.2938.1742372179544493346
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kk8qDSwM;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-225df540edcso8856265ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372179; x=1742976979; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuJt1g/9ppwR1m/5BtS6hGuBR2Z96SDqB5DNVxB93qg=;
        b=kk8qDSwMdipxJ/VN94ylRRBBE6F5v2cAYKb+wbJWKNIdvXp2P2wygLry8KyErCWMGw
         MKDF88RBwoGvvdTxjPKR9MG3qQllMS3+Yy4zDm4eNrpR8JDNAld1GbXH0TTeEf0aRDxD
         qM0caiwnwZxuoxpwelGRgDxFflWZBGQbh/UEIDLobRWqU9P6KdMRLQOO+nkebCoth34R
         1VjmXkUuzZQXGNJcTAQX9KwFOCuYDWrDJYLSZhtQeYJtdp/rbkVa2r3xCqnTWOIWQlxV
         7LCPVG7pSRfgV62JZfE8i0el8EzzNvbYYUzj5l8PAgvZ1qRF/FSyCL1qj1K5XZQRvKez
         sP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372179; x=1742976979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YuJt1g/9ppwR1m/5BtS6hGuBR2Z96SDqB5DNVxB93qg=;
        b=d9XCPy21k9dBW1WX3gPcV28VK+LT62uuVNsDyxUPlcsc5xQ6wjeTEVrIjhW+sZuLPo
         C8yXxseFzV+t5YxBgvjLey3jkYdCdxB//9azAAPxvHYA5DetBt5GuPWFXDIXFpJJ3Mpw
         KfNdOsA4sY2pDUrMgbOMDUOzXFcwOmxOjJMgNPN2cAmMGEP+49p1bo/IpTiSeMfqyFvq
         4axPo4Rr1JNHyXBE1MPnPxGPF0LWvUoaZMf0pvM/cZRX0Onhm5kn+2zXkFlzUe0ijobD
         +71J/Q7mrJBZ8lFVARz1j5xMMRIKeUY2i2EiUou98qjQGT9Z9/3846jkzh8u7IW1YBRI
         iKrA==
X-Gm-Message-State: AOJu0Yw8jJssK52L9kOmn9Xm7IDqqUuOETEUrMGvC56vpkaOsFJ5O4eu
	rofxiRtMcUdaKE1Ler3FkRcEopqcs88v3NIH647mDug+gtG2bPhsJ0yN2vnp
X-Gm-Gg: ASbGncuzkgNxOHoIGZXZUTh8jsTbUgHLAbcjzZjbO6I+0oXmg8yg/JEK8LlN5LuQ/oE
	oZJqE/SqrEeWcMVwcwag0qgXhKlPz3Rb+0VAcET4lw9WS6IK3UgmaKr6cD99xDaLk0u+oLVXJvT
	DOk9xVrxb06phJDaHPzQEv46yLH3Nus0zG4cHcPeIYQkdNlWMIzoLuTsOQ8Hc+Umc0jVLksq2Rw
	vOSjHAAEfhxWLqtnAAVTcm0OQaSDiFgXXcV+TjHSJYkzTjCEqb2qKgKDrOrAlRPT6J6PnxDCJvC
	jtXA4ogKPZFsmW38DubaszigM7LeEZFr/lhqGQuoMywFGF0=
X-Google-Smtp-Source: AGHT+IHO65Tl8phvOmSgRjdGhdnS+IaRlQA419cazhI7sTGHGuclP3OnMJzxLxNEWfkPkpLZexFuGw==
X-Received: by 2002:a05:6a20:9f43:b0:1f2:f1a8:70ca with SMTP id adf61e73a8af0-1fa4f953302mr9343489637.5.1742372178672;
        Wed, 19 Mar 2025 01:16:18 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 06/27] bluez: Fix build with GCC-15
Date: Wed, 19 Mar 2025 01:15:34 -0700
Message-ID: <20250319081610.3536475-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213272

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

