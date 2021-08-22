Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web08.9617.1629636694947179649
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iehTsJSB;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id u15so8780549wmj.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ic2QFh+CRV65eu9fRBYcT5UZEu1hy1E8juoyuZcnXfY=;
        b=iehTsJSBAmqkgCVmlCpY5ieSSxdprZUARKtWXjV/B9fsTvd/crL9PJJmqi/MuTVfC2
         XkUFsKENAqRwXMX6WZaKoNNOp28PZwGfGspi5fk14cWb4OnI2jDdmv1degsPjnC/UQZv
         1leI7O5cjeu9X0/8jLxGQOzGyBnznEySdag7MagAXqOl/cfQ1CicF6fKLUcYUY2tHBwC
         lYE+QwdsgWqVzFHd+dUKh2QFhgbouiZPN7p4tSZg928BRb0BIdSKT4P5/6+ddJfFY1Br
         fj00Na04TvFB8Ud3pRUEeABPRpofBSoW9s7jwtiEUjUj5/t/TkgCvNBrRBiBKi1x3Wp1
         93Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ic2QFh+CRV65eu9fRBYcT5UZEu1hy1E8juoyuZcnXfY=;
        b=p9OeuXEMII0Cpjw7/4U/mvPQcSvswswW8b3anB95rr7xRVvMpxX+g/YA7cmIvO1eKa
         yEPik/0sKOdOf4TYQ0eHs6EFvk+WpxnDaLykRan6eEa20uSiC9NP6VHTumM6aDjosHeR
         WCxypAQMtu/fhehqEcG/09p/fHaRNhQaInAZ5mVvK69qanaiU2NamIO3T7JLKBoS4Kl7
         PKpT0hCE92/aUxdtFjDbH2KjAzZyKyd+4zR4WsmQfGzs6RiF0aCjrrN636l3ETpptWCK
         i4RAbdJiwCExTscC6FwZl4TNikLSl2OJh9kIqFvGjU3nRvSSc/jNqK675F7vaUBoTnGM
         a4dA==
X-Gm-Message-State: AOAM530SSJICDqeI4CRkDXFsR1V0Rvcz3GW7cEuDjCFuAHFkG8EBojlY
	etV/8MuHKOqjdqPfq+3S57WhUYjPB4t5eQ==
X-Google-Smtp-Source: ABdhPJw+Sm2M74ksXERJydRBVAvVu6QfxApH+9/iptFf+QmdHWLWrfUh0Z/zgzrH0n32cWX8MKY9Hw==
X-Received: by 2002:a05:600c:2297:: with SMTP id 23mr12309272wmf.64.1629636693610;
        Sun, 22 Aug 2021 05:51:33 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:33 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 33/55] libidn2: upgrade 2.3.1 -> 2.3.2
Date: Sun, 22 Aug 2021 14:50:41 +0200
Message-Id: <20210822125103.310416-33-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libidn/{libidn2_2.3.1.bb => libidn2_2.3.2.bb}              | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/libidn/{libidn2_2.3.1.bb => libidn2_2.3.2.bb} (90%)

diff --git a/meta/recipes-extended/libidn/libidn2_2.3.1.bb b/meta/recipes-extended/libidn/libidn2_2.3.2.bb
similarity index 90%
rename from meta/recipes-extended/libidn/libidn2_2.3.1.bb
rename to meta/recipes-extended/libidn/libidn2_2.3.2.bb
index 07781940af..f1f6fcba05 100644
--- a/meta/recipes-extended/libidn/libidn2_2.3.1.bb
+++ b/meta/recipes-extended/libidn/libidn2_2.3.2.bb
@@ -10,8 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d834ea7d480438ada04e5d846152395 \
                     file://lib/idn2.h.in;endline=27;md5=d0fc8ec628be130a1d5b889107e92477"
 
 SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "cda07f5ac55fccfafdf7ee01828adad5"
-SRC_URI[sha256sum] = "8af684943836b8b53965d5f5b6714ef13c26c91eaa36ce7d242e3d21f5d40f2d"
+SRC_URI[sha256sum] = "76940cd4e778e8093579a9d195b25fff5e936e9dc6242068528b437a76764f91"
 
 DEPENDS = "virtual/libiconv libunistring"
 
-- 
2.31.1

