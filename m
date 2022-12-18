Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D47CC4708D
	for <webhook@archiver.kernel.org>; Sun, 18 Dec 2022 16:13:29 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.32105.1671380005620702465
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Dec 2022 08:13:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=QN5BECDW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id m4so6876583pls.4
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 08:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJDw9J7cX0VT/icCCQr6rlXNN++e6HZG1Uz1MFdPeuI=;
        b=QN5BECDWAZo3GPX9U+6Rdg50wiParcq/O/HQMdPIFq/EzMYf1iw9EewIZJVo350+FP
         xr325HrKu7jhs9s+JbgviMDAA/9LviIlKn/Z3YBk0N0xpjHeAbCfXPhdNWDXcCc5irYq
         z1hRk7PULSlChZzIj8wRbVPbic51lpZQH/vvNFrwkSpri0GFPMuOdKfujd0erbZTrl7/
         T2ePHBnPHQP5V1fyEsjAov1aDV5YvNoKGru8DkhTiUsJAdhT41apvdFzDrjLFJU86sob
         Wg6zVGOsAXoi6aLfvbk0Om/SlEjNN98yCY/eMuECa/aGeLS/Qoyw1S5T8e1zRAT8ii8o
         nqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJDw9J7cX0VT/icCCQr6rlXNN++e6HZG1Uz1MFdPeuI=;
        b=Cbr5NJxRY8QCknnogx9SoDN8olp/T/5gWiWZFhvieqgNkr0ugOVS7iNZFjpfb+geCQ
         5vvnnY76mc4nSoVGTCJtnfqrabTNxiWI2cHqPSCkBGeZ3euBfNzgn2wmymFkDC0HPa+S
         92qMtun9AnDObgqFxbdeMgC3NMZNV0JWkF4dKumJoJ+q3np0GunSLrW6e+kONfp9r1pc
         AkWuOC90jwNJwRHqsXWmNiy4Soxo1vtcgwhDyxFKVV5ZFNWe+AKjak0aoLu9hDSp9/Sz
         wYpYPl3EY3K2sElpMgYrLmSwyLuyCtqkTT8JrR2Gn8TbHUegae/7mltBzFSJeqCgr5ok
         ++TA==
X-Gm-Message-State: AFqh2kqekrkwws53zryQMnNpZDsqqmdR9iWxAok39hA0PgiJaw5A2WHs
	3I80efIAMm7nObH3ns+Uz4ahI8dgf78rbvgQ+S4=
X-Google-Smtp-Source: AMrXdXtsHIJbcu3mfBLfgZdP/kx/rbqHGAYW7mlFQs1pdM4hVHgKrk+xcoLCDqH+rDMhSQm3sH2kbw==
X-Received: by 2002:a17:902:ea02:b0:187:2f28:bfd6 with SMTP id s2-20020a170902ea0200b001872f28bfd6mr7305147plg.21.1671380004629;
        Sun, 18 Dec 2022 08:13:24 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c7-20020a170902d48700b001896522a23bsm5278763plg.39.2022.12.18.08.13.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 08:13:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/19] mpfr: upgrade 4.1.0 -> 4.1.1
Date: Sun, 18 Dec 2022 06:12:49 -1000
Message-Id: <9977278a12d6bc0b811077fa19c64b80e793a33d.1671379841.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671379841.git.steve@sakoman.com>
References: <cover.1671379841.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 16:13:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174792

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Bug fixes (see <https://www.mpfr.org/mpfr-4.1.0/#fixed> and/or the
  ChangeLog file), in particular for macros implementing functions.
- Improved manual formatting.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f733eddc428cf9537f97cb91025b73dd1fdea932)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/mpfr/{mpfr_4.1.0.bb => mpfr_4.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/mpfr/{mpfr_4.1.0.bb => mpfr_4.1.1.bb} (91%)

diff --git a/meta/recipes-support/mpfr/mpfr_4.1.0.bb b/meta/recipes-support/mpfr/mpfr_4.1.1.bb
similarity index 91%
rename from meta/recipes-support/mpfr/mpfr_4.1.0.bb
rename to meta/recipes-support/mpfr/mpfr_4.1.1.bb
index 2121dad57c..f531a88961 100644
--- a/meta/recipes-support/mpfr/mpfr_4.1.0.bb
+++ b/meta/recipes-support/mpfr/mpfr_4.1.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
 DEPENDS = "gmp autoconf-archive"
 
 SRC_URI = "https://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz"
-SRC_URI[sha256sum] = "0c98a3f1732ff6ca4ea690552079da9c597872d30e96ec28414ee23c95558a7f"
+SRC_URI[sha256sum] = "ffd195bd567dbaffc3b98b23fd00aad0537680c9896171e44fe3ff79e28ac33d"
 
 UPSTREAM_CHECK_URI = "http://www.mpfr.org/mpfr-current/"
 
-- 
2.25.1


