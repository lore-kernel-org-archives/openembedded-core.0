Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BDB8C64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 14:46:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.92095.1677509174049330583
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 06:46:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41A97C14;
	Mon, 27 Feb 2023 06:46:56 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A622A3F67D;
	Mon, 27 Feb 2023 06:46:12 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] meta-selftest/files: add ptest to static-passwd/-group
Date: Mon, 27 Feb 2023 14:46:10 +0000
Message-Id: <20230227144610.715330-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 14:46:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177796

As ptest-runner creates a new user, we need to add it to the testing
static passwd file.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-selftest/files/static-group  | 1 +
 meta-selftest/files/static-passwd | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/stati=
c-group
index cbec6f13779..af2fa0f0164 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -25,3 +25,4 @@ weston:x:525:
 wayland:x:526:
 render:x:527:
 sgx:x:528:
+ptest:x:529:
diff --git a/meta-selftest/files/static-passwd b/meta-selftest/files/stat=
ic-passwd
index 2cfd0c9b42e..a4f652198c5 100644
--- a/meta-selftest/files/static-passwd
+++ b/meta-selftest/files/static-passwd
@@ -17,3 +17,4 @@ bind:x:521:521::/:/bin/nologin
 builder:x:522:522::/:/bin/nologin
 _apt:x:523:523::/:/bin/nologin
 weston:x:525:525::/:/bin/nologin
+ptest:x:529:529::/:/bin/nologin
--=20
2.34.1


