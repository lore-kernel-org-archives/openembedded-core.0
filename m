Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web08.58657.1622557152599486376
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 07:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=KcmPmMrV;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id f22so11549393pfn.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 07:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/iy12daqwlKoOTajOXidZNY2YMuuwLxCmIkpgI2BRic=;
        b=KcmPmMrVqqJLEi9NIuCpcVJhsX/9QSuTbh+C80Eqzwg4jPx07BoQNgMkOPs7w1oFJV
         HFNOuhbks4dRWwz/KLwyDTFtxtAGg76xbekpRfVPEnyyYOoAmWRO4bLnE+7SH8d9txxV
         9imiVu1KPsX6QvdRR6uLahWvpHHBu1GhEUjYKA5Wae2Hj4hs+sVnrOxJME3ZaxsHTl5T
         WULB2L0uJoSCjyRMjHVd6rjVM8g76vVgppdhipy4harUse8mEZBaKxxkGGpK355UzvNh
         nQTuNZ2RN/1kVSo6gCiKFeJUj44RXLOzW+HO2isN6wvcnTivGyYnXzt0p3Zl6xOvXX05
         P6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/iy12daqwlKoOTajOXidZNY2YMuuwLxCmIkpgI2BRic=;
        b=jehwDCiz8wOSDkVud1qi1Dw/JQzrmUxrs0KhgQxNS+CkIZbntCzbebyUyraTAXcRvC
         jP0dZtUpv61DuTPLFvgluPyZcKhe27NnhwIdZrE5lxkpVa4oRkg2XxE6ujsj9tvi8fW9
         hyKXKYIEfoQkKBz3zyTKNUP5+wXKy46//ADW3g3ASoEiwnsPTJoGlNZNb+3KI5HK2BcA
         UVKOKz79mPxx+LcFVd0MnOhbnr2sOxb/2Mqa4csZPspsOsmMKaM6cXwpPz9NH/ABJM4p
         ZpkfKUwKuSItPBoN71Bsn39fUoxopX1cniOK3LDKik6GRf0GugtWUiLcbH3Nksr++1na
         lqPg==
X-Gm-Message-State: AOAM532RRK5A69/Aki1uJXrSKz+4Yrkpk+lS41A3z0W3g7TnK+ZEDUDI
	PxFyBB2qZ9IsRAaX4M3hK91or7SPAmfp/idm1Gw=
X-Google-Smtp-Source: ABdhPJz7eS46ghDd9Bi/TGZX3HtltC4lGflgWZMtP4CpTd2RZIXJxdXeAacBq3zv76DMXPsFmLYBAw==
X-Received: by 2002:aa7:874a:0:b029:2e7:8407:f8f3 with SMTP id g10-20020aa7874a0000b02902e78407f8f3mr22327124pfo.53.1622557151658;
        Tue, 01 Jun 2021 07:19:11 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id bb18sm2307875pjb.44.2021.06.01.07.19.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 07:19:11 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/26] kernel-fitimage.bbclass: fix a wrong conditional check
Date: Tue,  1 Jun 2021 04:18:07 -1000
Message-Id: <0d35b7d1de517ceb1bddc9ffe848e3d25030747a.1622556919.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622556919.git.steve@sakoman.com>
References: <cover.1622556919.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

It should check if "${UBOOT_SIGN_ENABLE}" equals to "1" instead of
checking if "${UBOOT_SIGN_ENABLE}" is not empty since it could be "0".

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 900949af7fe357ee66065ba150b0b1914e8ca581)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 72b05ff8d1..b4d8ff8309 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -250,7 +250,7 @@ fitimage_emit_section_config() {
 
 	conf_csum="${FIT_HASH_ALG}"
 	conf_sign_algo="${FIT_SIGN_ALG}"
-	if [ -n "${UBOOT_SIGN_ENABLE}" ] ; then
+	if [ "${UBOOT_SIGN_ENABLE}" = "1" ] ; then
 		conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
 	fi
 
-- 
2.25.1

