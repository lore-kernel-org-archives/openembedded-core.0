Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AAEA10A62ED
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:30:32 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49663.1774535430735491906
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 07:30:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aq+DqGjv;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fd27754bso10018155e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 07:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535429; x=1775140229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNdmWgA3Os258qwMAO7LTEFXVgP+6nxrxsDlPP2jerw=;
        b=aq+DqGjvmKLPep7i5euFEew7BKkAvaMpm+BmDuUmeAcN2un83r8il9Gdxo2hbCypTL
         wo5cSJpizFyhenfTgxl4QkfTnzHzQV3eM+4jvSq/RofeZHNLlB8IpcSXt8WU5oS+liBT
         rVxaEMwh2F21hkIsi/yNKG/Bv+o5FnEmqFwbIIr+xpbKQQ3u/9qs2tS4v93t4YuH67ac
         FsNncIRi0E2ExjqdQQYVb8tlGfuTPB4/f1r/p8ApCfVkXtKjRPsE8mI6iq2Mae/LExF4
         0u/Jh1IViuDbpwk7PVdEk3f84zRV54laAtOXjiwDTES2U/ZvgpEXwo6sazz88hWL5/WB
         nDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535429; x=1775140229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KNdmWgA3Os258qwMAO7LTEFXVgP+6nxrxsDlPP2jerw=;
        b=aMwhpq75RObl/BUza1/sa5NRrE/b3ONdbv4L1uSRxLS9O8w6uX2BZKQx/Nohr/10FC
         sJYq/bhpywRdrOfBRah0d+j68cLdDQspYy57rVMkpdaJf1SpUjcpha1LxiZXDzrmkO+E
         vIVE/45nzV4l8227OSG+UW69p+/T3N0O1HyTppq6EhT/vJBiY1GmQVkQhnrWNRAe/vqu
         nY66dOePk+HAIi8WPoGnNzXqh2P68D7uIISc/0B8ts/vS2tPjrpu2tI9WTe64WjkI8lk
         YVSZ2cHzOkRoezo5SgQ0eA11K7TVIfyBNE2b8O40v3tLWaTMZRVX5ZsCH8hOuQ9pwh+D
         dxqA==
X-Gm-Message-State: AOJu0YyO1vaA11mnONezbrZ1DNafiqvAGkXG3mQt3XBUDPz1dT6FTJCR
	wWrHM0LzGwHpb/P7H58ibTbOo/tX06N0rYjgZaGrjPSF80ErdFdS/9OWQJpS9g==
X-Gm-Gg: ATEYQzxJ3AighQDOkv/7UVcxq2l7xdNuqShbd+p45vJU0ejQ/tWbLwFLLC9piibyzvX
	eW0bgaeqFS7IIZ1Pcm2EUZ6Iia0uocZhYHQ41idDylnMryrqkADTTT1hDGniG39zdWcT9cA0Oxw
	TP+oUlo3neWGM3LAiYJxpBoRQQ3pGzGonKhMokkmiG82KnYWs0ygCqydgrnDktG6j3YdXSlLc5d
	BktM5GEjv0PZvTR2Mu9xnrZLJPnL8WXqBq03HnX9oTVf/CpT95tLbUUwcdvoE1mUD43Dvkp2qR7
	asGCBExeUfVpc85FKQ4FukSvCvJrP1b6mwxGFZUe7bHaBL7260v5iX5kfk8e8GWTPCWrLv9VGRo
	ViYMxLQmWvMyYJAy43mFY6V+lkpjKfNsyhMctM2ZMZvAQNLHTOFWGVi7kRJXCeBCmfOCBKdHgrS
	IlENmptqQ0ySJU/Q==
X-Received: by 2002:a05:600c:34c1:b0:485:3c66:e21d with SMTP id 5b1f17b1804b1-48715fd47a5mr109525585e9.2.1774535428708;
        Thu, 26 Mar 2026 07:30:28 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b91942f24sm9162880f8f.11.2026.03.26.07.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:30:28 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 02/12] python3-dir.bbclass: Move PYTHON_ABI into PYTHON_DIR
Date: Thu, 26 Mar 2026 15:30:10 +0100
Message-ID: <20260326143020.2083293-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326143020.2083293-1-zboszor@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260326143020.2083293-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 14:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234005

PYTHON_DIR is now suffixed with PYTHON_ABI.

Python build helper classes and the python build modules
use PYTHON_DIR internally, some of them do not care about
the ABI flag. So it's important that the destination
directory is set correctly.

This will also allow fixing recipes that may or may not have
been using PYTHON_ABI consistently, since it was set to an
empty string.

Also added a new variable called PYTHON_MAINVERSION which
is a combination of PYTHON_BASEVERSION and PYTHON_ABI.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes-recipe/python3-dir.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/python3-dir.bbclass b/meta/classes-recipe/python3-dir.bbclass
index 3eb0dea9b2..f3ad0a2d91 100644
--- a/meta/classes-recipe/python3-dir.bbclass
+++ b/meta/classes-recipe/python3-dir.bbclass
@@ -6,6 +6,7 @@
 
 PYTHON_BASEVERSION = "3.14"
 PYTHON_ABI = ""
-PYTHON_DIR = "python${PYTHON_BASEVERSION}"
+PYTHON_MAINVERSION = "${PYTHON_BASEVERSION}${PYTHON_ABI}"
+PYTHON_DIR = "python${PYTHON_MAINVERSION}"
 PYTHON_PN = "python3"
 PYTHON_SITEPACKAGES_DIR = "${libdir}/${PYTHON_DIR}/site-packages"
-- 
2.53.0


