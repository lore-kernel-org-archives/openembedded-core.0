Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21597.1794806387670919303
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 21:19:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Xjv6WumM;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=I6ehYM2F;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a1e2cc1b5c-2282b24f-9aa6-435c-8f79-f672cee62794-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794806389;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uLefTNyYBPu+xAxLgjHOYJTg9bTiyRvhOte9IA7LdyU=;
	b=Xjv6WumMy2ppHrExn0wWtUKwsGaTcflpQ+6B9Vw4MyYIKzVNrMyV0FChewPuDFRM
	iUdUrk7ZLiREpYzHRezs3LoUvIcZrya0w+IcB9gb3WJnHJORz5J9cWnJM29p2lqdxwR
	cb9iBFJb3WsJbh9WuXn0fAi6fzX9mXIw2G0oQR34=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794806389;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uLefTNyYBPu+xAxLgjHOYJTg9bTiyRvhOte9IA7LdyU=;
	b=I6ehYM2FvOPmFp9Z8f2naL+xaUalmEymgNEUaJEHWTXzHPduxc7QNa7zhKQ8wbOo
	C7z/cemwvMvUF21eZ2U4zJHs4eK77coeBI6vigNk7pQozbbgQziUWJPrUXRfzO0sve+
	M5hDqKWzL5/VQDYgdASla+sBq/ZU9ELd2LeaW4EE=
Content-Type: multipart/mixed; boundary="===============0562116737281702200=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 2.5.5 SUCCEEDED
Message-ID: <010101a1e2cc1b5c-2282b24f-9aa6-435c-8f79-f672cee62794-000000@us-west-2.amazonses.com>
Date: Mon, 16 Nov 2026 05:19:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 05:19:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250311

--===============0562116737281702200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-numpy* to *2.5.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-2.5.4-2.5.5.patch
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
From 65adec509b52c350f1896bd5e14ac77d02bb7760 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 16 Nov 2026 05:15:25 +0000
Subject: [PATCH] python3-numpy: upgrade 2.5.4 -> 2.5.5

Contributors
============

A total of 12 people contributed to this release.  People with a "+" by their
names contributed a patch for the first time.

Pull requests merged
====================

A total of 37 pull requests were merged for this release.
.. currentmodule:: numpy

=========================
NumPy 2.5.5 Release Notes
=========================

*Released on 2026-11-15.*

NumPy 2.5.5 is a patch release that fixes bugs discovered after the 2.5.4
release. It is unusually large for a patch release due to bugs discovered
during continuing work on strings for the upcoming 2.6.0 release, ongoing
threading work, the eMudhra compromise fixes, and updates in GitHub CI
infrastructure.

This release supports Python versions 3.12-3.15.

Compatibility notes
===================

  (`gh-33298 < >`__)

Contributors
============

A total of 12 people contributed to this release.  People with a "+" by their
names contributed a patch for the first time.

Pull requests merged
====================

A total of 37 pull requests were merged for this release.
---
 .../python/{python3-numpy_2.5.4.bb => python3-numpy_2.5.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.5.4.bb => python3-numpy_2.5.5.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.5.4.bb b/meta/recipes-devtools/python/python3-numpy_2.5.5.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-numpy_2.5.4.bb
rename to meta/recipes-devtools/python/python3-numpy_2.5.5.bb
index 275c49690b..e2004e8e0b 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.5.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.5.5.bb
@@ -10,7 +10,7 @@ SRCNAME = "numpy"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "9a94cf751c9ad8ebaa835bcd3d40dacf8534ad086b88c38029b65123c7999d2a"
+SRC_URI[sha256sum] = "5cddc243c75114ba845f01b1f87aca1572dbf7b6c2d88636ed3e1d2bccd7f1bf"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.47.1


--===============0562116737281702200==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-2.5.4-2.5.5.patch"

RnJvbSA2NWFkZWM1MDliNTJjMzUwZjE4OTZiZDVlMTRhYzc3ZDAyYmI3NzYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTYgTm92IDIwMjYgMDU6MTU6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW51bXB5OiB1cGdyYWRlIDIuNS40IC0+IDIuNS41CgpDb250cmlidXRvcnMKPT09PT09
PT09PT09CgpBIHRvdGFsIG9mIDEyIHBlb3BsZSBjb250cmlidXRlZCB0byB0aGlzIHJlbGVhc2Uu
ICBQZW9wbGUgd2l0aCBhICIrIiBieSB0aGVpcgpuYW1lcyBjb250cmlidXRlZCBhIHBhdGNoIGZv
ciB0aGUgZmlyc3QgdGltZS4KClB1bGwgcmVxdWVzdHMgbWVyZ2VkCj09PT09PT09PT09PT09PT09
PT09CgpBIHRvdGFsIG9mIDM3IHB1bGwgcmVxdWVzdHMgd2VyZSBtZXJnZWQgZm9yIHRoaXMgcmVs
ZWFzZS4KLi4gY3VycmVudG1vZHVsZTo6IG51bXB5Cgo9PT09PT09PT09PT09PT09PT09PT09PT09
Ck51bVB5IDIuNS41IFJlbGVhc2UgTm90ZXMKPT09PT09PT09PT09PT09PT09PT09PT09PQoKKlJl
bGVhc2VkIG9uIDIwMjYtMTEtMTUuKgoKTnVtUHkgMi41LjUgaXMgYSBwYXRjaCByZWxlYXNlIHRo
YXQgZml4ZXMgYnVncyBkaXNjb3ZlcmVkIGFmdGVyIHRoZSAyLjUuNApyZWxlYXNlLiBJdCBpcyB1
bnVzdWFsbHkgbGFyZ2UgZm9yIGEgcGF0Y2ggcmVsZWFzZSBkdWUgdG8gYnVncyBkaXNjb3ZlcmVk
CmR1cmluZyBjb250aW51aW5nIHdvcmsgb24gc3RyaW5ncyBmb3IgdGhlIHVwY29taW5nIDIuNi4w
IHJlbGVhc2UsIG9uZ29pbmcKdGhyZWFkaW5nIHdvcmssIHRoZSBlTXVkaHJhIGNvbXByb21pc2Ug
Zml4ZXMsIGFuZCB1cGRhdGVzIGluIEdpdEh1YiBDSQppbmZyYXN0cnVjdHVyZS4KClRoaXMgcmVs
ZWFzZSBzdXBwb3J0cyBQeXRob24gdmVyc2lvbnMgMy4xMi0zLjE1LgoKQ29tcGF0aWJpbGl0eSBu
b3Rlcwo9PT09PT09PT09PT09PT09PT09CgogIChgZ2gtMzMyOTggPCA+YF9fKQoKQ29udHJpYnV0
b3JzCj09PT09PT09PT09PQoKQSB0b3RhbCBvZiAxMiBwZW9wbGUgY29udHJpYnV0ZWQgdG8gdGhp
cyByZWxlYXNlLiAgUGVvcGxlIHdpdGggYSAiKyIgYnkgdGhlaXIKbmFtZXMgY29udHJpYnV0ZWQg
YSBwYXRjaCBmb3IgdGhlIGZpcnN0IHRpbWUuCgpQdWxsIHJlcXVlc3RzIG1lcmdlZAo9PT09PT09
PT09PT09PT09PT09PQoKQSB0b3RhbCBvZiAzNyBwdWxsIHJlcXVlc3RzIHdlcmUgbWVyZ2VkIGZv
ciB0aGlzIHJlbGVhc2UuCi0tLQogLi4uL3B5dGhvbi97cHl0aG9uMy1udW1weV8yLjUuNC5iYiA9
PiBweXRob24zLW51bXB5XzIuNS41LmJifSAgIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi97cHl0aG9uMy1udW1weV8yLjUuNC5iYiA9PiBweXRob24zLW51bXB5XzIuNS41LmJifSAo
OTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1u
dW1weV8yLjUuNC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1w
eV8yLjUuNS5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMi41LjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8yLjUuNS5iYgppbmRleCAyNzVjNDk2
OTBiLi5lMjAwNGU4ZTBiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtbnVtcHlfMi41LjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLW51bXB5XzIuNS41LmJiCkBAIC0xMCw3ICsxMCw3IEBAIFNSQ05BTUUgPSAibnVt
cHkiCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92JHtQVn0vJHtTUkNO
QU1FfS0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKICAgICAg
ICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjlhOTRjZjc1MWM5YWQ4ZWJhYTgzNWJjZDNk
NDBkYWNmODUzNGFkMDg2Yjg4YzM4MDI5YjY1MTIzYzc5OTlkMmEiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiNWNkZGMyNDNjNzUxMTRiYTg0NWYwMWIxZjg3YWNhMTU3MmRiZjdiNmMyZDg4NjM2ZWQz
ZTFkMmJjY2Q3ZjFiZiIKIAogR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9u
dW1weS9udW1weS9yZWxlYXNlcyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInJlbGVhc2VzL3Rh
Zy92Pyg/UDxwdmVyPlxkKyhcLlxkKykrKSQiCi0tIAoyLjQ3LjEKCg==

--===============0562116737281702200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-numpy-changelog.txt"

Contributors
============

A total of 12 people contributed to this release.  People with a "+" by their
names contributed a patch for the first time.

Pull requests merged
====================

A total of 37 pull requests were merged for this release.
.. currentmodule:: numpy

=========================
NumPy 2.5.5 Release Notes
=========================

*Released on 2026-11-15.*

NumPy 2.5.5 is a patch release that fixes bugs discovered after the 2.5.4
release. It is unusually large for a patch release due to bugs discovered
during continuing work on strings for the upcoming 2.6.0 release, ongoing
threading work, the eMudhra compromise fixes, and updates in GitHub CI
infrastructure.

This release supports Python versions 3.12-3.15.

Compatibility notes
===================

  (`gh-33298 < >`__)

Contributors
============

A total of 12 people contributed to this release.  People with a "+" by their
names contributed a patch for the first time.

Pull requests merged
====================

A total of 37 pull requests were merged for this release.

--===============0562116737281702200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/ma -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/ma, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/_core/src/umath/svml -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/_core/src/umath/svml, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/src/philox -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/random/src/philox, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/linalg/lapack_lite -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/linalg/lapack_lite, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/src/pcg64 -> /usr/lib/python3.14/site-packages/numpy-2.
 5.5.dist-info/licenses/numpy/random/src/pcg64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/src/mt19937 -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/random/src/mt19937, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/src/distributions -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/random/src/distributions, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/fft/pocketfft -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/fft/pocketfft, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/_core/src/
 common/pythoncapi-compat, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/_core/src/multiarray -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/_core/src/multiarray, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/src/sfc64 -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/random/src/sfc64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/_core/src/highway -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/_core/src/highway, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/src/splitmix64 -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/random/src/splitmix64, directo
 ry renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/random, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/_core/include/numpy/libdivide -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/_core/include/numpy/libdivide
Changes to packages/x86-64-v3-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info moved to /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info

--===============0562116737281702200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-numpy: PV changed from "2.5.4" to "2.5.5"
packages/x86-64-v3-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v2.5.4/numpy-2.5.4.tar.gz file://run-ptest" to "https://github.com/numpy/numpy/releases/download/v2.5.5/numpy-2.5.5.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-numpy: PKGV changed from 2.5.4 [default] to 2.5.5 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "2.5.4" to "2.5.5"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 2.5.4 [default] to 2.5.5 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 101316648 to 101368064 (+0%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "2.5.4" to "2.5.5"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 2.5.4 [default] to 2.5.5 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "2.5.4" to "2.5.5"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 2.5.4 [default] to 2.5.5 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "2.5.4" to "2.5.5"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 2.5.4 [default] to 2.5.5 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "2.5.4" to "2.5.5"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 2.5.4 [default] to 2.5.5 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PV changed from "2.5.4" to "2.5.5"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: FILELIST: directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/linalg -> /usr/src/debug/python3-numpy/2.5.5/numpy/linalg, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/random/src/legacy -> /usr/src/debug/python3-numpy/2.5.5/numpy/random/src/legacy, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_unary_complex.dispatch.h_X86_V3.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_unary_complex.dispatch.h_X86_V3.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_unary_complex.dispatch.h_X86_V4.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_unary_complex.dispatch.h_X86_V4.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_hyperbolic.dispatch.h_X86_V3.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_hyperbolic.dispatch.h_X86_V3.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/nu
 mpy/linalg/lapack_lite -> /usr/src/debug/python3-numpy/2.5.5/numpy/linalg/lapack_lite, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/include/numpy/random -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/include/numpy/random, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_exponent_log.dispatch.h_X86_V3.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_exponent_log.dispatch.h_baseline.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_exponent_log.dispatch.h_X86_V4.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_exponent_log.dispatch.h_X86_V3.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/random/src/mt19937 -> /usr/src/debug/python3-numpy/2.5.5/numpy/random/src/mt19937, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/random/include -> /usr/src/debug/python3-numpy/2.5.5/numpy/random/include, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/s
 rc/common/dlpack -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/src/common/dlpack, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_comparison.dispatch.h_X86_V4.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_comparison.dispatch.h_X86_V3.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/lib_simd.dispatch.h_X86_V4.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/lib_simd.dispatch.h_baseline.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/random/_bounded_integers.cpython-314-x86_64-linux-gnu.so.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/random/_bounded_integers.cpython-314-x86_64-linux-gnu.so.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_unary.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_unary.dispatch.h_baseline.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/random/_common.cpython-314-x86_64-linux-gnu.so.p -> /usr
 /src/debug/python3-numpy/2.5.5/numpy/random/_common.cpython-314-x86_64-linux-gnu.so.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libnpymath.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libnpymath.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/fft -> /usr/src/debug/python3-numpy/2.5.5/numpy/fft, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/multiarray/stringdtype -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/src/multiarray/stringdtype, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/common/simd/avx512 -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/src/common/simd/avx512, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_hyperbolic.dispatch.h_X86_V4.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_hyperbolic.dispatch.h_X86_V4.a.p, dire
 ctory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_autovec.dispatch.h_X86_V3.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_autovec.dispatch.h_baseline.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/common/pythoncapi-compat -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/src/common/pythoncapi-compat, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/npysort/x86-simd-sort/src -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/src/npysort/x86-simd-sort/src, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_unary_fp_le.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_unary_fp_le.dispatch.h_baseline.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_arithm_fp.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_arithm_fp.dispatch.h_X86_V3.a.p, directory renamed /usr/src/debug/python3-numpy/2.
 5.4/numpy/_core/_multiarray_tests.cpython-314-x86_64-linux-gnu.so.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/_multiarray_tests.cpython-314-x86_64-linux-gnu.so.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/_multiarray_umath.cpython-314-x86_64-linux-gnu.so.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/_multiarray_umath.cpython-314-x86_64-linux-gnu.so.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/common/simd -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/src/common/simd, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_umath_fp.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_umath_fp.dispatch.h_baseline.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/common/simd/avx2 -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/src/common/simd/avx2, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_half.dispatch.h_AVX512_SPR
 .a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_half.dispatch.h_baseline.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_unary.dispatch.h_X86_V3.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_unary.dispatch.h_X86_V3.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_unary.dispatch.h_X86_V4.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_unary.dispatch.h_X86_V4.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/fft/pocketfft -> /usr/src/debug/python3-numpy/2.5.5/numpy/fft/pocketfft, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libargfunc.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libargfunc.dispatch.h_X86_V4.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_unary_complex.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_unary_complex.dispatch.h_baseline.a.
 p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_umath_fp.dispatch.h_X86_V4.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_umath_fp.dispatch.h_X86_V4.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/_simd -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/src/_simd, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_half.dispatch.h_X86_V4.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_half.dispatch.h_AVX512_SPR.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/highway/hwy/ops -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/src/highway/hwy/ops, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/random/_sfc64.cpython-314-x86_64-linux-gnu.so.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/random/_sfc64.cpython-314-x86_64-linux-gnu.so.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_hyperbolic.dispatch.h_baseline.a.p -> /u
 sr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_hyperbolic.dispatch.h_baseline.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_minmax.dispatch.h_X86_V3.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_minmax.dispatch.h_X86_V4.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_minmax.dispatch.h_X86_V4.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_minmax.dispatch.h_X86_V3.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/random/src/distributions -> /usr/src/debug/python3-numpy/2.5.5/numpy/random/src/distributions, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/random/src/pcg64 -> /usr/src/debug/python3-numpy/2.5.5/numpy/random/src/pcg64, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/random/src/sfc64 -> /usr/src/debug/python3-numpy/2.5.5/numpy/random/src/sfc64, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/common -> /usr/src/debug
 /python3-numpy/2.5.5/numpy/_core/src/common, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_arithmetic.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_arithmetic.dispatch.h_baseline.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_comparison.dispatch.h_X86_V3.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_comparison.dispatch.h_baseline.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libargfunc.dispatch.h_X86_V4.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libargfunc.dispatch.h_X86_V3.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/lib_simd.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/lib_simd.dispatch.h_X86_V3.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libargfunc.dispatch.h_X86_V3.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libargfunc.dispatch.h_baseline.a.p, 
 directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/umath -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/src/umath, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/random/_generator.cpython-314-x86_64-linux-gnu.so.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/random/_generator.cpython-314-x86_64-linux-gnu.so.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_autovec.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_autovec.dispatch.h_X86_V3.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_arithmetic.dispatch.h_X86_V3.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_arithmetic.dispatch.h_X86_V3.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/lib_simd.dispatch.h_X86_V3.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/lib_simd.dispatch.h_X86_V4.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/common/sim
 d/sse -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/src/common/simd/sse, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_minmax.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_minmax.dispatch.h_baseline.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_modulo.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_modulo.dispatch.h_baseline.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/include/numpy -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/include/numpy, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_arithm_fp.dispatch.h_X86_V3.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_arithm_fp.dispatch.h_baseline.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/random/_philox.cpython-314-x86_64-linux-gnu.so.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/random/_philox.cpython-314-x86_6
 4-linux-gnu.so.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_comparison.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_comparison.dispatch.h_X86_V4.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/npysort -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/src/npysort, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/random/mtrand.cpython-314-x86_64-linux-gnu.so.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/random/mtrand.cpython-314-x86_64-linux-gnu.so.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_arithmetic.dispatch.h_X86_V4.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_arithmetic.dispatch.h_X86_V4.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/random/src/philox -> /usr/src/debug/python3-numpy/2.5.5/numpy/random/src/philox, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/random/bit_generator.cpython-314-x86_6
 4-linux-gnu.so.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/random/bit_generator.cpython-314-x86_64-linux-gnu.so.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/include/numpy/libdivide -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/include/numpy/libdivide, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_unary_fp.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_unary_fp.dispatch.h_baseline.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/_umath_tests.cpython-314-x86_64-linux-gnu.so.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/_umath_tests.cpython-314-x86_64-linux-gnu.so.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/multiarray -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/src/multiarray, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/highway/hwy -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/src/highway/hwy, directory re
 named /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/multiarray/textreading -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/src/multiarray/textreading, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_exponent_log.dispatch.h_baseline.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_exponent_log.dispatch.h_X86_V4.a.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/random/_mt19937.cpython-314-x86_64-linux-gnu.so.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/random/_mt19937.cpython-314-x86_64-linux-gnu.so.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/src/npymath -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/src/npymath, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/random/_pcg64.cpython-314-x86_64-linux-gnu.so.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/random/_pcg64.cpython-314-x86_64-linux-gnu.so.p, directory renamed /usr/src/debug/python3-numpy/2.5.4/numpy/_core/libloops_half.dispatch.h
 _baseline.a.p -> /usr/src/debug/python3-numpy/2.5.5/numpy/_core/libloops_half.dispatch.h_X86_V4.a.p
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 2.5.4 [default] to 2.5.5 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 57907738 to 57942650 (+0%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "2.5.4" to "2.5.5"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 2.5.4 [default] to 2.5.5 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy-staticdev: PKGSIZE changed from 357918 to 357910 (-0%)
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PV changed from "2.5.4" to "2.5.5"
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/_core/src/multiarray -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/_core/src/multiarray, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/random, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/_core/src/umath/svml -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/_core/src/umath/svml, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/ma -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/ma, directory renamed
  /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/_core/src/highway -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/_core/src/highway, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/src/distributions -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/random/src/distributions, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/fft/pocketfft -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/fft/pocketfft, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/linalg/lapack_lite -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/linalg/lapack_lite, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/_core/include/numpy/libdivide -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/_core/include
 /numpy/libdivide, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/src/sfc64 -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/random/src/sfc64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/src/pcg64 -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/random/src/pcg64, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/src/philox -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/random/src/philox, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/src/mt19937 -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/random/src/mt19937, directory renamed /usr/lib/python3.14/site-pack
 ages/numpy-2.5.4.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort, directory renamed /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/src/splitmix64 -> /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info/licenses/numpy/random/src/splitmix64
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PKGV changed from 2.5.4 [default] to 2.5.5 [default]
packages/x86-64-v3-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 41682479 to 41731037 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.14/site-packages/numpy-2.5.4.dist-info moved to /usr/lib/python3.14/site-packages/numpy-2.5.5.dist-info

--===============0562116737281702200==--
