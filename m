Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 310EAC43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:40:19 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.7235.1654699210293939756
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=XWPKHTUT;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id s14so17805079plk.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Cco7bqsgvJecsFAIn1jhUXrBj5w5uVcot39rX6crB1A=;
        b=XWPKHTUTEoNShzY4Rde6rTyeuS5EB54yLlfQ8AhJ1gx/9e0vWit6zKWsKpgPi1dPl+
         q00iuge0/hyxdCpIZjapWToIEjINeDKFKyVOdtcvc46m7W8E5QZjLvLZDx/AK6Ibcs2F
         uYLrL+oHKTgl9vJjM98YFjtzT+UnDY3z73qsH9lvZUy4d+s0jZAuSWu8AFVv2aBGmI1m
         ZbynrDiC5JR88NNjJCXDiP3n2I3alg1ifeMgC+OMlUrHJLyAyhRXSUvNYwaiVF3SN1A8
         ka82XSRaPZm/qcRWAniGevky9X2lWs2Z0HI/YDAK+wzrqoZg2m/PcTqzuPog50hAY5be
         jb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cco7bqsgvJecsFAIn1jhUXrBj5w5uVcot39rX6crB1A=;
        b=4c2aQirNTs5AqD01V4ONpTBTfLW4d6hcbALvwKTTVZO3akm69QGULTio1DNIfwmWm1
         4soPjrF7Lr6Pq1n/U4lEt7YS07TzbNSxNZJ2iUfpj8ehz7BesR+zja5bGg08Zj/5FyDs
         xRCPX7D9LH1MqxFcOV6b0ZySUQ3ChXJ4nF6by8o3ok88tgQDXH/GGRob3GPSpK5FVe8K
         o4p2bvvkncOQP+xbEnc6SBKlugo5scYnbppw3rQHCnkBZWF1H3uHGEymkvD7WNVYGhW1
         u0k2WA2AKiDWIXM2zzENbFJv1+VVAZTO9C15DPBeZZmXGIKjNZewVN2UilGMfZWqpbMQ
         4MdA==
X-Gm-Message-State: AOAM531Eb3eG0cXh5zraJ/ZQPlNV2DJpXx8fUFmE563NrvUlUfRZB443
	JlkhYGIcN0TMUZcSDAIHbstJSaBxmusi9+oc
X-Google-Smtp-Source: 
 ABdhPJyr0f2WTfkwxcZQL0gt+2Lr4DA34Tmo/BMWt1x0+WwRAzq19RyICDRo2Pe3wFSN7Gd0Ra2gGw==
X-Received: by 2002:a17:902:ecca:b0:166:3e34:4d01 with SMTP id
 a10-20020a170902ecca00b001663e344d01mr33349767plh.97.1654699209250;
        Wed, 08 Jun 2022 07:40:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i4-20020aa787c4000000b0051bc581b62asm12945213pfo.121.2022.06.08.07.40.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:40:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/22] logrotate: upgrade 3.19.0 -> 3.20.1
Date: Wed,  8 Jun 2022 04:39:19 -1000
Message-Id: 
 <190457be2ee24a99da3a6383233ccc4b76dd2b0c.1654698895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654698895.git.steve@sakoman.com>
References: <cover.1654698895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:40:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166717

From: wangmy <wangmy@fujitsu.com>

Changelog:
=========
drop world-readable permission on state file even when ACLs are enabled (#446)
fix potential DoS from unprivileged users via the state file (CVE-2022-1348)
fix a misleading debug message with copytruncate and rotate 0 (#443)
add support for unsigned time_t (#438)
do not lock state file /dev/null (#433)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 391fdcf742c4669c1c4654f9b022b3d277aa0038)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../logrotate/{logrotate_3.19.0.bb => logrotate_3.20.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/logrotate/{logrotate_3.19.0.bb => logrotate_3.20.1.bb} (97%)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.19.0.bb b/meta/recipes-extended/logrotate/logrotate_3.20.1.bb
similarity index 97%
rename from meta/recipes-extended/logrotate/logrotate_3.19.0.bb
rename to meta/recipes-extended/logrotate/logrotate_3.20.1.bb
index 2a60d9b31f..35977535aa 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.19.0.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.20.1.bb
@@ -15,7 +15,7 @@ UPSTREAM_CHECK_REGEX = "logrotate-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
 
-SRC_URI[sha256sum] = "ddd5274d684c5c99ca724e8069329f343ebe376e07493d537d9effdc501214ba"
+SRC_URI[sha256sum] = "742f6d6e18eceffa49a4bacd933686d3e42931cfccfb694d7f6369b704e5d094"
 
 # These CVEs are debian, gentoo or SUSE specific on the way logrotate was installed/used
 CVE_CHECK_IGNORE += "CVE-2011-1548 CVE-2011-1549 CVE-2011-1550"
-- 
2.25.1


