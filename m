Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.7067.1588683736474486473
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 06:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LsfcbS6r;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id r26so2263241wmh.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 06:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BQQLeANFH9IaFWOIBJ0M/hVNuu1HSeTv3OwWMpA6P5I=;
        b=LsfcbS6rMZXgKBzj9k6F/k60eodz0edBUBjiea3Z8WBvETJfEEZDD+5zxMaP7GGCCn
         FFB77cBjriSiPtUZpLIlPGild5+Cd3aR70DeFXb5mYbMzsP5iRW9FBO0aiDHvNT9BmUY
         YSSBENtyhH6Elsl+PwXIeFoozmAMclk0VzwbqA4K+/1wPa8ZdAMeP0LsHWy2sKrzEg//
         8GHNr0jctCVWk5SRSt5HK5V0DSe3UYLvTCEVorkm79B5h8+5vhZvgI4f6rUi5chuwRE3
         uIHT9k4qADfUvAkbW2REl1PEvkh/UCT3U711QXiuvkeQFhoKVf1wsTJACAwv976id6zj
         fxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BQQLeANFH9IaFWOIBJ0M/hVNuu1HSeTv3OwWMpA6P5I=;
        b=jZ135nlrBVoEj/9Yjgi1EApilXC+cio2Jwroe6v2Aea89bf6mjFSncwOn7b/utxeeE
         8zLA6rVzK7eLet9FZGxdo5UEatWBzRf+5Qj3iJ5iXsa9VXeCLr6043SGQWts1QPB20pA
         VWBah+/8REUMFicrsfD12YXrg6uo58igQEi8BJWhMmHtv1GjldP72KHNp2xExy/6UoB+
         7nRRb6J6Y/mcuDUZPz1n1tElv7dC7x7ksrSowzELbxCHYJ2Rb3hNMbEjW2v3NV5HDFXI
         QcVmgXXiLtbDaNwVBbGjluPZwRsjYdtvpl12IHkBh+YcvT6W4iFx7SFhTMxCL0jK75ym
         fubw==
X-Gm-Message-State: AGi0PuYltroMajJ6QI1GTBLVFdUW3MkZLBRT+As1zrAOvzrgt0BM8YSr
	aE81f5ZtFESWq85a1qgJcJkdsPTS
X-Google-Smtp-Source: APiQypItcyyrOi88iIk5R1dmi5YjnpWXIU+94DC3bdnk5kr8muZuF5yPDuL3b6wonC0tDF4/y65MQg==
X-Received: by 2002:a1c:f416:: with SMTP id z22mr3255627wma.32.1588683734903;
        Tue, 05 May 2020 06:02:14 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id h16sm3388113wrw.36.2020.05.05.06.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 06:02:14 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/24] rpcsvc-proto: update to 1.4.1
Date: Tue,  5 May 2020 15:01:23 +0200
Message-Id: <20200505130133.24930-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200505130133.24930-1-alex.kanavin@gmail.com>
References: <20200505130133.24930-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
index cb5b288c48..f2e9e3975e 100644
--- a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
+++ b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
@@ -15,9 +15,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0daaf958d5531ab86169ec6e275e1517"
 SECTION = "libs"
 DEPENDS += "rpcsvc-proto-native"
 
-PV = "1.4+git${SRCPV}"
+PV = "1.4.1"
 
-SRCREV = "9bc3b5b785723cfff459b0c01b39d87d4bed975c"
+SRCREV = "e295c9a3b67752734995dfc057bfbf5313ed0d82"
 
 SRC_URI = "git://github.com/thkukuk/${BPN} \
            file://0001-Use-cross-compiled-rpcgen.patch \
@@ -25,10 +25,14 @@ SRC_URI = "git://github.com/thkukuk/${BPN} \
 
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit autotools gettext
 
 EXTRA_OEMAKE_class-native = " -C rpcgen"
 
+do_configure_prepend() {
+	touch ${S}/ABOUT-NLS
+}
+
 do_install_append() {
 	# They come from quota recipe
 	rm -rf ${D}${includedir}/rpcsvc/rquota.[hx]
-- 
2.26.1

