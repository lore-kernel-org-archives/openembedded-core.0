Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.19742.1621260912718205245
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=SEyV/Jj5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id b13-20020a17090a8c8db029015cd97baea9so21451pjo.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=h9Ijwav/Du2H8Sv9qi1e+ioDgEJ7Sci9+dnNs17UTKc=;
        b=SEyV/Jj5zXAvIGHFTHiKSo8x/ZRmIKC/J8cONLm+U3QrmN62IShu8s6Vi3/8eQkYLf
         3BRrUnn/LGfXjEND4w/wbBwS63B2NFsGkvu/q1D5DV8KY5gtefj8VKInNxQmeZYCGHpN
         h7lNm9QYXIWkb8GK+1JGSYpGUxlf9RCEt16AsHLhM+ZeFDoJvwHu23IZJMJG5PcR2Kd1
         GLXyhyJ6IHF/pa6UhaVP00PBEC2hX5Wf6D51imS2Y6DA3VN3WxNpnflmbLcNEgyGxS99
         PwImn+O8VxyLdq2PGc40zfBNofxXTKxbxO2be+8VczkVTs5AxzeESUY8IjVQ6SQDxJxo
         uJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h9Ijwav/Du2H8Sv9qi1e+ioDgEJ7Sci9+dnNs17UTKc=;
        b=p767Axovilb5Pq/uupPepkkbELPOndeC/OIiA2QUb1z/9TgbxwbGCXOKtAZLVQpamH
         Ziu8bwEgwTO0lkx3WfVq+IMKJNB0mpcwSShzCIvdStkpXZ8E4kohV7kY8W6rXQ1cJW9Y
         T5rdnwAlmpkDZy7dzdx+VPGBJoGIKIDhABs7BI9gYXB2diyOaVqLnSdXLcQnw9txRcF6
         PoS96Lj/hneTG3KW/Ht/gATju0GOb1r2mholkWdEqQGcaUj2RFk6Na5gejpw1hsXtnB+
         qWqYPkfe5ynGmmNchmXfJjLFyOyDQbI7kfX9cbFUOK9lg0sL4agwTUPHwk/m2ZtKy3DK
         TRzQ==
X-Gm-Message-State: AOAM530gIGuDc3EeTBAIHSD16XEht31SINGptixel6j+YCUETM2o+0nU
	A8OrYzXdUBU5AyKrSkzPenG95oW9WlL7/dM5meI=
X-Google-Smtp-Source: ABdhPJwzwMy+wGXVZJ9MFXsMp48WF3SLrCWqCKpetNaCZxZBhxM7MwJs9IFKg85n0RuTAGg1mDhKKw==
X-Received: by 2002:a17:902:d204:b029:f0:b65d:a14d with SMTP id t4-20020a170902d204b02900f0b65da14dmr202625ply.25.1621260911850;
        Mon, 17 May 2021 07:15:11 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.15.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:15:11 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 33/35] local.conf.sample: fix typo
Date: Mon, 17 May 2021 04:13:39 -1000
Message-Id: <6f069d0c272988ea52f99c648f198443e3b69730.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ulrich Ölmann <u.oelmann@pengutronix.de>

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 414f8a75ce4e2a2f833593ba34151a897b1e9833)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/local.conf.sample | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index ce18b5f057..e1a6be3935 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -167,7 +167,7 @@ PATCHRESOLVE = "noop"
 #
 # Monitor the disk space during the build. If there is less that 1GB of space or less
 # than 100K inodes in any key build location (TMPDIR, DL_DIR, SSTATE_DIR), gracefully
-# shutdown the build. If there is less that 100MB or 1K inodes, perform a hard abort
+# shutdown the build. If there is less than 100MB or 1K inodes, perform a hard abort
 # of the build. The reason for this is that running completely out of space can corrupt
 # files and damages the build in ways which may not be easily recoverable.
 # It's necesary to monitor /tmp, if there is no space left the build will fail
-- 
2.25.1

