Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.37390.1628865078990366786
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 07:31:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=M1Va3J+B;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id l11so12224859plk.6
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Aug 2021 07:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6w623XusRfkgxM8xNOs51/e1J6weFHU9UKu1Ff0iS68=;
        b=M1Va3J+BaJ7HBsggzZguvJCjx3vih+eSfwQytc3UbhT2a2lsAOv3nhf2u/1wN7ubIM
         PBXJWKCsOoyz7xge1wmZfVMIIAqws5l2bMX8audIHIaySgpoEOCwJY1drOSQAuXn8GLx
         RBwb4Ir3laHekKV8I2lvNi8jQDxYF78U4ZlPSj/Qk4EtDllKLsiy1CGL1bUZoP8M9u0e
         W2UsM0D/WJxE/FXAussYyd+nc57gZmygWStcyeB+0dXkuUpj5k6TbdDCXEKc8Mu7FF+Y
         cChcYuv5UEkh3LRM7GwRFw7RfIqj4ymQ+uWM9azOgReP/tcYccxGdBs9016icbjfq5i8
         jmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6w623XusRfkgxM8xNOs51/e1J6weFHU9UKu1Ff0iS68=;
        b=emZC8l66rf/caPTKhDpI92enjnrOtz93nl3UqshiJSwYrLQAbL2yTUB/IR3zb8ds2A
         RCFRG8dvGULg6Ecl4fXwd617VVoTZcCcXQfT+quNWIiNMcZD3Y8cu7nK/UkpG1Je5oHi
         KO9OLs56ntkW63I7NpZ4Fh/+vxHuH2KPrQq1cpnd7nOSrliu8dDIGA4d4ls8+/1PBsfA
         o1l7ooXzjp+RuTJ+mf9cnwTI2MoFbJMVPRMQwXNPkaKFMervqUxe88PFdNSHOJrvivY7
         f3vX+SF4DHfpK+gQ6jVITNFVMKRpKmdt0nYCtfagrj3vDEo+t+LivNUPrtSbjDL5+c+c
         vstQ==
X-Gm-Message-State: AOAM5329vzM7Y0n4gjo+qmcbZoCfgzjS6EUusY86LQAKYwhq1dOtRhjy
	AcAeOFK2WV+rZj2T7odcIiAPVIbxz5miMwrC
X-Google-Smtp-Source: ABdhPJyrcYBcVFWz7Wk3p0M6+dW/92HPQr05EmIuagLUjj3tknKSTfbrjVJs9kxhPgXmEcuoy2lf2w==
X-Received: by 2002:a17:90b:3758:: with SMTP id ne24mr2842340pjb.218.1628865077999;
        Fri, 13 Aug 2021 07:31:17 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id nl9sm2113182pjb.33.2021.08.13.07.31.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 07:31:17 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/17] systemd: Add fix for CVE-2020-13529 and CVE-2021-33910
Date: Fri, 13 Aug 2021 04:29:44 -1000
Message-Id: <dcdd3c14beee89dc49261aeb4d7783cbb3fbeb89.1628863869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628863869.git.steve@sakoman.com>
References: <cover.1628863869.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Added fix for below CVEs from below Link
http://archive.ubuntu.com/ubuntu/pool/main/s/systemd/systemd_237-3ubuntu10.50.debian.tar.xz

1. CVE-2020-13529
Upstream-Status: Backport [https://github.com/systemd/systemd/commit/38e980a6a5a3442c2f48b1f827284388096d8ca5]
Hunk #1 refreshed to resolve patch-fuzz

2. CVE-2021-33910
Upstream-Status: Backport [https://github.com/systemd/systemd/pull/20256/commits/441e0115646d54f080e5c3bb0ba477c892861ab9]

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../systemd/systemd/CVE-2020-13529.patch      | 42 ++++++++++++
 .../systemd/systemd/CVE-2021-33910.patch      | 67 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_244.5.bb    |  2 +
 3 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2020-13529.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2021-33910.patch

diff --git a/meta/recipes-core/systemd/systemd/CVE-2020-13529.patch b/meta/recipes-core/systemd/systemd/CVE-2020-13529.patch
new file mode 100644
index 0000000000..6b499efbd8
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2020-13529.patch
@@ -0,0 +1,42 @@
+From 38e980a6a5a3442c2f48b1f827284388096d8ca5 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Thu, 24 Jun 2021 01:22:07 +0900
+Subject: [PATCH] sd-dhcp-client: tentatively ignore FORCERENEW command
+
+This makes DHCP client ignore FORCERENEW requests, as unauthenticated
+FORCERENEW requests causes a security issue (TALOS-2020-1142, CVE-2020-13529).
+
+Let's re-enable this after RFC3118 (Authentication for DHCP Messages)
+and/or RFC6704 (Forcerenew Nonce Authentication) are implemented.
+
+Fixes #16774.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/38e980a6a5a3442c2f48b1f827284388096d8ca5]
+CVE: CVE-2020-13529
+
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ src/libsystemd-network/sd-dhcp-client.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+--- a/src/libsystemd-network/sd-dhcp-client.c
++++ b/src/libsystemd-network/sd-dhcp-client.c
+@@ -1392,9 +1392,17 @@ static int client_handle_forcerenew(sd_dhcp_client *client, DHCPMessage *force,
+         if (r != DHCP_FORCERENEW)
+                 return -ENOMSG;
+
++#if 0
+         log_dhcp_client(client, "FORCERENEW");
+
+         return 0;
++#else
++        /* FIXME: Ignore FORCERENEW requests until we implement RFC3118 (Authentication for DHCP
++         * Messages) and/or RFC6704 (Forcerenew Nonce Authentication), as unauthenticated FORCERENEW
++         * requests causes a security issue (TALOS-2020-1142, CVE-2020-13529). */
++        log_dhcp_client(client, "Received FORCERENEW, ignoring.");
++        return -ENOMSG;
++#endif
+ }
+
+ static bool lease_equal(const sd_dhcp_lease *a, const sd_dhcp_lease *b) {
diff --git a/meta/recipes-core/systemd/systemd/CVE-2021-33910.patch b/meta/recipes-core/systemd/systemd/CVE-2021-33910.patch
new file mode 100644
index 0000000000..e92d721d3d
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2021-33910.patch
@@ -0,0 +1,67 @@
+Backport of:
+
+From 441e0115646d54f080e5c3bb0ba477c892861ab9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Wed, 23 Jun 2021 11:46:41 +0200
+Subject: [PATCH 1/2] basic/unit-name: do not use strdupa() on a path
+
+The path may have unbounded length, for example through a fuse mount.
+
+CVE-2021-33910: attacked controlled alloca() leads to crash in systemd and
+ultimately a kernel panic. Systemd parses the content of /proc/self/mountinfo
+and each mountpoint is passed to mount_setup_unit(), which calls
+unit_name_path_escape() underneath. A local attacker who is able to mount a
+filesystem with a very long path can crash systemd and the whole system.
+
+https://bugzilla.redhat.com/show_bug.cgi?id=1970887
+
+The resulting string length is bounded by UNIT_NAME_MAX, which is 256. But we
+can't easily check the length after simplification before doing the
+simplification, which in turns uses a copy of the string we can write to.
+So we can't reject paths that are too long before doing the duplication.
+Hence the most obvious solution is to switch back to strdup(), as before
+7410616cd9dbbec97cf98d75324da5cda2b2f7a2.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/20256/commits/441e0115646d54f080e5c3bb0ba477c892861ab9]
+CVE: CVE-2021-33910
+
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ src/basic/unit-name.c | 13 +++++--------
+ 1 file changed, 5 insertions(+), 8 deletions(-)
+
+--- a/src/basic/unit-name.c
++++ b/src/basic/unit-name.c
+@@ -369,12 +369,13 @@ int unit_name_unescape(const char *f, char **ret) {
+ }
+
+ int unit_name_path_escape(const char *f, char **ret) {
+-        char *p, *s;
++        _cleanup_free_ char *p = NULL;
++        char *s;
+
+         assert(f);
+         assert(ret);
+
+-        p = strdupa(f);
++        p = strdup(f);
+         if (!p)
+                 return -ENOMEM;
+
+@@ -386,13 +387,9 @@ int unit_name_path_escape(const char *f, char **ret) {
+                 if (!path_is_normalized(p))
+                         return -EINVAL;
+
+-                /* Truncate trailing slashes */
++                /* Truncate trailing slashes and skip leading slashes */
+                 delete_trailing_chars(p, "/");
+-
+-                /* Truncate leading slashes */
+-                p = skip_leading_chars(p, "/");
+-
+-                s = unit_name_escape(p);
++                s = unit_name_escape(skip_leading_chars(p, "/"));
+         }
+         if (!s)
+                 return -ENOMEM;
diff --git a/meta/recipes-core/systemd/systemd_244.5.bb b/meta/recipes-core/systemd/systemd_244.5.bb
index 8c95648ca0..7a7eddcd45 100644
--- a/meta/recipes-core/systemd/systemd_244.5.bb
+++ b/meta/recipes-core/systemd/systemd_244.5.bb
@@ -20,6 +20,8 @@ SRC_URI += "file://touchscreen.rules \
            file://99-default.preset \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
+           file://CVE-2021-33910.patch \
+           file://CVE-2020-13529.patch \
            "
 
 # patches needed by musl
-- 
2.25.1

