Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.349.1587835718785856459
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 10:28:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rDzJ5U0j;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id t14so15392241wrw.12
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 10:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LP1rIxg83pI5seHxgMhzmpgCJcM/EqRof32unv0ar8E=;
        b=rDzJ5U0jFdTcdvfG9jTU9aiwfVab5lYpBrq3uKn5F7LsFAM9MpVaMTv/anDzn+KlTs
         Q/ISrQE/D9Bn0nGmHoyFDEptrdTuMlgu6Q2D4ulHU01oEqcueSAFvKsHATAj7O6eLxvt
         WjXmy9tQIYrr7rURiimlHI9rE9qE7eVo83C1BrWJl7cPlRPYJvx6y34lxvkXBrLuniSU
         s/eXAbgfDjHlV3NRPaSi013MgJWP5FywXIwPvTJNXIkZ2L/C6sNMS7RqszfZWApot8UY
         rU5qUZutzdWYleZ+FIo/8c0AyRV0ZHNQXRefjWLb58iNh4h37irqbqT4XC54Cq0sKfQU
         sCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LP1rIxg83pI5seHxgMhzmpgCJcM/EqRof32unv0ar8E=;
        b=cWXBDQN7eCOFt4wDGrrjyRIGIlRBjErILlxuXSHHNMKKSL52bGFYLzP/FR3MuqBGLQ
         Y1/bP5fK+SH2cJCt6cXyBawcN6JRS3vZ87jsXzGfLy0uX5zQ7MMo1D2Pi6YAPRanzFQt
         2yfNHuRFYTmkYY0lJtL+p1dzi6MbjdZIsuMIqPwbuGrRBE2+K6f9E+ahCrH0yPJdEoF0
         jA9YAg0UzruBnyzKT6hlZknCoUbmkP06sZk0EieKnwDlN9BO+KsNTeBcUCzFZvmfAhyQ
         SeQ85G23AN0YTq11mMl64Anv1tHcmSYmGNhe/KcBXRYvXMPDH6rBp9Mk8/bLb0ILTI0h
         xTVA==
X-Gm-Message-State: AGi0PuYTnuUDwN6jNjglIpJGm029AvJS/8kUloVt80yQ3hpVy6vHPgCQ
	9rn58Zh6MOcvwsuxDfjycp4PiME5
X-Google-Smtp-Source: APiQypIdM7GZa/BzqwvwgVGAo1h10O1rw7iYeiA5h2eIOwOrcQnkTZIl8Gcos2TUnhYW7qNa9TUknQ==
X-Received: by 2002:a5d:6689:: with SMTP id l9mr17543767wru.261.1587835717198;
        Sat, 25 Apr 2020 10:28:37 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id g25sm7751253wmh.24.2020.04.25.10.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 10:28:36 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/15] maintainers.inc: add entries for cython and pyparsing
Date: Sat, 25 Apr 2020 19:28:11 +0200
Message-Id: <20200425172814.27370-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200425172814.27370-1-alex.kanavin@gmail.com>
References: <20200425172814.27370-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 25c919b532..f7e4dac6f6 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -574,6 +574,7 @@ RECIPE_MAINTAINER_pn-pulseaudio-client-conf-sato = "Tanu Kaskinen <tanuk@iki.fi>
 RECIPE_MAINTAINER_pn-puzzles = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-python3 = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-async = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-cython = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-dbus = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-docutils = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-extras = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
@@ -590,6 +591,7 @@ RECIPE_MAINTAINER_pn-python3-pip = "Oleksandr Kravchuk <open.source@oleksandr-kr
 RECIPE_MAINTAINER_pn-python3-pycairo = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-pygments = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-pygobject = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-pyparsing = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-scons = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-scons-native = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-- 
2.26.1

