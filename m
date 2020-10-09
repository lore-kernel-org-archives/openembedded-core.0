Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.14925.1602253159294504648
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 07:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=x3hpeJ2D;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id e10so7016261pfj.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 07:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=mT5QBoWkatynULQsGPeyQ65S/kVgR2IxcR5qIDL2Ms4=;
        b=x3hpeJ2DYx2JJTLh35oxPC6hC5TtqZ5N7ZUoZMn2E/whNI2i8dmem/xTMVGiEUTdZj
         WMUXFACmTCST9CeUvWetEjDWox2E/MWY8spZQxExRL/HG6mDEDZNKjVUJBt+OeoScDTP
         oO9Hi/rre09JcbQVqm3FsqXBA10pOwny7qH0iQNYK90EDL/5cOZa9oICJNvIBXxiHytU
         Qn2JstrJ7m9dqhMZyZjtDwaPjLE1G85fWvbjG+dQOYWG6jbLHH8iY37LM8vzdLMytUnL
         KoG6atomvjzz7O2kZJPCaa/7+D84h8/vk6O4l49JnB6GQ+8kTOQGqDy55pp/0KQ1bNOB
         hHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=mT5QBoWkatynULQsGPeyQ65S/kVgR2IxcR5qIDL2Ms4=;
        b=TYCfqWRiOrfZwtQcSX6RoQTm+Dal4umt5RLwCqYjtm/aIa98eGy5E7ALpejwfjoZEq
         RAfZNfkVAIo6+MiqPOyc3KS+njudPiQuMAlO1aGWzTat6YW08ZyH/dO9AkOs22InnviU
         VkugNaEE8sZCmlN/4xL+otywKppFmLDRVa8PpnlmmYyUSqyMdpIjNDngRoZRl8CbC8dV
         f2abH36B5M7PlqpCbG+oiQfUb69lWobrVfC9W9hQy6i4HbZ2WVPRMZ2f8MjewzsEO7B/
         ccZYXZgYgLKmk6EzvIyoucDWa29o2C2onJgctN7/6A3y6F0Hul7vycPDpB2OcNlTdvhs
         tnZw==
X-Gm-Message-State: AOAM531utafRgTvP/MzTm9oZ2ENbTTWvJuTHr2w3WjA+Vn90FzbxwLrV
	wbbwc6FQzrBdbSc/FUdI1UedZacq5d4WaVt5
X-Google-Smtp-Source: ABdhPJzGZx9aKGv8/K/M8rW9XUvqQl2lc0nEbl5XKMWFKfwPapyJNjh6ZAgoxAFUp8g84ROAT+1QaA==
X-Received: by 2002:aa7:86ce:0:b029:152:1702:d791 with SMTP id h14-20020aa786ce0000b02901521702d791mr12356194pfo.13.1602253158395;
        Fri, 09 Oct 2020 07:19:18 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n127sm10736116pfn.155.2020.10.09.07.19.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 07:19:17 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/14] stress-ng: Upgrade 0.11.01 -> 0.11.17
Date: Fri,  9 Oct 2020 04:18:40 -1000
Message-Id: <f99dc4e49d4ad4383c826dd8f8410c32f408e9bd.1602253014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1602253014.git.steve@sakoman.com>
References: <cover.1602253014.git.steve@sakoman.com>

From: Marek Vasut <marex@denx.de>

Upgrade to the latest upstream version. This fixes at least one build
error, in which build fails due to undefined FS_IOC_GETFLAGS. See commit
d7b4301d ("stress-efivar: only exercise FS_IOC_*FLAGS if they are defined")
in stress-ng for details.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...Do-not-preserve-ownership-when-installing-example-jo.patch | 2 +-
 .../stress-ng/{stress-ng_0.11.01.bb => stress-ng_0.11.17.bb}  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.11.01.bb => stress-ng_0.11.17.bb} (83%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng/0001-Do-not-preserve-ownership-when-installing-example-jo.patch b/meta/recipes-extended/stress-ng/stress-ng/0001-Do-not-preserve-ownership-when-installing-example-jo.patch
index c860c717ac..f1911b1d88 100644
--- a/meta/recipes-extended/stress-ng/stress-ng/0001-Do-not-preserve-ownership-when-installing-example-jo.patch
+++ b/meta/recipes-extended/stress-ng/stress-ng/0001-Do-not-preserve-ownership-when-installing-example-jo.patch
@@ -13,7 +13,7 @@ diff --git a/Makefile b/Makefile
 index f36e57e..20488af 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -452,6 +452,6 @@ install: stress-ng stress-ng.1.gz
+@@ -461,6 +461,6 @@ install: stress-ng stress-ng.1.gz
  	mkdir -p ${DESTDIR}${MANDIR}
  	cp stress-ng.1.gz ${DESTDIR}${MANDIR}
  	mkdir -p ${DESTDIR}${JOBDIR}
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.11.01.bb b/meta/recipes-extended/stress-ng/stress-ng_0.11.17.bb
similarity index 83%
rename from meta/recipes-extended/stress-ng/stress-ng_0.11.01.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.11.17.bb
index 3486be1b03..9b987c7bde 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.11.01.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.11.17.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            "
-SRC_URI[md5sum] = "a558fc7fb9d0a851afe6de09080b5401"
-SRC_URI[sha256sum] = "9fe19548c87aa1a1b9b2be3b359ec2621b88bcb16998b77527549a7736f65494"
+SRC_URI[md5sum] = "7b89157c838f2bb4bdeba8f46e3c56ae"
+SRC_URI[sha256sum] = "860291dd3a18b985b3483190a627bbede2b5c52113766c1921001b3fb4b83af0"
 
 DEPENDS = "coreutils-native"
 
-- 
2.17.1

