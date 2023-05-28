Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 868A0C7EE31
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 17:08:18 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.33140.1685293694103172809
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 10:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=xEuReRHg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-64d341bdedcso1829412b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 10:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685293693; x=1687885693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FMm/vh4jLVg1mqdyCxCKSnnRqaAKu8NPBzfS0dPxCmc=;
        b=xEuReRHgo3Eh5f2p7REGZ9jXlDNyHuMMYGo4JtMOoufWy+BhVaTAsH0qNws1FdBobq
         wpXdeO0wpSN2KosTQFHi9owUZN7KMj9jOTwTQdiDGBwkyS+s5xTFG0PVdrLlUUnh2j3V
         thIet5S2W2MaJfT/mApFqNaFY9q9FVFOi3RwdyMDj27/k6uJoReeOt0ws84/ihzNhYWc
         L3t7lkR2b43h1K4hSIMxdXyaQgkeLQV3g2rl76jL7ZRnuEmBs5ickCGhJl3qjPGhQIPV
         UF4c79+WNDxMzN8stg2+NIZ3z7t4CtMKJ7G8tY+Gn6l9QSQCvlicRX67fFUNcKnL3DrA
         FFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685293693; x=1687885693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMm/vh4jLVg1mqdyCxCKSnnRqaAKu8NPBzfS0dPxCmc=;
        b=eVFW92owly+m3+5TmBf99wRyeIoB6Obuocq24K7e2AfZlpc0862eHeePDcSzK4RWfY
         UbIyhXKztxIvl+iI8UF/rlVSWdsrGrlbEN8nzutCSC8rNZb7MPB6F4Twft6yt1XLRNE8
         GutiGtQevTwmhugpoSS1/sQ5rLeUCZQGKI5VzTxItrM7BTyb0LCn//KjntnE4VsyZGF6
         txOYk1P8hBycvES1Tz/TfpU9ymDGx+ZhLLCwPKxW1jESYK1F1EsynTKAiD3kY4fG7arW
         rYIFHlU3WSNCo4Z2RWQFknQD2f29el04sIN+rMEgFFzXIQnIdL83iPXDFK9yOgEHkvUK
         D01g==
X-Gm-Message-State: AC+VfDwRuRQr3x1l+2AmH+3KGeceCEemuMnqWkQiC0SNQwmkqJTPR17M
	uKk/Iv7IADjLifWMDFFOOtryUCml7JPfPCtfeiU=
X-Google-Smtp-Source: ACHHUZ6MWrCgDTOezHnAZDLa3sOsAmw/8gJhyiaAvHnm741QKpQxlKSXc0ZlXTNb0gGOPFyw+MAw5w==
X-Received: by 2002:a05:6a00:845:b0:63b:5c82:e209 with SMTP id q5-20020a056a00084500b0063b5c82e209mr13611119pfk.10.1685293693135;
        Sun, 28 May 2023 10:08:13 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n23-20020a62e517000000b00625d84a0194sm5363425pff.107.2023.05.28.10.08.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 10:08:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 06/12] libbsd: Add correct license for all packages
Date: Sun, 28 May 2023 07:07:49 -1000
Message-Id: <5f4111fa1b5f2fe35fca854eed08eca415c5a3f1.1685291299.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685291299.git.steve@sakoman.com>
References: <cover.1685291299.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 17:08:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181841

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
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fe57f5ec7fa46f595a302275ce3063d53634c00e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


