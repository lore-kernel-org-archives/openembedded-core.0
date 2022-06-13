Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B736CCA47F
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 14:22:27 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web08.6531.1655130141350742513
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=bIERyErq;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id h192so5671960pgc.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=74pAyOqY5jdRMnPsMlN0XH/G4uUZH040PXNPN9t+WPg=;
        b=bIERyErqj9ABE81v7ToCVWuhtW8ObpcMzIy7fd8vR8eK3sQdxXpg4lMI9glZY/9da5
         0OIXe0jOKHpG+t3u1A/TTVF932hpFASCMLeDI+PSArNATLlQmov97Y+QbClCa6l3ogPg
         fXxWRSbXtdLTuO88Pk9qk/2MCg7hs87O+KK0svTYjckYO+j7NB38ULs32oeVZRPR/+5v
         New9HzRuzK96kBlcNk6kaPs8G0WEf5vID2pQN//0iyKl9a+c79Lt5UR86pz67qwQfvK8
         8kJ2VWXxmfupW+nTljFavQeZhgk/JkljNsImjHHlQpLLIjLl6MpzLWcyG0uklFKgKH8e
         WZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=74pAyOqY5jdRMnPsMlN0XH/G4uUZH040PXNPN9t+WPg=;
        b=FySXsWmNeaMqVoPqQaZgSey/pIbArZqUnkFrp336tf5PVCJNRbLDMmnbgLKMd3toqQ
         uTB9AxgxJxxnfKd7bUEQO2UGF7as9nsl9v/vvokeOlsDLCJvzodkcBuTi/mHrzt2BgxQ
         cfWLup3w1QyQc9XOSb0Io5F/RHm5x4H73/PGMn4EucCgc0ZW9/0U1JdwY6nPYTsbm3I4
         05NmkPuh8MTkhdcuSyC7Y2PkmppBbb7hAjtzYcb0EuKhkqRLrQtweFSUsp6lej8mIOpY
         tpKy+O8CxQiHG/Ogcaw5EsIx4P2nGPwnlOPVKr5OqJ+nkh7syc/FN+5gGkYFkr1zRGaH
         4jzQ==
X-Gm-Message-State: AOAM531YgpbsMyMQxHUG6ygt/UlTq8KHknp9QYeYqIOFgwJ5C0eAqIVR
	K02vZfRKxZXLrpM95DsCZr6pB2RvAZN7ONIu
X-Google-Smtp-Source: 
 ABdhPJwCaBFMUmZKZSH25oJ2ULVZcTKsPBir5F6SVqP4V1QJurySdC/doJ2dDhq8eZYZ21dVa7V+TQ==
X-Received: by 2002:a63:8642:0:b0:3fd:a160:6724 with SMTP id
 x63-20020a638642000000b003fda1606724mr37156033pgd.506.1655130140345;
        Mon, 13 Jun 2022 07:22:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 iz19-20020a170902ef9300b001636c0b98a7sm5159401plb.226.2022.06.13.07.22.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 07:22:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/20] lttng-ust: upgrade 2.13.2 -> 2.13.3
Date: Mon, 13 Jun 2022 04:21:39 -1000
Message-Id: 
 <64ac42262dc3fae0d92e667b2dbf86e6f1097088.1655129917.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655129917.git.steve@sakoman.com>
References: <cover.1655129917.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 14:22:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166852

From: wangmy <wangmy@fujitsu.com>

Changelog:
==========
* Document ust lock async-signal-safety
* Fix: don't use strerror() from ust lock nocheck
* Fix: remove non-async-signal-safe fflush from ERR()
* Fix: Pointers are rejected by integer element compile time assertion for array and sequence
* Fix: statedump: invalid read during iter_end
* Fix: bytecode interpreter context_get_index() leaves byte order uninitialized

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d9d7b5d9fd8366bc4d2720e3396ab10f8b1ab6a0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../lttng/{lttng-ust_2.13.2.bb => lttng-ust_2.13.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.2.bb => lttng-ust_2.13.3.bb} (95%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb b/meta/recipes-kernel/lttng/lttng-ust_2.13.3.bb
similarity index 95%
rename from meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.13.3.bb
index 516d90a196..cc88bf5b11 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.13.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.13.3.bb
@@ -34,7 +34,7 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-Makefile.am-update-rpath-link.patch \
            "
 
-SRC_URI[sha256sum] = "08679a1dfc2c9428885273861628aa5d828972f389a38bb08fdce39adee589b7"
+SRC_URI[sha256sum] = "2cc42f51145050430ac4ab72b32d95fd78d5566ccbe44e14a8fcdd23c0ed8f6f"
 
 CVE_PRODUCT = "ust"
 
-- 
2.25.1


