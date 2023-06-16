Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A89EB64D8
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 14:37:38 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.205.1686926249807530730
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 07:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ljpTCT/R;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1b52d14df27so5358225ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 07:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686926249; x=1689518249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h5Fshd20CtY7I8m2e3lvQBYH4aUXQGAFqxeizaqbtrA=;
        b=ljpTCT/Rk0F/4blCKMcWHaDRzisNQF88ebJv5Jqk+267yBnlF5NrvC1W9bp86GYXaG
         98tLJaniKKnSPX9pf9XWiVvVwfhckLdsBumdrtvH++fHl/BFyXAIi/HH7YZSTeWEbUEa
         4CwEqXruwiLQuVAJzk4W5F0L4+jM2yyGk8alA2ilmYBg0IEj39DbIe1MPzTy8XGidmvd
         2lYMPZ84nyez7Dp/xpG6lV0rhSoSycRicmwFhwGYT9yLUwm/kMvlgm9AQgUjdYsdqnFm
         adrK5jm/P6MlfR2dkxJfj+NDCYBQIL/jUhGF27p+yx96VJQVJQ3kX8UJdajEINE0+Qam
         VBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686926249; x=1689518249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5Fshd20CtY7I8m2e3lvQBYH4aUXQGAFqxeizaqbtrA=;
        b=ZfvtwuxhVBO01O/v/Oemv4wlZSMR+sBbKsvj8IobMoAG1KtR9Hf2D+ldfq+PKWMzbf
         GdVlOaqbuV7PYPzQlhWwJGz23SB4nm8kqbeaSU4JL9eHm7IdDml9/lBMcqO3/QXKfRdo
         XsBY/XvqF0hkKS6J9UPEmB/fjm1iT+PK2Ea7R2UmBGdssR/EN/XMZFO5k4UpMqPeUKAT
         lwFUCE+wlhZ7Dg2VYIZpcDcgX62X9ngMN7TPWCcfJQGjE4UhhEDrGstMF+UFgwgiEYue
         dcxzp9UiqasD6OxK+fhzHPx0Ldq1Hqbwnn18p/OjyreOKygUXJiFlmhrt2eDCU2oZWvD
         QmHw==
X-Gm-Message-State: AC+VfDx+oT97H4UBs+LFt4TbGkFPDYDQXzry04DOy318LPvXYHA7Cpid
	G2PuOPGYE+vEwwUVKMGyJhMUuLIHBca2mUkUETo=
X-Google-Smtp-Source: ACHHUZ49m/07aDDrjy1io4uFUJrZ7R90zgWCvjLkLFjT8Xoxbk6Zq2/TebIucmJuI7Fz2qZ1i+iWgQ==
X-Received: by 2002:a17:903:54d:b0:1b5:391f:7642 with SMTP id jo13-20020a170903054d00b001b5391f7642mr849751plb.31.1686926248854;
        Fri, 16 Jun 2023 07:37:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k21-20020a170902761500b001b03f208323sm15865547pll.64.2023.06.16.07.37.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 07:37:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 04/24] busybox: 1.36.0 -> 1.36.1
Date: Fri, 16 Jun 2023 04:36:55 -1000
Message-Id: <a30ec03e3b59a596f48b9a6b8cf1d41d76e33bf3.1686925952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686925952.git.steve@sakoman.com>
References: <cover.1686925952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 14:37:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183025

From: Andrej Valek <andrej.valek@siemens.com>

Bug fix release. 1.36.1 has fixes for line editing, detection of hardware
sha1/sha256 support, unzip (do not create suid/sgid files unless -K),
shell (printf and sleep with no args, handing of SIGINT in sleep), ed.

- regression on x86 is still in place

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 09c5499f5885662a55a8810078e7208a1696b29f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{busybox-inittab_1.36.0.bb => busybox-inittab_1.36.1.bb}    | 0
 .../busybox/{busybox_1.36.0.bb => busybox_1.36.1.bb}            | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/busybox/{busybox-inittab_1.36.0.bb => busybox-inittab_1.36.1.bb} (100%)
 rename meta/recipes-core/busybox/{busybox_1.36.0.bb => busybox_1.36.1.bb} (96%)

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.36.0.bb b/meta/recipes-core/busybox/busybox-inittab_1.36.1.bb
similarity index 100%
rename from meta/recipes-core/busybox/busybox-inittab_1.36.0.bb
rename to meta/recipes-core/busybox/busybox-inittab_1.36.1.bb
diff --git a/meta/recipes-core/busybox/busybox_1.36.0.bb b/meta/recipes-core/busybox/busybox_1.36.1.bb
similarity index 96%
rename from meta/recipes-core/busybox/busybox_1.36.0.bb
rename to meta/recipes-core/busybox/busybox_1.36.1.bb
index 8014a5c7bf..968dce65e4 100644
--- a/meta/recipes-core/busybox/busybox_1.36.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -53,4 +53,4 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
 SRC_URI:append:libc-musl = " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html
 SRC_URI:append:x86 = " file://sha_accel.cfg"
-SRC_URI[tarball.sha256sum] = "542750c8af7cb2630e201780b4f99f3dcceeb06f505b479ec68241c1e6af61a5"
+SRC_URI[tarball.sha256sum] = "b8cc24c9574d809e7279c3be349795c5d5ceb6fdf19ca709f80cde50e47de314"
-- 
2.34.1


