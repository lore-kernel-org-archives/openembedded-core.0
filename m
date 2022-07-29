Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87987C00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:47:38 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.56.1659106053147928905
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=mPLqxBxv;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id b22so4794315plz.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=P2u/U7/WDfy3P/1di3fm8jSLKk60txj9NDx5791YT1A=;
        b=mPLqxBxvBOGu7E99Ys9uUnajYWTncDidKIxvwy/CqVgdLeoAfbaXIxNThlBaFTzXoe
         QQL5XQT2lgwVyJnWlows4WCBvCE+p8GrSr6nWf3DAyDqRhpuB3pjXDOgx2BmaBzeLoM3
         nP+OvsKkMb8ZNtU+DpcHslVaDDgEjMIuCLwXhgkf/SDqk1Di8OgHqVM523IMcENb9dMK
         bYEhZM2HYqkAC/MJVkVQywEZl5qrXGnIjYGb23z6rsRrrV7L137f8y3/ENBhojhjrRef
         r0vSL2OfGxmM8yz0WdTCEh3jTCCCzSbrVTzPmvmsB8Kwt6PElv6o3IA2AztU844vAZJj
         mY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P2u/U7/WDfy3P/1di3fm8jSLKk60txj9NDx5791YT1A=;
        b=cIYdHHEoinf4hXwyR7Ct6HO/0r9oSu03SPgJngpYtM7SZkDiv79Izeeac7VQNVSJMO
         WFuvJdQbE6cxyM4V04ArnYZNiabSZisu37Z7QlxbNiUGl6/B1lUBlZMpMrq250P8Dvbz
         ppJ0JMQWEff5pMJ8cvEKZKiHKOwKJ5WVu9cPQKIJ4pCmywPD74TEPGLSDYqBHYYbd5Fw
         /YwMPG7LnOj/VrkawrK+20+CDiLpuBvwjWzCqpMnb1aQUf+71cd4FXzO+QNdFcdQdsGG
         AGZR8BlCAFGnc7sLH2SMFqxaGnKOzAvudmxAr76gWmA2LSleIRQiejH65hNU9DPj8dzo
         fi3A==
X-Gm-Message-State: ACgBeo1bW0Mxtz4GN1+AfIz4m4E/IU9nXfh1UuianQgYlQvuGPbGJYuz
	113EaZfCob+wG5whxU0OuNlGfVay0YZ6QZOz
X-Google-Smtp-Source: 
 AA6agR5KHe9wjR/SWBDFEiLSaLfrQGTiVoNGkxWEmUP7wfIXJ4QrOLUBGxcRlOagaPXVlcHG/KRWLQ==
X-Received: by 2002:a17:90b:3b48:b0:1f3:2401:d0e3 with SMTP id
 ot8-20020a17090b3b4800b001f32401d0e3mr4468678pjb.61.1659106052118;
        Fri, 29 Jul 2022 07:47:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00528c6c7bf37sm2958782pfo.129.2022.07.29.07.47.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:47:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/29] xdpyinfo: upgrade 1.3.2 -> 1.3.3
Date: Fri, 29 Jul 2022 04:46:20 -1000
Message-Id: 
 <cde61983f3cdae55c78466d6e9975a19bff04ccf.1659105705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:47:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168639

From: wangmy <wangmy@fujitsu.com>

Changes:

      xdpyinfo: Fix printing the X.Org release version for xserver >= 21
      Update README for gitlab migration
      Update configure.ac bug URL for gitlab migration
      Only check for XFree86 if vendor string doesn't match X.Org
      Add explicit casts to clear implicit conversion warnings
      Disable DMX support by default, leave --with-dmx to enable it
      gitlab CI: add a basic build test
      Build xz tarballs instead of bzip2
      Fix spelling/wording issues
      gitlab CI: stop requiring Signed-off-by in commits
      autogen.sh: use quoted string variables
      autogen: add default patch prefix
      autogen.sh: use exec instead of waiting for configure to finish
      fix -Wunused-[...] compiler warnings

temporarily override SRC_URI which is hard-coded in xorg-app-common.inc
since new versions of packages use a new compression format - .tar.xz

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 712552b5cc427d7be1258c45886de9b57f7272c9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-app/{xdpyinfo_1.3.2.bb => xdpyinfo_1.3.3.bb}        | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xdpyinfo_1.3.2.bb => xdpyinfo_1.3.3.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.2.bb b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-app/xdpyinfo_1.3.2.bb
rename to meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb
index 2d10b7acca..fa0fe36451 100644
--- a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.2.bb
+++ b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb
@@ -8,13 +8,14 @@ predefined values for various parameters used in communicating between \
 clients and the server, and the different types of screens and visuals \
 that are available."
 
+SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.xz"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=f3d09e6b9e203a1af489e16c708f4fb3"
 DEPENDS += "libxtst libxext libxxf86vm libxi libxrender libxinerama libdmx libxau libxcomposite"
 PE = "1"
 
 SRC_URI += "file://disable-xkb.patch"
 
-SRC_URI[md5sum] = "8809037bd48599af55dad81c508b6b39"
-SRC_URI[sha256sum] = "30238ed915619e06ceb41721e5f747d67320555cc38d459e954839c189ccaf51"
+SRC_URI[sha256sum] = "356d5fd62f3e98ee36d6becf1b32d4ab6112d618339fb4b592ccffbd9e0fc206"
 
 EXTRA_OECONF = "--disable-xkb"
-- 
2.25.1


