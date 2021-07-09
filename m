Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web12.9636.1625830371205148647
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 09 Jul 2021 04:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AJbd6nUs;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: uvv.mail@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id b6so422526iln.12
        for <Openembedded-core@lists.openembedded.org>; Fri, 09 Jul 2021 04:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FIAy+YKj/LxATTUVTQLj1bzHaPd2wXIcZodejctvdvw=;
        b=AJbd6nUsVKAqT/Si2tS2J7hVDVRnjcWR+4Aw1yBudKU/tsPDi9QUDuryuCKYwFDMzY
         JquvMegQKOBSebDve1hGZnC2WHGGFcg4d3NsRd4x6dOzSAg9IqY9djbgf2oZUPUb57td
         VSOrdu3ZQUDTpHgEu8tkdwF0tZnwuuP4kysVzl2N+8lMmC1vuipovHVLrHrGSBUINV1T
         x9UUFAESOF4VUNo2eI52svSpqnY1lvdjWruryvkXb0L5sxSBK+SftZbkqSJS7pGoFHch
         pNyGg8gNxmvQK9IeeY4InaOjB8ptFvwMgecRB5dFwIlPOMBhx0CG+BCzwWm1wGGUIF/O
         eLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FIAy+YKj/LxATTUVTQLj1bzHaPd2wXIcZodejctvdvw=;
        b=FQNuqZWoVsChC5dEp6zHuZmKyeux5Mojv5c1nfLyWGd+xuaxW9RRC5OVaDoxBVQ0XZ
         H+ffwUP1QpeO8+Oy7U+ZDBFAfm3mrWz+zmuQzIlnE3AhmLTiIPoVokSgxXRnBfhEB5Z+
         Dkziyj9RB9ZJ6KCgxKInQ/zNpNd2M3QwHgI8/NFI/6XRi+SdG+iugUzzHMxcTww2FnEP
         D0wdjl91HeUNWrXqUmxWgTkDSB8+iVy2DQkFieQKyQ4l8Xjxin5D5mAFrXNJsEtGMZuX
         rVW4oLDx+NweDzPocHddG7oTNfUv/cqHe4JEx/wlC8GdnAkfJiR/DuSsxJRL+LOI1dq0
         EJyQ==
X-Gm-Message-State: AOAM531kA5y3j33Dc5Tv3t0UfSuqIZw0wmwvvEMoSkuo5B0EjPKEHNKn
	ERKIGlXAjOPP8OzDfBk2t9a81UGjMc6kuQ==
X-Google-Smtp-Source: ABdhPJx+1xVNwQa8iEQqegqYOmjXbI2/7/5vzDH7ocPlImtdRl2TICdmZWjlL4oNfhnhvzh4d7Dt3Q==
X-Received: by 2002:a92:874f:: with SMTP id d15mr9141850ilm.294.1625830370495;
        Fri, 09 Jul 2021 04:32:50 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([37.120.205.173])
        by smtp.gmail.com with ESMTPSA id q7sm2570463ilv.17.2021.07.09.04.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 04:32:50 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 5/8] systemd-machine-units: add bbappend for meta-selftest
Date: Fri,  9 Jul 2021 13:31:43 +0200
Message-Id: <20210709113146.69020-5-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210709113146.69020-1-uvv.mail@gmail.com>
References: <20210709113146.69020-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 .../systemd-machine-units/systemd-machine-units_%.bbappend      | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta-selftest/recipes-test/systemd-machine-units/systemd-machine-units_%.bbappend

diff --git a/meta-selftest/recipes-test/systemd-machine-units/systemd-machine-units_%.bbappend b/meta-selftest/recipes-test/systemd-machine-units/systemd-machine-units_%.bbappend
new file mode 100644
index 0000000000..205720982c
--- /dev/null
+++ b/meta-selftest/recipes-test/systemd-machine-units/systemd-machine-units_%.bbappend
@@ -0,0 +1,2 @@
+# This bbappend is used to alter the recipe using the test_recipe.inc file created by tests.
+include test_recipe.inc
-- 
2.28.0

