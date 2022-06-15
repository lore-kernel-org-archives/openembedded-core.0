Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 164BFCCA494
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:46 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.4448.1655298222032304361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nbaOTn1e;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 0101018167766522-55216ea7-a41c-4189-ac3c-b50eee6e5bcb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Rb+O2S7ZEC5KsxJGgGFcYM3kSIFVjsn4FzrQDL/V9oM=;
	b=nbaOTn1eoUtb+xeAqkyyeen9ifQVJsWUgpffGU+qpKDYrLzaTJSVJwP6fOxXsd26
	wDLa5rFYwYTteRAs340pTcNbIFTvHWqWvsbL7yX0iWlp6qYTJhd0nAUFpbFQFVtOirb
	G82O9OvXA9L8WqS/Darf2fNsWp0U9g/dzouPskEw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Rb+O2S7ZEC5KsxJGgGFcYM3kSIFVjsn4FzrQDL/V9oM=;
	b=cPfWBVdWu25CDCHCFb9HRofoYqTB4wOAIAsMnucUzPqsuhlbEgXwc4Zx4WI0U0Qw
	paSmQD7H7YN7Eq+ZQ322DB8zqv7nbRZ3GPJI8fYoblnTm+SPCYKTGFf3OWfj04xBMfh
	36JtjSXQshjrIBi6Ncaq6Irf8Joz+Ws6q4gwihm8=
Content-Type: multipart/mixed; boundary="===============2354606168188744861=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.3.216.0 SUCCEEDED
Message-ID: 
 <0101018167766522-55216ea7-a41c-4189-ac3c-b50eee6e5bcb-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:41 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166958

--===============2354606168188744861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glslang* to *1.3.216.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glslang-upgrade-1.3.211.0-1.3.216.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2354606168188744861==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.3.211.0-1.3.216.0.patch"

From 79afabe1e88db8706d46e7f5283e8c6bad87bafb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jun 2022 11:04:36 +0000
Subject: [PATCH] glslang: upgrade 1.3.211.0 -> 1.3.216.0

---
 .../glslang/{glslang_1.3.211.0.bb => glslang_1.3.216.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.211.0.bb => glslang_1.3.216.0.bb} (95%)

diff --git a/meta/recipes-graphics/glslang/glslang_1.3.211.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.216.0.bb
similarity index 95%
rename from meta/recipes-graphics/glslang/glslang_1.3.211.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.216.0.bb
index 37dea07a8a..69d9a0a84e 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.211.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.216.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "9bb8cfffb0eed010e07132282c41d73064a7a609"
+SRCREV = "adbf0d3106b26daa237b10b9bf72b1af7c31092d"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=master \
            file://0001-generate-glslang-pkg-config.patch"
 PE = "1"
-- 
2.31.1


--===============2354606168188744861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/glslang/glslang-dbg: PV changed from "1.3.211.0" to "1.3.216.0"
packages/core2-32-poky-linux/glslang/glslang-dbg: PKGSIZE changed from 69490164 to 69602780 (+0%)
packages/core2-32-poky-linux/glslang/glslang-dbg: FILELIST: removed "/usr/lib/.debug/libglslang.so.11.9.0", added "/usr/lib/.debug/libglslang.so.11.10.0"
packages/core2-32-poky-linux/glslang/glslang-dbg: PKGV changed from 1.3.211.0 [default] to 1.3.216.0 [default]
packages/core2-32-poky-linux/glslang/glslang-dev: PV changed from "1.3.211.0" to "1.3.216.0"
packages/core2-32-poky-linux/glslang/glslang-dev: PKGSIZE changed from 989731 to 991557 (+0%)
packages/core2-32-poky-linux/glslang/glslang-dev: PKGV changed from 1.3.211.0 [default] to 1.3.216.0 [default]
packages/core2-32-poky-linux/glslang/glslang-doc: PV changed from "1.3.211.0" to "1.3.216.0"
packages/core2-32-poky-linux/glslang/glslang-doc: PKGV changed from 1.3.211.0 [default] to 1.3.216.0 [default]
packages/core2-32-poky-linux/glslang/glslang-locale: PV changed from "1.3.211.0" to "1.3.216.0"
packages/core2-32-poky-linux/glslang/glslang-locale: PKGV changed from 1.3.211.0 [default] to 1.3.216.0 [default]
packages/core2-32-poky-linux/glslang/glslang-src: PV changed from "1.3.211.0" to "1.3.216.0"
packages/core2-32-poky-linux/glslang/glslang-src: PKGSIZE changed from 4588306 to 4596736 (+0%)
packages/core2-32-poky-linux/glslang/glslang-src: PKGV changed from 1.3.211.0 [default] to 1.3.216.0 [default]
packages/core2-32-poky-linux/glslang/glslang-staticdev: PV changed from "1.3.211.0" to "1.3.216.0"
packages/core2-32-poky-linux/glslang/glslang-staticdev: PKGSIZE changed from 42098 to 42146 (+0%)
packages/core2-32-poky-linux/glslang/glslang-staticdev: PKGV changed from 1.3.211.0 [default] to 1.3.216.0 [default]
packages/core2-32-poky-linux/glslang/glslang: PV changed from "1.3.211.0" to "1.3.216.0"
packages/core2-32-poky-linux/glslang/glslang: PKGSIZE changed from 6281008 to 6276913 (-0%)
packages/core2-32-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang.so.11.9.0", added "/usr/lib/libglslang.so.11.10.0"
packages/core2-32-poky-linux/glslang/glslang: PKGV changed from 1.3.211.0 [default] to 1.3.216.0 [default]
packages/core2-32-poky-linux/glslang: PV changed from "1.3.211.0" to "1.3.216.0"
packages/core2-32-poky-linux/glslang: PKGV changed from 1.3.211.0 [default] to 1.3.216.0 [default]
Changes to packages/core2-32-poky-linux/glslang (sysroot):
  /usr/lib/libglslang.so.11 changed symlink target from libglslang.so.11.9.0 to libglslang.so.11.10.0
  /usr/lib/libglslang.so.11.10.0 was added
  /usr/lib/libglslang.so.11.9.0 was removed

--===============2354606168188744861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang.so.11.9.0", added "/usr/lib/libglslang.so.11.10.0"
Changes to packages/core2-32-poky-linux/glslang (sysroot):
  /usr/lib/libglslang.so.11 changed symlink target from libglslang.so.11.9.0 to libglslang.so.11.10.0
  /usr/lib/libglslang.so.11.10.0 was added
  /usr/lib/libglslang.so.11.9.0 was removed

--===============2354606168188744861==--

