Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5FFC624D5
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 17:19:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8.1788283153856651629
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 10:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Lk0R798C;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 939DF1756
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Sep 2026 10:19:09 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E3B3B3F7D8
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Sep 2026 10:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788283153; bh=QG5yWORpumSlGxzidUZhEieVbDDe835tqo8fvQ9TU2g=;
	h=From:To:Subject:Date:From;
	b=Lk0R798Clq9vZ5h+amuafnVsFy9TkCOQM+u86hmc61H8UOr5+KDjtdNhDFyOfyMJ2
	 Lv9L1QWrxHWW8cgGVsmZ7cS6eSScHNVaoMDIy30cV75X3EfrIszQEevkdlLsDb49RH
	 A7zZVCvH9v8JgndkSo2faflgvSSp0R9Im/mBEum8=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] mesa: remove obsolete build dependencies
Date: Tue,  1 Sep 2026 18:19:03 +0100
Message-ID: <20260901171904.2579721-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 17:19:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244837

The use of makedepend was removed upstream in 2012[1].

The use of chrpath was removed from the recipe in 2023[1].

[1] mesa 424f2008814 ("Remove checking for makedepend")
[2] oe-core 067e131b218 ("mesa: do not strip rpaths from dri drivers")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 7a3e0a26c61..2179f1a6a0e 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -44,8 +44,7 @@ do_install:append() {
 }
=20
 # All dependencies **MUST** be -native. If not, then add a PACKAGECONFIG=
 for it.
-DEPENDS =3D "makedepend-native flex-native bison-native chrpath-replacem=
ent-native python3-mako-native gettext-native python3-pyyaml-native"
-EXTRANATIVEPATH +=3D "chrpath-native"
+DEPENDS =3D "flex-native bison-native python3-mako-native gettext-native=
 python3-pyyaml-native"
=20
 inherit meson pkgconfig python3native gettext features_check rust
=20
--=20
2.43.0


