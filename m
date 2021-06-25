Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web12.8843.1624632949985809774
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jun 2021 07:55:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O/Tm2Q2g;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: weaverjs@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id e3so7715080qte.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jun 2021 07:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R9QmWeBdNLdTIzEG2tO4gbqbmCPCCm9t4G5tjdATBSs=;
        b=O/Tm2Q2gkMBQ7YCziRtb69MD3Cpaf179ZufQRb0QtCwGXNt2SzALj7FgiJYhg2z2C/
         oSIg5aRlOADBMVM+BS0yj5TLoW2QobvtsF7QYsAGuvjpfgmwrPCPWEwOEPTvWQBRRvK7
         Aki0VFrnXAja40ZNYaA3SjejONbtmvAb+SWCXmTRMJeh2tEISJhw7NxVe6tMZC0qXeYs
         mI3jbJxf/151gbOtrh7aqteziiOfQHt+A1Z+4rT5LJQ+Dvfayq/ZAcaQ+fvkzE07Xxko
         8+xaXWGSulLTD/0mI5xSFiWsbc+rO3i0RBgCiIR1TWM+zlbKbOMmSwY4EFsdrR+gBX4v
         zePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R9QmWeBdNLdTIzEG2tO4gbqbmCPCCm9t4G5tjdATBSs=;
        b=gBXHx8+maysP9HIk++29/29zMTo8l6VBimUc1Z5tirJbiDm4ezmw8US+Mk5KJVvrxI
         S9+5+poe1JBeX6/8Qv3kyuMHjucLUOv/Qz2aStIR12sfmtiTkNXiGmxiUewOPoW0L8FF
         u5sKCZb+zvYaXy6P253EBRwGivROKdCjI9KKqxb3hR1aIaAqXNzNbqVT9QPvRmmcWeQZ
         o0ZRYEh0eJITMJIZ+EMj6ijPwj8KXBUvwpRVe+YrRmdJj6Gv1VSYXFVoPa2Z49CODRcf
         ufKbmWYXuOj7rArYwx17iPCFqWAkiuxRD6um1bOar9kLz4L/veYfIlnPReIJA1pJCULi
         PlPw==
X-Gm-Message-State: AOAM532+JEsiB+L5xhoJQwKUW8+PtDGhYlf+r5x5/sbggZ6YVAyyIh1r
	Zxp288JN/K+dmmsWJdcUmyTp9io3ol4t2M0k8A==
X-Google-Smtp-Source: ABdhPJxSxBngBCABEJwvhAaMuiFgq09VXi76FANQ8xwuO63xwM1JR8uwc+22zGAAIG4dGWBpgJBHGg==
X-Received: by 2002:ac8:58c5:: with SMTP id u5mr9871882qta.173.1624632948864;
        Fri, 25 Jun 2021 07:55:48 -0700 (PDT)
Return-Path: <weaverjs@gmail.com>
Received: from p-impout001.msg.pkvw.co.charter.net (cpe-69-133-48-66.cinci.res.rr.com. [69.133.48.66])
        by smtp.gmail.com with ESMTPSA id o15sm3918456qtw.5.2021.06.25.07.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 07:55:48 -0700 (PDT)
From: "Scott Weaver" <weaverjs@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Scott Weaver <weaverjs@gmail.com>
Subject: [OE-core][PATCH v2] meta-skeleton: update to satisfy yocto-check-layer tests
Date: Fri, 25 Jun 2021 10:54:52 -0400
Message-Id: <20210625145452.267231-1-weaverjs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added readme to satisfy the readme file test.
Updated busybox bbappend to satisfy the signature test.

[YOCTO #13612]

Signed-off-by: Scott Weaver <weaverjs@gmail.com>
---
 meta-skeleton/README.skeleton                         | 4 ++++
 meta-skeleton/recipes-core/busybox/busybox_%.bbappend | 3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)
 create mode 100644 meta-skeleton/README.skeleton

diff --git a/meta-skeleton/README.skeleton b/meta-skeleton/README.skeleton
new file mode 100644
index 0000000000..35503c1f7d
--- /dev/null
+++ b/meta-skeleton/README.skeleton
@@ -0,0 +1,4 @@
+meta-skeleton
+=============
+
+The meta-skeleton layer contains example recipes and configuration files.
diff --git a/meta-skeleton/recipes-core/busybox/busybox_%.bbappend b/meta-skeleton/recipes-core/busybox/busybox_%.bbappend
index 64cdefc76d..5c5e7c356b 100644
--- a/meta-skeleton/recipes-core/busybox/busybox_%.bbappend
+++ b/meta-skeleton/recipes-core/busybox/busybox_%.bbappend
@@ -2,11 +2,12 @@
 # mechanism as the linux-yocto kernel recipe.
 #
 # The entries here will override any entries in the base busybox recipe
+# when DISTRO = "mydistro" is defined in your conf/local.conf file.
 #
 # More details can be found in the Kernel Dev Manual
 # http://www.yoctoproject.org/docs/current/kernel-dev/kernel-dev.html#changing-the-configuration
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-SRC_URI += " \
+SRC_URI_append_mydistro += " \
 	    file://no_rfkill.cfg \
            "
-- 
2.25.1

