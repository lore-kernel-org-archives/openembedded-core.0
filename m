Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web12.20559.1621847645263621498
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 02:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eEXau4VB;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id t3so31048270edc.7
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 02:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W2R+gNmMAdg8Ucvy6RyFoBc8F4KO1Y9xanql/CCumKk=;
        b=eEXau4VBgHdvDErLbhwz1TT80WpFPiB+SxJhiO1jWFWg04qCfTHrSgvsO6X9aUUYCP
         LLiw9J7r+tZMlt+4yryZhKm4aR24yp1H1zCS/y4iRunALZtHdW4EFnWU36qR7jJRN+3D
         bmiRUed03PGFgC4b+bUhvxJE7f6gS11WNRFgP7/lByg8OdE3LeuTh/bKzjAE35X7U5bf
         FnIP9Tu2bYQnQa4S1b6yS6etXj17mCmz0pUsfwWnjfhdwffZg5GQQwHF7o2pPGUI5xM+
         wDGsQL0ZmznX3NIwMBF5CiuWXwDe8TaYP/v5eF4SxmaIb+j7Brhj38ypMWOEOYDEn8bu
         qRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W2R+gNmMAdg8Ucvy6RyFoBc8F4KO1Y9xanql/CCumKk=;
        b=HY3LL26q/gFT6VmK/8od4yLqBidwofykr7RtWYZjciBmUF6NUYnCv5imxibapjWKKn
         3dW/bT19cjyfPeFAvVJSiMWvTD2rQKcLGk1xsRBRVlROaYgxeivnFO4GEpXjYNpHqILy
         7yU+ZxB9zrJcsaTWFmNOgKqIIM7rYLgUHsrAjCFfL9Tbs3vzIwukfs0JlYv+3J0kSeMY
         RhJjESvkm2w81tRc00/UM8g49/yC5PKBzqtCD6u0ZpOuS9r0e7cfei4tIw3qU60N0QSs
         O4ZzNKxApdjTOQ1X+uvFTKi3RmksjXuLn4Gw7eiOF7rXbmU/NJNMxtENr5N3U6kFCEPa
         igTw==
X-Gm-Message-State: AOAM532iA63Mtp1y3dg4Ud9MvjRZoFntHEpUbHnCxNYbi7r6mjg5Q6xz
	NVqsWBgmVD78zAMcnVt+ayJAqbW3rlg=
X-Google-Smtp-Source: ABdhPJyYlB5SrDEVQkWNhIxx8sY/kG7JOsWJIY11iQmU8YehI54FnHuAbsdkbuuolzsw3DAv0Lzn0w==
X-Received: by 2002:a05:6402:3587:: with SMTP id y7mr23667194edc.360.1621847643528;
        Mon, 24 May 2021 02:14:03 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id h9sm8673490ede.93.2021.05.24.02.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 02:14:03 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/21] gdk-pixbuf: update a patch status
Date: Mon, 24 May 2021 11:13:27 +0200
Message-Id: <20210524091347.419253-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../gdk-pixbuf/0001-Add-use_prebuilt_tools-option.patch         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Add-use_prebuilt_tools-option.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Add-use_prebuilt_tools-option.patch
index dc8d6ce724..a8206a4507 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Add-use_prebuilt_tools-option.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Add-use_prebuilt_tools-option.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Add use_prebuilt_tools option
 This allows using the gdk-pixbuf tools from the host to
 build and install tests in a cross-compile scenarion.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/merge_requests/119]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
-- 
2.31.1

