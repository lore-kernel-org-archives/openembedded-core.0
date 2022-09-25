Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF96C6FA8E
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:18:12 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.20498.1664133485924047073
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=pWou5klv;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so10502865pjq.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=ms2ZErcPtlucYHJwi4foFyGlj5QaLTVKB2+ZGrIcIIQ=;
        b=pWou5klvTQITD8510gdN1ki6asy8ul7ITKjz5eNhPljp4LdZNFtNt/95i78hgt0Iy0
         dx5b4FsB/ZoKH6iUf55XIJ97pgSJ8Y/KiPuy93cYqmPngr+Io/H5EnUIpM2Y12qlYbKp
         Mj2lZrTiziX2v/VfSBNSOjTqz2/mI/KjQO0Ty61kVXGppmz7Qf8/bJP/jibFNUBumP4b
         FBz0QXLYewowpqsH7ea0HHMJYJORaiJMt7dSKjLcBtd0trIYM4QD18jeCEm53GKlaxfR
         r3IGJyWqPCNdDBuFGynMUqa70XoRhJ4Nm2SJeJC8tFVX8IWOfVO7XKsz9ncpBHuIxOLd
         6u7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ms2ZErcPtlucYHJwi4foFyGlj5QaLTVKB2+ZGrIcIIQ=;
        b=q8WGYZsiwyBCdA+se4auYq+UgggWYHkdVyDJPhj/3J7oy4txpkyeC6iTwzwaq8VJ8B
         kPqt0iA0MNOFUELnK1ZceX5+B9musSM6SnJ1Rm2DML4ua2zH6+oDBZI7/S1GAIGQ31Jn
         cKXF9/vjlSMwkQJnRksa9hkOJra41EF1PvVYHHNfakD4FB/09rkLth6KZGHg28ddvTXA
         4zuxOn1uRFWJ6KG1pATCAOjgXjPdo8qekS7PWJwf9ttgkIXQjY6G574ce2j40JTsD0y6
         EzOxA2pp0AT13JhP7Bi9yW8GfFIFpqcO45ic52vesbT61m1s0X3oMVuGhtVPTfsjhdTx
         Br1A==
X-Gm-Message-State: ACrzQf01nT1yvH+Br+V7T08hCK0vyhGQykl4+PR5fP9zH3qFnnvqnU/3
	jQNlLx2gr0E/RGNOWxs6KPmBC1AX2Jhll0uF
X-Google-Smtp-Source: 
 AMsMyM6WXOvuHnHc7tBk0zngGQm/4zKKABGm/7uRb3hPFypMkJlkK4gtUZo5S60cqvgNcQ0EalQWMg==
X-Received: by 2002:a17:90b:2246:b0:205:97a5:520e with SMTP id
 hk6-20020a17090b224600b0020597a5520emr11806321pjb.244.1664133484999;
        Sun, 25 Sep 2022 12:18:04 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.18.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:18:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/33] expat: upgrade 2.4.7 -> 2.4.8
Date: Sun, 25 Sep 2022 09:17:15 -1000
Message-Id: 
 <f1b9dd6ed98c1dbd5f3347423f49d25914e55526.1664133308.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664133308.git.steve@sakoman.com>
References: <cover.1664133308.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:18:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171018

From: Florin Diaconescu <florin.diaconescu009@gmail.com>

Changelog:
=========
 Other changes:
     #587  pkg-config: Move "-lm" to section "Libs.private"
     #587  CMake|MSVC: Fix pkg-config section "Libs"
 #55 #582  CMake|macOS: Start using linker arguments
             "-compatibility_version <version>" and
             "-current_version <version>" in a way compatible with
             GNU Libtool
             see https://verbump.de/ for what these numbers do

 Infrastructure:
     #589  CI: Upgrade Clang from 13 to 14

 Special thanks to:
     evpobr
     Kai Pastor
     Sam James

Signed-off-by: Florin Diaconescu <florin.diaconescu009@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/expat/{expat_2.4.7.bb => expat_2.4.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.4.7.bb => expat_2.4.8.bb} (91%)

diff --git a/meta/recipes-core/expat/expat_2.4.7.bb b/meta/recipes-core/expat/expat_2.4.8.bb
similarity index 91%
rename from meta/recipes-core/expat/expat_2.4.7.bb
rename to meta/recipes-core/expat/expat_2.4.8.bb
index bf1ca8d56e..980c488640 100644
--- a/meta/recipes-core/expat/expat_2.4.7.bb
+++ b/meta/recipes-core/expat/expat_2.4.8.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
 
-SRC_URI[sha256sum] = "e149bdd8b90254c62b3d195da53a09bd531a4d63a963b0d8a5268d48dd2f6a65"
+SRC_URI[sha256sum] = "a247a7f6bbb21cf2ca81ea4cbb916bfb9717ca523631675f99b3d4a5678dcd16"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.25.1


