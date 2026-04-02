Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A17CC6B3F
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 14:55:15 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17666.1775141710236902223
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 07:55:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XcAcRGVC;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: adam.blank.g@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486507134e4so12980855e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 07:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775141709; x=1775746509; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MM6Bulk2hOOG4KeN8xh2qpvu4RhNxfvFFJPeRwH7tSs=;
        b=XcAcRGVCW2ou+HB+eQC2e3j5cRaAoT4crsjPEctuPNopuigYa1xWnJ3HpyBd0plTB/
         9c43CMUpep/bauw1rz7aJTnmFs/DmnMH1ITjuiUSyExG8EOGOGSZdg3cOoVtRWTcJMl8
         STEOTwbBamB4+i4dm9b+58/EsW6MtYKY68wIjnqIVlfd3Xr/KnDgkELfyy8B20Zj3LlL
         dI5hLaKSaFh5H+JNBup+nKpBfIvU+isfNGTENhYfe11aJ1jHZwXrJelz55YSB1GmI+zX
         04TeQftWhM0FQ9kH3phnT1s6hlpliZIFZEywU2cAtkTfr7Bgq61NlojrzQsu9AQC0N76
         iIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141709; x=1775746509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MM6Bulk2hOOG4KeN8xh2qpvu4RhNxfvFFJPeRwH7tSs=;
        b=nyJQUQ6PyDuP8H0cireN/IcchLSQcDY2zJ/zo6iCNaNhG9M0v4srmYs3lTA1gj+eqh
         Q7kjkXOghmAP3QG8hPK3FJx8+sPorjV5ocjNV+JtC17baTt+JOcdMV6FqAexEWbYiaZU
         e7iJ/xpuKfG3PDvWnrXeluqLkJzJuLtSkoiX7lZrjInf9w9wQaGXe8E+Cbwt1LdPt/6C
         dAGwVEm6QCB8cHjzi5sROjQHsCMOS1CJnDMizOJNxUXpA6gEZQ0wi1eC8ga8zih+2hpu
         ziO36LXJG8uCVPB53pwzekjQCWBZL4xUMP473SV5+RkT5Ci/Xf2QkO6mqldtfIYmEXVF
         qB3A==
X-Gm-Message-State: AOJu0Yx4W7Q8tEFn/V4Oz1WDjpmAAxthQcW+eZs2voU1X0M6eQbSn7wX
	jB+WD6ykjy4eY5Sfin805sJe2LJR6nVsHvoqGEya3bQCVbhes5KBb5Gip8VQ+g==
X-Gm-Gg: ATEYQzyNu7ROlYfMvAsY7ChVf6Db9+v896tuPZNIXoZh2wUQBvPFTk+p2Doo/ljBVJT
	4YU1IlhlBjgLPHTkc3unQQQVMTonjCObKvZnKDi5sOggF2gkNfmE09xvHm01Azm5xY71FzDuqlL
	4kMtwh6QL+d5LIGQbhoWGtTn6ef6ulzweDdkz5Hm/3vUt/B0RC1qWsvmJXCi63AVl12qYV2x16F
	LaCSn3Y2fFEWprGjStBjaiS8CJvJDsRjHcrVXir/GtCUSzoGoU4AmR+fNYTcp+wbak23AE9xEIN
	1zBCyXxgxi667uSn1whojTvdvk9TRuKXqhn+tQ6pSjm3pSwxL7hQgq3mrrRGMW++OGbgrHkAJi0
	OQoYKwPS+82E0aEAL6myI5/abSM1VMn7FS5leV4TULjsmHiktMRDhuHcNXirzkhhqsIV5W5bOfk
	+mZxoEIXh9Y9pSyanKLpIDI+U57P0J+w==
X-Received: by 2002:a05:600c:4744:b0:485:363b:fafe with SMTP id 5b1f17b1804b1-48883569e74mr133519415e9.1.1775141708430;
        Thu, 02 Apr 2026 07:55:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:5efb:8aef:32b2:ddfa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a7162cesm98841235e9.13.2026.04.02.07.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:55:08 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Thu, 02 Apr 2026 16:55:01 +0200
Subject: [PATCH 4/4] package: update the comment block explaining
 'emit_pkgdata'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-dead_code_and_unification-v1-4-5a3906b6340d@gmail.com>
References: <20260402-dead_code_and_unification-v1-0-5a3906b6340d@gmail.com>
In-Reply-To: <20260402-dead_code_and_unification-v1-0-5a3906b6340d@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775141702; l=821;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=WxqBj1UVtYwtVHqUwxoamI/djcrqO0+VkgpXo6urBZ8=;
 b=rHO+LGGg6jIknmU/l8LQaxy9YeeGdoWwmhYOx6hFAwNM4pR6w3x3A+LLE8zRA7onVrSdXTfXa
 w0Sv8uOEL8RBxg4zO7fsiA1hE4KHFBtyHxHFToAfa8KqHGmulH+5wB0
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 14:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234536

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 meta/classes-global/package.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index bd32a6ede5..fc3c539f68 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -41,7 +41,7 @@
 #
 # k) package_depchains - Adds automatic dependencies to -dbg and -dev packages
 #
-# l) emit_pkgdata - saves the packaging data into PKGDATA_DIR for use in later
+# l) emit_pkgdata - saves the packaging data into PKGDESTWORK for use in later
 #    packaging steps
 
 inherit packagedata
@@ -610,4 +610,3 @@ python do_packagedata_setscene () {
     sstate_setscene(d)
 }
 addtask do_packagedata_setscene
-

-- 
2.43.0


