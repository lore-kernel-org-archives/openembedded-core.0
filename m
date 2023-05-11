Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7692EC77B7F
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 21:28:38 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.8925.1683840511809461615
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 14:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=35P0dXPt;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-64384c6797eso7427391b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 14:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683840511; x=1686432511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WInWRzO/L07qH8jaWkky5Aq0zD9A5N7d6N3BRjsggK0=;
        b=35P0dXPtZxSMp+psqkibowbv73ehIGXkMx52RN36ECRp2HfSJ+BDU9+A+md4bAJaZJ
         MaKeXtMXcv+odUT4wonmRud7A7mOiPuSaXMEkvQ4gs7NNU0ZUgWWkvBTwSLJN/CG4VWE
         zWI9SDJ78Fmrh1qcDEIv9tryFuKrzYAM315l6BX+QcTLOB6DG/tIeYvNHcvmEmrM4wry
         wGHk0FaqeOo7Ce+1Oxi2XXf3RWe5k1YhZ2OdlRHSLT4no8bjBYtKtq6orJchenpTzTDi
         spkSrqdw4IEaH5ii0iZsO9NqjPSiaaA9sja5nL/Bw/MGfXEPzFa3IFTuKW72BlJ4+h3l
         941w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683840511; x=1686432511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WInWRzO/L07qH8jaWkky5Aq0zD9A5N7d6N3BRjsggK0=;
        b=AAHjc1IVMC7MMSvMVgKMTRLzgbvpVX53pFTyamY6MghzP0gjD2jMe5omfsUGnXzu3n
         niGaOC7wEqvbJRzNVoxBJlaLR3YWkCoHlpgVlAJZ6QzPabHlkkFfOs1vLDAZKKQ7B8b4
         gY76NbE/0+O7cAQaJyQYP3cbIZ9tA9x1X6xLjQYHo7qD2WB5FaNb8RbE400WEMe2cuVQ
         T/AK+LFB+8ZJIduHp8woPqw3zVDqS2ZeiGEk/PfsA52E+Q/rLDdQd/iDGSygBNNkYWzy
         k82GRP41W6aDmglZQ+nPKchSBgXmyzQ/hi2qz+Okt1skZUMWGnwmKt9lEEnY/OPDenxu
         Dtzw==
X-Gm-Message-State: AC+VfDy+5o0Oncskrj4bb9owbz7JLEPXjrfNMithZ25qka2+WmGiTafe
	SgqYbQtd9aHvSAIptpvDsZ7Rvm7kuVwEmdHbddY=
X-Google-Smtp-Source: ACHHUZ7xhTgbEAeiPA9ACw2UH+6wvzGRRmpNhVuyuKUJAC5SeL2zeFVRQlCtacAqMM2gv2kUeqx4PA==
X-Received: by 2002:a05:6a00:801:b0:648:d20c:37dd with SMTP id m1-20020a056a00080100b00648d20c37ddmr7476068pfk.18.1683840510976;
        Thu, 11 May 2023 14:28:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e5-20020aa78c45000000b00640defda6d2sm5671981pfd.207.2023.05.11.14.28.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 14:28:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/7] libbsd: Add correct license for all packages
Date: Thu, 11 May 2023 11:28:10 -1000
Message-Id: <187f1588240a0eb5cc753c2114fd6c0cef66e14f.1683840390.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683840390.git.steve@sakoman.com>
References: <cover.1683840390.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 21:28:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181152

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

BSD-4-Clause is only applicable to the {PN}-doc package as when I
check for the source code I find below files which only uses the
license BSD-4-Clause

~/sources/libbsd$ grep -rl "All advertising materials mentioning features or use of this software" *|grep -v \.1|grep -v \.5|grep -v \.8 | sort
COPYING
man/arc4random.3bsd
man/getprogname.3bsd
man/tree.3bsd

~/sources/libbsd$ grep -rnB6 "BSD-4"
COPYING-9-Files:
COPYING-10- man/arc4random.3bsd
COPYING-11- man/tree.3bsd
COPYING-12-Copyright:
COPYING-13- Copyright 1997 Niels Provos <provos@physnet.uni-hamburg.de>
COPYING-14- All rights reserved.
COPYING:15:License: BSD-4-clause-Niels-Provos

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libbsd/libbsd_0.10.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-support/libbsd/libbsd_0.10.0.bb b/meta/recipes-support/libbsd/libbsd_0.10.0.bb
index 5b32b9af41..58925738cb 100644
--- a/meta/recipes-support/libbsd/libbsd_0.10.0.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.10.0.bb
@@ -29,6 +29,12 @@ HOMEPAGE = "https://libbsd.freedesktop.org/wiki/"
 # License: public-domain-Colin-Plumb
 LICENSE = "BSD-3-Clause & BSD-4-Clause & ISC & PD"
 LICENSE_${PN} = "BSD-3-Clause & ISC & PD"
+LICENSE:${PN}-dbg = "BSD-3-Clause & ISC & PD"
+LICENSE:${PN}-dev = "BSD-3-Clause & ISC & PD"
+LICENSE:${PN}-doc = "BSD-3-Clause & BSD-4-Clause & ISC & PD"
+LICENSE:${PN}-locale = "BSD-3-Clause & ISC & PD"
+LICENSE:${PN}-src = "BSD-3-Clause & ISC & PD"
+LICENSE:${PN}-staticdev = "BSD-3-Clause & ISC & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2120be0173469a06ed185b688e0e1ae0"
 SECTION = "libs"
 
-- 
2.34.1


