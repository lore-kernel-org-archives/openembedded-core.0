Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77EBBC2BBF1
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:54 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web08.938.1657900667833978007
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LhkwepqR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 01010182029490c4-2f97869f-ecd0-4f65-b219-dbb452126eb7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900667;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=0wh63m4qDfEVJBNQ6QCL8VvaMOov+pTjeJr/D/uBRcI=;
	b=LhkwepqR8JsWbji2dh0ImZw27LCeGgImiyQdPs0+LAZRNBD/KTNkbMM06O/Wkvi1
	0JdldKOHhmwWxRWpGOLyG3PYq8M8sBP+XptFLvVKV/egCVRdy+a8Xh1ORmFPuBPtnu0
	PhchMz4obwElygwjV9D/QheWJB9xUNFqPXzs1GlE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900667;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=0wh63m4qDfEVJBNQ6QCL8VvaMOov+pTjeJr/D/uBRcI=;
	b=HwIEO4Aj+0mX/wqg5D7EFjho8L9BAWYjYRv5WfMnDGu0EiTXXgHGurDiPFj+bCR9
	tu62C3z9ZOD+gUrnlW+ieuCsa4iYwvuIB0XV0oknDBbeSEicMplXoy2ZkM6Sug1MiIL
	9UCfSLn8bv2aBzJMWSMXDdQKoUu3LwkWqT5sIS3M=
Content-Type: multipart/mixed; boundary="===============1596059530646523570=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] log4cplus: upgrading to 2.0.8 SUCCEEDED
Message-ID: 
 <01010182029490c4-2f97869f-ecd0-4f65-b219-dbb452126eb7-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168070

--===============1596059530646523570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *log4cplus* to *2.0.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-log4cplus-upgrade-2.0.7-2.0.8.patch
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
--===============1596059530646523570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/log4cplus: PKGV changed from 2.0.7 [default] to 2.0.8 [default]
packages/core2-32-poky-linux/log4cplus: PV changed from "2.0.7" to "2.0.8"
packages/core2-32-poky-linux/log4cplus: SRC_URI changed from "https://downloads.sourceforge.net/project/log4cplus/log4cplus-stable/2.0.7/log4cplus-2.0.7.tar.gz" to "https://downloads.sourceforge.net/project/log4cplus/log4cplus-stable/2.0.8/log4cplus-2.0.8.tar.gz"
packages/core2-32-poky-linux/log4cplus/log4cplus-dbg: FILELIST: removed "/usr/lib/.debug/liblog4cplus-2.0.so.3.4.6 /usr/lib/.debug/liblog4cplusU-2.0.so.3.4.6", added "/usr/lib/.debug/liblog4cplus-2.0.so.3.4.7 /usr/lib/.debug/liblog4cplusU-2.0.so.3.4.7"
packages/core2-32-poky-linux/log4cplus/log4cplus-dbg: PKGV changed from 2.0.7 [default] to 2.0.8 [default]
packages/core2-32-poky-linux/log4cplus/log4cplus-dbg: PKGSIZE changed from 15050528 to 15067208 (+0%)
packages/core2-32-poky-linux/log4cplus/log4cplus-dbg: PV changed from "2.0.7" to "2.0.8"
packages/core2-32-poky-linux/log4cplus/log4cplus-dev: PKGV changed from 2.0.7 [default] to 2.0.8 [default]
packages/core2-32-poky-linux/log4cplus/log4cplus-dev: PV changed from "2.0.7" to "2.0.8"
packages/core2-32-poky-linux/log4cplus/log4cplus-doc: PKGV changed from 2.0.7 [default] to 2.0.8 [default]
packages/core2-32-poky-linux/log4cplus/log4cplus-doc: PV changed from "2.0.7" to "2.0.8"
packages/core2-32-poky-linux/log4cplus/log4cplus-locale: PKGV changed from 2.0.7 [default] to 2.0.8 [default]
packages/core2-32-poky-linux/log4cplus/log4cplus-locale: PV changed from "2.0.7" to "2.0.8"
packages/core2-32-poky-linux/log4cplus/log4cplus-src: PKGV changed from 2.0.7 [default] to 2.0.8 [default]
packages/core2-32-poky-linux/log4cplus/log4cplus-src: PKGSIZE changed from 709086 to 709906 (+0%)
packages/core2-32-poky-linux/log4cplus/log4cplus-src: PV changed from "2.0.7" to "2.0.8"
packages/core2-32-poky-linux/log4cplus/log4cplus-staticdev: PKGV changed from 2.0.7 [default] to 2.0.8 [default]
packages/core2-32-poky-linux/log4cplus/log4cplus-staticdev: PV changed from "2.0.7" to "2.0.8"
packages/core2-32-poky-linux/log4cplus/log4cplus: FILELIST: removed "/usr/lib/liblog4cplusU-2.0.so.3.4.6 /usr/lib/liblog4cplus-2.0.so.3.4.6", added "/usr/lib/liblog4cplus-2.0.so.3.4.7 /usr/lib/liblog4cplusU-2.0.so.3.4.7"
packages/core2-32-poky-linux/log4cplus/log4cplus: PKGV changed from 2.0.7 [default] to 2.0.8 [default]
packages/core2-32-poky-linux/log4cplus/log4cplus: PV changed from "2.0.7" to "2.0.8"
Changes to packages/core2-32-poky-linux/log4cplus (sysroot):
  /usr/lib/liblog4cplus-2.0.so.3 changed symlink target from liblog4cplus-2.0.so.3.4.6 to liblog4cplus-2.0.so.3.4.7
  /usr/lib/liblog4cplus.so changed symlink target from liblog4cplus-2.0.so.3.4.6 to liblog4cplus-2.0.so.3.4.7
  /usr/lib/liblog4cplusU-2.0.so.3 changed symlink target from liblog4cplusU-2.0.so.3.4.6 to liblog4cplusU-2.0.so.3.4.7
  /usr/lib/liblog4cplusU.so changed symlink target from liblog4cplusU-2.0.so.3.4.6 to liblog4cplusU-2.0.so.3.4.7
  /usr/lib/liblog4cplus-2.0.so.3.4.6 moved to /usr/lib/liblog4cplus-2.0.so.3.4.7
  /usr/lib/liblog4cplusU-2.0.so.3.4.6 moved to /usr/lib/liblog4cplusU-2.0.so.3.4.7

--===============1596059530646523570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/log4cplus/log4cplus: FILELIST: removed "/usr/lib/liblog4cplus-2.0.so.3.4.6 /usr/lib/liblog4cplusU-2.0.so.3.4.6", added "/usr/lib/liblog4cplus-2.0.so.3.4.7 /usr/lib/liblog4cplusU-2.0.so.3.4.7"
Changes to packages/core2-32-poky-linux/log4cplus (sysroot):
  /usr/lib/liblog4cplus-2.0.so.3 changed symlink target from liblog4cplus-2.0.so.3.4.6 to liblog4cplus-2.0.so.3.4.7
  /usr/lib/liblog4cplus.so changed symlink target from liblog4cplus-2.0.so.3.4.6 to liblog4cplus-2.0.so.3.4.7
  /usr/lib/liblog4cplusU-2.0.so.3 changed symlink target from liblog4cplusU-2.0.so.3.4.6 to liblog4cplusU-2.0.so.3.4.7
  /usr/lib/liblog4cplusU.so changed symlink target from liblog4cplusU-2.0.so.3.4.6 to liblog4cplusU-2.0.so.3.4.7
  /usr/lib/liblog4cplus-2.0.so.3.4.6 moved to /usr/lib/liblog4cplus-2.0.so.3.4.7
  /usr/lib/liblog4cplusU-2.0.so.3.4.6 moved to /usr/lib/liblog4cplusU-2.0.so.3.4.7

--===============1596059530646523570==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-log4cplus-upgrade-2.0.7-2.0.8.patch"

From 1609ae22cce601c8219fecac2b226024e28d1c8d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Jul 2022 07:21:48 +0000
Subject: [PATCH] log4cplus: upgrade 2.0.7 -> 2.0.8

---
 .../log4cplus/{log4cplus_2.0.7.bb => log4cplus_2.0.8.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/log4cplus/{log4cplus_2.0.7.bb => log4cplus_2.0.8.bb} (90%)

diff --git a/meta/recipes-devtools/log4cplus/log4cplus_2.0.7.bb b/meta/recipes-devtools/log4cplus/log4cplus_2.0.8.bb
similarity index 90%
rename from meta/recipes-devtools/log4cplus/log4cplus_2.0.7.bb
rename to meta/recipes-devtools/log4cplus/log4cplus_2.0.8.bb
index 3798b93f76..bbf4ce6218 100644
--- a/meta/recipes-devtools/log4cplus/log4cplus_2.0.7.bb
+++ b/meta/recipes-devtools/log4cplus/log4cplus_2.0.8.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=41e8e060c26822886b592ab4765c756b"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz \
           "
-SRC_URI[sha256sum] = "086451c7e7c582862cbd6c60d87bb6d9d63c4b65321dba85fa71766382f7ec6d"
+SRC_URI[sha256sum] = "cdc3c738e00be84d8d03b580816b9f12628ecc1d71e1395080c802615d2d9ced"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/log4cplus/files/log4cplus-stable/"
 UPSTREAM_CHECK_REGEX = "log4cplus-stable/(?P<pver>\d+(\.\d+)+)/"
-- 
2.31.1


--===============1596059530646523570==--

