Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A6E3C6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 21:05:22 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.85138.1679605517717487341
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 14:05:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=EtXxsZFO;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id mp3-20020a17090b190300b0023fcc8ce113so3172436pjb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 14:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679605517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B74jqWLB9XXwlw2wCPzDds5oIQPGutBAYE7ULCW2jV4=;
        b=EtXxsZFOMKS43KK5f/LqfoZATYFg2Y6HkRE8krCn4B6flWqRI/A9sT0wiRVeDtALCm
         WSEHdvYyXRpxM0HIPnOaPn5o/adum07jIbckZBjpJ2d9S8egvrwW80ynGW+MCLlnL9Ni
         JMbgAJmIQjg6wFc5dvNoGdXk2zgKK80PAHLWjeJFsgWFkRgT+PTPtBZM0oj9/vdqKY52
         TFYdQHJxqgZrIcXGEiHOn55mbH+PRvq4PCqZywB9oYoAZcPjrymsPKgsTlpLPv7/xBTp
         oc14mi/hq/CtVw9zwrQcQJnkumJjfFrh9oOA/rDdvLCAf62JVPR++lh9VUcQQQjOPjjv
         8cJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679605517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B74jqWLB9XXwlw2wCPzDds5oIQPGutBAYE7ULCW2jV4=;
        b=jdypnNtQv2aIxMhE4vCOTCVnrv1KMCuIxbAf432LfG0yPxv0ft/iX7reajtKi6vPT7
         gciveLcoTF3I1GJujfRrn8Se8yOKoJFKB00MjB7u2UfBd99aXK9k0xUTOoTFYMIjfubQ
         I+xqg2kPktPLHMeJtfYHAFX4vj0ja2RIBZniu9BmzivYn7LOuQS3mEFtSfXpzqUjtnkN
         sH18yAO6FUNISSo4h/4Tldp826KvsPjWu2f9zn8hRtcViDTXUpgswXLxmEzKg5qmBp7k
         RY2DzoCvzVPU0vMNb8IWKAdC8IPJIdxTTNrGUP8ECX44V0jLkhaoXyfXQXpCUapetkPX
         9hrQ==
X-Gm-Message-State: AAQBX9eo5jLpu0qS8gGfJ5KRPyi5Z4r/rqjTEP/IC1ohi7d+UAiRqrN0
	qY7rfMgl0YArC+pSyWwlQiwRTzlIs/kE/CofNS4=
X-Google-Smtp-Source: AKy350b9A6t4E7QNNlSOII8wydDTv9WkQmyBUs/9ovjhG0tPaheBYAUmgwOIU/AXmy5GpRLUs39jKg==
X-Received: by 2002:a17:902:fa8d:b0:19f:30be:ea0d with SMTP id lc13-20020a170902fa8d00b0019f30beea0dmr129740plb.62.1679605516846;
        Thu, 23 Mar 2023 14:05:16 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id c1-20020a170902724100b001a198adb190sm12760417pll.88.2023.03.23.14.05.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 14:05:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/14] cracklib: update github branch to 'main'
Date: Thu, 23 Mar 2023 11:04:41 -1000
Message-Id: <58dfc69f522a8f135575c85cc0e6b50405ed4acc.1679605352.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679605352.git.steve@sakoman.com>
References: <cover.1679605352.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 21:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179007

From: Tim Orling <ticotimo@gmail.com>

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ab041ca5d036c2a1a1514893c6ffb5c7188ff00f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cracklib/cracklib_2.9.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.8.bb b/meta/recipes-extended/cracklib/cracklib_2.9.8.bb
index 786940a7e0..a3db6eb394 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.8.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.8.bb
@@ -9,7 +9,7 @@ DEPENDS = "cracklib-native zlib"
 
 EXTRA_OECONF = "--without-python --libdir=${base_libdir}"
 
-SRC_URI = "git://github.com/cracklib/cracklib;protocol=https;branch=master \
+SRC_URI = "git://github.com/cracklib/cracklib;protocol=https;branch=main \
            file://0001-packlib.c-support-dictionary-byte-order-dependent.patch \
            file://0002-craklib-fix-testnum-and-teststr-failed.patch \
            "
-- 
2.34.1


