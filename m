Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.8221.1591711895820777230
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 07:11:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SK9tyUKx;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id q19so2536331lji.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2020 07:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Iu+efCeP8//NWBPpwSQGo9nH/RoAS0Ryk1meqY5XkBE=;
        b=SK9tyUKx99XoH9Tdk0mCpaiXAI5tfXRY7ewjlel08Apt0YBPcz6IqHosoh3rVyiVpx
         o7Swgw8by7BOQip3oGndK4aJZMB1sqjWHcvHTtLzLcO5qcofdxPEOW2Z/dkMW+b7jHu2
         w19oYZp2MrcC0Is78c77zMqad6P9kATO+qJrKT9o8+sx36bhX9EqzazOMUZAbJyJLzVu
         NEvqz5+ZDhsR8F3vD9y+FRHeMqSM4leFBKlLQjq9ymWW7ZJTNra6MOh7PWtcUoZoIkNM
         gCLZzrVemDyH1UhGBkMBuhfWNbKBV+aC03quAwHythAa3RINRjUCqoeLh7nabzN/rUEJ
         vpyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Iu+efCeP8//NWBPpwSQGo9nH/RoAS0Ryk1meqY5XkBE=;
        b=EoQjwCtW/+9S5QIzzK+QqjQFXigXC1oDitIhQJrWY8lLTTdp4QiU0AwTzd4fZJMVN5
         f5xeGlmHHE+xMawyDfCVSjuS5WRJ8huaA7jjrobMS8KuxIOX3FIL34dmeQPPv5ZJN7oY
         IdC/R+PDMypmo4/vsIa5WymzqkVKIXinNX2yC5K0oRDjJVc7CnVUOC1rmvoXmhgjilzw
         39aSjo1domPe9+GPNRad2YHu2znDuvZ8UGEw1FTSUTb5h6J10c2A6ZtlEJsPAQopWjco
         gIaTV23tZUcZcsV5UmbEXzYXzRYqpKpyjrObd2B5myNE+XK2W0dvTvrUTbGCGRyH+Ri3
         eMKQ==
X-Gm-Message-State: AOAM532IEkxZaQ09U9YPD3K08jfV7wWz3oIz8pkdCqEeA658V4I3Oko4
	jLXtj53GcndmnMJCPdkN3A7g4BiD
X-Google-Smtp-Source: ABdhPJxFZm7kWlDKErUvpSbL7Turwn0xGHTHNp7yGBIJ8DPW44wKFwe7CEvxneHhGNjarMbQpAI7Sg==
X-Received: by 2002:a2e:9192:: with SMTP id f18mr14892521ljg.383.1591711893509;
        Tue, 09 Jun 2020 07:11:33 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id m6sm4369947ljg.3.2020.06.09.07.11.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 07:11:32 -0700 (PDT)
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][PATCH 2/2] Don't inherit 'features_check' in recipes that don't utilize it
Date: Tue,  9 Jun 2020 16:11:14 +0200
Message-Id: <20200609141114.1751767-2-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200609141114.1751767-1-jacob.kroon@gmail.com>
References: <20200609141114.1751767-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/recipes-bsp/usbutils/usbutils_012.bb     | 2 +-
 meta/recipes-core/libxml/libxml2_2.9.10.bb    | 2 +-
 meta/recipes-devtools/mtools/mtools_4.0.24.bb | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/usbutils/usbutils_012.bb b/meta/recipes-bsp/usbutils/usbutils_012.bb
index b670fa4ab6..28031e72a7 100644
--- a/meta/recipes-bsp/usbutils/usbutils_012.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_012.bb
@@ -15,7 +15,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
 SRC_URI[md5sum] = "7484445cbcf04b3eacac892fe58f8d9f"
 SRC_URI[sha256sum] = "ae2e10aad530d95839b6f4d46cd41715eae6f0f1789310d793e9be21b3e7ae20"
 
-inherit autotools pkgconfig features_check update-alternatives
+inherit autotools pkgconfig update-alternatives
 
 ALTERNATIVE_${PN} = "lsusb"
 ALTERNATIVE_PRIORITY = "100"
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index 097aceb2c0..d11b083e8b 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -37,7 +37,7 @@ PACKAGECONFIG ??= "python \
 PACKAGECONFIG[python] = "--with-python=${PYTHON},--without-python,python3"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
-inherit autotools pkgconfig binconfig-disabled ptest features_check
+inherit autotools pkgconfig binconfig-disabled ptest
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
 
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.24.bb b/meta/recipes-devtools/mtools/mtools_4.0.24.bb
index d7cc72d172..f11cdad37a 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.24.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.24.bb
@@ -35,7 +35,7 @@ SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
 
 SRC_URI_append_class-native = " file://disable-hardcoded-configs.patch"
 
-inherit autotools texinfo features_check
+inherit autotools texinfo
 
 EXTRA_OECONF = "--without-x"
 
