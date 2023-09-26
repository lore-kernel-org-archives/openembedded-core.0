Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A094E7E641
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 14:12:34 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web10.20204.1695737549309134178
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 07:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zfO19S82;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.181, mailfrom: steve@sakoman.com)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-34fcd361e91so28242795ab.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 07:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695737548; x=1696342348; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DOPEI/KfOpl0lSYIz02Arvd3lYlt1F8P7S+Pgsqw7a8=;
        b=zfO19S82YcnsByYbcULB0ETW3Kx2Cfw8wioV/nqHiMcWUu3SVDS5LSd3YEc0Nu8jsA
         r7Jru5T6leupvTjZjFPQxa/knL7yrPmVCBqgqksc0ZONbK6fHQlkPrspwlmGOakfFD+p
         syiwxJN+brbHzDR5GcXoOwUZxc32lNWMdn1w/HS8P52argGvuvSXyeRlOWp63whjP7BH
         z+Vi91WDikCnN0zHDgA3GyrJvwe5HSpj8C5BghvgqS0KBqnKCocQKugsdO+IfMDif3CN
         Tv0LkcQ4BreytZ5ZCggWaLlK5bBMOjInDFf5pnuyJ8Ra7NwGVoNbpwUhEGEUAGB63ctW
         v+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695737548; x=1696342348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOPEI/KfOpl0lSYIz02Arvd3lYlt1F8P7S+Pgsqw7a8=;
        b=Xqs1X5lOwRLQK+mksj2DNgUKVQFQjPi7DaBijR7ZqhYtcXNeT7CKRCRaMhSQdtk3ge
         VRClyPqP16ibOsF7vtbnI7Q/lsX43bVauxR7LOY+l+B6u0PIavWBe6W2EwdbwHwR4oSa
         CkuA0PFaX4wI1sA5e+sIxg2pWmjALW1oPydz1wYfc66LYrAqf51Iu7EqoU7KpxF2iqra
         iCJs6biX9xkDKYbsQhg7ov3q/oAuAOBBcFuuWLjvAMJx5KDpGpoxqPfAEaEVxdWlhYL7
         H+XXHMdR1BMPT5jZAuMgiMC6f1SzsYvPwt+fjvg3ehmRsJoX/qxlLzM0Yyq1vh9c0ukp
         p55g==
X-Gm-Message-State: AOJu0Yx24Z5ZV3ASBMHeJQ7VTdorn0vs+Vu4cGOmiqerBj2cTLmEIgDQ
	hvLBv5i8QDM9bqnBWW9w/1JfvRVWYbbXMVKUuXk=
X-Google-Smtp-Source: AGHT+IEFjIP/FFx/up8DZn2WVQcAJawBdDyBBsQPSSl0FtKgK0SmfClZg95tnhYl9p1OHiouzEgwQA==
X-Received: by 2002:a05:6e02:f88:b0:351:2053:f54 with SMTP id v8-20020a056e020f8800b0035120530f54mr9875629ilo.9.1695737548167;
        Tue, 26 Sep 2023 07:12:28 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u7-20020a637907000000b00584b293d157sm1348861pgc.80.2023.09.26.07.12.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 07:12:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/7] vim: Upgrade 9.0.1664 -> 9.0.1894
Date: Tue, 26 Sep 2023 04:12:08 -1000
Message-Id: <a9d194f21a3bdebca8aaff204804a5fdc67c76d1.1695737244.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695737244.git.steve@sakoman.com>
References: <cover.1695737244.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 14:12:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188253

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This includes multiple CVE fixes.

The license change is due to changes in maintainership, the license
itself is unchanged.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 91e66b93a0c0928f0c2cfe78e22898a6c9800f34)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index dc22a023c3..73e639d7b1 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -10,7 +10,7 @@ DEPENDS = "ncurses gettext-native"
 RSUGGESTS_${PN} = "diffutils"
 
 LICENSE = "vim"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6b30ea4fa660c483b619924bc709ef99"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d1a651ab770b45d41c0f8cb5a8ca930e"
 
 SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1664"
-SRCREV = "8154e642aa476e1a5d3de66c34e8289845b2b797"
+PV .= ".1894"
+SRCREV = "e5f7cd0a60d0eeab84f7aeb35c13d3af7e50072e"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


