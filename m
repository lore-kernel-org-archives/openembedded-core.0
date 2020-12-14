Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.2207.1607975714845189382
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 11:55:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pyve5/vL;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id hk16so7326710pjb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 11:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IjrJhnxHr+SFoT89cLpxok57deNxpI6e5z6USscsBzo=;
        b=pyve5/vLF7Bn12JsBDe0ewsTn2mBvzdBlSTjUgYh2P/e7MAnNF5mmOiUZIvKDmX+iC
         MlDj5aIvwxAGGKwKZ9jww1e8LZF1OsVuXs3IRymoAaB2hhyVPd7eKYCf4GFzPNPVI3oO
         V7e8wad+FyoGnqlnpXjHPdVPDNVPvhRJX/yJUK68RAkWy80OfHA/HmJCjZMVWaNSKmBU
         JIFGQJS+fkraalQO+7zKabDUbwBnxzV1LWm1ZFo294ByZScHeABSRY5n/s+btwD2r1nE
         /o0+N6Ii8vag1ztFescHz3DGY/xG0XNrF77sO+Z0iPx/Tuq3UbVXt8j5H+fqAfdCgC/E
         V8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IjrJhnxHr+SFoT89cLpxok57deNxpI6e5z6USscsBzo=;
        b=huhZC0kKBReStr8kPNgbVU2pCOfkdWzLqjnfUsHYXfP5dC949bWPnP1J/JOBszI2Tx
         vpiZCmihPapUPycgStBsOz2jy9yBuwrRlY1d1gtdZ+chD9apVboDC8EzdzQzGP1TX4fy
         c33SSzVJoPJlruJbaGHGCPoCMmLYxETs3xb/gC4q0xsLUCjFvXgJafvvRa1ZIQhaekC0
         PcjSZAE1uWfNWUJjYtXTIGDEPGo/eZZislRmP4dvoAxE1aifA8kSiEgux1muWEaJlify
         y6Bpudi0sKkJA0uJnvtQWporuCeCbVKUfJw9nJ7uY6VCLyNmItOwkh7X/IrxBcWNumtV
         cDTg==
X-Gm-Message-State: AOAM533E7z2rRx4dcRlP0XQ5M0to3Ng7F0AuQAxIjATVencGZm40rgYC
	JcoRhx5+xU+XD0ET3vcqw6UmCerdVgwrCg==
X-Google-Smtp-Source: ABdhPJxJOA9xxVl5s6JUYVVjCNAhB6fSX/fnA3/uEF54MV+XfFzON94hSltDCGOYt5MdpTYNm5+ukA==
X-Received: by 2002:a17:90b:3110:: with SMTP id gc16mr26951087pjb.83.1607975714027;
        Mon, 14 Dec 2020 11:55:14 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:8d6d:2a16:706b:382])
        by smtp.gmail.com with ESMTPSA id h20sm20069688pgv.23.2020.12.14.11.55.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 11:55:13 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] python3-packaging: upgrade 20.4 -> 20.8
Date: Mon, 14 Dec 2020 11:54:51 -0800
Message-Id: <b826346858fb63221d7fdc5ff2c03de3461144ee.1607975468.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1607975468.git.timothy.t.orling@linux.intel.com>
References: <cover.1607975468.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

Upstream release notes:
'''
* 20.8 - 2020-12-11
  - Revert back to setuptools for compatibility purposes for some Linux
    distros (:issue:`363`)
  - Do not insert an underscore in wheel tags when the interpreter version
    number is more than 2 digits (:issue:`372`)

* 20.7 - 2020-11-28
  - No unreleased changes.

* 20.6 - 2020-11-28
  - Note:
    This release was subsequently yanked, and these changes were included in
    20.7.

  - Fix flit configuration, to include LICENSE files (:issue:`357`)
  - Make intel a recognized CPU architecture for the universal macOS
    platform tag (:issue:`361`)
  - Add some missing type hints to packaging.requirements (issue:350)

* 20.5 - 2020-11-27
  - Officially support Python 3.9 (:issue:`343`)
  - Deprecate the LegacyVersion and LegacySpecifier classes (:issue:`321`)
  - Handle OSError on non-dynamic executables when attempting to resolve the
    glibc version string.
"""

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../{python3-packaging_20.4.bb => python3-packaging_20.8.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-packaging_20.4.bb => python3-packaging_20.8.bb} (71%)

diff --git a/meta/recipes-devtools/python/python3-packaging_20.4.bb b/meta/recipes-devtools/python/python3-packaging_20.8.bb
similarity index 71%
rename from meta/recipes-devtools/python/python3-packaging_20.4.bb
rename to meta/recipes-devtools/python/python3-packaging_20.8.bb
index c75707e69c7..658c3d1f331 100644
--- a/meta/recipes-devtools/python/python3-packaging_20.4.bb
+++ b/meta/recipes-devtools/python/python3-packaging_20.8.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 & BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[md5sum] = "3208229da731c5d8e29d4d8941e75005"
-SRC_URI[sha256sum] = "4357f74f47b9c12db93624a82154e9b120fa8293699949152b22065d556079f8"
+SRC_URI[sha256sum] = "78598185a7008a470d64526a8059de9aaa449238f280fc9eb6b13ba6c4109093"
 
 inherit pypi setuptools3
 
-- 
2.25.0

