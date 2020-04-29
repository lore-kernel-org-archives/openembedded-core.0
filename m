Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web12.4541.1588176713769113030
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 09:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mPPvxLCD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.195, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f195.google.com with SMTP id x2so1279558pfx.7
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 09:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=wmXVlW37v+iA0Nc2t0PM/jQf7hCHMTvPIv4v7Mhg8bI=;
        b=mPPvxLCDPvhqmR2A2Ig5soXFgZXahjhOlA/Wu+CzGIWEJP8wFKbBfm140k2mfAvcxx
         plbPs5gZJ/61ejnxjTSRa5p/+kd926iS5wiLd1fC2tvvgQQqUZSF/BXJ68JQALLoWCxl
         EBP9VJhY3u7zbr6Qw8srbumYS4flO0eEnt8NSdqvYWHg3WnW/qTFb1NSL8i5bEvHBPGu
         tO4MPbv38BfN2QETNOayPszcgacVfCpz9usk4xcLQFh1N0zzmccKoAGpSRtCb9BG5Xlf
         lPMSeAOzKSI5NFmDU1Uj8ioeJ0aQrGzxNQLE80lxpYjRC536Np0JqPwjpMhvu708meay
         Hdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=wmXVlW37v+iA0Nc2t0PM/jQf7hCHMTvPIv4v7Mhg8bI=;
        b=fi6ouf+CsSQTLPFcgiH89xMxZLdCSNVvCCGaxlzEDwwXOPqecUVODLreznjFlFDn21
         MCsh+wAX+lGGiuFzwlymAf2XxYgf/2SRxsxvFAKfMvHZUocwIXQI5Cg0IPY8EsGYarPv
         q+OMNHORrEoO+UWpSWD6MF/8SScSJKCkjUy65JkdnBav3aquguBcBmJOcNMaKlP9oGih
         ppUkXzBQQ4RCLqmRg4qtXozHSFnp4EN8WXbtXLHKqtgyyN90ft52TfDfMM2cEI+i4fkR
         g+geExzd35uOBKQI/E7/pfq3hhrw7Ya9/MRiswa/JGUUkR/9mUoiqj7gkBH4i1kxNAsP
         a5Vw==
X-Gm-Message-State: AGi0PuYbobY5LGHnA5ksrIMaDZ5puQEM2hxM2dJEO0+MJ3fG7WfKwde7
	e9P0oyxJMfhUTSyuIG3xeBN93SL+W9mNHg==
X-Google-Smtp-Source: APiQypIivIb4t9W3tAOsPXK/0pMBCj3y5lQMuc4T9BlCabB3oRnNYqBG28r0iC3zzmwdXL+CvxyX6g==
X-Received: by 2002:a65:68d2:: with SMTP id k18mr32809254pgt.359.1588176712867;
        Wed, 29 Apr 2020 09:11:52 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o1sm4833062pjs.39.2020.04.29.09.11.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 09:11:52 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/16] gnutls: upgrade 3.6.12 -> 3.6.13
Date: Wed, 29 Apr 2020 06:10:55 -1000
Message-Id: <4739fbcfdb5024184c9cdb40ab6f569c4d8db6ee.1588175775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588175775.git.steve@sakoman.com>
References: <cover.1588175775.git.steve@sakoman.com>

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gnutls/{gnutls_3.6.12.bb => gnutls_3.6.13.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.6.12.bb => gnutls_3.6.13.bb} (93%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.12.bb b/meta/recipes-support/gnutls/gnutls_3.6.13.bb
similarity index 93%
rename from meta/recipes-support/gnutls/gnutls_3.6.12.bb
rename to meta/recipes-support/gnutls/gnutls_3.6.13.bb
index f1eeebc807..f56d42a613 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.13.bb
@@ -21,8 +21,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
 "
 
-SRC_URI[md5sum] = "a23900f14980a467bdce3a0fd31dfa18"
-SRC_URI[sha256sum] = "bfacf16e342949ffd977a9232556092c47164bd26e166736cf3459a870506c4b"
+SRC_URI[md5sum] = "bb1fe696a11543433785b4fc70ca225f"
+SRC_URI[sha256sum] = "32041df447d9f4644570cf573c9f60358e865637d69b7e59d1159b7240b52f38"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.17.1

