Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web12.36677.1612196808186926389
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 08:26:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=hQXEw1Xt;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.44, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f44.google.com with SMTP id n42so16826835ota.12
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 08:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=k7Se7tSMeHS/kpQYADAi8f0mbAbFYzbEW2Bqv+1PnTA=;
        b=hQXEw1XtKT6UELyefdjxfob84tY01RDvo/9lm+RjBjAAQsJc+pNkj1AIHEzOj6Bp06
         K/Qo6vBG9zMFmtVc7Tdwpu9k7U9HkCA21Ss8mU8llX66NABVdH0ZCfPkE9ujnAnJgOUF
         I9gepWzrrfk/P/ElazFg1qzYSeZ6UPeu/aA74GKPvnMfUfelUcV8L9DUdlxJ9Q/q13Lb
         0OvObViQdcAdJX/Wer8pS5kxDAa+X7jqPdurczCBiCKs/JRz7QqtBWq9jXyp6sq/W0fY
         vF/CCWpB8/fsDkyR5gIEZXrLEdHOH4bXg/A5dGCOFOKxoM4HS8aTqXwoSxsVYLqsf/px
         1YUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k7Se7tSMeHS/kpQYADAi8f0mbAbFYzbEW2Bqv+1PnTA=;
        b=OgEpsL+/FN9pUT+c69b5oOPtuiFlC7ODdZhUiDxmZbtuZ7dNk+ZNZ0rPX1wHCyP0Hy
         FG63IIt7JgcDXBlX9/EkIx9bPfLFrwltPBtpsK+9c3d7toEdCsgzsikqXWDI/y5AYCDB
         yNuFqYKDFaNbQMpt55qZJT+qM6C8bapjx+FUG3CR0hC+96Bxa+NL+Wn1X14rYiIl4ODS
         v4iSvVTT5IW8VKriqEe0OcnUnDsc/Zo6Rko8V1M2kI5mu1X0rbBUG2gxOrv4CI+w19mR
         DvIegkvbGjpTIcpoNLVpKnfkmsu2hlO3zKF2a2SugoTlw8B9v3Ko596pMG/waPb9CT1A
         B/5w==
X-Gm-Message-State: AOAM533NLaKTEMS6cP0XOHWdXXCrz4cfAFNSMOpFeQBYaiIL1FKEvvl/
	Zg2yrDhMnlXEfG4PiqqyvT3gc9yvhJK86lQn7Sw=
X-Google-Smtp-Source: ABdhPJwhNaMUpVoFd6Z1R82qAh0Co7FOjFWYhfkWqW3q+qyo4iGdn6i0oSXZGZqECRgVaPrlU5fj/g==
X-Received: by 2002:a9d:d52:: with SMTP id 76mr12305714oti.67.1612196807113;
        Mon, 01 Feb 2021 08:26:47 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id o16sm3980726ote.79.2021.02.01.08.26.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 08:26:46 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/21] ovmf-shell-image: image is only buildable on x86-64
Date: Mon,  1 Feb 2021 06:24:45 -1000
Message-Id: <c5059d1226cd86821c5c2b4473c3ee4eef1afb84.1612188857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612188857.git.steve@sakoman.com>
References: <cover.1612188857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

This image is only buildable for x86-64, so add a COMPATIBLE assignment
to ensure it isn't attempted on others.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bdd8208675c8a0c0232c678804a8b62cd74f1d48)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/ovmf/ovmf-shell-image.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/ovmf/ovmf-shell-image.bb b/meta/recipes-core/ovmf/ovmf-shell-image.bb
index 0d2b8bf52f..fd4fb5b732 100644
--- a/meta/recipes-core/ovmf/ovmf-shell-image.bb
+++ b/meta/recipes-core/ovmf/ovmf-shell-image.bb
@@ -1,4 +1,5 @@
 DESCRIPTION = "boot image with UEFI shell and tools"
+COMPATIBLE_HOST_class-target='(i.86|x86_64).*'
 
 # For this image recipe, only the wic format with a
 # single vfat partition makes sense. Because we have no
-- 
2.25.1

