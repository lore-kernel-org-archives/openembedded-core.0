Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC1CDCCA473
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:37:05 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.64007.1656877017462163598
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=lZBTUHAN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id m2so6849953plx.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tGTkJy+x/v9GfSDctTvInARDNXtdFutip6/TE+H+Lkg=;
        b=lZBTUHANPjdP/ZwtnK3jvJNV7IWdDSATwmdH7BNJpa9e85BSY8+lOQAlAHXJEB6cKd
         PjMslnWBjQ/JVI5eZQJ4znQEYfF1LnJ1wUukJut/EzANRpAFtOC5htxtQFuVA5Af7W5U
         RTARAw59SJwcT3cH9BotwlRiTXngZkcHNflc2XUSRw+xalAuoN1j2kvYBHyHZ+1+t6Mh
         71eVhjb2KT/5+OsTD818L4tPPVyY8lp2ar3eCJ6rjZJrA1GeodIfD3E4KD1CWn12yJ+9
         p7wJhflbJqbM1KJfWW1h6e+XpG2YgXbxDvvEyQlFurccUgU9wjCsJlcZHzCRjFfq3F1d
         wamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tGTkJy+x/v9GfSDctTvInARDNXtdFutip6/TE+H+Lkg=;
        b=hh5JVhTICmuaMcBppZ3UzL7bIPO0g2cuep+1HE1l11PQVbDuZ1yuvU8+EH+H5qOqwr
         xZ01W5JcxG998Daj9iS52vjqJXdnTTQZOIBjQqcfbBf02FNnxkeUWYawq46dlfkp1c8F
         mzhRgis3fmRDJZbRNvFg67QxlsN4VZl7D25uYJm9wh6pyCMcL/aNNHz7MDjb0OGzOxVG
         LOcyMCAdqcwE9qu4/zjU25yGctnHorvfDl1KMrwCSq8b8Bo/FPtI3uk6HOCv18+FZuc8
         ou9IG86Y82zkUUR2ANSLU7iBSRrPzxXxvgp5bPqSB+kmWqfMzxA7kegf6Q8Nf9pXRJwQ
         WEvA==
X-Gm-Message-State: AJIora/2+kOnLByygm+8qfYGbNtRlmz3Nv0XZQqZNX+JZoRpYQX6l/LX
	SEBEwMQQiWBu0Q7oNqUGNpjtLCPsU4vUNsvl
X-Google-Smtp-Source: 
 AGRyM1vFfLuTtMPwRZsMClJ7ETNxg0Mzcj6gqfRi1S/GyrbU6Sv74V8fqxGDOy4ypst2eVB1Q0+ZCw==
X-Received: by 2002:a17:902:f710:b0:167:7a06:b2ce with SMTP id
 h16-20020a170902f71000b001677a06b2cemr32707100plo.104.1656877016373;
        Sun, 03 Jul 2022 12:36:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.36.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:36:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/30] vim: 8.2.5083 -> 9.0.0005
Date: Sun,  3 Jul 2022 09:35:44 -1000
Message-Id: 
 <a290032fe88b6bac5e789da20f88fd72febe1780.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:37:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167569

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The license checksum changed due to a major version change in the referenced file.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 89f34d8aa4f4572d048dbb732ca4c83d443157fb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../vim/{vim-tiny_8.2.bb => vim-tiny_9.0.bb}                | 0
 meta/recipes-support/vim/vim.inc                            | 6 +++---
 meta/recipes-support/vim/{vim_8.2.bb => vim_9.0.bb}         | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/vim/{vim-tiny_8.2.bb => vim-tiny_9.0.bb} (100%)
 rename meta/recipes-support/vim/{vim_8.2.bb => vim_9.0.bb} (100%)

diff --git a/meta/recipes-support/vim/vim-tiny_8.2.bb b/meta/recipes-support/vim/vim-tiny_9.0.bb
similarity index 100%
rename from meta/recipes-support/vim/vim-tiny_8.2.bb
rename to meta/recipes-support/vim/vim-tiny_9.0.bb
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 06707dbe11..b85f34d6c8 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -11,7 +11,7 @@ RSUGGESTS:${PN} = "diffutils"
 
 LICENSE = "Vim"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6b30ea4fa660c483b619924bc709ef99 \
-                    file://runtime/doc/uganda.txt;md5=daf48235bb824c77fe8ae88d5f575f74"
+                    file://runtime/doc/uganda.txt;md5=001ef779f422a0e9106d428c84495b4d"
 
 SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
@@ -21,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".5083"
-SRCREV = "db77c49401145d76441fbb3d22a1d7d987681c13"
+PV .= ".0005"
+SRCREV = "040674129f3382822eeb7b590380efa5228124a8"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
diff --git a/meta/recipes-support/vim/vim_8.2.bb b/meta/recipes-support/vim/vim_9.0.bb
similarity index 100%
rename from meta/recipes-support/vim/vim_8.2.bb
rename to meta/recipes-support/vim/vim_9.0.bb
-- 
2.25.1


