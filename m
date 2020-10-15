Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web12.6227.1602740763243725775
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2020 22:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UIJetCHB;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 16so1839793oix.9
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2020 22:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=vJifAO+6K2jXU3iOmubTIWbMzLm1RpYU2yP81VFkGCk=;
        b=UIJetCHBGKDBlXW4kXylaEmsbG4rHnMUNHh6BcKhu3v98cKyqpiqQTUo3n8DmubNvZ
         LBpIuW7QMvR9u1pNtyI9sA0iz/uo6RplLQa0WNyP9uK/+l1Mv0wupSW2zCvNi5dgQgVO
         FyjCmHfwQi0F9fntmI9LKJvbmMsMp+rfvJRWp5pOgC8j3eHDTF8tSSXLu18U3O8a7OU6
         b5SOGlyWa7bhO+S2s2h961csARp4yfT4UgoSeBsDEoPJ9bYe3j7R1kn6uXz++oocN14q
         eDRkDxy6tHmWVZlqr5bKoBkhYEPbI4tUMKHAR55zYIHUOciHr38FWtNg5ZUsKyguKieY
         4F9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vJifAO+6K2jXU3iOmubTIWbMzLm1RpYU2yP81VFkGCk=;
        b=pfiAM0MEVUvS6vwOguY78ZaBMgkDRkdFvoBADdaN2F4Fl+H2vjcGnQ7S7Jz0+WRHZN
         ztPUkFVlCXgFaJ/Bt6khDEEZx400wYDxmHKLewIYuys4o2EqujbG1tY/OxFzgX/tGA7W
         uh5Y/e+VQ8PSQQJqksGDeKeslXmqdx4Z5tkiOp7mFmDc9EMhhj9tK+XK8TNaJWiL3bBf
         WXZU4GCshbqTJmtYdLKeBW4rKw1xYmpgblfjW/Jk105juejGyabV+J0OYCZK5eitvw4E
         yx/lbQ3BkfD/l2wx5pQp816wuZgkXp9FNvnI2FqRLSFCp5Wv2J8eVlO/oxBzZqN4WIxL
         +Cfw==
X-Gm-Message-State: AOAM530KrY5Ny1SHCb1vHpTJmE94vTq+eZRBewpzgtLaqnUwUY8WBi4v
	+peEi6Td5XKOMsjoZbzL7yEiHOx5vr4=
X-Google-Smtp-Source: ABdhPJziXgBIaIETgdWj5B2vL5cZQn4MGOw700e3fAFDnGzugPJ9c4dHnh6zIdO6OIcN1NJ4qJpfDQ==
X-Received: by 2002:aca:5f89:: with SMTP id t131mr1072537oib.52.1602740762424;
        Wed, 14 Oct 2020 22:46:02 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:20b4:de17:4e9:6126])
        by smtp.gmail.com with ESMTPSA id z25sm937840ood.21.2020.10.14.22.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 22:46:01 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: akuster <akuster@kona.kama-aina.net>,
	akuster <akuster808@gmail.com>
Subject: [PATCH] busybox: add rev and pgrep
Date: Wed, 14 Oct 2020 22:46:00 -0700
Message-Id: <20201015054600.24514-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: akuster <akuster@kona.kama-aina.net>

Signed-off-by: akuster <akuster808@gmail.com>
---
 meta/recipes-core/busybox/busybox/pgrep.cfg | 1 +
 meta/recipes-core/busybox/busybox/rev.cfg   | 1 +
 meta/recipes-core/busybox/busybox_1.32.0.bb | 2 ++
 3 files changed, 4 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/pgrep.cfg
 create mode 100644 meta/recipes-core/busybox/busybox/rev.cfg

diff --git a/meta/recipes-core/busybox/busybox/pgrep.cfg b/meta/recipes-core/busybox/busybox/pgrep.cfg
new file mode 100644
index 00000000000..775e487d601
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/pgrep.cfg
@@ -0,0 +1 @@
+CONFIG_PGREP=y
diff --git a/meta/recipes-core/busybox/busybox/rev.cfg b/meta/recipes-core/busybox/busybox/rev.cfg
new file mode 100644
index 00000000000..da008c30cd3
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/rev.cfg
@@ -0,0 +1 @@
+CONFIG_REV=y
diff --git a/meta/recipes-core/busybox/busybox_1.32.0.bb b/meta/recipes-core/busybox/busybox_1.32.0.bb
index aeea40fbc15..8e23b0d4a28 100644
--- a/meta/recipes-core/busybox/busybox_1.32.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.32.0.bb
@@ -44,6 +44,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
            file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
            file://0001-hwclock-make-glibc-2.31-compatible.patch \
+           file://rev.cfg \
+           file://pgrep.cfg \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.17.1

