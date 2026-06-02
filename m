Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB833CD6E66
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 06:30:08 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19007.1780381800391069783
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 23:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DHozkIcT;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: saisneha196@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bf125989f2so32107445ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 23:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780381800; x=1780986600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOu1v7lUDR+e961YSbsy9UmtR1z27yZjJZUbbCQzPN0=;
        b=DHozkIcTVEPTnCbBYSgm44e5kqcc7xYQ3PPDKqT7Nj8DnYmQRJ4L1QSld6sbIgImJC
         IusUIIHqNBka6zjvK2aujSiL2Ce0fqz6zOECx3ehtgBbfiSMphmWHBqzcdDeEVhj+ljQ
         s6EckLL8xKQ5yjOi7gLGcTRClUL7gh/+eN0VZAGGffuntDPllx80zaEp8shEie4KWVhE
         KpsprU7HPtAdJ4kQJSmdorenPqZUk/KP8CzwAx9UCExDaVnPo5KTGgSSX95MH2rszKnG
         7L250SDeY7zd0hHRJIj/dNbjReEq/6Cm6ai7YyYIG97eL7yaURAcW560FHSfh7w8/zh8
         Fsbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780381800; x=1780986600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HOu1v7lUDR+e961YSbsy9UmtR1z27yZjJZUbbCQzPN0=;
        b=pMecyaopwY1K+LApTAzxa0NjilvuOjkAEt3Y8Y9e1PchIAuwu60IhC0bzKy1HlzQDp
         45sc+zuuzUC3TJ+XysxwAlKU/MwJhwOqP4XHEBVtrvTEXEC/WBQIuvQU5D3YbGM7lXJw
         wLhKOHd4lcFSEx9G+KNRYDzgBYnCWSfR4YWSmYC5M1l6IewOyOX86luI5PkexIK6Gah4
         MkaWd1wSrN1TeSYs2osf9CnYNKPjZiThDTQs4FHS2MlDAB2dfDVbXVXj/bLQbwoccdNf
         UhxfCSltLpuXhO8RCrSCZe3NES1brGfepNWHmZIKpLFGCnXXTmMmyTm/GTKeoio3jtSP
         5Ptw==
X-Gm-Message-State: AOJu0Ywer810BTHfyBdMjZqSKwV1ku8FJVSc+Q7yOLtWBdnZG+Qlt81d
	hfgVRrsThC4xe+W+UbHGkQ3WMuPNQP2+tFEofxJGOUTtz5NeQiyHJICnzEtAhJSE
X-Gm-Gg: Acq92OHS5I7qpmKdltbTzHBSmRvMyEHjqiQqhButGow2dWEXdstCUcB+e7ZDWiNtAkf
	9OSaobXRX+x1J7M+VfCtazBR8OPPzeuREuk8kAO5gBfc/7Fp/fzNNlATPvBJd3ZDQ67DLC4noyX
	QkGQ355zYDLavwYsenB3qH/FPYK0e+9sg+rLktMb1oRD8QyrgX0TZDEle/d4gkU3M0VNcqUaVU+
	qHOMiNwU2vy24+eOdYTtbbgR2vkwUqXmSmYrDfjOjEm3fYY1nWhiB527tyHDNI0Hf25uzvKWhJn
	rnvZkWYvlzS7jlelO2uOiYUvZsR/GhcW4uWJVFx8amcC7t4cP5p5n+Au2SSGaQ+aLw2sbwegOuc
	EtUX/JJiSGrXheetQa2AOsYTpl0td4M/83BvbxO+PXYqzreG7O2dkAAlAaZngZ4p7jBbd2isH/J
	2lXU57LtV2iB/rfsYNI6X3z+Mea4r5IwV62Nv09kJ5g7w+EdJ8MD7NiEVMCsjly+mjEH8=
X-Received: by 2002:a17:903:32ce:b0:2c0:c37d:dfc1 with SMTP id d9443c01a7336-2c0c37de0dfmr121172215ad.34.1780381799812;
        Mon, 01 Jun 2026 23:29:59 -0700 (PDT)
Received: from BLR1RLPT00004.localdomain ([152.57.118.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c3f496sm128280255ad.76.2026.06.01.23.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 23:29:59 -0700 (PDT)
From: Sai Sneha <saisneha196@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	corentin.guillevic@smile.fr,
	martin@geanix.com,
	paul@pbarker.dev,
	mathieu.dubois-briand@bootlin.com,
	Sai Sneha <saisneha196@gmail.com>
Subject: [PATCH v5 3/4] insane.bbclass: add missing-srcrev QA check for SCM URIs
Date: Tue,  2 Jun 2026 11:59:39 +0530
Message-Id: <20260602062940.3107241-4-saisneha196@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602062940.3107241-1-saisneha196@gmail.com>
References: <20260602062940.3107241-1-saisneha196@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 06:30:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238003

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

Changes in v5:
- No changes to this patch

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


