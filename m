Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A236CE7F136
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 21:43:39 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.3614.1695764613423317000
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 14:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aFlEFMb6;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1c5ff5f858dso44416305ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 14:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695764612; x=1696369412; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LOlMlMRDUcf5ezCWFHTY6LUQszv3C7A0uQQjEytToc=;
        b=aFlEFMb6UuL9OpGtRahPFZyR2bJWnTMSTLrwmH37rxxPL5hexTXGV2YiP3yt2O1+Mz
         t9W8UnNaopsEoduDT+p1eWAe4SbCgt/1YF+QULJ7H/aP/UE/OH8MTyKMvWygZTDdeTZA
         XCtssG+QlexBwfVQ6v95odMXomDCYhry0zOBYHfA25X/Bf3p1D7iuCY54AcYSoJHRAGK
         NCbgMfpOZ6L8HBnoVsdh4rZ2dcvXQ4xEDhXfxFt6emnlcEKbRfnjSo8qJLr/wgIcTbGK
         oiJFu91ctbUcUiHGV6pqsHSTY6VAT0Jf9j1XK7p0fuMau5bIJw8weWFnoE2WVGDqt7WP
         y1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695764612; x=1696369412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LOlMlMRDUcf5ezCWFHTY6LUQszv3C7A0uQQjEytToc=;
        b=PHS3ESlvaTHQp3vxncY2GhoT9WYsxj1WXQQHje+kWOuNZNwFedyr3MDVEAgxvGROLJ
         WH5bXSsiMWpTxV4LM5mF1eciMKqcV8L/xGZH2wuRbz3nnsj91+TL4Pm8wNnmCEf2pCz2
         Noqvacbsx/8z+QBHQe4m3SJN66hRuNoJwsH6iZrH1x0/vivqPZTqG5mgmGX7UU492q0L
         iXBf8r3CYeJew1dwtpdPKgfJ/kA5znnC/tc/1F74Ty1OUSryQE104vH7gEE5GkwCG+MI
         Unp6oeSZO8ghXq9Vk66dCKP/+LaY7fm9+kfPfkESK8tmxvLgMxytjawLOuW+JoJFkSow
         kcKQ==
X-Gm-Message-State: AOJu0YwC2enzS2SbY/VNYJRq5W7cFImunED6uH9pWCM+aEqvIQeSruro
	mZHheJ2tQsGM/d+g/+NzOyp5tau3aP+ew+0Ng3Y=
X-Google-Smtp-Source: AGHT+IH13IJvIXPsgf/ugd+uygUvkBLFJdecLYo08YxMdvl2KgLNMoLRMQqKLLPR/dweNZ+VoMNMvw==
X-Received: by 2002:a17:902:c409:b0:1c4:4a4d:cda with SMTP id k9-20020a170902c40900b001c44a4d0cdamr18709plk.15.1695764612444;
        Tue, 26 Sep 2023 14:43:32 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902c11300b001b5247cac3dsm11487713pli.110.2023.09.26.14.43.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 14:43:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 04/10] python3-git: upgrade 3.1.32 -> 3.1.37
Date: Tue, 26 Sep 2023 11:43:13 -1000
Message-Id: <931af3758a2d79aea534ab6d23db392ede7cc1bb.1695764457.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695764457.git.steve@sakoman.com>
References: <cover.1695764457.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 21:43:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188272

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


