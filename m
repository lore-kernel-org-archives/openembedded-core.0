Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69522CCA47B
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 04:37:09 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.3971.1657773416725024620
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=A4mK/Hnp;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id p9so1401826pjd.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yOcCZmajd0TC8hH1xVyHkvq7Iu54qWlNYCsUmJoNiU8=;
        b=A4mK/HnpzRg9AlpPpVPTa8KGbyGtdkRvOgaVDVCtmdZW5B1Hy0km+xKzkG000DC14J
         iVeYBB5j/25Ieq/ZnhqF2SZr6KvXhXMTasy15Si9fFi/FN5jgx6MMfsFkuB5TRfBcZKu
         dQj29uk/aiMifEQlTagbcczoZTUiaraD+wh7821QHXY2QtlywIVaUXmynblPA7ZuXR9x
         JWrEi/PNehT+ydBSchNgthxsgbnFiktu5x2oT0vdNUH2qffkF3n3FIcnnfpOzkG2wvPr
         H2Jf0NiIOtm5qYEQz5rB1h+OnZX5+5Wk2F0DQCjYzYcvoWK+UMQI8Yr5fzPOtrG5qBul
         ZR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yOcCZmajd0TC8hH1xVyHkvq7Iu54qWlNYCsUmJoNiU8=;
        b=G4Pm2sytABA+S8lhFn/ZKamzSg/9DFu2atzizM804IwJhMxpVvVoXQp7eZiOczgahq
         e4p2sB4xL/psQ00UiYq5QyfvCE2m9HMkCKVNsIppkwHx4mLOjbXKPNw1UzR+p4Oysy7E
         cDnsTIjHsub+X3tetovpW8ot8HvB+B64XC4xt0SvZYUJPCYAmc0cje+XHQl7u8kaa0Hy
         BtiGu7/g4q2o+C2ROl8lttugztNePhwgYykqhI5Mojtqxn4INJ9iUvfIVNDCP18WB4R4
         Vjh2iG/UV03vKlMqgNpwpv1KpWtwYeLkYQkMqGo7QZ4bR/lTFISL3nuIQrTG5osB3Dg4
         744A==
X-Gm-Message-State: AJIora9rtS/tFUR7UOYLtTOgWHPEUoA3VhxIpTnRuMlBpc99tzKr3WuN
	Yu/3KHgQJDUwii7ePPa4Ordal4W4mj7+AxKU
X-Google-Smtp-Source: 
 AGRyM1vnVtDFS4sK+fAl71kqaK+5G98msScH4t0YWuIaw9Jdr+nA1SpBjbFBOnZMHXVKg2Ja2IpGeA==
X-Received: by 2002:a17:90b:268f:b0:1ef:ba7e:3fe4 with SMTP id
 pl15-20020a17090b268f00b001efba7e3fe4mr7782980pjb.23.1657773420045;
        Wed, 13 Jul 2022 21:37:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f6-20020aa79d86000000b0050dc762819bsm411320pfq.117.2022.07.13.21.36.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 21:36:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/27] gstreamer1.0-python: upgrade 1.20.2 ->
 1.20.3
Date: Wed, 13 Jul 2022 18:35:41 -1000
Message-Id: 
 <05f62a8fbbff52f394192944855ed4f4dca378cc.1657772638.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657772638.git.steve@sakoman.com>
References: <cover.1657772638.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 04:37:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168018

From: wangmy <wangmy@fujitsu.com>

No changes from version 1.20.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4adb5263d31f6b23a9219b590d260ad59b64d270)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...reamer1.0-python_1.20.2.bb => gstreamer1.0-python_1.20.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.20.2.bb => gstreamer1.0-python_1.20.3.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.3.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.3.bb
index 34bc4bf4f4..57026ba73b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.3.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "853ea35a1088c762fb703e5aea9c30031a19222b59786b6599956e154620fa2f"
+SRC_URI[sha256sum] = "db348120eae955b8cc4de3560a7ea06e36d6e1ddbaa99a7ad96b59846601cfdc"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.25.1


