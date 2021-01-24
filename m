Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.21977.1611500602936402529
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jan 2021 07:03:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Sx+lTYMF;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id w14so6906855pfi.2
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Jan 2021 07:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=XVk35DWGr/dIB7BHmVIraOYT4zoFjFbSULDy5xev6zg=;
        b=Sx+lTYMFut5+LPTHiLnVImc4UposMJ/VfXwsSHg2BuCgPF5I90UsAeNjtKxHqhJl1d
         fyEJvt5FkrJwVVTRmjrumAw5EnqQi36Efxhr8CcR3nKXpclKkwtN0KcB+bB2oS+wWfLc
         Vg38/tfc2yJXPs8/++2gbtnrpSvArK82j1GJRyj6uZceT05ObaERZq8qVV1XsHLOK28B
         vq9T5AJL+PCJnVJSvfs8yaLYMvHNYAXL03/XXIDt1n50vSBAUZjsLnoQ56k1dhL/fs14
         7zLVNc9k1VR3fnTX3pAFUByaZXtf8HeKqAKbnYw/Ey3XBO3R9Kb0whVigAqLJPAOmtJO
         xO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=XVk35DWGr/dIB7BHmVIraOYT4zoFjFbSULDy5xev6zg=;
        b=aJ7EYGPyfEO7CFCCTeto4CZ9dCli44tR4Ot46S+ZSSP90OSZd2VfKQdlsGjKSKNkfE
         +BdxFpX8mwPVdDDzCXkMkVNMFd3pELpdm/h9twI/Yd1aR/PPgVgTfidnjyR0lRc4N1Sb
         rW+Fcx/HZBhH4FB5Tv14D5TbCHc3QbBQraOYreVkdFWbQml00G4FFpFS+dpp9ZbGLkbo
         ocmLgW0F41BeGe9vvYw0jkjSg1A7L3vOeyo+XNMPas1HaJOJ/wyeDHUH5r5iXX/C+n11
         rZtmFLrbMbB5GpPhRzJfBLFWe1mX3JexD51ky2jKlySVja7fLxzkFgOFM5yCL6CVUayY
         QmZA==
X-Gm-Message-State: AOAM531To1lystCeMbkS+GYQN7alAVLolzsujua8g/0qONwam9qu8iOz
	rd7GtBqNNnSKoJKWME+pZJjTnUoqnyPHRg==
X-Google-Smtp-Source: ABdhPJx33gPqjLhqEMhRGSq4mCSLL+JqohjdxZhago2zm7fPp7R9rynsMhoGc4+L/3MmeI6r6O4VOg==
X-Received: by 2002:a63:f953:: with SMTP id q19mr1221636pgk.120.1611500602217;
        Sun, 24 Jan 2021 07:03:22 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:d415:65e0:a6cf:250a])
        by smtp.gmail.com with ESMTPSA id r5sm13725916pfl.165.2021.01.24.07.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 07:03:21 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Shachar Menashe <shachar@vdoo.com>
Subject: [PATCH] openssl: Enable srp algorithm
Date: Sun, 24 Jan 2021 07:03:20 -0800
Message-Id: <20210124150320.28463-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

This is still needed by libest in meta-security

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Cc: Shachar Menashe <shachar@vdoo.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1i.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
index 52e96b78310..5617f337e04 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
@@ -64,7 +64,8 @@ CFLAGS_append_class-nativesdk = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/bu
 # rc4 (freerdp librtorrent ettercap xrdp transmission pam-ssh-agent-auth php)
 # rc2 (mailx)
 # psk (qt5)
-DEPRECATED_CRYPTO_FLAGS = "no-ssl no-idea no-rc5 no-md2 no-srp no-camellia no-mdc2 no-scrypt no-seed no-siphash no-sm2 no-sm3 no-sm4 no-whirlpool"
+# srp (libest)
+DEPRECATED_CRYPTO_FLAGS = "no-ssl no-idea no-rc5 no-md2 no-camellia no-mdc2 no-scrypt no-seed no-siphash no-sm2 no-sm3 no-sm4 no-whirlpool"
 
 do_configure () {
 	os=${HOST_OS}
-- 
2.17.1

