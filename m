Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C7BC47DAF
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 14:27:21 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.75126.1705933638044860601
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 06:27:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S2GJ8W6p;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-55a8fd60af0so2096979a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 06:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1705933636; x=1706538436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tSDbWZbqUaUQz+W5n30XF1H0+ZjzId89mx5Wo90/uSw=;
        b=S2GJ8W6pE9RWz1VCe4c3Jx+L9dLhVVMNbMjQu4qn+hHiPpNEjXIR3lwrb5I5XP65k2
         W0rjqej1oeQ+vDFBaQhDtwJ4+JM7EVa/k/cViNuGZHILkxryVx5A3K843AyFZcRrGAtj
         U+2JLEcei7nLq+wua+4x7HUY/yCbNx659Nb0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705933636; x=1706538436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tSDbWZbqUaUQz+W5n30XF1H0+ZjzId89mx5Wo90/uSw=;
        b=kHRI2S8/tZF8pJYd5XByOk+eT9syc4q6WFMowdBYHn6BhRQ3dzfFoB+Vc5eEDYERpm
         zX1N5TVdHBup7UfmUbenEssIXUPhiszskMkV2WNhFIRIAUJ/ENBGwVwh5mEAVFT3dxEt
         BALvgZQH4fGabdx7ec60d75ZJsEjR+cm+rnvfUAoQpgkkg4YXgHaY36ZsCaJ9J8k1C7+
         lDhoJIeUGVqutpt9d6wKIkPg4x+25RPyvdMSng/9ECpHQy/vV8nLpuRO7iQv1XRJHl20
         SfPYplLa0heXr13yMyKIbnvDX5XVAl7ED+jAJKvHKiUAPglSPou6huhCYGZNJ90SDQw/
         YNFA==
X-Gm-Message-State: AOJu0Yynj6UAimfZPDiarV/BT09tEl8tWf3bljEHs9DRC/s7ksu/7bPi
	8yAr8r0WJx77KXaRGiXWq//KcHkEc5ISlj7mrsthAiBLyWkF4tIkFJElqYGPknKfV9es1b6T6et
	B
X-Google-Smtp-Source: AGHT+IEV+nDTJhX7soini2AMjHF/wJLcPiIWOhg19IBN9+bJ9ll2ceyBIKhZ9DvyqoQjqe8gBGWqTQ==
X-Received: by 2002:a05:6402:354c:b0:55c:2d5b:391b with SMTP id f12-20020a056402354c00b0055c2d5b391bmr721745edd.125.1705933636248;
        Mon, 22 Jan 2024 06:27:16 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a57c:4d56:a1d0:e701])
        by smtp.gmail.com with ESMTPSA id q20-20020aa7da94000000b00559f32cc081sm2461296eds.57.2024.01.22.06.27.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 06:27:16 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libxcomposite: Drop obsolete patch
Date: Mon, 22 Jan 2024 14:27:15 +0000
Message-Id: <20240122142715.491986-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 14:27:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194171

The patch looks obsolete now we have recipe specific sysroots, drop it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libxcomposite/change-include-order.patch   | 18 ------------------
 .../xorg-lib/libxcomposite_0.4.6.bb            |  2 --
 2 files changed, 20 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxcomposite/change-include-order.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxcomposite/change-include-order.patch b/meta/recipes-graphics/xorg-lib/libxcomposite/change-include-order.patch
deleted file mode 100644
index 60331f6e787..00000000000
--- a/meta/recipes-graphics/xorg-lib/libxcomposite/change-include-order.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-This patch makes the build use its own Xcomposite.h over rather than an
-older Xcomposite.h that might already be installed in the staging dir.
-
-Index: libXcomposite-0.4.3/src/Makefile.am
-===================================================================
---- libXcomposite-0.4.3.orig/src/Makefile.am	2010-06-30 22:42:53.000000000 -0700
-+++ libXcomposite-0.4.3/src/Makefile.am	2010-11-23 23:09:34.544322930 -0800
-@@ -19,7 +19,7 @@
- #  TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
- #  PERFORMANCE OF THIS SOFTWARE.
- 
--AM_CFLAGS = $(CWARNFLAGS) $(XCOMPOSITE_CFLAGS) $(XFIXES_CFLAGS)
-+AM_CFLAGS = -I$(top_srcdir)/include $(CWARNFLAGS) $(XCOMPOSITE_CFLAGS) $(XFIXES_CFLAGS)
- AM_CPPFLAGS = -I$(top_srcdir)/include
- 
- lib_LTLIBRARIES = libXcomposite.la
diff --git a/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb b/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb
index 77b3db5cf97..881f5796951 100644
--- a/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb
@@ -22,6 +22,4 @@ PE = "1"
 
 XORG_PN = "libXcomposite"
 
-SRC_URI += " file://change-include-order.patch"
-
 SRC_URI[sha256sum] = "fe40bcf0ae1a09070eba24088a5eb9810efe57453779ec1e20a55080c6dc2c87"
-- 
2.40.1


