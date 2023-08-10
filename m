Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F1DFC04A6A
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:05:07 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web10.21366.1691683498046369121
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=oMjvAZfN;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.182, mailfrom: steve@sakoman.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3493862cfb1so3905925ab.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683497; x=1692288297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GY1d8h6hap3j4VEO4wo14C/R0ujJbR3sBPuHTorx6lI=;
        b=oMjvAZfNJuMrie2Sef/B7keP7/ny+NY5FaEZ0qcZhYmHsC4/0PMYih0VKVhXgV2jmN
         j1u+qNOo2j0U8w9ZudC3rlVc+zzciTWirFHGDxmiMffRHue36J7F+9i3bo5ApYrb/eyL
         eLgf/7yRJ3u5QD5XXxLMKjBHVOtmrv4GT1IPHKN+kXrKZkaiorM4maXNg/phvkCO0+0U
         Da7ynvT/j/j8j5plUWc6spxZdvOKQi5TwXrjCVPdu46M8a7fxTVtw96HYLLToVkGQwjz
         DSU3jSMjwmZhZY3isFE/eKDbuSA9va63C/QwK3G2PN1G6fVcfatUtvAfYUWNa6pJjYlb
         zByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683497; x=1692288297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GY1d8h6hap3j4VEO4wo14C/R0ujJbR3sBPuHTorx6lI=;
        b=BdT0yJEEOO0cnaoV2/p6MxOjb+zKeTl4K/WKS8k6IKUi8LRdAPlM/+DzZ0YqvBZq5H
         9gC7O9NF19bJEZHBCpXQVY71pjuve5t1JKeIjHa8CnAqMYXdGHery3eaaMK8QFmvDJwd
         q1GkbNsYofHdnBpsGebMIBDw9ISLInFbfYlmL9NGPfhO3yxyBtplGtv4ejK3wWC/esux
         ZmjmD4PkIYMrhio4tjdx4s9G5kD+s2B49tUrZQEUZcBBGCdNoHAkMteVGVXm0Yi64H9v
         9dyWxhqROEWSHyEB9rmIPPGxGC6Sf0Rf7J87SD9bjMlnfpoiZLAmIFgZg/X2vG0yaiZ5
         4z6Q==
X-Gm-Message-State: AOJu0YzwntFHzvWeFBS2wEBYRjvqKOWsDIGgEgSu3Q5C4f4bnZLtxUKp
	XWVeGPLzZEKoHXvO00paAHhzdU27x1fwlwefXVQ=
X-Google-Smtp-Source: AGHT+IEm5Ys+rnMB8qVaUCqb7slqr2xo2xRDR0Xs8Zh1m+6fG+l07XtYlaAsuWhbK/OzNMZTEfsX3A==
X-Received: by 2002:a05:6e02:1d04:b0:348:cfad:1608 with SMTP id i4-20020a056e021d0400b00348cfad1608mr3882743ila.5.1691683496884;
        Thu, 10 Aug 2023 09:04:56 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.04.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:04:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 06/37] linux-firmware: upgrade 20230515 -> 20230625
Date: Thu, 10 Aug 2023 06:04:05 -1000
Message-Id: <8c94b91216b343dfae290c6fe977bacacb78eeae.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:05:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185768

From: Trevor Gamblin <tgamblin@baylibre.com>

WHENCE checksum changed because of updated version lists and removal of
information for the RTL8188EU driver.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 986f8ca9d4c2c22d368f69e65b2ab76d661edca0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20230515.bb => linux-firmware_20230625.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230515.bb => linux-firmware_20230625.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
index 3470131294..329a3e3c9a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
@@ -134,7 +134,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "a0997fc7a9af4e46d96529d6ef13b58a"
+WHENCE_CHKSUM  = "57bf874056926f12aec2405d3fc390d9"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -212,7 +212,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "8b1acfa16f1ee94732a6acb50d9d6c835cf53af11068bd89ed207bbe04a1e951"
+SRC_URI[sha256sum] = "87597111c0d4b71b31e53cb85a92c386921b84c825a402db8c82e0e86015500d"
 
 inherit allarch
 
-- 
2.34.1


