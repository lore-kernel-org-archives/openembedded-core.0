Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 927C7C47258
	for <webhook@archiver.kernel.org>; Sun, 21 Jan 2024 02:49:50 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.40183.1705805380374346869
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jan 2024 18:49:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=hqBrZIeS;
 spf=pass (domain: underview.tech, ip: 209.85.219.50, mailfrom: vince@underview.tech)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-680b1335af6so27467146d6.1
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jan 2024 18:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1705805379; x=1706410179; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/wvsSkSGjiERo159+QpJifLWkN3/t/CmYXM+QdXf0B8=;
        b=hqBrZIeSabBEqXTKqSBsiKJoltMFUBM1CTZ+n/LKf/sGhnvuGmHsHej1Oue+YByrJk
         urL2xvPgShs0ai61OxcfmUG+MQUUrHzn5XBQ3BPAHzokXQh4QeKPiAHh94aM+VbNGqcP
         9ZKKqb0HTyCjp3t8wmiE+j6kPDrSJgcojI7SVVRTpzLawyDe2yAPXHHx75hsQZccxb+W
         liY3eJ/JcgxdG2hgfpkiFW5t8j2yjVsIf9ONHZ68vKJ+z1tXZjJ039B/J+AIodc502+q
         vF6ybkBo27nzoqhDy8jzzN4ffZw+auh7CXHIRvFiA03orqZzP7bxTGB1yqeHoGDB2zqg
         vXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705805379; x=1706410179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/wvsSkSGjiERo159+QpJifLWkN3/t/CmYXM+QdXf0B8=;
        b=uW8IcIk9BV+XpuFFI64Sze22DT/r5J2K9s1UwXVIqIs5nGlPSgDo2GnytpTuP7tIVj
         b5xeeiGGm/D6tagSgSbzHrddlX/IIfuyJqp+Zn1beaQsrJ33EHXdntozxjZuN8BpHnae
         XzyEmpY2MezQi1mYmVJz/k4y0x/PcNadUBXDoPQNExl3/HbvXbKMEFF3tC55QAVMVz3G
         xhBUUIw1sA68mY7E8PtZP+mYqm3gOPMEIQeBI4Uq3+/53yeuQQ0FkB2ngV3xQyfxS42w
         gDpktU8PY3Yfsh6EWrjBcK98sGws0IrLn/px43BItfNXBfbQIWWeUMoLgQRYpwVqA/+Q
         dLdA==
X-Gm-Message-State: AOJu0YxPV6kdhl2sqVuOwiTSDuhtx/F4XxH3HoxmOSrisS62Y04qMWow
	y6QimOW2ky9iUzAbejUySM6sFTY7L7Gi4PqNIrdhn24yZ4aUs9Eo6dqMQ3bA44UwkPCCS+vZM4X
	c
X-Google-Smtp-Source: AGHT+IEmRYIn74vA8oqnDcqjblnkn45yJOfAtTprisPO3tH/JEIujuZgK5ECKd7YPK5osmOwhmeHfw==
X-Received: by 2002:a05:6214:2623:b0:685:3444:19ba with SMTP id gv3-20020a056214262300b00685344419bamr3082086qvb.31.1705805379081;
        Sat, 20 Jan 2024 18:49:39 -0800 (PST)
Received: from vince-B550I-AORUS-PRO-AX.hsd1.mi.comcast.net ([2601:406:4d00:a9b0:e28e:d846:a8ad:2feb])
        by smtp.gmail.com with ESMTPSA id nf5-20020a0562143b8500b0068179e7e87dsm1128223qvb.107.2024.01.20.18.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jan 2024 18:49:38 -0800 (PST)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH] shaderc: update commit hash to v2023.7
Date: Sat, 20 Jan 2024 21:49:29 -0500
Message-Id: <20240121024929.2596664-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 02:49:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194088

v2023.7 of google shaderc hash was updated to

https://github.com/google/shaderc/commit/3882b16417077aa8eaa7b5775920e7ba4b8a224d
https://github.com/google/shaderc/releases/tag/v2023.7

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-graphics/shaderc/shaderc_2023.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2023.7.bb b/meta/recipes-graphics/shaderc/shaderc_2023.7.bb
index e4555af6d5..cf2ced98f0 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2023.7.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2023.7.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "23cc2d78fd4f866b6ab527886a396bec36948605"
+SRCREV = "3882b16417077aa8eaa7b5775920e7ba4b8a224d"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.34.1


