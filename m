Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D06C43217
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 07:13:38 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.22668.1638602017434051202
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pRc//FQN;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id a9so10513048wrr.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z+3mGPILJd7p2iu4x20ttWAtPtskyVd/QNxYoxkroz4=;
        b=pRc//FQN+fRSVnuoutEybrmTQtEzlxYQM1V9vqsBYrILi0BOdoILPfdXjAJKLAsCl8
         /xrBg1B/dhkURw6jgBmGSECVkFlIWKnT5pkLIAxQ/G9MiVv/XpXHd3CLQ97Qrub8I7YI
         xJr9zH/nKsJqip/oFyIC0sMZ0o/ltFacyrReXrDmrb6QYHeTdOD/9rjlDmpcUeJXYssM
         QlR+mss1jqbvlzrmVnh/kXH8rTjBSRA+y5brtkW2wB99DwqOM0GjD9X70ayGiXfJd5dA
         xiCiWYOnhbH88FCjM0fzToQuAiCS2bufGEUK5imQ9C8Q0QJ9IcZCveFbLQ3NfCH68+MR
         wRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z+3mGPILJd7p2iu4x20ttWAtPtskyVd/QNxYoxkroz4=;
        b=2LnKG0zElNako/EMMot5NIMcEgvRNordiKQ33g2ROqTLJ0aKa4jHdPmKP+XrSD5Cwa
         jjOcRdj5Ly7DqR6UnfLslBElmEEM50wucMCEcIHLlqR5/GLfcHES63nwyHDbg+GBeVo7
         PzhYpxeCa7oxV7wX3kc6p94iCVIl44uXXnqrgQ3r54aUeInp8SqUEKXEHdgxlbJkj/zg
         6VPJkvuh/sUqBKxEkC970v2bKaQLCmOXWBw2GtUrEDN1rXtCwvLQnxknXWOiOaPzad/p
         r7Db+Y++KJKg0fG+A4DVj6Xisl5pLYqyFgHAUZeZcLvQGwF0es2mnJSXmipNoHndrbo8
         xBEw==
X-Gm-Message-State: AOAM531DMlcMDglrwH5ZxwHihCXFj4X8gV4KUqS3kZmsNVbBw4zBfXPd
	FnfKHEizGfogYed28g/2UJAR/f4Z0mIFxQ==
X-Google-Smtp-Source: 
 ABdhPJxT0RrhPIZNc8v4gnOenQ0gODxA4memIfxczvDheRtFPcFf+Jb16EUtUdpgbsdWNMeH5bJ7ZA==
X-Received: by 2002:adf:e0c3:: with SMTP id m3mr27115687wri.546.1638602016092;
        Fri, 03 Dec 2021 23:13:36 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 y15sm5837992wry.72.2021.12.03.23.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 23:13:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/26] adwaita-icon-theme: submit patch upstream
Date: Sat,  4 Dec 2021 08:13:10 +0100
Message-Id: <20211204071323.2480163-13-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211204071323.2480163-1-alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 07:13:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159160

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Run-installation-commands-as-shell-jobs.patch          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch
index 54e3e5ee85..a1d39cf558 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] Run installation commands as shell jobs
 
 This greatly speeds up installation time on multi-core systems.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/adwaita-icon-theme/-/merge_requests/39]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
-- 
2.20.1


