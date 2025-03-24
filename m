Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AAE3C36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 14:29:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.40824.1742826587948400488
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 07:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B23016F3
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 07:29:53 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CBC6C3F58B
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 07:29:46 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meson: refresh upstreamed patch
Date: Mon, 24 Mar 2025 14:29:42 +0000
Message-ID: <20250324142942.3756014-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 14:29:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213529

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...cies-dev-prepend-sysroot-when-searching-for-.patch | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson/0001-dependencies-dev-prep=
end-sysroot-when-searching-for-.patch b/meta/recipes-devtools/meson/meson=
/0001-dependencies-dev-prepend-sysroot-when-searching-for-.patch
index e4700bc91d4..b6579c824ef 100644
--- a/meta/recipes-devtools/meson/meson/0001-dependencies-dev-prepend-sys=
root-when-searching-for-.patch
+++ b/meta/recipes-devtools/meson/meson/0001-dependencies-dev-prepend-sys=
root-when-searching-for-.patch
@@ -1,4 +1,4 @@
-From 6f33fb67097beeb17e2345aaec3bda4a57b0b138 Mon Sep 17 00:00:00 2001
+From 17117c2732c33ebec39e3fec2ecd5a3515dc7d71 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Wed, 20 Nov 2024 13:09:38 +0000
 Subject: [PATCH] dependencies/dev: prepend sysroot when searching for GT=
est
@@ -10,14 +10,14 @@ sources, not ones that we want to use in the sysroot.
=20
 Closes #12690.
=20
-Upstream-Status: Submitted [https://github.com/mesonbuild/meson/pull/139=
34]
+Upstream-Status: Backport [17117c2732c33ebec39e3fec2ecd5a3515dc7d71]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
  mesonbuild/dependencies/dev.py | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
=20
 diff --git a/mesonbuild/dependencies/dev.py b/mesonbuild/dependencies/de=
v.py
-index 94f51ff69..cceb1756c 100644
+index 2725a7bb4e88..0c8886b81a04 100644
 --- a/mesonbuild/dependencies/dev.py
 +++ b/mesonbuild/dependencies/dev.py
 @@ -56,7 +56,9 @@ class GTestDependencySystem(SystemDependency):
@@ -26,11 +26,8 @@ index 94f51ff69..cceb1756c 100644
          self.main =3D kwargs.get('main', False)
 -        self.src_dirs =3D ['/usr/src/gtest/src', '/usr/src/googletest/g=
oogletest/src']
 +
-+        sysroot =3D environment.properties[self.for_machine].get_sys_ro=
ot() or ""
++        sysroot =3D environment.properties[self.for_machine].get_sys_ro=
ot() or ''
 +        self.src_dirs =3D [sysroot + '/usr/src/gtest/src', sysroot + '/=
usr/src/googletest/googletest/src']
          if not self._add_sub_dependency(threads_factory(environment, se=
lf.for_machine, {})):
              self.is_found =3D False
              return
---=20
-2.34.1
-
--=20
2.43.0


