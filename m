Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60665C46CD2
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 13:36:06 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.23435.1704461765011945834
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 05:36:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HjpBTyia;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40d76923ec4so14927425e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 05:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704461763; x=1705066563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRjuIe2FhlhIwC/hX9SYu+ue0buOXHbxlJypSpaqc4Q=;
        b=HjpBTyiaoFHFWLm7KweLKNsNROWFIIgS+jRODjZ3EMtaRqgdu99gDNlWDPdsbRhOWx
         G42vxUI/wtN+2gM6hIW4W128slNGGygcAH0jBBV+Kj4tAB2ie0EFKeGsuz6NQBsMFzTV
         5hlHHHQFWXfUDdqjsAp688aG1sb5owSzdJP3r3WaeF4ZTnWzvIg7A59EgDv5p3OpUxQU
         zBEJJRE4FQY6py/E8Gv1IO7IZVQix0qiZm1nbHeqbkONnXPhceJIK/N0I/wf+vmf+i+X
         NuP4HR5F2fveipKPtC7eh/ZRKJH+GK/X2Wx3KZmkxdVH4I0cbQd3IjzpIhPWJCBhi+KL
         7EGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704461763; x=1705066563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zRjuIe2FhlhIwC/hX9SYu+ue0buOXHbxlJypSpaqc4Q=;
        b=sAJlfUaYthHHmI7mRUovneVeSXg85gUlaL7lxGmnJ8ug4bVqln76y0kqYOrIawbF0t
         i0P83wO9wegzro7+IMT87lXB93aM+70PRkZow0RLs9KKxp1hTBrGg5kfPhyli/C6fKeE
         6dbweqvAgqWWKANYYbYq8/55qovdZiMlLhONMO0cqy8UNaDqhwJQOxw/CqShLWxc2ty6
         GL8EJdGDguMt+B0D4NfJXHaMGJ03hJEKbD5eoGwWf/JbUXsEvfaAzM5qqxecLeL8DxXb
         k5IgarnTb/bDKl3Nxz3Rz6XTNZxUy/+eZj74eJPJA2uskrRP1q0rgCD9gF7FOpAIFWhq
         g/ww==
X-Gm-Message-State: AOJu0YxjQgbhhcc6EbyG+sESz/JEgNc/8yUr3N2sEYuBg8ME8g3UVXWo
	oLiyCamhTuFyNe4AkwU9w1HTNLgDzO8=
X-Google-Smtp-Source: AGHT+IHZeGrbtsrDJp6KPrXYXrQ7m6CfkfXpAVE3O7PC9/iQiMq3ilJp26iFXO7UNQ9ImBBZoQraAQ==
X-Received: by 2002:a05:600c:ccc:b0:40e:51e:7295 with SMTP id fk12-20020a05600c0ccc00b0040e051e7295mr1150556wmb.82.1704461763251;
        Fri, 05 Jan 2024 05:36:03 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id w13-20020a5d608d000000b003372c080acasm1425187wrt.2.2024.01.05.05.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 05:36:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/3] python3-cython: update 0.29.36 -> 3.0.7
Date: Fri,  5 Jan 2024 14:35:43 +0100
Message-Id: <20240105133543.3017997-3-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240105133543.3017997-1-alex@linutronix.de>
References: <20240105133543.3017997-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 13:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193357

pep517 build backends require cython 3.x when
python is at 3.12, so we can't hold this update any
longer. There are only a few things in meta-oe
and meta that break anymore, and fixes for them
are provided at the same time as this patch.

License-update: http -> https

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python-cython.inc             | 7 +++++--
 .../{python3-cython_0.29.36.bb => python3-cython_3.0.7.bb} | 0
 2 files changed, 5 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_0.29.36.bb => python3-cython_3.0.7.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index 6aec6b012f1..bc1953c5045 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -5,11 +5,11 @@ It's designed to bridge the gap between the nice, high-level, easy-to-use world
 and the messy, low-level world of C."
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "41c0cfd2d754e383c9eeb95effc9aa4ab847d0c9747077ddd7c0dcb68c3bc01f"
+SRC_URI[sha256sum] = "fb299acf3a578573c190c858d49e0cf9d75f4bc49c3f24c5a63804997ef09213"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
@@ -39,4 +39,7 @@ do_install:append() {
 	for PYTHSCRIPT in `grep -rIl '^#!.*python' ${D}`; do
 		sed -i -e '1s|^#!.*|#!/usr/bin/env ${PYTHON_PN}|' $PYTHSCRIPT
 	done
+
+        # remove build paths from generated sources
+        sed -i -e 's|${WORKDIR}||' ${S}/Cython/*.c ${S}/Cython/Compiler/*.c ${S}/Cython/Plex/*.c
 }
diff --git a/meta/recipes-devtools/python/python3-cython_0.29.36.bb b/meta/recipes-devtools/python/python3-cython_3.0.7.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-cython_0.29.36.bb
rename to meta/recipes-devtools/python/python3-cython_3.0.7.bb
-- 
2.39.2


