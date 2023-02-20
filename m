Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6490DC64EC4
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 14:19:00 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.14068.1676902738729478045
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 06:18:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=MyW/soBC;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id bm5so719142pgb.12
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 06:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mWd54Io8a4Hh3wXNPZR/OK7TBdW1lV7YzckWJv9rlOc=;
        b=MyW/soBC75UTV6P0+z/q92oJxGFL0h2d2iWcVpS5ffLiys7nRfywk4RBuEi7wsOa1j
         Cc/YZ8w9ABu6LB8i5/HmudsL12x/CULdOMsz0EIW500A0QJ8qVj41yOgzR4kTKvzIJlG
         GqA3xZOy+eWjNPZY6mPKp3WLfN2i2OtxEB6yWksHlYqAwPXuTwFeabz2TqpB3w0ONBvo
         XTJ5huHI0pf2Jc9YMCzum1qFhy/9NgWKutSR2xO7vcoAAWW6pnANIqX9Mwhi1lkG2uC6
         k0VJLGTWwHKfoRwxFwQCek1yxEV+1c9ZfNcViZO+7gU4hc63oFmxfAucl+WlH6OVz7/a
         vTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mWd54Io8a4Hh3wXNPZR/OK7TBdW1lV7YzckWJv9rlOc=;
        b=6YI4crSzdTYPtgi8oPrEc0OhzoJl0yWsr0iAZ5QtrFEmY3llE2tgAPqf3fGWgLV4x9
         l+ghPicbgZhXOw7bblk8ms00dJfs/z9bzKEd4CwryFpfRTc4GPbzOjirVz9HAQ3lWp6c
         Ga0mRRhvNXKwSyN72tNgsilnnwMr9DvQxlnSuIiFtRfgjKj7WILVDU7nKCXanPs4e9tU
         Vnnw5t7b787M5iGx78xohrDMgkdJvNtGWTFsUxkoesObThBPbqJm34uCbjoq7ByjFxyx
         JN4LHCKncK8/UEesrsx+E3AcNjl7earYbrCRDMno6xecbolcKmFn3o/7n04W/GG/oh5H
         B+EA==
X-Gm-Message-State: AO0yUKXj/gTD2p0xiW+lf1ozVEaEbl3M++MvFnaxcuBUrS/8MIFOJ4ko
	1GE7O529S8tCVfHqGxrB1y90hXezV/Ccb/uZAdA=
X-Google-Smtp-Source: AK7set/2PeKvcj9UHFIKVFlvB+fkozQkWgRCbUQb36pe6mKxtyaYuStlmICNcS14zmFPC2F/H4N5fg==
X-Received: by 2002:a62:2f41:0:b0:5a8:808a:d3ce with SMTP id v62-20020a622f41000000b005a8808ad3cemr1702476pfv.8.1676902737780;
        Mon, 20 Feb 2023 06:18:57 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id q19-20020a62e113000000b0058baf8694e1sm7789297pfh.71.2023.02.20.06.18.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 06:18:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 11/22] sudo: upgrade 1.9.12p1 -> 1.9.12p2
Date: Mon, 20 Feb 2023 04:18:18 -1000
Message-Id: <9f01e75b2d249a5885b313bcb4ba76df750b0d56.1676902605.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676902605.git.steve@sakoman.com>
References: <cover.1676902605.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:19:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177417

From: Alexander Kanavin <alex.kanavin@gmail.com>

Changes:

Fixed a compilation error on Linux/aarch64. GitHub issue #197.

Fixed a potential crash introduced in the fix GitHub issue #134. If a user’s sudoers entry did not have any RunAs user’s set, running sudo -U otheruser -l would dereference a NULL pointer.

Fixed a bug introduced in sudo 1.9.12 that could prevent sudo from creating a I/O files when the iolog_file sudoers setting contains six or more Xs.

Fixed a compilation issue on AIX with the native compiler. GitHub issue #231.

Fixed CVE-2023-22809, a flaw in sudo’s -e option (aka sudoedit) that could allow a malicious user with sudoedit privileges to edit arbitrary files

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5a3f5f4f607f5e06af772287109b68579154fb2f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sudo/{sudo_1.9.12p1.bb => sudo_1.9.12p2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.12p1.bb => sudo_1.9.12p2.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.12p1.bb b/meta/recipes-extended/sudo/sudo_1.9.12p2.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.12p1.bb
rename to meta/recipes-extended/sudo/sudo_1.9.12p2.bb
index 1495b67b8b..ae7207c081 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.12p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.12p2.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "475a18a8eb3da8b2917ceab063a6baf51ea09128c3c47e3e0e33ab7497bab7d8"
+SRC_URI[sha256sum] = "b9a0b1ae0f1ddd9be7f3eafe70be05ee81f572f6f536632c44cd4101bb2a8539"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.34.1


