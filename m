Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.13827.1629891517205076532
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 04:38:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fDdVosKw;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id x2-20020a1c7c02000000b002e6f1f69a1eso4055323wmc.5
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 04:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9pnrhxasXdN17J0J4PB6aKgh/r+PoIS93LYYMRc0Xwk=;
        b=fDdVosKw/Xp2eJKHomoi5GJmXU7uarrtDX8xd3vSpIvbC6n67TTpYTEEx2fAsp/+p6
         T+itueLnyxXAKLMjY3NJ1n1fCJMpUGwhtQ2T4YyAnk0tp94OPDwmg9c18SwBmcM1d/fD
         7Zg9D3iG16Cw+du+NrsixMJhmFFJ7uE8qIod4GQ1vmyU4OjkPWQlAxmGLO9RW7MQqvrE
         c6eYQrZlePy2hwz3DIGvuVQdbLy1tunDjSRJysF33sXylAg2gJUvr1ky73ivJxBM5QCa
         arefyhVUjyPgWd3GSe34zAnhCxrSWYU5drvAc/mhvuAaPwXWw0qcR4N685a3UYdI39M0
         cPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9pnrhxasXdN17J0J4PB6aKgh/r+PoIS93LYYMRc0Xwk=;
        b=db3f5HN8146zQwybHpUrru/nmVVqiAd23ltlvUmemMOH7JSNr391oHiFD//M76wDww
         q7bL1PhqtOBLFntJ5Rv392CeEtBj10wlpE8k+ikMdO6SLII8Ji1BW1OsOjR0QcV2Xm3d
         01BYt/VlwIg7SDaBwte+bwPxgLciyrXHSmEgnkVWAJgcwGzSZ2/Vu2RlxrzblJYpVCzw
         omWXPdsta880XVbRCYZFLJ4rgRoxc1HTiI9l7YRDTuL1h+eIPsxERBVEHkazLaRLvQ8S
         Q/NuLATFMyNBaGWuqbLBGVDQD7GXMabKFjdbd4yubV+LkcGiySFGlDx5+PJvnq9v9lQl
         GJIA==
X-Gm-Message-State: AOAM530xelm3+oBeI6H1Eg+rfOjjJBVVlWMucBU2lKJqhf42AEaNoTYD
	RfwK9gOv/RjCyEd5CWQR8NUqBpeFbij6BQ==
X-Google-Smtp-Source: ABdhPJzHnliTok3S/wOKyBFOU7JUY2UAnclb+CCbX6YbJyo6Vn97XOIOTQxFGl+gGhUipe8UHaliZg==
X-Received: by 2002:a1c:98d8:: with SMTP id a207mr8638428wme.16.1629891515882;
        Wed, 25 Aug 2021 04:38:35 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id z17sm20790217wrr.66.2021.08.25.04.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 04:38:35 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/16] harfbuzz: upgrade 2.8.2 -> 2.9.0
Date: Wed, 25 Aug 2021 13:38:04 +0200
Message-Id: <20210825113804.779395-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825113804.779395-1-alex.kanavin@gmail.com>
References: <20210825113804.779395-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../harfbuzz/{harfbuzz_2.8.2.bb => harfbuzz_2.9.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_2.8.2.bb => harfbuzz_2.9.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.9.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_2.9.0.bb
index 48b0c7724a..bc91a8c03c 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.9.0.bb
@@ -12,7 +12,7 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d58461395ce28b9dc03903254374dd70c38c8c28c5046db123c08f7ab9417be7"
+SRC_URI[sha256sum] = "3e1c2e1d2c65d56364fd16d1c41a06b2a35795496f78dfff635c2b7414b54c5a"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
 
-- 
2.31.1

