Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web08.13902.1609368268824915384
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Dec 2020 14:44:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=A8XLpRSh;
 spf=pass (domain: konsulko.com, ip: 209.85.160.175, mailfrom: scott.murray@konsulko.com)
Received: by mail-qt1-f175.google.com with SMTP id h19so11890591qtq.13
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Dec 2020 14:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7mT5GCs7sBHi6sKoB1rmWOZU3Pwv8B9kAcr/+S+mSMQ=;
        b=A8XLpRShZVu9Xr6zeln7812UCNgf0dyiDPEC0OeX8DQu0e1Jbu7dzB5/KZkYXQNRMJ
         xpIqB2rAccDugolF0Ew2IPX28ai9U8v/9mOXF/xPEz3hI8sYV6p6vve/oy9K5nSffrqM
         +jIwVxh5/j52pDEU2WwAB/rHppWOJbwE6Qqlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7mT5GCs7sBHi6sKoB1rmWOZU3Pwv8B9kAcr/+S+mSMQ=;
        b=CVmdDm0Rdhr30Utuj7vTO+VMzk5dS0Am7T+RrNZfDYonSBwibnSULOe82xX2BHKwJL
         XITu2ztUhdyWtVVRzb3ysyJZjFQ+6CfaoWyz/KwQCng44TgpeZWLTQY84XZTi3GweBFo
         hGRXXdvmJfgjoQ11SjDwabJVhQSG1r0GHLQCYdkxk0X6rJNxKLldOXcRHW9KSYAYfRU7
         meV2fOKzhSlyN4b6hoOmqTX1NQeGlx8q0OnGJeVb+YMaGcdG2Bq3RTpHaK8ybiN0NRrN
         Sgn7j6To+H0MuFhciR4dhrzZK1Wmvlw2/yWkC9PVboqJhNN2foXsQMV0iFThPV6q2JFe
         GFRQ==
X-Gm-Message-State: AOAM531HZbT2H0A5FP8Ny5FqwxU5rI/MquwN+MPpROfnE8io/dHpLI0I
	e46eCZNHtpnsiPBWyK77K2KOMWoj/wz80A==
X-Google-Smtp-Source: ABdhPJwSugCQFX/WXTMWTuz6v47jjZxYeh82c+qaSEovRJ6pmpBeiyB8fsbvBYjynki2VsRwtva4KQ==
X-Received: by 2002:ac8:5ed5:: with SMTP id s21mr55521654qtx.114.1609368267672;
        Wed, 30 Dec 2020 14:44:27 -0800 (PST)
Return-Path: <scott.murray@konsulko.com>
Received: from ghidorah.spiteful.org (198-84-179-103.cpe.teksavvy.com. [198.84.179.103])
        by smtp.gmail.com with ESMTPSA id a77sm28315573qkg.77.2020.12.30.14.44.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 14:44:27 -0800 (PST)
From: "Scott Murray" <scott.murray@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] grub: fix "CVE:" line in one of the patches
Date: Wed, 30 Dec 2020 17:44:17 -0500
Message-Id: <b071d8811f548a140949e59c6898a41ac3f47d17.1609367977.git.scott.murray@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1609367977.git.scott.murray@konsulko.com>
References: <cover.1609367977.git.scott.murray@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "CVE:" line in the patch for CVEs 2020-14309, CVE-2020-14310, and
CVE-2020-14311 had commas between the CVE numbers, which resulted in
CVE-2020-14310 not being picked up as patched by cve-check.bbclass's
parsing.  Remove the commas to match cve-check.bbclass's expectations.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 ...1-malloc-Use-overflow-checking-primitives-where-we-do-.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch b/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch
index 896a2145d4..7214ead9a7 100644
--- a/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch
+++ b/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch
@@ -30,7 +30,7 @@ Signed-off-by: Peter Jones <pjones@redhat.com>
 Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
 
 Upstream-Status: Backport
-CVE: CVE-2020-14309, CVE-2020-14310, CVE-2020-14311
+CVE: CVE-2020-14309 CVE-2020-14310 CVE-2020-14311
 
 Reference to upstream patch:
 https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3f05d693d1274965ffbe4ba99080dc2c570944c6
-- 
2.26.2

