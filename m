Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.644.1622735007924237377
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 08:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LQruZVLW;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id dg27so7640388edb.12
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jun 2021 08:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jukpsKZD3I0cUK0L1b3G5nsTBlpG7wEzq2YARGpt5MY=;
        b=LQruZVLWju7VFUqVUzimBFU5qsQP/pvJ5Ajn2ZY4pB7+aG9UWCMV6NjPrMiVjgUcBQ
         k8XNc7OVUrmWRd1wMiqtnZws3TJawrDTDnbj5D/sXSyT7vwc7mlZ4U/5oFZE2+y0oEvc
         IdgJzKPc3nYa+ljMC2mQoEw9RIkIcV/CijQ07mgQuw2xqyLIzbboKmzNAUxn/R1LJa8P
         RKrhDzeu92WqPYwfYXu+mKtLUoMxc42Atz4iIru4G4aM/9Azt8c1KsUiPlj4NxM6+UKe
         iw5MT92lW6aptUwPB5gn12vebKfIm0NzowVKysWkZxUoRlSTtwOlJ89nmr5qane5FGae
         WdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jukpsKZD3I0cUK0L1b3G5nsTBlpG7wEzq2YARGpt5MY=;
        b=opP4g/3rCgZ3RFcHMTmf02CPWAyBWw4ITw4Lb0PhminKxAzvl+A4Hmba/DF0egxYpt
         m7Bu32dMGiraTyjC184rLIKIW4gB/UgXZTCSoSvA/PIGdXbU9pYg6ltoa/E4/dDWcWwN
         EySdJ/uPaL39fzYgeS+8e3OWAhy9uV5k1T0P+Xy7H7W81iJch8+MT+FQNpky6FVqQuVP
         a8+PaJAR8j/tal6+gC1WwfT5kDTM2mJMj1AZJqPFg/mXV7coANSWtLKlqu0RJ6I1gIN6
         eZS4Z2MmZLz7TWaP9ko0BFa8AkhMXwFgx96X0/IDGVdwfi6Q47r6ZoWDehZGLAw0kW9E
         UxHQ==
X-Gm-Message-State: AOAM531mxcnfOAFTMJWxukNEl4f+RC4t5wKGV8iW86JKLUkopl09MzDH
	OK0cUjjiEkhL8c7K4mQlKind69B/ZFnNcg==
X-Google-Smtp-Source: ABdhPJxBMdi2x9wi8wc6tsdqSjsFwDzHOshzYayd9jPlkRkLT2HpkVleOfagrLgSFjCZnZuh4DvBrg==
X-Received: by 2002:a05:6402:1bcb:: with SMTP id ch11mr116257edb.9.1622735006567;
        Thu, 03 Jun 2021 08:43:26 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f11f861d707ea86d7bc33dd.dip0.t-ipconnect.de. [2003:f0:7f11:f861:d707:ea86:d7bc:33dd])
        by smtp.gmail.com with ESMTPSA id d17sm1644338ejp.90.2021.06.03.08.43.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 08:43:26 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] alsa-plugins: upgrade 1.2.2 -> 1.2.5
Date: Thu,  3 Jun 2021 17:43:09 +0200
Message-Id: <20210603154313.2894136-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603154313.2894136-1-schnitzeltony@gmail.com>
References: <20210603154313.2894136-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changelog is found at [1]

[1] https://github.com/alsa-project/alsa-utils/releases/tag/v1.2.5

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../alsa/{alsa-plugins_1.2.2.bb => alsa-plugins_1.2.5.bb}      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-plugins_1.2.2.bb => alsa-plugins_1.2.5.bb} (98%)

diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb
similarity index 98%
rename from meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb
rename to meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb
index 1381896f38..f940a4bd35 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb
@@ -23,8 +23,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/plugins/${BP}.tar.bz2"
-SRC_URI[md5sum] = "8455e3c6fbc47f62f070afabc14ba575"
-SRC_URI[sha256sum] = "1c0f06450c928d711719686c9dbece2d480184f36fab11b8f0534cb7b41e337d"
+SRC_URI[sha256sum] = "42eef98433d2c8d11f1deeeb459643619215a75aa5a5bbdd06a794e4c413df20"
 
 DEPENDS += "alsa-lib"
 
-- 
2.31.1

