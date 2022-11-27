Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 434CCC47089
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:56:13 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.92043.1669557354101781715
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:56:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=PxuISd+N;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so11583580pjs.4
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S5U0x5dFqMCqGAixpDpKVX7MEX/WijEqnfTI2e10cv0=;
        b=PxuISd+NwbTSR6SsGrE+HGWtD/VA9FWjFH005px/prJuLB3tQTrHyem46a3cl+l7/6
         jn9sZolaYOtE2Cg7NHFXcuOLn+v2utbZmBQrgb8unZE0iiF1NRq6/nMxZxoWBnQRnf9c
         F0mAWu83xNSbJP/N7UIVOdBhF8jP56ego0SYE3K5HFGk4n7ig+YV9s9bOXoThnNpBeIn
         DMB38bXpeI94Tnh0LK00hM+EDdCUySxNR16LKy6Gpqa2DhoUgu5cmPkj0bxzXLiFdsdW
         Y/gxmln31ilO9QwyOHi7qwOhkMmZ7gs6pcHiR5othlM0rs8JciTBcm9RQjtIOwPfdoTj
         Is5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S5U0x5dFqMCqGAixpDpKVX7MEX/WijEqnfTI2e10cv0=;
        b=lZeWu36hVoslZ/gQj68WYeK4a8NwVxozEGnb90Rjqzdhd9Xu4koAS5BICObBKKEcwA
         r+nYE2NTZK0JT3OZBmXy1/q0IKCVVcciAy5kvaVAJylH9iXFGstQ9aPCBJEg1Ur9OD8B
         MIwZohJoXOiGgK6z/rpMOE89HXgyNe7LjKQdc0DjAuwKfBxukj1ixWzQDO7DSzgAph+5
         rUa0jQAYbRLlIlk3TaKJUaNDnj8iAXkUrMdzHnLiDS/t5rm/sQv9qlVVbPDj2R+BN/my
         N+a88fsOW7a2MZRx9Zmn8Ut6tl4fwq/fQ2xrPcV4Df1zFwXqMvJASh77Emw37o4xeENK
         7PVw==
X-Gm-Message-State: ANoB5pm5G0l0qsZh10FR3tKIIoo54oH8ejoSNxHacImKyELtIYRWdC4c
	XuzrNaHmEvMCBcXxs5E1OLSIzGbvCGe1/bK3Duo=
X-Google-Smtp-Source: AA0mqf77EWCH91jBZwtPMV2OEG2Y5S6VJQTyRoqPCsjsiTnMBzWNKCq6HsqzSs2Ejrkt8DlzqGuSgg==
X-Received: by 2002:a17:902:848d:b0:17f:8097:83c1 with SMTP id c13-20020a170902848d00b0017f809783c1mr31050328plo.10.1669557370724;
        Sun, 27 Nov 2022 05:56:10 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.56.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:56:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/31] iso-codes: upgrade 4.11.0 -> 4.12.0
Date: Sun, 27 Nov 2022 03:55:05 -1000
Message-Id: <017abb138460978e87c84c509f9af7524a053e1b.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173864

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- ISO 3166-1: Update name for TR. Fixes #38
- Translation updates for ISO 3166-1
- Translation updates for ISO 3166-2. Closes: #1020633
- Translation updates for ISO 3166-3
- Translation updates for ISO 639-2
- Translation updates for ISO 639-3
- Translation updates for ISO 639-5
- Translation updates for ISO 4217
- Translation updates for ISO 15924

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 99917b4b7d5642b292cb95c770871b95e411dfc5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../iso-codes/{iso-codes_4.11.0.bb => iso-codes_4.12.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.11.0.bb => iso-codes_4.12.0.bb} (94%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.11.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.12.0.bb
similarity index 94%
rename from meta/recipes-support/iso-codes/iso-codes_4.11.0.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.12.0.bb
index be573981b0..ea7c43cdae 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.11.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.12.0.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;"
-SRCREV = "2651d7fe65582263c57385a852b0c6d8a49f6985"
+SRCREV = "5e4dddbd1f8902ab0252ccbb19b783cc0359505a"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.25.1


