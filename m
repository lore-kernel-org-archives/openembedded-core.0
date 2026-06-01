Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676C9CD6E55
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 18:13:00 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5831.1780337575575449308
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 11:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=k9SaDJoa;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-69d7f4cc61aso4050492eaf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 11:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780337575; x=1780942375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=66Wwpx4BUJxH0yd0x27PxLemkL1Ts0ZU5bD3BZeFqVA=;
        b=k9SaDJoaSuTGmcUXyljLCciIyhZ2c8j6f7eBjX3TCdsJYF7tM5ndonYxWhj4ZubNHe
         pMDswtHlgFc59F/PF8NykR57Fc7hTK2CYOAR+b8Jjab9JbICiS24dB6H8b9RENNVaGsC
         sBIBPF11/GomGr0fU4MoO4EpIE8uzNMCPqWQQEMbOEQVtxy2KMYCsenI6Oe6xr4RG2bM
         1XHMQVUkoEGd0GVvGv2CYHPU0iuP0j0zPULm1NTz/Xh71mE+94UxQ+RS5BIYbwCzAIc+
         QYIQ5RpEsIaq4V2EZRJJUHa8xu0Om1Ji1YEzc5OE6mSh1hcH/aNgBwv219KVYChbB2dQ
         Dg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780337575; x=1780942375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66Wwpx4BUJxH0yd0x27PxLemkL1Ts0ZU5bD3BZeFqVA=;
        b=Aii9kq5/xKhxJpl6T+v7DejLmrr+x7elNfflUqaaN3PRHVEazIESaL9/zp4vOHqTLr
         Q10jQ4eQ+CNjuY/2EJ8+rx/8KA7x0EDe/Le8aBsHNO38qCCUqpiIuyz/Jt2LuWSrA5EY
         yq8IV5x6M23FUREDa6Mu7j+NJB9hNSIIczzslgIG3tbXBE10Iq3OxMIhspHpGwDFm73w
         j+BzdkdkkoSUK3j7yFl9SKe3jLxKOyw7Ko1SAnzo6CEYWwobxdQ1+ylwDc7J2+j3Y9+X
         BORGZLUfoI2h2FpydUm/5E0jkgGmlJdAOq/C3wxIX3JGvZRXBghaxgaN2BZXsbyUkQLm
         YVgQ==
X-Gm-Message-State: AOJu0YwCoWMkQJewWM47EEPcNT6+ykd9ajTPlm7iao7YUzTxoyTTnkRh
	PwP/x+H1OnJNPSy283DikA+njYHFDem4yzIuefTJar4k73nPkihW/X2Ll7T9yA==
X-Gm-Gg: Acq92OE+V4cgOwxR6helbmjBqN4N181dsW/PoP1jg13QsI37pSbbWWOXx528RaX2pYf
	dkzr9alJuuUpxlEIW4qMPmo3TT8+YyHtCD4vGzaNsCHsflGfa8POX0BpTHGtA4/Tux9LFceLK9N
	4oGxkSiOQrPeV2Dl2LPudh/WB6Kmh9ugKjSSxK6ixJsoBmiv+VuV+nHwjZzyiJzPMnKQxAtVJD6
	KSoB745hLfzQ9txZHhVNTBYawEzsSFGmZRX8TrI7UOhJGbTFb5wtmfsuSrtfA7Fw+2EMymSb4du
	khGBJ2EiuctQMQmENnByhqZnqYUq7ySHXVqBf9UYoTynY8025mMl0WIYbDZPvb3GoHGPrJTmpUB
	ibn9J9oDDVsW6p4DTnOpDQH2KmEYR2HmRTKIBlOYiHgcTbTJyUvx1VN1vWYUxpWuh9eL14L10hK
	AW3/BC9Jj2dVPVKdxYjm7Wfb6RDme3Up8=
X-Received: by 2002:a05:6820:99a:b0:69d:fe44:b398 with SMTP id 006d021491bc7-69e1053c066mr7713252eaf.27.1780337574591;
        Mon, 01 Jun 2026 11:12:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::399e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69e30afb3e6sm860649eaf.3.2026.06.01.11.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:12:54 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 0/8] Licensing fixes
Date: Mon,  1 Jun 2026 12:11:35 -0600
Message-ID: <20260601181251.123019-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 18:13:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237975

Cleans up the licenses on several recipes to use a known SPDX license
identifier if one exists

Joshua Watt (8):
  mobile-broadband-provider-info: Fix license to be CC-PDDC
  gettext-minimal-native: Use SPDX License Identifier
  glib-2.0: Change from Public Domain to Gnome GCR Documentation License
  python3-pyelftools: Update license to Unlicense
  ttf-bitstream-vera: Use SPDX license identifier
  sqlite3: Use SPDX identifier
  pixman: Change PD license to HPND-sell-variant
  util-macros: Remove redundant MIT license

 .../mobile-broadband-provider-info_20251101.bb                  | 2 +-
 meta/recipes-core/gettext/gettext-minimal-native_1.0.bb         | 2 +-
 meta/recipes-core/glib-2.0/glib.inc                             | 2 +-
 meta/recipes-devtools/python/python3-pyelftools_0.32.bb         | 2 +-
 meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb      | 2 +-
 meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb                 | 2 +-
 meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb           | 2 +-
 meta/recipes-support/sqlite/sqlite3_3.53.0.bb                   | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.54.0


