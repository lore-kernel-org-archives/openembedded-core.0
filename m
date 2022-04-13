Return-Path: <kergoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90CCBC43217
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:52 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.198.1649865684106959256
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 09:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NPAYVlnO;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: kergoth@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id i20so3261679wrb.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 09:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UyZ9QRU4lylzlfGMp9hQzvSHx5yNYzuWhnqN533hBNc=;
        b=NPAYVlnO4kNJN/LBzRTVOQRsE0ytKmRsyHsE+yUhIqSLmT+lqERT7/1/SuUggNySHY
         se5LJDgzdCJwVV8F5eRxldCRSg0jHtG5nNAmrQSLENA+Fkw2vCzeLKgNWQix8KEEoCMY
         LjJJiIPQBT/+BnJyqxv/VIP6Xn69iS2QDiAnw9znt4CYBVgbBoAdEOgypfhXwzFDjsgy
         01uuA5vGBWD7YkMlTqaGrjaf/VlANYXZCvEWcO7fs7nkVISSlkNfQtKO99u+ey11oS74
         JAdfkvesI7d69wMSKPOEWc1Xa5B8ESzQurOidx5H9kJ38ZBxghU3PEheiaC6/hZC3f/n
         31jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UyZ9QRU4lylzlfGMp9hQzvSHx5yNYzuWhnqN533hBNc=;
        b=2onakj03f4BX3ZYJa4WhlrJPdg3egijG5UGu3/llQjAqzyA2ZiJFENqqW7cW9m87mw
         5RxYoBjG1r0g8a0i7NzMbFCoRw4l4gsOJqgHmT0DRkKUdVI2N0TdJYdoDuMDhB6qzqvm
         qMEs9BlM4g+hW03AxX24Jf4m8qH8N1FRCOfyRqQJ3Qo1Afe9pOiHF8GoVSAVOUgK+SnJ
         CgzYwSxVNP3DASwT9t3kJSUk/IzOsETpg2yzFSrda/o1XUxSYGA5Tu3Eic9HANneGhyQ
         CypOTWMu4qMXXvgYynJr926IcelPPHXxaCtTS6pHEDyozpx1QscRGecnJi4eMQQM2V2q
         MsOA==
X-Gm-Message-State: AOAM533RF97ygFGAonfkmVui4kiT0P1prvlWUDfLG9K0NvRY7o4ZcWMt
	zn6HKl7UgI/LlnSMZhTMSMGcgf6p9lNMTg==
X-Google-Smtp-Source: 
 ABdhPJyo68b4E6U6Ob4l/AcUps0/BAbOfQvC7pS9nJAUYqv+taO6Y9y3fzQFDgp/Mh36z+pBWj3+zg==
X-Received: by 2002:a05:6000:508:b0:1e4:a027:d147 with SMTP id
 a8-20020a056000050800b001e4a027d147mr33345704wrf.315.1649865682189;
        Wed, 13 Apr 2022 09:01:22 -0700 (PDT)
Received: from ubu18-mel-builder.alm.mentorg.com (nat-lmt.mentorg.com.
 [139.181.28.34])
        by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0038ca453a887sm2905618wmq.19.2022.04.13.09.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 09:01:21 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH v2] license: add 'any_incompatible' function
Date: Wed, 13 Apr 2022 16:00:32 +0000
Message-Id: <20220413160033.8456-1-kergoth@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164337

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

v2 changes: fixed string packages logic, corrected reference to
apply_pkg_license_exception, and avoided use of ${@} in the function docstring
to avoid bitbake expanding it and recursing.

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


