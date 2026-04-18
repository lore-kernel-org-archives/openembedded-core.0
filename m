Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02082F99C90
	for <webhook@archiver.kernel.org>; Sat, 18 Apr 2026 18:34:19 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72009.1776537253080189711
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2026 11:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rkk+RRHx;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: adam.blank.g@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38e96a071c3so18570821fa.0
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2026 11:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776537251; x=1777142051; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fwceO2bx0KSUrc3K51s9fxA+sa3Gv5yD8Cj6haUBtMQ=;
        b=rkk+RRHxPYb+n00cuocYHgXxUGnD6uZ7aPcLA1LmccdRgaofFY+NdGfu5fxeTx6V1J
         OXt9+w58nA5SnDnJ8UQr4hiTtrvN7TDBpIL7GLC3jwsFdJ+cbXjKMRqcfQHo0xVsHyf+
         A2ctGQx2XMvlSxtojRJH3loML26QFEXgOnBmEwfI/I9yo3ucgL4qKQApeCCJugyMaZGj
         4EpjRLAC6d8hMWdAn4ISQK0w6lfhbYSjRE0IFOL7t38hU3LWAXtF42wHNqCTQ6IqjDxh
         MuFidJoJb+KtJzEne/EW6mSDU6d6eE/jBC6HXrbufZtcv+3a7f+yQZISDZ8zS/X7ypNX
         rFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776537251; x=1777142051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fwceO2bx0KSUrc3K51s9fxA+sa3Gv5yD8Cj6haUBtMQ=;
        b=EbWaEZj02OrI9nQhZLK7jdmVfkX5SWx61LBH693BoeljU3wAXIM7HaKWL96rPkDgmG
         +rnQR7293Vp2zYmJhtBM8PyWnjxunJ93fszOJpDp7ps6qLhkj0HRa1i1hhrcAIftj0Xj
         yNSpP6ybkuSeMMGZn/uff2Oazxqm/v/LkvwnINU8H9+JHBRwpvoQoouyirMMYH4vdDWg
         BWcpZM3MCu/SKfBOUiJ2m2uDyXNdgACnCvoX2aAPQKLvqmjL9RPnamvySP+vY9gQohT0
         75Ve3L2YOzXqIiDFTvdp7VdESJZeQNbdUS4liMGQ2C7Z2qClwYVnFljzhl3zWgNt4v5r
         XRfg==
X-Gm-Message-State: AOJu0YyHr/5w15Iyu1zTzM5asPOirk0N6WdAOyJUBNO+Km3RcHK+Inb6
	O/e6wrlDKVo7/Jl6ZIl6uh/G8tlOq+cMNb+tvpoaD+tmyuV67bJb19m5Zf2czA==
X-Gm-Gg: AeBDieu7aGlBkkSspyzsDe9cQQYxNi6nFmmcGMz+Qdm/p+JSF3AYnsBNeUG5CUw44gz
	RYWbh10yAybY+iSN+W2VDIcACy8ba9HVdHHuWp7H85hHLLvi8odL8uq5NPIwpsdMi2308nbOchi
	VpigOI23LClHXTDIiidYdfUxMJkf3qI2VXe5wlb4SMopLcm06EzeFT+/ilU9i+hNewC4KdhKq19
	KKnJgumzgYbsuZOrH9VtpHal+LA/NasltQW0lXs/7+IMpEIkcvWnbgmBEJ1WFoGCxyh6SgvvGsB
	n3W7cv22NIfgwprBL2YK4foU+uLQ+enXcspb0Vnvd+U85cuSNp8llR48k+nucqNNUdwH4l9xA2U
	Ri+onWd0VZXkm65+1erOA/qOcuRotSUsDKyKPfHdYHkrSKO0gncC2/ogtiCu8X3Fbli+0felw4v
	xMedZRTsBLUHcpPpvr5SafkZFeFM5Wq6mq81b6Kf3L
X-Received: by 2002:a05:651c:f0a:b0:38e:827b:98ec with SMTP id 38308e7fff4ca-38ec782b8bemr23959441fa.2.1776537250961;
        Sat, 18 Apr 2026 11:34:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:8f12:8be3:442f:59fd])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0bfdsm12965981fa.26.2026.04.18.11.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 11:34:10 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Sat, 18 Apr 2026 20:34:06 +0200
Subject: [PATCH 6/7] wic-tool: add 'extend_recipe_sysroot' to
 'vardepsexclude'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260418-extend_recipe_sysroot-v1-6-8aeb383ba743@gmail.com>
References: <20260418-extend_recipe_sysroot-v1-0-8aeb383ba743@gmail.com>
In-Reply-To: <20260418-extend_recipe_sysroot-v1-0-8aeb383ba743@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776537242; l=781;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=2TmxFWWozk0dGjsyoMrcnXlaCraUNb/YO+eRF5QDErs=;
 b=dHx8ZKLs8UnqI23qHhpnUuRRUU5HcN+ldWRpFzq9Vc4lx+4qx86Gnp1PPS+wSFmYlN781tqCS
 LpGzRmqKwI1A9dmM8LdBu9pQHySbB/9PNEeQbjNXRq36526KMtLX38S
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2026 18:34:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235520

'do_build_sysroot' did not declare this explicitly,
 but made use of the fact, that 'extend_recipe_sysroot' is
ignored on the base hash level.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 meta/recipes-core/meta/wic-tools.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
index 45fb873dd6..1f86347739 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -27,3 +27,4 @@ python do_build_sysroot () {
     bb.build.exec_func("extend_recipe_sysroot", d)
 }
 addtask do_build_sysroot after do_prepare_recipe_sysroot before do_build
+do_build_sysroot[vardepsexclude] += "extend_recipe_sysroot"
\ No newline at end of file

-- 
2.43.0


