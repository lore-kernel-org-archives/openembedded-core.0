Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web09.13597.1619796925605753936
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Apr 2021 08:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=J0XXd8/A;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id c17so14114517pfn.6
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Apr 2021 08:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pu9NEN7A1K8VR7rXthkq7xWLe+hYfn+OuCfMrwZ/tCI=;
        b=J0XXd8/AUprj0nqEo1DbMTppFMiZ7vh/7oaC7Jca2hu+8RbK/3qBi+aUaYPppwknEy
         IxLBOEnWU7WqA5aI8rUk6PWQp/ZnGKPGmJltsCy0/pR0BaUE59BC3YiE7boqlvttbbB2
         VGzoKJpguODh0K8fSK/vvO2WYnQU1L4JUjnzmFO4Dzb9pKeiJPXFpKS3l0NR45wkSmEd
         wFwEOWR1vxiF28ETAy87mBOQuCkxu9RHGscBqRHLtSUI8fJcDvwMPq4UEiBfKtiMDxIz
         7fLcUd2B4B3xttzof/pOgvILiqQtd9sHbhgMF7XaOYOfyqM7YX/d+wrzjGCMijLN5Qjx
         ucHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pu9NEN7A1K8VR7rXthkq7xWLe+hYfn+OuCfMrwZ/tCI=;
        b=fjGaN2PnRVGipTk7Js2vAWv7f1CmQMoeaYZDNDcqGsuDqVC/mf+VfhJAQtolNAwDIG
         IrSqdLlVSKlSoiL4E1L3g2iCd6QxrpyT02796OZCHoheMd9P/J+/iHcL+1/NJYdbTvRV
         Tafi367XLLgO3v9gBOG7fW6exp+X6J559QEeleAkj/Ri6W9PsWv2dNr3fiudgWb9DpwQ
         MJhw/qB1NQkJocIS1emt17eHHUHA2MY5xlxLlcdelOXKSxkUxTJE3RwT5iKynnPpEi/0
         1Br+YpIW8an+hBKPcOaYV7W0qa3ipl9KN+Frm6MzCZQ3rmQEIEU9przueBHO4br6aIq+
         IcQA==
X-Gm-Message-State: AOAM533qKrV075/G061QZwLs7ibUs/WrKNKk4onsbAanF2PS1YZiyInp
	rjhefngDjZNZ/iVtFbCks2v1JImYgnasXVp8
X-Google-Smtp-Source: ABdhPJzoO99r5nYKfzm9+onoJ4Th7N2HlqLkm94O1TyUfs0kN8uEvM/r+s4sIqrEZlPMzugo0tzqbQ==
X-Received: by 2002:a63:5004:: with SMTP id e4mr5043336pgb.61.1619796924784;
        Fri, 30 Apr 2021 08:35:24 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id x9sm2900386pfq.197.2021.04.30.08.35.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 08:35:24 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/12] license_image.bbclass: Fix symlink to generic license files
Date: Fri, 30 Apr 2021 05:33:51 -1000
Message-Id: <5a3a9aa0012328b064bcde09b195ccbc8a5c4e50.1619796615.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619796615.git.steve@sakoman.com>
References: <cover.1619796615.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Reto Schneider <reto.schneider@husqvarnagroup.com>

Link to the canonical filename of a license as only this one exists.

Fixes commit 670fe71dd18ea675f35581db4a61fda137f8bf00
[license_image.bbclass: use canonical name for license files].

Signed-off-by: Reto Schneider <reto.schneider@husqvarnagroup.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 64b1ba978e079c345e1f7fbd1bf44052fc3dd857)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/license_image.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index cfb0606da9..1396a95f47 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -145,12 +145,13 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
                             continue
 
                         # Make sure we use only canonical name for the license file
-                        rootfs_license = os.path.join(rootfs_license_dir, "generic_%s" % generic_lic)
+                        generic_lic_file = "generic_%s" % generic_lic
+                        rootfs_license = os.path.join(rootfs_license_dir, generic_lic_file)
                         if not os.path.exists(rootfs_license):
                             oe.path.copyhardlink(pkg_license, rootfs_license)
 
                         if not os.path.exists(pkg_rootfs_license):
-                            os.symlink(os.path.join('..', lic), pkg_rootfs_license)
+                            os.symlink(os.path.join('..', generic_lic_file), pkg_rootfs_license)
                     else:
                         if (oe.license.license_ok(canonical_license(d,
                                 lic), bad_licenses) == False or
-- 
2.25.1

