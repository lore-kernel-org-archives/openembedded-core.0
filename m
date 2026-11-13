Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13730.1794582836382972846
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 07:13:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Abt/uvOG;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: michalwsieron@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-492690dd5daso1452280f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 07:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794582834; x=1795187634; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=maGIJ3tWTZPtSINpnMBkip/X2JlxZcXoHeuUab5ZMdk=;
        b=Abt/uvOGRtY2wcXUzcfzHR3WO2D5pdDSBfYnLBBQyDijKXunqzDYcDmiTd0ehumgaW
         lsBHNgnPhdZeXRZCWv8bxwWrWlDURtT2exiv4kekBse7LLobd7Cm5H7KC9jcB4V89HKn
         pwLnKAR/dg82cBv3QvwxReB0JJvWBOrr0z8YkwwfK4ufakaqFB8x7A3IaBW42JdGkltE
         PTCTmSq0r2n18xl5571fRd5GKWUhifpaPaLJWXPBhl1ssD+Eo9VwtBqjIUQTaSoigvIx
         KNWSS57V7Y+SFcr41Y32LiHCYunLu9YlY6AlpTQ8vRhw/gaUEB4vFaGSAm/PCZK/7+Mv
         Kk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582834; x=1795187634;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=maGIJ3tWTZPtSINpnMBkip/X2JlxZcXoHeuUab5ZMdk=;
        b=mGH6ZiMwMiW/h5P7o1+sIf50YIotM4RyO8BsZAJSSvAR89t5XZqPcbs8zKRhuJCnK+
         QCrmQOIG3c8uVGgDcGLWsjKxj6glT8b7o0Q5H0gCqA39wxVB5bKOCPy4wFqYGwM8mMkf
         kg4CXPP2DOglu2sJoPXG3rnxeHFRtNRmRisLVDg1afMlKsmhlgDcffbkyrcxdEXl6/dY
         bBSt96PtxG2ahfLat4AbmTIQI0bO72drBum6yEsXFT8EBW/BXty+6l4tuK8h8iFYvwW3
         NIvN7UmO5Y89fTVOqapfHnFrNVxbmGe3Mp52A2kMDubI/f2hxLhlLCZa0YzEsD30vKOJ
         cVvA==
X-Gm-Message-State: APuU4Z8c+i+NijErFsbgneAoxzgSjO1KkT6pbffyAh1EoWYNm2P1+VT1
	WLnhqht/ju5S2t46/iPKNuCxURry03l53eT6TKGqXQiFX0a8QlJzItYghogjj/hb
X-Gm-Gg: AYBFou1UIvJybaNOrCiRy6Iz27WSHZeaPi/UhhzJd9/mULkxxv5lW3Edm204ZVWOEuU
	kngG/fb+aJ5D7/BZn+X+tzW2mlp0n0Uc3NS8dIUTh2IIoI0XS0A7FG6X1g/9aV1ZKektXdT5YxB
	QgHk1JSzVX/1VCm9uTh7NjeGQG8sZBHCnkQO65uSU/jiPjJprSgss+PKIX6NqPSEBOlgNGD02W0
	sZebjezuL0C2Z4nN1qAeiJx2miX6/d0oGry8/K7QhOlER0FS+cxJijxJk63cgg4WZrSTSllk+1Z
	F391YcSZZBekfHh9n30bD/hl4p0PgC6x270SnZnCDH0mramidnq+MJu4ecYDpYrwaabPrQdnJzi
	e9D4ydzZYQy6TxQPKhaxow3l3jel3xzP6Q2JjZ3ytAA65SZaSE5AthD5Aw4PUe0gUncVAGY0M66
	j6GQAP3l66M7M6ch/i7Nvp50EQM2BmCcmqfdPiKfC29BOOm9ht/hEM1+QXbuR9pX5h+Y+VwuwNJ
	91j3UkukZNXwsWCttHfdAvejxGJIwefrHjRL0Yr+cy3gYafPFuWp3C3/IALqX6014Dih01ZKZ2T
	24I9qcnWChHAKOfs2g/jb3FtZkT5YjYC/IgBZtj2HvQniBGFKrD8ug==
X-Received: by 2002:a05:6000:1863:b0:48d:ee35:b3fe with SMTP id ffacd0b85a97d-49c6d45308fmr6639137f8f.8.1794582834459;
        Fri, 13 Nov 2026 07:13:54 -0800 (PST)
Return-Path: <michalwsieron@gmail.com>
Received: from [127.0.1.1] ([193.28.84.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8c248sm5633781f8f.58.2026.11.13.07.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:13:54 -0800 (PST)
From: Michal Sieron <michalwsieron@gmail.com>
X-Google-Original-From: Michal Sieron <michal.sieron@nokia.com>
Subject: [PATCH 0/2] Fix rust for mips platforms
Date: Fri, 13 Nov 2026 16:13:21 +0100
Message-Id: <20261113-msieron-rust-mips-llvm-v1-0-cd3b005bd089@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABEp92oC/yXMQQ6CMBBG4auQWTtJW4gxXsW4kPKDY2ghM0BMC
 He36vJbvLeTQQVG12onxSYmUy7wp4ri85EHsHTFFFw4e+9rTibQKbOutnCS2Xgct8QNmjoidK6
 9OCrxrOjl/Rvf7n/b2r4Ql++NjuMD0a2GZ3oAAAA=
X-Change-ID: 20261113-msieron-rust-mips-llvm-4e43ce2d0b80
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michal.sieron@nokia.com>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 15:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250184

Two patches generated with Cursor AI that fix builds of rust toolchain
that target mips platforms.

Signed-off-by: Michal Sieron <michal.sieron@nokia.com>
---
Michal Sieron (2):
      rust-target-config.bbclass: Add i128:128 to mips64 data layouts
      rust-target-config.bbclass: Set llvm-abiname for mips64 targets

 meta/classes-recipe/rust-target-config.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
---
base-commit: 34991d0ce3cc5f38dd29e824af7579512d2b917e
change-id: 20261113-msieron-rust-mips-llvm-4e43ce2d0b80

Best regards,
--  
Michal Sieron <michal.sieron@nokia.com>

