Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.25160.1591602506533812321
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aFlne6Gi;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id l1so12572553ede.11
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RWt3npGoMmOQiSS+mcUdyy9UNuiS5SFWbPu/ySGBb7k=;
        b=aFlne6Gi+2Q0ZvKS9InabJur6KhxdZqLDFPuvq3v5RhF8FbVxfm6p3t+iZglA8oNom
         BXzU74to2usa7QkbXwgRhwj+srU3hQRQM4k64Hl0N0pYuzILIGgR2C+OuMv16JdShSQk
         65XwuyGib8Hwdv64nbR6ub5eUOWL3kKj1VdgTPYbTP5M7dTmi+ptV6Ye8TdLhMJWYhhy
         DTVc9Km2ndiEEwV8zVfK0t7NLTNEEa6FfZbAmklPNV/Z3NeeVutcV1hNWogNyEPDLMfn
         5TFVDWZ4VHwMSpkuQc23nyQu78rdKYi11O7rkmG2pZzKQPCQ9kwBEukM8m3z0Z31OUZK
         cxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RWt3npGoMmOQiSS+mcUdyy9UNuiS5SFWbPu/ySGBb7k=;
        b=GKcSgV8TrhG686QiJBHpHk/rFVKkVKh5Vsj2jDJ3oXOjhZ7gHvog3qqgzJKShQ/fSp
         3NkbH7yFSbovW7H9u2ZCPjXmwfvHZwd0eorUJg36SmmXceuYwpkLyRGMackzoVkCFtpI
         fQIao9k62EUw0comQ303ExhFXtsBY8gz3Vpa/05hccKJiQGk87JNYJu7TryzKCZnvwGQ
         M+wwCa/B7HrsbpHxVhUU/DQWSemhDjTq0CIlr9WOhSEtoCqFUL3YXMjEy3COj9iaOGUA
         3mFc7QZm3kip0iD/z/FOREeFCN8B3nIVLGuY+DJM4DnO033wNLRzkpME3gkVuTeAfD3c
         vToQ==
X-Gm-Message-State: AOAM533X6hYOelGZbLIf28lY3ke2vU5InI60jb4jsDG/j3f8uF56L2eV
	bkAyqOIuX0wXraXqPDoEtaTnF9YJF7s=
X-Google-Smtp-Source: ABdhPJydquOpHSF87A9v2fN4LP9wvAv5vG1NDErnr2GO7EFwjlpFfQ/Ib+edYUfFegk97F1ABJxflg==
X-Received: by 2002:a05:6402:129a:: with SMTP id w26mr21421982edv.41.1591602504859;
        Mon, 08 Jun 2020 00:48:24 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:24 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/42] msmtp: upgrade 1.8.10 -> 1.8.11
Date: Mon,  8 Jun 2020 09:46:30 +0200
Message-Id: <20200608074659.7051-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../msmtp/{msmtp_1.8.10.bb => msmtp_1.8.11.bb}                 | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.10.bb => msmtp_1.8.11.bb} (86%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.10.bb b/meta/recipes-extended/msmtp/msmtp_1.8.11.bb
similarity index 86%
rename from meta/recipes-extended/msmtp/msmtp_1.8.10.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.11.bb
index 42cf6309e9..804ed59b4e 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.10.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.11.bb
@@ -11,8 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[md5sum] = "168430e48f351b5a157ad930d7db3ecc"
-SRC_URI[sha256sum] = "caba7f39d19df7a31782fe7336dd640c61ea33b92f987bd5423bca9683482f10"
+SRC_URI[sha256sum] = "f25f0fa177ce9e0ad65c127e790a37f35fb64fee9e33d90345844c5c86780e60"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.26.2

