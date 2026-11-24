Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30984.1795560749992653675
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Rwoay6Pc;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so4170078f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560748; x=1796165548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qgg7z0I1YVkn4AJEy6mb8UAW3EDGLirtKmAb2wIozUQ=;
        b=Rwoay6PcUpDhcv/Vb1HjmeOqb3T45KsaEsOlPMQYy7mdzXdUPG4JXyz1LQr0MBgThc
         FzlrEpedGnhblUkxaSaFaW72Jc9TVBe6SpF5TV5jkvGtz9nWwJ6RSmrqQNg4Vix9HRY0
         /c6pcfU8Ok1P6Li7OUctqNANzA3w1M6E/KLMS9av++mxnfu0p9pt58ZVPeD4UjYiltpf
         sgcGwPwf8cByeeLn40/se4+F1KlMTqHQ2/+FiXiOFFyqOuMRf/YY1Ww6FTostGKh+22B
         RImZLcsKu694NwUaVg48Yagq+maGHE2ZNzE/JPeg92IYM8WuGTS0vdJY3FvSKGw/AD6h
         lWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560748; x=1796165548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qgg7z0I1YVkn4AJEy6mb8UAW3EDGLirtKmAb2wIozUQ=;
        b=E1RbY/gHtRuPDiUIyvZQnNpG5/c+7KVjyfdST3iJ1WzcmPck+LpZmo+YqLpmEnLEzo
         ck9PoVZkidu2bOecdAbSqxGx+/Jqb5vAAQMIHNBVWl5BPOIxV5QxNlUmskH73agxmqh7
         5QDHJSPnovS3GT09wt6KPGxqahBRxffWoa3N1CSyKLyuXSryMQyLqQrkwciLGqXWBKx6
         jl7COCPXniPjYpTfAHsYQug43vaABUlPol2zm63Ysxlnysltrma7ohevdg6PTSJjSOCh
         xC7g5Q55WwHBNbpxBDOrbxv4uBCLtUtdL4oMby/EA7pA4pZ7D2n9dppxwPsC7aX7N6XT
         JNBw==
X-Gm-Message-State: APuU4Z+yUDCAF5gXy9ZCuboM1DgTSAKdbj9vaFzeb9TL2AIUuPstAwgC
	Hpk+csJfkaTwVvMIunQ7f+Qjuh6S8YHarlx/64KNJN9zLiQdkUHK/QVtX37MnQxj1WcwXk8TQ3t
	Q4Rxq9S8=
X-Gm-Gg: AZFdTZdPvl6XH8DV5mB3VqNxkX6ITjp4l10tvo7fYYJc6yMkqsimKuO5cqWvXOOJGUv
	QplxTjhuOQjjOp+NZks2Azx/PZpgS417q0LA02xDd3bMJgK+JRzjcvtt4rUAFrJzARWzbKvmud4
	Y/Is7CqHHpbLRD5XPUOZkDMw7cCuRNyWDxBPIib9d5B4S0jxEsmmaU+tEwjfBj7VDmYmttOKYu2
	NeGZeBs+dtB/UA/O2glNu1TLBdoO/qrPS4Mewc3z9GgLFZrCBdpPGWB14AkAFIY6rgZqPQs+mkI
	5IM5H6bCxLCQibcqLI7cT7yXOIOrWXNhm4f0xXgyX0TVSN//pS5/laZ3Ru1cb1hrwL6VZZfgF11
	YBx+p9gpotDh8vYf+XnqYF5WRJvOyERu+4d8IuS/5390y1B7IV3+O8LfIFWcAFr+uLEi9HMx11y
	SmNYja5s3cDBddjx6m9xfUn8X9L980w6zyP1wQU3TxQG42ELXzlB2A53JgG/LL4MTJSjGiYOuaz
	yV/41qaR+gd0f+KsynO3EqzwyzkjqsX7tOrC7fVV776pICKFoZuoPr4DD29cGC9HlQ9MkQ7jR4G
	E4Q3lcivUs/ZKCAL8WD1MDdX+U8yBNYPG4XwfvOqGHL2oZAOq0GpNGZYcOi/ixImaP9Vezo9ytZ
	cVCEbHCpmXft7RCnTXJnc5UyZkevh
X-Received: by 2002:a05:6000:2903:b0:49d:7e8c:e8a2 with SMTP id ffacd0b85a97d-4abb244870cmr35507771f8f.33.1795560748204;
        Tue, 24 Nov 2026 14:52:28 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm30462488f8f.52.2026.11.24.14.52.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:27 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 15/21] aspell: upgrade 0.60.8.2 -> 0.60.8.3
Date: Tue, 24 Nov 2026 23:51:22 +0100
Message-ID: <a4d4a72005f03020a332e28accec571a414e770c.1795560335.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560335.git.yoann.congal@smile.fr>
References: <cover.1795560335.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:52:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251095
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

- Fix CVE-2026-75818, CVE-2026-75819, CVE-2026-75820 and CVE-2026-103658.
- Fix various other memory problems.
- Fix various typos in documentation.
- Remove unused MySpell example code.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 05baab915b146a19776cd292962e2cf4edfc6f20)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../aspell/{aspell_0.60.8.2.bb => aspell_0.60.8.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/aspell/{aspell_0.60.8.2.bb => aspell_0.60.8.3.bb} (93%)

diff --git a/meta/recipes-support/aspell/aspell_0.60.8.2.bb b/meta/recipes-support/aspell/aspell_0.60.8.3.bb
similarity index 93%
rename from meta/recipes-support/aspell/aspell_0.60.8.2.bb
rename to meta/recipes-support/aspell/aspell_0.60.8.3.bb
index 60d33766782..d97958d83b8 100644
--- a/meta/recipes-support/aspell/aspell_0.60.8.2.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.8.3.bb
@@ -14,7 +14,7 @@ LICENSE = "LGPL-2.0-only OR LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
-SRC_URI[sha256sum] = "57fe4863eae6048f72245a8575b44b718fb85ca14b9f8c0afc41b254dfd76919"
+SRC_URI[sha256sum] = "0534eae11132405120d11e46bf595bd5dd189bc124ba77a5dd6aae861b48a162"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses"
