Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC11C56205
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 16:27:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23335.1786033657231887198
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 09:27:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=jpV2sRkH;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FB0016F2
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Aug 2026 09:27:32 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 350343F9A2
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Aug 2026 09:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786033656; bh=GUV8VeeJCLG2XktGR8POLqEKiShYTyl4OZ99lzEh+YM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jpV2sRkH0H7x0IJSPTHIVG+GZDZZQ6JFE/lpOAMIU3KvLY6Jtx0fNiM7vULcC9dmJ
	 n071Yq76TIn9fPdyqC14hG2jH+lgw/QHweLSWPXmDRV3AKPt3YNQrOunnACSL1oMA8
	 7bRBr8aEhMbjmsZp/dBSZsBRYMQKHAO3S0017bQ0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] glibc: update patch status
Date: Thu,  6 Aug 2026 17:27:29 +0100
Message-ID: <20260806162730.352060-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806162730.352060-1-ross.burton@arm.com>
References: <20260806162730.352060-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 16:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242958

Update the patch status of some submitted patches.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../0008-yes-within-the-path-sets-wrong-config-variables.patch  | 2 +-
 ...6-Replace-echo-with-printf-builtin-in-nscd-init-script.patch | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc/0008-yes-within-the-path-sets-=
wrong-config-variables.patch b/meta/recipes-core/glibc/glibc/0008-yes-wit=
hin-the-path-sets-wrong-config-variables.patch
index 91968abb8ce..bc6228ee7fd 100644
--- a/meta/recipes-core/glibc/glibc/0008-yes-within-the-path-sets-wrong-c=
onfig-variables.patch
+++ b/meta/recipes-core/glibc/glibc/0008-yes-within-the-path-sets-wrong-c=
onfig-variables.patch
@@ -9,7 +9,7 @@ false-positive matches with the path it is configured int=
o.
=20
 The change is to use a more elaborated string to grep for.
=20
-Upstream-Status: Submitted [libc-alpha@sourceware.org]
+Upstream-Status: Submitted [https://inbox.sourceware.org/libc-alpha/1425=
394379-41448-1-git-send-email-benjamin.esquivel@linux.intel.com/]
=20
 Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
diff --git a/meta/recipes-core/glibc/glibc/0016-Replace-echo-with-printf-=
builtin-in-nscd-init-script.patch b/meta/recipes-core/glibc/glibc/0016-Re=
place-echo-with-printf-builtin-in-nscd-init-script.patch
index fafcb74d68a..4b468a4633d 100644
--- a/meta/recipes-core/glibc/glibc/0016-Replace-echo-with-printf-builtin=
-in-nscd-init-script.patch
+++ b/meta/recipes-core/glibc/glibc/0016-Replace-echo-with-printf-builtin=
-in-nscd-init-script.patch
@@ -8,7 +8,7 @@ since it uses bash specific extentions namely (translated=
 strings)
 and echo -n command, replace echo with printf and
 switch the shell interpreter to #!/bin/sh.
=20
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://inbox.sourceware.org/libc-alpha/2026=
0806135239.1656089-1-ross.burton@arm.com/T/#u]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
--=20
2.43.0


