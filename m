Return-Path: <kergoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F461C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:52 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.184.1649865685403701710
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 09:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FoPGXUIk;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: kergoth@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id i20so3261791wrb.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 09:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F6R7MatEuW3bqBpssNlVhVLODrfwCPcUjF4aNLKaLx4=;
        b=FoPGXUIkgnJvkMkPPtP9Nj4nY0k4UMC69GJ0X+Mxq8B8mqbXpKJxA+1l79pnsVOtCb
         BhHKyAQ2wz9UJ6TrRIkyMdxIlMVb1aZvCnFBY2PoU9wIgvOd+qFIlU+4GXnt9yra/80Y
         WJEqzd7oE9Dm1j83B7K+okRkJXx+Vs/dW3jz0SZtqpNnBjKtLLUUs2Fq2ELWrSK4VgYB
         y97WwbL81vpGZaxf9cIvdbj4j16BVJIecy634vADHRIZ8JX0z1f4Q3RrERCoOpgijV8q
         SAlZmyUfqe2beJuKYv6m+j2HD8lFJ0ZXB5hbF2JPEFYBneRt+FvpoADXaK71Zt5N52H6
         4f7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F6R7MatEuW3bqBpssNlVhVLODrfwCPcUjF4aNLKaLx4=;
        b=tFFzAz/l7NJLBMWfZKeVzggcAH7VYoa/VtqCTTgPuQzQ8d51v9rqjBJTLoe/i7BEIt
         n1f6BWPDgWT16odWF0R4B4qs5s5hR0/DYENfnq+TKm7oaW261qbblZwN0kYbkYy+1xoD
         Oe6QWtiQp/IhqSK2vpFOgi4Xbi+9RSkFOYOKU3Z2x0rH76BFaShs3BWOWCpJz+WR55TF
         oH+P29T6IUO9oHaJFb4Hn1ueOSi8Yp3TAvW87ABgh0HUCvlJSEyYRWcXPqw/HUVZ0kmP
         nbNKZN0WlCUCksQwxyNEaVykNsEHw/EnCorZRe/OKFPCV5I4XcCfd0iSn3R5GNgnJsWT
         9D8A==
X-Gm-Message-State: AOAM532GeZTOON6iJVZIOV9pcAADn85Cunl8kZ4EvHZoMayc8Kgephj6
	B1OlzByW3nxjwRXkQnUWAfTQzAbygPPDHw==
X-Google-Smtp-Source: 
 ABdhPJwA5AYSIlg6GjXZaS9Go8mFiEKVrlF6JNWtkbKG7Q+idW8I4IeMfAOq/wFqM4OJ8wAzMJDy/g==
X-Received: by 2002:adf:82c1:0:b0:207:9d8b:dd6c with SMTP id
 59-20020adf82c1000000b002079d8bdd6cmr17210051wrc.4.1649865683596;
        Wed, 13 Apr 2022 09:01:23 -0700 (PDT)
Received: from ubu18-mel-builder.alm.mentorg.com (nat-lmt.mentorg.com.
 [139.181.28.34])
        by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0038ca453a887sm2905618wmq.19.2022.04.13.09.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 09:01:23 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] license: add 'any_incompatible' function
Date: Wed, 13 Apr 2022 16:00:33 +0000
Message-Id: <20220413160033.8456-2-kergoth@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220413160033.8456-1-kergoth@gmail.com>
References: <20220413160033.8456-1-kergoth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164338

This function returns True if any of the specified packages are skipped due to
incompatible license.

License exceptions are obeyed. The user may specify the package's license for
cross-recipe checks.

This allows for additions to packagegroups only for non-incompatible builds. For
example:

    RDEPENDS_${PN} += "${@'dbench' if not any_incompatible(d, 'dbench', 'GPL-3.0-only') else ''}"

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/license.bbclass                  | 38 +++++++++++++++++++
 .../packagegroups/packagegroup-base.bb        |  2 +
 2 files changed, 40 insertions(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 0c637e966e..41993b7227 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -320,6 +320,44 @@ def incompatible_license(d, dont_want_licenses, package=None):
 
     return incompatible_pkg_license(d, dont_want_licenses, license)
 
+def any_incompatible(d, packages, licensestring=None):
+    """Return True if any of the packages are skipped due to incompatible license.
+
+    License exceptions are obeyed. The user may specify the package's license
+    for cross-recipe checks.
+
+    This allows for additions to packagegroups only for non-incompatible builds.
+
+    For example: 'dbench' if not any_incompatible(d, 'dbench', 'GPL-3.0-only') else ''
+    """
+    import oe.license
+
+    if isinstance(packages, str):
+        packages = packages.split()
+
+    bad_licenses = (d.getVar("INCOMPATIBLE_LICENSE") or "").split()
+    if not bad_licenses:
+        return False
+    bad_licenses = expand_wildcard_licenses(d, bad_licenses)
+
+    if licensestring is None:
+        licensestring = d.getVar("LICENSE:%s" % package) if package else None
+        if not licensestring:
+            licensestring = d.getVar("LICENSE")
+
+    exceptions = (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") or "").split()
+    for pkg in packages:
+        remaining_bad_licenses = oe.license.apply_pkg_license_exception(
+            pkg, bad_licenses, exceptions
+        )
+
+        incompatible_lic = incompatible_pkg_license(
+            d, remaining_bad_licenses, licensestring
+        )
+        if incompatible_lic:
+            return True
+    return False
+
 def check_license_flags(d):
     """
     This function checks if a recipe has any LICENSE_FLAGS that
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 7489ef61b0..1c97d03c21 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -14,6 +14,8 @@ PACKAGES = ' \
             packagegroup-distro-base \
             packagegroup-machine-base \
             \
+            ${@"dbench" if not any_incompatible(d, "dbench", "GPL-3.0-only") else ""} \
+            \
             ${@bb.utils.contains("MACHINE_FEATURES", "acpi", "packagegroup-base-acpi", "",d)} \
             ${@bb.utils.contains("MACHINE_FEATURES", "alsa", "packagegroup-base-alsa", "", d)} \
             ${@bb.utils.contains("MACHINE_FEATURES", "apm", "packagegroup-base-apm", "", d)} \
-- 
2.34.1


