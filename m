Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 567C7C433F5
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 09:41:08 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.9534.1633945267101397720
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mzr+prg2;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id g25so7624380wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1vaKWVa3mN6w1sjr6dDD/xOE0X0yTbmT1kz5qCK/vUo=;
        b=mzr+prg2H0P2ejO+HdBzKawSewNJeiaQIwaq6vn5xpg318N6zwZ+ErMZTtoyG8W+X+
         Rw7r492N1stt2R5eM5E0Gw+rh3CSYJT37A5XVVGjT7X2kZDtR9/ScO3xDRl+YShogRGA
         jXte+znN2e7zQTz9r+7yW852ZNQwHIl6RfTC2cabkzROxS4QAuRPLdKV2QcqzSUsxJCm
         0cE0fZ5xELNpoRzTS5wUiqLPUuVNZPFbv9Xru3fxZAOOzQGXG7MT9IAi8tfmg6TWkKaY
         0jzSTgSEn6Ods7cvPokuD6PnxAgFQd5gUkP/5e+QeSssNu7g1q9EUKx+53t0kZo0c9WX
         wYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1vaKWVa3mN6w1sjr6dDD/xOE0X0yTbmT1kz5qCK/vUo=;
        b=6NPhE/13bcCo2yqcrDFJmPdnIW5qstdlOaGW/+QiAhlr4QtQyDsQ/7UgDf+E76/Bmw
         TW4X5zyCIEWOFbbazB5gj6O597/SS6zDS/HHR9q0J00m7fgfblM1thA2c8LA8zU2/zf5
         1MZ0msrFsr7JOC2l3JX5Cvn2GTB6xRnejiPLFG9/VJR9xKt8VeVVAxC6fHVzMYFwc8fj
         Yck4yczaHw/KkmVHjkSH50Dp0TDrC3kGtsf5GmolMwrii7iwVp58UGQ/y5b35U5YIxGq
         QS2aZDc0JW+oYEd1vwDZGdLxEIE1vS9LJk8bzkBvgpaahsVKDv3WvcXNadATImG9Shw/
         AhVQ==
X-Gm-Message-State: AOAM532fYK4u2rYcdDa2wA4ahoqo/NusbTM7TFb0YRyo9xGR3BQLEEz6
	Tc9C8sWJ+VT8FzvgaKkiVW6Lsv0piLQ=
X-Google-Smtp-Source: 
 ABdhPJwpHObxcT+YY6NI6tUn2CYXQci7W3agi8XBrZIYCZn97k1x6HlK2GvNAnMhWX5aNh6CW1LOlw==
X-Received: by 2002:adf:bb93:: with SMTP id
 q19mr24017396wrg.423.1633945265513;
        Mon, 11 Oct 2021 02:41:05 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k17sm7180758wrc.93.2021.10.11.02.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 02:41:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/25] libgit2: update 1.1.1 -> 1.2.0
Date: Mon, 11 Oct 2021 11:40:38 +0200
Message-Id: <20211011094059.4184654-4-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011094059.4184654-1-alex@linutronix.de>
References: <20211011094059.4184654-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 09:41:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156817

License-Update: includes portions of openssl headers
https://github.com/libgit2/libgit2/commit/0903cac1d08817e87c556f5a3e6ec881be86c7f2

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libgit2/{libgit2_1.1.1.bb => libgit2_1.2.0.bb}        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libgit2/{libgit2_1.1.1.bb => libgit2_1.2.0.bb} (59%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.1.1.bb b/meta/recipes-support/libgit2/libgit2_1.2.0.bb
similarity index 59%
rename from meta/recipes-support/libgit2/libgit2_1.1.1.bb
rename to meta/recipes-support/libgit2/libgit2_1.2.0.bb
index ae30a7a1001..6df42e473fd 100644
--- a/meta/recipes-support/libgit2/libgit2_1.1.1.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.2.0.bb
@@ -1,12 +1,12 @@
 SUMMARY = "the Git linkable library"
 HOMEPAGE = "http://libgit2.github.com/"
-LICENSE = "GPL-2.0-with-GCC-exception & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5b002a195fb7ea2d8d583f07eaff3a8e"
+LICENSE = "GPL-2.0-with-GCC-exception & MIT & openssl"
+LIC_FILES_CHKSUM = "file://COPYING;md5=73fa96e40ce64f79bab087c7e1deeacd"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.1"
-SRCREV = "8a0dc6783c340e61a44c179c48f832165ad2053c"
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=main"
+SRCREV = "4fd32be01c79a5c003bb47674ac1d76d948518b7"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


