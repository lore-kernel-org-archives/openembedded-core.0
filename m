Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFEFC25B10
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 12:06:00 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.8417.1715256355988978401
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 05:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PvIN/wjI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6f4603237e0so597487b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 05:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715256355; x=1715861155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxvxWhbbEm7g4ZgX9PfB4UETGetKt7sOS/3R1URp8ao=;
        b=PvIN/wjI5WUqqGwbGMP5Vvkw4XGp1lzy6jympVfm3xObNWunY+8I1a6ocuZmQzT1s2
         zv0HyQnbzb6yC9U8PtgXAShBVHhrihBkseN+luZ0ovXNFn2YIZ7XbqWIIT4V5wRew+im
         1+v8XXmmVXaJBMtUqCRntFtI+HSJ+r+BZwzsSpT0yYVK4jvnPxviG801BVUC+TJBMsCa
         H5XavH1UX5A7jZk3ipKs1s/I4xCadG6nrljErmX8OYquYfPb6kAZEsI5yGcUYlTDiwK2
         aOMCcMfEUXmhp+B+Uzk3xa+quYcbEbOhvaOxpb0npspP/xvWVH35+p7V39q+bLnLTFUT
         73pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715256355; x=1715861155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxvxWhbbEm7g4ZgX9PfB4UETGetKt7sOS/3R1URp8ao=;
        b=bX2BHsEwJ54n8dEkpu5E7NmnzmxhBiiEor5lrGj70wMWHD6Loh7pOXKgiILx9q/Iah
         1TK/tHMaTMAZtRpM7kkzyiRhMmBsg1yt5GmlV+fNLJQQBi0tLgIq4nN3tZg2Q4fWXVPB
         H/hrslfHGXJbfDQXmHk9I95jHTY2IY1BA8xCayssPE5zPc1QYhRIuwMzXtJAio84Eh1t
         StISf9uBiAQekU7dKA8zEbylw0F3FwPiu8bNYmtWGbSRSFkAtF6Er0eaZtl1p3a62kKY
         w7BafZqTdCGbtcf/lgObdycbK35z3IclvkGgpDRpyMybdKwHjsAr/9Q5CPJFUvz2cWcK
         1zNQ==
X-Gm-Message-State: AOJu0Ywk04WUnanrgqLrw2T/E4uzAeBjTg+UsBurln7ieVy7VgIu5R9T
	oafNcH1B2vpuKZJ14yeDhaNUEZWZEaxAgU9rRj13mhVpPRYvanDB/qDoEywdiE7nOWQaiMM7mxX
	u
X-Google-Smtp-Source: AGHT+IHPgpLlXmh7D2BloRjOpjaqCY9NHBsG/ggvUvazSyTwO3wIrkiZDVjJKGMVWT+5xM/rIhmkfg==
X-Received: by 2002:a05:6a00:2e13:b0:6ed:2f0d:8d73 with SMTP id d2e1a72fcca58-6f4c90b4ea9mr4395195b3a.3.1715256355163;
        Thu, 09 May 2024 05:05:55 -0700 (PDT)
Received: from xps13.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2c41sm1185613b3a.172.2024.05.09.05.05.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 05:05:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/23] ppp: Add RSA-MD in LICENSE
Date: Thu,  9 May 2024 05:05:01 -0700
Message-Id: <24fd9b6756728a0337100f53a1c6e92aba092f9d.1715256149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715256149.git.steve@sakoman.com>
References: <cover.1715256149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 12:06:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199170

From: Poonam Jadhav <ppjadhav456@gmail.com>

ppp package has "RSA Data Security" license text
in Message-Digest Algorithm source file md5.c and md4.c
Add RSA-MD in LICENSE field for ppp package

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/ppp/ppp_2.4.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
index 7e3ae43b58..b7f71b673d 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
@@ -5,7 +5,7 @@ SECTION = "console/network"
 HOMEPAGE = "http://samba.org/ppp/"
 BUGTRACKER = "http://ppp.samba.org/cgi-bin/ppp-bugs"
 DEPENDS = "libpcap openssl virtual/crypt"
-LICENSE = "BSD-3-Clause & BSD-3-Clause-Attribution & GPL-2.0-or-later & LGPL-2.0-or-later & PD"
+LICENSE = "BSD-3-Clause & BSD-3-Clause-Attribution & GPL-2.0-or-later & LGPL-2.0-or-later & PD & RSA-MD"
 LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77d87dc9c290a424dea \
                     file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8 \
                     file://pppd/tdb.c;beginline=1;endline=27;md5=4ca3a9991b011038d085d6675ae7c4e6 \
-- 
2.34.1


