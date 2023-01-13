Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445D4C678D7
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 14:57:16 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.88821.1673621828303417208
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 06:57:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aCHiNiwo;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id t5so16908506wrq.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 06:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYF+QjMDq+TY5j5jda9vHlOYpRCgdv0i23UUSNPueGY=;
        b=aCHiNiwo1hb3hMXYuCWD9FnzKdrpSLIPFshTkR3o9sXK09cSnOZRIFkIHcnC0JEJjD
         ReVRTHJs/IMN7mYPpczvh9YN1UoEegWfg5PGHpA53G5AJyenvTYAwoO86KWKVb7DHp/C
         DlsbQDL5UD7SRbsK5Es7sRq3g2LJd/lbeBtxaycx1BVCKNwHz6O0TJt+/kZ7d8767bKd
         kg6RlYQyGUDs5HLuOl3UzIQQkc2H+SUjfVVEgI4Dn5QVYZm2Lp6s0YigIghpxzG7vi+T
         iaHnlCjvRVHPexZJRlNq9HCSzk1f3JZSW4owT/pnwOkdWRLDA4FAERN7u2jpfKvxjjDY
         umVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYF+QjMDq+TY5j5jda9vHlOYpRCgdv0i23UUSNPueGY=;
        b=jPu93Wl/tiMGrtmEMh7LQuz1kKfOvFU9TG8qTu9u6zB8PKc225TVpq/j7pBgKhWqfp
         UEojr4AukY901zaAMnk1pmpvZuV8OkBIWDQgGDEgq2bUjqQuxqxlr+fxtBxueIEwsyWh
         GxBuGV9nB5cIl1HRPMfKe91Y0VCLcD+I/5JcAFt0JyMAo9mUJ9Bu811G941mJxXJuG7p
         bm8G2oKATEinN/xsa8zBnxaWqX8oPziUMiPynT3ZfML+ZEmPX6BzNbKB7ANlDt9BMQJR
         0iz+TF/XpypRaiOvZ6KJ+jNg2NeKtD3E/WyFisH38FoPRuz3MixPlKzdH/nmFdjnyW29
         0VVg==
X-Gm-Message-State: AFqh2kqjxeFSZ3B6WKdSuyX//cCkgldJrP6dOTrH+pDWHLClVVELemv5
	ree8ritpP1lK56e/bMQOAFWdvLdcFQQ=
X-Google-Smtp-Source: AMrXdXuDBipW6Ezd5t+qYft8TXxhQ1clUaARlUwwf45SabgAl/8afIKTYJarGWwBbXHSB+SFu1G6Gg==
X-Received: by 2002:a05:6000:a06:b0:242:4383:7e80 with SMTP id co6-20020a0560000a0600b0024243837e80mr11163wrb.22.1673621826741;
        Fri, 13 Jan 2023 06:57:06 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d20-20020adfa354000000b002bc50ba3d06sm15808417wrb.9.2023.01.13.06.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:57:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/7] man-pages: upgrade 6.01 -> 6.02
Date: Fri, 13 Jan 2023 15:56:55 +0100
Message-Id: <20230113145700.2773771-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230113145700.2773771-1-alex@linutronix.de>
References: <20230113145700.2773771-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 14:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175829

License-Update: readme rewritten, set of licenses provided explicitly.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../man-pages/man-pages_6.01.bb               | 37 ---------------
 .../man-pages/man-pages_6.02.bb               | 46 +++++++++++++++++++
 2 files changed, 46 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-extended/man-pages/man-pages_6.01.bb
 create mode 100644 meta/recipes-extended/man-pages/man-pages_6.02.bb

diff --git a/meta/recipes-extended/man-pages/man-pages_6.01.bb b/meta/recipes-extended/man-pages/man-pages_6.01.bb
deleted file mode 100644
index 1ad4ed1317..0000000000
--- a/meta/recipes-extended/man-pages/man-pages_6.01.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-SUMMARY = "Linux man-pages"
-DESCRIPTION = "The Linux man-pages project documents the Linux kernel and C library interfaces that are employed by user programs"
-SECTION = "console/utils"
-HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
-LICENSE = "GPL-2.0-or-later"
-
-LIC_FILES_CHKSUM = "file://README;md5=bf1faa9b0245e39a7c0c9690ffdf6e54"
-SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
-
-SRC_URI[sha256sum] = "c1e8bea88589f1a80b67dafd82fb98b018ddd7f7bfa594f8f79686258d26e784"
-
-inherit manpages
-
-MAN_PKG = "${PN}"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[manpages] = ""
-
-do_configure[noexec] = "1"
-do_compile[noexec] = "1"
-
-do_install() {
-        oe_runmake install prefix=${prefix} DESTDIR=${D}
-}
-
-# Only deliveres man-pages so FILES:${PN} gets everything
-FILES:${PN}-doc = ""
-FILES:${PN} = "${mandir}/*"
-
-inherit update-alternatives
-
-ALTERNATIVE_PRIORITY = "100"
-ALTERNATIVE:${PN} = "crypt.3 crypt_r.3 getspnam.3 passwd.5"
-ALTERNATIVE_LINK_NAME[crypt.3] = "${mandir}/man3/crypt.3"
-ALTERNATIVE_LINK_NAME[crypt_r.3] = "${mandir}/man3/crypt_r.3"
-ALTERNATIVE_LINK_NAME[getspnam.3] = "${mandir}/man3/getspnam.3"
-ALTERNATIVE_LINK_NAME[passwd.5] = "${mandir}/man5/passwd.5"
diff --git a/meta/recipes-extended/man-pages/man-pages_6.02.bb b/meta/recipes-extended/man-pages/man-pages_6.02.bb
new file mode 100644
index 0000000000..8f1eb38082
--- /dev/null
+++ b/meta/recipes-extended/man-pages/man-pages_6.02.bb
@@ -0,0 +1,46 @@
+SUMMARY = "Linux man-pages"
+DESCRIPTION = "The Linux man-pages project documents the Linux kernel and C library interfaces that are employed by user programs"
+SECTION = "console/utils"
+HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
+LICENSE = "GPL-2.0-or-later & GPL-2.0-only & GPL-1.0-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
+
+LIC_FILES_CHKSUM = "file://README;md5=26901408d8cfd6f6675f8b49daf9cc74 \
+                    file://LICENSES/BSD-2-Clause.txt;md5=d0f280d1058e77e66264a9b9e10e6c89 \
+                    file://LICENSES/BSD-3-Clause.txt;md5=71f739ef75581cae312e8c711bcdab16 \
+                    file://LICENSES/BSD-4-Clause-UC.txt;md5=1da3cf8ad50cd8d5d1de3cfc53196d01 \
+                    file://LICENSES/GPL-1.0-or-later.txt;md5=e5b7c80002ef72ab868b43ce47b65125 \
+                    file://LICENSES/GPL-2.0-only.txt;md5=3d26203303a722dedc6bf909d95ba815 \
+                    file://LICENSES/GPL-2.0-or-later.txt;md5=3d26203303a722dedc6bf909d95ba815 \
+                    file://LICENSES/Linux-man-pages-copyleft.txt;md5=173b960c686ff2d26f043ddaeb63f6ce \
+                    file://LICENSES/MIT.txt;md5=7dda4e90ded66ab88b86f76169f28663 \
+                   "
+SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
+
+SRC_URI[sha256sum] = "968def9e7055c9cbca9a4f21f79677b02ac8b0d2fa62ceea7bd8ef4dcc6cac41"
+
+inherit manpages
+
+MAN_PKG = "${PN}"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[manpages] = ""
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+do_install() {
+        oe_runmake install prefix=${prefix} DESTDIR=${D}
+}
+
+# Only deliveres man-pages so FILES:${PN} gets everything
+FILES:${PN}-doc = ""
+FILES:${PN} = "${mandir}/*"
+
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE:${PN} = "crypt.3 crypt_r.3 getspnam.3 passwd.5"
+ALTERNATIVE_LINK_NAME[crypt.3] = "${mandir}/man3/crypt.3"
+ALTERNATIVE_LINK_NAME[crypt_r.3] = "${mandir}/man3/crypt_r.3"
+ALTERNATIVE_LINK_NAME[getspnam.3] = "${mandir}/man3/getspnam.3"
+ALTERNATIVE_LINK_NAME[passwd.5] = "${mandir}/man5/passwd.5"
-- 
2.30.2


