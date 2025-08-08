Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F12C87FD2
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 08:49:57 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.17936.1754642989923380453
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 01:49:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cc2xPS5r;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-23636167afeso15961385ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 01:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754642989; x=1755247789; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXw8G6/lBiPMqvhA39b+1TweWZYLKsxhExx0liOHVz4=;
        b=Cc2xPS5rmBExOgWX9eAIWEejrrviQC7uMcu9+U6PiIEN7sALD3OL54TTEgh+l3MLjS
         HKOoRUdncGJMLJYwKzqIr1XqNMU8lWp4YkAtJLgmdeRd4IzCVk1SLlfE5OmcnfIVhNeW
         emWxnZCYRr8dYpGV8o+AaCO1xNvLEISelI6s/Dn6u84gcfbPNSMKRhtd5jiy0OXU2R4r
         WvprOJI62zziBipOAFlOqUfKx5sNjf0SS3RvcqtCO5k/SiTQ07+Ch4HFCCd7M2Tsc5no
         dB/1eaBvfE55z80bhSpiaMNfcwt8Dbo4jdD3MhJN7hhqxiknxwptxiJNftRSrlme3IMN
         H3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754642989; x=1755247789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXw8G6/lBiPMqvhA39b+1TweWZYLKsxhExx0liOHVz4=;
        b=GOSbkzsWZvChcLj7TPUW/S4A0zA6HFR9KxwwRFKffH89KGvdLK835zWEnic2gXwBJb
         OcErMYAvamXN5vzx9RErDBo/G675Qkxzu6aTeKq2W5uHl2ikYwOayCo5o2Q2NuHu5co8
         +vstbNTJOPc5VZnOHJ6jzG6Ds2yGoHWab1NNNAr1AQh+uTZ8WGBAw9rHtySp+BSc/aEt
         r3SAexRHC14WS7kIDbhQl5wmeK1yESdJejZet1zvvg4uD5UKCn/3H9ElRmZGkHfs3RXT
         dwn24VJJonVHN1994OBsf87cWzXsDkTLvgYOnlUEkKkqbmrROSKIiBa4JMRIsR9BF69F
         29yg==
X-Gm-Message-State: AOJu0YzxfVDqXX1aAXlq8oyFFI7ahEm6WXAgIVigkJ0UPoLpSIUp2O2B
	nRB88MOsor3aInimbsr5YkMBqbS3q/hqSRQ94MUBLdYTr10V+NqyD743XkBIBg==
X-Gm-Gg: ASbGncurJD6urfMQD5yo68RShFm6fxvgFbWMkW3qaejNtNrZMOg5gIm/zXXayGOX3/6
	Jr3dRyRzUvRdrg8TZEl9+TsmPmup1SjkGr4Iw9zdHpF7EJSiktMD/rquK3dLi2YD4HyxTIxqN02
	h6CDTANf7r9Zo9od/as61cpYwMoc9nR7idvFJGVVmOjWVVgyf9OhrPy0ZF/IOYoNyKFnxxsBuXB
	WDkwP57x3MqO52gozugi4W2WSDnz046nRAYJ/kLrBkR6Y3DWaBEfePcrFs3r5FOSHg6JaeXD+CY
	pfc1Wsit+2dzrmJ+HpokQSAXUJ3MEmuA405D1dXOQyJ25PFhAMdeEilA5Fq/HXkGULx4rSKPG6s
	Spgj+znyBs88E+hBux4kY30DxRcldgNtF
X-Google-Smtp-Source: AGHT+IFI+MPUCvd35hp+nuBr+K43YPwTPMOTeurusIYvVngvc2eNA9ax9+BNfZUHdyizX5UOXqkFpA==
X-Received: by 2002:a17:902:ea11:b0:240:3239:21c7 with SMTP id d9443c01a7336-242c21dcd0bmr32476785ad.37.1754642988824;
        Fri, 08 Aug 2025 01:49:48 -0700 (PDT)
Received: from L-18010L.kpit.com ([49.36.49.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm188782455ad.63.2025.08.08.01.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:49:48 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Robert Yang <liezhi.yang@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][scarthgap][PATCH 04/23] bitbake: gitsm: Add clean function
Date: Fri,  8 Aug 2025 14:19:12 +0530
Message-Id: <20250808084931.2156763-4-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250808084931.2156763-1-akash.hadke27@gmail.com>
References: <20250808084931.2156763-1-akash.hadke27@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 08:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221601

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
$ bitbake utfcpp -cfetch && bitbake utfcpp -ccleanall

The downloads/git2/github.com.nemtrif.ftest won't be cleaned without this fix.

(Bitbake rev: 79f25fc5c1b8d0e08540f4aa07875309f5325f47)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5bce38fbaea0a7d1228740e2cb313957c914cfdf)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 bitbake/lib/bb/fetch2/gitsm.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/bitbake/lib/bb/fetch2/gitsm.py b/bitbake/lib/bb/fetch2/gitsm.py
index fab4b1164c..ba62517f08 100644
--- a/bitbake/lib/bb/fetch2/gitsm.py
+++ b/bitbake/lib/bb/fetch2/gitsm.py
@@ -249,6 +249,19 @@ class GitSM(Git):
             # should also be skipped as these files were already smudged in the fetch stage if lfs
             # was enabled.
             runfetchcmd("GIT_LFS_SKIP_SMUDGE=1 %s submodule update --recursive --no-fetch" % (ud.basecmd), d, quiet=True, workdir=ud.destdir)
+    def clean(self, ud, d):
+        def clean_submodule(ud, url, module, modpath, workdir, d):
+            url += ";bareclone=1;nobranch=1"
+            try:
+                newfetch = Fetch([url], d, cache=False)
+                newfetch.clean()
+            except Exception as e:
+                logger.warning('gitsm: submodule clean failed: %s %s' % (type(e).__name__, str(e)))
+
+        self.call_process_submodules(ud, d, True, clean_submodule)
+
+        # Clean top git dir
+        Git.clean(self, ud, d)
 
     def implicit_urldata(self, ud, d):
         import shutil, subprocess, tempfile
-- 
2.25.1


