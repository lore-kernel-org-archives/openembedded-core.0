Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94783C76195
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:02:00 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.8771.1678888884312791289
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:01:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=dEjsFV6l;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id c18so1537757ple.11
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 07:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678888914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OklKpEZ/0HcmG4UFtCno2IRDyn43rPpDAKpIL8UFBPk=;
        b=dEjsFV6lIrKGGS5W7vto6Qu6qrRMYmPKhc57cFc+WcheRBBJXGbR/8Y5MtK0XIsi/h
         sfbeUloDb0FslWkFrr1aVDcEf1Wd8XlWoc312C2SOXTIxF3vMLT1FjFqkSWYWUUCWV+P
         rSKRKdcWlDsTShg9hlN/9uocIZc+QDql+AFkOWp3lpF0MF2f74AXU613UME+hIemzcOO
         DOjBLDZzKrrvB9lVLkLDkMT+vwoWUwN0tMFOaP+dOG8cmm2YEQP2icIqdhXed//vW8YA
         1zlwLvbzwt3OENUklru6GijPSbm14B6FDa3UHGJh/ic1K9fsxcyWvo6CNDzMMgDwO8vP
         F51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678888914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OklKpEZ/0HcmG4UFtCno2IRDyn43rPpDAKpIL8UFBPk=;
        b=ShAkE8RdWWgJ7lLW1HU1LmkIAcvAQCQ5NwvvDoFG2xgbECjH+0NFqrcoqrmeqJDbsa
         2SeRMhD4eVQCdPtmP+SuNLbvZu52BYL6v8cejfc++aDSoEwWyNrXFS3I0sC3IemTO+NW
         LhxI++rrm4Ug177sP7nIeuORrgJVM1lbjC7W2i22VK0e05+esiE9rxQtv84f3yMxPz02
         g3EXr5mdzcJHgPg9pgSnWdDY2rwJfUwpL7xaPQoGyw45pAsVpQS+kuTwQ2z82BkgD9ig
         dSotgaoiulKo144/KOk4otNIZAoZGd7EXFFnpxxUpCFgDaUmJHHjwYSAF59csb8oBs7z
         p0sQ==
X-Gm-Message-State: AO0yUKWBTGBntS6q4mecF/R8TU87jxeo51PZloWCK1+r8KXwjbA2K0Z0
	6GLiEdZWYZjdsXvS6/wALthCcvJp9N1V1IDrZ+c=
X-Google-Smtp-Source: AK7set97rrVZDQG1alasb16CYnYCCXgBDC2oH2szHMrtbaiNplUTWY1ZAG1p9i+RaIE6pcmFzos8Jg==
X-Received: by 2002:a17:903:804:b0:19a:b4a9:9ddb with SMTP id kr4-20020a170903080400b0019ab4a99ddbmr2227150plb.49.1678888914120;
        Wed, 15 Mar 2023 07:01:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f54600b001a0432ca99csm3663755plf.269.2023.03.15.07.01.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:01:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/22] vim: add missing pkgconfig inherit
Date: Wed, 15 Mar 2023 04:01:08 -1000
Message-Id: <01eeabdd6f01c47fa637cee81e4ae3c61c2a9bb9.1678888649.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678888649.git.steve@sakoman.com>
References: <cover.1678888649.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 14:02:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178568

From: Ross Burton <ross.burton@arm.com>

Vim uses pkgconfig to find dependencies but it wasn't present, so it
silently doesn't enable features like GTK+ UI.

[ YOCTO #15044 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 70900616298f5e70732a34e7406e585e323479ed)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index fcb5cf6334..da586a5699 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -33,7 +33,7 @@ S = "${WORKDIR}/git"
 
 VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
 
-inherit autotools-brokensep update-alternatives mime-xdg
+inherit autotools-brokensep update-alternatives mime-xdg pkgconfig
 
 CLEANBROKEN = "1"
 
-- 
2.34.1


