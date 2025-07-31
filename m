Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D99C83F17
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 10:23:19 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.58641.1753957394379702419
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 03:23:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=O78a9yG7;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4561a4a8bf2so7594495e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 03:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1753957392; x=1754562192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/y2i9yzi/p3tGLVer0kwwFtrV/7rZI5g3L7aJzSNxjU=;
        b=O78a9yG7+6UCX1nkZfQ4KXcmdeCYGBwEPx1HyG8slAB8bg7BUDSKvycZq1SM8Rkg2r
         ZMvPZhtmMoNZHh+s1Jd+GxIm0+u63xsAJ/HC0GwQLDzFjH4U6Pzm1RDYMewsBzpXxsk9
         WRLJiw/VLQtWkRu8h0+xM9vtPcmEf0GhXlALU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753957392; x=1754562192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/y2i9yzi/p3tGLVer0kwwFtrV/7rZI5g3L7aJzSNxjU=;
        b=oSu5LY5V2STHTDefydmts/krcGv8nEOtdHqJNxMJcsna7koCsUdCDkHlLU58I9pv54
         jhenI0Du0LmIcUHzCwhLMT2xZ70BVpI2Zm429yh4vujAC9Cx3085mJvAFehT3BFJbKJu
         QyrPMTjSv/GpAGTOP77u9JPmR7fVNI/3vLeVhG6WYVaSIVg+Mh7foXiRmgjhUI20h8v4
         6SDBLD5MnaI7X9i5HTCamYR7l7WEVNYggbsMwejG5iQB8z3A0DXb9LZP1bbFJ93CWJ7K
         BFCRhPkFqt+Oi5//uYht+g3FMNHpJhHHRRTZzvsVUHXUKEzlxn0eF3u9cSH9eVVnrurz
         sC2w==
X-Gm-Message-State: AOJu0YwwjWPA/EcVz09rna9rIamt0b2wy26JxndtboOFFHSggde/m4NJ
	6Aj2iKmTomOp3DbjQyHHEHe5B0+WQ3ipEuonUr+qo6Q3FIhiAgqVDzptMri4J8HpXThMN19I/KE
	JVHNkcdK9bQ==
X-Gm-Gg: ASbGnctkJeFzFx26BtnMj5o2ayt9qyMTMdJKGAYqIS2vQlNMRXYk2X5YaV998/doOQp
	Hk0uIeokyvZrUmvKlo/ulKvIISZ3kii087QYnwHCBKWHRGAaFYLNjpnDOzsXrG93SeLXK041aOb
	3oMJzKBp+i4gynvWlWx1srQYOc5JoYniGuHWSWoXqAj8QZ5QYZN32VDtN3TeW/PVrUoLwStodKP
	iSBcn3Usy20N4tL4zzB7UoNox9BW/5i0HE+evzC7liNpCg6LxofEeGE5Fxb2XZfb5G57qYVv3h5
	AEBhekD0ykuKoz/g66f+Fm/9I3A6xsfJR3aMnzScrD/sepEz1m/mshyIY6Ud4TBh4k2cpZjVMiq
	VmfizMyDZUlVdLlqtpbAOqcIqFIfDijVAsycuDjMyBuA3Wt6RyCf3QY8LwBeSGNMmWgptDKcDcs
	PKaNEz4KhyMRU27ZDTdNxUnZrg4WnSILYV9EI=
X-Google-Smtp-Source: AGHT+IGCRIim8YdbteqlW2HlW9sfTDsQCzIf6LNoTvWBA4iNW8aFqZ+komtTkNQc1sQf3wLXDMLA+A==
X-Received: by 2002:a05:600c:1da7:b0:456:1a69:94fb with SMTP id 5b1f17b1804b1-45892b9da8cmr67198125e9.13.1753957392499;
        Thu, 31 Jul 2025 03:23:12 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589536abb1sm65169445e9.4.2025.07.31.03.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 03:23:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v4 3/4] runqemu: accept vmtypes and wictypes for rootfs paths extensions
Date: Thu, 31 Jul 2025 12:23:02 +0200
Message-Id: <20250731102303.3513121-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250731102303.3513121-1-yoann.congal@smile.fr>
References: <20250731102303.3513121-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 10:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221187

From: Yoann Congal <yoann.congal@smile.fr>

When using a .wic.zst image, its fstype is detected by default as
".zst" which prevent booting correctly.

Fix this by adding wictypes (and vmtypes while at it) to the list of
known fstypes. After this fix, the initial fstype is correctly ".wic.zst".

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index c668906bdd..da53265219 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -380,7 +380,7 @@ class BaseConfig(object):
             # Check filename against self.fstypes can handle <file>.cpio.gz,
             # otherwise, its type would be "gz", which is incorrect.
             fst = ""
-            for t in self.fstypes:
+            for t in self.fstypes + self.vmtypes + self.wictypes:
                 if p.endswith(t):
                     fst = t
                     break

