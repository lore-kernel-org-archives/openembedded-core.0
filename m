Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16BCEB64DC
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:13:47 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.17595.1687961623319470752
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=oFmoiwBx;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1b80512a7f2so23478745ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687961622; x=1690553622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5pd3WxTbbwA/aTmXe13W5rHy8i+ZIOPFC6G6HJ5x+/Q=;
        b=oFmoiwBxu3anSkbLyaFeFW5XwzDw5HdT8iol7c1SEqEc8sKU9oO923qsHbb7bvED09
         wooQ3cFmd9vs6jR94ajWjpw/OIN9ghsCrw2s4NQjgaL1JwWCV9Lm3zSJuA37clyNxLYA
         E/+scqMYhyx4Jrty+T6ZAqQoZYqFLo+Z/Swuu6r8RlxGY8E3xx0phz8rWLf59QijKhgJ
         Gr8tBLiD+M1+vPxoZzg6GD4Kgb6TsPA3wmdW37V1rfiuHwBJD47vQF4u54zEP+1YswmS
         noz2+jDHG36ywviyi8uR19muH3J6tBdMqO2EycQ1270Y66rbNB2PhLJCti2XoLj/MqPv
         ilJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687961622; x=1690553622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pd3WxTbbwA/aTmXe13W5rHy8i+ZIOPFC6G6HJ5x+/Q=;
        b=AwLfMiABUlbOeU9Q7tNbHVwUiZXPjzkNHCBtO9chd+2z58TttOWWyBEJjP6sKcYJhJ
         BzHz1MlqJl54qqCNyxsk97SHsLaPeH+v0pdsDUxfxROKyogBRyfSQDKxxlD2j48lZz5v
         4cX0qtjXpWJ6iOCxyM+mSVVGQ/72jUSb9SWr2Q5LHhAom/4o4jj5OT9QdQE5YDhWyIJg
         ZXY2iuebbtXZAT1UOJkQsEp897JbkzGKuC0i6+yk+2nwg2yXwgCjG1jA1tj2HnmKmoPv
         NPPpxz14LLnxrgStY/bJ+OC4Y7FOvVsGApvq36DsauosxbYk5Wexx9q3mbPC+T+U48Ld
         TjuA==
X-Gm-Message-State: AC+VfDyKfk1hEINSyDO6ghyJJ6/ZiBxCJyD/GYSkdfyL8tGp2kdt3UTQ
	oQ1HiJqvtuvDYcfdKchr7Pcjilf7MZzbQGaEqDx8qA==
X-Google-Smtp-Source: ACHHUZ7S2KSrWLh8GTTXU731RMSbRIJmC4X5qh43XBGCjd4IORpGDAolsw99lFBEoATdcia4P/83bg==
X-Received: by 2002:a17:902:ecce:b0:1b5:561a:5ca9 with SMTP id a14-20020a170902ecce00b001b5561a5ca9mr11882302plh.50.1687961622455;
        Wed, 28 Jun 2023 07:13:42 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d89300b001b3ce619e2esm7792092plz.179.2023.06.28.07.13.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:13:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/29] maintainers.inc: correct unassigned entries
Date: Wed, 28 Jun 2023 04:12:49 -1000
Message-Id: <36b862f23afe3ed81006c203e875f900249fd040.1687961326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687961326.git.steve@sakoman.com>
References: <cover.1687961326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183579

From: Alexander Kanavin <alex.kanavin@gmail.com>

Modify packages to unassigned where appropriate

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ab37ddf53607111bf5c49c4f2388224999c4a5a9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 27f15bc3166fda5acd07e9e1c34842a641d24e37)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 36f1fc6073..50746e2d7d 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -42,7 +42,7 @@ RECIPE_MAINTAINER:pn-alsa-utils-scripts = "Michael Opdenacker <michael.opdenacke
 RECIPE_MAINTAINER:pn-apmd = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-apr = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-apr-util = "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER:pn-apt = "Aníbal Limón <limon.anibal@gmail.com>"
+RECIPE_MAINTAINER:pn-apt = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-argp-standalone = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-asciidoc = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-aspell = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -62,7 +62,7 @@ RECIPE_MAINTAINER:pn-base-passwd = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-bash = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-bash-completion = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-bc = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER:pn-bind = "Armin Kuster <akuster808@gmail.com>"
+RECIPE_MAINTAINER:pn-bind = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-binutils = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-binutils-cross-${TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
@@ -152,7 +152,7 @@ RECIPE_MAINTAINER:pn-docbook-xml-dtd4 = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-docbook-xsl-stylesheets = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-dos2unix = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-dosfstools = "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER:pn-dpkg = "Aníbal Limón <limon.anibal@gmail.com>"
+RECIPE_MAINTAINER:pn-dpkg = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-dropbear = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-dtc = "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-dwarfsrcfiles = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -402,7 +402,7 @@ RECIPE_MAINTAINER:pn-liburcu = "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-liburi-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libusb1 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libubootenv = "Stefano Babic <sbabic@denx.de>"
-RECIPE_MAINTAINER:pn-libuv = "Armin Kuster <akuster@mvista.com>"
+RECIPE_MAINTAINER:pn-libuv = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libva = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libva-initial = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libva-utils = "Anuj Mittal <anuj.mittal@intel.com>"
-- 
2.34.1


