Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF75C001DC
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:37:22 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.78298.1690742241434881300
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=SfPMBBB6;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-686f94328a4so2024943b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690742240; x=1691347040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ni71dFa2UmSP5UpIwjw+qtGZ9fJPS6G4iRTTPvVM79U=;
        b=SfPMBBB6ToVzpEDKksmQP3/rYCQwI2Nf32MxCBP6VcDE/T0bU2M7QhR48nkgwuoDu8
         xRO+AOAeQjB3+kZMnrJeFpo9eGPdjbPC3ZbVYSkXp/eb0fu4L7WBLnTezWHo9Gjszv7R
         Q+0oWUtLDovLZB1l55E9NZAbMQP89T1QWd/srUklVpsXbdlH/cSWYEvc1zh2a+RsdoE7
         qZ6NmD2c8p7IrXX8Aiy2WTyyEEMe1WzhgOxo0ry1wzEuRXXvWPXT2Jiru+PNHLfOavbf
         jQT/Hw3/TWJSTnw1tgl0DdsYmWUkkqTda0Yeez+OqXzS2VsbIcHnaCqEnEPx9xju0w04
         CJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690742240; x=1691347040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ni71dFa2UmSP5UpIwjw+qtGZ9fJPS6G4iRTTPvVM79U=;
        b=QkvP6IEUFhgP9XOQhI584RWxxp/rnCKqe4yYGCsg2dvUQJH6nrHV3P2LMGuTOG+LfZ
         Z8GmoAR3ulYOXlUaScgf/ipTiLJLUgAMmsMnmG+1Q3fKxjkFsuDdUH5Sr2WpzfyAaAs0
         drIw7bxI9gWc/W8/QAlZLnWKg9Fie5Miqr5Gb0FiP+3snfca1fgskkQfjwIfvzqyTaeR
         cdNlTKuEDCU1gsGCFo448qNWIx7p1kJ35K1KTwnc0LEBv4N0sAopNOjRrvi0d0OFtgY7
         PUwSVXnoa2qpOqVZZkpS4vGPYVb70DrqtQ8Bzdg01vpwHj6B4J+ox8xFPeG3XamFi1Wf
         us/A==
X-Gm-Message-State: ABy/qLbsyo9cINXx6S06oxF9sW6NbWgg4Q7OL5S2j1u+W+S11a0XBSc8
	ffbkRQLJ8OCaPx/ZnhXJApdgyKD9Ud0=
X-Google-Smtp-Source: APBJJlGfprVZ/gYVJgnTpvA0n5eCOaagLv2ySety2NvPoPgMfnRYl9EZo7UwqQj4BOrrE2XBuyyzow==
X-Received: by 2002:a05:6a00:1910:b0:682:edbe:4cbd with SMTP id y16-20020a056a00191000b00682edbe4cbdmr9144511pfi.15.1690742240250;
        Sun, 30 Jul 2023 11:37:20 -0700 (PDT)
Received: from chiron.. ([2601:1c0:ca00:cea0:6031:b260:43bc:b5ef])
        by smtp.gmail.com with ESMTPSA id q23-20020a62e117000000b00682b2fbd20fsm6230944pfh.31.2023.07.30.11.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:37:19 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-sphinx: upgrade 7.0.1 -> 7.1.1
Date: Sun, 30 Jul 2023 11:37:12 -0700
Message-Id: <20230730183712.2249757-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185109

No longer need to set PYPI_PACKAGE, download is
now sphinx-${PV}.tar.gz not Sphinx-${PV}.tar.gz.

https://www.sphinx-doc.org/en/master/changes.html#release-7-1-1-released-jul-27-2023
https://www.sphinx-doc.org/en/master/changes.html#release-7-1-0-released-jul-24-2023

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-sphinx_7.0.1.bb => python3-sphinx_7.1.1.bb}     | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinx_7.0.1.bb => python3-sphinx_7.1.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb b/meta/recipes-devtools/python/python3-sphinx_7.1.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-sphinx_7.0.1.bb
rename to meta/recipes-devtools/python/python3-sphinx_7.1.1.bb
index 10e01a2d7ae..fa616cd5044 100644
--- a/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_7.1.1.bb
@@ -4,13 +4,10 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb6ac1b115a1ed24a12d9f15b633993"
 
-PYPI_PACKAGE = "Sphinx"
-
-SRC_URI[sha256sum] = "61e025f788c5977d9412587e733733a289e2b9fdc2fef8868ddfbfc4ccfe881d"
+SRC_URI[sha256sum] = "59b8e391f0768a96cd233e8300fe7f0a8dc2f64f83dc2a54336a9a84f428ff4e"
 
 inherit python_flit_core pypi
 
- 
 do_install:append () {
 	# The cache format of "{None, 'en', 'ja'}" doesn't seem to be consistent (dict ordering?)
 	rm ${D}${libdir}/${PYTHON_DIR}/site-packages/sphinx/writers/__pycache__/*latex*
-- 
2.34.1


