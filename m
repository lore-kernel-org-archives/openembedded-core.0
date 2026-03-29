Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97614FF4920
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 22:46:40 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38496.1774824394117912366
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 15:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PeOKX9tg;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so51248265e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 15:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774824392; x=1775429192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+R7PuJ+CsfXjuC7V/6QmmmvMOueIhSFAnJLctsI/fs=;
        b=PeOKX9tgtLh+L0w2C6wCKGXp2Yje466CscjtIN6ehUR3f/xL5uHBa8Swq/nQSGe5RM
         hrpsASZmrI+XHctalbhRzDi0G9t1upCH+xS+Xu9ULznG0DSBcpdlXMtN0DV/hMtfgkjy
         v6y9d+hNnw44stCtPILmd5UEyHu+KhOgSYm9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774824392; x=1775429192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T+R7PuJ+CsfXjuC7V/6QmmmvMOueIhSFAnJLctsI/fs=;
        b=R1OIzqcNZOpR6Lre9Pythrl5Aoe0SHAbB5SpXQzTLOBfOgN0PqXqgU7mK7TUYBgjAV
         SIX7/5fSKSSNp+abxToOixQ1FCZxLp+Q52W3PJ8iXAs9Xzykd5ulO4lk6hSspeWCwGtD
         Xrs9J59k9AlyuWkzPfkLSmzMT7QRY0A+1lCbLadK5kPVSj/nRkGh6Tcl39Ou1ePKn9fD
         2bhGtBhXErz1EG+rLw100I27q9tUg+UZZ77NdzBbwvW68Ioayx+FIWhXLZGKFPeHZ9rb
         hUMOIVC3rihckSbGp0fSYyOVPfGz1HNhMDkp6iOddReTZp7nb/Jnj6Ig3bqB3CQ0CJeX
         L3cw==
X-Gm-Message-State: AOJu0YxnY0wdFmViCcfYnR72E4Qa5+Yiw9Z03FxD0UwzfEglfVd50krH
	vEMcMZKCHQPClAnJtjsgQ1X4AF205oGbXpldtWDdC6nD4QEqfuRExoDZ5LdriahLOVRBCTIjt2h
	iFruMHgw=
X-Gm-Gg: ATEYQzycXa3GQIzFrRi8YACooW+W1AWZki8ySOe/Z6x0zgt1cSqfzuVRAXRlQVpmv1W
	J2DlBzAuNEGOV555asJT2KKj04f0rAcIE9JamebhxsRSZypx8WTnkrRp4gxWwQeFizQBHZb3WnP
	axPQJwYeagX/hkieYdj3vNKasppgchOaC8r6mpgzI1gzPqOnon8xKg8oEbFY8ib9SeY4MY+2/Y4
	9GSA+kagYJJucWyxRsANbdWyjkEzaDNr95bl8G/wN8AZI1BviOxXo65JoBf6r7eNXNv6QUURzHQ
	N6z9Md2Yl3iG7YAqWYRHfSjSVdjxnVqa3HxZ8QlbCg6ocgXGcXRBrOiEY3/b76n3EfpTOWo+SQt
	hAjk37tTrC93hRoGZEVp3CyO6kOg5e3ue7AcAdHpw/V/KvJXom3L+rvIxRf3hWpuiTpz7/dQDP1
	xzPkXHPh2Wf13Ao0lzgM8Y5wYx+j1uIKXtLsa5wAzVjbql+H6E1VbQEXhWmvqY2Qcn2WJ5IcFtF
	ewdme6Tf89QJwtMxhZJdpUaVxrSTclR2pMfnw==
X-Received: by 2002:a05:600c:c87:b0:486:f308:94ec with SMTP id 5b1f17b1804b1-48727edf6eemr181700065e9.24.1774824392281;
        Sun, 29 Mar 2026 15:46:32 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873061eeeasm133760375e9.2.2026.03.29.15.46.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:46:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/11] pseudo: Add fix for glibc 2.43
Date: Mon, 30 Mar 2026 00:46:12 +0200
Message-ID: <ebe917f3d1e858ddfcc1bcbf209ed55b422a527d.1774824253.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774824253.git.yoann.congal@smile.fr>
References: <cover.1774824253.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 22:46:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234186

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update to add a fix for a function definition to work with glibc 2.43.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[YC: upstream commit 7d35b0e7929d666af783db835a3a809f8f6ce429]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 0f063f18812..3ae560487bd 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "43cbd8fb4914328094ccdb4bb827d74b1bac2046"
+SRCREV = "56e1f8df4761da60e41812fc32b1de797d1765e9"
 S = "${WORKDIR}/git"
 PV = "1.9.3+git"
 

