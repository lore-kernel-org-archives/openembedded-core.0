Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web08.4368.1623220617313887634
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=seOk7qX5;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id k7so36592668ejv.12
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jun 2021 23:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FibE3WneToWrIdCRDW1w6cqs08rzHaA8nL/UrDKSx/g=;
        b=seOk7qX5wi2hDCiMOPDQy3a86YSxWyMqpOCD3S2gHDheMW5O0DJtE0fk6LZT55hd3a
         iBnPhjdMHqKbcCgjI2H2vRWKinUCXEjXKnZA5derJaKeW86noBV5uxKriduqGURcyK1x
         3odiB4DGd2T13DZMqAaG8xUsicVBOHSAOwXpjah4cHmvj4IS/oHAbkdIVhqXKChlCz+y
         qkqaaYUbKvhVh1HgRujrJMFWBPLCRDDJeIhG5Kk5zHu2RqXXYkmSfsHl40JfSqcWAFY7
         gcm7x5RtmcZWiHiU0irnEcamDkJIkJa7pNVfldutSPiXqIkMaWrVqqs1DRMig56IfZU9
         OXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FibE3WneToWrIdCRDW1w6cqs08rzHaA8nL/UrDKSx/g=;
        b=IVARdW9AUu7cHI7yS7uYRHFEZAtPbJ79k4+rdQXMXb3jZZLNADErwH3RsjEcWUhxtx
         xw0+uUxHI4rWtelnLc8ipD2RqV/96DreoDm/cWVQ4o6YHlaz9tgLSLExV6AVvJIhKZSM
         ptx16pKG3cWWjpwgloLq6fCFXDXYqAFMdnOoJetLnWjOW6ZVk6ST1mLGw/nA8RixUck+
         Fzl3q8+gbaps/QBdzzef/1cSoMydoq+T04s5v+l/PB9Fex9TbGTgJQA39iI5qqKRno/b
         xorvtj26A7m5MFv3wDrMNxU8lj8ecuWhO6O5AsXQHCoupw83b4EfgCNuad4PKplRbVnX
         K6LA==
X-Gm-Message-State: AOAM5303dxi8Z89uqB9BlQYrdySetHVZAi3GMZ5FH+VGRxLVaxcVCKD/
	BRD/5GUA9uXrnP0vtrTtcmepvB5y12pXlQ==
X-Google-Smtp-Source: ABdhPJylcLMNwlQOWA2ZAWKoxLVOVa335hFW75DB9n4yYyCGC95YpMnDXb1IvTkWMBCHfZUfbKaicg==
X-Received: by 2002:a17:906:b308:: with SMTP id n8mr27181883ejz.93.1623220615907;
        Tue, 08 Jun 2021 23:36:55 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id n2sm717691edi.32.2021.06.08.23.36.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:36:55 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] vala: upgrade 0.52.3 -> 0.52.4
Date: Wed,  9 Jun 2021 08:36:45 +0200
Message-Id: <20210609063646.3400519-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063646.3400519-1-schnitzeltony@gmail.com>
References: <20210609063646.3400519-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Vala 0.52.4
===========
 * Various improvements and bug fixes:
  - codegen:
    + GArray, GByteArray and GPtrArray are reference counted
    + Replace wrongly hard coded usage of G_OBJECT_GET_CLASS
    + Don't add errornous cast for unknown type_symbol
    + Mark entry point method implementation "_vala_main" as static
    + Improve check for GLib.Source derived classes
  - vala: Parameter following params-array parameter is not allowed
  - doc: Update man page to include more information on profiles

 * Bindings:
  - glib-2.0: Add missing has_typedef attributes on SourceFuncs delegates
  - gstreamer: Update from 1.19.0+ git master
  - gtk+-3.0: Update to 3.24.29+f9fe28ce
  - gtk4: Update to 4.3.0+24f0ae1d
  - pango: Mark language parameter of AttrIterator.get_font() as out
  - vapi: Update GIR-based bindings

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-devtools/vala/{vala_0.52.3.bb => vala_0.52.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.52.3.bb => vala_0.52.4.bb} (50%)

diff --git a/meta/recipes-devtools/vala/vala_0.52.3.bb b/meta/recipes-devtools/vala/vala_0.52.4.bb
similarity index 50%
rename from meta/recipes-devtools/vala/vala_0.52.3.bb
rename to meta/recipes-devtools/vala/vala_0.52.4.bb
index 133dc9efad..8e2869d408 100644
--- a/meta/recipes-devtools/vala/vala_0.52.3.bb
+++ b/meta/recipes-devtools/vala/vala_0.52.4.bb
@@ -2,4 +2,4 @@ require ${BPN}.inc
 
 SRC_URI += " file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch"
 
-SRC_URI[sha256sum] = "037ea1a92bf0f1ab04a71b52a01d50aca1945ad1017b6189d9614f84f5c9b2d9"
+SRC_URI[sha256sum] = "ecde520e5160e659ee699f8b1cdc96065edbd44bbd08eb48ef5f2506751fdf31"
-- 
2.31.1

