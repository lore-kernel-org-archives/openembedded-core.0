Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36269C4345F
	for <webhook@archiver.kernel.org>; Mon,  6 May 2024 01:07:01 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.10842.1714648257297206232
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 04:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CCydFzdk;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: padalkards17082001@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1ec4dc64c6cso21357315ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 04:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714648256; x=1715253056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MUGQl0GAI1z0N1WRCbhTXp3n9gWDcFLDfZkzAmOnUdA=;
        b=CCydFzdkFl70pECUY9cvhMBU7mbu20g0TLe1OOCE4H8aRQpL7RiyvpH/55yZ9Rocrf
         Cgt31rLMpsCvg4sx3oFb2D9CZmASBNsvtkGFPHBBu+uML6TxEdj2srwU+WvofMEWD22L
         quJEnRAV+a2DhVUN1/yJ74O0xm4xCnSmOuY2xJxs2EVGl6IrmzYXCCfhKDEuJT8apqUA
         j9xZziSaAmpXOhe2eAaxRIAnCJcO96wQLnvrdhBaahfrl6sBxH7udtlr3uQsNRdVly/A
         av37w6EJO+IlKSjW28Jh1/psYjkJYWBcV4dzDxiuaaxHkWKNRfdnQUwzgcMH5Z3v10Qd
         io2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714648256; x=1715253056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MUGQl0GAI1z0N1WRCbhTXp3n9gWDcFLDfZkzAmOnUdA=;
        b=j6hEMOn5Ty51oMMPRNcso9tyKtZvetZ1tUvWgGHN/RN4BG5gYTlJTCxGzgDGTUZL6m
         Db04rCE3ha/Glac9UIpaBNJn/TSjl9G00GguSxgKVWur0jnpBhJda2Z2Y8NaXsha7vUQ
         YAAcgXB3I/5iC8KT+EaVHnjtACfyyWu4/cqUnOnvHZ27lqTF44sdPwBaFC94n/B3601R
         44d7iiU2GOopcuNqPfq4UvahbYNUgB65BV4W5BpqBCyXHXg0yXOS/0vYnlfgYA8sX2IZ
         v5ZJrQLFFYQdYTeK7O+eTfxjKcB80VYtuciuVoCIqZleF7tIbFTPCUVQ5YjL597lYg/R
         U+HA==
X-Gm-Message-State: AOJu0YypXUs/0B8rwlxiTEAp1EpLHfnqjARxU2UIp8KmSbR2MgqqXcNL
	cdvGOqxc4oD634BYUEKz00UuGneJ1Aeu+zDHC2IW6rnjcB1wEZy/Ott6Mg==
X-Google-Smtp-Source: AGHT+IFYP/uU08Ej1+qLqVZBsSl6C1oJhMP4af5RH6ErpdFNrZQH6wCxqbM+bKlbphbW621iJD5zSw==
X-Received: by 2002:a17:902:c255:b0:1e8:a63b:d427 with SMTP id 21-20020a170902c25500b001e8a63bd427mr5476550plg.49.1714648256219;
        Thu, 02 May 2024 04:10:56 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:304c:c4c4:52bb:141b:b522:fd08])
        by smtp.gmail.com with ESMTPSA id n5-20020a170903110500b001eab26889a7sm1014739plh.136.2024.05.02.04.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 04:10:55 -0700 (PDT)
From: "dnyandev" <padalkards17082001@gmail.com>
To: openembedded-core@lists.openembedded.org,
	padalkards17082001@gmail.com
Cc: bhabu.bindu@kpit.com
Subject: [OE-core][kirkstone][PATCH] libpciaccess: Remove duplicated license entry
Date: Thu,  2 May 2024 16:39:38 +0530
Message-Id: <20240502110938.1145046-1-padalkards17082001@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 01:07:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199030

From: Bhabu Bindu <bhabu.bindu@kpit.com>

Remove duplicated MIT license entry for libpciaccess

Duplication was done as part of below commit:

Link: https://git.yoctoproject.org/poky/commit/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb?h=kirkstone&id=b0130fcf91daee0d905af755302fabe608da141c

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
---
 meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb
index d55315efc2..445f3751fe 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb
@@ -11,7 +11,7 @@ SRC_URI += "\
 SRC_URI[md5sum] = "b34e2cbdd6aa8f9cc3fa613fd401a6d6"
 SRC_URI[sha256sum] = "214c9d0d884fdd7375ec8da8dcb91a8d3169f263294c9a90c575bf1938b9f489"
 
-LICENSE = "MIT & MIT"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=277aada5222b9a22fbf3471ff3687068"
 
 REQUIRED_DISTRO_FEATURES = ""
-- 
2.25.1


