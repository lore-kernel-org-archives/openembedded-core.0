Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web12.20336.1594649872761780090
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 07:17:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=TG5b5O+Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id md7so6328261pjb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2020 07:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=7VWDqHPNCmy3mthZwckVww+GIhPnXsUJ2/8G+FYUGOE=;
        b=TG5b5O+ZBP02KI1l0YqftTn+ezf/3LfPFw/L5kj7yxdC7pSr0cZNauWdveN0KcEsaL
         M4YMsjz6e1tj7JUjKkxmHDr8nOutwVYdT3clsBGTBB04DSpSVcbYepfLvWYfkguXf+4T
         /5I5aInRfKFk3MoinRdq5Zh0zLpO5v1cF7lqq53UZUletlF81kjageH6VLxrVUwev9Qx
         YDbT5JSZG4Ga1TCuQ0oWK8rMMnH8laxjiE8Qb4I3lYI06Nn0kaV+QfQKraOJpG0Ww06Q
         PxBigqNOq0w2p9F6eQJF0sUsNVxCmQs5BCWNfl7TlVgzDtsVF+ZUS3sXXdzakNIlbCRE
         d50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=7VWDqHPNCmy3mthZwckVww+GIhPnXsUJ2/8G+FYUGOE=;
        b=TCdMlCa1DAARW1JupMahe7MKgsf/NYf4UMCfe3LFmCgGYOKzZZHQfeUtZGxX6yTwxJ
         glm8MTXi0Vd6ZaeTlvrlUY79pfEuZEvcdh/oqI4fAV4yEKxRc+ht86TSRChRAzH0U9Vu
         hU2gIEjBmoo50sKnzjFJeEdVVyJ8WlRnji44TQV6yyWYkzV617CEX79Gd/EheKNr5OQh
         DmaPb5bUgsM/oWbNyzEy/F37MMVHrbdXId9Fu2jufuP4CztafPZc6k+Egrpnj6FzaREY
         6KH+PBq72Vz1Nq8MLfHUTVTy5wF2nNII10gfpLCdkLpu5lkeu+JlYaE7Nx+U2cq9nXbL
         TU/g==
X-Gm-Message-State: AOAM530OCUD4eDZp/lGPbSlAIJj9rhSSku7Wyb8BF8YKGIjxtrFpO+Vg
	+y/mmn9+lgrK+gDcNInQMSLMXkruTnBDsg==
X-Google-Smtp-Source: ABdhPJwyAePHsNgCdvfHQhxU7cqEKEa0EYr+DzFTAMW/UgzG7QDaIXaTXz6pKCMBOU9rSYz3NkYLVg==
X-Received: by 2002:a17:902:c24a:: with SMTP id 10mr66371846plg.82.1594649871905;
        Mon, 13 Jul 2020 07:17:51 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k7sm13723738pgh.46.2020.07.13.07.17.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:17:51 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/15] libnl: Extend for native/nativesdk
Date: Mon, 13 Jul 2020 04:17:02 -1000
Message-Id: <d0018af12372d05a9077e80607731e6c4718bdc0.1594649587.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594649587.git.steve@sakoman.com>
References: <cover.1594649587.git.steve@sakoman.com>

From: Christian Eggers <ceggers@arri.de>

libnl is required by networkmanager.

Signed-off-by: Christian Eggers <ceggers@arri.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b3c96103a5063eeefb0c537227eab3f77616b9c0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libnl/libnl_3.5.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libnl/libnl_3.5.0.bb b/meta/recipes-support/libnl/libnl_3.5.0.bb
index c0609c4d90..9d0e1441a9 100644
--- a/meta/recipes-support/libnl/libnl_3.5.0.bb
+++ b/meta/recipes-support/libnl/libnl_3.5.0.bb
@@ -40,3 +40,5 @@ FILES_${PN}-route = "${libdir}/libnl-route-3.so.*"
 FILES_${PN}-xfrm  = "${libdir}/libnl-xfrm-3.so.*"
 RREPLACES_${PN}-genl = "libnl-genl2"
 RCONFLICTS_${PN}-genl = "libnl-genl2"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

