Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000DFC4743F
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:42 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web08.30491.1649039474529559565
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 19:31:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=JdD6KeAe;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id t13so7147526pgn.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 19:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LQtXBVvl3NPmX2JKzQL0Q9OXlMCnmzs3Z/8+8EHUdCw=;
        b=JdD6KeAeVtdg3blantKrUaqSU7JeYWRcrM1fB8TM00TMvo49PCHcs7z0NVgelaYdzo
         keDYIuBf8UFVHkBCS+PI8DOedYkF7Ue4d5aTIlJa4/4Kra+pI0EcXYcfHKSTUKa7yEN9
         5UeoJcYpomH61Ofzw6+ReiG6v+n8XPQ6ZY2Zpb/U/7oBKJ8pSosURzXHV6Ls4p2Mc1dY
         rpAy6Gcqc4suLSOr2H6Fly0b63VFALJDhvDo5gK8LXiiBKGUYbFwYYbCwiffJWXD6NMQ
         646CJpNgsylITT12078q556z/qptW2ZYTtnB/bGn14UTTMVtnapedKVTOoBudiFwkO2D
         9b1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LQtXBVvl3NPmX2JKzQL0Q9OXlMCnmzs3Z/8+8EHUdCw=;
        b=g9BfEBd4eCXKRyelyCObZHLULmBcjVCb1uBvqkLgYtiS/Yq7AvQAjU4ESKwT49ExAn
         Aqu7bNe/MfpLuuSBNmXqWBtYeBi+rELjIED2hQc/bpIhg4Zr5E+gH4Aax7JH9hiQooX7
         xQYwRZYBRZSt0FJVyneRAhCBX5lJc5vuURJA0m9y5EdL9sm5ubFfPUglahPz7sWI6sM8
         dPPpNQYjwFFk96azzwxOafJHvLLobOKMujx/VnTR0fvtJXNtOtcF1kCP5iN4iUL7LNdh
         25aKAbGpeRX+Fde/FHRtKMxio/DD/2eQTeGCTkw9fSxr19VyZ6uS6OnNjQShFw0G6cmb
         H+PA==
X-Gm-Message-State: AOAM531u76su0UrYJjHDw9KXP2tKETxmrrQ8A9fU2KsaGJDzV0/dl0AC
	+SLELS+I6q1D/Qk4Z7WxD33Vnu3bDFgZjaGMmjA=
X-Google-Smtp-Source: 
 ABdhPJywS6klqQyS9SunQogrCVwJk/6QgAGovMhOarXQ24qpUsm+GEJenQ5dh7l5CQ7ssvmDTSWSxQ==
X-Received: by 2002:a63:2b0d:0:b0:386:322:f05c with SMTP id
 r13-20020a632b0d000000b003860322f05cmr24482730pgr.11.1649039473606;
        Sun, 03 Apr 2022 19:31:13 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p26-20020a63951a000000b003826aff3e41sm8471117pgd.33.2022.04.03.19.31.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 19:31:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/8] python3-jinja2: Correct HOMEPAGE
Date: Sun,  3 Apr 2022 16:30:28 -1000
Message-Id: 
 <b9f897609db29279a70238620e3d2ff57317d952.1649026624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649026624.git.steve@sakoman.com>
References: <cover.1649026624.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163979

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 261778c1e3665b34c0d4e49bda63b520d5335587)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3-jinja2_2.11.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb b/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
index dbdf563f87..9f054c6024 100644
--- a/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Python Jinja2: A small but fast and easy to use stand-alone template engine written in pure python."
-HOMEPAGE = "https://pypi.org/project/Jinja/"
+HOMEPAGE = "https://pypi.org/project/Jinja2/"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
-- 
2.25.1


