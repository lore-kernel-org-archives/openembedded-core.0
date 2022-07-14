Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B07C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 04:37:19 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.4024.1657773423515922757
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=FZ0Yug61;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id h132so481827pgc.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1BQxZqGo1Ecrpm9l/f5kxysWJ30GO9v4RYQPuLfEY1k=;
        b=FZ0Yug61DSELhkn1eIFoAwCkKRJdrE1JYzFoaJlW7KKmvy0QKwWWLAsC/JOzgYKlnQ
         etNKRhrOGnJm1Q0JZBaWz+z+hp4nOatzTL+7tj9PanQD1WvCLoh7ccELTOzWKq4Ud6CJ
         oU9/suFraUy6vaR8/eSwOJDq9iBFiz1/hj0owtAMlTN1Xr/j3rW+noy/BMJULSqcI71Z
         THHOWELgyDV9J1WrqB/PMqN6EqD95ncMlrJKUXjP7O97jzz5O2xf3gGuM0Z37HAiHXEg
         qwSav6iLOKFB71OpV4gOUOmf8om2FHATxdbf74C3BupRoJNi1I4+0OvNAOYnv4giQi5b
         ujsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1BQxZqGo1Ecrpm9l/f5kxysWJ30GO9v4RYQPuLfEY1k=;
        b=kxyqs3t+MrA9ZAaIYLvs60UuXa5ZQBi2BcXPz+fUDMqtbuHiVuH41VbFodVYW+5wjo
         ZGv81m6RrAtDgR4zo7Rq0NEc4llotLzBvZFG0lxVQQllKwr1kQ3NpkNbsVes0Ll5gCr6
         1tR2l2jclzrG5DhvaseBSBPuO9WnoNYwK2JZy6UQKEKHgkq/70oG43MVOtpIdeUImfHu
         oX8GZ9fRkJoVyN4qVaXpZjjjs4mTwE6QPG1SFtYL6iD6EdeRTZe8CnFxL0p65iItnxBV
         mvn068CixUelqowsTei/HccznkI9pNu3vhN3NxfA+E7MC1BHvhHCqrOepaQn0KdyEOCf
         z+jg==
X-Gm-Message-State: AJIora+tR0q4W3fnYP5tdq5nfe8lJRUmLZxtYDkGw5B/MjblnB7T7POL
	tIYc3lXknPLnXMLP0QUrKB0e6i/hK5wgyDSi
X-Google-Smtp-Source: 
 AGRyM1up2qlFqWMsSO/KAzNqKJx455OR4ymkpUbscNSIu+j4CK1+lCxMUONYSe6Bjaj0gXaHJGl1eA==
X-Received: by 2002:a63:84c7:0:b0:412:a0b2:3add with SMTP id
 k190-20020a6384c7000000b00412a0b23addmr6005281pgd.511.1657773431852;
        Wed, 13 Jul 2022 21:37:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f6-20020aa79d86000000b0050dc762819bsm411320pfq.117.2022.07.13.21.37.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 21:37:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 26/27] glib-networking: upgrade 2.72.0 -> 2.72.1
Date: Wed, 13 Jul 2022 18:35:46 -1000
Message-Id: 
 <a2871b43e3f976b4e3254375e0b239b29faa3361.1657772638.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657772638.git.steve@sakoman.com>
References: <cover.1657772638.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 04:37:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168023

From: Alexander Kanavin <alex.kanavin@gmail.com>

2.72.1 - June 29, 2022
======================

 - Discard empty proxy environment variables (#189)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 49827652371ca9836e58c0d5883dbd59d08cde72)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{glib-networking_2.72.0.bb => glib-networking_2.72.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.72.0.bb => glib-networking_2.72.1.bb} (93%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb
similarity index 93%
rename from meta/recipes-core/glib-networking/glib-networking_2.72.0.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.72.1.bb
index d578f17aa5..41f18d1c48 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.sha256sum] = "100aaebb369285041de52da422b6b716789d5e4d7549a3a71ba587b932e0823b"
+SRC_URI[archive.sha256sum] = "6fc1bedc8062484dc8a0204965995ef2367c3db5c934058ff1607e5a24d95a74"
 
 PACKAGECONFIG ??= "openssl ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 
-- 
2.25.1


