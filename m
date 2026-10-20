Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4761.1792538574453116961
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 16:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20251104.gappssmtp.com header.s=20251104 header.b=sPpdWoiy;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so623505e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 16:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20251104.gappssmtp.com; s=20251104; t=1792538572; x=1793143372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=35gcTE7SF3CSIusWkdcrVmGatku2cCZ3zyW64XHW84k=;
        b=sPpdWoiynaEDgCfhr+46Mkhn07ntvPFNs8Rcp7AJtsKsTlUkRwSAlT4EQrGQv74SWM
         mR0/Wfv1+tYxBen/8Nu6M7G+bDxsCC7LDyeR3e6BZgrJbXiwEGQAvxitbpCiZFSUYN4G
         DJ6trUBkhSMfRDbHRZkW7dWefdYvWJs4qh86bXJsfPbHLISeLNjdHPcV6V2fIooo7/EQ
         UXcKqDhugO95R/LLtnKWK1fP4Jqpc61unXCNAfQiuinQRbXWgq/Bx6d73E4/QySpD4ca
         ChN+Y7rRHdErIOp1y3MXtrpVD39o8coRUJPVFPOGTtKgpQZ2o0qHFQcTJoKdCSvVJi33
         OlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538572; x=1793143372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=35gcTE7SF3CSIusWkdcrVmGatku2cCZ3zyW64XHW84k=;
        b=zYXtgyH10jEdjgr8eUffK0c7X8RHfR095PhFa/GwB5dKAilTPObhizegdWGOByci0P
         pUR1zpTzDB6uvF6UVy2sLXVkMdQEsPHvQ2/H5pEGFZM1dl4ERwdpPcjqZLCXJqi8NXiq
         7c9ep0T+SLwACXJ0MZhM3FvYFQvMGp7gHW0fHiPkgUGlFvPTpmPJ7RfzCUXRWUcO5uqU
         V4+NXaHFGBeKiRCUdEN8isGRDZYtfYKqQKchJsCo3HAdiKFMgMXWbvlibEFEhgVIIiCp
         5OCnpdyWMbaUIFmp6fNt5clbGbzaMYCBsQDvQ/qPd+cObJVnmEQx9J6Jg2CohkPuGk20
         bNMg==
X-Gm-Message-State: AFq9FYJmolwkjfRwiEVxrkUjf24hAaqcURQTFJYjYLfDpWfZ1CbG7S++
	8FKZd0jBGwPCXe5VkV5WwaxyRzKQjdLLlvNA19xybZQ2wZpWPeRXkbpQRhlGfOu1ZFEmgtoHLis
	fP7rUJt0=
X-Gm-Gg: AYBFou25pYN0ShY+ye9hFt/5zV5Xfc5J7/hf+P7ZvCooJ26V5a/6Z6Q4YBIst2y8oyw
	i+K6mBQ/OluCk547G4+X84dQs2wfnEAQshI8P4j3BewBR2QuPD6vRcaV0V1HbVDfWfoq0uIuP9f
	Bo60DOng/03ltwqREstsgmXkC0R8oXSN6lhXcMMPhyLcET9YG8xKXz0NCzOGIWWT2F98/3MjcdK
	+KI823x2RbdJyn924yZGDYENtaxTT2gahpz9UUFriEl+Z5pECJ20CtdygUx+RFgsDTsyA3Am2Cj
	ec2hZaHZc0AgUEy0Ykb/Ph90yn5xVTXa0kpgrNRNfr6BueKmACuYxe8Er7H4gzbYf2fV6rZu6mX
	Pfky3X2Xn2VrOcElmieKcnka2n7QrUFmml0kejw6M9BxGGrHlLGJWTuV/h1v5zQIzZAugmBWlIF
	ztmO+YLVWGs+uuk40zrFp83okqWQwW9rYSzbQ1eo2BcgEotriOHOvpPS8VC6UvKdQKiWdIs6oQT
	iCGzVx5g1E0ocU4JnbHaWrcCIjUlb2UZjDgxgYKGJi/I1g3UsIqk/vwGS6ntxpm7UIZUecqFbqb
	CdiyGkcYuC1U5BN+TQcCeOXJ8c2PB9uMOb9gXOxJqHUmmIX+hc7uVRs=
X-Received: by 2002:a05:600c:34c4:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4a1fdd37971mr3595885e9.19.1792538572356;
        Tue, 20 Oct 2026 16:22:52 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583523asm1436615f8f.37.2026.10.20.16.22.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:22:52 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 01/25] libpng: upgrade 1.6.58 -> 1.6.59
Date: Wed, 21 Oct 2026 01:22:11 +0200
Message-ID: <91a342f8bf17605554ace45870ea72425100203b.1792537664.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792537664.git.yoann.congal@smile.fr>
References: <cover.1792537664.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:22:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248319
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Release notes [1]:

Version 1.6.59 [September 28, 2026]
  Fixed CVE-2026-46675 (medium severity):
    Use-after-free of zlib input in `png_read_end` after incomplete zTXt, iTXt
    or iCCP decompression.
    (Reported independently by Ze Sheng and
    <JasonHonKL@users.noreply.github.com>.)
  Fixed a regression introduced in version 1.6.47 that caused libpng to reject
    hIST chunks in their correct position, after PLTE.
    (Contributed by Yuki Sekiguchi.)
  Prevented a double free of `png_struct` members after an allocation failure.
    (Contributed by Anthony Hurtado.)
  Applied fixes and updates to the CMake build.
  Adopted the REUSE Specification for licensing the CI files.

Note: cmake is not used in Yocto build of libpng.

[1] https://github.com/pnggroup/libpng/blob/v1.6.59/CHANGES#L6388

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 907c6fa2d0c4f8a8f765cde004c55fb2dd2c402d)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpng/{libpng_1.6.58.bb => libpng_1.6.59.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.58.bb => libpng_1.6.59.bb} (97%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.58.bb b/meta/recipes-multimedia/libpng/libpng_1.6.59.bb
similarity index 97%
rename from meta/recipes-multimedia/libpng/libpng_1.6.58.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.59.bb
index 6e4e5e9f387..21f3a8ff3b6 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.59.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "28eb403f51f0f7405249132cecfe82ea5c0ef97f1b32c5a65828814ae0d34775"
+SRC_URI[sha256sum] = "d80dd2a38a37f803cb9b6ac7b14bd6e74ddc3b654780a8380bdf93523fdb4389"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 
