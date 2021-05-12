Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web12.8352.1620831529916328867
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 07:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=pchh9XH5;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.176, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f176.google.com with SMTP id k25so22535191oic.4
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 07:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=43hPWeqHCTDotlMfASeVORhEJYu/ORrIfwjdV5Kj160=;
        b=pchh9XH5rGscEsTaopccs94inQVEhkGWtWUC0D9Z195y8k0lHSx4YEuAPC0qAwT0Nh
         WghpNv3t2PWPMa5H9a3lRpqVU5L4/rZ2ZprJBhFY0rq/q4KtfOxiiNtST4FGkB1iEDXE
         hAY3UnAV6lONK2rTFBxsdOJfOa4dk7qR9sZi04TNTna5FlDT7JKxVAuTNSciDtclLhS7
         mK1rlYkKC3gGQ19Cc0c8WEUViRxpEvodjFPObDSN2uuS7rwysRpnE0yj1OF5NEk9ZTwV
         ibOqo/hfbjlBltidgiiTYYXBFkCV+vMcEA492jnMLwcvf0tDN7EzmEwDt1fSSwwRPeL9
         o5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=43hPWeqHCTDotlMfASeVORhEJYu/ORrIfwjdV5Kj160=;
        b=VvNhJZrmPWdvUYagJ0NtaKLqE0QKiwiqn1FrjEgL7EA4nkTzjCPXz001rQQB46dqJD
         J0HV+YgkwgPr+8b9E1lMyo19z6qFWFK+IRL8WlaeT6Qes5JfEa0+xzGGhfBVvgrsfRYe
         q5zT1OJiT50HaqoDtCxCO884E6MOs2GHfMuO1zsmtBY4+qQdzLOHbYkOxSJyftlj36/4
         ANvdCc5K6565bHzU2aHKcIdtJsyFYP52KrKwRdVmxfU9ZGdxB5zyVz2TjI2EE+Ebawc7
         1ey4+0JLigSG2p7JeNb2HJfwII9QoO3sSK0ZTiSDSca/kRkMyOWPjyKaQZ8CB6TVCGMO
         +a4w==
X-Gm-Message-State: AOAM53060ONcz5MKwrcY8zOD+YtDjeFzTg8KZpJi1MXPyKkHhyP7fwZp
	VcQ9+hbeMapQpjWGLdBtAH4zf4RDcItwStJdhGs=
X-Google-Smtp-Source: ABdhPJx4INBfcR/pgZuw7rXIatBL6kk6zyv6tYMfo8ACqWtquHb8h7yxt5RKikiQ6DRBX/AeKUQ7Ww==
X-Received: by 2002:aca:bdc6:: with SMTP id n189mr7865037oif.156.1620831528825;
        Wed, 12 May 2021 07:58:48 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id 21sm1678otg.4.2021.05.12.07.58.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:58:48 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/22] openssh: Exclude CVE-2007-2768 from cve-check
Date: Wed, 12 May 2021 04:56:53 -1000
Message-Id: <67d5e034a7e89453f8efd5700621a97d32d7d956.1620831171.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620831171.git.steve@sakoman.com>
References: <cover.1620831171.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We don't build/use the OPIE PAM module, exclude the CVE from this recipe.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3670be602f2ace24dc49e196407efec577164050)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssh/openssh_8.2p1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
index fe94f30503..b429fbe96d 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
@@ -28,6 +28,9 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
 SRC_URI[md5sum] = "3076e6413e8dbe56d33848c1054ac091"
 SRC_URI[sha256sum] = "43925151e6cf6cee1450190c0e9af4dc36b41c12737619edff8bcebdff64e671"
 
+# This CVE is specific to OpenSSH with the pam opie which we don't build/use here
+CVE_CHECK_WHITELIST += "CVE-2007-2768"
+
 # This CVE is specific to OpenSSH server, as used in Fedora and Red Hat Enterprise Linux 7
 # and when running in a Kerberos environment. As such it is not relevant to OpenEmbedded
 CVE_CHECK_WHITELIST += "CVE-2014-9278"
-- 
2.25.1

