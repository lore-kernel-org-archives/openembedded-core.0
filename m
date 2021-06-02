Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.13170.1622640443548199520
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 06:27:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MPiJbg5B;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id q5so2321955wrs.4
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jun 2021 06:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gv4bHbysrraKpkGDx5xZAl9G0csPM0JtvfBgJz/uw9w=;
        b=MPiJbg5BLroeLV58NnUeXHZHpuvGpJQrtmbqgQPoRF+r8AXUUJp6wGY8AEVh+JXrCh
         WkgVI+1sJTOXXHpcQovPqI+GTUpT3DxD63RrstZ/gbW7RU/9GM0UOnwQHuiG9WBAvSQz
         ZA4Q/Hp35+cJzFhC75af8y+ynlgMIzEsaAU9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gv4bHbysrraKpkGDx5xZAl9G0csPM0JtvfBgJz/uw9w=;
        b=c8D4bPQAJdliZueBIh16pJoT1RcT8iS1qU0AtaED3bqk1qfEPsiU1hwTycjtD60dXK
         PK7uusbcFHk/TNQ71qj+20Tt11QVWhJX6eCD09bFNklp99Exd/rpACfcPGJ0/rMYVnK3
         Kf8sfFk4lZVoQkJBBCczX7kuASK7bxhqTSKZOytumfvndruQjtfnDhTkHeC1yDQvuCow
         C3YUixDutLPUMBY4PtzLVj7hid1+imMNvER03Fbgqnv+SGG3OBV4A4CdokHQvKnEB1t4
         kJGyeOUBxD7OCaM9L2UFLcd+xAEx3JJEEih+84nUTx/l5IAI8BtAgYXtjcgpTKd2bQyy
         r8Hw==
X-Gm-Message-State: AOAM5303kI/UOP322014AgtLX5dloqw422OFhwKPBEUS0IiV93lUrG8N
	kuaJtzNSf5Al5+Qbec5CBjz3tlfBpeZz5A==
X-Google-Smtp-Source: ABdhPJwRTJ+PgILEzHQUsstjXtWw+eXpP0QJzYzM572RmfGplCY/E2BY4eXuYKVFWt4MUjnhrj1JPA==
X-Received: by 2002:a5d:530c:: with SMTP id e12mr19051292wrv.165.1622640441553;
        Wed, 02 Jun 2021 06:27:21 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:743:408f:2993:133e])
        by smtp.gmail.com with ESMTPSA id i16sm2799498wmm.9.2021.06.02.06.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 06:27:21 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [hardknott] [PATCH 1/5] expat: set CVE_PRODUCT
Date: Wed,  2 Jun 2021 14:27:16 +0100
Message-Id: <20210602132720.2921099-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Steve Sakoman <steve@sakoman.com>

Upstream database uses both "expat" and "libexpat" to report CVEs

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/expat/expat_2.2.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/expat/expat_2.2.10.bb b/meta/recipes-core/expat/expat_2.2.10.bb
index fa263775b39..a54d832e52d 100644
--- a/meta/recipes-core/expat/expat_2.2.10.bb
+++ b/meta/recipes-core/expat/expat_2.2.10.bb
@@ -25,3 +25,5 @@ do_install_ptest_class-target() {
 }
 
 BBCLASSEXTEND += "native nativesdk"
+
+CVE_PRODUCT = "expat libexpat"
-- 
2.30.2

