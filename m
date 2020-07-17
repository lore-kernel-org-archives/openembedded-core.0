Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.12929.1594996742076641822
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 07:39:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=b/5K7hQ6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id x72so5482449pfc.6
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 07:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Bz9/kcxUubUncmOcXFaPPBIZYDvN/XB9s4gNmm+xY90=;
        b=b/5K7hQ6L+AKU4OjPqBH7iH9ixp0EuCVDDCUEabzFNUK0sXbKMY4jHH2qyEniFI65S
         1QfybiymlBDoU3fmzXg9vcEo48dlbyu8nGTWttUF3C6sEr88inEaniHE4L0OyWRV6EPC
         okWefEtZHW1vEOcPPOmBMhv9dh7gYumnw75N7tv6itm32To4RzWVP5nMBrQgZcBFpa9P
         IAfd3R6WLj0N3sMz4RzN/9NwNt6dYTrqAeJ3+wGsEx3iqedo6BnW8+qdEqOd1HTuIDw4
         WB2vokFvp/+Lz6pmft8FSUB5jDANhK9KLhT8TDElh+xPK7iiTjFGUuStWsHDYSh4I2bV
         SsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Bz9/kcxUubUncmOcXFaPPBIZYDvN/XB9s4gNmm+xY90=;
        b=Ujr1LOmw7CDqDfSC5P7lhLhey5iFxMGCPtKDeMihl31N9udqg9fD6bm7my+RwE+8Au
         yBneB9v6gvMJ183gMgCNna/ajnZX2ivmC//OYu5w/9Pr9Hj9ZPzY9Y3kL4GKUzlE8R8Q
         xJ9wtQPDuJTG3FvHZJO3MpRZFsC2CQQNohTZHZfa9p7e17AJkiIuZu+K95MKN1jBHnJx
         FEBq6AVhN3i7HEBiOyLXT/wwKgJbb94smJdd18kf6lgicllmKaUG6hNWGxhxQYlttTQl
         4Zx4Y6hEl5nzLZBxtz/O91HIR6Mz2oVaslYFDMsrCMj98gRHEjD/mlKdzukRwXTtMo/b
         xihQ==
X-Gm-Message-State: AOAM530/2oIrxMwCrP2zRVey8IEH8T3bGddin4OuX8O8dfUlwCU67n6j
	4RjnspXUYvNh+ADGuYKdIAkc2h++XzU=
X-Google-Smtp-Source: ABdhPJwW67g4SMfs4eRlpzXPuXxIuWQU9U7mwfcVlFyE7KLWyjadZ758fDM4L4gNJu8Je/VIKZGu2w==
X-Received: by 2002:aa7:9186:: with SMTP id x6mr8480797pfa.103.1594996741147;
        Fri, 17 Jul 2020 07:39:01 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id mw5sm3448727pjb.27.2020.07.17.07.38.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 07:39:00 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/20] lib/oe/recipeutils.py: add AUTHOR; BBCLASSEXTEND
Date: Fri, 17 Jul 2020 04:37:20 -1000
Message-Id: <2a1ae8c12cb0d6fd9d57c98caa97a10f3b6d3388.1594996441.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594996440.git.steve@sakoman.com>
References: <cover.1594996440.git.steve@sakoman.com>

From: Tim Orling <timothy.t.orling@linux.intel.com>

If you try to create a plugin for recipetool that
adds the AUTHOR field, it is impossible to put it
in the recommended position [1] without adding to the
recipe_progression variable.

While we are at it, also add BBCLASSEXTEND at the
end, as also recommended by [1].

[1] http://www.openembedded.org/wiki/Styleguide

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d687c5b7b10b3decdd80d5c2fd61072a87f061f2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/recipeutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 732420e46f..fde1ad3ddd 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -24,7 +24,7 @@ from collections import OrderedDict, defaultdict
 from bb.utils import vercmp_string
 
 # Help us to find places to insert values
-recipe_progression = ['SUMMARY', 'DESCRIPTION', 'HOMEPAGE', 'BUGTRACKER', 'SECTION', 'LICENSE', 'LICENSE_FLAGS', 'LIC_FILES_CHKSUM', 'PROVIDES', 'DEPENDS', 'PR', 'PV', 'SRCREV', 'SRCPV', 'SRC_URI', 'S', 'do_fetch()', 'do_unpack()', 'do_patch()', 'EXTRA_OECONF', 'EXTRA_OECMAKE', 'EXTRA_OESCONS', 'do_configure()', 'EXTRA_OEMAKE', 'do_compile()', 'do_install()', 'do_populate_sysroot()', 'INITSCRIPT', 'USERADD', 'GROUPADD', 'PACKAGES', 'FILES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RPROVIDES', 'RREPLACES', 'RCONFLICTS', 'ALLOW_EMPTY', 'populate_packages()', 'do_package()', 'do_deploy()']
+recipe_progression = ['SUMMARY', 'DESCRIPTION', 'AUTHOR', 'HOMEPAGE', 'BUGTRACKER', 'SECTION', 'LICENSE', 'LICENSE_FLAGS', 'LIC_FILES_CHKSUM', 'PROVIDES', 'DEPENDS', 'PR', 'PV', 'SRCREV', 'SRCPV', 'SRC_URI', 'S', 'do_fetch()', 'do_unpack()', 'do_patch()', 'EXTRA_OECONF', 'EXTRA_OECMAKE', 'EXTRA_OESCONS', 'do_configure()', 'EXTRA_OEMAKE', 'do_compile()', 'do_install()', 'do_populate_sysroot()', 'INITSCRIPT', 'USERADD', 'GROUPADD', 'PACKAGES', 'FILES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RPROVIDES', 'RREPLACES', 'RCONFLICTS', 'ALLOW_EMPTY', 'populate_packages()', 'do_package()', 'do_deploy()', 'BBCLASSEXTEND']
 # Variables that sometimes are a bit long but shouldn't be wrapped
 nowrap_vars = ['SUMMARY', 'HOMEPAGE', 'BUGTRACKER', r'SRC_URI\[(.+\.)?md5sum\]', r'SRC_URI\[(.+\.)?sha256sum\]']
 list_vars = ['SRC_URI', 'LIC_FILES_CHKSUM']
-- 
2.17.1

