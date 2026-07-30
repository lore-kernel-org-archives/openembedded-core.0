Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9396EC54FD2
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 05:45:16 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5301.1785390308360968378
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 22:45:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=p0q2Vxtc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=K23hdYUD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019fb18e1918-6e60db78-fa07-43d5-8bb5-0f1a3bf1758a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785390307;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ze4iiUml/UhTLnsnqHWkPwQKVf/7tPLK5uZxtA+Zgk8=;
	b=p0q2VxtcnmLESFg2d4xy5JN1l2k8Murv20yWPvBbp8BsKar+NFwjDb9MZ+3BPd00
	458d0rMs2mT7A1Zm0udNtixozQQs6LDsLsDNXkNMVfVfPLx5YZAqh3akuecsnox87Mr
	riXOV1hLCltwVdn8SST3re9CGToQoL9RBPMeqIOo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785390307;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ze4iiUml/UhTLnsnqHWkPwQKVf/7tPLK5uZxtA+Zgk8=;
	b=K23hdYUDs0ZqDlu2YGTxqbEeN61d6GBwOD0yfxbOdR2Bu6AjRV8K8u93F5Gcokfn
	b0ZXudRfYEj1IW3Vj4rle+zCiFNwuI6qcqnx13Wz/2oXvrMHAHbwzqpgNtsBxU/Dmdl
	tW+4CNZQzS0g4LnYVr13DEfsoGhKWP1XSCcSws2Q=
Content-Type: multipart/mixed; boundary="===============2878127589391642803=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-websockets: upgrading to 17.0 SUCCEEDED
Message-ID: <0101019fb18e1918-6e60db78-fa07-43d5-8bb5-0f1a3bf1758a-000000@us-west-2.amazonses.com>
Date: Thu, 30 Jul 2026 05:45:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.30-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 05:45:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242317

--===============2878127589391642803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-websockets* to *17.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-websockets-upgrade-16.1.1-17.0.patch
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

-- >8 --
From 815e0e645edde8ea59517c1c9c08dd314c816280 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 30 Jul 2026 05:40:26 +0000
Subject: [PATCH] python3-websockets: upgrade 16.1.1 -> 17.0

---
 ...{python3-websockets_16.1.1.bb => python3-websockets_17.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_16.1.1.bb => python3-websockets_17.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-websockets_16.1.1.bb b/meta/recipes-devtools/python/python3-websockets_17.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-websockets_16.1.1.bb
rename to meta/recipes-devtools/python/python3-websockets_17.0.bb
index 6baa744fac..761ce94259 100644
--- a/meta/recipes-devtools/python/python3-websockets_16.1.1.bb
+++ b/meta/recipes-devtools/python/python3-websockets_17.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "db234eda965dcce15df96bb9709f587cd87d4d52aaf0e80e2f34ec04c7670c57"
+SRC_URI[sha256sum] = "6bbe83c4ef52a7533d2d8c6a3512b93722fd0db6bc6bc638d45edd49ef201444"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.1


--===============2878127589391642803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-ptest: FILELIST: removed "/usr/lib/python3-websockets/ptest/tests/test_headers.py /usr/lib/python3-websockets/ptest/tests/test_uri.py /usr/lib/python3-websockets/ptest/tests/test_utils.py /usr/lib/python3-websockets/ptest/tests/test_imports.py /usr/lib/python3-websockets/ptest/tests/test_exports.py /usr/lib/python3-websockets/ptest/tests/test_datastructures.py /usr/lib/python3-websockets/ptest/tests/test_proxy.py"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-ptest: PKGSIZE changed from 33358 to 280 (-99%)
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: FILELIST: directory renamed /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info -> /usr/lib/python3.14/site-packages/websockets-17.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/websockets-17.0.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/websockets/__pycache__/http.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/http.py /usr/lib/python3.14/site-packages/websockets/asyncio/__pycache__/compatibility.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/asyncio/compatibility.py /usr/lib/python3.14/site-packages/websockets/asyncio/__pycache__/async_timeout.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/asyncio/async_timeout.py", added "/usr/lib/python3.14/site-packages/websockets/trio/__pycache__/router.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/trio
 /__pycache__/connection.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/messages.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/utils.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/trio/utils.py /usr/lib/python3.14/site-packages/websockets/trio/messages.py /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/server.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/client.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/trio/__init__.py /usr/lib/python3.14/site-packages/websockets/trio/connection.py /usr/lib/python3.14/site-packages/websockets/trio/client.py /usr/lib/python3.14/site-packages/websockets/trio/router.py /usr/lib/python3.14/site-packages/websockets/trio/server.py"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PKGSIZE changed from 1385445 to 1673867 (+21%)
Changes to packages/x86-64-v3-poky-linux/python3-websockets (sysroot):
  /usr/lib/python3.14/site-packages/websockets-17.0.dist-info was added
  /usr/lib/python3.14/site-packages/websockets-17.0.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/websockets-17.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/websockets-17.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/websockets-17.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/websockets-17.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/websockets-17.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/websockets/trio was added
  /usr/lib/python3.14/site-packages/websockets/trio/client.py was added
  /usr/lib/python3.14/site-packages/websockets/trio/connection.py was added
  /usr/lib/python3.14/site-packages/websockets/trio/__init__.py was added
  /usr/lib/python3.14/site-packages/websockets/trio/messages.py was added
  /usr/lib/python3.14/site-packages/websockets/trio/__pycache__ was added
  /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/client.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/connection.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/messages.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/router.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/server.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/utils.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/websockets/trio/router.py was added
  /usr/lib/python3.14/site-packages/websockets/trio/server.py was added
  /usr/lib/python3.14/site-packages/websockets/trio/utils.py was added
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info was removed
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/websockets/asyncio/async_timeout.py was removed
  /usr/lib/python3.14/site-packages/websockets/asyncio/compatibility.py was removed
  /usr/lib/python3.14/site-packages/websockets/asyncio/__pycache__/async_timeout.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/websockets/asyncio/__pycache__/compatibility.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/websockets/http.py was removed
  /usr/lib/python3.14/site-packages/websockets/__pycache__/http.cpython-314.pyc was removed

--===============2878127589391642803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-websockets: PV changed from "16.1.1" to "17.0"
packages/x86-64-v3-poky-linux/python3-websockets: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/websockets/websockets-16.1.1.tar.gz;downloadfilename=websockets-16.1.1.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/w/websockets/websockets-17.0.tar.gz;downloadfilename=websockets-17.0.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-websockets: PKGV changed from 16.1.1 [default] to 17.0 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dbg: PV changed from "16.1.1" to "17.0"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dbg: PKGV changed from 16.1.1 [default] to 17.0 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dbg: PKGSIZE changed from 29664 to 29656 (-0%)
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dev: PV changed from "16.1.1" to "17.0"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dev: PKGV changed from 16.1.1 [default] to 17.0 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-doc: PV changed from "16.1.1" to "17.0"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-doc: PKGV changed from 16.1.1 [default] to 17.0 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-locale: PV changed from "16.1.1" to "17.0"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-locale: PKGV changed from 16.1.1 [default] to 17.0 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-ptest: PV changed from "16.1.1" to "17.0"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-ptest: FILELIST: removed "/usr/lib/python3-websockets/ptest/tests/test_exports.py /usr/lib/python3-websockets/ptest/tests/test_imports.py /usr/lib/python3-websockets/ptest/tests/test_headers.py /usr/lib/python3-websockets/ptest/tests/test_datastructures.py /usr/lib/python3-websockets/ptest/tests/test_uri.py /usr/lib/python3-websockets/ptest/tests/test_proxy.py /usr/lib/python3-websockets/ptest/tests/test_utils.py"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-ptest: PKGV changed from 16.1.1 [default] to 17.0 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-ptest: PKGSIZE changed from 33358 to 280 (-99%)
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-src: PV changed from "16.1.1" to "17.0"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-src: FILELIST: directory renamed /usr/src/debug/python3-websockets/16.1.1/src/websockets -> /usr/src/debug/python3-websockets/17.0/src/websockets
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-src: PKGV changed from 16.1.1 [default] to 17.0 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-staticdev: PV changed from "16.1.1" to "17.0"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-staticdev: PKGV changed from 16.1.1 [default] to 17.0 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PV changed from "16.1.1" to "17.0"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: FILELIST: directory renamed /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/websockets-17.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info -> /usr/lib/python3.14/site-packages/websockets-17.0.dist-info, removed "/usr/lib/python3.14/site-packages/websockets/asyncio/async_timeout.py /usr/lib/python3.14/site-packages/websockets/asyncio/__pycache__/async_timeout.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/http.py /usr/lib/python3.14/site-packages/websockets/asyncio/__pycache__/compatibility.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/__pycache__/http.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/asyncio/compatibility.py", added "/usr/lib/python3.14/site-packages/websockets/trio/__pycache__/server.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/trio
 /__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/utils.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/router.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/trio/utils.py /usr/lib/python3.14/site-packages/websockets/trio/router.py /usr/lib/python3.14/site-packages/websockets/trio/client.py /usr/lib/python3.14/site-packages/websockets/trio/server.py /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/client.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/trio/connection.py /usr/lib/python3.14/site-packages/websockets/trio/__init__.py /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/connection.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/trio/messages.py /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/messages.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PKGV changed from 16.1.1 [default] to 17.0 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PKGSIZE changed from 1385445 to 1673867 (+21%)
Changes to packages/x86-64-v3-poky-linux/python3-websockets (sysroot):
  /usr/lib/python3.14/site-packages/websockets-17.0.dist-info was added
  /usr/lib/python3.14/site-packages/websockets-17.0.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/websockets-17.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/websockets-17.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/websockets-17.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/websockets-17.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/websockets-17.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/websockets/trio was added
  /usr/lib/python3.14/site-packages/websockets/trio/client.py was added
  /usr/lib/python3.14/site-packages/websockets/trio/connection.py was added
  /usr/lib/python3.14/site-packages/websockets/trio/__init__.py was added
  /usr/lib/python3.14/site-packages/websockets/trio/messages.py was added
  /usr/lib/python3.14/site-packages/websockets/trio/__pycache__ was added
  /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/client.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/connection.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/messages.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/router.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/server.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/utils.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/websockets/trio/router.py was added
  /usr/lib/python3.14/site-packages/websockets/trio/server.py was added
  /usr/lib/python3.14/site-packages/websockets/trio/utils.py was added
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info was removed
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/websockets/asyncio/async_timeout.py was removed
  /usr/lib/python3.14/site-packages/websockets/asyncio/compatibility.py was removed
  /usr/lib/python3.14/site-packages/websockets/asyncio/__pycache__/async_timeout.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/websockets/asyncio/__pycache__/compatibility.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/websockets/http.py was removed
  /usr/lib/python3.14/site-packages/websockets/__pycache__/http.cpython-314.pyc was removed

--===============2878127589391642803==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-websockets-upgrade-16.1.1-17.0.patch"

RnJvbSA4MTVlMGU2NDVlZGRlOGVhNTk1MTdjMWM5YzA4ZGQzMTRjODE2MjgwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMzAgSnVsIDIwMjYgMDU6NDA6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdlYnNvY2tldHM6IHVwZ3JhZGUgMTYuMS4xIC0+IDE3LjAKCi0tLQogLi4ue3B5dGhv
bjMtd2Vic29ja2V0c18xNi4xLjEuYmIgPT4gcHl0aG9uMy13ZWJzb2NrZXRzXzE3LjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy13ZWJzb2NrZXRzXzE2LjEu
MS5iYiA9PiBweXRob24zLXdlYnNvY2tldHNfMTcuMC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2Vic29ja2V0c18xNi4xLjEuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2Vic29ja2V0c18xNy4wLmJi
CnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy13ZWJzb2NrZXRzXzE2LjEuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdlYnNvY2tldHNfMTcuMC5iYgppbmRleCA2YmFhNzQ0
ZmFjLi43NjFjZTk0MjU5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtd2Vic29ja2V0c18xNi4xLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXdlYnNvY2tldHNfMTcuMC5iYgpAQCAtOCw3ICs4LDcgQEAgaW5oZXJp
dCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEgcHRlc3QtcHl0aG9uLXB5dGVzdAog
CiBTUkNfVVJJICs9ICJmaWxlOi8vcnVuLXB0ZXN0IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
ZGIyMzRlZGE5NjVkY2NlMTVkZjk2YmI5NzA5ZjU4N2NkODdkNGQ1MmFhZjBlODBlMmYzNGVjMDRj
NzY3MGM1NyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2YmJlODNjNGVmNTJhNzUzM2QyZDhjNmEz
NTEyYjkzNzIyZmQwZGI2YmM2YmM2MzhkNDVlZGQ0OWVmMjAxNDQ0IgogCiBCQkNMQVNTRVhURU5E
ID0gIm5hdGl2ZSBuYXRpdmVzZGsiCiAKLS0gCjIuNDcuMQoK

--===============2878127589391642803==--

