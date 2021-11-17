Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8821AC433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:32 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.8702.1637163331749322307
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oZCUoqun;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id t30so5458830wra.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F8t7Uit2wxEuF/HP7EA6BSsvhAGOB8sfb3bHq8YGT2s=;
        b=oZCUoqunW702VW2JiSpG9kXEGxx+sbsnLcZ6DBKp4sML0NB5CCYIggFT5mSXT1wZFm
         eMQlgBN5TUtwQJtWHk+MjCAk5BrGFvtczd7pLIdlAy1lNmhndF+EcNlNSuqe5I9dbu+V
         yFl62w7id91jkVSqljHWULO4ki2BAp77HZsjwwV4OmSo27dqm7kM1O2tYhkrjpcr0wqr
         n4oZB4Uy4/O0xyfXdl3lHSByFMhwF+dHGzDlWSEZdEibdyo6Z86UcgwYlpUfzOazU/rh
         kiQJewyA9K+kxwG195WOyXX0q9uEZVxD1ynqZ4RQ8mm0ZQ5Ph7kM3YeH/KKugqByKAoi
         /Ymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F8t7Uit2wxEuF/HP7EA6BSsvhAGOB8sfb3bHq8YGT2s=;
        b=WL0shngO2TLsSgE75RZsPaoxfoTWhV8yhgap4nlBrqBxG2GLy9bB6WlC9FziLhQYJR
         BiZ1FKL1B6D54W1UCGicrcfSbAZxnEDkL8+OMoSBET1hMHQ26aMSTcOA3ywVqf9JPH69
         Szh0lcTpaPWaFBFuduLVx6IDllDByV5COp5HGLlFhwrBTs40H6TKbyCRU0e6g3Pgj18r
         bQCFAQdF2DXTkTv/Z8Yu000hSl7Zv8m+iNLrRQ8fSCs1Ywuoa4Rlan0gThW1sEx47w34
         rcdNY/jFXTHin7Z9xH7RI6vompJwlrwOUKLmIzarTplSTrjON6Nzhl5JwioF8hn5ZCTd
         alow==
X-Gm-Message-State: AOAM532CsxkmxkNKaO2YrfMW1bcul4P1+vjxKdSFMk2BeQwKOumFVnC+
	XEbL38i0x9kObcvl4KVqe6ExC9wUyHo=
X-Google-Smtp-Source: 
 ABdhPJy75Un/1fEvlTyCS75SvPELJVOrLDBKsXl6sPDHyY6ZUC5JoWxYNBLM4SAsR9wLOCxs7O9A6A==
X-Received: by 2002:adf:d1cd:: with SMTP id
 b13mr21322538wrd.323.1637163330366;
        Wed, 17 Nov 2021 07:35:30 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/36] unzip/zip: mark all patches as non-upstreamable
Date: Wed, 17 Nov 2021 16:34:55 +0100
Message-Id: <20211117153525.257146-6-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158401

While upstream is not technically dead as of today [1], it has not made
a release in over a decade, and there is no source code repo to
rebase the patches on. If/when a new release ever comes, or someone
takes over the maintenance, we can reassess the situation with these patches.

[1] Discussion in https://sourceforge.net/p/infozip/bugs/53/

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/unzip/unzip/avoid-strip.patch         | 2 +-
 meta/recipes-extended/unzip/unzip/define-ldflags.patch      | 2 +-
 meta/recipes-extended/unzip/unzip/fix-security-format.patch | 2 +-
 meta/recipes-extended/unzip/unzip/symlink.patch             | 2 +-
 meta/recipes-extended/zip/zip-3.0/fix-security-format.patch | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/unzip/unzip/avoid-strip.patch b/meta/recipes-extended/unzip/unzip/avoid-strip.patch
index 8f30e42674..e0c89d81b7 100644
--- a/meta/recipes-extended/unzip/unzip/avoid-strip.patch
+++ b/meta/recipes-extended/unzip/unzip/avoid-strip.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [need a new release]
 
 unix/Makefile: remove hard coded strip commands
 
diff --git a/meta/recipes-extended/unzip/unzip/define-ldflags.patch b/meta/recipes-extended/unzip/unzip/define-ldflags.patch
index 659c6e3315..dc554c32cb 100644
--- a/meta/recipes-extended/unzip/unzip/define-ldflags.patch
+++ b/meta/recipes-extended/unzip/unzip/define-ldflags.patch
@@ -1,6 +1,6 @@
 Pass LDFLAGS to the linker 
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [need a new release]
 
 Signed-off-by: Mikhail Durnev <Mikhail_Durnev@mentor.com>
 
diff --git a/meta/recipes-extended/unzip/unzip/fix-security-format.patch b/meta/recipes-extended/unzip/unzip/fix-security-format.patch
index 8e9b06c423..ba6ead3b5e 100644
--- a/meta/recipes-extended/unzip/unzip/fix-security-format.patch
+++ b/meta/recipes-extended/unzip/unzip/fix-security-format.patch
@@ -5,7 +5,7 @@ Fix security formatting issues related to sprintf parameters expeted.
 [YOCTO #9551]
 [https://bugzilla.yoctoproject.org/show_bug.cgi?id=9551]
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [need a new release]
 
 Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
 
diff --git a/meta/recipes-extended/unzip/unzip/symlink.patch b/meta/recipes-extended/unzip/unzip/symlink.patch
index a38f6f1612..c1d82ac187 100644
--- a/meta/recipes-extended/unzip/unzip/symlink.patch
+++ b/meta/recipes-extended/unzip/unzip/symlink.patch
@@ -6,7 +6,7 @@ a symlink entry."
 
 This patch is taken from Fedora (https://bugzilla.redhat.com/show_bug.cgi?id=972427)
 
-Upstream-Status: Pending (upstream is dead)
+Upstream-Status: Inappropriate [need a new release]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 --- unzip60/process.c.sav	2013-06-09 12:08:57.070392264 +0200
diff --git a/meta/recipes-extended/zip/zip-3.0/fix-security-format.patch b/meta/recipes-extended/zip/zip-3.0/fix-security-format.patch
index 19d8548273..5cdbf22a54 100644
--- a/meta/recipes-extended/zip/zip-3.0/fix-security-format.patch
+++ b/meta/recipes-extended/zip/zip-3.0/fix-security-format.patch
@@ -14,7 +14,7 @@ zip.c:1228:5: error: format not a string literal and no format arguments [-Werro
 [YOCTO #9552]
 [https://bugzilla.yoctoproject.org/show_bug.cgi?id=9552]
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [need a new release]
 
 Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
 
-- 
2.20.1


