Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D75F3C982
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:23 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21485.1771943599163283247
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:33:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=n+j+cEFz;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4833115090dso54144185e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943597; x=1772548397; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U764lGr+nq68pRGB4D7NsqY/Nn41O+kPENtJ72Jk68s=;
        b=n+j+cEFzwPdwC2K/AVXsNhy3ukX+f1B2lJT4Us8e51s4kmhs55N6D3VdLxbLl/zTeV
         FmgHj/yIC+Mzk65QBLAqeiH8Bkw4T/956JiUI1t5qYol4b35RdDOr200h/yiHjfF1tm9
         BCtPK9e9ayEzsjySO4G73JEfXzaXFXJ6FKWV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943597; x=1772548397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U764lGr+nq68pRGB4D7NsqY/Nn41O+kPENtJ72Jk68s=;
        b=Jo3AwLde59bxKWy2J2dxOrfHVt1sMDgt+Wy38zyHAtZFTUe9Igr8JabFk6LJwy7Lw5
         DQA3Fbxiy3oaLdFxiLlI7x7gLbJ3SBcJx32Dl4EFZdBRl2QRx53ffwWYGAKVaz+Rlj2n
         JmVwRLCDPbFWMjw8HVbOcgK9UDKEwDW0DxUuj7jj8lsPjakAOieuxjhUV8Wns7/VaJUe
         1L3mBgLCYtXYikEWIuAiYkXxtuWbOrH6sh4hpyFtQXQaxHfA9rUOx3ITeihVq6DvAQlH
         /yNfFD3P9G8u/2NQ5iqx4EOGIXR2CoeGlf9DD+XP3M/xlM3mTS2ur9RqFwpSI1G+lqN7
         uEEQ==
X-Gm-Message-State: AOJu0YxpZ9IrtDSI7JQM0y2zvddHWBEt/zpKU5+0no0zBhMgI6KyIxj1
	FVjQOhaQ5ZIdzYXqc2mJ9yS+Svic61l4RpQq/9SmmsM07QBeplpUZJ0Z7jrf1IRONH/f7e98W4C
	kEUY5
X-Gm-Gg: AZuq6aLYr31axsQhPhsSfFPtT7IUAjIcIxZAu0MuhWPg+vjH22TLmbfMLvH7uU4Qqk9
	48VpYPar1fdWVkwO0HYBGtkM/+6MYRQCkw6GoH7QHtj6jVyuoNXo8mevDsCX9LrARr1xyl3ArQ0
	hBKq8N2I7fChNrYPHHgvOokFx2kGNxIrAAH5fwghUS7Ti8N7DfWM6Dq7Q5zUEWm3k1y1mOX8m8x
	iu4/C7lMlqEHsMFZ3r5zsxA9sbkk5rLiua9T0jFOIFZIobUbhvKcMGW89ALPkMNMuT6QZQCnhcM
	tt80dInffRvseDzf5mVm55uPfRA7XDzz6iXpX/YreSUGzF+6kx/RIqSNXIY4H+GLn8PiQTdse0H
	0y3lnrTAj8TeZ7pGUi1yZmL+Io7is3IVINfG1on1G1myttdrHv0XqdpARBgldZ9IKrlVXLkbwL/
	WLINok0HzM2dvYoo3vcGrpAk24+1MvEhM0jCHYuQhB3go+C0Auz0vX2MFI2bad8xXo8yCFFVEJQ
	1/lIoA0OsTQsaf9eIKBKVGhp6zEte9/2Q==
X-Received: by 2002:a05:600c:a11:b0:483:361b:deff with SMTP id 5b1f17b1804b1-483a95c9e16mr218782765e9.14.1771943597154;
        Tue, 24 Feb 2026 06:33:17 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.33.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:33:16 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 40/44] libtheora: mark CVE-2024-56431 as not vulnerable yet
Date: Tue, 24 Feb 2026 15:32:08 +0100
Message-ID: <ea1450a30ce8582236cd2bfd3b96e89584bd29c1.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231847

From: Peter Marko <peter.marko@siemens.com>

CVE patch [1] aplies only on main branch which is base for 1.2.x.
Branch 1.1 has a different initial commit and does not contain
vulnerable code where the CVE patch applies.

Also Debian [2] marked 1.1 as not vulnerable.

[1] https://gitlab.xiph.org/xiph/theora/-/commit/5665f86b8fd8345bb09469990e79221562ac204b
[2] https://security-tracker.debian.org/tracker/CVE-2024-56431

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
index 5e94bc29751..2cbc6696eb2 100644
--- a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
+++ b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
@@ -21,3 +21,5 @@ CVE_PRODUCT = "theora"
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-examples"
+
+CVE_STATUS[CVE-2024-56431] = "fixed-version:branch 1.1 is not affected, vulnerable code is not present yet"

