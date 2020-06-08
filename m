Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.25166.1591602516117361702
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BMBMi6Wk;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id e12so12598052eds.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eGD0PL+EGxO9oYn0fqcjdctUPKYotMCfKveRRwNs/0c=;
        b=BMBMi6WkkbUV2r5+q5F9IvRNFlNfUCFmR/tARNyTp+neul/1V/2VadSK4knz2mLs3F
         dOgHoEviSbpxJHasqHXJOWLzhKvSvt0JRCab1N1+B1QOoSviI9km47WKZtojLb09GJNk
         U9Pdayd0Eahdh3YLFgwYi8Qun/CmRQlWoHgjCRtET7lYqQ6a9hlU7j3gxoWCF/6lMwXE
         9HWC/vRGJUxsat6w7CsDH7jVRGJvcbjkiKKrTsINs6/f+wuu8+yK8Rl87AyaBu2z/S88
         +seGYdzhQ+jxM7dJQhyBN7rtbXZ/TRgq91otKI+lNytGF0fncYIfn+4+lhR6a9dyb8Tb
         IR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eGD0PL+EGxO9oYn0fqcjdctUPKYotMCfKveRRwNs/0c=;
        b=PTmkBY63woe4ABXOvIlrdnzuk2L585PEQ7k6hSkXTNY+4guJwAoYvNFtawhko38pKu
         +Pe2Uc7mHUB2h0YHXJjgqLX42SqRqQckiP2UMegHev+oQCtWLXeQzsvARYnQKF97Wh/a
         pIuQAL89UMzd2PQWDcXcLnXV1A0t0Ho/N/Y2v7+eCN+EO34uUbtAwzRU1qrOyQn5bhOp
         /35lNG8dIDTleLugVYzU9piNHL3zIQ9RjQ1cbydp+5nXHyNaaPZSMzk/hT6aqQFG/Qtb
         rhjwpEb1gr/KJfeqA8JDX0PpXlK9+b1mYUXlbwwUWtekM8t2AFhmlgiUG47n+qZXVdMF
         gVpA==
X-Gm-Message-State: AOAM532CbCJfaOrDKiNcjyzSimBBVEOB9pjCrcPUNzCLAeTawoVlbrJr
	ANOlXWRLj93MgRGMd6Y0i7i+je4HfrA=
X-Google-Smtp-Source: ABdhPJznznhLQ8+HMJqUX0Tur9kYHWHqhRzpCQWK0xLGgL/jN96JZmAT8QbSmgiDSEdOL/th2tJb5Q==
X-Received: by 2002:a50:a701:: with SMTP id h1mr19117637edc.170.1591602514459;
        Mon, 08 Jun 2020 00:48:34 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:34 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 24/42] gnutls: upgrade 3.6.13 -> 3.6.14
Date: Mon,  8 Jun 2020 09:46:41 +0200
Message-Id: <20200608074659.7051-24-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../gnutls/{gnutls_3.6.13.bb => gnutls_3.6.14.bb}              | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.6.13.bb => gnutls_3.6.14.bb} (93%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.13.bb b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
similarity index 93%
rename from meta/recipes-support/gnutls/gnutls_3.6.13.bb
rename to meta/recipes-support/gnutls/gnutls_3.6.14.bb
index f56d42a613..a285e5a1f1 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.13.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
@@ -21,8 +21,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
 "
 
-SRC_URI[md5sum] = "bb1fe696a11543433785b4fc70ca225f"
-SRC_URI[sha256sum] = "32041df447d9f4644570cf573c9f60358e865637d69b7e59d1159b7240b52f38"
+SRC_URI[sha256sum] = "5630751adec7025b8ef955af4d141d00d252a985769f51b4059e5affa3d39d63"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.26.2

