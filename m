Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69239C25B10
	for <webhook@archiver.kernel.org>; Mon,  6 May 2024 01:07:01 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.10153.1714645347403976028
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 03:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KQVrjcZt;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: padalkards17082001@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5d42e7ab8a9so4397853a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 03:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714645346; x=1715250146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MUGQl0GAI1z0N1WRCbhTXp3n9gWDcFLDfZkzAmOnUdA=;
        b=KQVrjcZtQlcA3h04DCECoKGE9uszZSnMVCEfbTkb9bkE0OaxAmZ5yzqlt0UbcajAwo
         ivLtsNoWCwrofzhgS1zRoPPMIHRSkZcsNnKyzv+HUvNRbVaeB6yTFtJdfIo8FqtPE2rr
         gTvlX2ywnL4yCLTmNas3FJJtJG8VtTKfZbD+OyCKex5GWIaxfEoKE+1wO8Y9KU9CEilM
         22yxwT3XCRp6I3g4sn+OIUvttd/vtWifopL04yKDVIml1fVAmZ5lPdVPeH3hgwBMODk/
         3oelK+l9ERdIp9SK2cX2mzwY+cO4N7BhbMVVbjrVfbQ9xX9NwTxEom9tg03jgkKNLblR
         PApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714645346; x=1715250146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MUGQl0GAI1z0N1WRCbhTXp3n9gWDcFLDfZkzAmOnUdA=;
        b=Ki5NoCPf40ujLEcscnXxWxY7Np3wiF5iPqCTdxDImh/crmTDpvhmFlHqk0nK7s+nyd
         6ajtZG56Rr2YscvtFnNoQAgmB7crUqDak5kDZcTOr95wyKLUQoXfoHDFlYPYFb/05RKq
         UEnco11FYig4gblZSjAXmbCzdUZ4dm5MGh+W2P9i4qqT3M8QaYkSWA+Nb/ukqB0qTfV+
         a8CTa1hhEMP61YVon0401Oc0toTluNCpxzeokUeBrzKJEOn5H/9cYyy38roCpYTbhQU3
         3WPYb58uCT2fFcXkdIFAHIyeUSLuBzvQjsO0M0yt6uFTaCQHfN2qBxXQERu7zUv7JfHu
         0JxA==
X-Gm-Message-State: AOJu0YyFHuvbOKd8VrgkZxSAk2B5LpZE4xAFgpPTBLMB4eIMP7FGV99i
	zmt3ph4hRLhu7ADx1opzDb3RWH6HJF32bOaMxV5GZVVg7Yz5MRzg817Wlw==
X-Google-Smtp-Source: AGHT+IHiGYraf8UfpCoC6nzJTXFifie28MvTyffDlib4si1aIknjWuiBB95kEeJlSxkYbPfIgUWc+Q==
X-Received: by 2002:a05:6a21:2d84:b0:1af:55e7:633d with SMTP id ty4-20020a056a212d8400b001af55e7633dmr1767892pzb.0.1714645346223;
        Thu, 02 May 2024 03:22:26 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:304c:c4c4:52bb:141b:b522:fd08])
        by smtp.gmail.com with ESMTPSA id si17-20020a17090b529100b002abb4500e97sm2797222pjb.41.2024.05.02.03.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 03:22:25 -0700 (PDT)
From: "dnyandev" <padalkards17082001@gmail.com>
To: openembedded-core@lists.openembedded.org,
	padalkards17082001@gmail.com
Cc: bhabu.bindu@kpit.com
Subject: [OE-core][kirkstone][PATCH] libpciaccess: Remove duplicated license entry
Date: Thu,  2 May 2024 15:51:13 +0530
Message-Id: <20240502102113.989899-1-padalkards17082001@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 01:07:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199029

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


