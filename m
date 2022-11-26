Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C378C4708A
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:15:16 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.70815.1669472109990903223
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:15:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=liKTjW+L;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id w37so954183pga.5
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c1+gNN7mv89vycgIO5MxP3HMhn1+r66sspe4mTVQyvU=;
        b=liKTjW+LksMVG4qYml8Hrk/vjEsnEFFT7rqZvNK+sfnwH56o2pN19Dtt0vluL1Z1Yc
         Jvr+2eeummiAAxWmvhkbDBvuNraX8RExLlrqJHuw8y3zHKdlBcSXRGtQrhHjgM1Eh7qO
         7+Rt+Ul1Vg3XmifIB5kLuzl5IqZQ+ryDKLAF3+zEEZDJcNpISuUqg+nwZu2/Rg7FwmJz
         8sUV22D2uNBFzNmOTEMwLJcuhaWYRDn3lFZKCnUrf9wa1L2aP7DdAOCShr9+hfZ9aTTb
         LMxsHoQYW1kKEU81v+1UD/V8prQWB3tpWqddiTonHuYf97ZqJ2s8+1Bsn4uYOxQV+n3s
         wR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1+gNN7mv89vycgIO5MxP3HMhn1+r66sspe4mTVQyvU=;
        b=5IqChbJ+SwfKK0f0+NT6znPGFezJAlhb/c8vqG3wXgvXiTO3UsYNBro000v1bby9yU
         bE8bBGEYsd0R7GPwqKmtefIUMF8MXSvdfBp0KcppZ1rUINwzplLifvudk2qjbLP67EO+
         H0UnvCX86JIO7gAkDZ7E8va8O55AnqPbydIvnTlLfCdGrhogL5fY/44tViWTVGU4VAk4
         PDxFVLx5ZCqxVP1I4EyIyK+2P0ON3ytwd+lT8N3gXHzxKq8z3ZYHOXnPoltyoKovvkR/
         FtImxyexhVQFLnOPElqwVyzt36kHrFfeKoBKUQQya5g0nshWiqI4uTsretsnzXWxPIPm
         ++gQ==
X-Gm-Message-State: ANoB5pmMVaw78caYCJ7ImUklwFXzUX9GL/XFldiz2TFfxczV7JAkC2QV
	vS12AbuKuxjebgIaO3bxA+nOjZT4i6Xn8v4uRY8=
X-Google-Smtp-Source: AA0mqf4UGhUYn+DI25yvNQI1LiKa+NJDlWFDExluCubJgv7PUcUjr9QxygQHHg/L+nPuFE8hvm+JLA==
X-Received: by 2002:aa7:9057:0:b0:573:1d31:2b78 with SMTP id n23-20020aa79057000000b005731d312b78mr25414929pfo.61.1669472108911;
        Sat, 26 Nov 2022 06:15:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.15.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:15:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 06/37] libical: upgrade 3.0.15 -> 3.0.16
Date: Sat, 26 Nov 2022 04:14:10 -1000
Message-Id: <4a015b9891f68f59b7f7c98797953859abecd3e8.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173799

From: Alexander Kanavin <alex.kanavin@gmail.com>

Version 3.0.16 is a patch release.

- Fix regressions in 3.0.15 due to improperly tested fuzz fixes
- Fix argument guards in icaltime_as_timet to match documentation and tests.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 77d4557d6f6a1405d03bb5dc7ca23d7ee78c2037)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libical/{libical_3.0.15.bb => libical_3.0.16.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libical/{libical_3.0.15.bb => libical_3.0.16.bb} (96%)

diff --git a/meta/recipes-support/libical/libical_3.0.15.bb b/meta/recipes-support/libical/libical_3.0.16.bb
similarity index 96%
rename from meta/recipes-support/libical/libical_3.0.15.bb
rename to meta/recipes-support/libical/libical_3.0.16.bb
index 1ceb0005cd..61599b20dd 100644
--- a/meta/recipes-support/libical/libical_3.0.15.bb
+++ b/meta/recipes-support/libical/libical_3.0.16.bb
@@ -15,7 +15,7 @@ SECTION = "libs"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch \
           "
-SRC_URI[sha256sum] = "019085ba99936f25546d86cb3e34852e5fe2b5a7d5f1cb4423a0cc42e399f629"
+SRC_URI[sha256sum] = "b44705dd71ca4538c86fb16248483ab4b48978524fb1da5097bd76aa2e0f0c33"
 
 inherit cmake pkgconfig gobject-introspection vala github-releases
 
-- 
2.25.1


