Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3789.1793583297521158372
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2026 17:34:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=dOfk7SiG;
 spf=pass (domain: konsulko.com, ip: 209.85.216.51, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso1108243a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2026 17:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793583297; x=1794188097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ao8q/zhr//PH5HbVeouUxAwt2tPocP79Q1vama/gjyo=;
        b=dOfk7SiGXYyItS80Xx8/Are0MvSMVGPFwjowY/ftLfMRz7/K6BW3ew6/rVR5+PJFLm
         xp68xzRXZ7Qwh9FOwWkncTfPoM8WsPdzzCI0sobvvTc6G90OYKLBsefpR7DBs4i/eDAh
         kiJjxBtfIhiwSJD4LagiLPOlehJjHrRLV46hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793583297; x=1794188097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ao8q/zhr//PH5HbVeouUxAwt2tPocP79Q1vama/gjyo=;
        b=f0gBu3MJ0KNFhdYw9kk/RgUkcsO1A7iNkIbZ+MZb+HXCfm2msMKgqsqawN6bpip3PV
         PtCAKQhs06x7YQhcaimb3Z+HYHFpfEw7nPQhq+rSD+e7oLF/evwg3XnU5QSvjvlxLNeZ
         v0KCSRKh22bhufNywy8nGEWPIKOxIiFf69Li95MHXPa4pS9OMO8ptV1mx9qRdGDMbOmo
         /9e16MbIhSQhRi4q01gwaRMKz/M/eY2qC2Y49pmdEOPRv0izHCryKk4sji2+aRk10WAe
         ftbaw/626Kq4N40DSTc/KVjynHVlObxky4K53fnvpTugtP7UIXDH9w5rKdRCnHhfP3g4
         Lwcw==
X-Gm-Message-State: APuU4Z+ZDmQHl0OQSafkOZWfqYRzzXPeBtbOuExSiLtQ0RBdeiv/cJEG
	9G8L86SbeQOn0iCdcKgamfx/P9aLRMGmZpe+vYOO0mODC7XHXjTsRYDjI0sX3l2WVZwkF4QFshr
	XAKqf
X-Gm-Gg: AYBFou0DxvbX3zGzJa9OZO9MZRgMo1jpLsPeN8rSqxaJ5nQ/Gu3kejc1MQYWjVJRNqH
	nm3WqEyM1kmtbTJhJ0FcrnPWEmmGlpftIfGuVrlgTdiXdON62QQlAyuXWKG7fjlYPrsjUX2pHdA
	rNp0JAcPZE6vof9RNeK8rap6RDMllBc5yv5y3lmb25WHGZkKwxka39RjCQBCTNGHb9Q2YLOG6iy
	sGDLvw2vBIhkJDz2rrH5P/6CuCiqXmYr/y7PpxAlXxvsWcAsrMEtASeQMhhOqwHSce/io7MUZT+
	W4aCJfNvm5xsFKOtzds9VzmRprRB78JuAc+igP+v0U+bSlFWaW0GEAPl8CbtQqCB0xzo8WCzf9v
	dOKDpJ8loM7gbnvnT1kVKyPV5LJ3/G2/OXWkVwxRa9jSwxuy0nzXfZU1+jGrAtv2Szw851FwUrq
	kqNctp52Oeo1ApoF29Dy9xIo6Sq3xVcaeCFwVnWHODZcJRTb9TGaPEjXMxtGSfDsVpwgUwbfUJi
	htFX4l9q3aN3Rn+ZcPy0g+QNLfxK8mHRXoBxwvmbKK3SrRXhIurXUzjIbOjMr6md+hY4XNCpbyG
	dIvmzZPIQ2cHmqOae/RVDWumzGWkP6+9SxGJTF5Kc1OhRTU2fEd3g55GJfTP5DVuIbPGrKZPEsp
	bgOl7GtT+IqExHUEalG/LqpP4Zg==
X-Received: by 2002:a17:90b:52c6:b0:3ab:be66:ddc7 with SMTP id 98e67ed59e1d1-3ae897ccab8mr8690244a91.10.1793583296717;
        Sun, 01 Nov 2026 17:34:56 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from thetis.home.local ([2606:c800:6024:2000:9eb8:9e38:131:9f02])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e8fb2fesm15867398a91.4.2026.11.01.17.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 17:34:56 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-pluggy: upgrade 1.6.0 -> 1.7.0
Date: Sun,  1 Nov 2026 17:34:52 -0800
Message-ID: <20261102013452.4084023-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 01:35:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249171
Content-Type: text/plain; charset="utf-8"

From: Tim Orling <tim.orling@konsulko.com>

Hookspecs can now declare default argument values, and hookspec
methods without self now emit a DeprecationWarning. Also fixes hook
registration on Python 3.14 with forward-reference annotations and
several plugin registration and tracing bugs.

https://pluggy.readthedocs.io/en/latest/changelog.html#pluggy-1-7-0-2026-10-14
https://github.com/pytest-dev/pluggy/compare/1.6.0...1.7.0

Tested with core-image-ptest-python3-pluggy on qemux86-64.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-pluggy_1.6.0.bb => python3-pluggy_1.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pluggy_1.6.0.bb => python3-pluggy_1.7.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb b/meta/recipes-devtools/python/python3-pluggy_1.7.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pluggy_1.6.0.bb
rename to meta/recipes-devtools/python/python3-pluggy_1.7.0.bb
index b8e4bbc75b..55d6383fa1 100644
--- a/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb
+++ b/meta/recipes-devtools/python/python3-pluggy_1.7.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pytest-dev/pluggy"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1c8206d16fd5cc02fa9b0bb98955e5c2"
 
-SRC_URI[sha256sum] = "7dcc130b76258d33b90f61b658791dede3486c3e6bfb003ee5c9bfb396dd22f3"
+SRC_URI[sha256sum] = "d1eaa46ebb595891b860ab086b4d09c8588af65ebd4361b8e8f4bb8920b90ba8"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.47.3

