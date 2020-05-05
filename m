Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.7058.1588683725460450313
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 06:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jeSG9UHm;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id y24so2231977wma.4
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 06:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L/e+0g2Lx6y3lOUfS7ZhKx8bABRU20XbfHnwU0FpIgc=;
        b=jeSG9UHm9r2jsvG1QDi6V0oOaeda8OAfrT8b+G38yQH+cLZgYC8ipKpRyOZeFZjRcS
         39GU7ufTMfkIqX0qBjIyFAIMqZ1l0/D8E4vzu8mC7M9JVtVvjGUkGMsqkJL6QhkHc1Rl
         kXWcMdsCXt1bONXYFxpZWGM8bmhLhn51PTfDZkSAKJFvXbLtPcFMfbDrUNaIuV/YPN7C
         n7LeL1px3ynminSb9qkPHKU8hH87bD2fhXGYnZzxIsvt2PVSDNweTHsKXTRy6kB3Igj4
         fUCkhRoSzvA1fUFhzO71JTlj4pCYzbxONORVKpK5BquupP2QCfrmvMIJzorPVBEmZi9I
         utIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L/e+0g2Lx6y3lOUfS7ZhKx8bABRU20XbfHnwU0FpIgc=;
        b=GJATS0OBWAEbzaaGGy8PamW6KSQtbB8aloEp/wdnFO90pKiWUN+ZO9ga68WlJdMtI7
         xCB5HlM8CpfBJTs+yeJEEx7+CpKERRAPpYZ/ZwItwXKhkBXBMwspzpVtki9CzG9IyKbg
         wGpZumjvcKQKRdMzgMvUJ0UXGb/IqdEEucAErKWdrLycZefgDrIEPPduNrPufodJUGwT
         B6ITPOzDXOfIyTcdSRRMnUuztOFjE3+CHj0sam/q0UbqptvvX8/6NSv9QVED/ZQKfZpl
         qLNuJZd73Wm5FK196J/ZrP4x8o4ju/gQUQLpNYljykCVUcZnVYeF5cGORh1kzZCRUTh2
         hBNQ==
X-Gm-Message-State: AGi0PubyX6D0OmjsWLKNpVpguo92gt6AT1zq9/LMzmSSiXXeX5CfCapj
	wkvFDIGMdMAw3CQf6jLmcR0jS26k
X-Google-Smtp-Source: APiQypLQmF4lsZ5n6o9Cz79LIODOniFKSQskp0zM8N3AKYHS/isUWiWbvXUXB0b4z7a5lAXXyfMNAA==
X-Received: by 2002:a1c:750a:: with SMTP id o10mr3173352wmc.161.1588683723380;
        Tue, 05 May 2020 06:02:03 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id h16sm3388113wrw.36.2020.05.05.06.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 06:02:02 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/24] libinput: update 1.15.2 -> 1.15.5
Date: Tue,  5 May 2020 15:01:11 +0200
Message-Id: <20200505130133.24930-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200505130133.24930-1-alex.kanavin@gmail.com>
References: <20200505130133.24930-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../wayland/{libinput_1.15.2.bb => libinput_1.15.5.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.15.2.bb => libinput_1.15.5.bb} (92%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.15.2.bb b/meta/recipes-graphics/wayland/libinput_1.15.5.bb
similarity index 92%
rename from meta/recipes-graphics/wayland/libinput_1.15.2.bb
rename to meta/recipes-graphics/wayland/libinput_1.15.5.bb
index fd236f75dd..e56f181bf5 100644
--- a/meta/recipes-graphics/wayland/libinput_1.15.2.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.15.5.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[md5sum] = "eb6bd2907ad33d53954d70dfb881a643"
-SRC_URI[sha256sum] = "971c3fbfb624f95c911adeb2803c372e4e3647d1b98f278f660051f834597747"
+SRC_URI[md5sum] = "c9a1b15bb932eaf22f840efe4c3f84eb"
+SRC_URI[sha256sum] = "a90efc8f423c3094f2f9f372fb92381b2f3aad62e8b5882a8abe333aa8249c97"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.26.1

