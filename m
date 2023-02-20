Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 777E1C64ED8
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 14:19:00 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.14063.1676902732898912906
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 06:18:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=vS1yTBcV;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id p6so751257pga.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 06:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3PXFfLKUTRkAo017Z7Qn6oLQQ3ethLL6HGgeYyHNdng=;
        b=vS1yTBcVOPIgUsz4cZ6O6+DHyMgQutEjl1dC2GCIkNEXwJQF5X92wIpGTMKqjtGtuz
         fiQ8cPYUZuvbOxFS1pEo6J7LBhApdF8j24dvZUGKOMTj1RcoznDpA9Kw0pFmP8p42RJw
         ovnqZHQ7HrNEUhQwn7hPLJmP+212pCawZslDN72dsBVW+jMk9Gahp/Sx6B/lEi4N57ww
         pvoc0spkYqwaUAE7CdJsGzcI24hZcCsYx7RRp1gbruyhkNOFJoe7RWNP/hgTmlqPlw50
         ETi+j8xPpRR2/lCz5re4yK1R1Gb3qReagNsk1zOr9LrXFvRd0baVO4Fx87eVxVMYW7v+
         iVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PXFfLKUTRkAo017Z7Qn6oLQQ3ethLL6HGgeYyHNdng=;
        b=s07PuiK+va4a3xxP8LooLDOvY3KzCfBNcnTTyMFUMnXXmmuIjKrAsrl71JukI+UODr
         +qUOyOoWtUCqAYYvoTldqdvG7xSx6DuKbFb1porJ+tZOM/3wuJ1plZixZa1yZjGycsNg
         2l2oD/otpWE95IoX9h9DyuP7pMN8LD2B5YZmVe9UIs6Gosm4yNQDXJR9xPTVCkOtvYFs
         ewJJIktzdmKnmQdcO7BW43kTfAiCkV9aU6rC8ozX4PEbo8PuTwQstvf/Bae9CHEmfmsf
         xVuGMsjlnhDK51RAFwUnauCAAul22ejqCc6+ufMvgdG0D9tOO7S9BN2H+QdjwKIpWcGy
         Dxlw==
X-Gm-Message-State: AO0yUKXpbY0g6GfXrkq9tyDLAkZJTZugC9VY1h6EUg3YInxX9gDRziZ2
	4ZI1mr6wUkiyDFz1hWwNwvp8HZhtGuEe1wdZmDQ=
X-Google-Smtp-Source: AK7set8UcVA+Mdq24K1ay7o0qNbWCyCJmDjXGW+5U3BtFVk50t/7ureXn+jVqYbNz6zgnZ+L0GgtEA==
X-Received: by 2002:a62:6185:0:b0:59c:3fd7:45de with SMTP id v127-20020a626185000000b0059c3fd745demr2961173pfb.30.1676902731939;
        Mon, 20 Feb 2023 06:18:51 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id q19-20020a62e113000000b0058baf8694e1sm7789297pfh.71.2023.02.20.06.18.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 06:18:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 08/22] pkgconf: upgrade 1.9.3 -> 1.9.4
Date: Mon, 20 Feb 2023 04:18:15 -1000
Message-Id: <7b7cdf017d10c1c387f5ae4a35c763b437ef2673.1676902605.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676902605.git.steve@sakoman.com>
References: <cover.1676902605.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:19:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177414

From: Alexander Kanavin <alex.kanavin@gmail.com>

Changes from 1.9.3 to 1.9.4:
----------------------------

* Fix a buffer overflow vulnerability involving very large variable expansions.
  CVE-2023-24056

* Fix a bunch of minor regressions with the solver.

* Create separate solutions for `--cflags` and `--libs` when `--static` is not
  used.

* Remove final trailing whitespace in pkgconf_fragment_render_buf().

* Revert broken pkg.m4 change involving querying module versions in
  PKG_CHECK_MODULES.

* Fix handling of tildes in version strings.

* Various C99 formatting string fixes involving SIZE_FMT_SPECIFIER.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ea19dd90b367eda92aa01bc5131d126ed6d22280)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../pkgconf/{pkgconf_1.9.3.bb => pkgconf_1.9.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_1.9.3.bb => pkgconf_1.9.4.bb} (96%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.9.3.bb b/meta/recipes-devtools/pkgconf/pkgconf_1.9.4.bb
similarity index 96%
rename from meta/recipes-devtools/pkgconf/pkgconf_1.9.3.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_1.9.4.bb
index 453da89c3d..ab0f371093 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_1.9.3.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_1.9.4.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "5fb355b487d54fb6d341e4f18d4e2f7e813a6622cf03a9e87affa6a40565699d"
+SRC_URI[sha256sum] = "daccf1bbe5a30d149b556c7d2ffffeafd76d7b514e249271abdd501533c1d8ae"
 
 inherit autotools
 
-- 
2.34.1


