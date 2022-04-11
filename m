Return-Path: <kergoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3BACC63707
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:01 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.31020.1649693659491297094
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 09:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EpBTeyz/;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: kergoth@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id v2so10091393wrv.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 09:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cm2fOCc7tENo24+DUP+Rcqx88qFvw99LsHaAo3hTlu0=;
        b=EpBTeyz/H7qAq5w+HLi+cEDPh0D2zo6rUSi8seuWWn8mwOvx+i3pxAooj6jUFS5455
         7lgs+rzXN4occGYZCc/LLLVKUeBpZMVZUTtFqpgQS42XnfQlpu4yRmzGaL9KCytUqRIo
         Rl7CPqS0K9mkLrqDZwMlPaT/NQZuRW2v/Hwz8bTkDwJlN9x1ojdD2nB4RMXH2ctz2zOt
         pindinAIFCX1IG40ZKs02TvKUVyCo6js4m+IYUgf25dc9CUSjHUWIQO2rleMPOW5uSDg
         /C+5tkIg2vzrAqJF7U43/fcgeSa1mCEsSjFa/tqB6TFyZaghUeF5OYfUreKHb/t7CsDu
         dS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=cm2fOCc7tENo24+DUP+Rcqx88qFvw99LsHaAo3hTlu0=;
        b=VBZDkXLpYFf16R4/YDCYNCVTHh3I+9t1q4AiJ9Lbtu8RCSowh3w7+cCKo2omey/D/m
         lvlFHq6BicgV13sdGu8ffrU+VDBuLQkOmcbUPbq8dV2R7/VoCLlasdRhDPFSY2TfQu+8
         57uyPrhNN+MeJmRYf0mcv1JvABdBlhsOoFLtruByAtPOq4eRkcwQkPLRE9g178USjuue
         VUMQwL51sD9wRtr8N1SB75Cx5/NwD3Urn3MInlQtphIdDA8tVC4Gw2q3PLF9B7227BjF
         lCDzlQLUhYx2CMlkiASNJbZuNKFlCRAuCsHSxuEm2B7m7bvgA17BdJdjebU1PokFFKAg
         spQA==
X-Gm-Message-State: AOAM532A88mxukaZVGZmjt7HVULOHw8cXzVYovggU7PLa7CDRjfnIy7A
	QiXGLok3015GJ5NgriSBvTB/Y7wN2OMBDv44
X-Google-Smtp-Source: 
 ABdhPJxzB/wWJzNwIj9ibynLgkngkKVcFcdn8v6/FCXbnE44WJlsv3ocnKOqtzCA/ja7rh+o4eMW7A==
X-Received: by 2002:a5d:6f10:0:b0:207:aa60:f59f with SMTP id
 ay16-20020a5d6f10000000b00207aa60f59fmr2654319wrb.175.1649693657579;
        Mon, 11 Apr 2022 09:14:17 -0700 (PDT)
Received: from svr-pkl-eng-07.pkl.mentorg.com ([110.93.212.98])
        by smtp.gmail.com with ESMTPSA id
 v8-20020a1cf708000000b0034d7b5f2da0sm18263124wmh.33.2022.04.11.09.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 09:14:16 -0700 (PDT)
Sender: Christopher Larson <kergoth@gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
To: openembedded-core@lists.openembedded.org
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] license: add 'any_incompatible' function
Date: Mon, 11 Apr 2022 21:14:06 +0500
Message-Id: <20220411161406.7792-1-chris_larson@mentor.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164231

This function returns True if any of the specified packages are skipped due to
incompatible license.

License exceptions are obeyed. The user may specify the package's license for
cross-recipe checks.

This allows for additions to packagegroups only for non-incompatible builds. For
example:

    RDEPENDS_${PN} += "${@'dbench' if not any_incompatible(d, 'dbench', 'GPL-3.0-only') else ''}"

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/license.bbclass | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 0c637e966e..db8c3f8584 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -320,6 +320,43 @@ def incompatible_license(d, dont_want_licenses, package=None):
 
     return incompatible_pkg_license(d, dont_want_licenses, license)
 
+def any_incompatible(d, packages, licensestring=None):
+    """Return True if any of the packages are skipped due to incompatible license.
+
+    License exceptions are obeyed. The user may specify the package's license
+    for cross-recipe checks.
+
+    This allows for additions to packagegroups only for non-incompatible builds.
+    For example:
+
+        RDEPENDS_${PN} += "${@'dbench' if not any_incompatible(d, 'dbench', 'GPL-3.0-only') else ''}"
+    """
+    if not isinstance(packages, str):
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
+        remaining_bad_licenses = license.apply_pkg_license_exception(
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
-- 
2.35.1


