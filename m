Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9095CA9EDA
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 05:27:18 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7246.1791782832670269498
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 22:27:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=We3uHywt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SbgzkkNx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a12e944612-eb60334a-ab3d-4ba0-9687-bcc8e4d8a85e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791782831;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FGO6RmBWXQJuJHiPGsijGBYWdFj2j1a2IMquyd+2qPQ=;
	b=We3uHywtEw6baxjf3ji3vXvR+jSHrCEEMuy0Wkp8x4NJFTUSZh1Sq8v6FMMA3cGh
	7gUbqUKIktDUmoo9D751c4E+lYXzvDHWGJ44Lz5hUpHE3BZGxefh7Fs6I7SidfHgVZy
	3FLkePt5KAkS5GzGf0d7ShVJsZGWwQPd77JEB/SA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791782831;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FGO6RmBWXQJuJHiPGsijGBYWdFj2j1a2IMquyd+2qPQ=;
	b=SbgzkkNx/1eVS8amxGFjuLltwunqL3GHBE17UGq2oM0aKukcYOjK3ubOzsWDHmPZ
	lQJMe5FVMHA52VMGqNsJvyopt+aXRsIKZh0q3Drv3TIq8/33mwQLHS4/MB8sc5n2LR2
	UaVZ/LkT/nxCp25SZRPLjNqewFPmqvyLhgVyGD7o=
Content-Type: multipart/mixed; boundary="===============5380762432217755256=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>, Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycryptodome,python3-pycryptodomex: upgrading to 3.24.1
 SUCCEEDED
Message-ID: <010101a12e944612-eb60334a-ab3d-4ba0-9687-bcc8e4d8a85e-000000@us-west-2.amazonses.com>
Date: Mon, 12 Oct 2026 05:27:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.12-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 05:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247605

--===============5380762432217755256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pycryptodome,python3-pycryptodomex* to *3.24.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycryptodome-python3-pycryptodomex-upgrade-3.patch
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
From 2df9f90041d26a4967ada83f83c76865c06c694d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 12 Oct 2026 05:09:14 +0000
Subject: [PATCH] python3-pycryptodome,python3-pycryptodomex: upgrade 3.23.0 ->
 3.24.1

3.24.1 (11 October 2026)

Resolved issues
---------------

3.24.0 (4 October 2026)

New features
---------------

Resolved issues
---------------

Other changes
-------------
---
 ...n3-pycryptodome_3.23.0.bb => python3-pycryptodome_3.24.1.bb} | 2 +-
 ...-pycryptodomex_3.23.0.bb => python3-pycryptodomex_3.24.1.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycryptodome_3.23.0.bb => python3-pycryptodome_3.24.1.bb} (56%)
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.23.0.bb => python3-pycryptodomex_3.24.1.bb} (76%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.24.1.bb
similarity index 56%
rename from meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb
rename to meta/recipes-devtools/python/python3-pycryptodome_3.24.1.bb
index 1b2a5edd38..0aa53559d6 100644
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.24.1.bb
@@ -1,6 +1,6 @@
 require python-pycryptodome.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "447700a657182d60338bab09fdb27518f8856aecd80ae4c6bdddb67ff5da44ef"
+SRC_URI[sha256sum] = "3f9e74444c0ecbec7af232a95d282c74b114d53212ce075ed17b7fd7dca32bb3"
 
 CVE_PRODUCT = "pycryptodome:pycryptodome"
diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.24.1.bb
similarity index 76%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.24.1.bb
index e2120d9972..b24e047a19 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.24.1.bb
@@ -1,7 +1,7 @@
 require python-pycryptodome.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "71909758f010c82bc99b0abf4ea12012c98962fbf0583c2164f8b84533c2e4da"
+SRC_URI[sha256sum] = "09081666ffc599976c0b8b29caf2cf82212c0f05bed233c8f8ed53e4f6e1d356"
 
 CVE_PRODUCT = "pycryptodome:pycryptodome pycryptodome:pycryptodomex"
 
-- 
2.47.1


--===============5380762432217755256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pycryptodome-changelog.txt"

3.24.1 (11 October 2026)

Resolved issues
---------------

3.24.0 (4 October 2026)

New features
---------------

Resolved issues
---------------

Other changes
-------------

--===============5380762432217755256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pycryptodome: PKGV changed from 3.23.0 [default] to 3.24.1 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome: PV changed from "3.23.0" to "3.24.1"
packages/x86-64-v3-poky-linux/python3-pycryptodome: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-3.23.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-3.24.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGSIZE changed from 2275392 to 2277640 (+0%)
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGV changed from 3.23.0 [default] to 3.24.1 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PV changed from "3.23.0" to "3.24.1"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PKGV changed from 3.23.0 [default] to 3.24.1 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PV changed from "3.23.0" to "3.24.1"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PKGV changed from 3.23.0 [default] to 3.24.1 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PV changed from "3.23.0" to "3.24.1"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PKGV changed from 3.23.0 [default] to 3.24.1 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PV changed from "3.23.0" to "3.24.1"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGSIZE changed from 2802562 to 2805378 (+0%)
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGV changed from 3.23.0 [default] to 3.24.1 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PV changed from "3.23.0" to "3.24.1"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-src: FILELIST: directory renamed /usr/src/debug/python3-pycryptodome/3.23.0/src/libtom -> /usr/src/debug/python3-pycryptodome/3.24.1/src/libtom, directory renamed /usr/src/debug/python3-pycryptodome/3.23.0/src -> /usr/src/debug/python3-pycryptodome/3.24.1/src
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PKGV changed from 3.23.0 [default] to 3.24.1 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PV changed from "3.23.0" to "3.24.1"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGSIZE changed from 3127963 to 3156286 (+1%)
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGV changed from 3.23.0 [default] to 3.24.1 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PV changed from "3.23.0" to "3.24.1"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGSIZE changed from 3735242 to 3762246 (+1%)
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGV changed from 3.23.0 [default] to 3.24.1 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome: PV changed from "3.23.0" to "3.24.1"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pycryptodome-3.23.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pycryptodome-3.23.0.dist-info -> /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pycryptodome (sysroot):
  /usr/lib/python3.14/site-packages/pycryptodome-3.23.0.dist-info moved to /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info
packages/x86-64-v3-poky-linux/python3-pycryptodomex: PKGV changed from 3.23.0 [default] to 3.24.1 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodomex: PV changed from "3.23.0" to "3.24.1"
packages/x86-64-v3-poky-linux/python3-pycryptodomex: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycryptodomex/pycryptodomex-3.23.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycryptodomex/pycryptodomex-3.24.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PKGSIZE changed from 2275528 to 2277768 (+0%)
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PKGV changed from 3.23.0 [default] to 3.24.1 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PV changed from "3.23.0" to "3.24.1"
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dev: PKGV changed from 3.23.0 [default] to 3.24.1 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dev: PV changed from "3.23.0" to "3.24.1"
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-doc: PKGV changed from 3.23.0 [default] to 3.24.1 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-doc: PV changed from "3.23.0" to "3.24.1"
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-locale: PKGV changed from 3.23.0 [default] to 3.24.1 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-locale: PV changed from "3.23.0" to "3.24.1"
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PKGSIZE changed from 2802562 to 2805378 (+0%)
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PKGV changed from 3.23.0 [default] to 3.24.1 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PV changed from "3.23.0" to "3.24.1"
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: FILELIST: directory renamed /usr/src/debug/python3-pycryptodomex/3.23.0/src/libtom -> /usr/src/debug/python3-pycryptodomex/3.24.1/src/libtom, directory renamed /usr/src/debug/python3-pycryptodomex/3.23.0/src -> /usr/src/debug/python3-pycryptodomex/3.24.1/src
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-staticdev: PKGV changed from 3.23.0 [default] to 3.24.1 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-staticdev: PV changed from "3.23.0" to "3.24.1"
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PKGSIZE changed from 3132223 to 3160558 (+1%)
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PKGV changed from 3.23.0 [default] to 3.24.1 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PV changed from "3.23.0" to "3.24.1"
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PKGSIZE changed from 3739930 to 3766958 (+1%)
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PKGV changed from 3.23.0 [default] to 3.24.1 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PV changed from "3.23.0" to "3.24.1"
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pycryptodomex-3.23.0.dist-info -> /usr/lib/python3.14/site-packages/pycryptodomex-3.24.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/pycryptodomex-3.23.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pycryptodomex-3.24.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pycryptodomex (sysroot):
  /usr/lib/python3.14/site-packages/pycryptodomex-3.23.0.dist-info moved to /usr/lib/python3.14/site-packages/pycryptodomex-3.24.1.dist-info

--===============5380762432217755256==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycryptodome-python3-pycryptodomex-upgrade-3.patch"

RnJvbSAyZGY5ZjkwMDQxZDI2YTQ5NjdhZGE4M2Y4M2M3Njg2NWMwNmM2OTRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTIgT2N0IDIwMjYgMDU6MDk6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Y3J5cHRvZG9tZSxweXRob24zLXB5Y3J5cHRvZG9tZXg6IHVwZ3JhZGUgMy4yMy4w
IC0+CiAzLjI0LjEKCjMuMjQuMSAoMTEgT2N0b2JlciAyMDI2KQoKUmVzb2x2ZWQgaXNzdWVzCi0t
LS0tLS0tLS0tLS0tLQoKMy4yNC4wICg0IE9jdG9iZXIgMjAyNikKCk5ldyBmZWF0dXJlcwotLS0t
LS0tLS0tLS0tLS0KClJlc29sdmVkIGlzc3VlcwotLS0tLS0tLS0tLS0tLS0KCk90aGVyIGNoYW5n
ZXMKLS0tLS0tLS0tLS0tLQotLS0KIC4uLm4zLXB5Y3J5cHRvZG9tZV8zLjIzLjAuYmIgPT4gcHl0
aG9uMy1weWNyeXB0b2RvbWVfMy4yNC4xLmJifSB8IDIgKy0KIC4uLi1weWNyeXB0b2RvbWV4XzMu
MjMuMC5iYiA9PiBweXRob24zLXB5Y3J5cHRvZG9tZXhfMy4yNC4xLmJifSB8IDIgKy0KIDIgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHljcnlwdG9kb21lXzMuMjMuMC5iYiA9
PiBweXRob24zLXB5Y3J5cHRvZG9tZV8zLjI0LjEuYmJ9ICg1NiUpCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMjMuMC5iYiA9PiBw
eXRob24zLXB5Y3J5cHRvZG9tZXhfMy4yNC4xLmJifSAoNzYlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4yMy4wLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZV8zLjI0LjEu
YmIKc2ltaWxhcml0eSBpbmRleCA1NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZV8zLjIzLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4yNC4xLmJiCmluZGV4
IDFiMmE1ZWRkMzguLjBhYTUzNTU5ZDYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4yMy4wLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4yNC4xLmJiCkBAIC0xLDYg
KzEsNiBAQAogcmVxdWlyZSBweXRob24tcHljcnlwdG9kb21lLmluYwogaW5oZXJpdCBweXRob25f
c2V0dXB0b29sc19idWlsZF9tZXRhCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0NDc3MDBhNjU3
MTgyZDYwMzM4YmFiMDlmZGIyNzUxOGY4ODU2YWVjZDgwYWU0YzZiZGRkYjY3ZmY1ZGE0NGVmIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjNmOWU3NDQ0NGMwZWNiZWM3YWYyMzJhOTVkMjgyYzc0YjEx
NGQ1MzIxMmNlMDc1ZWQxN2I3ZmQ3ZGNhMzJiYjMiCiAKIENWRV9QUk9EVUNUID0gInB5Y3J5cHRv
ZG9tZTpweWNyeXB0b2RvbWUiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtcHljcnlwdG9kb21leF8zLjIzLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21leF8zLjI0LjEuYmIKc2ltaWxhcml0eSBpbmRl
eCA3NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5
Y3J5cHRvZG9tZXhfMy4yMy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtcHljcnlwdG9kb21leF8zLjI0LjEuYmIKaW5kZXggZTIxMjBkOTk3Mi4uYjI0
ZTA0N2ExOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXB5Y3J5cHRvZG9tZXhfMy4yMy4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMjQuMS5iYgpAQCAtMSw3ICsxLDcgQEAKIHJlcXVp
cmUgcHl0aG9uLXB5Y3J5cHRvZG9tZS5pbmMKIGluaGVyaXQgcHl0aG9uX3NldHVwdG9vbHNfYnVp
bGRfbWV0YQogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzE5MDk3NThmMDEwYzgyYmM5OWIwYWJm
NGVhMTIwMTJjOTg5NjJmYmYwNTgzYzIxNjRmOGI4NDUzM2MyZTRkYSIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICIwOTA4MTY2NmZmYzU5OTk3NmMwYjhiMjljYWYyY2Y4MjIxMmMwZjA1YmVkMjMzYzhm
OGVkNTNlNGY2ZTFkMzU2IgogCiBDVkVfUFJPRFVDVCA9ICJweWNyeXB0b2RvbWU6cHljcnlwdG9k
b21lIHB5Y3J5cHRvZG9tZTpweWNyeXB0b2RvbWV4IgogCi0tIAoyLjQ3LjEKCg==

--===============5380762432217755256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pycryptodome-3.23.0.dist-info -> /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/pycryptodome-3.23.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pycryptodome (sysroot):
  /usr/lib/python3.14/site-packages/pycryptodome-3.23.0.dist-info moved to /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pycryptodomex-3.23.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pycryptodomex-3.24.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pycryptodomex-3.23.0.dist-info -> /usr/lib/python3.14/site-packages/pycryptodomex-3.24.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pycryptodomex (sysroot):
  /usr/lib/python3.14/site-packages/pycryptodomex-3.23.0.dist-info moved to /usr/lib/python3.14/site-packages/pycryptodomex-3.24.1.dist-info

--===============5380762432217755256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python3-pycryptodomex-changelog.txt"

3.24.1 (11 October 2026)

Resolved issues
---------------

3.24.0 (4 October 2026)

New features
---------------

Resolved issues
---------------

Other changes
-------------

--===============5380762432217755256==--

