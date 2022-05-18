Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC3FC4332F
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:05 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web08.3406.1652871536579134582
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PmewjqB7;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id j28so2437433eda.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1PUJyusn29B901p1SlcOcrILw9teY2KuWgAYxdGR4sQ=;
        b=PmewjqB7681wR46PyD5kahtq7KA5JkLUjU3mga+0/2kSoQ9FGSQbwfxhPY9jJoqVsh
         v2brdmJOfNDgHsmcvzBk8UAl1MShbrutUSbVBdTZG4Cx3zJOQgRa/S7CKjNhu+DizyhK
         XJ05d1eMcwo1HM3DZjJd2QWNevF3lI+sr0LmQkFllMke6GmrtY3P4dA6tDT+Xk1tbDJq
         CmkXl6jABnqoGFBmDsZgs5nM6mnqPGxYk7SrV7yBDLPewFutsf91yz5Qe1UXz+7WONNl
         RrzDePgszXnOm7ZcuQXxs0SKbUfO3YTXLke6l0CWmr96jR5txNWvmk2o1gvtWawtoWn5
         J+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1PUJyusn29B901p1SlcOcrILw9teY2KuWgAYxdGR4sQ=;
        b=SB5dviZOAJ9GzWeG1gtZRAy4qATu0d2qGemdoSqfXEORP+x90Hgq+YalcSSjvpc02J
         HWKVybxZNvMfxoDIymJS6edVpwkkAC5cn9d1yNrLxXEEqK4mFQIeKinYJL1J8+h97ZmL
         SIcYMJzaP4bPvQI7TQODEVDRtEQjhdoqC1uw8M127Jcc9UFhR1HD3rxv+T7lI55WgfwF
         FNr0szQiB6ZnBO5A36NjDVofCWu3ct8XbrGoYAmjfA/0mm6uvvRrRwndawM8nWyEoH8Z
         tbwxL7/sPzGikNiSGpjoDv0K20UpFIkSp9gKEv1AKriOmxEogsbIds/az5BFiCtpuJVd
         CA3g==
X-Gm-Message-State: AOAM5334PW5d6/+HGlTOC4HH5UtR1Cr2wrNwCDZDQ70fOEvfI5dC88K2
	ElIfPLmbjPNGza8h/2Fzoz3jhgfuC1w=
X-Google-Smtp-Source: 
 ABdhPJwxipTGB6xdExQkg2J7gEk2adoM4atfeZF/gvqDZASzHOx8DpjO14l/FqSctaVXbrwGzYQyWg==
X-Received: by 2002:a05:6402:1612:b0:42a:be18:8c8 with SMTP id
 f18-20020a056402161200b0042abe1808c8mr12180388edv.223.1652871535149;
        Wed, 18 May 2022 03:58:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:58:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/49] python3-pip: update 22.0.4 -> 22.1
Date: Wed, 18 May 2022 12:58:02 +0200
Message-Id: <20220518105843.3299331-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165805

progress removed from vendored libraries:
https://github.com/pypa/pip/commit/2c8e78cb9caa169870744c315724680162b6f36c

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-pip_22.0.4.bb => python3-pip_22.1.bb}    | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_22.0.4.bb => python3-pip_22.1.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-pip_22.0.4.bb b/meta/recipes-devtools/python/python3-pip_22.1.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-pip_22.0.4.bb
rename to meta/recipes-devtools/python/python3-pip_22.1.bb
index 899b04d2c2..1aef9bca33 100644
--- a/meta/recipes-devtools/python/python3-pip_22.0.4.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "\
   file://src/pip/_vendor/chardet/LICENSE;md5=a6f89e2100d9b6cdffcea4f398e37343 \
   file://src/pip/_vendor/colorama/LICENSE.txt;md5=b4936429a56a652b84c5c01280dcaa26 \
   file://src/pip/_vendor/distlib/LICENSE.txt;md5=f6a11430d5cd6e2cd3832ee94f22ddfc \
-  file://src/pip/_vendor/distro.LICENSE;md5=d2794c0df5b907fdace235a619d80314 \
+  file://src/pip/_vendor/distro/LICENSE;md5=d2794c0df5b907fdace235a619d80314 \
   file://src/pip/_vendor/html5lib/LICENSE;md5=1ba5ada9e6fead1fdc32f43c9f10ba7c \
   file://src/pip/_vendor/idna/LICENSE.md;md5=239668a7c6066d9e0c5382e9c8c6c0e1 \
   file://src/pip/_vendor/msgpack/COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751 \
@@ -18,7 +18,6 @@ LIC_FILES_CHKSUM = "\
   file://src/pip/_vendor/pep517/LICENSE;md5=aad69c93f605003e3342b174d9b0708c \
   file://src/pip/_vendor/pkg_resources/LICENSE;md5=9a33897f1bca1160d7aad3835152e158 \
   file://src/pip/_vendor/platformdirs/LICENSE.txt;md5=282c970bb844954c8535dd6e9733db7f \
-  file://src/pip/_vendor/progress/LICENSE;md5=00ab78a4113b09aacf63d762a7bb9644 \
   file://src/pip/_vendor/pygments/LICENSE;md5=98419e351433ac106a24e3ad435930bc \
   file://src/pip/_vendor/pyparsing/LICENSE;md5=657a566233888513e1f07ba13e2f47f1 \
   file://src/pip/_vendor/requests/LICENSE;md5=34400b68072d710fecd0a2940a0d1658 \
@@ -38,7 +37,7 @@ SRC_URI += "file://0001-change-shebang-to-python3.patch"
 SRC_URI += "file://no_shebang_mangling.patch"
 SRC_URI += "file://reproducible.patch"
 
-SRC_URI[sha256sum] = "b3a9de2c6ef801e9247d1527a4b16f92f2cc141cd1489f3fffaf6a9e96729764"
+SRC_URI[sha256sum] = "2debf847016cfe643fa1512e2d781d3ca9e5c878ba0652583842d50cc2bcc605"
 
 do_install:append() {
     rm -f ${D}/${bindir}/pip
-- 
2.30.2


