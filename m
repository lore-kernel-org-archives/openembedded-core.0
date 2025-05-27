Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84DA3C54F30
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 15:40:03 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.55208.1748360400241207978
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 08:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VW28AYPQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b26d7ddbfd7so2982844a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 08:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748360399; x=1748965199; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iFclrlUSWxA2sMWe1nLubE9zot8URTJoh9Rk3bl4iUg=;
        b=VW28AYPQLKcmDXamiJDwGs5DgyAQ0NKnUl/6/vbn7XWbmnO559QI4sfchiSQdY9bOF
         pv2ObsBHu3BldA5/f6GxUwbkvljg4lJlZZGYZT8CWlvlGE7AsZarxwjwYBCC0dowZfOC
         VBNZJ3zyOPz8AdGPtG5aYna3sYY8aj1yRKe++LCK2woJ0VzJLExYRoYZ3JOZu37qHL28
         Rzv8m6Yn8M0/doMxKFOHghWPkkmKW/HdGe4+G1J3PdcyEVpD/D8s6+ImjLMxWLA6KpTh
         pCsQCwuHvB5Cm09vm5ImTC+an1bPvXMtRCoUQgR7n5Pg0DN8+2x1p7mmHmyI4nTaNYuj
         rKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748360399; x=1748965199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iFclrlUSWxA2sMWe1nLubE9zot8URTJoh9Rk3bl4iUg=;
        b=i2OOs3phmNAvbpHTjgJ6bIUEgG5dJqL8x1Z9IhgI/w5dT3ukbd5XarFyZ/h8ClKV+V
         Pi5R7PCTnGfn8xR80SpxdOV+PI/d7tbf/bbUhe/RHdU1r4xc+qyQcpBCuF5zQqDmbqBM
         dGXZSefbVKBzxOjWmzGHI6IU2U4ANVZugioekH1VrefXI4546QzZx9Rml5cw25vMZrL6
         hGPlVXPWFBraF1YcamYb73bGdI0fOEQMK37yh56/6oHTApA5quhq1ihRpVBujIp5MtoP
         2PsVbpbz1N8dOVvx29OIBH+6EFOzoA7uSWF8s0mQa37Ph8fZjGjPF8oPF+/1KjCfy6Xf
         Ooaw==
X-Gm-Message-State: AOJu0Yz9ZCnRfF0egRBhf+GWnhXsr3NlGCgewCQYuCq+0wMthMSZgz74
	QxLkYLHeAmtFhFDwIVK5qShrTd//kB1rzruujgf9cgdw6Kq5ccsl2QP3a6AsDXtM
X-Gm-Gg: ASbGncuvRVbScS8RRKMM1X2PXTE+C9h+Hlnx1aWG4fidkjsJvIGnmQ40+zl76YsJTxK
	JZa62eIAGvVjr7AZAIruFpqC4KXoYfzPDe8qKs/86XTGwUZRanWPLfnZ7xZ9NwCp6D7HCBtGrCf
	xWBQIg8NookgNsXndofaJLO+oTQlXOnj0f0l+zgnfH2e5WxJdz42agCs8UB94jaYV0RKOIIdGfM
	pug66PQGPKWcEHU0YiCAfRb4hnP/mNIxt8rcx3L93ton6TNuZmlkNdOWRL0ADtIKwQAkYp9Y715
	EAIjuUufgF42IJnTgQUiFn5KkITWOeqvnBrToYa1lfI=
X-Google-Smtp-Source: AGHT+IEN0vcImMHd3L1MGfoTyGq9NAS1pQHE4B/5aYQsoNEHh7tuyKmQ0EL78vZeLSYAv0G4Ade7PQ==
X-Received: by 2002:a17:90b:48c4:b0:311:ad7f:329f with SMTP id 98e67ed59e1d1-311ad7f3682mr4348472a91.31.1748360399076;
        Tue, 27 May 2025 08:39:59 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::deb9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f364907d4sm14378453a91.24.2025.05.27.08.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 08:39:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] mesa-gl: Remove osmesa dependency
Date: Tue, 27 May 2025 08:39:56 -0700
Message-ID: <20250527153956.1870056-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 15:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217312

osmesa has been removed from recently upgrade mesa recipes
remove it from the fallback for non-x11 systems

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-gl.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl.bb b/meta/recipes-graphics/mesa/mesa-gl.bb
index ca160f1bfce..680fda1be5c 100644
--- a/meta/recipes-graphics/mesa/mesa-gl.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl.bb
@@ -10,6 +10,6 @@ TARGET_CFLAGS = "-I${STAGING_INCDIR}/drm"
 
 # At least one DRI rendering engine is required to build mesa.
 # When no X11 is available, use osmesa for the rendering engine.
-PACKAGECONFIG ??= "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"
-PACKAGECONFIG:class-target = "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"
+PACKAGECONFIG ??= "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG:class-target = "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 

