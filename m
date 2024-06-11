Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04FD8C27C65
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 18:26:04 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.1553.1718130360701811849
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 11:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=imFMCyua;
 spf=pass (domain: konsulko.com, ip: 209.85.216.43, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2c2eb98a64fso2726517a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 11:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718130360; x=1718735160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MrGmYgLRVj8EHJiIwnQcQ5z8H85LK45VZEjYSL16340=;
        b=imFMCyuaaahxnZWwf22qRYlu90nW2/QazIaHxdWngelLYP5uEOkFVBCemRV7y3cgll
         fCgjZkdr09D2oFDLjwc7Tc9tcooiERaXbC7FzVUJT0+OdsHEpUO033eDPY7sCfDcJ8mQ
         3qol2MuVCUlESmD4ACmWwATEcLVvhEwNZi7CQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718130360; x=1718735160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MrGmYgLRVj8EHJiIwnQcQ5z8H85LK45VZEjYSL16340=;
        b=Y1kpdczwyN84+6lCqwvTACirzUprIZKKXdj0D22M17XXeoHpGhxPTwiSRiqzEJQlZn
         Mm8RDaFyXJMWsQTvaXVYwvpNLEnGpoxmAjY5OuvCaOIQrUzmu1WzsNJ8/goG/AWW4KCX
         jozlwGPgEp8Ta0d465WwmbMbclJgjtk/tHFX/mK30Pl8wyY/qQUGntRy2azMXQtBB6Yw
         oHp5IYg2Viy47dXXhHeBBcKDI0h3gbaGrR6uNspBhLXudpCugteUV+lyMrD434n3/l90
         aZl58LHPE0wdzHjK7dO6fniSG5QyyBkrZiRvSjgicsWRnW/GRr/aRcdiYGmkPPYvWTbb
         f+lA==
X-Gm-Message-State: AOJu0YzvPRKxrSZeYVtzsSFA7/aadoQ9ioLBLIKUbqlAWPoN8tmevpeV
	1SspKW2Z9LliYQ/efhR1IrKursb62fOw5u3nJA+oJr6x9zv65TUwyjND0Oj7OF6mg75A9PUcm5V
	mTl4=
X-Google-Smtp-Source: AGHT+IE2MX4g0uximQF1cj3hGcTGohkqc+LHnk9g+o5lweBdvWyo9ek8xxLI8wWuiF3zebrXbwRewQ==
X-Received: by 2002:a17:90b:198d:b0:2c2:e69a:e644 with SMTP id 98e67ed59e1d1-2c2e69ae743mr8476032a91.15.1718130329836;
        Tue, 11 Jun 2024 11:25:29 -0700 (PDT)
Received: from localhost ([2601:1c2:c182:4da0::2bc4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c2d635dfb3sm8029990a91.28.2024.06.11.11.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 11:25:29 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-more-itertools: upgrade 10.2.0 -> 10.3.0
Date: Tue, 11 Jun 2024 11:24:56 -0700
Message-ID: <20240611182455.2901666-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 18:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200546

From: Tim Orling <tim.orling@konsulko.com>

https://github.com/more-itertools/more-itertools/compare/v10.2.0...v10.3.0

https://more-itertools.readthedocs.io/en/stable/versions.html

10.3.0
* New functions
  - powerset_of_sets(), dft(), and idft() (thanks to rhettinger)
  - join_mappings() (thanks to NeilGirdhar and rhettinger)
  - doublestarmap() (thanks to Skeen, monk-time, DamianB-BitFlipper, and ergoithz)
  - unique() (thanks to rhettinger)

* Changes to existing functions
  - collapse(), chunked_even(), ichunked(), padded(), and windowed() were optimized and improved (thanks to james-wasson)
  - totient() was optimized (thanks to rhettinger)
  - roundrobin() was updated and improved (thanks to rhettinger)
  - all_equal() now accepts a key parameter.
  - The docs for value_chain() were improved (thanks to bjrtx)
  - The type annotations for countable were improved (thanks to aidanholm)

* Other changes
  - Unit tests were improved (thanks to haukex)
  - Some documentation issues were fixed (thanks to bjrtx and DimitriPapadopoulos)

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Tested with core-image-ptest-python3-more-itertools on qemux86-64

 ...ore-itertools_10.2.0.bb => python3-more-itertools_10.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_10.2.0.bb => python3-more-itertools_10.3.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_10.2.0.bb b/meta/recipes-devtools/python/python3-more-itertools_10.3.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-more-itertools_10.2.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_10.3.0.bb
index e1e1f5e18fc..c2c9e89a649 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_10.2.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_10.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "8fccb480c43d3e99a00087634c06dd02b0d50fbf088b380de5a41a015ec239e1"
+SRC_URI[sha256sum] = "e5d93ef411224fbcef366a6e8ddc4c5781bc6359d43412a65dd5964e46111463"
 
 inherit pypi python_flit_core ptest
 
-- 
2.45.2


