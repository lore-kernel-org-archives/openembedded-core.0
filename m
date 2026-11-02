Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3541.1793582309949717154
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2026 17:18:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=cY6/SXRH;
 spf=pass (domain: konsulko.com, ip: 209.85.215.171, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so847622a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2026 17:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793582309; x=1794187109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sb9qXVdqI40rYuI4JEuOcThRqqwYStjpipho76rEN98=;
        b=cY6/SXRHCEFiBJkhqDa5T1px8dzKdOqDpvxdefTucaeLShZZGSQDr/8tAKQusPFD2f
         wJoJjbA2InHszCcK7JoRHudf29VnotBH5PnoIqzwIbU+xY8LUxjM4D+f1Sd+wgnanh8O
         raKxN8cbtsWmXGGGNPFM5eZk4icRGCw1I8VXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793582309; x=1794187109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sb9qXVdqI40rYuI4JEuOcThRqqwYStjpipho76rEN98=;
        b=uYSy4WnEFJ/aY+b7MpVnuNkJ/yEGsbii3ofYqRkVvyftgunq8T10U1tgf4HzXP/XEK
         9Y6AtpKmYqqvfIKldmfwAQKQ1gnZaWudQam6AVaOZyKyvQjed5KUMHwvHhC+DY2lA10T
         CengoAx2XjBBxAwejiP3ncU9qQTTDW/mcyGmemL32r4TU5JHlXkxjlHYobNmfxZjvOKB
         h0imM5qD+VO3x0ggeprvJqFqxUhrGS1te9AabeohURjetNnfD/gXxeDSIWdSJkdxFrfj
         b8Sgh4exj7wubYAdbRgSbOxFfGxjqzQsgyUJ/py9LSnfJb7EfLO5tIgVLoAiUuJuGBaa
         Krfw==
X-Gm-Message-State: APuU4Z/vHffjiJK4dII4z/kAsxvarMHIhRj5AJtx4PcttULfySwh/qpI
	O+0Mqm4ig19TPIr1XyfhiXzoZfpIcaPsI+QzkM6YTclZii0bXXJofWWvCeigKLSzHqJ+hi4kM3V
	8k0K3
X-Gm-Gg: AYBFou31+UdgwFhgof6RQMAgyPDWS35WOj95UxFaC/1cTi6AHLCSuejUjr2t9IuDJtA
	F9gQb8N9eegvf2ChP/ArDq9RRKxpDtmuab/YBX/QOqdjImk0yamdXM0wAATjWBkseTGR3TobBEK
	vj/o8NzXK85vevfPffI+KsYVVfKujdJT46Mqht7RRcLCsS23Y7B88rY0qXDr1cfFC3tnUZGN0e4
	y9qq7svwNwGxgRaKoKTGOtPYvK5MpgFslYfjLFkjdvPp06ekwIad0wMz8fJ5dU6Yyi0rqHgJlGh
	FVKPgxb7ahnTJQseO8jQpN4xh3Jkqhl3WBiyE9orBJOFBCNR1IreG6txXZzyqLBDaiLj8NNS+70
	MWIPGSjyzMlpm0T7u5IjVXPOlmfhR4B2oVKrqC2UTQXusnvGBEDKnglawprFy1JeXKcE3Cmcv11
	ZHuvkzsA6h2TiRvilpE0Y6SSAgdLZBkSiMLme+t+7OiswafowoQjoS3xKUQZeYfLTXdDneps+rQ
	U1zMP7oUQ3/7hiZ4AWqC7DXk0ZwOUNd/GxCGmYgqiskcoSzXKbmIXLn3k7Jp+fWF6pN5qxsGwwp
	0dI69SYr9WbU/C8AjRM2Hwxmrb/JEzAh0rWONmVjdoOkmKI8yCEeAOg/rCarf5CRmAVcZI4Mr4b
	h2bbonwjqJ2BbUbqrrlbpHrouCXcG0iFNTicgrKzFWl5P+6g=
X-Received: by 2002:a17:90b:28c7:b0:3ac:83c1:2bd with SMTP id 98e67ed59e1d1-3ae897f33cemr6892291a91.28.1793582309088;
        Sun, 01 Nov 2026 17:18:29 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from thetis.home.local ([2606:c800:6024:2000:9eb8:9e38:131:9f02])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9426ffsm16436533a91.7.2026.11.01.17.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 17:18:28 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 3/5] python3-uvloop: upgrade 0.22.1 -> 0.23.0
Date: Sun,  1 Nov 2026 17:18:14 -0800
Message-ID: <20261102011816.3710992-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102011816.3710992-1-tim.orling@konsulko.com>
References: <20261102011816.3710992-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 01:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249167
Content-Type: text/plain; charset="utf-8"

From: Tim Orling <tim.orling@konsulko.com>

Upstream replaced the wheel build dependency with packaging.

https://github.com/MagicStack/uvloop/releases/tag/v0.23.0
https://github.com/MagicStack/uvloop/compare/v0.22.1...v0.23.0

Tested with core-image-ptest-python3-uvloop on qemux86-64 (kvm, tap):
471 passed, 36 skipped, 0 failed.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-uvloop_0.22.1.bb => python3-uvloop_0.23.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-uvloop_0.22.1.bb => python3-uvloop_0.23.0.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-uvloop_0.22.1.bb b/meta/recipes-devtools/python/python3-uvloop_0.23.0.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-uvloop_0.22.1.bb
rename to meta/recipes-devtools/python/python3-uvloop_0.23.0.bb
index 39b6a2602a..7321429483 100644
--- a/meta/recipes-devtools/python/python3-uvloop_0.22.1.bb
+++ b/meta/recipes-devtools/python/python3-uvloop_0.23.0.bb
@@ -5,13 +5,13 @@ LICENSE = "Apache-2.0 OR MIT"
 LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=bb92739ddad0a2811957bd98bdb90474 \
                     file://LICENSE-MIT;md5=489c8bc34154e4b59f5c58e664f7d70f"
 
-DEPENDS += "libuv python3-wheel-native"
+DEPENDS += "libuv python3-packaging-native"
 
 SRC_URI += "\
     file://0001-setup.cfg-use-system-libuv.patch \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "6c84bae345b9147082b17371e3dd5d42775bddce91f885499017f4607fdaf39f"
+SRC_URI[sha256sum] = "28d160f51ab4da3b187063652e643dea6831072add4adc1e6d62afbe73b6be27"
 
 inherit pypi python_setuptools_build_meta cython ptest-python-pytest
 
-- 
2.47.3

