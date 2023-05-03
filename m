Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA10EC77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 09:03:58 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.14444.1683104629992136259
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 02:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=sFIiY0Lh;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-64115eef620so3151203b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 02:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683104629; x=1685696629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D9tggGmlB/9/al8LCtZwqthJoz+PFdSI0+mSuYjd3Qw=;
        b=sFIiY0Lh6F5rW84upQVtmNC5WPPLftTQ6KpGHBxHMO6+RHbPmr4ErgX+7TjMimPyXW
         T84wwciBtYICKiyJ3gVNiTypB8jeJpZ8YGyHXlh/e0brw2U5Nd8PtOsompBgpT51nW0G
         It3c+sKlV3GViz3l13W/nkDOxW8snKd4atJKXgtQHBq3w5vblhVF8hAgDL48Kzt3S53Y
         4uTVUIf7uQlA9Ncow07upsQHFotAjqZYV0pTJ4nWz/ymMe/ZOi3BheGxqVL9aMrgNTS2
         Z8ToNIFkJDsh0amfWHPyu5XXK5rd6BSJl2BvvJ18yuF3YIC9DrhvfMFNpeOkHmBl3Yiz
         i3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683104629; x=1685696629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D9tggGmlB/9/al8LCtZwqthJoz+PFdSI0+mSuYjd3Qw=;
        b=JpnLo63d+PRwfKzyv6Ny+iIhS/g10hdsZ6EhZmwWMNSIqnm6SWqX+hguBfELC4I7rB
         Qkzh4FCKYy2UVOiqX4Evyc2sKdfm9RP4PHA6ueR6tB3MKevsGVmC42Z0ttgWHZlyuhn/
         SCnFBhxgNixBggJSDzwoPxZVO9mlec5UFYdi9Q8IgWeLpyW8tcWQT/SXUoSlQ6mTiFWs
         BcaL/MHDylzU5pcz84LofmvNyDIhconhcdPbVTMnYR/PFaSBlegbEaBzapRPjKmUyjy8
         DKTylRApfPSZ9ELn4Csqqbu2WNiAnfRkpNhbXfwl57Y8H1hlqo3/48IWdBq05QzXASuX
         Lksg==
X-Gm-Message-State: AC+VfDzVa06CBOqrUE0x0k+23haeT76nxuLbzqdnjEygHiVrf+H/qj3h
	/CnryyaMzk5cFRggNBCkgMweEk69WJI=
X-Google-Smtp-Source: ACHHUZ6jA3nLqzN8/nv5vpDNl+smjXGltue13WKgpXAvM3s0MzkaN2BZ5fFX5acNVE+K8kFf/FrJGA==
X-Received: by 2002:a17:90a:fb4a:b0:246:9517:30b6 with SMTP id iq10-20020a17090afb4a00b00246951730b6mr1735347pjb.4.1683104628856;
        Wed, 03 May 2023 02:03:48 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c1:101d:b472:32a1:2248:5bbe:aed0])
        by smtp.gmail.com with ESMTPSA id b13-20020a17090a8c8d00b0024deb445265sm5962715pjo.47.2023.05.03.02.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 02:03:48 -0700 (PDT)
From: ranjitsinhrathod1991@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>,
	Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Subject: [OE-Core][master][mickledore][PATCH] libbsd: Add correct license for all packages
Date: Wed,  3 May 2023 14:33:40 +0530
Message-Id: <20230503090340.68872-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 09:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180791

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

BSD-4-Clause is only applicable to the {PN}-doc package as when I
check for the source code I find below files which only uses the
license BSD-4-Clause

~/sources/libbsd$ grep -rl "All advertising materials mentioning features or use of this software" *|grep -v \.1|grep -v \.5|grep -v \.8 | sort
COPYING
man/arc4random.3bsd

~/sources/libbsd$ grep -rnB5 "BSD-4"
COPYING-9-Files:
COPYING-10- man/arc4random.3bsd
COPYING-11-Copyright:
COPYING-12- Copyright 1997 Niels Provos <provos@physnet.uni-hamburg.de>
COPYING-13- All rights reserved.
COPYING:14:License: BSD-4-clause-Niels-Provos

So other all PACKAGES should not contain the BSD-4-Clause

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 meta/recipes-support/libbsd/libbsd_0.11.7.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-support/libbsd/libbsd_0.11.7.bb b/meta/recipes-support/libbsd/libbsd_0.11.7.bb
index a9f7a00469..5c958f950e 100644
--- a/meta/recipes-support/libbsd/libbsd_0.11.7.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.11.7.bb
@@ -29,6 +29,13 @@ HOMEPAGE = "https://libbsd.freedesktop.org/wiki/"
 # License: public-domain-Colin-Plumb
 LICENSE = "BSD-3-Clause & BSD-4-Clause & ISC & PD"
 LICENSE:${PN} = "BSD-3-Clause & ISC & PD"
+LICENSE:${PN}-dbg = "BSD-3-Clause & ISC & PD"
+LICENSE:${PN}-dev = "BSD-3-Clause & ISC & PD"
+LICENSE:${PN}-doc = "BSD-3-Clause & BSD-4-Clause & ISC & PD"
+LICENSE:${PN}-locale = "BSD-3-Clause & ISC & PD"
+LICENSE:${PN}-src = "BSD-3-Clause & ISC & PD"
+LICENSE:${PN}-staticdev = "BSD-3-Clause & ISC & PD"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=75e85c5a558f86d10fbd5abc567ea5e6"
 SECTION = "libs"
 
-- 
2.25.1


