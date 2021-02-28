Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.7680.1614526635683527655
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 07:37:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cgUx+s71;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id gt32so11997031ejc.6
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 07:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uJ+TQxeONhMSzxLnZSRX2SRhpmvLMN8gzKfuW8HHKvc=;
        b=cgUx+s71awV1Jt79FbH9YRSQa7gCFFt9EMeHLpYbo/np8fy6ta5iDp2+IGISP0P/Tr
         RWGMAuto8Ol/g9xWqpH5OkF6qmX2ItzfjMh6Xy1Vss6woxenglvp+3i7j6SIZo/N5jRg
         27/E/C4dHAhOvaStXFoK1jJABaMrCGOo5Zc6f+3nmkUNY5N5VnVt5+8094SeNgUTNW+U
         wclT83rnQiINgBrdEO9WreQ1Zugdc+Ej4E46+yA1G13cTVEeo3C2+akw65Q0+RE61sYk
         Gt7uE9S1gP1KaGzNLmC1kbkuQEYYXSi/QS2iWql3FvrohmuN8D8mH1CQlmVPDYFH4lTg
         Mosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uJ+TQxeONhMSzxLnZSRX2SRhpmvLMN8gzKfuW8HHKvc=;
        b=DYyGfOb0y5ktwN32YWQs7tl2TIlhqOgTxxVFZNdlNWUg0EnLsxLkN0uLziuGZThuWd
         F5WKspO1dwcnuoAecaxxGnhwh25lC311JdifU04yW9UPGd5Ax7GQrUyZ/pCD/LDog4+h
         aw2WZbsLpIc+2u+Saxav09ElUV2cWXs++DM67t0pLlFQW/6101GdP1nJfM2MmHtd47tL
         9lB+SMhwUikuchHE/J3XeTKi80oDxJa9qencuHs+rb3E69XMn/EC8As/in/9iy+hq6ds
         5SobSOXWkJ4ZKAWk92cROgLGniVu4PVfuV5xHfOjkejVoZatuuSPlK1yyuy5Yh+JjdiD
         NGUQ==
X-Gm-Message-State: AOAM530GAVhsxf6SzpzcdXDKbpMYuKevysFOn8o6evzWu72G7R0pPkcL
	+uuEdvFN7PLOgioLdLMLTojhn45+ix3STw==
X-Google-Smtp-Source: ABdhPJxb/Zl3/qpdt+pkhO+T3dWdukB1ZtaGc+idXAMNSS9iCKO68cHyDck9Lt4HoYycYPYK4QknPg==
X-Received: by 2002:a17:906:7150:: with SMTP id z16mr11704374ejj.103.1614526634177;
        Sun, 28 Feb 2021 07:37:14 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id b17sm10234780ejj.9.2021.02.28.07.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 07:37:13 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/24] dnf: upgrade 4.5.2 -> 4.6.0
Date: Sun, 28 Feb 2021 16:36:41 +0100
Message-Id: <20210228153702.498275-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210228153702.498275-1-alex.kanavin@gmail.com>
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/dnf/{dnf_4.5.2.bb => dnf_4.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.5.2.bb => dnf_4.6.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.5.2.bb b/meta/recipes-devtools/dnf/dnf_4.6.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.5.2.bb
rename to meta/recipes-devtools/dnf/dnf_4.6.0.bb
index c746dc30db..6651e64352 100644
--- a/meta/recipes-devtools/dnf/dnf_4.5.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.6.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0001-dnf-write-the-log-lock-to-root.patch \
            "
 
-SRCREV = "36a3ffaee4db76a7efe7d40f4e42ce679b6a6920"
+SRCREV = "c826d7db401ebf9b59b2fa74570a919e4af2673e"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.29.2

