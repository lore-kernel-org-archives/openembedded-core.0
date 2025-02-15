Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7792C021AC
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:20 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.8090.1739623329780371044
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=G7YBIMHC;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=bUFPJde0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019509a193ab-c61b8428-1232-4e3d-b4fe-bf45db0238f2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ieAm+y27lItqshWciKm1XtnjOHzgj8pk87/V/nrTHuk=;
	b=G7YBIMHC/XJ2TfZ6XnNSOWOE5Oi5/wxmD/qtSwO2k4OkVp0AZzig/Axl7o+C7aGb
	FZzq/1ijxN4Ip2EBhIiJ6wZ5FmMCg+SqqodXAoqav0KwlwJpQAUzMQiwPm2xSSvIR8X
	x+Xo8m8BENBsXa6gwZ4HI0Gaw8hhbgBQPg4OBHCE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ieAm+y27lItqshWciKm1XtnjOHzgj8pk87/V/nrTHuk=;
	b=bUFPJde0of1q27//VcxKf7dIQlPiGP8jWGzvi5R0XwbVLVqELFP9psVuDfL5E7+d
	slLVNsCGrYutY2zPJCLP35JKmjbiVYk+eJPbr2T1HCSMOg8ZR+5qF1FktiXCZmVaYmO
	/Lr5LYAWfSoOo/5XxH+athP6G81HTukis3dk3O0U=
Content-Type: multipart/mixed; boundary="===============9009260604112322970=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pip: upgrading to 25.0.1 SUCCEEDED
Message-ID: <0101019509a193ab-c61b8428-1232-4e3d-b4fe-bf45db0238f2-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211429

--===============9009260604112322970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pip* to *25.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pip-upgrade-25.0-25.0.1.patch
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
From d1b7e089ced9901db2a4b43c52ee5d6008f64eec Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 08:12:28 +0000
Subject: [PATCH] python3-pip: upgrade 25.0 -> 25.0.1

---
 .../python/python3-pip/no_shebang_mangling.patch                | 2 +-
 .../python/{python3-pip_25.0.bb => python3-pip_25.0.1.bb}       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_25.0.bb => python3-pip_25.0.1.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
index 71836dca07..0b7bf7d484 100644
--- a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
+++ b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
@@ -1,4 +1,4 @@
-From a715a622989ac182d18f6f2ada8201122282d889 Mon Sep 17 00:00:00 2001
+From d329b5a6c008c04df69b03b1b0a7e37e83210052 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 23 Feb 2022 12:27:06 +0000
 Subject: [PATCH] python3-pip: Don't change shebang
diff --git a/meta/recipes-devtools/python/python3-pip_25.0.bb b/meta/recipes-devtools/python/python3-pip_25.0.1.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-pip_25.0.bb
rename to meta/recipes-devtools/python/python3-pip_25.0.1.bb
index 8908fc9115..e54e63cba5 100644
--- a/meta/recipes-devtools/python/python3-pip_25.0.bb
+++ b/meta/recipes-devtools/python/python3-pip_25.0.1.bb
@@ -27,7 +27,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "8e0a97f7b4c47ae4a494560da84775e9e2f671d415d8d828e052efefb206b30b"
+SRC_URI[sha256sum] = "88f96547ea48b940a3a385494e181e29fb8637898f88d88737c5049780f196ea"
 
 RDEPENDS:${PN} = "\
   python3-compile \
-- 
2.44.1


--===============9009260604112322970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pip: PKGV changed from 25.0 [default] to 25.0.1 [default]
packages/core2-64-poky-linux/python3-pip: PV changed from "25.0" to "25.0.1"
packages/core2-64-poky-linux/python3-pip: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pip/pip-25.0.tar.gz;downloadfilename=pip-25.0.tar.gz file://no_shebang_mangling.patch" to "https://files.pythonhosted.org/packages/source/p/pip/pip-25.0.1.tar.gz;downloadfilename=pip-25.0.1.tar.gz file://no_shebang_mangling.patch"
packages/core2-64-poky-linux/python3-pip/python3-pip-dbg: PKGV changed from 25.0 [default] to 25.0.1 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip-dbg: PV changed from "25.0" to "25.0.1"
packages/core2-64-poky-linux/python3-pip/python3-pip-dev: PKGV changed from 25.0 [default] to 25.0.1 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip-dev: PV changed from "25.0" to "25.0.1"
packages/core2-64-poky-linux/python3-pip/python3-pip-doc: PKGV changed from 25.0 [default] to 25.0.1 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip-doc: PV changed from "25.0" to "25.0.1"
packages/core2-64-poky-linux/python3-pip/python3-pip-locale: PKGV changed from 25.0 [default] to 25.0.1 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip-locale: PV changed from "25.0" to "25.0.1"
packages/core2-64-poky-linux/python3-pip/python3-pip-src: PKGV changed from 25.0 [default] to 25.0.1 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip-src: PV changed from "25.0" to "25.0.1"
packages/core2-64-poky-linux/python3-pip/python3-pip-staticdev: PKGV changed from 25.0 [default] to 25.0.1 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip-staticdev: PV changed from "25.0" to "25.0.1"
packages/core2-64-poky-linux/python3-pip/python3-pip: PKGV changed from 25.0 [default] to 25.0.1 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip: PV changed from "25.0" to "25.0.1"
packages/core2-64-poky-linux/python3-pip/python3-pip: PKGSIZE changed from 11068145 to 11068176 (+0%)
Changes to packages/core2-64-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.13/site-packages/pip-25.0.1.dist-info was added
  /usr/lib/python3.13/site-packages/pip-25.0.1.dist-info/AUTHORS.txt was added
  /usr/lib/python3.13/site-packages/pip-25.0.1.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/pip-25.0.1.dist-info/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/pip-25.0.1.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/pip-25.0.1.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/pip-25.0.1.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/pip-25.0.dist-info was removed
  /usr/lib/python3.13/site-packages/pip-25.0.dist-info/AUTHORS.txt was removed
  /usr/lib/python3.13/site-packages/pip-25.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/pip-25.0.dist-info/LICENSE.txt was removed
  /usr/lib/python3.13/site-packages/pip-25.0.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/pip-25.0.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/pip-25.0.dist-info/WHEEL was removed

--===============9009260604112322970==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pip-upgrade-25.0-25.0.1.patch"

RnJvbSBkMWI3ZTA4OWNlZDk5MDFkYjJhNGI0M2M1MmVlNWQ2MDA4ZjY0ZWVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMDg6MTI6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBpcDogdXBncmFkZSAyNS4wIC0+IDI1LjAuMQoKLS0tCiAuLi4vcHl0aG9uL3B5dGhv
bjMtcGlwL25vX3NoZWJhbmdfbWFuZ2xpbmcucGF0Y2ggICAgICAgICAgICAgICAgfCAyICstCiAu
Li4vcHl0aG9uL3tweXRob24zLXBpcF8yNS4wLmJiID0+IHB5dGhvbjMtcGlwXzI1LjAuMS5iYn0g
ICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXBpcF8y
NS4wLmJiID0+IHB5dGhvbjMtcGlwXzI1LjAuMS5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwL25vX3NoZWJhbmdfbWFuZ2xpbmcu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwL25vX3NoZWJh
bmdfbWFuZ2xpbmcucGF0Y2gKaW5kZXggNzE4MzZkY2EwNy4uMGI3YmY3ZDQ4NCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBpcC9ub19zaGViYW5nX21h
bmdsaW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
aXAvbm9fc2hlYmFuZ19tYW5nbGluZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYTcxNWE2
MjI5ODlhYzE4MmQxOGY2ZjJhZGE4MjAxMTIyMjgyZDg4OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gZDMyOWI1YTZjMDA4YzA0ZGY2OWIwM2IxYjBhN2UzN2U4MzIxMDA1MiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBs
aW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogV2VkLCAyMyBGZWIgMjAyMiAxMjoyNzowNiArMDAw
MAogU3ViamVjdDogW1BBVENIXSBweXRob24zLXBpcDogRG9uJ3QgY2hhbmdlIHNoZWJhbmcKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXBfMjUuMC5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXBfMjUuMC4xLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1waXBfMjUuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXBpcF8yNS4wLjEuYmIKaW5kZXggODkwOGZjOTExNS4uZTU0ZTYzY2JhNSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBpcF8yNS4w
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXBfMjUuMC4x
LmJiCkBAIC0yNyw3ICsyNyw3IEBAIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWls
ZF9tZXRhCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly9ub19zaGViYW5nX21hbmdsaW5nLnBhdGNoIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGUwYTk3ZjdiNGM0N2FlNGE0OTQ1NjBkYTg0Nzc1ZTll
MmY2NzFkNDE1ZDhkODI4ZTA1MmVmZWZiMjA2YjMwYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4
OGY5NjU0N2VhNDhiOTQwYTNhMzg1NDk0ZTE4MWUyOWZiODYzNzg5OGY4OGQ4ODczN2M1MDQ5Nzgw
ZjE5NmVhIgogCiBSREVQRU5EUzoke1BOfSA9ICJcCiAgIHB5dGhvbjMtY29tcGlsZSBcCi0tIAoy
LjQ0LjEKCg==

--===============9009260604112322970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.13/site-packages/pip-25.0.1.dist-info was added
  /usr/lib/python3.13/site-packages/pip-25.0.1.dist-info/AUTHORS.txt was added
  /usr/lib/python3.13/site-packages/pip-25.0.1.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/pip-25.0.1.dist-info/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/pip-25.0.1.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/pip-25.0.1.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/pip-25.0.1.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/pip-25.0.dist-info was removed
  /usr/lib/python3.13/site-packages/pip-25.0.dist-info/AUTHORS.txt was removed
  /usr/lib/python3.13/site-packages/pip-25.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/pip-25.0.dist-info/LICENSE.txt was removed
  /usr/lib/python3.13/site-packages/pip-25.0.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/pip-25.0.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/pip-25.0.dist-info/WHEEL was removed

--===============9009260604112322970==--

