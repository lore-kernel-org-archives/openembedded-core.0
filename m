Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840B9C4332F
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:40 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.2684.1639608051074741549
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R9+t8nIy;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id t9so40737433wrx.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZNbUCvYdKUFOk+CtIFbkqVnBzR+HPCJfyorMXFkbiIw=;
        b=R9+t8nIyws+mV8J4xFYYizKoOUxyhH0bnxiO7jR04RB9UVjBvb+tCSCErBehBn7be2
         SO/EYj9tkBMA7YrQ4is649/bMpmdJCnk6gUWhNh9UwvUc9xRXtgfHu+Kl9kVvoKE8BSR
         Pkyxqami5x0RZtefE8GJQ86HK1URgNyH7GBJIm6xguNzCuCmzA1EmIc939HCvjvst2u+
         n6BKtlUMNEYC66msjxC9UeyaWU9nx+1DoKrKowpTckv+uPDlC8q/OIIL1PNuRyOkmhiZ
         6x5eA7gY9YVa6ZZ+USNe92JCWP4mbBCOIkAELgCzanZR6EJshUb957rsX+ZbTwn9/EL3
         tnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZNbUCvYdKUFOk+CtIFbkqVnBzR+HPCJfyorMXFkbiIw=;
        b=zvVcGavP3MYml9KC6DcPPX+3oLmX0sjgcMTt2yA8PiVWTSLljSXWrxvwGSqV8xCp5x
         VVFhGY6iVUATsp3HPI5bGSobg81kzdbHjs39ldirWJ2Fpi3Mb529r/gwbFTKAOKJQolq
         IWCWJp2F9EaIokEYcTw+lckjkEC8Fxgt9AMF91nnR4bukshXXgvPTJNiavt+WLfv1uVb
         +ept0EIztpJGewHi4F8X3M9zrLFZ4bYiiAcTCTO8EjTg/cc6FnATNvCKBYaoldpdDkpQ
         kaVzB2rnI1AuiBKuOhzO+FaUxzACWpKOB+Iouk2CFuPrHYf/4XI1z5M8W9uynfEotrO7
         HWZg==
X-Gm-Message-State: AOAM532mGrnwUwQXf7MI6cZ56+OSVZ3+A8pk0DQxjMAkxWb3XPr7vISF
	PPXO2YdLH34ynTU5HwlyKy/Z6wNc7Y+x6Q==
X-Google-Smtp-Source: 
 ABdhPJxVFxqYAFJg/gME4j1NBeskOMcmp0t9OO3xIpv4BjOCzb9Ks5LM3owvEx006X0nCxPzPQtZxg==
X-Received: by 2002:adf:fbc1:: with SMTP id d1mr6625646wrs.648.1639608049753;
        Wed, 15 Dec 2021 14:40:49 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 u2sm3587269wrs.17.2021.12.15.14.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:40:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/26] repo: update 2.18 -> 2.19
Date: Wed, 15 Dec 2021 23:40:25 +0100
Message-Id: <20211215224034.1814148-17-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215224034.1814148-1-alex@linutronix.de>
References: <20211215224034.1814148-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159759

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/repo/{repo_2.18.bb => repo_2.19.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/repo/{repo_2.18.bb => repo_2.19.bb} (88%)

diff --git a/meta/recipes-devtools/repo/repo_2.18.bb b/meta/recipes-devtools/repo/repo_2.19.bb
similarity index 88%
rename from meta/recipes-devtools/repo/repo_2.18.bb
rename to meta/recipes-devtools/repo/repo_2.19.bb
index bf5e8d0429..730540cfa0 100644
--- a/meta/recipes-devtools/repo/repo_2.18.bb
+++ b/meta/recipes-devtools/repo/repo_2.19.bb
@@ -9,10 +9,10 @@ SECTION = "console/utils"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main"
-SRCREV = "4a478edb443864561089b2699c9e65c85fc5e036"
-
-SRC_URI += "file://0001-python3-shebang.patch"
+SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
+           file://0001-python3-shebang.patch \
+           "
+SRCREV = "2a089cfee4a3eb0c28cfb441861fc1fcb05797d3"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.20.1


