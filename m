Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED28C6FA8A
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:21:15 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.8209.1662560440200858360
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:21:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=xdVhzTFN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id x1so10357209plv.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=AQ3DD2Ofit3I9SDGWFgFBSHC43QIPorJ2pRoLkVnNbw=;
        b=xdVhzTFN2V6rpWKE7jHh/czhXOgQYnJbLlBgr85EcgCjA/OmdzStov1LhBeFYBmfiT
         209KaCzB2Y0x18p8fEYEctNB7rejyK340m9difMmpY90iYmDqW2MJNvtE/rPyE2+Wa7D
         roYeWUQltmFd+TX40D+nK3bOFscWLw1Zpxh709a1qCHnpx3xxREzx/oD1Ytg3lzcptib
         Xovk+41LHpd/v4FPi9NosZ9oq+ap4+L8HyLew3/hjoKXv2XLXdTqogOMgYEwSgNjT7n1
         tprdPL8noxCb1Lp7Yq34OhhgUTfkz8qIyETwoe7PG8XsHSt0EBM7u44tgqOIGgmuVLz0
         QhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=AQ3DD2Ofit3I9SDGWFgFBSHC43QIPorJ2pRoLkVnNbw=;
        b=2H6mKxakI3/6pgIz6aTtBvZfxrE+zvkoyJvV6VALA4kZY1lPYorW83M0HTEg4B3vXA
         K/IaNg01M8z+c1qBAtUefTAvj7gA1oDts9Ug/j0BuKmX2ppr/yE8XGVs7mGI+3cScOet
         UsxFyyreKkq0VENgss46j5d4HjmnjSoCylsrmhC8w7qBUJX1hluDYTQ3MBy+JDa5bT91
         1RJWm3c3ura0tZKz9ZLLJxJTpF/mF6j3KLJTYfjBvf7llm4JhESDpSW0BSftIt1K0W8M
         uFSzpArxcFW+mpNphelilbDPoevPaHMyYe2ATEXRJpTny0u3hsdo9UhGBpzi698z6AJ4
         I84g==
X-Gm-Message-State: ACgBeo3+2Gc6MEdR94O6aK5eD39BCddMgt3yIRzfXEJ5vW7FVAj34Prc
	KKr9zwNOMIrkHdkgDM9FmsCZKlPaEBGdwtxk
X-Google-Smtp-Source: 
 AA6agR7OczoOGBpw2ueVzQ1zuShasdhNc+tB6E0QctKfxZpeMm3gAp1Dmv7wASYVHEzgFUoojQURMg==
X-Received: by 2002:a17:903:2104:b0:176:a9ef:418b with SMTP id
 o4-20020a170903210400b00176a9ef418bmr4146915ple.134.1662560466202;
        Wed, 07 Sep 2022 07:21:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x13-20020a17090a1f8d00b001f510175984sm14776198pja.41.2022.09.07.07.21.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 07:21:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/24] maintainers: update opkg maintainer
Date: Wed,  7 Sep 2022 04:20:14 -1000
Message-Id: 
 <371e574acaab78b44ac171de92b668157df787de.1662559557.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662559557.git.steve@sakoman.com>
References: <cover.1662559557.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 14:21:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170408

From: Alex Stewart <alex.stewart@ni.com>

Alex Stewart assumed maintainership of the yocto project's opkg fork,
and opkg recipes, from Alejandro Del Castilo back in Q1 of 2020.

Update maintainership of the opkg recipes.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit fd0511080fb5744b4b58df43184fa2561cc37134)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 0a1897fc92..4778b1e5e6 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -544,10 +544,10 @@ RECIPE_MAINTAINER:pn-ofono = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-opensbi = "Alistair Francis <alistair.francis@wdc.com>"
 RECIPE_MAINTAINER:pn-openssh = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-openssl = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER:pn-opkg = "Alejandro del Castillo <alejandro.delcastillo@ni.com>"
-RECIPE_MAINTAINER:pn-opkg-arch-config = "Alejandro del Castillo <alejandro.delcastillo@ni.com>"
-RECIPE_MAINTAINER:pn-opkg-keyrings = "Alejandro del Castillo <alejandro.delcastillo@ni.com>"
-RECIPE_MAINTAINER:pn-opkg-utils = "Alejandro del Castillo <alejandro.delcastillo@ni.com>"
+RECIPE_MAINTAINER:pn-opkg = "Alex Stewart <alex.stewart@ni.com>"
+RECIPE_MAINTAINER:pn-opkg-arch-config = "Alex Stewart <alex.stewart@ni.com>"
+RECIPE_MAINTAINER:pn-opkg-keyrings = "Alex Stewart <alex.stewart@ni.com>"
+RECIPE_MAINTAINER:pn-opkg-utils = "Alex Stewart <alex.stewart@ni.com>"
 RECIPE_MAINTAINER:pn-orc = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-os-release = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-ovmf = "Ricardo Neri <ricardo.neri-calderon@linux.intel.com>"
-- 
2.25.1


