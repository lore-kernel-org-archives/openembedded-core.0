Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web08.14445.1625510588553573435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 11:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Isi4T8Fl;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id l24so24688781edr.11
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 11:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ayPAZXb1BKM5cmUeyb1ne8ZQdJuqrjQ1ZemUkf8CxRA=;
        b=Isi4T8FlbpnTSXnU7oXAjIPunoSJ8fpwp7tV7VBqRt5RSQ/YfLDP4fn18m6HiUZcg5
         txbEeHOClvam8Ba3KYfLJUBU1Mw8zbsIXAxYSYK4tz8w1MK7nOvKq4+foi6bzOr8hOvI
         jMsmLYv3HAZg86sdfMqKTm0wk1Ywb0l5EdTNdI988+td1DJmVxc+hVddfJ2+G0WO5EFM
         /6uxqLprye1Zo4lSy1uMRLCtdZyOyGmq56Dc4IUIQo8Is4f/+aOnLFr8ou5h+HG4x+pd
         mqIl3X6McLP7L9eBDDagHK1FMG0YY8hW3UUsQ3zVLM4CaXpTfqc5PJ4+7w5Wqyy5v9xe
         6gNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ayPAZXb1BKM5cmUeyb1ne8ZQdJuqrjQ1ZemUkf8CxRA=;
        b=P9CsWCRql8wTJvWZ5mNbBBA9Qi8xep6MKnFKGXVzRMcflt7VrrTfBC1CwJ7qHBnnl9
         Joc+QMFYiRjIl19n+akWIJvvWLxFlVfG22LjHy+iMe6xfTbU82KF/h6i192MTpYkgROk
         FphOosUjdZGIdkAOQeX9qWpKheP1QW6Xq307qu8Q+/SspJf1iNMc3zDfmGyfU0dChPwm
         X3MZ1AaQnhlFL6sjBkgozTKWmDwuZLyTSzBi65bUP0mW/94CCSWAkjb2B1Jr8LjRePvA
         4zgLorC9U39n83wqum4UYXkJzqIpJtZ9Bn0912pfO0sKJeSs7Fan0J7hZWFuAHuzeHbA
         WcoQ==
X-Gm-Message-State: AOAM5308TBxYlD6cp0Xkp3yKBp3VOjWCcy6qnN7L4bGRoR/si3m6M9gq
	TKCqZSnFiuk2HibbBGXArepCJFVUI2c=
X-Google-Smtp-Source: ABdhPJySyOSbdufo88crG0qli7sT7LWSdGizYaCZ/kNqXHuO8rlp6lsEuDU7uctAg/6k1hgjtuhJGg==
X-Received: by 2002:a05:6402:90a:: with SMTP id g10mr17768433edz.365.1625510586921;
        Mon, 05 Jul 2021 11:43:06 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f3d403323b289d7a4d4d153.dip0.t-ipconnect.de. [2003:f0:7f3d:4033:23b2:89d7:a4d4:d153])
        by smtp.gmail.com with ESMTPSA id ec40sm5872578edb.57.2021.07.05.11.43.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 11:43:06 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] libdrm: upgrade 2.4.106 -> 2.4.107
Date: Mon,  5 Jul 2021 20:42:57 +0200
Message-Id: <20210705184259.2125023-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../drm/{libdrm_2.4.106.bb => libdrm_2.4.107.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.106.bb => libdrm_2.4.107.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.106.bb b/meta/recipes-graphics/drm/libdrm_2.4.107.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.106.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.107.bb
index 2f63489021..1dd07046f7 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.106.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.107.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "92d8ac54429b171e087e61c2894dc5399fe6a549b1fbba09fa6a3cb9d4e57bd4"
+SRC_URI[sha256sum] = "c554cef03b033636a975543eab363cc19081cb464595d3da1ec129f87370f888"
 
 inherit meson pkgconfig manpages
 
-- 
2.31.1

