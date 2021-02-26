Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.8922.1614344472445803257
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 05:01:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HFlXTGwI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id b18so2017179wrn.6
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 05:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=INixtwToeXLjSiJgT+Z1StJ0eRydctFOYC3CfKz82bY=;
        b=HFlXTGwIcEAvr3VxvXXi/vb0pvm4kiYHPCQxTWkP4pPfMBdlrxNitmdUWcPHTPA/iC
         sBltn7y6wTv4cFDGHKnkSXzhlwnLY5VfqIQsQpcMlL2fXSHdl5oCdAoV+cO5dfq5j+7n
         y2fwJ2fqjR7u+WuAYjvjfdRlEGP5+OZrEF6yM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=INixtwToeXLjSiJgT+Z1StJ0eRydctFOYC3CfKz82bY=;
        b=gr9gZKsPpoborjSjkO/JKB8ekbaGEvIQXkLLRGCsQN4+ChAG0XrZ7nuNYdzbCR2OWh
         QuN47LyB71SSMGj3WrYTFWsOAphrQ2FeyFABaG8nbeIL6UDh0IKTztCuodW5ueBAWnE0
         BXReVhNVeGIVMW2re1s/+/JTUnM0a1o6IGBVmggdCUUjMTZauR8urjsmiezuiboBnmgP
         N0pTyOQyVd+NQkc/xjRSf2PbX3r8M2Gcsc+8XRYF6WLYn6aFbJpSm2UsqxR2MRtJlMi9
         Nd9VVlpQAUM21dsdHRVeaNI/LraKVSBBUjniCIfdFuZmCcNITTkFl6f2KJXbpS+2iHl/
         izoQ==
X-Gm-Message-State: AOAM5331A0HEGUJHLfT4hz1lG3Cioq2JzSaXQIls++wYCAeMJxBATsau
	PTMLGKJHeglfsBYVCi0xmppk9Qgwo3tl+A==
X-Google-Smtp-Source: ABdhPJzzGRzSLl1MxPrPByLan/8PX76BrVAiUunsyC0TyQBvEFmG48xJe58blk+wv5diM0aJsedRoA==
X-Received: by 2002:a5d:46c4:: with SMTP id g4mr3112255wrs.241.1614344469951;
        Fri, 26 Feb 2021 05:01:09 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f])
        by smtp.gmail.com with ESMTPSA id q25sm11637829wmq.15.2021.02.26.05.01.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 05:01:07 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/13] rsync: Update patch status
Date: Fri, 26 Feb 2021 13:00:55 +0000
Message-Id: <20210226130106.3925837-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210226130106.3925837-1-richard.purdie@linuxfoundation.org>
References: <20210226130106.3925837-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mark the path as submitted and effectively a backport as a different fix
was added upstream addressing the issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rsync/files/determism.patch | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rsync/files/determism.patch b/meta/recipes-devtools/rsync/files/determism.patch
index 53a4ca75058..e3494fdded0 100644
--- a/meta/recipes-devtools/rsync/files/determism.patch
+++ b/meta/recipes-devtools/rsync/files/determism.patch
@@ -8,7 +8,13 @@ SHELL (/bin/sh) is dash or bash.
 Specify a C locale setting to be deterministic.
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Pending
+Submitted: https://github.com/WayneD/rsync/pull/155
+
+Upstream-Status: Backport [ish, see below]
+
+After discussion upstream renamed util.c to util1.c which avoids the problem
+in a different way. This patch can be dropped when we upgrade to include:
+https://github.com/WayneD/rsync/commit/d3085f7add38a5cf833a0b31cb0637ff46c80f8d
 
 Index: rsync-3.2.3/Makefile.in
 ===================================================================
-- 
2.27.0

