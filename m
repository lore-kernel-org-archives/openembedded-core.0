Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 607E2C433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 19:11:41 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.2432.1643310699984165089
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 11:11:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pilZqYb6;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id e8so6659538wrc.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 11:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZPPvZFtgyy0UQH6QXUj2XE/z5QnWem7nJ4aoR3pfuNQ=;
        b=pilZqYb6VRIyoocD2mxNOBBjfX5TNEfIdplZRTarugKO7uq8hORFJt9sb3KR6IR7Ld
         mCsUM1B5Ay9VR+y39+q2jQGCqeN9aUhrUZ90g60oidGgjvOotEmxNwDktOA/rYOczCr9
         G+CtPcH1MIEpNzsWhbQxtHhSoN8jBalqsKv9nDC/fD0cvVz17+9V9T6aA9W7KLOW8c1t
         OVji4BReJqGnvDxMc7kp9smLSPXA53sGZpKXZnP/1nTwAe0cLUAQCfz/xJhnZK173969
         U99N0FdI9RxH5kV8q3TlOZDxjREVj/zQaB73YHiLgmErzGWU/RZZQuOlawsf2bPb3lfm
         H5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZPPvZFtgyy0UQH6QXUj2XE/z5QnWem7nJ4aoR3pfuNQ=;
        b=sSl0pf40YYdSRcimE4hbqZiCJ26ZhUd83wJmkx02BLj6SCPVPG98GfcZs5NF577txY
         g5WgW4/TtCYM8TwvXt1WiE9HmopLAk41lIxnzMNQ6F9XRpt3zxa/VHt0WJOrHScn6tKH
         gLbb3B7mapfOgWdYQV+O03sFyMSSYUKCRtC/fPyfrJ3UDhHZSqKQeagcxNEJjGGqlm4U
         m4WeAux8ZJBwjWdprE5/4TAUjrcwNvYxBZLwTqyqJRZDV41HnvJ47xra2IGysNCklUHu
         SodJ6DKL4doY2uQvgp40rMh0A0nrgluS6QALscBOzloGx81V4rh/AXlmbJUuNbxAHDUT
         symg==
X-Gm-Message-State: AOAM530lxlG084BWLhrqBzGzYCeF/gQFUf+0Z2FHgIjbM+BQMe17GhpE
	SdK7ebPSP4/u0pFxybnqSC2XdzdCqA4=
X-Google-Smtp-Source: 
 ABdhPJzLg0xzWxVtE5JwVq83rNl/4mgw+wBP02cRUDl8A3aly12R69+Kd7Ib/hFm42DVya1h7HKUhA==
X-Received: by 2002:adf:e951:: with SMTP id m17mr4298026wrn.347.1643310698080;
        Thu, 27 Jan 2022 11:11:38 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id o27sm152154wms.4.2022.01.27.11.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 11:11:37 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 1/2] spirv-headers: bump to b42ba6
Date: Thu, 27 Jan 2022 19:11:30 +0000
Message-Id: <20220127191131.2533049-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 19:11:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161048

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-graphics/spir/spirv-headers_1.5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb b/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
index 522708618e..3144b1eb42 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
 
-SRCREV = "814e728b30ddd0f4509233099a3ad96fd4318c07"
+SRCREV = "b42ba6d92faf6b4938e6f22ddd186dbdacc98d78"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
-- 
2.35.0


