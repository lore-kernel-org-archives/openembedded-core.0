Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.58339.1622557150465396818
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 07:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=b/Y3nvWp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id u18so1304139pfk.11
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 07:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cmKipGblNTi7MyP5H+z3EH9NgeTrEUYKS/jdR55WnBM=;
        b=b/Y3nvWpV1P6OuQIT266Rh19Dlllb8SIw69Sho2i+BJxv0Yr8V33XbIJ/mvJiAXwMn
         DRyJG7ygmyyHDxV36vWoIobshcvoImUXIbqL87LvVOTtrD2wG8ecdejatCodxglm+SlH
         b4duxvqs5oa/wdkjXl3bB4D0+w9RM9uVHgRjv+/9DB6KFwg+fJ5blIUZGW2uFK6Mt7vY
         YsPlrpcCRWCibxfD6pA1REswqMq6M6QYXWufhya1kuLTJcK9aXKPCna57YxUUxXiIma+
         XgOfEPjjrWa5tjsBoV3aQCM35H9UkskKQ3O9/qoSqgEPARikAMx6n/6mSbVHNQyxv5id
         1vMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cmKipGblNTi7MyP5H+z3EH9NgeTrEUYKS/jdR55WnBM=;
        b=TatMA7ZYmtY/Xqnw6cDDfICXORyvn94R1h+YUhritE0frDW5noOtoI9rypLhhF0i6D
         fynteucjmrvPp08wi3HCpv3OpBB24Dz8M8A1sIRtT48/t0o1D4uzoPP4kTk3ltyiCym/
         A7U6x7E2fFX/wu7MMcKNiczoEjbqpaQlnweyaZg6SUar3BGD5vONBar+/4tfTvHQ60Dm
         MKuX91UZLXYW45Zily6TczDXOrTa2VmVmPTGBiYiNqWJIIQqca6/yu1r7dTpRW1kEi7b
         e7ceiS56yRu4FlKhIaCrqn7OgnmfVWzcW+ZIP4uOzB3THaO7kjyahls5Dxa0a4a//+9I
         1SWg==
X-Gm-Message-State: AOAM530W5PdqlgbSiosBrBPSnGGqo1CEmj+2+vJJxCch1kHJv63ITvUi
	HUSLB1IZzXBNUg4ZqaYJV+ieahMqUxNBPHnAcsw=
X-Google-Smtp-Source: ABdhPJxFbqZ1vWXXF0JOPG9MJKZ9P0zfwSGL7AnsZDKFXkSzJAWaXiyZhuWLmtXA0x6YI7FNixABQA==
X-Received: by 2002:a63:5c5d:: with SMTP id n29mr27975808pgm.131.1622557149604;
        Tue, 01 Jun 2021 07:19:09 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id bb18sm2307875pjb.44.2021.06.01.07.19.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 07:19:09 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/26] lib/oe/gpg_sign.py: Fix gpg verification
Date: Tue,  1 Jun 2021 04:18:06 -1000
Message-Id: <feec7cdda906aed37212dc05ea9ff1ef871c28da.1622556919.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622556919.git.steve@sakoman.com>
References: <cover.1622556919.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel McGregor <daniel.mcgregor@vecima.com>

A stray space made it into the command for verifying gpg signatures.
This caused verification to fail, at least on my host. Removing the
space makes it work as expected.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit af1d948822cbe6ac7ede9cb4e881db8dc780e308)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/gpg_sign.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 7634d7ef1d..492f096eaa 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -111,7 +111,7 @@ class LocalSigner(object):
 
     def verify(self, sig_file):
         """Verify signature"""
-        cmd = self.gpg_cmd + [" --verify", "--no-permission-warning"]
+        cmd = self.gpg_cmd + ["--verify", "--no-permission-warning"]
         if self.gpg_path:
             cmd += ["--homedir", self.gpg_path]
 
-- 
2.25.1

