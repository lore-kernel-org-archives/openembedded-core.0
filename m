Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.739.1603381957057057684
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 08:52:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=oN5dOkNJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id p21so1272226pju.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 08:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=xPjoT1WAF1CKVitKgm/b5vk38TvTVfInNysd2T9h7rA=;
        b=oN5dOkNJ86BlFCqJ5yi9dIk0OjT8QswCvKSpj+fkAAiOFt95wXqXxkO+pALfXoJxMN
         L1sqNBcoczoqw+0j7ImlKpbo+plheimqos564vOKzsEovicrzsaoFv0Xq++JlltbDCa7
         QdjKVYO523boSQ7XVGk8x9j+OMzKHd6RXL9XHLxSL2lcfNThgEZb0AEaYiO3eoEKr+NE
         DDmJ+V5g2B0JX1uEw249lLkJwfm8zy1eVjGyfY1sY+hA2t1FtETkcKCR2ZaGbzRDGrzL
         vxpO1LgP6SQl4gk6EQpdXl5LAR6ubuFFlk+eXe6jgGJOF91UykzYkFAe+zxoo3ic9lWU
         Va5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=xPjoT1WAF1CKVitKgm/b5vk38TvTVfInNysd2T9h7rA=;
        b=ujRmT2LqIdfYep3EDAsbd95JEuDwlj5xdkypdtHveqfX0tLbFn8lpOmDKFusRuawnr
         dpO0njKLC1JJOlLeQqEA1D0dFvD+k93G86/apToitQlXJ9TNhj1+xgFwvJwoGU9aXkmJ
         lkwznOCZ0L6K8zscIBTdckBnCJUaJzOmBk5Cunu8gi5Lnd6bdvW+OUFYSO+asPx54V51
         R2fnR78sxTZd39C68jRSbTLT3Iv4bhDQB62QRuNtbu130sMdtQYpQfmrKpuKAqYhRidY
         23Pt/0x9JX2JTcFTOrZeUdedOYZdx0dCeMUiqmHTzWFUjo8rWYq4LeFtbDVtiytnOeHQ
         QlUA==
X-Gm-Message-State: AOAM533d4xPjr2IqjKTzbJP1vFkKF60fcmDZ5+hmGxdaTAsTIQnWJidq
	LPgPPsEL2qZPuXJvDgpAUsCBegn6jvHKbOLb
X-Google-Smtp-Source: ABdhPJyFajVi8cBAWFzH8WvaOb4z51gqOTsaAzVJdlI9vul52cHip4c6EkYcWR9U7+9DPPTtgdHFpg==
X-Received: by 2002:a17:90a:248:: with SMTP id t8mr3212525pje.64.1603381956168;
        Thu, 22 Oct 2020 08:52:36 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id kc21sm2423558pjb.36.2020.10.22.08.52.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 08:52:35 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/14] tune-ep9312.inc: add t suffix for thumb to PACKAGE_EXTRA_ARCHS_tune-ep9312
Date: Thu, 22 Oct 2020 05:51:37 -1000
Message-Id: <6243df4e8daf78c7b5004f9e123894a2d4027392.1603381705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603381704.git.steve@sakoman.com>
References: <cover.1603381704.git.steve@sakoman.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* broken since:
  commit 805dd4807d322dc70cef97edd68fdb3142b60fb1
  Author: Andre McCurdy <armccurdy@gmail.com>
  Date:   Fri Aug 23 13:51:36 2019 -0700

    feature-arm-thumb.inc: fix ARM_THUMB_SUFFIX

* since this commit the 't' suffix is set ARM_THUMB_SUFFIX by
  armv4 override (which does apply for ep9312 tune) instead of
  armv4 in TUNE_FEATURES - so the comment in the file was no
  longer correct and ep9312 wasn't usable

* fixes:
  scripts/tune/log.fake-ep9312:    Error, the PACKAGE_ARCHS variable (all any noarch arm armv4 armv4t ep9312 fake_ep9312) for DEFAULTTUNE (ep9312) does not contain TUNE_PKGARCH (ep9312t).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f23c7f23c64cbd70d38a01dfda3a4d0809b33bdd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/machine/include/tune-ep9312.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/tune-ep9312.inc b/meta/conf/machine/include/tune-ep9312.inc
index be20eb363b..3f0ba2ec12 100644
--- a/meta/conf/machine/include/tune-ep9312.inc
+++ b/meta/conf/machine/include/tune-ep9312.inc
@@ -8,6 +8,5 @@ MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'ep9312', 'armv4:', '
 
 AVAILTUNES += "ep9312"
 ARMPKGARCH_tune-ep9312 = "ep9312"
-# this tune does not include TUNE_FEATURES_tune-armv4t, so there is no armv4 TUNE_FEATURES => no 't' in ARMPKGSFX_THUMB
 TUNE_FEATURES_tune-ep9312 = "thumb ep9312"
-PACKAGE_EXTRA_ARCHS_tune-ep9312 = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} ep9312"
+PACKAGE_EXTRA_ARCHS_tune-ep9312 = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} ep9312t"
-- 
2.17.1

