Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297AAEE20AF
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 14:57:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13122.1770389838922837619
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 06:57:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15E07339
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Feb 2026 06:57:12 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 19DB63F778
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Feb 2026 06:57:17 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] oeqa/selftest/reproducible: clean up formatting in a long command line
Date: Fri,  6 Feb 2026 14:57:13 +0000
Message-ID: <20260206145716.1615377-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 14:57:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230623

No code changes, just formatting.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa=
/selftest/cases/reproducible.py
index f06027cb03..bad17cc40b 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -98,11 +98,15 @@ def compare_file(reference, test, diffutils_sysroot):
     return result
=20
 def run_diffoscope(a_dir, b_dir, html_dir, max_report_size=3D0, max_diff=
_block_lines=3D1024, max_diff_block_lines_saved=3D0, **kwargs):
-    return runCmd(['diffoscope', '--no-default-limits', '--max-report-si=
ze', str(max_report_size),
-                   '--max-diff-block-lines-saved', str(max_diff_block_li=
nes_saved),
-                   '--max-diff-block-lines', str(max_diff_block_lines),
-                   '--exclude-directory-metadata', 'yes', '--html-dir', =
html_dir, a_dir, b_dir],
-                **kwargs)
+    cmd =3D ['diffoscope',
+           '--no-default-limits',
+           '--max-report-size', str(max_report_size),
+           '--max-diff-block-lines-saved', str(max_diff_block_lines_save=
d),
+           '--max-diff-block-lines', str(max_diff_block_lines),
+           '--exclude-directory-metadata', 'yes',
+           '--html-dir', html_dir,
+           a_dir, b_dir]
+    return runCmd(cmd, **kwargs)
=20
 class DiffoscopeTests(OESelftestTestCase):
     diffoscope_test_files =3D os.path.join(os.path.dirname(os.path.abspa=
th(__file__)), "diffoscope")
--=20
2.43.0


