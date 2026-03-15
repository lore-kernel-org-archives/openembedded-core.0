Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20DD9F013EF
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:42:12 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28973.1773582118433347674
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:41:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=xToEXo+Q;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=A3THh2Kw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019cf1bb723f-da14a344-9440-403c-81bb-466d49084a43-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582119;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3ac7Tdc07T+PWg9yK6FdJUQnoJPWTgyT7Fipdgezi/0=;
	b=xToEXo+QZb+SjXKpuiMZhJeOjpgdgsCyttwtD5svjDkmn5ouNcrs87u8MosqsMS0
	nevzitFNQmC4pOV+nE6rEZ/NstmKp/A5QYc0btQef7a0+xB6NyhhFzSkBlz4vHbznla
	yOnfVWopbenznt/KCRxsLsa/BBBKydPciyAWgPd8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582119;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3ac7Tdc07T+PWg9yK6FdJUQnoJPWTgyT7Fipdgezi/0=;
	b=A3THh2KwX/wyFNRGibGLG8CV0W3iMUj8FgiYc3Ff1qyiJ8aieKD84OTQXMwemviL
	b/1MVNzBPNPunw3yG1XfOJh8bjQQQ2nAmFGKdIxOo4jw8r44Kbkmf2tW/6i7vZ7mWIV
	/LE7vngkluRHzRSRKyNwJJ1F6Bbzw+i0sE2kqaGA=
Content-Type: multipart/mixed; boundary="===============6798173211876690394=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-testtools: upgrading to 2.8.7 SUCCEEDED
Message-ID: <0101019cf1bb723f-da14a344-9440-403c-81bb-466d49084a43-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:41:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:42:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233151

--===============6798173211876690394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-testtools* to *2.8.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-testtools-upgrade-2.8.3-2.8.7.patch
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
From aac88f37ca3b564e814796583798b51dd28fbe22 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 08:43:00 +0000
Subject: [PATCH] python3-testtools: upgrade 2.8.3 -> 2.8.7

---
 .../{python3-testtools_2.8.3.bb => python3-testtools_2.8.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-testtools_2.8.3.bb => python3-testtools_2.8.7.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-testtools_2.8.3.bb b/meta/recipes-devtools/python/python3-testtools_2.8.7.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-testtools_2.8.3.bb
rename to meta/recipes-devtools/python/python3-testtools_2.8.7.bb
index 2ac8759784..db3ec2373d 100644
--- a/meta/recipes-devtools/python/python3-testtools_2.8.3.bb
+++ b/meta/recipes-devtools/python/python3-testtools_2.8.7.bb
@@ -8,7 +8,7 @@ DEPENDS += "python3-hatch-vcs-native"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "3b54b543a7583a35f65538b1d36a327fc34943a26bb839bcbe4b2c5e085aa939"
+SRC_URI[sha256sum] = "1aa19aaabf9736385fc111a95f94f6b0661c0b41e65ca5129223eb518c63e8b9"
 
 RDEPENDS:${PN} += "\
     python3-compression \
-- 
2.47.1


--===============6798173211876690394==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-testtools-upgrade-2.8.3-2.8.7.patch"

RnJvbSBhYWM4OGYzN2NhM2I1NjRlODE0Nzk2NTgzNzk4YjUxZGQyOGZiZTIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMDg6NDM6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRlc3R0b29sczogdXBncmFkZSAyLjguMyAtPiAyLjguNwoKLS0tCiAuLi4ve3B5dGhv
bjMtdGVzdHRvb2xzXzIuOC4zLmJiID0+IHB5dGhvbjMtdGVzdHRvb2xzXzIuOC43LmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXRlc3R0b29sc18yLjguMy5i
YiA9PiBweXRob24zLXRlc3R0b29sc18yLjguNy5iYn0gKDg0JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdGVzdHRvb2xzXzIuOC4zLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRlc3R0b29sc18yLjguNy5iYgpzaW1p
bGFyaXR5IGluZGV4IDg0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtdGVzdHRvb2xzXzIuOC4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtdGVzdHRvb2xzXzIuOC43LmJiCmluZGV4IDJhYzg3NTk3ODQuLmRi
M2VjMjM3M2QgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My10ZXN0dG9vbHNfMi44LjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXRlc3R0b29sc18yLjguNy5iYgpAQCAtOCw3ICs4LDcgQEAgREVQRU5EUyArPSAicHl0
aG9uMy1oYXRjaC12Y3MtbmF0aXZlIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2hhdGNobGluZwog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2I1NGI1NDNhNzU4M2EzNWY2NTUzOGIxZDM2YTMyN2Zj
MzQ5NDNhMjZiYjgzOWJjYmU0YjJjNWUwODVhYTkzOSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIx
YWExOWFhYWJmOTczNjM4NWZjMTExYTk1Zjk0ZjZiMDY2MWMwYjQxZTY1Y2E1MTI5MjIzZWI1MThj
NjNlOGI5IgogCiBSREVQRU5EUzoke1BOfSArPSAiXAogICAgIHB5dGhvbjMtY29tcHJlc3Npb24g
XAotLSAKMi40Ny4xCgo=

--===============6798173211876690394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-testtools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/testtools/testtools-2.8.3.tar.gz;downloadfilename=testtools-2.8.3.tar.gz" to "https://files.pythonhosted.org/packages/source/t/testtools/testtools-2.8.7.tar.gz;downloadfilename=testtools-2.8.7.tar.gz"
packages/x86-64-v3-poky-linux/python3-testtools: PV changed from "2.8.3" to "2.8.7"
packages/x86-64-v3-poky-linux/python3-testtools: PKGV changed from 2.8.3 [default] to 2.8.7 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-dbg: PV changed from "2.8.3" to "2.8.7"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-dbg: PKGV changed from 2.8.3 [default] to 2.8.7 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-dev: PV changed from "2.8.3" to "2.8.7"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-dev: PKGV changed from 2.8.3 [default] to 2.8.7 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-doc: PV changed from "2.8.3" to "2.8.7"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-doc: PKGV changed from 2.8.3 [default] to 2.8.7 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-locale: PV changed from "2.8.3" to "2.8.7"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-locale: PKGV changed from 2.8.3 [default] to 2.8.7 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-src: PV changed from "2.8.3" to "2.8.7"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-src: PKGV changed from 2.8.3 [default] to 2.8.7 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-staticdev: PV changed from "2.8.3" to "2.8.7"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-staticdev: PKGV changed from 2.8.3 [default] to 2.8.7 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: PV changed from "2.8.3" to "2.8.7"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: PKGV changed from 2.8.3 [default] to 2.8.7 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/testtools-2.8.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/testtools-2.8.7.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/testtools-2.8.3.dist-info -> /usr/lib/python3.14/site-packages/testtools-2.8.7.dist-info, added "/usr/lib/python3.14/site-packages/testtools/tests/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/testtools/tests/helpers.py /usr/lib/python3.14/site-packages/testtools/tests/matchers/__init__.py /usr/lib/python3.14/site-packages/testtools/matchers/__pycache__/test.cpython-314.pyc /usr/lib/python3.14/site-packages/testtools/tests/__pycache__/helpers.cpython-314.pyc /usr/lib/python3.14/site-packages/testtools/matchers/test.py /usr/lib/python3.14/site-packages/testtools/tests/matchers/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/testtools/tests/__init__.py /u
 sr/lib/python3.14/site-packages/testtools/tests/matchers/__pycache__/helpers.cpython-314.pyc /usr/lib/python3.14/site-packages/testtools/tests/matchers/helpers.py"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: PKGSIZE changed from 949412 to 979979 (+3%)
Changes to packages/x86-64-v3-poky-linux/python3-testtools (sysroot):
  /usr/lib/python3.14/site-packages/testtools-2.8.3.dist-info moved to /usr/lib/python3.14/site-packages/testtools-2.8.7.dist-info
  /usr/lib/python3.14/site-packages/testtools/matchers/__pycache__/test.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/testtools/matchers/test.py was added
  /usr/lib/python3.14/site-packages/testtools/tests was added
  /usr/lib/python3.14/site-packages/testtools/tests/helpers.py was added
  /usr/lib/python3.14/site-packages/testtools/tests/__init__.py was added
  /usr/lib/python3.14/site-packages/testtools/tests/matchers was added
  /usr/lib/python3.14/site-packages/testtools/tests/matchers/helpers.py was added
  /usr/lib/python3.14/site-packages/testtools/tests/matchers/__init__.py was added
  /usr/lib/python3.14/site-packages/testtools/tests/matchers/__pycache__ was added
  /usr/lib/python3.14/site-packages/testtools/tests/matchers/__pycache__/helpers.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/testtools/tests/matchers/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/testtools/tests/__pycache__ was added
  /usr/lib/python3.14/site-packages/testtools/tests/__pycache__/helpers.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/testtools/tests/__pycache__/__init__.cpython-314.pyc was added

--===============6798173211876690394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/testtools-2.8.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/testtools-2.8.7.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/testtools-2.8.3.dist-info -> /usr/lib/python3.14/site-packages/testtools-2.8.7.dist-info, added "/usr/lib/python3.14/site-packages/testtools/tests/matchers/helpers.py /usr/lib/python3.14/site-packages/testtools/tests/__pycache__/helpers.cpython-314.pyc /usr/lib/python3.14/site-packages/testtools/tests/helpers.py /usr/lib/python3.14/site-packages/testtools/matchers/test.py /usr/lib/python3.14/site-packages/testtools/tests/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/testtools/matchers/__pycache__/test.cpython-314.pyc /usr/lib/python3.14/site-packages/testtools/tests/__init__.py /usr/lib/python3.14/site-packages/testtools/tests/matchers/__pycache__/helpers.cpython-314.pyc /usr
 /lib/python3.14/site-packages/testtools/tests/matchers/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/testtools/tests/matchers/__init__.py"
Changes to packages/x86-64-v3-poky-linux/python3-testtools (sysroot):
  /usr/lib/python3.14/site-packages/testtools-2.8.3.dist-info moved to /usr/lib/python3.14/site-packages/testtools-2.8.7.dist-info
  /usr/lib/python3.14/site-packages/testtools/matchers/__pycache__/test.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/testtools/matchers/test.py was added
  /usr/lib/python3.14/site-packages/testtools/tests was added
  /usr/lib/python3.14/site-packages/testtools/tests/helpers.py was added
  /usr/lib/python3.14/site-packages/testtools/tests/__init__.py was added
  /usr/lib/python3.14/site-packages/testtools/tests/matchers was added
  /usr/lib/python3.14/site-packages/testtools/tests/matchers/helpers.py was added
  /usr/lib/python3.14/site-packages/testtools/tests/matchers/__init__.py was added
  /usr/lib/python3.14/site-packages/testtools/tests/matchers/__pycache__ was added
  /usr/lib/python3.14/site-packages/testtools/tests/matchers/__pycache__/helpers.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/testtools/tests/matchers/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/testtools/tests/__pycache__ was added
  /usr/lib/python3.14/site-packages/testtools/tests/__pycache__/helpers.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/testtools/tests/__pycache__/__init__.cpython-314.pyc was added

--===============6798173211876690394==--

