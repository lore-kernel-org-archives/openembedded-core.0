Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 046F310BA43F
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 08:31:11 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67443.1774600269106038892
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 01:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KRZBZ4BN;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486fe2024a9so13845385e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 01:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774600267; x=1775205067; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHdkGnNckovd5ocMm/5/HKIGddbYA2zGRISXFq6SxUs=;
        b=KRZBZ4BNOPPXpb1zFQD9grF3QiwGCVaJZd5MuSBFC7N+uoJqATfbaQJRkflmelmcXu
         h3hp3IvJ0TrHaKXvbFayJZTdb56Wt1mHullA2ivEYOyMlTvxxNMsPI7SC2cdwuIzontJ
         b5ltKVLVT9ShqKh4aA/WcG0JWI/LbD//2dlYHSN61IXlDACTBUW5+yuYsGsbI/rSvdXi
         DJ09Lw/x53Ag0DNW9W+1Kmq4Uh9AZpbn01KpbzRTqDsnGgOuLGts+dl0IvybZ8HbGaDM
         MV39jvgF2gAIq7M25D2LSyZvT6w1K0Y4BjIKawq0xXFX/kr/MzUHRnfBxP9AE8RVtOaj
         +rhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774600267; x=1775205067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MHdkGnNckovd5ocMm/5/HKIGddbYA2zGRISXFq6SxUs=;
        b=brPAZPdAIGJnsicoy4qsNC2hNcj1X33rKthsFd7eFsUHbfZ54rhzOZPoOdySk/cQHo
         lnVt/xlOzfFvuwHQA8/gASm01pZ5yYQZCSfpM7V6k1LKAxkKKuUSGIpjonXDtTnGM/Q+
         WkdlJkkw6sNYw258DzHJUB4tDpg8TzUkC8yUrMDduunt25exw0kkthUJZxFtge2cbMwH
         iVyXmy5FJboZ9Ob2SKOiFv8WD5dtcq4vqCgjPUNKFzU0pca4wwT6t8P1CkLXzYEmPy7X
         7eHqXu1GrehBjTQI0hiSWzpSY9Fvvzxovwtczn8WQpNcVxIVzYX2naxZYt1bSYyZMnNm
         FEzw==
X-Gm-Message-State: AOJu0YyLYxw//2LmGyLtezovTor7iAlk0IudtRC2nLXF2EYZoAjs/YSp
	eZ1wGAeeyW6TNL3tOPr1f9c9pvJddCm26o65EKkfHdVemEYTHVbGn0QNtiPe/g==
X-Gm-Gg: ATEYQzwYZhpiiwWWeGh0/YMAPwebGL0bT8bKijxfQDk++kF/oBYH6wmPIeZLLd2k6U8
	+FNlaU0gL1w0e+QWr+xCvmYD01D8AEiMWV9Uq6IxgCNrg4wyEOBes5Dky7hWAgsE7XNdVLSp8KQ
	ih0wpzOfpYWUzCmXurRi6XcX+J7uoZj1cyy6e6IPdC9VFoZaOmWI3yC92lz+xFAZS4p3U+/w+tC
	VVW6+tMMMQ3mkry6vJukQOGpqI1IfONqvWs2gETfJkROotqzxN9VPCKa4I5U5GT2p0apGi2c5db
	IaibVS3DN8uJ9E+tD5UET3fODz7c8hQJoiXLetQVsdBJDBX3RzwrUsdQg9RkpvL/a03yvCpFjiR
	9wYG4M/+LMj9OTgSij+UkaByM5Atm8qAKyGfZZojx7EkW0E1fAFwfKGzfpkpqlavc2c0reLmefF
	CFIhnkpuCbUhWRHQ==
X-Received: by 2002:a05:600c:a106:b0:485:4394:b0e with SMTP id 5b1f17b1804b1-48727d882bamr17937655e9.12.1774600267128;
        Fri, 27 Mar 2026 01:31:07 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c95041sm76411485e9.6.2026.03.27.01.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:31:06 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v3 01/12] python3: Add warning comment before PACKAGECONFIG[freethreading]
Date: Fri, 27 Mar 2026 09:30:44 +0100
Message-ID: <20260327083055.12571-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <18A06529173E9998.57592@lists.openembedded.org>
References: <18A06529173E9998.57592@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 08:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234056

The warning comment is really needed. While Python 3.14 supports
free-threading officially, the ecosystem around it does not yet.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-devtools/python/python3_3.14.3.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.3.bb b/meta/recipes-devtools/python/python3_3.14.3.bb
index 90863a42a1..c40742fb43 100644
--- a/meta/recipes-devtools/python/python3_3.14.3.bb
+++ b/meta/recipes-devtools/python/python3_3.14.3.bb
@@ -113,7 +113,14 @@ CACHED_CONFIGUREVARS:append:libc-musl = "\
 
 # PGO currently causes builds to not be reproducible so disable by default, see YOCTO #13407
 PACKAGECONFIG ??= "editline gdbm ${@bb.utils.filter('DISTRO_FEATURES', 'lto', d)}"
+
+# Some LLVM/CLANG subprojects (e.g. lldb) and many Python modules
+# do not build when free-threading is enabled. Also, the support
+# for free-threading in many Python modules is not yet production level,
+# although they may build fine.
+# This is highly experimental. Do not enable it!
 PACKAGECONFIG[freethreading] = "--disable-gil,--enable-gil"
+
 PACKAGECONFIG[readline] = "--with-readline=readline,,readline,,,editline"
 PACKAGECONFIG[editline] = "--with-readline=editline,,libedit,,,readline"
 # Use profile guided optimisation by running PyBench inside qemu-user
-- 
2.53.0


