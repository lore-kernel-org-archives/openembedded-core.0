Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B29CF3C9B6
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 16:30:14 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24465.1771950610921859123
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 08:30:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mQZeTcoQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso46438265e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 08:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771950609; x=1772555409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yp86hc/HGSG2WasVGFlOIGFbOLziWU33WtN9PrAf1AI=;
        b=mQZeTcoQvC9t/kXbDbMuP/RqzI7aLdNrtbAPzf7d+pOaCQiTv37P5+EHqFMtpn2RsG
         pOSNg7Z2MvLZB0yavedqTLwfrhlIO7r7I7T9W04CbRW+Qoj55hD1humTIg33fZtErSBS
         8AfG2CMbZh9r4nqgJ7IHezDq7iHGnDMirLXJKkVtr3VjrFRHsrzmeVMqnrxOzVX3aGap
         Yj1aj6z5fWFZ54gqXpXv781nqUYCfLXYHSFGAOWEgRZWjqt9SmT3bdwb+fbOhRGDlfwm
         UU9U5C11Ozi6QBBZ5DoVAglQPqMCHBFReTXDrBu2N3h4sF0Ajt20x13POXmBCcFGqSdk
         bUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771950609; x=1772555409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yp86hc/HGSG2WasVGFlOIGFbOLziWU33WtN9PrAf1AI=;
        b=geGE70fwoRISRRdSXZ87cIeIYXxdu99TQxp8t5FQY7q+xvZdrNHE9kAbKPGE1JXExM
         pgoqD40to4J9X8NzwyAyufVvbfRrBOPbeh4FIwblKxKyX0ToSJ7l4GiAH9f7VV8l3b7i
         UcLzbD1qhvHvIwN2v4hp536awyhNf5A/i+sfXzvT6b6rBt828KBC70/jM8OZQ7j4ABBg
         s6OadkISvc+Kzo/uCqk12el/kOPatgIdiNjrBIEehPiZvppSJpobFjgtZ8zMHRArS0tO
         hDDHeIOrGfqNmsWiH7iLASpYS4xqDqHJ7ov0xvrdA+aBUhRZkNVFoArHMyBeifn9OzJ8
         207Q==
X-Gm-Message-State: AOJu0YzyUf7IUKqAP/pcvxA4JsafGaXPvV0F5T/II7u6DXlEeLb2hTIj
	bw/mmnXSaP5nWgmmCO451EDZxIv3ICDsAwF0oKN56UomTuHN4Dc+/78GFNmiIQ==
X-Gm-Gg: AZuq6aI1YkCTbV5IRD1Q25RFoegy8M+xlFMMt5yRqsTF4Zz5oSEnzEoYHYZnDci2foQ
	mpgC5k/vTmZGY3+61NrKI3gm1e4wVyDJEMimAYSSN2SCdY68XcdngMq9gooe2kAhgr2N5Nqo8I/
	WYDxcsLmmafMTzfa9zEsjdY5YNJpJc5ca7WCnK+zjW/2GYG1k4AnkLmxtO5w5nTr5SCKtZy5jE/
	46VZ6OIIU2U4I+nFW4Wng6HCxIzqBgSwQBzsoEpwjV9vaVrAB6XtdV+7xHXK+C/VFkHw29R8yb0
	4ACkLga//RzaOdnqr8o4mHt5W3aEhQc0Ct6ua9npaqr9qIps4qY5JCpabHtZ2k0/HzNNH9SlUuS
	Qcw2DBTCSdrYxdC9S5eY0l8AVrFfelSbHKR67AyusPSSXnW6fKL7L21x2OZuSDj9gFRy/k9THQZ
	JfGPZotBrD3yUcpDxt1PkLmIvbiySNS6RkaG+ivTgqsidw/DLyYFck/oqI6324jq9u19Lg1agjK
	mSJCYeq
X-Received: by 2002:a05:600c:a00d:b0:480:690e:f14a with SMTP id 5b1f17b1804b1-483a95bf2f3mr227912745e9.14.1771950608517;
        Tue, 24 Feb 2026 08:30:08 -0800 (PST)
Received: from fedora (mob-194-230-144-218.cgn.sunrise.net. [194.230.144.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f3124sm9716355e9.1.2026.02.24.08.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 08:30:08 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v3 05/11] spdx30: Add SPDX_GIT_PURL_MAPPINGS for Git hosting
Date: Tue, 24 Feb 2026 17:29:40 +0100
Message-ID: <20260224162946.4000445-6-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224162946.4000445-1-stondo@gmail.com>
References: <20260224162946.4000445-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 16:30:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231882

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Initialize SPDX_GIT_PURL_MAPPINGS with proper default value and
documentation following the established pattern for SPDX variables.

This variable allows downstream layers to extend Git PURL generation
to additional hosting services beyond the built-in GitHub support:

  SPDX_GIT_PURL_MAPPINGS = "gitlab.com:pkg:gitlab code.example.com:pkg:generic"

The variable is:
1. Initialized with ??= operator (overrideable by layers)
2. Documented with [doc] attribute for bitbake help system
3. Consistent with other SPDX variable documentation style

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes/create-spdx-3.0.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index def2dacbc3..9afe02dcd6 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -152,6 +152,16 @@ SPDX_PACKAGE_URLS[doc] = "A space separated list of Package URLs (purls) for \
     Override this variable to replace the default, otherwise append or prepend \
     to add additional purls."
 
+SPDX_GIT_PURL_MAPPINGS ??= ""
+SPDX_GIT_PURL_MAPPINGS[doc] = "Space-separated list of Git hosting service domain \
+to PURL type mappings for generating Package URLs from Git repositories. Format: \
+'domain1:purl_type1 domain2:purl_type2'. By default, only GitHub is supported \
+(pkg:github). This variable allows layers to add support for GitLab, internal Git \
+servers, or other hosting platforms. Example: 'gitlab.com:pkg:gitlab \
+code.example.com:pkg:generic'. The domain is matched against the Git URL, and the \
+corresponding PURL type is used when generating software_packageUrl for Git source \
+components. Invalid entries are ignored with a warning."
+
 IMAGE_CLASSES:append = " create-spdx-image-3.0"
 SDK_CLASSES += "create-spdx-sdk-3.0"
 
-- 
2.53.0


