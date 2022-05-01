Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4503DC47090
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:12 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web08.2327.1651434544140412208
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Snh5alPV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 01010180812b590c-b336a19b-c304-4225-b175-332f7aeafecb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434543;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8VpwJ3cb/H5s9rnKFShJQwOxhGehF9PIVeXYYCszAOI=;
	b=Snh5alPVPr84oQ02QvHY1WYGKLACI0Xjhj+2H3E2hixyJPwKHqwYyfapqMzYIib8
	dTHHcAcDx/GI2D4elkbI+KH+Gf/tlqGcREY4veIvgZWTS+oJ/10uIzhQ83keOw0UZH0
	MUGnCAOcsEZtZxNg4sTCUno8fgu6vnqfJxrDc1U8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434543;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8VpwJ3cb/H5s9rnKFShJQwOxhGehF9PIVeXYYCszAOI=;
	b=hlXYgZV/UJMDc27VHAt8oqo/wjsgKxJOLa9W6+tAgWruTcFPkHHFWfOhCfr+LJvV
	muopgJdCv282owgbaC1yoX8pKb+SN0/UmyJ6ECP1NEIw7pZHNw5Gzg69ppSbnnfDifY
	02N81JCILzoYDVvyfnIn1SEgxqFh82VK78xkRZc8=
Content-Type: multipart/mixed; boundary="===============1742300748471011174=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.3.211.0 SUCCEEDED
Message-ID: 
 <01010180812b590c-b336a19b-c304-4225-b175-332f7aeafecb-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:03 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165134

--===============1742300748471011174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glslang* to *1.3.211.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glslang-upgrade-1.3.204.1-1.3.211.0.patch
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
--===============1742300748471011174==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.3.204.1-1.3.211.0.patch"

From ed41cd55d5a4fcfc2119ab34dbdf9abc5516a76b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 14:20:30 +0000
Subject: [PATCH] glslang: upgrade 1.3.204.1 -> 1.3.211.0

---
 .../glslang/{glslang_1.3.204.1.bb => glslang_1.3.211.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.204.1.bb => glslang_1.3.211.0.bb} (95%)

diff --git a/meta/recipes-graphics/glslang/glslang_1.3.204.1.bb b/meta/recipes-graphics/glslang/glslang_1.3.211.0.bb
similarity index 95%
rename from meta/recipes-graphics/glslang/glslang_1.3.204.1.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.211.0.bb
index 2af406212f..37dea07a8a 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.204.1.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.211.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "2742e959347ae2fac58acd0d022c92a0ff1f24bf"
+SRCREV = "9bb8cfffb0eed010e07132282c41d73064a7a609"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=master \
            file://0001-generate-glslang-pkg-config.patch"
 PE = "1"
-- 
2.27.0


--===============1742300748471011174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang.so.11.8.0", added "/usr/lib/libglslang.so.11.9.0"
Changes to packages/core2-32-poky-linux/glslang (sysroot):
  /usr/lib/libglslang.so.11 changed symlink target from libglslang.so.11.8.0 to libglslang.so.11.9.0
  /usr/lib/libglslang.so.11.8.0 moved to /usr/lib/libglslang.so.11.9.0

--===============1742300748471011174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/glslang/glslang-dbg: PKGSIZE changed from 69930304 to 69926892 (-0%)
packages/core2-32-poky-linux/glslang/glslang-dbg: PKGV changed from 1.3.204.1 [default] to 1.3.211.0 [default]
packages/core2-32-poky-linux/glslang/glslang-dbg: FILELIST: removed "/usr/lib/.debug/libglslang.so.11.8.0", added "/usr/lib/.debug/libglslang.so.11.9.0"
packages/core2-32-poky-linux/glslang/glslang-dbg: PV changed from "1.3.204.1" to "1.3.211.0"
packages/core2-32-poky-linux/glslang/glslang-dev: PKGSIZE changed from 988900 to 989731 (+0%)
packages/core2-32-poky-linux/glslang/glslang-dev: PKGV changed from 1.3.204.1 [default] to 1.3.211.0 [default]
packages/core2-32-poky-linux/glslang/glslang-dev: PV changed from "1.3.204.1" to "1.3.211.0"
packages/core2-32-poky-linux/glslang/glslang-doc: PKGV changed from 1.3.204.1 [default] to 1.3.211.0 [default]
packages/core2-32-poky-linux/glslang/glslang-doc: PV changed from "1.3.204.1" to "1.3.211.0"
packages/core2-32-poky-linux/glslang/glslang-locale: PKGV changed from 1.3.204.1 [default] to 1.3.211.0 [default]
packages/core2-32-poky-linux/glslang/glslang-locale: PV changed from "1.3.204.1" to "1.3.211.0"
packages/core2-32-poky-linux/glslang/glslang-src: PKGSIZE changed from 4581755 to 4588306 (+0%)
packages/core2-32-poky-linux/glslang/glslang-src: PKGV changed from 1.3.204.1 [default] to 1.3.211.0 [default]
packages/core2-32-poky-linux/glslang/glslang-src: PV changed from "1.3.204.1" to "1.3.211.0"
packages/core2-32-poky-linux/glslang/glslang-staticdev: PKGSIZE changed from 42310 to 42302 (-0%)
packages/core2-32-poky-linux/glslang/glslang-staticdev: PKGV changed from 1.3.204.1 [default] to 1.3.211.0 [default]
packages/core2-32-poky-linux/glslang/glslang-staticdev: PV changed from "1.3.204.1" to "1.3.211.0"
packages/core2-32-poky-linux/glslang/glslang: PKGV changed from 1.3.204.1 [default] to 1.3.211.0 [default]
packages/core2-32-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang.so.11.8.0", added "/usr/lib/libglslang.so.11.9.0"
packages/core2-32-poky-linux/glslang/glslang: PV changed from "1.3.204.1" to "1.3.211.0"
packages/core2-32-poky-linux/glslang: PKGV changed from 1.3.204.1 [default] to 1.3.211.0 [default]
packages/core2-32-poky-linux/glslang: PV changed from "1.3.204.1" to "1.3.211.0"
Changes to packages/core2-32-poky-linux/glslang (sysroot):
  /usr/lib/libglslang.so.11 changed symlink target from libglslang.so.11.8.0 to libglslang.so.11.9.0
  /usr/lib/libglslang.so.11.8.0 moved to /usr/lib/libglslang.so.11.9.0

--===============1742300748471011174==--

