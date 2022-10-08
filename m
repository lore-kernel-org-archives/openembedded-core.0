Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB2BC433F5
	for <webhook@archiver.kernel.org>; Sat,  8 Oct 2022 23:55:35 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web08.9228.1665273328566458865
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 16:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=arfsZUJn;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id bh13so7590104pgb.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 16:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSOmtq/rqM8z8q/doTqzv0y7Dv/Xu8cMghDx8Usds/Q=;
        b=arfsZUJnHZa3I4q7SmrfraruI0ABum8v0ruAc6pAnjE73ASTmNnOpBXb05g8Bzl4hZ
         du1U8IgeStH0h2qxx5bQ2OJd0CnQkLiw7WZVC0QN4+j6gEp/3KylJBgviJKfCkpuep/m
         69u1GyIbHjYJsHsSYUeNXdx+eYQa6wxG6tu/U/eEUzz/PqIsrv0si2FrMmIE0n8v9oBb
         pF+wNhO2F2Ce2bos87ehpOVN8piFbN7kAm+8aENmxXUGy3stvZieeEakeSA8LS2YdaH4
         QgUBh329mHlESYhLiVTH+6X7ge8JLEdLHZCdg49AEhfP0tYMqs7woXnG2ShM0Ac5RL9y
         Yxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BSOmtq/rqM8z8q/doTqzv0y7Dv/Xu8cMghDx8Usds/Q=;
        b=WSMl8uh/IyERnwo/zY3rLcZlG8Ckqy7J4b+Cz4CEFYgsphCZUBIRFOHUrprIkjmEt5
         QzsLdl3PJuHaX1qwqwTeVSgudSC0AK4pdEW/oafv3A8Jal0zAlMNAl9dQd0L8tRo2P6k
         uEexPGEak59nIyO5If9t4s37bzCNu4pHVTNkz3VQIHTK+q/banTfoT6wT8watnLrPJBr
         9ZvetHhQr0PhlAkozyuMCoSQSlx4ehXS7Nss5Mqu2LxutwveIBjbtGOv0uPi2xJ52cKd
         qh0z4Mo1rn6Dl8c4qbxT9HuIxB1mYW07wY9pTVffofcQDGc4RfvBx/9vXiZSco2Sx693
         gVvQ==
X-Gm-Message-State: ACrzQf3X7uFtmYsS5CDyFDE2l1xL5pndPGJPnvcpjLyN5EyBrBbdyGBS
	ILhU9I3W9qCwuom/nUov9L2EAiCOE0U=
X-Google-Smtp-Source: 
 AMsMyM6KIcYOk9ZhVGxNmgNkhhXTvU4zhqrMj1SR9q4By9q3NBoIY259DBYXgGnnnIr1wxalBtj1tg==
X-Received: by 2002:a05:6a00:2918:b0:535:ea9:791a with SMTP id
 cg24-20020a056a00291800b005350ea9791amr12622579pfb.54.1665273327468;
        Sat, 08 Oct 2022 16:55:27 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net
 ([2601:1c0:ca00:cea0:170:23ea:e88e:bfb7])
        by smtp.gmail.com with ESMTPSA id
 k11-20020a170902ce0b00b0017f57787a4asm3814710plg.229.2022.10.08.16.55.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Oct 2022 16:55:27 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/10] python3-sphinx: upgrade 5.1.1 -> 5.2.3
Date: Sat,  8 Oct 2022 16:54:51 -0700
Message-Id: 
 <4a11065d07d31ecc431564bbbc0371d956c37aae.1665270768.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1665270768.git.tim.orling@konsulko.com>
References: <cover.1665270768.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Oct 2022 23:55:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171545

* Now uses flit-core backend (python_flit_core.bbclass)
* Sort RDEPENDS alphabetically to make it easier to see what is present.

For changes see:
https://www.sphinx-doc.org/en/master/changes.html#release-5-2-3-released-sep-30-2022
https://www.sphinx-doc.org/en/master/changes.html#release-5-2-2-released-sep-27-2022
https://www.sphinx-doc.org/en/master/changes.html#release-5-2-0-post0-released-sep-24-2022
https://www.sphinx-doc.org/en/master/changes.html#release-5-2-0-released-sep-24-2022

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...phinx_5.1.1.bb => python3-sphinx_5.2.3.bb} | 25 +++++++++++++------
 1 file changed, 17 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinx_5.1.1.bb => python3-sphinx_5.2.3.bb} (48%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_5.1.1.bb b/meta/recipes-devtools/python/python3-sphinx_5.2.3.bb
similarity index 48%
rename from meta/recipes-devtools/python/python3-sphinx_5.1.1.bb
rename to meta/recipes-devtools/python/python3-sphinx_5.2.3.bb
index 1bef20c2e25..957bd17fc07 100644
--- a/meta/recipes-devtools/python/python3-sphinx_5.1.1.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_5.2.3.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=72c536e78c21c567311b193fe00cd253"
 
 PYPI_PACKAGE = "Sphinx"
 
-SRC_URI[sha256sum] = "ba3224a4e206e1fbdecf98a4fae4992ef9b24b85ebf7b584bb340156eaf08d89"
+SRC_URI[sha256sum] = "5b10cb1022dac8c035f75767799c39217a05fc0fe2d6fe5597560d38e44f0363"
 
-inherit setuptools3 pypi
+inherit python_flit_core pypi
 
  
 do_install:append () {
@@ -17,12 +17,21 @@ do_install:append () {
 }
 
 RDEPENDS:${PN} = "\
-    python3-packaging python3-docutils python3-requests \
-    python3-imagesize python3-alabaster python3-jinja2 \
-    python3-babel python3-pygments python3-snowballstemmer \
-    python3-sphinxcontrib-applehelp python3-sphinxcontrib-devhelp \
-    python3-sphinxcontrib-jsmath python3-sphinxcontrib-htmlhelp \
-    python3-sphinxcontrib-serializinghtml python3-sphinxcontrib-qthelp \
+    python3-alabaster \
+    python3-babel \
+    python3-docutils \
+    python3-imagesize \
+    python3-jinja2 \
+    python3-packaging \
+    python3-pygments \
+    python3-requests \
+    python3-snowballstemmer \
+    python3-sphinxcontrib-applehelp \
+    python3-sphinxcontrib-devhelp \
+    python3-sphinxcontrib-htmlhelp \
+    python3-sphinxcontrib-jsmath \
+    python3-sphinxcontrib-qthelp \
+    python3-sphinxcontrib-serializinghtml \
     "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


