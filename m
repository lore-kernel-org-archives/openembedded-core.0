Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.19754.1625880672057123749
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jul 2021 18:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GchM7AIT;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id b12so10344497pfv.6
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jul 2021 18:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wosR7EiVV85ExWSDK45jmIA6er+QsfZ9+7kBmMkaPp4=;
        b=GchM7AITpDsx1t7ED5bcFYjV2cE33Ok72NeJdSjc4cp08K01ldcuCZxjrXFANXLcoz
         QFsxV90wUFSKXK/xbL82df5T+xXtOTH3HWAAMEsb/vCni1oguUqxZ3f2nsO9KY+tg7fV
         3YJJnUMndtBL47GekU88LSqvoI1kZEW3B62jKRzWQenwwJQoc+X2MSoKk/yLzV5fELGU
         DAjFJntIy/P/xw4mJvM2VmkD3sTrm+SgaOWR3gRc90ZvgU76HKF5XvCh0Zidg+JALcK0
         TYf9a2vV3hqvqY9l5QvNzXPPb/NnK2l80pYQXHgfak0kZnUethi0Ay4irfJCVS+V/m9V
         /SFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wosR7EiVV85ExWSDK45jmIA6er+QsfZ9+7kBmMkaPp4=;
        b=XWie3EasxIrw2bislLvBOCUUAcwcUk4oTD9/mhpAIZ63MXob0d5+/wnvNAUUkVU8R1
         X77RgjrylkLvQ1RubG4gSl9x3e6dkEsvI1HBe+ywBFRmH/21KLThLXetB4lrQOH91can
         5OrHeFWM+dGoTXN9MeEEoQAYxT6VL+nWhQ/CySH4uQpmxsD1LnJTzRWxTF3ZXe4KxMw1
         eXy3+kY2FbYQPe5+ebdFh37jsLYbnC+pr34rAzz7Lq9pdgS0ibjT7UHwsmzx5lSJWhsH
         0XB8IUh3Z95TfqimaOlIuZwq/xrU9hBAieKDkvCdNNDWgcMJIaePdPdsKZi239PHAp+B
         gv1Q==
X-Gm-Message-State: AOAM5310md2lUkLGradM/RHBRYDlVPGgwK/xMSzuJ8PfiX7m3U2gPdk8
	ybSxFj42uT+CwOqHyxWEkTDfgK0L74kGhA==
X-Google-Smtp-Source: ABdhPJzDj7moxiSnlOFZAxymjAeN9M0LpUdo3KKfTYrwHsKHNXP8RycWvmZmYVXQeNIAPeIDA0RFyg==
X-Received: by 2002:a65:6283:: with SMTP id f3mr11490040pgv.370.1625880671172;
        Fri, 09 Jul 2021 18:31:11 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:9640:d89b:756b:bcda:a155])
        by smtp.gmail.com with ESMTPSA id u23sm9237278pgk.38.2021.07.09.18.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 18:31:10 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH] at-spi2-core: upgrade 2.40.2 -> 2.40.3
Date: Fri,  9 Jul 2021 18:31:08 -0700
Message-Id: <20210710013108.1370983-1-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

What's new in at-spi2-core 2.40.3:

* Use abstract sockets if libdbus is older than 1.12.0 (#37).

References:
https://gitlab.gnome.org/GNOME/at-spi2-core/-/issues/37

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 .../atk/{at-spi2-core_2.40.2.bb => at-spi2-core_2.40.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.40.2.bb => at-spi2-core_2.40.3.bb} (94%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.40.2.bb b/meta/recipes-support/atk/at-spi2-core_2.40.3.bb
similarity index 94%
rename from meta/recipes-support/atk/at-spi2-core_2.40.2.bb
rename to meta/recipes-support/atk/at-spi2-core_2.40.3.bb
index ebd3ed49c60..b1a7b51b922 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.40.2.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.40.3.bb
@@ -11,7 +11,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "44dc17af943b0fd196c61c1e03b6c166960385cae96ccb5e95bdefffb6849f98"
+SRC_URI[sha256sum] = "e49837c2ad30d71e1f29ca8e0968a54b95030272f7ff40b89b48968653f37a5c"
 
 X11DEPENDS = "virtual/libx11 libxi libxtst"
 
-- 
2.30.2

