Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC92CA5FCE
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 05:28:41 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13594.1791178115235251246
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Oct 2026 22:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=jCEEhxfx;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CfujI3Ir;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a10a8904f5-ee134ab3-449f-4868-b4b1-608178c3316f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791178114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=95u+e28eXWWi7L6JVANnnr1ZKnZOhN6WRCXyFsxdAoc=;
	b=jCEEhxfxMUpw0QdyUKJxijjhf1VFLWg8YHre/b+2H7q/tAb4L7X6kuppqFoyfO1Q
	9Uw2ClLXk6iJPgvMla04OIysegmQkdr9MzFuom393PjK81wniPoIXAUUYu+gDctDk1X
	aMDpMVnqSw2X94Y/kB4/c7cCRqBWM1qV8r8Qh5pg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791178114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=95u+e28eXWWi7L6JVANnnr1ZKnZOhN6WRCXyFsxdAoc=;
	b=CfujI3IrgntvqMcKwbnr2iVaZOocKvIme7kBHcHNS69d6cOXSed6Nm/EVJqGlLZw
	MOhCH9XG305LHRSMJDZxpW0n6JmU+C/0mfB5R6QuYm0bn2JT7SR9eSvAeF29iBx8lBM
	IywMvSl6b/F2cmorOIvxebnRTFEQLQnag/hNHmPs=
Content-Type: multipart/mixed; boundary="===============2276637447260527214=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>, Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycryptodomex,python3-pycryptodome: upgrading to 3.24.0
 SUCCEEDED
Message-ID: <010101a10a8904f5-ee134ab3-449f-4868-b4b1-608178c3316f-000000@us-west-2.amazonses.com>
Date: Mon, 5 Oct 2026 05:28:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.05-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 05:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247206

--===============2276637447260527214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pycryptodomex,python3-pycryptodome* to *3.24.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycryptodomex-python3-pycryptodome-upgrade-3.patch
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
From d5f290d3b87103e280e63fa28b3b2e0d2b5e46bd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 5 Oct 2026 05:08:29 +0000
Subject: [PATCH] python3-pycryptodomex,python3-pycryptodome: upgrade 3.23.0 ->
 3.24.0

3.24.0 (4 October 2026)

New features
---------------

Resolved issues
---------------

Other changes
-------------
---
 ...n3-pycryptodome_3.23.0.bb => python3-pycryptodome_3.24.0.bb} | 2 +-
 ...-pycryptodomex_3.23.0.bb => python3-pycryptodomex_3.24.0.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycryptodome_3.23.0.bb => python3-pycryptodome_3.24.0.bb} (56%)
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.23.0.bb => python3-pycryptodomex_3.24.0.bb} (76%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.24.0.bb
similarity index 56%
rename from meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb
rename to meta/recipes-devtools/python/python3-pycryptodome_3.24.0.bb
index 1b2a5edd38..f6e930820d 100644
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.23.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.24.0.bb
@@ -1,6 +1,6 @@
 require python-pycryptodome.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "447700a657182d60338bab09fdb27518f8856aecd80ae4c6bdddb67ff5da44ef"
+SRC_URI[sha256sum] = "9140779b40405476a799305b9ac1bcaab4ee6791dc3d38b12a9aa84ffbd6aabf"
 
 CVE_PRODUCT = "pycryptodome:pycryptodome"
diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.24.0.bb
similarity index 76%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.24.0.bb
index e2120d9972..28dc0e9977 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.24.0.bb
@@ -1,7 +1,7 @@
 require python-pycryptodome.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "71909758f010c82bc99b0abf4ea12012c98962fbf0583c2164f8b84533c2e4da"
+SRC_URI[sha256sum] = "0428f19f13452c6b89bbaf2c530f84f369873811dfa77f0cee0da4f40fb0474f"
 
 CVE_PRODUCT = "pycryptodome:pycryptodome pycryptodome:pycryptodomex"
 
-- 
2.47.1


--===============2276637447260527214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pycryptodome-3.23.0.dist-info -> /usr/lib/python3.14/site-packages/pycryptodome-3.24.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/pycryptodome-3.23.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pycryptodome-3.24.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pycryptodome (sysroot):
  /usr/lib/python3.14/site-packages/pycryptodome-3.23.0.dist-info moved to /usr/lib/python3.14/site-packages/pycryptodome-3.24.0.dist-info
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pycryptodomex-3.23.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pycryptodomex-3.24.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pycryptodomex-3.23.0.dist-info -> /usr/lib/python3.14/site-packages/pycryptodomex-3.24.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pycryptodomex (sysroot):
  /usr/lib/python3.14/site-packages/pycryptodomex-3.23.0.dist-info moved to /usr/lib/python3.14/site-packages/pycryptodomex-3.24.0.dist-info

--===============2276637447260527214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pycryptodome-changelog.txt"

3.24.0 (4 October 2026)

New features
---------------

Resolved issues
---------------

Other changes
-------------

--===============2276637447260527214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python3-pycryptodomex-changelog.txt"

3.24.0 (4 October 2026)

New features
---------------

Resolved issues
---------------

Other changes
-------------

--===============2276637447260527214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pycryptodome: PV changed from "3.23.0" to "3.24.0"
packages/x86-64-v3-poky-linux/python3-pycryptodome: PKGV changed from 3.23.0 [default] to 3.24.0 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-3.23.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-3.24.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PV changed from "3.23.0" to "3.24.0"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGSIZE changed from 2275392 to 2277312 (+0%)
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGV changed from 3.23.0 [default] to 3.24.0 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PV changed from "3.23.0" to "3.24.0"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PKGV changed from 3.23.0 [default] to 3.24.0 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PV changed from "3.23.0" to "3.24.0"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PKGV changed from 3.23.0 [default] to 3.24.0 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PV changed from "3.23.0" to "3.24.0"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PKGV changed from 3.23.0 [default] to 3.24.0 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PV changed from "3.23.0" to "3.24.0"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGSIZE changed from 2802562 to 2804348 (+0%)
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-src: FILELIST: directory renamed /usr/src/debug/python3-pycryptodome/3.23.0/src -> /usr/src/debug/python3-pycryptodome/3.24.0/src, directory renamed /usr/src/debug/python3-pycryptodome/3.23.0/src/libtom -> /usr/src/debug/python3-pycryptodome/3.24.0/src/libtom
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGV changed from 3.23.0 [default] to 3.24.0 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PV changed from "3.23.0" to "3.24.0"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PKGV changed from 3.23.0 [default] to 3.24.0 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PV changed from "3.23.0" to "3.24.0"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGSIZE changed from 3127963 to 3156286 (+1%)
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGV changed from 3.23.0 [default] to 3.24.0 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome: PV changed from "3.23.0" to "3.24.0"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGSIZE changed from 3735242 to 3757856 (+1%)
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pycryptodome-3.23.0.dist-info -> /usr/lib/python3.14/site-packages/pycryptodome-3.24.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/pycryptodome-3.23.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pycryptodome-3.24.0.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGV changed from 3.23.0 [default] to 3.24.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pycryptodome (sysroot):
  /usr/lib/python3.14/site-packages/pycryptodome-3.23.0.dist-info moved to /usr/lib/python3.14/site-packages/pycryptodome-3.24.0.dist-info
packages/x86-64-v3-poky-linux/python3-pycryptodomex: PV changed from "3.23.0" to "3.24.0"
packages/x86-64-v3-poky-linux/python3-pycryptodomex: PKGV changed from 3.23.0 [default] to 3.24.0 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodomex: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycryptodomex/pycryptodomex-3.23.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycryptodomex/pycryptodomex-3.24.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PV changed from "3.23.0" to "3.24.0"
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PKGSIZE changed from 2275528 to 2277440 (+0%)
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PKGV changed from 3.23.0 [default] to 3.24.0 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dev: PV changed from "3.23.0" to "3.24.0"
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dev: PKGV changed from 3.23.0 [default] to 3.24.0 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-doc: PV changed from "3.23.0" to "3.24.0"
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-doc: PKGV changed from 3.23.0 [default] to 3.24.0 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-locale: PV changed from "3.23.0" to "3.24.0"
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-locale: PKGV changed from 3.23.0 [default] to 3.24.0 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PV changed from "3.23.0" to "3.24.0"
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PKGSIZE changed from 2802562 to 2804348 (+0%)
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: FILELIST: directory renamed /usr/src/debug/python3-pycryptodomex/3.23.0/src/libtom -> /usr/src/debug/python3-pycryptodomex/3.24.0/src/libtom, directory renamed /usr/src/debug/python3-pycryptodomex/3.23.0/src -> /usr/src/debug/python3-pycryptodomex/3.24.0/src
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PKGV changed from 3.23.0 [default] to 3.24.0 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-staticdev: PV changed from "3.23.0" to "3.24.0"
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-staticdev: PKGV changed from 3.23.0 [default] to 3.24.0 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PV changed from "3.23.0" to "3.24.0"
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PKGSIZE changed from 3132223 to 3160558 (+1%)
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PKGV changed from 3.23.0 [default] to 3.24.0 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PV changed from "3.23.0" to "3.24.0"
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PKGSIZE changed from 3739930 to 3762560 (+1%)
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pycryptodomex-3.23.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pycryptodomex-3.24.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pycryptodomex-3.23.0.dist-info -> /usr/lib/python3.14/site-packages/pycryptodomex-3.24.0.dist-info
packages/x86-64-v3-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PKGV changed from 3.23.0 [default] to 3.24.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pycryptodomex (sysroot):
  /usr/lib/python3.14/site-packages/pycryptodomex-3.23.0.dist-info moved to /usr/lib/python3.14/site-packages/pycryptodomex-3.24.0.dist-info

--===============2276637447260527214==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycryptodomex-python3-pycryptodome-upgrade-3.patch"

RnJvbSBkNWYyOTBkM2I4NzEwM2UyODBlNjNmYTI4YjNiMmUwZDJiNWU0NmJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgNSBPY3QgMjAyNiAwNTowODoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHljcnlwdG9kb21leCxweXRob24zLXB5Y3J5cHRvZG9tZTogdXBncmFkZSAzLjIzLjAg
LT4KIDMuMjQuMAoKMy4yNC4wICg0IE9jdG9iZXIgMjAyNikKCk5ldyBmZWF0dXJlcwotLS0tLS0t
LS0tLS0tLS0KClJlc29sdmVkIGlzc3VlcwotLS0tLS0tLS0tLS0tLS0KCk90aGVyIGNoYW5nZXMK
LS0tLS0tLS0tLS0tLQotLS0KIC4uLm4zLXB5Y3J5cHRvZG9tZV8zLjIzLjAuYmIgPT4gcHl0aG9u
My1weWNyeXB0b2RvbWVfMy4yNC4wLmJifSB8IDIgKy0KIC4uLi1weWNyeXB0b2RvbWV4XzMuMjMu
MC5iYiA9PiBweXRob24zLXB5Y3J5cHRvZG9tZXhfMy4yNC4wLmJifSB8IDIgKy0KIDIgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHljcnlwdG9kb21lXzMuMjMuMC5iYiA9PiBw
eXRob24zLXB5Y3J5cHRvZG9tZV8zLjI0LjAuYmJ9ICg1NiUpCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMjMuMC5iYiA9PiBweXRo
b24zLXB5Y3J5cHRvZG9tZXhfMy4yNC4wLmJifSAoNzYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4yMy4wLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZV8zLjI0LjAuYmIK
c2ltaWxhcml0eSBpbmRleCA1NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZV8zLjIzLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4yNC4wLmJiCmluZGV4IDFi
MmE1ZWRkMzguLmY2ZTkzMDgyMGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4yMy4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4yNC4wLmJiCkBAIC0xLDYgKzEs
NiBAQAogcmVxdWlyZSBweXRob24tcHljcnlwdG9kb21lLmluYwogaW5oZXJpdCBweXRob25fc2V0
dXB0b29sc19idWlsZF9tZXRhCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0NDc3MDBhNjU3MTgy
ZDYwMzM4YmFiMDlmZGIyNzUxOGY4ODU2YWVjZDgwYWU0YzZiZGRkYjY3ZmY1ZGE0NGVmIgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjkxNDA3NzliNDA0MDU0NzZhNzk5MzA1YjlhYzFiY2FhYjRlZTY3
OTFkYzNkMzhiMTJhOWFhODRmZmJkNmFhYmYiCiAKIENWRV9QUk9EVUNUID0gInB5Y3J5cHRvZG9t
ZTpweWNyeXB0b2RvbWUiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcHljcnlwdG9kb21leF8zLjIzLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21leF8zLjI0LjAuYmIKc2ltaWxhcml0eSBpbmRleCA3
NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5
cHRvZG9tZXhfMy4yMy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcHljcnlwdG9kb21leF8zLjI0LjAuYmIKaW5kZXggZTIxMjBkOTk3Mi4uMjhkYzBl
OTk3NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5
Y3J5cHRvZG9tZXhfMy4yMy4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMjQuMC5iYgpAQCAtMSw3ICsxLDcgQEAKIHJlcXVpcmUg
cHl0aG9uLXB5Y3J5cHRvZG9tZS5pbmMKIGluaGVyaXQgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRf
bWV0YQogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzE5MDk3NThmMDEwYzgyYmM5OWIwYWJmNGVh
MTIwMTJjOTg5NjJmYmYwNTgzYzIxNjRmOGI4NDUzM2MyZTRkYSIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICIwNDI4ZjE5ZjEzNDUyYzZiODliYmFmMmM1MzBmODRmMzY5ODczODExZGZhNzdmMGNlZTBk
YTRmNDBmYjA0NzRmIgogCiBDVkVfUFJPRFVDVCA9ICJweWNyeXB0b2RvbWU6cHljcnlwdG9kb21l
IHB5Y3J5cHRvZG9tZTpweWNyeXB0b2RvbWV4IgogCi0tIAoyLjQ3LjEKCg==

--===============2276637447260527214==--

