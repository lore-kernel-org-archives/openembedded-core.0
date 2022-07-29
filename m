Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942C7C19F29
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:47:38 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.48.1659106051068094151
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=8Hi4OxvU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id t2so4820410ply.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1CFtqkEZ3WKgiEWLfq6ewrje6ayzZ1a3BmKioN9rbgs=;
        b=8Hi4OxvUCWepAucLuWsSkCFEzD3TaEK/L8EhulbZU0bRXvT6T1m4ckdO8guq4bPcDb
         V/XcQsRl2S0gUk7b/4zfcabtELofYPdAJfjPCo9LTI6Nl2rOnhS9ulTSzMVBSjsXjGeq
         NgF/9mJw4/QhWOCY4epIUtfeKp6Gbl/IjazEFsyMMcnXcZmWvM0/fdAC7uSLpKNWy079
         3rxwBiBEoAX9r2Jp1a4M2QZufdD86tpCp1KNrQxC0/aP4zdaSnqhPlgR1bsXblWsHGP3
         u66vWYq/RCkH1u6jIHgSnK2iGr2DLDm5O0j7ql8lMenqD+E2xsrNBiLql4ST5OSnqKx2
         X8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1CFtqkEZ3WKgiEWLfq6ewrje6ayzZ1a3BmKioN9rbgs=;
        b=KLNg205jRb1dqDQHcfWwClKjXt2VLD1ivDvyz7pX2WKdojSDJ7A0lB2eF72uKibvrh
         KJHfy1lm7BPf8LNk4TQ+NkpNrDUwq83uQInGq9uDHS3xFLC6MqP8AnB01tzZDI2tjsHX
         gtno8DUyk9NfkzgYP15RYNkwcWiaQ/eOhowczNrdW4FbSROs3HR7jXBbIUU+Ugs3K6qz
         psbBX2h32qYjxyYtz/o48nSB80gOiNVaNJfTPp2oO3NFGMLC2HeGuUcb3hgSkj2ljLkZ
         L2HGqh70oT6d1TiDhyXTqxdfsciie+enmusa2tmPJyMKmvs2edOIckPfJf5eyOaQZNWh
         i9Ew==
X-Gm-Message-State: ACgBeo03nqKRAYeAMTEiYpFrPC9hZ0nFJH+2M3dG8/y/YzmA4sEg+Zut
	6RhpBi2cOiBPout7tC96k0dqxpybaa5NhB5W
X-Google-Smtp-Source: 
 AA6agR5Dc0IGtTiyE6fGvK5//tNCKbTpQs2dPzVDmbIrWQxgU20F9m1TymGkAe16iDU5O+PbYNrmDw==
X-Received: by 2002:a17:90a:9412:b0:1f2:59ad:1f4 with SMTP id
 r18-20020a17090a941200b001f259ad01f4mr5241594pjo.147.1659106049948;
        Fri, 29 Jul 2022 07:47:29 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00528c6c7bf37sm2958782pfo.129.2022.07.29.07.47.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:47:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/29] mkfontscale: upgrade 1.2.1 -> 1.2.2
Date: Fri, 29 Jul 2022 04:46:19 -1000
Message-Id: 
 <01f6eff02b872c9179b654a87857ba573a194f8a.1659105705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:47:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168638

From: wangmy <wangmy@fujitsu.com>

CHanges:

Fix spelling/wording issues
gitlab CI: add a basic build test
Build xz tarballs instead of bzip2
Use case insensitive comparison for T1 font weight
Add "ExtraBold" as a valid T1 font weight.

temporarily override SRC_URI which is hard-coded in xorg-app-common.inc
since new versions of packages use a new compression format - .tar.xz

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7ac5e224fe55db17651988435a569a8a25b6b09f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-app/{mkfontscale_1.2.1.bb => mkfontscale_1.2.2.bb}  | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{mkfontscale_1.2.1.bb => mkfontscale_1.2.2.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb b/meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb
rename to meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb
index 2d0c51a423..573b05128e 100644
--- a/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb
@@ -15,7 +15,8 @@ RPROVIDES:${PN} += "mkfontdir"
 
 BBCLASSEXTEND = "native"
 
+SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.xz"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=99b1e1269aba5179139b9e4380fc0934"
 
-SRC_URI[md5sum] = "215940de158b1a3d8b3f8b442c606e2f"
-SRC_URI[sha256sum] = "ca0495eb974a179dd742bfa6199d561bda1c8da4a0c5a667f21fd82aaab6bac7"
+SRC_URI[sha256sum] = "8ae3fb5b1fe7436e1f565060acaa3e2918fe745b0e4979b5593968914fe2d5c4"
-- 
2.25.1


