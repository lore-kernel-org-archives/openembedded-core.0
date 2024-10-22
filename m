Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B9AD2CE0D
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 17:18:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.24091.1729617509571707610
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 10:18:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBCCD13D5
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 10:18:58 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C7DE03F71E
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 10:18:28 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] oeqa/selftest/rust: remove unused imports or code
Date: Tue, 22 Oct 2024 18:18:26 +0100
Message-Id: <20241022171826.1292640-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241022171826.1292640-1-ross.burton@arm.com>
References: <20241022171826.1292640-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 17:18:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206168

Remove unused imports, or disabling code which has been commented out.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftes=
t/cases/rust.py
index fab6267b155..6cf1d262d5c 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -1,12 +1,11 @@
 # SPDX-License-Identifier: MIT
-import os
 import subprocess
 import time
 from oeqa.core.decorator import OETestTag
 from oeqa.core.decorator.data import skipIfArch
 from oeqa.core.case import OEPTestResultTestCase
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars=
, runqemu, Command
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
 from oeqa.utils.sshcontrol import SSHControl
=20
 def parse_results(filename):
@@ -42,9 +41,6 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OE=
PTestResultTestCase):
=20
     @skipIfArch(['mips', 'mips64'])
     def test_rust(self, *args, **kwargs):
-        # Disable Rust Oe-selftest
-        #self.skipTest("The Rust Oe-selftest is disabled.")
-
         # build remote-test-server before image build
         recipe =3D "rust"
         start_time =3D time.time()
--=20
2.34.1


