Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D05DC433FE
	for <webhook@archiver.kernel.org>; Sun, 14 Nov 2021 20:27:27 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.13733.1636921646524629915
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 12:27:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PgSqCXd3;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id i5so26488679wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 12:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1QynEG8p1B/2jjv/KWMt6Q5r+Jp6qy3dk3T0X69mvu4=;
        b=PgSqCXd3kXi36hZRTGwBtQL/ml69iNTk0Dvv+xIlO7kRi2syMLCClm8EWpG2zqX8+I
         E2PIDCZxPz7lwPHT6PSUvt/8jw2khZKYu5RAASJKOnqHVTvE1SvtGYJA1dng3lUJ0q7F
         uupm1OWghrrDZa+dMOGAremr/z0Rwt2Lh1v6C/2teqSLYFqvIla47RKI3LdxFaPVzh7e
         sbBDgmAiVoRzvZ4NupMKZTHVOUo8iti7hOGLvV86mX1V1ae5VemtaekKO4Jb3tp6cGFy
         h9TMNH4bxh+/Ncgr8Z60DP/wXRGDSGYvJQMvNP8EyikECcVBEb02RHXh+JZDWjqxl39B
         6NIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1QynEG8p1B/2jjv/KWMt6Q5r+Jp6qy3dk3T0X69mvu4=;
        b=a4SzZpHOKcTOaVnFCOcCCOrJcWJT61LCrHgURKE3ol4+u08Ogcni/ngKELJ6TFBfkZ
         mhH73ZwAx5MIsIvPe5e+aOu6XLyte2NCp4GfZMKCraQReQ0pJgSjLAzHws17veZHVbl6
         oQcgB3X0AZ9jWfuqYgPj6HhaUFowK9aV+sGQ2OlqQCVWk2+J8bhKNq/4J+lSV9MsRkon
         hsQxyuJaW0v/oO+WyTIYkEwdGQ0iCwbloXqwv+6FQTG+LZix9wqiv2LC7lqfkW9vaGN2
         jj0ZY9mvbKC+AuKd+jSPRCIhKEkyX0RRnZtb1iDRxJZjOEHXQgnqauP3JtR5PRSovC9i
         6+DQ==
X-Gm-Message-State: AOAM531Mz4AJyJFGGZYC9AcikCml5I4of0i/15UXuVRve38qAjbDEqQd
	EFsrNuJZIg+QofDgrKxxDo/rGKYOxS0=
X-Google-Smtp-Source: 
 ABdhPJzAu48/UIIDswRZWLx2YHcNynZmfFUdgrzt8QqvIXZ0dExuVxVQv6FqEdcVhv/Ek7AZ/rsusw==
X-Received: by 2002:a5d:4909:: with SMTP id x9mr40219950wrq.313.1636921644726;
        Sun, 14 Nov 2021 12:27:24 -0800 (PST)
Received: from localhost.localdomain (176.57.115.89.rev.vodafone.pt.
 [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 r15sm12733295wru.9.2021.11.14.12.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 12:27:24 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 3/5] spirv-tools: upgrade 2021.3 -> 2021.4
Date: Sun, 14 Nov 2021 20:26:46 +0000
Message-Id: <20211114202648.316923-3-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114202648.316923-1-quaresma.jose@gmail.com>
References: <20211114202648.316923-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Nov 2021 20:27:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158269

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../spir/{spirv-tools_2021.3.bb => spirv-tools_2021.4.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-tools_2021.3.bb => spirv-tools_2021.4.bb} (96%)

diff --git a/meta/recipes-graphics/spir/spirv-tools_2021.3.bb b/meta/recipes-graphics/spir/spirv-tools_2021.4.bb
similarity index 96%
rename from meta/recipes-graphics/spir/spirv-tools_2021.3.bb
rename to meta/recipes-graphics/spir/spirv-tools_2021.4.bb
index bf44b58c99..ed56f4668f 100644
--- a/meta/recipes-graphics/spir/spirv-tools_2021.3.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_2021.4.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "1fbed83c8aab8517d821fcb4164c08567951938f"
+SRCREV = "ab8eb607750208066e2d57eff6a34dbaf05f5ada"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
-- 
2.33.1


