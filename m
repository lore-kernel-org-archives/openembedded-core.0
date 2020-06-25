Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web11.9258.1593087752329279207
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 05:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=I3Pe0njM;
 spf=neutral (domain: qtec.com, ip: 209.85.208.194, mailfrom: daniel@qtec.com)
Received: by mail-lj1-f194.google.com with SMTP id n24so6246460lji.10
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 05:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Y72kfAuZlDqRVfc6wnZ4eUYqcXsVJ52/a0JxdY2jz0=;
        b=I3Pe0njMA7OfDStL1Uu/UP2JnT5sCtwOK5SPfTB5UnfKPg/Oyu093OQqROUzvF7mwN
         Z8bdn0LkeR8PlewPBt6oiRf6jNPDVKV/JyVMF2j5ifNcAsxk1sRTps0oz/oCGfE/Beb+
         9m99qV0tEW8B7eYNbYaFY+gA6Hulpblj6DoSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Y72kfAuZlDqRVfc6wnZ4eUYqcXsVJ52/a0JxdY2jz0=;
        b=SW1XiwARFJB9Zk/9S/0rvuqT++35Td5qGKvOMUNv4zL7xbAzOfaSUm6Pjekcw4knLr
         Z79lqNdFx4oJNWquz2RaMaDPUp8tVtJZZ+5OefUTbF55dagifPEPEtHlXScbzJO22ipx
         abyOkMitCc6ShGRSkjHDri+FYYdBgIDB02zOnUEukBHG1nqjM4fpeHdt0Hgiws7kmk1U
         YtmApd4JmOzCQylj3vczsDkMmEWTbAM6dbAv/Pmpe/DOB8Lwf9JGRHCqyms8QUO4fRv8
         N1j2uHbWxromp/+exv34D1LdW4pYHhftYCd0E+rG0kAEqwIprffE5Kw+5Jp7mYAxn9HB
         Q2hA==
X-Gm-Message-State: AOAM532yy0U2tM0HIR5r1RlUNbn/OBW7/mbXnYCWIbKSpDSyB6LkUgtc
	FUOy0urOynskKo2kCNCKQeLs1i5QQmEsnyfLW4dlge9N9vwDo1ajPPTdaFH6Yw5+BGFtOfMXcSV
	gGOmRdZhwhfxhX++DXtWAKZraxKH9Tnl3XR87k+7gNXkbYQYecIZQ+mYT66ndeS9TEbAvqaLOw8
	c0D2ku5ufVqg==
X-Google-Smtp-Source: ABdhPJw4UgAVTtR44xxNrjQC4LAw8p6mh5Lb8W5byTLcuTpBF3VdMTjkbWHWK3WHYh3a/dZgBfUFWA==
X-Received: by 2002:a2e:81c8:: with SMTP id s8mr6662872ljg.281.1593087750218;
        Thu, 25 Jun 2020 05:22:30 -0700 (PDT)
Return-Path: <daniel@qtec.com>
Received: from turia.fritz.box (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id j26sm4656721lfm.11.2020.06.25.05.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 05:22:29 -0700 (PDT)
From: "Daniel Gomez" <daniel@qtec.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel Gomez <daniel@qtec.com>
Subject: [OE-core][PATCH] ttf-fonts: Update ttf-ubuntu-font-family recipe
Date: Thu, 25 Jun 2020 14:22:22 +0200
Message-Id: <20200625122222.38961-1-daniel@qtec.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current version 0.80 is no longer available with the link in the recipe.
Update it to use 0.83 version.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 ...ont-family_0.80.bb => ttf-ubuntu-font-family_0.83.bb} | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/ttf-fonts/{ttf-ubuntu-font-family_0.80.bb => ttf-ubuntu-font-family_0.83.bb} (65%)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.80.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
similarity index 65%
rename from meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.80.bb
rename to meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
index d5d1b9a17..b8aa4c01c 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.80.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
@@ -6,10 +6,13 @@ LICENSE = "UFL"
 LIC_FILES_CHKSUM = "file://LICENCE.txt;md5=325a1a9029112a2405e743c7f816427b"
 PR = "r1"

-SRC_URI = "http://font.ubuntu.com/download/ubuntu-font-family-${PV}.zip"
+SHA1SUM = "0cef8205"

-SRC_URI[md5sum] = "a1fc70f5a5b1d096ab8310886cddaa1c"
-SRC_URI[sha256sum] = "107170099bbc3beae8602b97a5c423525d363106c3c24f787d43e09811298e4c"
+SRC_URI = "https://assets.ubuntu.com/v1/${SHA1SUM}-ubuntu-font-family-${PV}.zip"
+
+
+SRC_URI[md5sum] = "c5a5059d6856b4ddf79d824dcaf5ad32"
+SRC_URI[sha256sum] = "61a2b342526fd552f19fef438bb9211a8212de19ad96e32a1209c039f1d68ecf"

 S = "${WORKDIR}/ubuntu-font-family-${PV}"

--
2.27.0

