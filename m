Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.9763.1629636674038088374
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JFLMBGpt;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id h13so21835051wrp.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jrKuKIUkib3F2VuLbuHLrlqQ/TWWldPxmTpCuVj99i4=;
        b=JFLMBGptaE1aJvKx9z8IFJ1tJu3MS3DkzvYL5t73iGqiTF3nREL+DgG2/r2/9aGKKR
         7At9noDzS3v7trGIjayS1n8zMIGUmFZemLtUeApFW9DZ4eLaZ0qa16nXfm/Uxn3q9Xn+
         k/CBFFADPBwNl9df0CqJQBBd5LgalyUl5PzNfNc+yvQw5PCRTtgT3/4T8kYjwuzJuSG/
         U7yHDIJ8k+mZWILC0ge1E1qsb+HJ0LpdbRyiOnX9T18xuJxRrKSyIbKSM/xRqK+7SrvR
         KnTgK7F7eyaZjZ+SdVr+GYAuahd3UadPUdfGGK75DYV2CB3bCAA4hTevuUxws7kWbhQz
         xIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jrKuKIUkib3F2VuLbuHLrlqQ/TWWldPxmTpCuVj99i4=;
        b=cL2W3+WhiWJACcUqOJGRUSI3SeCfIGsAesR0/+fUd2DCYqzl3JqlRt1TeT/chouBkN
         K+EZjj9gsYOjGUytymYyNFgz71i6IQ33qQ5AEzvrhKYio+P1aVRw0eb7D+EQGcGE0LB6
         gQ8iB6txfXC5oJEvmjS04zkzgs6wLys4Yy204zyDGG8RKFEwgFN/uAQ/FbKfNaiJI4V8
         ebZ39AKBrlQ1rIHfiVRWY6+EatbLuBAZMxl9CjRcLPn3xvZXjnQs8neZSDLxEDdx9dew
         ovzlgpDFqp03qyB2eiEml2s81sLnqG9AF/Tl7MbrGkVX8yWUncUg2i47Gz6CD2IGwrDe
         yqjg==
X-Gm-Message-State: AOAM531KVFOicrvzWbo7CZKiJsH6JuDBTN0qwhr5TeZkokVX5nbR0aUz
	oGhSBY/RX5wbCXdf292DdEzK+0W/Xyo1UA==
X-Google-Smtp-Source: ABdhPJwJ6qhr1VLVmRMIckuYhcMU1TPMr1gzuQMcKaJezed2dec4fyaRzLZcJboEHCsZ3F6d+nI1pw==
X-Received: by 2002:adf:e101:: with SMTP id t1mr8582529wrz.215.1629636672709;
        Sun, 22 Aug 2021 05:51:12 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:12 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/55] libxcrypt: upgrade 4.4.23 -> 4.4.25
Date: Sun, 22 Aug 2021 14:50:12 +0200
Message-Id: <20210822125103.310416-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{libxcrypt-compat_4.4.23.bb => libxcrypt-compat_4.4.25.bb}  | 0
 meta/recipes-core/libxcrypt/libxcrypt.inc                       | 2 +-
 .../libxcrypt/{libxcrypt_4.4.23.bb => libxcrypt_4.4.25.bb}      | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.23.bb => libxcrypt-compat_4.4.25.bb} (100%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.23.bb => libxcrypt_4.4.25.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.23.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.25.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.23.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.25.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index d9b3a7d673..29b941d380 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=afed27a72ae2a8075978299eebaa1f5d \
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
-SRCREV = "5dcc36aeeb053654659e898fd3de7f365c1c4df5"
+SRCREV = "b9116ef2245abb128a22a975d187b1272312a80c"
 SRCBRANCH ?= "develop"
 
 SRC_URI += "file://fix_cflags_handling.patch"
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.23.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.25.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.23.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.25.bb
-- 
2.31.1

