Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFB2C19F2C
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:47:48 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.54.1659106060653650020
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=w2kR97qo;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id
 f11-20020a17090a4a8b00b001f2f7e32d03so7332731pjh.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=F5PC2GUttMaN1WDlEZwbKMk4HDCC3U+FVzShq7eR7vk=;
        b=w2kR97qoCrbv1SsxqEw+ff07C8mCfqc7hyOwPe9pq9ooQumON2AVqSRQwhAF6Jje+D
         tpjSv9oTmZ0REHcpEkydn6kyaF6vsbBiDNatqLU89bZMktMeMaZJz5xyz0molgw2Bdzm
         b94dgAu3bXvEJivto3co0mJWtu4bAsj0vlsd38EnIsk9i9ZyP9+whPsx9XDcTMAqej3O
         FmzIxKLFlT+DvWAlQul0Dajt+YKog2nRCpD9PISjebxVjMKCzC4H62UVerPALU3eyizU
         ciNnQToCY38uoooOlOTA5FWwEVNg7ij3U/HkUJHmUWSbAYIb6toi75C7TTOTE2XN+3lA
         LG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F5PC2GUttMaN1WDlEZwbKMk4HDCC3U+FVzShq7eR7vk=;
        b=IR93dSsCIB1FGC8z1KS+TGHgnkPjixIk0HMoVFv9btYfIkev5y0Un56R3zJ6QbNocK
         XXvrqOiWG6g7D+fk+eMmUW6ne9NDC19C4TJ1BgQO1PaNekUDKCT0//JF64x92U5heKBx
         z2oyHyp9WjvCuha05yLYWVtyx1J2Ev+cRfXY8ZKdeFRqLvdjpz+pCk9Xqpf+RXdTN39R
         5ttD7NTDFNHJSs2ul8TO0Ry9UpHaj4c1GqfFQyKgyADarRlDT2kdxQA00oIMUQyp0dGc
         E0a+74BhWOIuBYudJU+NF7wgop0QwhxYfboD06YQ2BC+rtEzDksGx+kkXU9G1UItpcGE
         8i8w==
X-Gm-Message-State: ACgBeo0tA/jwERj7bcmHlRChaDqYKLd6qX/lmA0/HCj+pr3wvLjOYL2o
	0HRG4726o5Ql+w7Cmd5DNGebLz7i/uuQqXoz
X-Google-Smtp-Source: 
 AA6agR4+kRwbU71TnIT9RHND6pe0YWwev5RpThkIHsNGKJ7wbswaHhReTCps49rOL1rmL87j5XScKA==
X-Received: by 2002:a17:90b:1d09:b0:1f0:76f7:d147 with SMTP id
 on9-20020a17090b1d0900b001f076f7d147mr4437299pjb.86.1659106059473;
        Fri, 29 Jul 2022 07:47:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00528c6c7bf37sm2958782pfo.129.2022.07.29.07.47.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:47:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/29] xmodmap: update 1.0.10 -> 1.0.11
Date: Fri, 29 Jul 2022 04:46:23 -1000
Message-Id: 
 <571736f7f1065674b8a90285868934d0a4ff1e51.1659105705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:47:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168642

From: Alexander Kanavin <alex.kanavin@gmail.com>

Changes:

      gitlab CI: add a basic build test
      Build xz tarballs instead of bzip2
      handle.c: avoid leaks when realloc() fails
      PrintModifierMapping: stop leaking the map returned by XGetKeyboardMapping
      Fix warning about number of mouse buttons

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 162f117428be2da12f2599870e980cbbc12ac2c4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-app/{xmodmap_1.0.10.bb => xmodmap_1.0.11.bb}        | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xmodmap_1.0.10.bb => xmodmap_1.0.11.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-app/xmodmap_1.0.10.bb b/meta/recipes-graphics/xorg-app/xmodmap_1.0.11.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-app/xmodmap_1.0.10.bb
rename to meta/recipes-graphics/xorg-app/xmodmap_1.0.11.bb
index 7dedb03a2b..dc955aa977 100644
--- a/meta/recipes-graphics/xorg-app/xmodmap_1.0.10.bb
+++ b/meta/recipes-graphics/xorg-app/xmodmap_1.0.11.bb
@@ -12,5 +12,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=272c17e96370e1e74773fa22d9989621"
 
 PE = "1"
-SRC_URI[md5sum] = "51f1d30a525e9903280ffeea2744b1f6"
-SRC_URI[sha256sum] = "473f0941d7439d501bb895ff358832b936ec34c749b9704c37a15e11c318487c"
+SRC_URI[sha256sum] = "9a2f8168f7b0bc382828847403902cb6bf175e17658b36189eac87edda877e81"
+
+SRC_URI_EXT = "xz"
-- 
2.25.1


