Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BDDC2BBED
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:54 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web08.939.1657900668113600539
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=J9wIFUaT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 01010182029490f7-871bceb1-57b7-41f6-857e-9e1049ea774b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=v7WpM0+07FcKNS33khIKPIIH96eG+S5rlhPqZfEsyfM=;
	b=J9wIFUaTq6mbOcVE4UwlElP3VJ0tdZAthaN+gvT2Is4NosXqhC57bgWRia2LR6YH
	IQDZLvSYtY0V05I7C0cGM+jHPLyxnb/EZ5Iap3UNvospj4KFmeWRavXDQ1rZLDD/8Af
	A07snBqd4Z+Ebap4wo6L58FRW7pkEoKaCT39a1Fw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=v7WpM0+07FcKNS33khIKPIIH96eG+S5rlhPqZfEsyfM=;
	b=aencn7A3CwVqaskRuPTCgfZFOGYHhw/JpfHRICqHvGk+vRVIdTMvUzLj8LZ689VO
	j8Z6nRcARrFfARpIEPxE+ja8drV9RDqBJrWA+9FuFILtvx5M59Ho0kYw0qcQiTNH2FY
	Cj0jsv4yEp0YOMKVZnIUMh4TMgVTjjZ0OorKlqLA=
Content-Type: multipart/mixed; boundary="===============4696220126794091920=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 0.63.0 SUCCEEDED
Message-ID: 
 <01010182029490f7-871bceb1-57b7-41f6-857e-9e1049ea774b-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168077

--===============4696220126794091920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *meson* to *0.63.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-0.62.2-0.63.0.patch
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
--===============4696220126794091920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases/download/0.62.2/meson-0.62.2.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://disable-rpath-handling.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch file://0001-is_debianlike-always-return-False.patch file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch" to "https://github.com/mesonbuild/meson/releases/download/0.63.0/meson-0.63.0.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://disable-rpath-handling.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch file://0001-is_debianlike-always-return-False.patch file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch"
packages/core2-32-poky-linux/meson: PKGV changed from 0.62.2 [default] to 0.63.0 [default]
packages/core2-32-poky-linux/meson: PV changed from "0.62.2" to "0.63.0"
packages/core2-32-poky-linux/meson/meson-dbg: PKGV changed from 0.62.2 [default] to 0.63.0 [default]
packages/core2-32-poky-linux/meson/meson-dbg: PV changed from "0.62.2" to "0.63.0"
packages/core2-32-poky-linux/meson/meson-dev: PKGV changed from 0.62.2 [default] to 0.63.0 [default]
packages/core2-32-poky-linux/meson/meson-dev: PV changed from "0.62.2" to "0.63.0"
packages/core2-32-poky-linux/meson/meson-doc: PKGV changed from 0.62.2 [default] to 0.63.0 [default]
packages/core2-32-poky-linux/meson/meson-doc: PV changed from "0.62.2" to "0.63.0"
packages/core2-32-poky-linux/meson/meson-doc: PKGSIZE changed from 5340 to 5341 (+0%)
packages/core2-32-poky-linux/meson/meson-locale: PKGV changed from 0.62.2 [default] to 0.63.0 [default]
packages/core2-32-poky-linux/meson/meson-locale: PV changed from "0.62.2" to "0.63.0"
packages/core2-32-poky-linux/meson/meson-src: PKGV changed from 0.62.2 [default] to 0.63.0 [default]
packages/core2-32-poky-linux/meson/meson-src: PV changed from "0.62.2" to "0.63.0"
packages/core2-32-poky-linux/meson/meson-staticdev: PKGV changed from 0.62.2 [default] to 0.63.0 [default]
packages/core2-32-poky-linux/meson/meson-staticdev: PV changed from "0.62.2" to "0.63.0"
packages/core2-32-poky-linux/meson/meson: PKGV changed from 0.62.2 [default] to 0.63.0 [default]
packages/core2-32-poky-linux/meson/meson: PV changed from "0.62.2" to "0.63.0"
packages/core2-32-poky-linux/meson/meson: PKGSIZE changed from 5571742 to 5656824 (+2%)
Changes to packages/core2-32-poky-linux/meson (sysroot):
  /usr/lib/python3.10/site-packages/meson-0.62.2.dist-info moved to /usr/lib/python3.10/site-packages/meson-0.63.0.dist-info

--===============4696220126794091920==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-meson-upgrade-0.62.2-0.63.0.patch"

From 25c7458d4c8e1c9a2a1f57bfdfa82e0ed7a5344b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Jul 2022 07:41:55 +0000
Subject: [PATCH] meson: upgrade 0.62.2 -> 0.63.0

---
 .../recipes-devtools/meson/{meson_0.62.2.bb => meson_0.63.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/meson/{meson_0.62.2.bb => meson_0.63.0.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson_0.62.2.bb b/meta/recipes-devtools/meson/meson_0.63.0.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_0.62.2.bb
rename to meta/recipes-devtools/meson/meson_0.63.0.bb
index acfc64fd4f..42e64e351f 100644
--- a/meta/recipes-devtools/meson/meson_0.62.2.bb
+++ b/meta/recipes-devtools/meson/meson_0.63.0.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0001-is_debianlike-always-return-False.patch \
            file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch \
            "
-SRC_URI[sha256sum] = "a7669e4c4110b06b743d57cc5d6432591a6677ef2402139fe4f3d42ac13380b0"
+SRC_URI[sha256sum] = "3b51d451744c2bc71838524ec8d96cd4f8c4793d5b8d5d0d0a9c8a4f7c94cd6f"
 
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.31.1


--===============4696220126794091920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/meson (sysroot):
  /usr/lib/python3.10/site-packages/meson-0.62.2.dist-info moved to /usr/lib/python3.10/site-packages/meson-0.63.0.dist-info

--===============4696220126794091920==--

