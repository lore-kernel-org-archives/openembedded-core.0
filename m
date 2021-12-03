Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE76CC433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 18:21:47 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web08.15310.1638555707090905147
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:21:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=PoDFlQqB;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id b68so3624515pfg.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hngGtrHmpKIpXr9+5qW3gaxH5iBvMs5nMJuRI87FIeg=;
        b=PoDFlQqBomqRc+iOTAsxRSuYX3QGnRsO7AMkGslRh8/+0iqgqf85C0sC7+wQdtOeaD
         nHMpB4qqhO5zbpqerRdZNhwdBY+dTYEXlto1oWefsl+AorYjL+3Yl6jXrH8PmDkQcWeD
         48URIm1jze/4h68zj/bvAqRlHQGt55UznHk5ziQFPR8QfG03PFTJinQHYzyjPh9Wcg87
         kaoDR4l1h8QyVfiUvOV/jL4BtYp7erT+oXIDEtA19v38mM9WLKB/gD2wKH55Sip42jkA
         GAwgqbBku0BeqdJozLygLuW9Dv/A60wQhURunDhaMd/YAY/lyGhUqk+UrAsTi0tAG+KC
         lWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hngGtrHmpKIpXr9+5qW3gaxH5iBvMs5nMJuRI87FIeg=;
        b=3poaGn2ZT5WAyoFHbDVJl3dbsNS1+6FfsPgtmg3M9oza7jMOm6qMKce4abdJfsj9Fm
         9QRLpJN9YUbv7vOfAVUbc6ORfwaLUWCnO6a511a2U4+EPgzlo7FyxwaVNyPq61ikOf0j
         fjtsAyzSx5TubGV8ayaAi5zjZpxZci+sMRsIHX7jRW98EPeAnahgKgimq4FZVyX9EJnf
         MLwAbyrkhmZJSh89V8xVXmVMmW3+T5fGzACsaBrjfygckHYmHkY+XDQSd/s2gmnLPhIr
         Srca1C3GGxftzmcmLdXO1kC4a+YBfJvs9QHMyrp1+//JT9BVanAz9yc6mMzSZaSrqf2M
         ZaeA==
X-Gm-Message-State: AOAM533T3bPqURgLq2pjWQjWXkSMjH2jK40NfnamPEAJ8RM/i8lmuxAP
	VIxQwnCocGGRzXzYYrz3g2EHuJLbsdj3jZV0qWY=
X-Google-Smtp-Source: 
 ABdhPJzrxByAkPn3Wy9baz4r8gxpZcaybrXJH6VmkMlPYP67jUTxhgWgMzkXIZEcE2hb2NEjFp5ARQ==
X-Received: by 2002:a63:41c6:: with SMTP id
 o189mr5764167pga.625.1638555706148;
        Fri, 03 Dec 2021 10:21:46 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 130sm3959753pfu.13.2021.12.03.10.21.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 10:21:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/18] bind: update to 9.11.34
Date: Fri,  3 Dec 2021 08:18:56 -1000
Message-Id: 
 <599893d0fdc55dd6dee0a7fcb2fa7b065ffbb781.1638555254.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638555254.git.steve@sakoman.com>
References: <cover.1638555254.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 18:21:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159136

Notes for BIND 9.11.34

This maintenance release of BIND 9.11 contains no significant changes,
although some minor updates have been made (for example, to fix build
issues on Solaris 11).

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bind/{bind_9.11.33.bb => bind_9.11.34.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.11.33.bb => bind_9.11.34.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind_9.11.33.bb b/meta/recipes-connectivity/bind/bind_9.11.34.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.11.33.bb
rename to meta/recipes-connectivity/bind/bind_9.11.34.bb
index 8ef8a76ce2..dbb2f83876 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.33.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.34.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "293e767e96ac8ef17163e9f9cba52a6d27163807c29c88d36fe6e18d89083a3e"
+SRC_URI[sha256sum] = "aa031775a73d30d951451034c84c4a716a10e6625acc4eb4bb878ed4c61b7271"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.11 until 9.16, from 9.16 follow the ESV versions divisible by 4
-- 
2.25.1


