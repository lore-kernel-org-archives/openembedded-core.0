Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8CAAC27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:21:13 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.9697.1718288469877867959
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xK7ztDHL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f32a3b9491so10580645ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288469; x=1718893269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YD/ikZ9hy+v93pU7O+nvvm31IDdBZAkNsY3kZSn/sjA=;
        b=xK7ztDHLArkufGEITMhWP9sA7DpGE3OXS8HcfzUPuS+c5PvbLOuJCcuutUKwaZ6Wlp
         Aq3vn5o/qDi25hCQupVzrdUPFmWvERy8ayv2mxltB0hXTGsb4n60g8M8LHloHg7A1WRt
         fxO03mbmqmLMNvrJVR4gFiaAXjagPBAId5bhplkFISprLKxMb7fQMELxEIBFDAJkKLkN
         Gn/X4KDBhLMV9W/TkoJ0iFmG6vg4RSbjk3J/FiKK6FPxhVPDQc+NqVjzfKWOB5mA2nKD
         wOyPNC35iIFJn3KWiCJxWe8MLKfXvFJl5qDVRg9mgcPWkraW7UT4oVr31QS799hcjnkq
         xFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288469; x=1718893269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YD/ikZ9hy+v93pU7O+nvvm31IDdBZAkNsY3kZSn/sjA=;
        b=lgnTpcQw+aOtgCZoyr3EpSbtqD886wzNwCns7hEtsMFHZffp+FK7/+QWCbxnUQMNl3
         5OUwEvEafz0Pjgu2tU68fw6GqwPDngUMKfHoaUrRF6dwqc3bq6nXT7Jk6SIICxC5RK8t
         WWW6tDKT5RmisONz2vR6KQ7RhBFRWaH+/KpO8dPjJxw2J77PMi82eEGpmk6c8mB2CzKB
         t/mEyHaPvuNW5OWUidmSIhDgYszodUTpR9eylAglVvNhR+T7ItQysieWs/UHluZq7I84
         3W9ySD1YKkRKrsKuzPmQ5B/XJ5Hd9okpkMmkGbQiHcW+FqLyvsNvxQf+wIXhf5jLP+zg
         igsg==
X-Gm-Message-State: AOJu0YzPuXyhygE4UL/WUVYjHsm1Y3Ka3umSIcaIl4W5RPRSd3m/LTEt
	0liwzW5j+rVkV8bJpXe9lLgmkMzS2XlBicXdNyGfI/mpLsiqoauyv8zi9Et3EJXHLBcpOb9AK34
	E
X-Google-Smtp-Source: AGHT+IFh4RenBTO9RDopPDmM2jTppmBq7L7IIVxGB7nyqU9+zlifUlOq7aBXRbjRGhsYEfr+vqHK8A==
X-Received: by 2002:a17:902:d507:b0:1f5:e635:21fc with SMTP id d9443c01a7336-1f83b5e5720mr56160005ad.21.1718288468941;
        Thu, 13 Jun 2024 07:21:08 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.21.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:21:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/29] ppp: Add RSA-MD in LICENSE
Date: Thu, 13 Jun 2024 07:20:26 -0700
Message-Id: <5feddad534ecf97279dfe5ec076aa3ed2eec6456.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200624

From: Poonam Jadhav <ppjadhav456@gmail.com>

ppp package has "RSA Data Security" license text in
Message-Digest Algorithm source file ppp-md5.c and ppp-md4.c
Add RSA-MD in LICENSE field for ppp package

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9c58193c898b0ea28c3931a57dca5bb829a44051)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/ppp/ppp_2.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.0.bb b/meta/recipes-connectivity/ppp/ppp_2.5.0.bb
index 4b052f8ed9..5f0c75de83 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.0.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.0.bb
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


