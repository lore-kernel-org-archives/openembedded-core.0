Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2856ECD4F54
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 11:18:25 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18208.1779880699469262002
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 04:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cv0wADyG;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: saisneha196@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c8026aa4d53so8430400a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 04:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779880699; x=1780485499; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yrP1iOiTWH05MxGYpUz7ebX1iRjLBXWYg8AUbKQZuw=;
        b=cv0wADyGX6IlB/KpDZ7E1Uy6DnJwHT/J7SYRgcd0mGHiBDGMqg0zcIDbadmN3CgPdA
         FsVUNnQOu/H+T7vrkvcj6oW5Gmy5stGnhcZPZBu0BNQvAqb21n0sQcElKSaZZF6mOGQd
         qp1RdXNBy5bK/D4Yzkl/g1DnprXYbAb9UjByWiKZa0lNxk9xwVNA8Db5vl4tD9achQmW
         nmkUOicjYZN5wC9Dr8peQJ4qck25Wzrqw2JVccEtbNNbH0FvWkQABL/65xpZgj7dtisO
         v776mYxWfOZTEFxqtYKkiqUofF+yBbV4dZWYk0fcKSOjZHM4hx8EDrl2duQfWwjDelY1
         qqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779880699; x=1780485499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1yrP1iOiTWH05MxGYpUz7ebX1iRjLBXWYg8AUbKQZuw=;
        b=GJWGs3jRmSZbRH3GfbyjvrXs6wamPCnOhnkIgmVLMKWwc8nEytORRVA8ciD+CuAsYs
         1TN4e70YJzR4sGNTSdb3Vz3PU0cyho4nVNx0hImcZa8AYrnDfYMSwGKLr9R3/7QGS3Yz
         +8HNR5uIB93ovjYywWwVTLSfvEvVLo4kUOjYk/IcMaheRoc75JUYlPq2SuNZ3TlS4d1z
         M7sE5o9Vacwib/wkYXBzc8rtkyOOg8NfsnBEX6F650iYvzzLHr3T9YZQObJprg7bNXtv
         g93k23eieIv6rZ0yoTscFI9zX1pOcKysNKeiZdMe43/jOV2EfTXlw8XBFcq6DAO+uP5k
         lgig==
X-Gm-Message-State: AOJu0Yxc6WNEaihs0pwbAeT4lwQMO1ghFmNL2+VwSRbOY19I7rJ2rxPC
	07VPDIS8pBlVRsbKElomXj7SoB2igncZg5yq5hzsTJCcfsRXZNigp928J9fd9ybg
X-Gm-Gg: Acq92OFSht6SEhgqZinQKHB6ESRxRCNCQvtEnAI2CWEzHbc8P6RunhQVKdGQsw/7wMW
	IZ56N2ECQXW9CKlvyfkMNpLy+8HbhB6Fx4wXNSmpJYWBZvTfsdzliSd1sv94p59GTLJ115IF3GC
	8pnEeFd0fQaI8NYyNrcJbc6t7j818evkXp0CCPRByVRpPCSyr6EYIcl82beGIerR+DwQCiqi0d8
	KJ9BVY9u11Y/72iGG9kcuYasEPV6OXfRG5relHVYSU7o/6x0jhNEs8tQLLeR1DQ+HxUnIyOjbJb
	C71c9hZHpFWKi9xSCmpq89T6ExBQG3NeCEgj3zrnHJyXUDr8tttVtHhyrW7H3FFYgglGLDIzRgt
	VctPH0dNCPkUWCJNKPl5JWLDCYxUNZDvbysRED93uN8PA1A1bDNfcAQf1NFJWceK3EeKqIQHd5q
	MDcWLnt2jJLqgn6ddjs2dBzlCp2vGQ+bd3ypEup4Isu+h+/T8I800x5ncC
X-Received: by 2002:a17:902:f544:b0:2bc:e628:9cc7 with SMTP id d9443c01a7336-2beb05da027mr251376915ad.24.1779880698764;
        Wed, 27 May 2026 04:18:18 -0700 (PDT)
Received: from BLR1RLPT00004.localdomain ([152.57.21.184])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56b9fabsm192079475ad.23.2026.05.27.04.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 04:18:18 -0700 (PDT)
From: Sai Sneha <saisneha196@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	corentin.guillevic@smile.fr,
	martin@geanix.com,
	paul@pbarker.dev,
	Sai Sneha <saisneha196@gmail.com>
Subject: [PATCH v4 3/4] insane.bbclass: add missing-srcrev QA check for SCM URIs
Date: Wed, 27 May 2026 16:47:55 +0530
Message-Id: <20260527111756.1306022-4-saisneha196@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527111756.1306022-1-saisneha196@gmail.com>
References: <20260527111756.1306022-1-saisneha196@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 11:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237644

Add a proper QA check test_missing_srcrev() in do_recipe_qa that
fires at build time via oe.qa.handle_error(), using the shared
oe.qa.check_uri_srcrev() helper to avoid code duplication.

Severity is controlled per layer:
- WARN_QA:append = " missing-srcrev" for all layers (warning by default)
- ERROR_QA:append:layer-core = " missing-srcrev" for oe-core (strict)

This follows the same pattern as missing-metadata and missing-maintainer
which are warnings globally but errors for oe-core.

Note on CHECKLAYER_REQUIRED_TESTS: missing-srcrev is intentionally
not added to CHECKLAYER_REQUIRED_TESTS because that would promote it
to ERROR_QA for all layers globally during normal builds, contradicting
the layer-specific enforcement requested in Bug 16051 Comment 3.
Instead, yocto-check-layer.bbclass enforces it directly during
checklayer validation runs.

Reported-by: Yoann Congal <yoann.congal@smile.fr>
Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16051
AI-Generated: Developed with assistance from Anthropic Claude
Signed-off-by: Sai Sneha <saisneha196@gmail.com>
---

Changes in v4:
- Refactored to use shared oe.qa.check_uri_srcrev() helper
- Eliminates duplicated URI parsing logic
- Added note explaining why CHECKLAYER_REQUIRED_TESTS is not used

Changes in v3:
- Added AI-Generated disclosure and Reported-by tag

Changes in v2:
- Initial public submission
 meta/classes-global/insane.bbclass | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 04700be71c..1fe426646d 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -49,6 +49,9 @@ ERROR_QA ?= "\
 ERROR_QA:append = " ${@bb.utils.filter('DISTRO_FEATURES', 'usrmerge', d)}"
 WARN_QA:append:layer-core = " missing-metadata missing-maintainer"
 
+WARN_QA:append = " missing-srcrev"
+ERROR_QA:append:layer-core = " missing-srcrev"
+
 FAKEROOT_QA = "host-user-contaminated"
 FAKEROOT_QA[doc] = "QA tests which need to run under fakeroot. If any \
 enabled tests are listed here, the do_package_qa task will run under fakeroot."
@@ -1455,6 +1458,15 @@ python do_qa_unpack() {
 python do_recipe_qa() {
     import re
 
+    def test_missing_srcrev(pn, d):
+        import oe.qa
+        src_uri = (d.getVar('SRC_URI', False) or '').split()
+        for uri in src_uri:
+            rev = oe.qa.check_uri_srcrev(pn, uri, d)
+            if rev is None:
+                oe.qa.handle_error("missing-srcrev",
+                    "%s: SRCREV not set for SCM URI %s" % (pn, uri), d)
+         
     def test_naming(pn, d):
         if pn.endswith("-native") and not bb.data.inherits_class("native", d):
             oe.qa.handle_error("recipe-naming", "Recipe %s appears native but is not, should inherit native" % pn, d)
@@ -1497,6 +1509,7 @@ python do_recipe_qa() {
 
     pn = d.getVar('PN')
     test_naming(pn, d)
+    test_missing_srcrev(pn, d)
     test_missing_metadata(pn, d)
     test_missing_maintainer(pn, d)
     test_srcuri(pn, d)
-- 
2.34.1


