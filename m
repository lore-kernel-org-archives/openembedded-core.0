Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 026AECA5FF0
	for <webhook@archiver.kernel.org>; Sun,  4 Oct 2026 05:24:53 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18734.1791091482909094221
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 22:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=T/Z8OKVN;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=0BLcQ51u;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a1055f1d79-11406d2f-b5c2-447c-a3ed-6b1be89499de-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791091482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hThOCm5qyhBxaThTIRempNdWQIyWzq/0uimV/otlD1w=;
	b=T/Z8OKVNyW/EzQKtTRV+qcQH2pc/MPjAdqE3MZ+VzemMZu2G56miTEFLycZrPKNZ
	s0FcAOHxDaHDpvaIwpk4+udy1hiiJ5mF4vlpoHpeIlm1KgXl1PvlcDJoofFLb9N0Eds
	uTNufvrmrg7vrkVWGxH1Oshsg2YF5cRhAiP9MuVE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791091482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hThOCm5qyhBxaThTIRempNdWQIyWzq/0uimV/otlD1w=;
	b=0BLcQ51uw2/cHRJlY+rmRG5Td+x+0OADkO+JgRgZ4gKEk2TTAhC6VjLcmMtNNyT9
	YlQGxMM9yjm8BTJyqULSw7IaYrjo6OJUKn4r59UmEYoWGalMgzBon8E5DnrgNh28oej
	KW75Ss909HWpzuzEwea7NTIRzuiPqRenYBycaKyA=
Content-Type: multipart/mixed; boundary="===============0012781390322189507=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-zipp: upgrading to 4.1.1 SUCCEEDED
Message-ID: <010101a1055f1d79-11406d2f-b5c2-447c-a3ed-6b1be89499de-000000@us-west-2.amazonses.com>
Date: Sun, 4 Oct 2026 05:24:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.04-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Oct 2026 05:24:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247191

--===============0012781390322189507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-zipp* to *4.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-zipp-upgrade-4.1.0-4.1.1.patch
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
From d3cdb2f60dcc5e415b98c87eec1bedac337557d1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 4 Oct 2026 05:19:28 +0000
Subject: [PATCH] python3-zipp: upgrade 4.1.0 -> 4.1.1

v4.1.1
======

Bugfixes
--------

- Correct ``!`` negation and literal ``^`` characters in character classes in
  ``Path.glob`` and ``Path.rglob``, without matching path separators.
---
 .../python/{python3-zipp_4.1.0.bb => python3-zipp_4.1.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_4.1.0.bb => python3-zipp_4.1.1.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-zipp_4.1.0.bb b/meta/recipes-devtools/python/python3-zipp_4.1.1.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-zipp_4.1.0.bb
rename to meta/recipes-devtools/python/python3-zipp_4.1.1.bb
index ca3f1250c3..246a54dea2 100644
--- a/meta/recipes-devtools/python/python3-zipp_4.1.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_4.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2e21c3f75eb8d9427c8a611a8e83e9d6"
 
-SRC_URI[sha256sum] = "4cb57381f544315db7688e976e922a2b18cdb513d21cc194eb42232ba2a3e602"
+SRC_URI[sha256sum] = "7ebb7a44c021b29fd8dbd7cce6812d0d7b5b454521f93cc71af6ccd155aaa70b"
 
 DEPENDS += "python3-setuptools-scm-native python3-coherent-licensed-native"
 
-- 
2.47.1


--===============0012781390322189507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp: FILELIST: directory renamed /usr/lib/python3.14/site-packages/zipp-4.1.0.dist-info -> /usr/lib/python3.14/site-packages/zipp-4.1.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/zipp-4.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/zipp-4.1.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.14/site-packages/zipp-4.1.0.dist-info moved to /usr/lib/python3.14/site-packages/zipp-4.1.1.dist-info

--===============0012781390322189507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-zipp: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/python3-zipp: SRC_URI changed from "https://files.pythonhosted.org/packages/source/z/zipp/zipp-4.1.0.tar.gz" to "https://files.pythonhosted.org/packages/source/z/zipp/zipp-4.1.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-zipp: PV changed from "4.1.0" to "4.1.1"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-dbg: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-dbg: PV changed from "4.1.0" to "4.1.1"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-dev: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-dev: PV changed from "4.1.0" to "4.1.1"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-doc: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-doc: PV changed from "4.1.0" to "4.1.1"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-locale: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-locale: PV changed from "4.1.0" to "4.1.1"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-src: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-src: PV changed from "4.1.0" to "4.1.1"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-staticdev: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-staticdev: PV changed from "4.1.0" to "4.1.1"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp: PKGSIZE changed from 53725 to 56251 (+5%)
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp: PV changed from "4.1.0" to "4.1.1"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp: FILELIST: directory renamed /usr/lib/python3.14/site-packages/zipp-4.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/zipp-4.1.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/zipp-4.1.0.dist-info -> /usr/lib/python3.14/site-packages/zipp-4.1.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.14/site-packages/zipp-4.1.0.dist-info moved to /usr/lib/python3.14/site-packages/zipp-4.1.1.dist-info

--===============0012781390322189507==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-zipp-upgrade-4.1.0-4.1.1.patch"

RnJvbSBkM2NkYjJmNjBkY2M1ZTQxNWI5OGM4N2VlYzFiZWRhYzMzNzU1N2QxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgNCBPY3QgMjAyNiAwNToxOToyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtemlwcDogdXBncmFkZSA0LjEuMCAtPiA0LjEuMQoKdjQuMS4xCj09PT09PQoKQnVnZml4
ZXMKLS0tLS0tLS0KCi0gQ29ycmVjdCBgYCFgYCBuZWdhdGlvbiBhbmQgbGl0ZXJhbCBgYF5gYCBj
aGFyYWN0ZXJzIGluIGNoYXJhY3RlciBjbGFzc2VzIGluCiAgYGBQYXRoLmdsb2JgYCBhbmQgYGBQ
YXRoLnJnbG9iYGAsIHdpdGhvdXQgbWF0Y2hpbmcgcGF0aCBzZXBhcmF0b3JzLgotLS0KIC4uLi9w
eXRob24ve3B5dGhvbjMtemlwcF80LjEuMC5iYiA9PiBweXRob24zLXppcHBfNC4xLjEuYmJ9ICAg
ICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtemlwcF80LjEuMC5i
YiA9PiBweXRob24zLXppcHBfNC4xLjEuYmJ9ICg4MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXppcHBfNC4xLjAuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtemlwcF80LjEuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDgz
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtemlwcF80
LjEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXpp
cHBfNC4xLjEuYmIKaW5kZXggY2EzZjEyNTBjMy4uMjQ2YTU0ZGVhMiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXppcHBfNC4xLjAuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXppcHBfNC4xLjEuYmIKQEAgLTMsNyAr
Myw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9qYXJhY28vemlwcCIKIExJQ0VO
U0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MmUyMWMz
Zjc1ZWI4ZDk0MjdjOGE2MTFhOGU4M2U5ZDYiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0Y2I1
NzM4MWY1NDQzMTVkYjc2ODhlOTc2ZTkyMmEyYjE4Y2RiNTEzZDIxY2MxOTRlYjQyMjMyYmEyYTNl
NjAyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdlYmI3YTQ0YzAyMWIyOWZkOGRiZDdjY2U2ODEy
ZDBkN2I1YjQ1NDUyMWY5M2NjNzFhZjZjY2QxNTVhYWE3MGIiCiAKIERFUEVORFMgKz0gInB5dGhv
bjMtc2V0dXB0b29scy1zY20tbmF0aXZlIHB5dGhvbjMtY29oZXJlbnQtbGljZW5zZWQtbmF0aXZl
IgogCi0tIAoyLjQ3LjEKCg==

--===============0012781390322189507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-zipp-changelog.txt"

v4.1.1
======

Bugfixes
--------

- Correct ``!`` negation and literal ``^`` characters in character classes in
  ``Path.glob`` and ``Path.rglob``, without matching path separators.

--===============0012781390322189507==--

