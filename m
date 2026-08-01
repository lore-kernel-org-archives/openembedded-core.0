Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8294C55180
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 06:05:29 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.934.1785564322237087127
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 23:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XpY8n7uv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=wP7my4oU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019fbbed55f3-54f6da05-dc76-49b7-b80e-c40008577187-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785564321;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oKIFy/nN9EBKYJO2o1kZ30LOQZNpAh+BurHNcd7GY3g=;
	b=XpY8n7uvumAB4nl86vhYOfh5Lq/x/zrNAryRtgKFYJzwJUMJ54vqHBeuBD4K7Tcf
	yYsq6FEouQ1NBeFn3PiHjjFxH8yco6QG6RZf41nLeMvnPjaWvvfc3gJ9DqE89V1Esrb
	5zz/DKqxcMDJbDiQatIPF6nTii1bE5dEKh0mQWC4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785564321;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oKIFy/nN9EBKYJO2o1kZ30LOQZNpAh+BurHNcd7GY3g=;
	b=wP7my4oU0CgVy5FptxtL/Kj7ktUB8hJnFQ+NtFuzqhxDlmPlUDX6cd5iVcTs7YQQ
	+xYeKyaBhlftUyMg7m/kbu4RRmGirkO3CHEF40HQQOhmWzh9sFR9M28HVd6TCOLs1vY
	1Ob6DHZjFA93fwDmmjik0S6BkWKOptsNspNfWvlA=
Content-Type: multipart/mixed; boundary="===============0927792961968131929=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-websockets: upgrading to 17.0.1 SUCCEEDED
Message-ID: <0101019fbbed55f3-54f6da05-dc76-49b7-b80e-c40008577187-000000@us-west-2.amazonses.com>
Date: Sat, 1 Aug 2026 06:05:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 06:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242462

--===============0927792961968131929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-websockets* to *17.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-websockets-upgrade-16.1.1-17.0.1.patch
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
From c1c3cbb1bbbf45606e501eccce634f1c0104b282 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Aug 2026 05:40:19 +0000
Subject: [PATCH] python3-websockets: upgrade 16.1.1 -> 17.0.1

---
 ...ython3-websockets_16.1.1.bb => python3-websockets_17.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_16.1.1.bb => python3-websockets_17.0.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-websockets_16.1.1.bb b/meta/recipes-devtools/python/python3-websockets_17.0.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-websockets_16.1.1.bb
rename to meta/recipes-devtools/python/python3-websockets_17.0.1.bb
index 6baa744fac..b84aa0dcef 100644
--- a/meta/recipes-devtools/python/python3-websockets_16.1.1.bb
+++ b/meta/recipes-devtools/python/python3-websockets_17.0.1.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "db234eda965dcce15df96bb9709f587cd87d4d52aaf0e80e2f34ec04c7670c57"
+SRC_URI[sha256sum] = "5baa9bc0dfbae8c507e51c8cf1b6d4628086f7a87bbd3a9952bd5f035451f1cc"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.1


--===============0927792961968131929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-ptest: FILELIST: removed "/usr/lib/python3-websockets/ptest/tests/test_uri.py /usr/lib/python3-websockets/ptest/tests/test_headers.py /usr/lib/python3-websockets/ptest/tests/test_exports.py /usr/lib/python3-websockets/ptest/tests/test_imports.py /usr/lib/python3-websockets/ptest/tests/test_datastructures.py /usr/lib/python3-websockets/ptest/tests/test_utils.py /usr/lib/python3-websockets/ptest/tests/test_proxy.py"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-ptest: PKGSIZE changed from 33358 to 280 (-99%)
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: FILELIST: directory renamed /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/websockets-17.0.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info -> /usr/lib/python3.14/site-packages/websockets-17.0.1.dist-info, removed "/usr/lib/python3.14/site-packages/websockets/asyncio/__pycache__/compatibility.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/asyncio/__pycache__/async_timeout.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/http.py /usr/lib/python3.14/site-packages/websockets/__pycache__/http.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/asyncio/async_timeout.py /usr/lib/python3.14/site-packages/websockets/asyncio/compatibility.py", added "/usr/lib/python3.14/site-packages/websockets/trio/__pycache__/server.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/
 trio/router.py /usr/lib/python3.14/site-packages/websockets/trio/server.py /usr/lib/python3.14/site-packages/websockets/trio/client.py /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/utils.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/client.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/messages.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/trio/__init__.py /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/router.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/connection.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/trio/messages.py /usr/lib/python3.14/site-packages/websockets/trio/utils.py /usr/lib/python3.14/site-packages/websockets/trio/connection.py"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PKGSIZE changed from 1385445 to 1668349 (+20%)
Changes to packages/x86-64-v3-poky-linux/python3-websockets (sysroot):
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info moved to /usr/lib/python3.14/site-packages/websockets-17.0.1.dist-info
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
  /usr/lib/python3.14/site-packages/websockets/asyncio/async_timeout.py was removed
  /usr/lib/python3.14/site-packages/websockets/asyncio/compatibility.py was removed
  /usr/lib/python3.14/site-packages/websockets/asyncio/__pycache__/async_timeout.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/websockets/asyncio/__pycache__/compatibility.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/websockets/http.py was removed
  /usr/lib/python3.14/site-packages/websockets/__pycache__/http.cpython-314.pyc was removed

--===============0927792961968131929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-websockets: PV changed from "16.1.1" to "17.0.1"
packages/x86-64-v3-poky-linux/python3-websockets: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/websockets/websockets-16.1.1.tar.gz;downloadfilename=websockets-16.1.1.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/w/websockets/websockets-17.0.1.tar.gz;downloadfilename=websockets-17.0.1.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-websockets: PKGV changed from 16.1.1 [default] to 17.0.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dbg: PV changed from "16.1.1" to "17.0.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dbg: PKGV changed from 16.1.1 [default] to 17.0.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dev: PV changed from "16.1.1" to "17.0.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-dev: PKGV changed from 16.1.1 [default] to 17.0.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-doc: PV changed from "16.1.1" to "17.0.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-doc: PKGV changed from 16.1.1 [default] to 17.0.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-locale: PV changed from "16.1.1" to "17.0.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-locale: PKGV changed from 16.1.1 [default] to 17.0.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-ptest: PV changed from "16.1.1" to "17.0.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-ptest: PKGSIZE changed from 33358 to 280 (-99%)
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-ptest: FILELIST: removed "/usr/lib/python3-websockets/ptest/tests/test_uri.py /usr/lib/python3-websockets/ptest/tests/test_utils.py /usr/lib/python3-websockets/ptest/tests/test_datastructures.py /usr/lib/python3-websockets/ptest/tests/test_headers.py /usr/lib/python3-websockets/ptest/tests/test_imports.py /usr/lib/python3-websockets/ptest/tests/test_exports.py /usr/lib/python3-websockets/ptest/tests/test_proxy.py"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-ptest: PKGV changed from 16.1.1 [default] to 17.0.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-src: PV changed from "16.1.1" to "17.0.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-src: FILELIST: directory renamed /usr/src/debug/python3-websockets/16.1.1/src/websockets -> /usr/src/debug/python3-websockets/17.0.1/src/websockets
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-src: PKGV changed from 16.1.1 [default] to 17.0.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-staticdev: PV changed from "16.1.1" to "17.0.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets-staticdev: PKGV changed from 16.1.1 [default] to 17.0.1 [default]
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PV changed from "16.1.1" to "17.0.1"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PKGSIZE changed from 1385445 to 1668349 (+20%)
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: FILELIST: directory renamed /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info -> /usr/lib/python3.14/site-packages/websockets-17.0.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/websockets-17.0.1.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/websockets/asyncio/__pycache__/compatibility.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/asyncio/compatibility.py /usr/lib/python3.14/site-packages/websockets/asyncio/__pycache__/async_timeout.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/http.py /usr/lib/python3.14/site-packages/websockets/__pycache__/http.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/asyncio/async_timeout.py", added "/usr/lib/python3.14/site-packages/websockets/trio/__init__.py /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/__init
 __.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/trio/utils.py /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/router.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/server.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/messages.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/client.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/utils.cpython-314.pyc /usr/lib/python3.14/site-packages/websockets/trio/client.py /usr/lib/python3.14/site-packages/websockets/trio/router.py /usr/lib/python3.14/site-packages/websockets/trio/server.py /usr/lib/python3.14/site-packages/websockets/trio/connection.py /usr/lib/python3.14/site-packages/websockets/trio/messages.py /usr/lib/python3.14/site-packages/websockets/trio/__pycache__/connection.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-websockets/python3-websockets: PKGV changed from 16.1.1 [default] to 17.0.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-websockets (sysroot):
  /usr/lib/python3.14/site-packages/websockets-16.1.1.dist-info moved to /usr/lib/python3.14/site-packages/websockets-17.0.1.dist-info
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
  /usr/lib/python3.14/site-packages/websockets/asyncio/async_timeout.py was removed
  /usr/lib/python3.14/site-packages/websockets/asyncio/compatibility.py was removed
  /usr/lib/python3.14/site-packages/websockets/asyncio/__pycache__/async_timeout.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/websockets/asyncio/__pycache__/compatibility.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/websockets/http.py was removed
  /usr/lib/python3.14/site-packages/websockets/__pycache__/http.cpython-314.pyc was removed

--===============0927792961968131929==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-websockets-upgrade-16.1.1-17.0.1.patch"

RnJvbSBjMWMzY2JiMWJiYmY0NTYwNmU1MDFlY2NjZTYzNGYxYzAxMDRiMjgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBdWcgMjAyNiAwNTo0MDoxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtd2Vic29ja2V0czogdXBncmFkZSAxNi4xLjEgLT4gMTcuMC4xCgotLS0KIC4uLnl0aG9u
My13ZWJzb2NrZXRzXzE2LjEuMS5iYiA9PiBweXRob24zLXdlYnNvY2tldHNfMTcuMC4xLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtd2Vic29ja2V0c18xNi4x
LjEuYmIgPT4gcHl0aG9uMy13ZWJzb2NrZXRzXzE3LjAuMS5iYn0gKDkxJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2Vic29ja2V0c18xNi4xLjEu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2Vic29ja2V0c18xNy4w
LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXdlYnNvY2tldHNfMTYuMS4xLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2Vic29ja2V0c18xNy4wLjEuYmIKaW5kZXgg
NmJhYTc0NGZhYy4uYjg0YWEwZGNlZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXdlYnNvY2tldHNfMTYuMS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy13ZWJzb2NrZXRzXzE3LjAuMS5iYgpAQCAtOCw3ICs4LDcg
QEAgaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEgcHRlc3QtcHl0aG9u
LXB5dGVzdAogCiBTUkNfVVJJICs9ICJmaWxlOi8vcnVuLXB0ZXN0IgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiZGIyMzRlZGE5NjVkY2NlMTVkZjk2YmI5NzA5ZjU4N2NkODdkNGQ1MmFhZjBlODBl
MmYzNGVjMDRjNzY3MGM1NyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1YmFhOWJjMGRmYmFlOGM1
MDdlNTFjOGNmMWI2ZDQ2MjgwODZmN2E4N2JiZDNhOTk1MmJkNWYwMzU0NTFmMWNjIgogCiBCQkNM
QVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCiAKLS0gCjIuNDcuMQoK

--===============0927792961968131929==--

