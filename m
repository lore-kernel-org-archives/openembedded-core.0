Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 335C9C44516
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 19:04:21 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1647.1784055860522018244
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 12:04:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NgwaQsfb;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4518ad44e83so804128fac.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 12:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784055860; x=1784660660; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rVKYgZMn2YW3UXizd9MBZQFO2yYMxvtWcDky6NE6Vog=;
        b=NgwaQsfbWnmlf13r70tF0zE3oqxqIKSXwRW57XFhMIiC/evwEhhARcbGBO14s8Z90E
         iVmH54Ycvo8lihcx1EEyxw6w7ZweyrlA+vkTO9y36WZuePZKhdQVJ1an98wDddxJC6uS
         nfcGzJQ0rTdJP7W8iGoycvtLhwH8KBdzSzcWSq1dp5yV0KS2JMl3HzlhD7NJQ4EILCC9
         UTsk70o2PlqNmIqgFfxcsAPo7WvKQF7vjucGUpbH6YMyISuSjz7XtuVBeBH9SmdGLGpB
         AcZg/7G73z5LHC8IzBhe67lX5OKb3/CRgTmsVaEMrcwwTx+WVPdl25Z172psLs7s17Nx
         Dj5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055860; x=1784660660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rVKYgZMn2YW3UXizd9MBZQFO2yYMxvtWcDky6NE6Vog=;
        b=tP2iNJxzjkp/uThA0iINpMfNyX6KPF2ED6MfRUFyWM5Mh3DwzqMEfmQZh+W3smPZXj
         lnhgHxIhovqa5BGnWPipmBZ0lOCwz9EfsCsGylIYe3E7XFuT6c8yZedn37ENm/15XGav
         Xy9pHygWJKWuMGbXa8q5DFA02wmYH6jNwEItWrt7eoh1/NXjJbQxqqsW1ryXOlcZQtvj
         r9liOFmp6rlT53AAEX6UgPlpNQCrMoLHTmATkCrL96Dn3+kd3KGbS06MWd22ZKVtag1f
         Gu/3yZOsRUybjS5dzQpAI+xwMJXXA8d6X+tp5rWZ4FX2/PDNYY2ay9UqfFTrkUK/IHoR
         +BOw==
X-Gm-Message-State: AOJu0Yx3yeuJvdnZiIkz0K/faiwCCvmBViTDEU1WrBuFfEw/7xmxhLXU
	gJN6RF6Ji9p9qpZogz+CI6mjAW+Z+Uff+P2We04naiaKP7T2t9/9PJgEUfL9Wg==
X-Gm-Gg: AfdE7clUaauqAxu7sQctZPu/b5uH2wLjH65nDCnbX1uADVtdvQms62fIQeFg/3mMxs/
	vc1NY9SZuxbieAE2ETjE7X260AGH8+dtYWA+1WmbxCMPTC0pxwVIhU4BSdggwMnRyDNpWBaH52o
	85JQ4FqDTHQ4ltoGpCl5UCIrJo4TPNNfgPOwxEH9qNv7V38/y/kpQNkbeveDyS+lH7IxYUAmn8k
	GJp0S13KD47Z2Ai/LkJr0j5vprLdwSxoDCxcezEQ74MxR3HN4MQ/mEWjHUwEm7KmyjptpM8PTU6
	yi3h21khPdlrUpaqrod6/s+cxyythtl7CV3J8u+xo1mqt7gW/AZybMRb8FNxLWH7tY+I8kp+wV5
	uSgczGd+6NXQZs2NsZS3XwtBYYP8CxyN2RxN38tWJARuw6084HUCJsCM7DhmMBwKWiUDocwHtOa
	/Su+SdAmmqCA==
X-Received: by 2002:a05:6871:3391:b0:448:c1db:f582 with SMTP id 586e51a60fabf-451f10d2261mr8344603fac.10.1784055859555;
        Tue, 14 Jul 2026 12:04:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::7b52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451916f31d4sm17695629fac.16.2026.07.14.12.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:04:19 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 14/22] flac: Replace deprecated SPDX identifier
Date: Tue, 14 Jul 2026 12:31:24 -0600
Message-ID: <20260714190405.3328796-15-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714190405.3328796-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 19:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240922

GFDL-1.3 is a deprecated SPDX license identifier. Replace it with
"GFDL-1.3-no-invariants-or-later".

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-multimedia/flac/flac_1.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/flac/flac_1.5.0.bb b/meta/recipes-multimedia/flac/flac_1.5.0.bb
index d55e157a9d..d982825f7f 100644
--- a/meta/recipes-multimedia/flac/flac_1.5.0.bb
+++ b/meta/recipes-multimedia/flac/flac_1.5.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "FLAC stands for Free Lossless Audio Codec, a lossless audio compr
 HOMEPAGE = "https://xiph.org/flac/"
 BUGTRACKER = "https://github.com/xiph/flac/issues"
 SECTION = "libs"
-LICENSE = "GFDL-1.3 & GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Clause"
+LICENSE = "GFDL-1.3-no-invariants-or-later AND GPL-2.0-or-later AND LGPL-2.1-or-later AND BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=802e79e394e372d01e863e3f4058cf40 \
                     file://src/Makefile.am;beginline=1;endline=17;md5=9c882153132df8f3a1cb1a8ca1f2350f \
                     file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-- 
2.54.0


