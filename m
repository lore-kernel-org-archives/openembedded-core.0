Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C94C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 20:14:52 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web10.33052.1747944885157734144
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 13:14:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Agunqdvx;
 spf=pass (domain: gmail.com, ip: 209.85.221.177, mailfrom: hiagofranco@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-527b70bd90dso3075253e0c.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 13:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747944884; x=1748549684; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SNxLrvWHUfNYxIUmL6xjthQS4x8f+br/k40BOxgajGI=;
        b=Agunqdvx055r2XtmHSxz9dh9QOg2qyJ8o36YY0f6Yck+j2seJ2VWB21sVLzptTEeQR
         B+y1T33IS1eWOS9S/25UF90RLBy6lhPa3ydMWU+LircFf50vpYfT4mBUD87LE5M6bPU6
         4Wd+y4O9v+3WmHZfN/uZDs748aSmjcxBuxA7FOpS6yOTgrvq9Ykw9UqhM3KtWwcoxf6Z
         EUnAdGZOycKB+6LVOaOWoF9dfD0NpjF8KObKmpqJrSdW/lWtiW+VR4qmznOpOVeRW005
         aHSOcDGXjy73Ss02/BKTAeqqu0lwuud8KpzkLDz5A1aBABJKz/vDzfpI8B55E3tq5zEu
         LEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747944884; x=1748549684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNxLrvWHUfNYxIUmL6xjthQS4x8f+br/k40BOxgajGI=;
        b=FfY8fhJfGRXB6GYijjf6HbiNvnTM76l8O1WKu+B+sw/WwVDJyZ0hqMsJ625R2xVYdd
         zyOpFwjfVrAExLTqEZK3YH1O5i1VtfNhN1dkL1o0HiX84PKztSHsjsMeTIIVGKM7fSOp
         XDcvSzlJsY1UjkPsFkqpweqD+DUc7MrjRtNCpRUHKwll9UwRGwFlbtJylakXPrw3GDo3
         Dgc5npgpJ6I8KgqnRUw5DyaKe50LHVLJilnY+/PzGG2h/ew5Qui+Uka8d+p6Jm5LNupk
         /Dbt/X6qrayA92EpaVj+PEdVxNw+MDRGo/Zj6qY+xzA7SgeBW0EwKA/UVssHw/mFVlCy
         DsQg==
X-Gm-Message-State: AOJu0Yyfm1NoPZLi8sikTlvcFl48nDJe6Fuw4FN7WzAlL+3ybFqlEMOW
	G3ogH0yaM4ZczAEvK2WYWEdxw9WrDVNhYShqOQmGqwfPBf1PbEjfwBfV+nFzqg==
X-Gm-Gg: ASbGncuZwzDJcZm3aXKMK9Bkzn5HBXMkO0/+eQmF0JgXcZYUZgrXlvRog5Q22JXnwDp
	NO+CSr9MBudtSr9LVQio0NG1cooGwsSWDIE8xrO3ILryFtfnEoSBieuswSNL5iZnXuADux107OL
	Mfi2osdcbpeyar6jr0o+0qzzAVABJOdNTQQeMO8rMfBhLycPc5U3s2YqmcWCVS+CssjFa5X/Mhv
	7rFF+UYyU3XTKbu1VfrpN3rIckkzKTNnRheXfnsY9Lx0clRJfF9tHJme0ILkw/EhVPvs14jj0aH
	Q4qFBCCaS7KuSoTU7V9rEIrEKJ8GHmUvsgocKifPwGyzIpEH3z8fMC70yDQ56KEVCsYk9/7L1g=
	=
X-Google-Smtp-Source: AGHT+IG3g4i0U2dc7y+1PhLt8l/4DxeE0/bIig4upG/IeD0BTbW82MG5RceocpmCVyF5DHzzlVfWug==
X-Received: by 2002:a05:6122:4b86:b0:529:373:fcb7 with SMTP id 71dfb90a1353d-52f1fed20c9mr497734e0c.10.1747944883797;
        Thu, 22 May 2025 13:14:43 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba945b5dsm12394684e0c.19.2025.05.22.13.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 13:14:43 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH v2] base-files: add nsswitch-resolved.conf and remove nsswitch patch
Date: Thu, 22 May 2025 17:14:17 -0300
Message-Id: <20250522201417.53623-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 20:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217150

From: Hiago De Franco <hiago.franco@toradex.com>

Due to changes to nsswitch.conf file on commit 0cb122f17cf2
("base-files: add gshadow entry in nsswitch.conf"), the current patch
does not apply anymore due to patch fuzz.

This fuzz wasn't detected before because this is a conditional patch,
and will be hard to detect if nsswitch.conf changes again.

Instead, add a new version of nsswitch.conf, called
nsswitch-resolved.conf, which will later be renamed accordingly based on
the DISTRO_FEATURES variable. This file contains the necessary changes
which were applied by the patch before.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
Suggested-by: Alexander Kanavin <alex.kanavin@gmail.com>

---
v2: Patch deleted and nsswitch-resolved.conf was introduced instead.
v1: https://lore.kernel.org/all/20250521202337.113556-1-hiagofranco@gmail.com/
---
---
 .../0001-add-nss-resolve-to-nsswitch.patch    | 31 -------------------
 .../base-files/nsswitch-resolved.conf         | 20 ++++++++++++
 .../base-files/base-files_3.0.14.bb           |  4 +--
 3 files changed, 22 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-core/base-files/base-files/0001-add-nss-resolve-to-nsswitch.patch
 create mode 100644 meta/recipes-core/base-files/base-files/nsswitch-resolved.conf

diff --git a/meta/recipes-core/base-files/base-files/0001-add-nss-resolve-to-nsswitch.patch b/meta/recipes-core/base-files/base-files/0001-add-nss-resolve-to-nsswitch.patch
deleted file mode 100644
index a6e39e095688..000000000000
--- a/meta/recipes-core/base-files/base-files/0001-add-nss-resolve-to-nsswitch.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 830abe652428d9d31780c3ace121635ad7b64274 Mon Sep 17 00:00:00 2001
-From: Eero Aaltonen <eero.aaltonen@vaisala.com>
-Date: Wed Sep 27 15:50:48 2023 +0300
-Subject: [PATCH] Add nss-resolve to the Name Service Switch (NSS)
-
-Add `nss-resolve` so that `systemd-resolved` is used for name
-resolution with glibc `gethostbyname` calls.
-
-Upstream-Status: Inappropriate [no upstream, configuration].
-
-Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
----
- nsswitch.conf | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/nsswitch.conf b/nsswitch.conf
-index 06f03d2..34b165c 100644
---- a/nsswitch.conf
-+++ b/nsswitch.conf
-@@ -8,7 +8,7 @@ passwd:         compat
- group:          compat
- shadow:         compat
- 
--hosts:          files dns
-+hosts:          resolve [!UNAVAIL=return] files dns
- networks:       files
- 
- protocols:      db files
--- 
-2.25.1
-
diff --git a/meta/recipes-core/base-files/base-files/nsswitch-resolved.conf b/meta/recipes-core/base-files/base-files/nsswitch-resolved.conf
new file mode 100644
index 000000000000..ec6ce156b590
--- /dev/null
+++ b/meta/recipes-core/base-files/base-files/nsswitch-resolved.conf
@@ -0,0 +1,20 @@
+# /etc/nsswitch.conf
+#
+# Example configuration of GNU Name Service Switch functionality.
+# If you have the `glibc-doc' and `info' packages installed, try:
+# `info libc "Name Service Switch"' for information about this file.
+
+passwd:         compat
+group:          compat
+shadow:         compat
+gshadow:        files
+
+hosts:          resolve [!UNAVAIL=return] files dns
+networks:       files
+
+protocols:      db files
+services:       db files
+ethers:         db files
+rpc:            db files
+
+netgroup:       nis
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 60253fcd4213..59b084d14147 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://licenses/GPL-2;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "file://rotation \
            file://nsswitch.conf \
+           file://nsswitch-resolved.conf \
            file://motd \
            file://hosts \
            file://host.conf \
@@ -23,7 +24,6 @@ SRC_URI = "file://rotation \
            file://share/dot.profile \
            file://licenses/GPL-2 \
            "
-SRC_URI:append:libc-glibc = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd systemd-resolved', ' file://0001-add-nss-resolve-to-nsswitch.patch', '', d)}"
 
 S = "${WORKDIR}/sources"
 UNPACKDIR = "${S}"
@@ -124,7 +124,7 @@ do_install () {
 }
 
 do_install:append:libc-glibc () {
-	install -m 0644 ${S}/nsswitch.conf ${D}${sysconfdir}/nsswitch.conf
+	install -m 0644 ${S}/${@bb.utils.contains('DISTRO_FEATURES', 'systemd systemd-resolved', 'nsswitch-resolved.conf', 'nsswitch.conf', d)} ${D}${sysconfdir}/nsswitch.conf
 }
 
 DISTRO_VERSION[vardepsexclude] += "DATE"
-- 
2.39.5


