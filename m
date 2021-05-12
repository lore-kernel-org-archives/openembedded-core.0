Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web09.8170.1620831493714175157
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 07:58:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=EnXY1A0V;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.48, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f48.google.com with SMTP id i8-20020a4aa1080000b0290201edd785e7so5010371ool.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 07:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wgELj2bFyuSxwcJDbQzezcS9geJHC9l45oasrmyXXA4=;
        b=EnXY1A0VNZAM3Ji/XXCVSqKqN50Iyb2J1Alyr9cJ/PyC9Fp7jv6Lun4l9A7IajFE8B
         hfpIw9o0oZQSXSAdEp+wfobAFMVqUviFB8UYdhuD/ak/oJdf6XoiqKq2tIa/AvjWvZJ2
         KR+YM2NRR6oOLKyaMKCrS0VskIS6AFmFOsmZTGt/tVGbvZsWwAhTcXQraortsVm249JI
         pp8Fs4RilXQxK/hAPJ01MJIRZBbEABKQd6p/1H5ljluWGi5DAWy20MX6z2LIpgo5Y26E
         sIV5G79cZxQOxEKuAmzcpiMB3ujEzDbEpRCk6KqX4DRUMmt1ZAMZSnzBAOuuiyGZqWRZ
         LN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wgELj2bFyuSxwcJDbQzezcS9geJHC9l45oasrmyXXA4=;
        b=j8SdSmB+wRRJteP7sMUBwTTTB9hDSD8ej/quYtjwhlpFPFI+459Dvq3tirvexPCb67
         hL2nf5dM6en3w/k2BEO77RGYJTjY3KG1ri4Bn7bb8rHjDefXuxAVKeqwsctZSn02yaVQ
         H2S3SbwX6XJFIK5HtceD/u8Z6as+0isIC9pUWdRyEzk1U3hD3SrUqin9uE6PTF0nb22L
         ZjNR6pADAPaNOpvYUYKNujBk2LetSDFV0XQwG3C4k4DzCNBrmxOadSWK9+1CHTsfDexQ
         LvWBWkBtMfob/fz33/XZq/DJrTitd2Jf7/5prh7zw0jzl1yPJfZxK7dfjcIvhN/s9BD+
         gIPQ==
X-Gm-Message-State: AOAM5339i9tl11J2+H8+UCp4mjb3uTByP0mmULTy/S8M/evoAT8GuhbE
	KAr5foWhSo+0415ZAXsIOHFsiuhDbItVhZK16Ro=
X-Google-Smtp-Source: ABdhPJxxbCEcZUFx8iKejc0lIzFXUT82yYJq4fJsd4mWkD7dgrH27/V98Y/ezcACGqz51Gz80GQgRA==
X-Received: by 2002:a4a:c1:: with SMTP id 184mr28328511ooh.25.1620831492571;
        Wed, 12 May 2021 07:58:12 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id 21sm1678otg.4.2021.05.12.07.58.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:58:12 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/22] libnotify: whitelist CVE-2013-7381 (specific to the NodeJS bindings)
Date: Wed, 12 May 2021 04:56:46 -1000
Message-Id: <dd60c1fc2b3cf6f291a8b6fea8a60e13f0aac8d9.1620831171.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620831171.git.steve@sakoman.com>
References: <cover.1620831171.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit be04484f99a5b29cc9066e350b526fc4420ad6d4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-gnome/libnotify/libnotify_0.7.8.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
index 0f2c3aa131..6b59029255 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
@@ -24,3 +24,6 @@ PROVIDES += "libnotify3"
 RPROVIDES_${PN} += "libnotify3"
 RCONFLICTS_${PN} += "libnotify3"
 RREPLACES_${PN} += "libnotify3"
+
+# -7381 is specific to the NodeJS bindings
+CVE_CHECK_WHITELIST += "CVE-2013-7381"
-- 
2.25.1

