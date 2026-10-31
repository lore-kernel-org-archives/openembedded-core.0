Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3748.1793405765772159409
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=QuQfaAtU;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a214af2076so9619495e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405764; x=1794010564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dwb2oJD9hqGFsK4sVQWYT1NVq8oORnSmydMmAjQBNkg=;
        b=QuQfaAtU+7iYb8Nl5mJbfeVav61xsFBc1clgUDA+eEG6+6TkBxLzr6ebFNB6IOjrqn
         pocSxyNoxOZE3Q0T9IOCXa9q/8SIXXIakrFPJ66Xp/eAOJY0Va8MNS9RV9Oe3tSx/wtw
         x8/GcxdzgxV6QL+4Sh6e6rPLEJRSUjXC0AV5mwvMkjkcQHoB1edNun/KSoY0WPy9BdIS
         6EItwwr247hFuys32cJN+Zx+1t5jMI6Kv5hES4tpJ23d361GliUXP1DgEy6ZHHsH29dG
         /yh/CxYTebsmwo8mJo4fIz2GKqu//KnO9CYaHfF9OZSQBwUAnY7c+yzjH4Krk8s3ehzD
         KVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405764; x=1794010564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dwb2oJD9hqGFsK4sVQWYT1NVq8oORnSmydMmAjQBNkg=;
        b=Qovv61vT92i3Ac2gpdC69zUHLah/wjfo9Kb4xHaaiZAvgdPQqx2itoQ1giA/DDbIrm
         cAX/kcYy5Zx3t5SBgitoLWypaly0m+3uGBXfM6TLDpSWF0KmN7fdDuRRxri6rbmvCn2u
         vVOgGQbckVztGm3JBcu/X6u+f9CQdXl46LIIOMdMXOgGWY4VVkRpFRkgA9REx6xfGcrR
         KnHDRGFmgJKBB8Qikz6mlGEWHN2fSNrvozA3sMmaI5RuDnzDOeJWNY/W7NvaF33Ih3cV
         2eaHezOdHlwya+hYk6SOdnvruRt/6rXv0nEQW7Ve/By/XqQ3SpBtP8nUUhNBk4WTTjSz
         q+Bg==
X-Gm-Message-State: AFq9FYK5TuRioYiY5HnW5wtz5k3b3T6MIXSAhtnoo2Xi4UZuR/imTB5D
	njSfq0NRxBMXnN8p3WBKIbhyp0q8ivuL8tcMFXxxj+9mM579M2IfuQLyAufMQPLRat32k1szOpg
	5sMg2IlU=
X-Gm-Gg: AYBFou1w+pCSeaV2Rh3yoWRCLYT+yTF1uMLWhV8nb72NUWFTcBfzGigzOi9QSMaWJYb
	nRhgPD0gjFY0tK9SUeReb7jau6rLsVERGq6iS4KLXDwk1orihJirC4TxARHRXignyZUxI9lJjaO
	5sb22VlTLmarpKSKneMWevC9Polunw21Vd8Ocsb9n7YDpFLw3rWC9M91oYK1ZdYfKp8iCCi6KHI
	bohr9fyMWXwnUJQcwu/1LurQswFBRj90Wuw3sQzqXaz8AciL/GtRjv/XWKnmQdfFqVo4xHWgmAO
	PHnTqXIr62f3561s3oRnSG4FxkrEVHfIvBA5qYQxFmTkwO+XySrddTNPExZlYhKIUD+DbmTGT0G
	NPJ9Ejo0F/lfcCzQYIVuhLLCLIcA49tfRJ0vaRMIpYwy88+aUdhuRg4ZclHOi/NzXgtR2bjdZBe
	t1wN5gT7kG9Pqr3KMnu1nWD6LCy0bmnhyPNY8PtGradc4LiAZTFXw8zvCLZY5Vux2u6tGIUrVfZ
	YIa794SchxiyEZf7w9njHwIfd2QekGsmfImWaZXiQBImo5updW6qPUyKOhV21o2x6G3MQ/Tiopn
	GE7I2Y/ioUPzLx6NIvAKL0Nty1EthEbl75dEBzeFD46n0bNc2gFOEur5gF5N2mYz9sMHbLfWGXw
	ali1icPADEmqWwB63DdJnq3FJq3u3qQjJCnoFuMveQTwiLky8Yw==
X-Received: by 2002:a05:600c:8b63:b0:4a2:40:7f35 with SMTP id 5b1f17b1804b1-4ac18993232mr83435105e9.31.1793405764033;
        Fri, 30 Oct 2026 17:16:04 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.16.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:16:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 36/55] dhcpcd: patch CVE-2025-70102
Date: Sat, 31 Oct 2026 01:14:57 +0100
Message-ID: <8acfcc9878c973c60ad9aee96b25e5e943f70e67.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249111
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2025-70102

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../dhcpcd/dhcpcd_10.0.6.bb                   |  1 +
 .../dhcpcd/files/CVE-2025-70102.patch         | 30 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2025-70102.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
index c32db0adf5d..85f55611eaf 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://CVE-2026-56113.patch \
            file://CVE-2026-56114.patch \
            file://CVE-2026-56117.patch \
+           file://CVE-2025-70102.patch \
            "
 
 SRCREV = "1c8ae59836fa87b4c63c598087f0460ec20ed862"
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2025-70102.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2025-70102.patch
new file mode 100644
index 00000000000..e2b0e291f9c
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/CVE-2025-70102.patch
@@ -0,0 +1,30 @@
+From 117742d755b591764036dd4218f314f748a3d2b7 Mon Sep 17 00:00:00 2001
+From: Roy Marples <roy@marples.name>
+Date: Sun, 21 Dec 2025 08:31:52 +0000
+Subject: [PATCH] options: Ensure ldop is not NULL dereferenced (#568)
+
+ldop itself cannot be non NULL as it points to the location.
+but *ldop CAN be NULL.
+
+Fixes #567.
+
+CVE: CVE-2025-70102
+Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/commit/117742d755b591764036dd4218f314f748a3d2b7]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/if-options.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/if-options.c b/src/if-options.c
+index 083449b9..9ac9f0b8 100644
+--- a/src/if-options.c
++++ b/src/if-options.c
+@@ -1882,7 +1882,7 @@ err_sla:
+ 			if (*edop) {
+ 				dop = &(*edop)->embopts;
+ 				dop_len = &(*edop)->embopts_len;
+-			} else if (ldop) {
++			} else if (*ldop) {
+ 				dop = &(*ldop)->embopts;
+ 				dop_len = &(*ldop)->embopts_len;
+ 			} else {
