Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A137C61DE0
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 05:44:18 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2182.1787982251345752843
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 22:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=A/lkmaQO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=vGzFRw+q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a04c0bffcb-7d700891-8d4d-4bed-a3f9-462c246f717e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787982250;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ir+udHlsI+NPMLiFhVhEn+b/s9VFgISW5RHuLqCXSDA=;
	b=A/lkmaQOLkEuGQSHxOmCTdwSYsod8Df0sKUDH2/Kw22MCtKmQmtw0pa7g8kBxNtR
	igldWpoQ5svu2ka6iXqv/wAdk42tiyIZ4+3QzEgLyt9KvL9XwssE4psI0zi1Jws3RbZ
	lYjTI0U+gEAEBRJr+tCUrfLg1fGe1WzMZi+2fch0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787982250;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ir+udHlsI+NPMLiFhVhEn+b/s9VFgISW5RHuLqCXSDA=;
	b=vGzFRw+qWKxxb/aehpRCslXuvirqfkxXNv2QdA6EOmVLNSWJ63Cu9k1sknIiDSY6
	j1EDbloqDY+rQNBAFVaVS2FhmP3bW79M3n2PVGPepgrSwXJAoxSH2OvAoJXxwOVIIxU
	bO8HLHfuP6o7YQ2N516iVn5dj5bqnYoDbuwVq/8c=
Content-Type: multipart/mixed; boundary="===============2667026037128850193=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-git: upgrading to 3.1.61 SUCCEEDED
Message-ID: <010101a04c0bffcb-7d700891-8d4d-4bed-a3f9-462c246f717e-000000@us-west-2.amazonses.com>
Date: Sat, 29 Aug 2026 05:44:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.29-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2026 05:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244623

--===============2667026037128850193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-git* to *3.1.61* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-git-upgrade-3.1.60-3.1.61.patch
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
From f1feaa76126e1dbf10f9c7e1a62d4b9541cb2577 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 29 Aug 2026 05:21:08 +0000
Subject: [PATCH] python3-git: upgrade 3.1.60 -> 3.1.61

Source: doc/source/changes.rst

3.1.61
======

A fixup release to avoid accidental removal of public class regex on Actor.
It's now deprecated instead.

If you can, also try and provide feedback on the upcoming v4 branch
https://github.com/gitpython-developers/GitPython/pull/2177 - patches welcome.

See the following for all changes.
https://github.com/gitpython-developers/GitPython/releases/tag/3.1.61
---
 .../python/{python3-git_3.1.60.bb => python3-git_3.1.61.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.60.bb => python3-git_3.1.61.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.60.bb b/meta/recipes-devtools/python/python3-git_3.1.61.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.60.bb
rename to meta/recipes-devtools/python/python3-git_3.1.61.bb
index 5becc0af58..975579e656 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.60.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.61.bb
@@ -14,7 +14,7 @@ CVE_PRODUCT = "gitpython_project:gitpython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "e936431879fa85581b4311fa63492ea52251909e2d655b6529c704c904ddcc24"
+SRC_URI[sha256sum] = "f51c24d8c0f733a195447385f5774a5dfe8767f5acfd7994a33755644c6ecc95"
 
 DEPENDS += " python3-gitdb"
 
-- 
2.47.1


--===============2667026037128850193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-git-changelog.txt"

Changelog for python3-git: 3.1.60 -> 3.1.61
Source: doc/source/changes.rst

3.1.61
======

A fixup release to avoid accidental removal of public class regex on Actor.
It's now deprecated instead.

If you can, also try and provide feedback on the upcoming v4 branch
https://github.com/gitpython-developers/GitPython/pull/2177 - patches welcome.

See the following for all changes.
https://github.com/gitpython-developers/GitPython/releases/tag/3.1.61

--===============2667026037128850193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-git/python3-git: FILELIST: directory renamed /usr/lib/python3.14/site-packages/gitpython-3.1.60.dist-info -> /usr/lib/python3.14/site-packages/gitpython-3.1.61.dist-info, directory renamed /usr/lib/python3.14/site-packages/gitpython-3.1.60.dist-info/licenses -> /usr/lib/python3.14/site-packages/gitpython-3.1.61.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-git (sysroot):
  /usr/lib/python3.14/site-packages/gitpython-3.1.60.dist-info moved to /usr/lib/python3.14/site-packages/gitpython-3.1.61.dist-info

--===============2667026037128850193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-git: PV changed from "3.1.60" to "3.1.61"
packages/x86-64-v3-poky-linux/python3-git: SRC_URI changed from "https://files.pythonhosted.org/packages/source/g/gitpython/gitpython-3.1.60.tar.gz;downloadfilename=gitpython-3.1.60.tar.gz" to "https://files.pythonhosted.org/packages/source/g/gitpython/gitpython-3.1.61.tar.gz;downloadfilename=gitpython-3.1.61.tar.gz"
packages/x86-64-v3-poky-linux/python3-git: PKGV changed from 3.1.60 [default] to 3.1.61 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-dbg: PV changed from "3.1.60" to "3.1.61"
packages/x86-64-v3-poky-linux/python3-git/python3-git-dbg: PKGV changed from 3.1.60 [default] to 3.1.61 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-dev: PV changed from "3.1.60" to "3.1.61"
packages/x86-64-v3-poky-linux/python3-git/python3-git-dev: PKGV changed from 3.1.60 [default] to 3.1.61 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-doc: PV changed from "3.1.60" to "3.1.61"
packages/x86-64-v3-poky-linux/python3-git/python3-git-doc: PKGV changed from 3.1.60 [default] to 3.1.61 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-locale: PV changed from "3.1.60" to "3.1.61"
packages/x86-64-v3-poky-linux/python3-git/python3-git-locale: PKGV changed from 3.1.60 [default] to 3.1.61 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-src: PV changed from "3.1.60" to "3.1.61"
packages/x86-64-v3-poky-linux/python3-git/python3-git-src: PKGV changed from 3.1.60 [default] to 3.1.61 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git-staticdev: PV changed from "3.1.60" to "3.1.61"
packages/x86-64-v3-poky-linux/python3-git/python3-git-staticdev: PKGV changed from 3.1.60 [default] to 3.1.61 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git: PKGSIZE changed from 1643376 to 1645411 (+0%)
packages/x86-64-v3-poky-linux/python3-git/python3-git: PV changed from "3.1.60" to "3.1.61"
packages/x86-64-v3-poky-linux/python3-git/python3-git: PKGV changed from 3.1.60 [default] to 3.1.61 [default]
packages/x86-64-v3-poky-linux/python3-git/python3-git: FILELIST: directory renamed /usr/lib/python3.14/site-packages/gitpython-3.1.60.dist-info -> /usr/lib/python3.14/site-packages/gitpython-3.1.61.dist-info, directory renamed /usr/lib/python3.14/site-packages/gitpython-3.1.60.dist-info/licenses -> /usr/lib/python3.14/site-packages/gitpython-3.1.61.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-git (sysroot):
  /usr/lib/python3.14/site-packages/gitpython-3.1.60.dist-info moved to /usr/lib/python3.14/site-packages/gitpython-3.1.61.dist-info

--===============2667026037128850193==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-git-upgrade-3.1.60-3.1.61.patch"

RnJvbSBmMWZlYWE3NjEyNmUxZGJmMTBmOWM3ZTFhNjJkNGI5NTQxY2IyNTc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjkgQXVnIDIwMjYgMDU6MjE6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWdpdDogdXBncmFkZSAzLjEuNjAgLT4gMy4xLjYxCgpTb3VyY2U6IGRvYy9zb3VyY2Uv
Y2hhbmdlcy5yc3QKCjMuMS42MQo9PT09PT0KCkEgZml4dXAgcmVsZWFzZSB0byBhdm9pZCBhY2Np
ZGVudGFsIHJlbW92YWwgb2YgcHVibGljIGNsYXNzIHJlZ2V4IG9uIEFjdG9yLgpJdCdzIG5vdyBk
ZXByZWNhdGVkIGluc3RlYWQuCgpJZiB5b3UgY2FuLCBhbHNvIHRyeSBhbmQgcHJvdmlkZSBmZWVk
YmFjayBvbiB0aGUgdXBjb21pbmcgdjQgYnJhbmNoCmh0dHBzOi8vZ2l0aHViLmNvbS9naXRweXRo
b24tZGV2ZWxvcGVycy9HaXRQeXRob24vcHVsbC8yMTc3IC0gcGF0Y2hlcyB3ZWxjb21lLgoKU2Vl
IHRoZSBmb2xsb3dpbmcgZm9yIGFsbCBjaGFuZ2VzLgpodHRwczovL2dpdGh1Yi5jb20vZ2l0cHl0
aG9uLWRldmVsb3BlcnMvR2l0UHl0aG9uL3JlbGVhc2VzL3RhZy8zLjEuNjEKLS0tCiAuLi4vcHl0
aG9uL3tweXRob24zLWdpdF8zLjEuNjAuYmIgPT4gcHl0aG9uMy1naXRfMy4xLjYxLmJifSAgICAg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWdpdF8zLjEuNjAuYmIg
PT4gcHl0aG9uMy1naXRfMy4xLjYxLmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1naXRfMy4xLjYwLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjEuNjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjEu
NjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1naXRf
My4xLjYxLmJiCmluZGV4IDViZWNjMGFmNTguLjk3NTU3OWU2NTYgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1naXRfMy4xLjYwLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1naXRfMy4xLjYxLmJiCkBAIC0xNCw3ICsx
NCw3IEBAIENWRV9QUk9EVUNUID0gImdpdHB5dGhvbl9wcm9qZWN0OmdpdHB5dGhvbiIKIAogaW5o
ZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gImU5MzY0MzE4NzlmYTg1NTgxYjQzMTFmYTYzNDkyZWE1MjI1MTkwOWUyZDY1NWI2NTI5
YzcwNGM5MDRkZGNjMjQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjUxYzI0ZDhjMGY3MzNhMTk1
NDQ3Mzg1ZjU3NzRhNWRmZTg3NjdmNWFjZmQ3OTk0YTMzNzU1NjQ0YzZlY2M5NSIKIAogREVQRU5E
UyArPSAiIHB5dGhvbjMtZ2l0ZGIiCiAKLS0gCjIuNDcuMQoK

--===============2667026037128850193==--

