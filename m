Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web08.35417.1607956672329944885
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:37:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=1CLBuoSE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id x126so3348512pfc.7
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=6vahTbqeWDkUKj/LhbyNJ8SRrl94DxGjkNIsCNe92Vg=;
        b=1CLBuoSEEtdeCL8DTBnILY6sjNhHl79KkZBCCwmN6k9Qq/qKBbULmdZLd0X4m1V+FZ
         FG8GXSqXEYDc+voDNys7bYtSZ4PdgjVGf7aBMDlarsd6DXjL9bWu4F/DiH+WokT1K/4/
         BzrCwZrapBjSKqeaO1RGkzat0BcxLUmwMW142VkVAZUhojxw9oIHT/2k7jUqotF68R4U
         yatZrIu2TAwPR9j28HJmFC1jtgeCh6aLI+Z8F/KzFszcCGMNNuFIArHd3rIfG/5Jgdi0
         9sFcsVC/ScQyDiMCAiGmxATeHSH1CbGWnUgh5lg8SSSHT8IvF9u8NBU7f4k9QLhijjnT
         gDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=6vahTbqeWDkUKj/LhbyNJ8SRrl94DxGjkNIsCNe92Vg=;
        b=aJnSIExktYITIXOgacSqv1sadgxPSK36+nakVmN7OnDHmZ2X0pma7Mj9oN+Fb1dTiq
         ulCY9mh/abKhZNWvRWh+Xl6Ba7yu9PDUxjpEc3o0eHPKjAuXdzys2t7R3olpaT5mLbTa
         jMoy9xh50rHXNYmNh+5q6KJWWC0rp2DcuMSTFRbcB8u2rF5yf2wtjyVps9jLbrCLDvlX
         xTtuXp5Ux9yalPvU9FtNhKgvHCqbnxBY27xeYdzZ/iT9yaFgiU/uNZEruKPI968pm9qB
         z6fnQg9tAI0gGzKLHEu578fvpXMEhzvpvjiRZ30sUt2Ofr7/U5nqJJH6AchDAbcqHKvu
         Rs4w==
X-Gm-Message-State: AOAM530jrHoWUv0Ahrzc2hVKXP94vFLl81yQ9HNUfDfW/T+EPsDftJVL
	LFf8CivICIU4pSXtrkXJeIehoO64x+lEx65h
X-Google-Smtp-Source: ABdhPJzJVkPFJSSdmxmdoe1iriW+8fQ/HJBuFzCrs2ixz/TPfFsDau8yOE8bzYJdNC77CmAjcJ1bpA==
X-Received: by 2002:a63:9dcf:: with SMTP id i198mr5480078pgd.242.1607956671470;
        Mon, 14 Dec 2020 06:37:51 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y2sm18859439pfe.10.2020.12.14.06.37.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:37:50 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/25] meta/lib/oe/reproducible.py: gitsm:// works just as fine as git:// for timestamps
Date: Mon, 14 Dec 2020 04:36:44 -1000
Message-Id: <156482c0c5addba78eacb79b7464a5b463b3757f.1607956164.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607956164.git.steve@sakoman.com>
References: <cover.1607956164.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

This in particular addresses vulkan-samples reproducibility which made me scratch my
head for a while.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4a2936126f12eeacecced051fa339c32c1f16576)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/reproducible.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index 421bb12f54..0fb02ccdb0 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -47,7 +47,7 @@ def find_git_folder(d, sourcedir):
     return None
 
 def get_source_date_epoch_from_git(d, sourcedir):
-    if not "git://" in d.getVar('SRC_URI'):
+    if not "git://" in d.getVar('SRC_URI') and not "gitsm://" in d.getVar('SRC_URI'):
         return None
 
     gitpath = find_git_folder(d, sourcedir)
-- 
2.17.1

