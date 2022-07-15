Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7028BC2BBEF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:54 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web12.985.1657900668491315992
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=E7yjT2Pv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 0101018202949238-b4597e62-d0ed-42fb-afbf-2285f45d916f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=houXZ76mFl5mAq+4At/ZTKhwd9z2Bt1ppsWJVRkCK3o=;
	b=E7yjT2Pvkvx6D20n9f24/nXlyftTs31jBOocbqdoVufU4bxZihozipZXOY5qyRdX
	tJ7X1jCOagRCSuaGGw0CBKIJr4/gqpICW5HhH/UBefRU/wUkl/kZlSyrRbiCKQSNxxV
	kHcZOwv9YZWYakdv9g6whYh0qPw2DVkihYf87TAM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=houXZ76mFl5mAq+4At/ZTKhwd9z2Bt1ppsWJVRkCK3o=;
	b=Vc3hWb0FthgKC9mkkTyze5Hl4pZAvCuCCBIB6bKOIOXQeQSCVEAUDNiHTRiOotzT
	twOZj6k5FtneKZBrwnE/eie7XkAYVUy+KEqPQecr999MbaVqqIcXKDEfSzIOM0rFe61
	3vhUZAmsROigE52tMi1xEpXGmdkwLOOXnoKlnSnE=
Content-Type: multipart/mixed; boundary="===============9179240015402154714=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-rust: upgrading to 1.4.1 SUCCEEDED
Message-ID: 
 <0101018202949238-b4597e62-d0ed-42fb-afbf-2285f45d916f-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168083

--===============9179240015402154714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools-rust* to *1.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-rust-upgrade-1.3.0-1.4.1.patch
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
--===============9179240015402154714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools-rust: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools-rust/setuptools-rust-1.3.0.tar.gz https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-1.3.0.tar.gz" to "https://files.pythonhosted.org/packages/source/s/setuptools-rust/setuptools-rust-1.4.1.tar.gz https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-1.4.1.tar.gz"
packages/core2-32-poky-linux/python3-setuptools-rust: PKGV changed from 1.3.0 [default] to 1.4.1 [default]
packages/core2-32-poky-linux/python3-setuptools-rust: PV changed from "1.3.0" to "1.4.1"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PKGV changed from 1.3.0 [default] to 1.4.1 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PV changed from "1.3.0" to "1.4.1"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PKGV changed from 1.3.0 [default] to 1.4.1 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PV changed from "1.3.0" to "1.4.1"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PKGV changed from 1.3.0 [default] to 1.4.1 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PV changed from "1.3.0" to "1.4.1"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PKGV changed from 1.3.0 [default] to 1.4.1 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PV changed from "1.3.0" to "1.4.1"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PKGV changed from 1.3.0 [default] to 1.4.1 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PV changed from "1.3.0" to "1.4.1"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PKGV changed from 1.3.0 [default] to 1.4.1 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PV changed from "1.3.0" to "1.4.1"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGSIZE changed from 103786 to 118700 (+14%)
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGV changed from 1.3.0 [default] to 1.4.1 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust: FILELIST: directory renamed /usr/lib/python3.10/site-packages/setuptools_rust-1.3.0.dist-info -> /usr/lib/python3.10/site-packages/setuptools_rust-1.4.1.dist-info, removed "/usr/lib/python3.10/site-packages/setuptools_rust/utils.py /usr/lib/python3.10/site-packages/setuptools_rust/__pycache__/utils.cpython-310.pyc", added "/usr/lib/python3.10/site-packages/setuptools_rust/__pycache__/_utils.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools_rust/__pycache__/rustc_info.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools_rust/_utils.py /usr/lib/python3.10/site-packages/setuptools_rust/rustc_info.py"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PV changed from "1.3.0" to "1.4.1"
Changes to packages/core2-32-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.10/site-packages/setuptools_rust-1.3.0.dist-info moved to /usr/lib/python3.10/site-packages/setuptools_rust-1.4.1.dist-info
  /usr/lib/python3.10/site-packages/setuptools_rust/__pycache__/rustc_info.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools_rust/__pycache__/_utils.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools_rust/rustc_info.py was added
  /usr/lib/python3.10/site-packages/setuptools_rust/_utils.py was added
  /usr/lib/python3.10/site-packages/setuptools_rust/__pycache__/utils.cpython-310.pyc was removed
  /usr/lib/python3.10/site-packages/setuptools_rust/utils.py was removed

--===============9179240015402154714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust: FILELIST: directory renamed /usr/lib/python3.10/site-packages/setuptools_rust-1.3.0.dist-info -> /usr/lib/python3.10/site-packages/setuptools_rust-1.4.1.dist-info, removed "/usr/lib/python3.10/site-packages/setuptools_rust/utils.py /usr/lib/python3.10/site-packages/setuptools_rust/__pycache__/utils.cpython-310.pyc", added "/usr/lib/python3.10/site-packages/setuptools_rust/__pycache__/_utils.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools_rust/__pycache__/rustc_info.cpython-310.pyc /usr/lib/python3.10/site-packages/setuptools_rust/_utils.py /usr/lib/python3.10/site-packages/setuptools_rust/rustc_info.py"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGSIZE changed from 103786 to 118700 (+14%)
Changes to packages/core2-32-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.10/site-packages/setuptools_rust-1.3.0.dist-info moved to /usr/lib/python3.10/site-packages/setuptools_rust-1.4.1.dist-info
  /usr/lib/python3.10/site-packages/setuptools_rust/__pycache__/rustc_info.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools_rust/__pycache__/_utils.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/setuptools_rust/rustc_info.py was added
  /usr/lib/python3.10/site-packages/setuptools_rust/_utils.py was added
  /usr/lib/python3.10/site-packages/setuptools_rust/__pycache__/utils.cpython-310.pyc was removed
  /usr/lib/python3.10/site-packages/setuptools_rust/utils.py was removed

--===============9179240015402154714==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-setuptools-rust-upgrade-1.3.0-1.4.1.patch"

From 03cc87922eca4537b227aa4a69bf7d737fb24494 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Jul 2022 08:26:41 +0000
Subject: [PATCH] python3-setuptools-rust: upgrade 1.3.0 -> 1.4.1

---
 ...etuptools-rust_1.3.0.bb => python3-setuptools-rust_1.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-rust_1.3.0.bb => python3-setuptools-rust_1.4.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.3.0.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.4.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-setuptools-rust_1.3.0.bb
rename to meta/recipes-devtools/python/python3-setuptools-rust_1.4.1.bb
index 51e27b843e..bdd1ae3e7c 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.3.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.4.1.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 
 SRC_URI = "https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-${PV}.tar.gz"
-SRC_URI[sha256sum] = "958c5bf4ab6483d59dab888538121871cc5006354a42fb0fbd50acf03caad1de"
+SRC_URI[sha256sum] = "18ff850831f58ee21d5783825c99fad632da21e47645e9427fd7dec048029e76"
 
 inherit cargo pypi python_setuptools_build_meta
 
-- 
2.31.1


--===============9179240015402154714==--

