Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12098.1795239546031997780
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 21:39:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Adb+O9Ei;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3869f03af6aso129686eec.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 21:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795239545; x=1795844345; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mHHEWjrDVcpUPZt87F0USA9+hLSbPVIXb4N2nqEzlFU=;
        b=Adb+O9Eivn5IRUH0TSgEtEfqR66AEif69wHWuwpR4QHlm0s78rF+IDhgcZBcjTiq7M
         xZYn/6emvePBQp1rEjkXlU64sS6/MBXg9LP0yHjYO7URx1KlY0Oo9our9dYrFV9zLsHW
         pBnUYVtsnExccCpOTSgDsiD0x/blqxo9XA/hRc+InKc89irZvJ9gCIgJHPVDg0qZmm0l
         0BvRKlvS2WuL4pGcHOLQXIIRCF5PRGVsMil+/FYPF1BSZA7srSQXilfbecOrQPyjxuFW
         plfGV/s45TNJXBp/F7AqH8WqbnPuTP4PieGNbFbOthBr4Qyr/gTWcXx3oHPWCp3MIMUP
         6OFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795239545; x=1795844345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mHHEWjrDVcpUPZt87F0USA9+hLSbPVIXb4N2nqEzlFU=;
        b=QK+Bx/kglbFmUWZPqko6kMRhw8DKaazvUfrQ84EjAClfBV9Whq/e1nxMnDMnPVwGnB
         yvY8cswoOZAIj38R8dBJkI4trOX9o1ADOA49qpSh1q17OuvwfPRjC+X+XP07RG/JnfYw
         aS3a7cLL/LP/ywIotge/end7oBhWiujE+BRuPZ8Ejybk56vfDe6nwwm64HsQKfWFYS+t
         VGwdLRKZQJLsrAuJDZlOs2v07+5K+tkjIp90B0xCuIOikPp0vefnhDDJJq+0FvgKahM9
         aGCTGTkRfUk3vqDZgcj0U1jrtp+KaG8FHmO3mvUOqrs/MjkpGxqdIA7EuOhCYU+VYi1m
         UJ9w==
X-Gm-Message-State: APuU4Z8sBkSrx2XsuV2bf5F+eIrGC8H3mLLm75/LG6ovXLMNR0y/R8lo
	nRG/vFihRmEqClXXWWOFsz9Xom/bAUDIhOWTe+EeB1gDQptYKmhbWs7Bir5q+Q==
X-Gm-Gg: AZFdTZeoWG9jUEY9eKpgzMbBCbplzGF3gQe6C5kVmcNi+gZgNyU33ZzhDrHmnkKBK8r
	3FZlqi44v2L4OIpMGeXhXhTASHBRf/J7axqYPv0IjLtFPfPli9nH3jlLmrIQbdK5raRUc/QOPvH
	8/GQi8o2Pk+OH+ex/vmZeMjatjAn/1f/E1bZf/J1Kgmh2V065Il9FnY99lkj5gKlO/dHahaFSEP
	0sfnZg6mskjDz27xSxeT2X2DQP9NmPNltTlu/UHu8h2nAD8aJNlSwdfm9GZYT1g/5Hw7lituaS9
	Y3lvx2Tn4O8tmOtpqYnGNaXp7Cn5HkCA34DKx+BwNonSAcJNWaBaYSo8JQ8nKnZB5RuiI2v9eGV
	iX4VOeJQS9+FlBBUYWxjwURhmKlAd1YPfsf8XzLmNcClkXvElGVO9+m9JhUxQY0OC9+VP+mi2Kr
	ocjPFDtiPv0bO2Na7hSjbTQDD5UD1PjICyHAmWGQpKDbUqH57093xZZ5gbHDh+GgK4VlKYSiYmm
	XFYRQ/t1XV16WYTL5hwv5Rfko9k2fdT0dQLTDAXERAVjryGl1m0pchs7+lcIyi8FROxiN6mnpyv
	aKq/jsOWaaNfCYGyDlazXgTFHLSwIUDlQ4VOnALZhbIGUSrH1xqtGGO+GZrkQSJTnRr5+PeukHx
	O8VTlaWbUQg==
X-Received: by 2002:a05:7301:7309:b0:382:2ae3:b1d0 with SMTP id 5a478bee46e88-384b3e788a3mr6845369eec.13.1795239545136;
        Fri, 20 Nov 2026 21:39:05 -0800 (PST)
Return-Path: <ragaprasanth@gmail.com>
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385667decc2sm13340308eec.9.2026.11.20.21.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 21:39:04 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Prasanth R <ragaprasanth@gmail.com>
Subject: [PATCH 3/3] oeqa/qemutinyrunner: fix NameError when RUNQEMU_TMPFS_DIR is set
Date: Sat, 21 Nov 2026 14:38:46 +0900
Message-Id: <20261121053846.3614417-3-ragaprasanth@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261121053846.3614417-1-ragaprasanth@gmail.com>
References: <20261121053846.3614417-1-ragaprasanth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 05:39:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250841
Content-Type: text/plain; charset="utf-8"

QemuTinyRunner.start() sets RUNQEMU_TMPFS_DIR in env, which only exists
in QemuRunner.start(). With RUNQEMU_TMPFS_DIR set, testimage on
poky-tiny fails with:

  NameError: name 'env' is not defined

Use os.environ, like the other variables set in this function.

AI-Generated: Uses Claude
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 meta/lib/oeqa/utils/qemutinyrunner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemutinyrunner.py b/meta/lib/oeqa/utils/qemutinyrunner.py
index 0510977e9d..917bafdeaf 100644
--- a/meta/lib/oeqa/utils/qemutinyrunner.py
+++ b/meta/lib/oeqa/utils/qemutinyrunner.py
@@ -86,7 +86,7 @@ class QemuTinyRunner(QemuRunner):
         else:
             os.environ["DEPLOY_DIR_IMAGE"] = self.deploy_dir_image
         if self.tmpfsdir:
-            env["RUNQEMU_TMPFS_DIR"] = self.tmpfsdir
+            os.environ["RUNQEMU_TMPFS_DIR"] = self.tmpfsdir
 
 
         # Set this flag so that Qemu doesn't do any grabs as SDL grabs interact
-- 
2.43.0

