Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB520CCA47F
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:38:05 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web12.64412.1656877082725884684
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:38:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=QTdEzcOT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id b2so7179404pfb.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yFgaEUCiqu4atmelxPg+yl/U+rcF4BOUbOz5j5FaiWM=;
        b=QTdEzcOTXBvamRPomEKQr4KQ0K7ASanvXgIKFJSXIPjfpza0ZltAmwHzJDABlyEnng
         fA30McJr4VN+tsUrFGIUrAYOUTLOwqgFELgUj5TJ9da0Z9nLAJUigDKNicODzUsrHPfP
         b1fh/P2BuZvym4ni3TZ1cIh36qNfg7jJSEF8t+t9+A6GJS7mdryeoCbPob4Ewy7cHEvr
         /Xkr5ntfaIZAUraYVGy/bdULPuDqVwN3mFO8m/0k1anCaCdTTrHmCqlWoRXigSZygQ8A
         w+I5JgilnjV4OmEJ77WQ3FPnXTOxKDse3E1jfZbxXNS0x9D4reKdf/9cVA5o1dTma0GL
         +xrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yFgaEUCiqu4atmelxPg+yl/U+rcF4BOUbOz5j5FaiWM=;
        b=4FsZAAoYPNXt8DvhxNrSHgfddPfAY8PwCIgKPyTUQvarynuqOQz/8TWf2QG1mk5DFn
         yBgzu4RdTiJAynkUBP/082scZVXSeAyF6qtKyDM+fHueCldUGRTLTyBFlrV7xMJXztC8
         IZrLaIFr84MUg91GbbJ5aYhXin+nC1BG2mfdFNOmQyqcgUHSZKIz9yOVbTaLqz5O/1Hd
         xIyg8E9t97ZZTa5yLJ9bhX183MVsVclsiT1OY3QU8I3gc7IGsN/rP/kPk4F5D5vabcJR
         f89VewPuj/STk1scgB+cVGnLkUXNDQyzGkrUuVNzn2bU9vgIf6ModJiseYT9S2fI/qci
         VGxQ==
X-Gm-Message-State: AJIora+vVrbMn7nTVkAwvuY/9q9a++az6nC3oQpdk0kC9QV0bvvd6pTf
	Nb2UCvVDF2Q/xcHlxaTeywLfvoETml3aOYD+
X-Google-Smtp-Source: 
 AGRyM1uFGRIz8+ReXE6uylIC2EhxEsMZjcP0TwfTlrCLkGjfA+PzLiVsApGlvR2SXhwGRoBo5vt/UQ==
X-Received: by 2002:a63:86c7:0:b0:40d:af99:608 with SMTP id
 x190-20020a6386c7000000b0040daf990608mr22311357pgd.515.1656877081773;
        Sun, 03 Jul 2022 12:38:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.37.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:38:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/30] at: take tarballs from debian
Date: Sun,  3 Jul 2022 09:35:56 -1000
Message-Id: 
 <e52deac4f3a4fc7c064d9fc67bdae314efd329f1.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:38:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167581

From: Alexander Kanavin <alex.kanavin@gmail.com>

The original site went down, and at is more or less
maintained in Debian anyway; the tarballs are identical in name
and content.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5fcf9e5c368188e920a995492b342012cbc7016d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/at/at_3.2.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/at/at_3.2.5.bb b/meta/recipes-extended/at/at_3.2.5.bb
index 6769eb364b..87a436173f 100644
--- a/meta/recipes-extended/at/at_3.2.5.bb
+++ b/meta/recipes-extended/at/at_3.2.5.bb
@@ -22,7 +22,7 @@ PAM_DEPS = "libpam libpam-runtime pam-plugin-env pam-plugin-limits"
 RCONFLICTS:${PN} = "atd"
 RREPLACES:${PN} = "atd"
 
-SRC_URI = "http://software.calhariz.com/at/${BPN}_${PV}.orig.tar.gz \
+SRC_URI = "${DEBIAN_MIRROR}/main/a/at/${BPN}_${PV}.orig.tar.gz \
            file://posixtm.c \
            file://posixtm.h \
            file://file_replacement_with_gplv2.patch \
-- 
2.25.1


