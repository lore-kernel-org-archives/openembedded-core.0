Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F45EC636F4
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.8127.1650463775443068402
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=cZRMzmzv;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id md4so2036089pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=K0RpokRBAhs+MpWmMsipdS/cM6eQ/YI8AGBFAMFoM7U=;
        b=cZRMzmzv4s99Pc7umB/0+tlqn5Uw0eLv/Yw53x/Dd7MHoS797EqAVygfZSnQpXPYeb
         Hix20C1CQWkxOBqkK0ntkGWzG5euLJk803qF8XDzQ0m5n78Vdmd/DlXbURS9x6/83DXM
         UFxPa7iffbgX/e2YCEyUDRmB2Q5WGRTLlIVA2rn3YV2faZjN00vzpRaInCLoJSmBEGk3
         BzJhBKJScBIkeD4noPmmedkbcBSZLv9hoQE1HO4LWypuVPN8xdsuxk08oIahKwDRy2cu
         8RVP1jzsq3cMHFunSjHJAkiN0WkKVgucevDQJRewSysxOcmViUzcS/rag8WwnKpvBIFn
         hlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K0RpokRBAhs+MpWmMsipdS/cM6eQ/YI8AGBFAMFoM7U=;
        b=qn31IYdc4PebL1UrmMaP9vDhpfTtasi/ihEKP3maDO1rJROGHeh2+rxYUupxl9KqaW
         EflcMB/prjaryfmLVvmSuP0MLqrA6Iv95Jz6VaXFMp4ZiXl2MyjqcrY8T/DHrY85BG+B
         34thiv1wQoQoRl9zvMfxZ2siggYm2Vumbsdaq8ZpZagBtQ9e/BspXE2yl6JMM5uNr6pf
         wVxn1hArrnKQezqccCUJ1gCr5VF18j+YIhYB1WeYJ35khN9Sq4oBhFhU3QGP2cf8tYbb
         WYDzU7kTKg9rsqN2H4aiFtjfEnnZvuZ1j9XoFOX++0RyUvS0VqCju/zFpqmNCmXGGrfb
         3c6g==
X-Gm-Message-State: AOAM5339TyFDxJzIPlO+597xXWpBT1LprLjcL0sZBlpTkGKJKfzfpMlO
	HbMdrEYfp4Uv5FKiFYB5BHqkpCMd0zcKCtYIf1s=
X-Google-Smtp-Source: 
 ABdhPJwTfBbM15ev2LaJqg/sYlwpl5fnjLVbFfz80SsjEQjpG9KzLl+e6cYoJb8HX5covlRnJu4gsQ==
X-Received: by 2002:a17:90b:4f85:b0:1d2:828f:9860 with SMTP id
 qe5-20020a17090b4f8500b001d2828f9860mr4695378pjb.54.1650463774529;
        Wed, 20 Apr 2022 07:09:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 96-20020a17090a09e900b001cb62ee05besm22941091pjo.55.2022.04.20.07.09.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:09:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/27] libsoup: upgrade 3.0.5 -> 3.0.6
Date: Wed, 20 Apr 2022 04:08:10 -1000
Message-Id: 
 <ec5f28e4a37349199a7f7b0a97270a2d6302317b.1650463004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650463004.git.steve@sakoman.com>
References: <cover.1650463004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164690

From: wangmy <wangmy@fujitsu.com>

Changelog:
=========
* Misc HTTP/2 fixes
* Add PUT/POST support to examples/get
* Add `--user-agent` option to examples/get
* Misc meson improvements
* Fix build with Visual Studio

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0ee1c748af7520f50275b8dfb32f41de7f5e14c7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/{libsoup_3.0.5.bb => libsoup_3.0.6.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.0.5.bb => libsoup_3.0.6.bb} (94%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.0.5.bb b/meta/recipes-support/libsoup/libsoup_3.0.6.bb
similarity index 94%
rename from meta/recipes-support/libsoup/libsoup_3.0.5.bb
rename to meta/recipes-support/libsoup/libsoup_3.0.6.bb
index d2535c91a2..17825ae6a4 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.5.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.6.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f5d143db6830b3825edc2a1c4449d639273b0bfa017a4970871962d9bca22145"
+SRC_URI[sha256sum] = "b45d59f840b9acf9bb45fd45854e3ef672f57e3ab957401c3ad8d7502ac23da6"
 
 PROVIDES = "libsoup-3.0"
 CVE_PRODUCT = "libsoup"
-- 
2.25.1


