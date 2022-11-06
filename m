Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49BA0C43219
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 16:04:22 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web09.17888.1667750658365772395
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 08:04:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=p1gXfjGB;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id m6so8602602pfb.0
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 08:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q50Q3YcBRUaqfNd5gJW+VT5Weg9h+OdMwfD4l6moZTk=;
        b=p1gXfjGBXdNaJ74sRfPHjM8F8xGr4LiA0I8TA7CdeEjZkBbmaV/+9H4NbIKEzLAwsp
         tRgXjrZnRlDGzkEQ4K5rTMdf3kHBE4CS4taFcuewzYD3tlLVSphp6uolNfxrCEANb6m3
         COEazaW1nmKtxe7rqK9+lyy+flWE9OCJcempKUs87glyGL6lxOUqf0uzPzwNIsxzRIIm
         vRFa68qRvPnv1c+WahoiJ2ZoNYpz+c50eIYXGIS30lEo9q+sNgsdtrUO+LtVPirZakNr
         d2E67+6d+/OtLYYIG2B9LksFZLin6MLOFA6jdGo3OjaIhRvobclF++9gwQUTu+Cgn6ks
         uM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q50Q3YcBRUaqfNd5gJW+VT5Weg9h+OdMwfD4l6moZTk=;
        b=n1XvLBFmJwoxqyh1HVcpoHHrLA8zOj504+FqKRpg/FKIWE5P1s5V8lOnF03vA6kClm
         7kdCQmeXhObwGd6SZTU6Dz/khyTTJJa60IInr4PGu2DjC9rgLSAsO6/hKP9pk3L/rw3h
         jCw2eVXvfPsJC4IWeOMlAEsDfrt42pPqXCeFIWYnUz/OxvNQLJWQ5gKjGtXznlO1sJT6
         d7WghgHjwL3Ah0A6qGyrEM3dow/Z4j1cBeK1x6bYYW6bJS6RRjQ24xma8zb5lt08E1yE
         6J4byS35qpCTSh61Y+UhkyFydYJjQD9/JyK79LQSmbtnlLMwUHc9gs/GLPHwPmawsOuK
         Tv4g==
X-Gm-Message-State: ACrzQf0VZitN5PSbL+vPGZNTLv3m+XYnyUmA8ZLyzoivZ5haKPzFnNdK
	EEjgL6JjUJPZ6fDMqtdX/hGBosuk5Q+d05Wx
X-Google-Smtp-Source: AMsMyM6HF09P881/qCNHLrUP1OUXsM+zrFQ9eWgBwf9lvFcdEoqBgGUPv+cCAhj7AoU7upCltPtBtA==
X-Received: by 2002:a65:6e0e:0:b0:434:59e0:27d3 with SMTP id bd14-20020a656e0e000000b0043459e027d3mr38009523pgb.185.1667750657394;
        Sun, 06 Nov 2022 08:04:17 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s11-20020a170902ea0b00b0018700ba9090sm3294683plg.185.2022.11.06.08.04.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 08:04:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 8/8] bluez5: add dbus to RDEPENDS
Date: Sun,  6 Nov 2022 06:03:53 -1000
Message-Id: <babcb7cd3bbefe9c0ea28e960e4fd6cefbc03cae.1667750511.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667750511.git.steve@sakoman.com>
References: <cover.1667750511.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 16:04:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172814

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Unless we're using systemd, dbus is not pulled into the system
automatically. Bluez5 will not work without dbus so add it to RDEPENDS
explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 377ef7009a8638efe688b6b61f67ae399eb1f23d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index eaac9ee849..7ad054b3a7 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e"
 DEPENDS = "dbus glib-2.0"
+RDEPENDS:${PN} += "dbus"
 PROVIDES += "bluez-hcidump"
 RPROVIDES_${PN} += "bluez-hcidump"
 
-- 
2.25.1


