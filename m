Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E38C83F13
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 15:39:16 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.10494.1693064356486711431
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Aug 2023 08:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=HlVuTn8M;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-68a3082c771so1291994b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 08:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1693064355; x=1693669155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eUoK2EGGD6nn80Fe219q+SI0bDUBSvcWKZxk9q52pxo=;
        b=HlVuTn8M250wnS3Bj5kTNV2FHjB9+9zUIcs+AdBXxhY4zZN7vAF00ccQsK/sbcWCQH
         GKRDmjkj1yj9FH/pdbh/kwsmNgC7kfSpKblMtX4TMyXweM4kGR6i6Ba+JJyCm0lQ6tVq
         ApuM7kCdCJ7dRrTVI4jk2KL5hFvaehtwg3NDIEkURVP5WhjuVc3I+iCS9AKY+YF5k3hx
         PWTvRhtlsxYO9kiqOzah4emymlzqDYxMzJm4nt/zMyLOjaqMsQH0WjYfMVyZsyDss6WF
         u7khyXRLxQpez1pxg9rT9E+LSbKez4+RWzU++OHZb2oXdWzwfqArtiJT9BIAk+rT2pMi
         6PrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693064355; x=1693669155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eUoK2EGGD6nn80Fe219q+SI0bDUBSvcWKZxk9q52pxo=;
        b=l3WylEP2hxclJNEoPti1sqlRQHtba1b8INMTIcVVGn0olftVkNIhWEskvH+6EYgtHQ
         xq+mroPDtwjTcdNnObnuOJrXTMLJXh52mgcM26J0JXAEUTVRpCrob7HzX2EGFDjYIi8d
         KsIKurAoRB9tpQgJ2ojG3U2ZydC8EtlHulukm14UswifGn9ZW8za2DYw8XJLPeyIXET+
         mFxw06dLDLYmtxt6BNZgZIZaoN282uLjtmK/vb+Y4c98PVVLYgvjV4UqGfK2nt9SnyMX
         3Nnn/BzG++emUWdklQK5tOMiScNZ0Dqkr9OiK1pEZzxS7CrqBCvjBrfadqnpkk/nFY4y
         Maew==
X-Gm-Message-State: AOJu0YzIjYnBDI+kJ9Zz0+WqSohz1EqU6CMbP7ZtaXxB7KPohNjEzAu1
	a6+eillL/27NPkX5ZKOfwtR+0thbCz6KpnfDd+g=
X-Google-Smtp-Source: AGHT+IEfWVq+HLhNNcqBy/0/tJRp5kS6klOMOFssSs/5wNKCOPMGigVhPc7qYAr/uh0XU7ZsZLKWDg==
X-Received: by 2002:a05:6a20:9185:b0:148:9ce9:2f2a with SMTP id v5-20020a056a20918500b001489ce92f2amr28931735pzd.8.1693064355552;
        Sat, 26 Aug 2023 08:39:15 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g25-20020aa78759000000b006732786b5f1sm3422430pfo.213.2023.08.26.08.39.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 08:39:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 10/20] gtk4: upgrade 4.10.4 -> 4.10.5
Date: Sat, 26 Aug 2023 05:38:41 -1000
Message-Id: <168bab3ea6a4581f320e2eb7360f6a98f256d3d6.1693064194.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693064194.git.steve@sakoman.com>
References: <cover.1693064194.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 15:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186754

From: Markus Volk <f_l_k@t-online.de>

Overview of Changes in 4.10.5, 05-08-2023
=========================================

* Fix ordering problems with filter model signals

* Avoid lingering resize cursors

* Fix alignment issues on sparc

* Fix a problem with CSS corner values

* Translation updates
 Brazilian Portuguese
 Czech
 Greek
 Spanish
 Vietnamese

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 99deaf528acdd8ef7031e251a821721191968644)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-gnome/gtk+/{gtk4_4.10.4.bb => gtk4_4.10.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.10.4.bb => gtk4_4.10.5.bb} (98%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb b/meta/recipes-gnome/gtk+/gtk4_4.10.5.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.10.4.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.10.5.bb
index 2d1e0e74a9..85fff6c61e 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.10.5.bb
@@ -37,7 +37,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7725400482e0685e28265e226c62847f4e73cfca9e9b416ac5838207f5377a24"
+SRC_URI[sha256sum] = "9bd5e437e41d48e3d6a224c336b0fd3fd490036dceb8956ed74b956369af609b"
 
 S = "${WORKDIR}/gtk-${PV}"
 
-- 
2.34.1


