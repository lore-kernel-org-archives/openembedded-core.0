Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8471CC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 13:07:15 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.66830.1638882434506162612
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:07:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oY5IhymU;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso1671062wms.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ykbUclyx1bgqtDuknd/nlYa84GPeHJKC7SWbfzyNo7E=;
        b=oY5IhymUF4w+k92AHIzvTL6Dz9aSNZV+OPOHPLH5GjGmnpevDOFWx0mQdNfLQ9qRbQ
         h6T3CPiO3v8o/yIsGMrsB7fAvl3EYILHir3fRC/ROuBF0zenqA5kJgNpQR7W0O0F0C8c
         fFLl3S0k8wa4i98jntB2VGSOamWRp8MdLTrua/Al9UC/YSqK24oI8I8xTpJ/TkEwL+Ib
         IcGXdw5fF0YAiaj7ae+KAGiPnzxH0+q8jDXGG/cQ65psku3uSS98d5zbCon8A5N+hME5
         r3wwBCLn77wHs4UmBmslBqXlqa0oEXbYU7lyvYuT2Aj5Wopw4/ocKUG1Miwq4laC4ZLA
         ZNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ykbUclyx1bgqtDuknd/nlYa84GPeHJKC7SWbfzyNo7E=;
        b=TmBcEPTmQkx3Slth0WeWV63CK27BsL/2c5APnIYih+c5yBmkQxlPRp/H12/6ZaIBI+
         ajjAsjfAhvMnwkIYImJIYwHyZePQjN6W4lDoZi1UwYoMJoKHsNT9BdEYHTwnm3ZJQLNB
         cEtnBhxhbQs5JCNSfkAo2VCNh7jKPAkcWIU1S9AkXXvNfYgY/LLxHEgmW2ahy/TgKuXp
         5eD6Took4bxZc6D5DtfAuE/+hTDxG2W8sseFZ0im8w7g69o+02L5bWW6OfI8ZbLOtBpM
         53Cu26siaQsjtiEJOznE8wwDSLj/7z+gs1CgR5n0d++sJsnezmqUrsaPr21f42+YPJSs
         At6w==
X-Gm-Message-State: AOAM531S/tX6aDHFjpm4T1Hf7rWiUst549qhZ+T29nVYQEh6DIzczZ9r
	Qa4OZhTk58hIIPMUUUPwW6gZP7xu/2Jl7A==
X-Google-Smtp-Source: 
 ABdhPJwKwkHksXGwVHZwwNDc6OCgGR/hsnuqQv/tuUWfFyYLaXfFxyku79LHo0XIFleDxyRia4+tMw==
X-Received: by 2002:a7b:ce8c:: with SMTP id q12mr6892426wmj.91.1638882433049;
        Tue, 07 Dec 2021 05:07:13 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n4sm16592468wri.41.2021.12.07.05.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 05:07:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
Subject: [PATCH 07/16] repo: update 2.17.3 -> 2.18
Date: Tue,  7 Dec 2021 14:06:54 +0100
Message-Id: <20211207130703.3196805-7-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211207130703.3196805-1-alex@linutronix.de>
References: <20211207130703.3196805-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 13:07:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159293

Replace a patch with a sed search-replace: this allows
automated version updates, as the patch hardcoded
the repo source revision.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Set-REPO_REV-to-v2.17.3.patch        | 35 -------------------
 .../repo/{repo_2.17.3.bb => repo_2.18.bb}     |  9 +++--
 2 files changed, 6 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-devtools/repo/repo-2.17.3/0001-Set-REPO_REV-to-v2.17.3.patch
 rename meta/recipes-devtools/repo/{repo_2.17.3.bb => repo_2.18.bb} (81%)

diff --git a/meta/recipes-devtools/repo/repo-2.17.3/0001-Set-REPO_REV-to-v2.17.3.patch b/meta/recipes-devtools/repo/repo-2.17.3/0001-Set-REPO_REV-to-v2.17.3.patch
deleted file mode 100644
index 60f1086b32..0000000000
--- a/meta/recipes-devtools/repo/repo-2.17.3/0001-Set-REPO_REV-to-v2.17.3.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From bdd2a528da59c28db8ae2986834926de7cebf3ab Mon Sep 17 00:00:00 2001
-From: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
-Date: Thu, 4 Nov 2021 16:55:12 +0100
-Subject: [PATCH] Set REPO_REV to v2.17.3
-
-repo is an unusual tool because it downloads all of its own Python modules
-using GPG-signed git tags, and stores those files as part of the project
-that it is working with.
-
-So in order to have a reproducible repo installation within the project
-folders, we hardcode the default REPO_REV to a SHA1 that corresponds to
-the version of the recipe. REPO_REV can still be overwriten by the user,
-by specifying the REPO_REV environment variable.
-
-Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
----
- repo | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/repo b/repo
-index 4cddbf1..5c3551f 100755
---- a/repo
-+++ b/repo
-@@ -144,7 +144,7 @@ if not REPO_URL:
-   REPO_URL = 'https://gerrit.googlesource.com/git-repo'
- REPO_REV = os.environ.get('REPO_REV')
- if not REPO_REV:
--  REPO_REV = 'stable'
-+  REPO_REV = '11b30b91df1f0e03b53da970ec2588e85817bacc'
- # URL to file bug reports for repo tool issues.
- BUG_URL = 'https://bugs.chromium.org/p/gerrit/issues/entry?template=Repo+tool+issue'
- 
--- 
-2.34.0
diff --git a/meta/recipes-devtools/repo/repo_2.17.3.bb b/meta/recipes-devtools/repo/repo_2.18.bb
similarity index 81%
rename from meta/recipes-devtools/repo/repo_2.17.3.bb
rename to meta/recipes-devtools/repo/repo_2.18.bb
index f7bbb22964..b8b73c41f3 100644
--- a/meta/recipes-devtools/repo/repo_2.17.3.bb
+++ b/meta/recipes-devtools/repo/repo_2.18.bb
@@ -10,15 +10,18 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main"
-SRCREV = "11b30b91df1f0e03b53da970ec2588e85817bacc"
+SRCREV = "4a478edb443864561089b2699c9e65c85fc5e036"
 
-SRC_URI += "file://0001-python3-shebang.patch \
-            file://0001-Set-REPO_REV-to-v2.17.3.patch"
+SRC_URI += "file://0001-python3-shebang.patch"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
 S = "${WORKDIR}/git"
 
+do_configure:prepend() {
+    sed -i -e "s/REPO_REV = '.*'/REPO_REV = '${SRCREV}'/" ${S}/repo
+}
+
 do_install() {
 	install -D ${WORKDIR}/git/repo ${D}${bindir}/repo
 }
-- 
2.20.1


