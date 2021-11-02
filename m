Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADD5C43219
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:25 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.6595.1635842604039997967
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JMoJg3Gz;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id d3so31988227wrh.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lCqtlW7b+J3P5KOHTF7ELTVGIGq1g6cSUyeyG3QRoCg=;
        b=JMoJg3GzKRuRMHnZUaxd18egUPYpLxkrbf90IpiUZG7CQXFNIzLsjANsx+1EBCT5aS
         2fcDJ8PJ1WuW9w4gxUBIv1IN3NiSHiAICzHNVlQ5vRUBRHpwnHCby7vHtQ69r5itYvL+
         L0cuuo/AWB/BUt5zXR6VH87nO5DECMpgqglhb+C6lLzxm35GGv7QhDe1moonZFrz38p8
         OqvNLrZ7+TCYJ3tnmmGEPVcvG5Efoxi4Wh7luORxceLKonrlHa46iM2JwQm9tmfkhD5u
         FOWXdQQVR4Pwasyc+BBV3yFVuV/CfqiVt2jw4n0KIK8M6d7rLUhf438paN0xzlWjmerQ
         D1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lCqtlW7b+J3P5KOHTF7ELTVGIGq1g6cSUyeyG3QRoCg=;
        b=1ZqOcm9ipbayDIamvvAikz4YMaxSP8jCYIlx9+kiusXJOb6LhKuhLgm+KnB5eTesI4
         w33r0VdNCqwKqljvaE8pKNdB0vX7MxE2CeSxwMfnnax9qLgI9rGc2gKpRruWcPmvMnaP
         Eplei7TM8zX0Btj6Zy1yeiwjtGPgBX/4Ba3dJEXrOnABKsVlhfJeaYlIPKRTUYPUbrMw
         6QH1QRV1Ki4h3G5cwPsLASeqU+wyZAbNOaQ+eWn4kTew85i2oZCa3uyG6GBSufPPxMFk
         cK8xkIVOwD3Ck/8DbXsMjXMbNhZFGakBIZA4DGdcz9sPrHhohYydrxSYT1mR49p4giVH
         8CVQ==
X-Gm-Message-State: AOAM531OKCNMX52O22R1f5C48PuhTqHwzJItoYbDYHRtfZTUk1oEqfUc
	ZuNm0lbXdC6+vvCs7vcKTsYaG2ZrTIk=
X-Google-Smtp-Source: 
 ABdhPJwgHRKlVccTrxizRfyG03aTwbGnNle8BjnWNnrOM9hX7NEC9d9Ak0eUt3z2PnM7nZPGsR/hPA==
X-Received: by 2002:a5d:4e09:: with SMTP id p9mr30631940wrt.28.1635842602653;
        Tue, 02 Nov 2021 01:43:22 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:22 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 27/33] icu: update 69.1 -> 70.1
Date: Tue,  2 Nov 2021 09:42:57 +0100
Message-Id: <20211102084303.2974802-27-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157765

License-Update: formatting, updated copyright holders

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../icu/icu/0001-icu-Added-armeb-support.patch       | 12 +++++-------
 .../recipes-support/icu/{icu_69.1.bb => icu_70.1.bb} | 10 +++++-----
 2 files changed, 10 insertions(+), 12 deletions(-)
 rename meta/recipes-support/icu/{icu_69.1.bb => icu_70.1.bb} (93%)

diff --git a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
index c5dc0611c2..578517b57f 100644
--- a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
+++ b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
@@ -1,4 +1,4 @@
-From 500321387ceca48934bb0f323779117cd518bab6 Mon Sep 17 00:00:00 2001
+From e3c25af4b40d64f098e7b8ae5a91fdc3c90163c4 Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@cn.fujitsu.com>
 Date: Wed, 8 May 2019 14:42:30 +0900
 Subject: [PATCH] icu: Added armeb support.
@@ -8,12 +8,13 @@ Make icu support arm32 BE.
 Upstream-Status: Pending
 
 Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+
 ---
  i18n/double-conversion-utils.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/i18n/double-conversion-utils.h b/i18n/double-conversion-utils.h
-index c937463..feaad0f 100644
+diff --git a/source/i18n/double-conversion-utils.h b/source/i18n/double-conversion-utils.h
+index 7f23e0a..7f89094 100644
 --- a/i18n/double-conversion-utils.h
 +++ b/i18n/double-conversion-utils.h
 @@ -115,7 +115,7 @@ int main(int argc, char** argv) {
@@ -24,7 +25,4 @@ index c937463..feaad0f 100644
 +    defined(__arm__) || defined(__avr32__) || defined(_M_ARM) || defined(_M_ARM64) || \
      defined(__hppa__) || defined(__ia64__) || \
      defined(__mips__) || \
-     defined(__nios2__) || defined(__ghs) || \
--- 
-2.25.1
-
+     defined(__loongarch__) || \
diff --git a/meta/recipes-support/icu/icu_69.1.bb b/meta/recipes-support/icu/icu_70.1.bb
similarity index 93%
rename from meta/recipes-support/icu/icu_69.1.bb
rename to meta/recipes-support/icu/icu_70.1.bb
index 4daf0fe82e..0988ae8b8e 100644
--- a/meta/recipes-support/icu/icu_69.1.bb
+++ b/meta/recipes-support/icu/icu_70.1.bb
@@ -6,8 +6,8 @@ same results on all platforms."
 HOMEPAGE = "http://site.icu-project.org/"
 
 LICENSE = "ICU"
-DEPENDS = "icu-native"
-DEPENDS:class-native = ""
+DEPENDS = "icu-native autoconf-archive"
+DEPENDS:class-native = "autoconf-archive-native"
 
 CVE_PRODUCT = "international_components_for_unicode"
 
@@ -83,7 +83,7 @@ FILES:libicuio = "${libdir}/libicuio.so.*"
 
 BBCLASSEXTEND = "native nativesdk"
 
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=002d2fdc32d17f0ec06e9a47f2c0c8d0"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=dc9d616e558490c389609a0e8b81ae6d"
 
 def icu_download_version(d):
     pvsplit = d.getVar('PV').split('.')
@@ -112,8 +112,8 @@ SRC_URI = "${BASE_SRC_URI};name=code \
 SRC_URI:append:class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[code.sha256sum] = "4cba7b7acd1d3c42c44bb0c14be6637098c7faf2b330ce876bc5f3b915d09745"
-SRC_URI[data.sha256sum] = "4fc2d8cfc3343673123586fca3967404abd4e346fba5515829204533b3bae4bf"
+SRC_URI[code.sha256sum] = "8d205428c17bf13bb535300669ed28b338a157b1c01ae66d31d0d3e2d47c3fd5"
+SRC_URI[data.sha256sum] = "c72723ddba3300ffb231d6b09e2a728ea6e89de10ed5927f74bacbd77042336e"
 
 UPSTREAM_CHECK_REGEX = "icu4c-(?P<pver>\d+(_\d+)+)-src"
 UPSTREAM_CHECK_URI = "https://github.com/unicode-org/icu/releases"
-- 
2.20.1


