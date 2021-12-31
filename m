Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF996C433EF
	for <webhook@archiver.kernel.org>; Fri, 31 Dec 2021 19:38:48 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web12.16445.1640979528010499879
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Dec 2021 11:38:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id f9so24884536qtk.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Dec 2021 11:38:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=BtNaiDiTkEdH+tA393/v8AtyLlD2zmdBI4YDwUrb8O0=;
        b=PINDNjbOUFhuLe87gIS2HE2gKkfjO87bHog5EtNjVYuULfJnyCaxeWMeIDz9BUhQMP
         BCFE/jKYRnI3m77JyJ6UmPyOiK+5cedN2sys6Tbng42qnbCV4VyH5CRhOqzcH51XV3iU
         V9a2KGRhRyGe2N0tmGRdTOIx+gG9JC2SYS3yiNAs/rXOZujFGfB220G+SnH0TH6LHIzW
         C8+Qg2Lzm1jmAOf5BWKhDzFVEtMr+nICuW545/oSqe+XvjOjbDO6FgUUWCz1+Z7ICC+c
         2fp4f14sVLbIUv2L59QM2abu2DDzWUZ3cWJfdqYcIPVenKV7CoYRb8+UvmXmLhzvf0zk
         rjaA==
X-Gm-Message-State: AOAM533HXi16B/7WViBjyAnq7l03czpvPAl4qcNCXG1ydI3NBqQzFgQT
	8L+pQ2pF7m9Cj4aHc7/hNk+pet6sUxH31BbQ
X-Google-Smtp-Source: 
 ABdhPJyiE9/YRzfqmi1x/PcEu+mUY9DlYn02OO/8pZVGlllZFtBUxZPpjEI9hbZ1H9C9w0CmdF5KdQ==
X-Received: by 2002:a05:622a:3d0:: with SMTP id
 k16mr31316309qtx.676.1640979526796;
        Fri, 31 Dec 2021 11:38:46 -0800 (PST)
Received: from localhost (201-34-65-230.user3p.brasiltelecom.net.br.
 [201.34.65.230])
        by smtp.gmail.com with ESMTPSA id
 k8sm23388485qtx.35.2021.12.31.11.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Dec 2021 11:38:46 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] mesa: 21.3.1 -> 21.3.3
Date: Fri, 31 Dec 2021 16:38:42 -0300
Message-Id: <20211231193842.2283615-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Dec 2021 19:38:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160091

Upgrade to 21.3.3 stable release. It includes bugfixes and minor
improvements, for more detailed information about the included changes
refer to the specific release notes:

 - 21.3.2: https://docs.mesa3d.org/relnotes/21.3.2.html
 - 21.3.3: https://docs.mesa3d.org/relnotes/21.3.3.html

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../mesa/{mesa-gl_21.3.1.bb => mesa-gl_21.3.3.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_21.3.1.bb => mesa_21.3.3.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_21.3.1.bb => mesa-gl_21.3.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_21.3.1.bb => mesa_21.3.3.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.3.1.bb b/meta/recipes-graphics/mesa/mesa-gl_21.3.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_21.3.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_21.3.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 64702f8168..7f47f18591 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -23,7 +23,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch \
            "
 
-SRC_URI[sha256sum] = "2b0dc2540cb192525741d00f706dbc4586349185dafc65729c7fda0800cc474d"
+SRC_URI[sha256sum] = "ad7f4613ea7c5d08d9fcb5025270199e6ceb9aa99fd72ee572b70342240a8121"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.3.1.bb b/meta/recipes-graphics/mesa/mesa_21.3.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_21.3.1.bb
rename to meta/recipes-graphics/mesa/mesa_21.3.3.bb
-- 
2.30.2


