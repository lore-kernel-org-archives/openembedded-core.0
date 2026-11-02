Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3908.1793583800913082426
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2026 17:43:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Z9hxo2G+;
 spf=pass (domain: konsulko.com, ip: 209.85.215.171, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso898060a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2026 17:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793583800; x=1794188600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ollOlzTgY/SBmBZCTQHsdgzdSBYT0edeDPVwAyVsiGE=;
        b=Z9hxo2G+r+9yjZ0I9WR6OWuMAp4vNLjhSrGrdsvsNnI6F6eLMXTzJPQFrNuytFYcqE
         KH2uTXZTZeCZNJ5mwjZNT6a1Fltx4nwYpcvh7K7otys4Zya/aYYWXNB0Xs4M2hVshtaE
         Twz1Ilk/9G5fLeiYx3LSdiysy3QHHMASGUehM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793583800; x=1794188600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ollOlzTgY/SBmBZCTQHsdgzdSBYT0edeDPVwAyVsiGE=;
        b=zwYbZkU/DCi9XC7MfiFhdYHV5FhPxzBPElk2Q2FJVcUHz1Yid7tN6zgUtcd1Sv33Ld
         NOC5sSDgPC8ZlYGwQFPO+IU24600Sx2blgx/j9q6kVAdW67kMnCI3jLAn1a5EnHRripn
         tcFaWSjM/IS6lncctrzlVdB5g9h7rai7QTsbjUTs/ZYP97QlN8laQsKA4HlMhFhfVjB8
         y51t2dtkA4gSBCR/ZPO8o6KurtinIRySHSR+nTKye6379erildlDJ61cOE7ISKnVlSMM
         416coYSQbBdqr0U+tMk/gPuosQdPAEgUyY+md0o3m2ytBue/EfvfQnV1fx90FumnRRfI
         q7eA==
X-Gm-Message-State: APuU4Z8iuYgnuttpQaijyvSCQdoIhwT+VNI3/fIVML5glw0sZPEkTEMT
	7v0WHnASL3RfjL4OOU5nEpFiSWzW0Mmn5tDSxH6RSimTA4xfnmjrrm2sB5JbVnZkB/ebKAqWOAr
	CHgu4
X-Gm-Gg: AYBFou2hQ7xo/9Wbj3ChxHy3m/nF6JKG/wFySMVURiLFst0p6W9Iz+W2ycrrp8y75Z0
	BfqfhtzRSpdnUXLfvlgqOj0BY9riUNMP70u0DeVKdY6/FZj8/rG7bxpd9LI95HnhM9f1gKEGNB3
	i3pEhBCjhko+pF5TaX8vqHs6E7N9ROl6BiGeft/oo2lASF+s4JqE1t68VGBLMZTuBIp/wZEOOw7
	KSfLTuF2c9ZlnGxN0CbX8l3MGiNoQ6Pp9j8RHLYhNGHPKNNQ+puf7c4yQ+wPPWX4S4p99+vZEiU
	u8zlzDnLRRfjYN+eZCqDPe6KJk0Nh71wZ9L6/GQat03l3XrHLodP1SOjj9YW/kIpQwvV8JAhbLw
	fyNsP5vMBH7WyaLo5l27jMKu0o4aqiUa0z/9erhuLDZ5yOOxJMVrb85cyZ54QM+miOtBawaw4Vz
	cMSdy+ALIUkiQB0tctKVUByksp5oqWCu6aBwEQ8yjcRyJRpJ7WaapqVvbW5x36i/CJMcuSeVjUh
	gBk6zbIaVTc5m4+rVI17BuDi9ZR1vnuKjtdgy+JM2hxCcDKVQdGj3+WEy69RGryrvnAgfwaDG+v
	LpVJt+u0JDBcCi2j9kk1d6/fr7fZgpBj+hpFqHULMeiyKSD9AlV8C7in7ERqYZCeWDn8c6Z8r9w
	gnXRCO2rqesSsHBGa7kE2tEabWw==
X-Received: by 2002:a17:90b:1b0f:b0:3ac:a5ff:2cc3 with SMTP id 98e67ed59e1d1-3ae8957d4f8mr7495423a91.8.1793583800121;
        Sun, 01 Nov 2026 17:43:20 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from thetis.home.local ([2606:c800:6024:2000:9eb8:9e38:131:9f02])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8826a769sm5578279a91.4.2026.11.01.17.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 17:43:19 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-iniconfig: upgrade 2.3.0 -> 2.3.1
Date: Sun,  1 Nov 2026 17:43:15 -0800
Message-ID: <20261102014315.77862-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 01:43:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249172
Content-Type: text/plain; charset="utf-8"

From: Tim Orling <tim.orling@konsulko.com>

Fixes quadratic parse time for values with many continuation lines,
and strips a leading UTF-8 BOM instead of raising ParseError.

https://github.com/pytest-dev/iniconfig/blob/v2.3.1/CHANGELOG
https://github.com/pytest-dev/iniconfig/compare/v2.3.0...v2.3.1

Tested with core-image-ptest-python3-pluggy on qemux86-64, whose
pytest run imports iniconfig.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-iniconfig_2.3.0.bb => python3-iniconfig_2.3.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-iniconfig_2.3.0.bb => python3-iniconfig_2.3.1.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb b/meta/recipes-devtools/python/python3-iniconfig_2.3.1.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb
rename to meta/recipes-devtools/python/python3-iniconfig_2.3.1.bb
index 6933ac4935..a20ac8b3fe 100644
--- a/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb
+++ b/meta/recipes-devtools/python/python3-iniconfig_2.3.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/iniconfig/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a73af4b5f1f3a8731e5def70e8c1254"
 
-SRC_URI[sha256sum] = "c76315c77db068650d49c5b56314774a7804df16fee4402c1f19d6d15d8c4730"
+SRC_URI[sha256sum] = "67f4b9c50da0dedf52af349e7749a80a9057a5031199791b906c3bb3ae878960"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.47.3

