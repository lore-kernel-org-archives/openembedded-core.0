Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.7516.1624360903640030291
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 04:21:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ei36m33H;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id r7so23080821edv.12
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 04:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qY1LoU1Yj5mf2QmvhN2I812ICYmhT9V4NnOWe+c7Es0=;
        b=Ei36m33Hd36xhlM+CXKSc9KzsaNmEsXSL4UX2Qlyy2EODoUFr3s0liLM/IyZCJ1PE+
         /0dfCJ5CJjqQQFLOAxZlSRoBlwNdWywebx4WLEL1QDOx+/JFCCAurMglSZup0s30WMYX
         fTi/bFoX7PgMCPFGzgDvZiB8WrIP1XoDLwdMO4YmcN8k/A3Ol6xCbsy4p5j5NcIlDPhI
         toL5yNpoDClrhA/U1859PaAA8yo3xyMYyVmaSVh7G1b/Ui0yA6RjcxL2BkuBHcjQ6GRI
         u/SVW+2yYswBnD+so0TmLnk4vaadJRKaBTUV00mGxW74Pw57PmLnBmUTsTklidfGPFoV
         aDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qY1LoU1Yj5mf2QmvhN2I812ICYmhT9V4NnOWe+c7Es0=;
        b=F4UxetExQZ5SF4wP/6zSCk8X+VGpjAk+D762UJUR4lRenyTsxnbjlOsqHNvscVaAPb
         BkCHaKRXz3a3dK2esD2yt5rCyKkH7lujQ0PCmiONDFgCjO/CHhxeW2phncGnPghY0zGw
         cTHPl2Gmi09n9GE8y8b2PNlpyWtZdWzVVLaBGuR8W7b07xqkbFfqc5WzsQaHI//aTPI+
         yV3prUhbSmzecrcan9+NcIZamgABHRtYuHja2hS7LNxXE0SC8ChH4Bb1ADHESzq2XqBZ
         SRfQWUknVWreh3bpnG5csH5DqXjoKKm9zZi4w/25EB2kRj/J9BoPI8ZadnK34laSjqok
         RYVA==
X-Gm-Message-State: AOAM531RXwjZT5kgBv/A0frhS6Ez1humbL4GNNharhF/ksD02t9wGDSd
	V8ZD6vWlOwUI8Kmi8qalK6QYDLF1/80ybg==
X-Google-Smtp-Source: ABdhPJyyZpxaE+0CCY/fESK8qhPnjKpM3wJftO+SK1je7d5Ar//d+cZdXYSQpxDOIhzG/8RjLOaCgg==
X-Received: by 2002:a05:6402:358:: with SMTP id r24mr4278540edw.69.1624360902299;
        Tue, 22 Jun 2021 04:21:42 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n2sm11987416edi.32.2021.06.22.04.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 04:21:41 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 18/19] x264: upgrade to latest revision
Date: Tue, 22 Jun 2021 13:21:25 +0200
Message-Id: <20210622112126.2026646-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622112126.2026646-1-alex.kanavin@gmail.com>
References: <20210622112126.2026646-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-multimedia/x264/x264_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 81354a8fd3..902396e4bf 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/mirror/x264;branch=stable \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "55d517bc4569272a2c9a367a4106c234aba2ffbc"
+SRCREV = "5db6aa6cab1b146e07b60cc1736a01f21da01154"
 
 PV = "r3039+git${SRCPV}"
 
-- 
2.31.1

