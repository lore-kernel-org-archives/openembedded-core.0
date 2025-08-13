Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A9ABCA0EE0
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 15:54:51 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.139.1755100488447595203
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 08:54:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z13uHcxS;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-615622ed677so8318494a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 08:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755100486; x=1755705286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AEPIIQKhDt+paR+lfD5Eh3gHcAYPgKnc3iTBqsjABe8=;
        b=Z13uHcxSfQFy3tO+wyEucX4pDj9S1gmbRMBYLxk/+5V3duRpnUPhWnmFQlYcfXNVQe
         9znmqPtaqGQLben9ztrricJjEilZ5MYXCW1irT+ndy5dDVzpOtvV76qF4lJKmTJsEbx7
         Zb6WCjRNvPr1PjA/Ue8GSJFlAPwizmYbXd4Bl/grnuRo0vCvgRilTR2RgqRoLWyShYKK
         N6EPV9ZxpkzQpxcWhHDNg48BwopAhSwfIuSzHT33BTK39Fdg8WEDCqyVozEgVGuDxTUn
         JQVMsFwAYN5217knvrM6pcBBFYR0BOHdd15KxJkOHersX51LUK9c0ZnIFKzbUpzhKAJH
         TdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755100486; x=1755705286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AEPIIQKhDt+paR+lfD5Eh3gHcAYPgKnc3iTBqsjABe8=;
        b=aGbXVidUQfXzwF/BMY7rP8wRxcjKK1jVryEZCxuHV6+h0XT28EA98Q0RwSqrPpSpXt
         oMBcCXJXrfWYeFEAPy9aZOOsWQJ5FBdsWuC6H/q5jb2lP5rzQFBYbd3BQ4i9Q6iqK3bv
         RfGN7VfFdx24f3w0m9xZgeRnN1zdTRJY6gvAW+8S9COBwWnwAMZtZH5B92fjZF4lC50n
         QrbGr7ys+SKQM+D421wJyYeN5/6MlS/Orjb9tCqIhUw98YMfFqXU6PRbA6zIE9OoJ/g5
         St+vz2AXd3Yvui6Si+fxqv/OgxK4QrzOHPZUwIIGWEC3cdEVkvR6jqreBNDAH8wZCo2T
         DkGA==
X-Gm-Message-State: AOJu0Ywc0nTlkwi+y8hzqSI+o94rRVT3NwiHfQqCx1HFcQBknXTYWT/C
	WiXOKhFq6zujLHZk2u0ziJnjLmZBrGl+PeqfCsWY2zL1/Ehfliim6RfHUmZGPQ==
X-Gm-Gg: ASbGnctxDimTQv20wIPU2WjEWL4m0ZhoBg6foAbJ/iNajGAylGR166Phb6LlHrzlnnW
	TNWFI6X9512pBe1CSUyE8Skg+m/LBH/pRlWkbNvBHKn0lXeNxyt+ustb4wEDBYXx71RDK2LaLUb
	GabEUgLtU0OhG1zKvGISkiOBBETJTIYQpCUVweEYncsE7o4HYphic7aDY5EGBgBCJeY5qfUmZJ0
	AlyVx1tcPW9cL8fXIQxheECAJNQg3q70ClNFcvjVpilR2/VX1NceaYKwJS8hXFGmKCwP1wEp6X4
	BWe/u+x4RKRAGf9Z+96kHRaj0gt12yfaoX0F4XOoZMeizn4CoaP51EihOILw044alfRcA6Dg+s9
	dAarktMIfPv1LBl+tc7Nn6gLKsNJYNQ==
X-Google-Smtp-Source: AGHT+IGU0G0OlKmR0U3GkPUPKkt0kjr2oaa/+lWVfIBDS9rcmoR4w2dYzaDr3abqroCviKBVQSTUpg==
X-Received: by 2002:a17:906:f5a3:b0:ade:43e8:8fa4 with SMTP id a640c23a62f3a-afca4d18496mr368732666b.18.1755100486193;
        Wed, 13 Aug 2025 08:54:46 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a396fsm2431829166b.42.2025.08.13.08.54.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:54:45 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-click: upgrade 8.1.8 -> 8.2.1
Date: Wed, 13 Aug 2025 17:54:44 +0200
Message-ID: <20250813155444.449988-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 15:54:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221814

Some new tests use pytest's terminal reporter internally, which requires full
"cat" and "less", busybox isn't enough - RDEPENDS is adapted accordingly.

ptest passed:
====================================
Testsuite summary
 TOTAL: 761
 PASS: 739
 SKIP: 21
 XFAIL: 1
 FAIL: 0
 XPASS: 0
 ERROR: 0
DURATION: 2
END: /usr/lib/python3-click/ptest
2025-08-13T15:51
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Changelog: https://click.palletsprojects.com/en/stable/changes/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python/{python3-click_8.1.8.bb => python3-click_8.2.1.bb}  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-click_8.1.8.bb => python3-click_8.2.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-click_8.1.8.bb b/meta/recipes-devtools/python/python3-click_8.2.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-click_8.1.8.bb
rename to meta/recipes-devtools/python/python3-click_8.2.1.bb
index 7be3d73546..0bbc7e8488 100644
--- a/meta/recipes-devtools/python/python3-click_8.1.8.bb
+++ b/meta/recipes-devtools/python/python3-click_8.2.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "ed53c9d8990d83c2a27deae68e4ee337473f6330c040a31d4225c9574d16096a"
+SRC_URI[sha256sum] = "27c491cc05d968d271d5a1db13e3b5a184636d9d930f148c50b038f0d0646202"
 
 inherit pypi python_flit_core ptest-python-pytest
 
@@ -29,5 +29,6 @@ RDEPENDS:${PN} += "\
     python3-io \
     python3-threading \
     "
+RDEPENDS:${PN}-ptest += "coreutils less"
 
 BBCLASSEXTEND = "native nativesdk"

