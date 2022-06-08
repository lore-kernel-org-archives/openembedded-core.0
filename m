Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3112CCCA47B
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:40:19 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.7281.1654699215361002971
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=AdRqB701;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id x4so9953269pfj.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=oQuZ/xHLRIiqhJ6LpEHMkvqt+ijwxT/ZbRLUoEaurRI=;
        b=AdRqB701vfYaHgjuSej55Y2wy28IiB2zWXFjsuICHo7boDyqccbweikxoMUDVOtWUl
         ydg0sr2YIsHd05ipl0E7s/bBNw3vQzuJcXGUdIqpgdaCi5ameS62I//AXvQcTqfu3Ka1
         bEC4MBWBCGK0Y3FMtlCqQRTtfR/eJfKGTtdaNE6GJFi2J8bKsYbNSZEGkFThSjIuQuj7
         DTuELPQnAHuPhawEAv7pTV2uAJ+E2IGbEfJ6h4BWH9n2LDO3m87KCXdQGuuVVJmaKs2y
         TOL3J8hlrolg+3+3me54aQWznvItEMVKuIMZm2+JcyPC+SvkgIq+rYZ487vqoqsdNHWX
         qy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oQuZ/xHLRIiqhJ6LpEHMkvqt+ijwxT/ZbRLUoEaurRI=;
        b=N4la8CCMMbEUjG/IxPxgzK4th/BczEgKUg0v6byJij3QvOgrI2VSIKpooPHk4Nqj8P
         skWzihGHhZ0M76CGy7bb5w/Y9OPv5ZmRwVBt0SBeuwZagRHwreK+AbT3Ue0HYWjBLObJ
         8oJ8zX/X/Un12ti6XlgFVHMYa0/P4QXBYejX1seP9l+hyuMzGRIj+7k8Megt6fiQ8fG2
         DX7hlfRkUOkSy6IaOUUjkfGa8KbNhtafkPftyWgjDaP+6vG1YVwtpOdQZI3mMcdkyW2Q
         W95iVbAzUSVJ+2EOR/fSWaS1tSgQbkqi2Ka7AcO8yWNQxgymZnFtjHYoTejManLUmhWg
         rqaw==
X-Gm-Message-State: AOAM53157xx6dpDWxBNRShTtoyri858jRBzNiCRGOWm9E5RcswOakH3r
	AMFXD9OMDDAUS0+Zey9FvssIYA5L4WbTZmr9
X-Google-Smtp-Source: 
 ABdhPJx+/sKdbSz/y/4jXuwkwKRLfpFr5W8FFBeygAbEvrFceq0xWvWe/CH67GWjKvr7waVbwmMPpA==
X-Received: by 2002:a63:ef41:0:b0:3fb:c201:797d with SMTP id
 c1-20020a63ef41000000b003fbc201797dmr31246705pgk.104.1654699214326;
        Wed, 08 Jun 2022 07:40:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i4-20020aa787c4000000b0051bc581b62asm12945213pfo.121.2022.06.08.07.40.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:40:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/22] libxkbcommon: upgrade 1.4.0 -> 1.4.1
Date: Wed,  8 Jun 2022 04:39:21 -1000
Message-Id: 
 <9311e798437c44f64f0256dd894a8173cb8b465d.1654698895.git.steve@sakoman.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/166719

From: Richard Purdie <richard.purdie@linuxfoundation.org>

libxkbcommon 1.4.1 - 2022-05-21
==================

- Fix compose sequence overriding (common prefix) not working correctly.
  Regressed in 1.2.0.

- Remove various bogus currency sign (particulary Euro and Korean Won) entries
  from the keysym <-> Unicode mappings. They prevented the real
  keysyms/codepoints for these from mapping correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 75655c8b48b425beb42b23d8e596d3c987047792)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-lib/{libxkbcommon_1.4.0.bb => libxkbcommon_1.4.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.4.0.bb => libxkbcommon_1.4.1.bb} (94%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb
similarity index 94%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb
index 34652e9c4e..89093e6786 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb
@@ -9,7 +9,7 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "106cec5263f9100a7e79b5f7220f889bc78e7d7ffc55d2b6fdb1efefb8024031"
+SRC_URI[sha256sum] = "943c07a1e2198026d8102b17270a1f406e4d3d6bbc4ae105b9e1b82d7d136b39"
 
 UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
-- 
2.25.1


