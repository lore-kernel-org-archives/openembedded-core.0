Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F52F4BB99
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 07:49:50 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40953.1772005787373081185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 23:49:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NHw/DADO;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-895341058b1so79819266d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 23:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772005786; x=1772610586; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=urEbFpkgRI1cNbJAnGj5q8T9An/Dkr/bVmu3Z+yvSCQ=;
        b=NHw/DADOlwuHuiz3jXVzjrdb3NR224NR+wAWGqPO/9ERlVWBlmk0n48o5agZo+Z43d
         Ojtxvv1FD/nq5WPBd1S+LsYcix8ivxSy24trWWYPM8Rmd8PxvbfNyvdxYgCnXHuRHAL2
         KoXD1EpOnkscsf9SZIQuqPNcKtobknuEeNsScNq5ZjLFXB0XTL2iVx75PEdeZom8p8UX
         37bpr2rW4gONlEYlBnnOos6iKId7psJWHqEYRkYFcxlYewvrKURPjg8ZMgCKx7nbYSn9
         VqD1HhfDebx7LSbPUcbeF9NlzIih7w/BZxPNTQ70bzUKkUNub8+PXf7OPN6oaFiMm7np
         iNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772005786; x=1772610586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=urEbFpkgRI1cNbJAnGj5q8T9An/Dkr/bVmu3Z+yvSCQ=;
        b=FIoz++IiWhzDN1iIUVxkGNBL+mJYfc9bN/0leU3Dr7bjeLGuu+lZW0J5kLe23UuHxV
         XJ7e5xTMjOppzIb3HxWSknmM55DFsECf+pedd7wd9lD7CmOJLnpR8gmHt6goSC2yFv7T
         LEYUp1whaaN8DG7Fo8O03PPcWMG8kLrYc8L5fqHreWjR597My92ioEiC+X5rgygUp/tj
         GPcIQAFQYlKSHIkBUEtUY1h+eYVYm24qaVfEUb72MLn0aCEtUlcThyuC7X0gl2oypNN7
         7CwSvfuCErBrLhXt7bOpsfq2Yh96GVe15qUThUJwEqGFdI6ZBvRZxVRBru67gbP+yL5c
         SddQ==
X-Gm-Message-State: AOJu0Yw+w+/n3GRtLQ9tG2lMCBsPOST3sRbbgUk8tuivo4tYgCz45oEE
	VnaUdW9BrSIaotBPGIaiPdsM+VbDuKhTZv4ngEZGJvQiAhRZo0Wvnre4+uze8nJE
X-Gm-Gg: ATEYQzwpd3pAezR9XRrjk5JAkDnRLUgW7Uxq0aeCM/3NJiRCZQi/0NrF8zar0GRv8Ib
	21aZGwYa7jqNrfqXZ7Jbo4EYIP1ShOYAKSnwsBR5U32m1rSuWTrvtWOzBGwvfd1eNsiBuzLH3pW
	Tcdd2jcaK8NGkxxnEh7CCPh6eu4URVd7buv/EtAP7o2CIj28yBlDt0cph2jVQ/l6XfQO36S68hE
	vcijsUh+D/RcaAA+Y7sx3LGVVSdQorYOtRC2F8uWJ76cTRfTZDLF4hYAgifse72vD0c5I8sok8Y
	eBKbOSk3voAOn2xtcF1+VLojWfgMYa6TumMXjljWsBLsDCYSnbuumJuDxQv2xFEqtr0VaUNMez2
	wzLUr+dU4GKoEaKztdaUUa0C9F3GHIK9f94tSfSITZsk6itlwhCf5mpzsv5sKa56G4Qf8JD115S
	oQ3GYjyHm9GrV9Xr5+uQh5EKJgirYuMgX+wIQ21tT8wHUq0kx8D84J/x5N+8JyzGrCmZcIA0V/3
	tfn
X-Received: by 2002:ad4:5c49:0:b0:896:fb19:97fc with SMTP id 6a1803df08f44-899b8c84e63mr16211166d6.62.1772005785783;
        Tue, 24 Feb 2026 23:49:45 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8d0614fbsm1390089785a.17.2026.02.24.23.49.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:49:45 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v6 5/9] oe-selftest/cases/wic.py: update WicTestCase
Date: Wed, 25 Feb 2026 02:49:27 -0500
Message-ID: <20260225074931.1661345-6-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260225074931.1661345-1-twoerner@gmail.com>
References: <20260225074931.1661345-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 07:49:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231933

The wic oe-selftest defines its own class, WicTestCase, for handling
setup, teardown, and other pieces needed to run the individual wic
oe-selftests. Now that wic is a tool external to oe-core, it, and the
tools on which it depends, need to be built natively before the test
can be run, need to be made available to the tests, and need to remain
available while the test is running.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v6:
- none

changes in v5:
- rebase with master
- split back out into smaller patches

v4: skipped to align/combine with other patch set

changes in v3:
- squashed into 1 large patch

changes in v2:
- none
---
 meta/lib/oeqa/selftest/cases/wic.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 7ad61fa700f7..e9c28baf51eb 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -57,12 +57,22 @@ class WicTestCase(OESelftestTestCase):
 
     image_is_ready = False
     wicenv_cache = {}
+    oldpath = ""
+    envfile = ""
 
     def setUpLocal(self):
         """This code is executed before each test method."""
         self.resultdir = os.path.join(self.builddir, "wic-tmp")
         super(WicTestCase, self).setUpLocal()
 
+        config = 'DEPENDS:pn-core-image-minimal += " %s"' % get_bb_var("DEPENDS", "wic-tools")
+        self.append_config(config)
+        bitbake('wic-tools core-image-minimal core-image-minimal-mtdutils')
+        WicTestCase.oldpath = os.environ['PATH']
+        os.environ['PATH'] = get_bb_var("PATH", "wic-tools") + ":" + os.environ['PATH']
+        image = 'core-image-minimal'
+        WicTestCase.envfile = os.path.join(self._get_image_env_path(image), image) + '.env'
+
         # Do this here instead of in setUpClass as the base setUp does some
         # clean up which can result in the native tools built earlier in
         # setUpClass being unavailable.
@@ -78,6 +88,7 @@ class WicTestCase(OESelftestTestCase):
         """Remove resultdir as it may contain images."""
         rmtree(self.resultdir, ignore_errors=True)
         super(WicTestCase, self).tearDownLocal()
+        os.environ['PATH'] = WicTestCase.oldpath
 
     def _get_image_env_path(self, image):
         """Generate and obtain the path to <image>.env"""
-- 
2.51.0


