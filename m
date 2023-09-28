Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D36C4CE7AF7
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 02:49:18 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.6277.1695869356457352392
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 19:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Fg9OYRjC;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.172, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-77386822cfbso818614385a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 19:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695869355; x=1696474155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LOlMlMRDUcf5ezCWFHTY6LUQszv3C7A0uQQjEytToc=;
        b=Fg9OYRjCgjeSDjZMknwhqeiOKafVRReGxPTYB71+iGd4l0BMjBqti9S0G/K/hwI4XX
         iDN3a0xSvgucZj9J+k93nFs7QZXmv6X7lgfJ/gOeOelf3bDuVwpL+Exl18cnahYa376v
         0xl6J1xEgEx3GHUcf3GZ0dEKYrKPQ03oDOfKrYCzZWppaMStZgjDjRIeG4Szj1tgVH3G
         bP2Yi1zM2UrHioenTZUJrPi04FHyr1jhmXSTbI0L0vNFFH4sEtl7qgiJFCmEdMCvBcQG
         ywaR/8XS1RhsVP2OMd7RARGGcY3h26j1jAKKDRh4ogKufijqzsgZDqTs5CT+KUDX7ZZH
         DWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695869355; x=1696474155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LOlMlMRDUcf5ezCWFHTY6LUQszv3C7A0uQQjEytToc=;
        b=lVmvypHyAJf81RoNtEpyh5ChLs4K5CHSEZVwHw5v8N8DH4N+xv90G+R29C6tPrJRMq
         WQeeGtKdaz+y2yRYSYyD8cDgfkEnNQkXxaOUT7u2zaMbNpnPJnzRNRynRy7p7lChMTtp
         aZacczTnS1I9oPET6KAnxcmo3JBGvvzR/RLRzlqaC85TGu+wmm4M/DgSiaCdkjAZVVnN
         F3tKWIzWHMvVJ4603h1n73s0peutFz8K3y79LTTJKj7DbBakdj4J1BbKrbVcATQr8RJW
         /8UhC5PwWC4+J6KE4P9beKvx5v0mFxNeCiBqVn9gpo3gCpaStfDt/XtLk5MEJgV9bYin
         EFjw==
X-Gm-Message-State: AOJu0YzTL7ydR6KkVyBLdICsyju2WmRY4hgolFiWCL6B5rIHw6NA+jgO
	8t6zA9+P3l9RwgRfQIaxA3rcjzJ8dpmhqrH5Y3c=
X-Google-Smtp-Source: AGHT+IEIskar7+TqVCO1e8UMO5L86lFzyfi4KDaL5Bv+8zOfuc3E/9/M0nvdsPwnXjw3THWttZ4ODw==
X-Received: by 2002:a05:620a:1a25:b0:75b:23a1:8336 with SMTP id bk37-20020a05620a1a2500b0075b23a18336mr3366265qkb.49.1695869355124;
        Wed, 27 Sep 2023 19:49:15 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n3-20020aa79043000000b0068e12e6954csm1850214pfo.36.2023.09.27.19.49.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 19:49:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/17] python3-git: upgrade 3.1.32 -> 3.1.37
Date: Wed, 27 Sep 2023 16:48:43 -1000
Message-Id: <35cb21d6c8076428c0c60f03bb1b8f6945e2a07c.1695869144.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695869144.git.steve@sakoman.com>
References: <cover.1695869144.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 02:49:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188364

From: Narpat Mali <narpat.mali@windriver.com>

The delta between 3.1.32 & 3.1.37 contains the CVE-2023-40590 and
CVE-2023-41040 fixes and other bugfixes.

Changelog:
==========
- WIP Quick doc by @LeoDaCoda in #1608
- Partial clean up wrt mypy and black by @bodograumann in #1617
- Disable merge_includes in config writers by @bodograumann in #1618
- feat: full typing for "progress" parameter in Repo class by @madebylydia in #1634
- Fix CVE-2023-40590 by @EliahKagan in #1636
- #1566 Creating a lock now uses python built-in "open()" method to work arou… by @HageMaster3108 in #1619
- util: close lockfile after opening successfully by @skshetry in #1639
- Bump actions/checkout from 3 to 4 by @dependabot in #1643
- Fix 'Tree' object has no attribute '_name' when submodule path is normal path by @CosmosAtlas in #1645
- Fix CVE-2023-41040 by @facutuesca in #1644
- Only make config more permissive in tests that need it by @EliahKagan in #1648
- Added test for PR #1645 submodule path by @CosmosAtlas in #1647
- Fix Windows environment variable upcasing bug by @EliahKagan in #1650
- Improve Python version and OS compatibility, fixing deprecations by @EliahKagan in #1654
- Better document env_case test/fixture and cwd by @EliahKagan in #1657
- Remove spurious executable permissions by @EliahKagan in #1658
- Fix up checks in Makefile and make them portable by @EliahKagan in #1661
- Fix URLs that were redirecting to another license by @EliahKagan in #1662
- Assorted small fixes/improvements to root dir docs by @EliahKagan in #1663
- Use venv instead of virtualenv in test_installation by @EliahKagan in #1664
- Omit py_modules in setup by @EliahKagan in #1665
- Don't track code coverage temporary files by @EliahKagan in #1666
- Configure tox by @EliahKagan in #1667
- Format tests with black and auto-exclude untracked paths by @EliahKagan in #1668
- Upgrade and broaden flake8, fixing style problems and bugs by @EliahKagan in #1673
- Fix rollback bug in SymbolicReference.set_reference by @EliahKagan in #1675
- Remove @NoEffect annotations by @EliahKagan in #1677
- Add more checks for the validity of refnames by @facutuesca in #1672

Note that the changes to the license file are just removal of excess whitespace
(the extra blank line at the end, and spaces appearing at the end of lines).

References:
https://github.com/gitpython-developers/GitPython/releases
https://github.com/gitpython-developers/GitPython/blob/main/doc/source/changes.rst
https://github.com/gitpython-developers/GitPython/commit/e1af18377fd69f9c1007f8abf6ccb95b3c5a6558

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/{python3-git_3.1.32.bb => python3-git_3.1.37.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.32.bb => python3-git_3.1.37.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.32.bb b/meta/recipes-devtools/python/python3-git_3.1.37.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-git_3.1.32.bb
rename to meta/recipes-devtools/python/python3-git_3.1.37.bb
index f217577eb8..56a335a79e 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.32.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.37.bb
@@ -6,13 +6,13 @@ access with big-files support."
 HOMEPAGE = "http://github.com/gitpython-developers/GitPython"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5279a7ab369ba336989dcf2a107e5c8e"
 
 PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "8d9b8cb1e80b9735e8717c9362079d3ce4c6e5ddeebedd0361b228c3a67a62f6"
+SRC_URI[sha256sum] = "f9b9ddc0761c125d5780eab2d64be4873fc6817c2899cbcb34b02344bdc7bc54"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.34.1


