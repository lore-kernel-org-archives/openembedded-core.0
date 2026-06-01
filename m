Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D39CD8C9E
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:47 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1550.1780328126408579369
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WIccsuy5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=s08IPlL8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019e83d38dc9-e23b41b4-4678-4505-b578-b4ec541926ab-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328140;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3DxbZ/GetCgcza4D9mW01usX7DtB9WC248JQoVtt/Io=;
	b=WIccsuy5aWEiZSbtY6Wcp0RIyK/BJJj/BobUxztEDsMK7OQOdVRmN07ikI+/B39T
	qIh4jUCr/4v7u9LFNIQ5l8vMrszooq3K0YctdpO8tUvhLWOzgE7X8BcO2enOmScIsZQ
	vqd+uE0stwNxsYOyUGTjxk514b0NZ62WebQncCdQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328140;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3DxbZ/GetCgcza4D9mW01usX7DtB9WC248JQoVtt/Io=;
	b=s08IPlL8HUzZaqT4CAGV/55HUSaet7Eu6jA1h8nECMtkar59W82EJpB3T04nOHjf
	RIHzQQqjB+jXuqM7eYGQ25oHs6QRLP0Pr4pp19nntDGfkxpk75j6EkSQpseKst5a+x4
	Nuz96KHB+vDV+z4bm/LGyRY0/Xxtf5MzAm7sxjiI=
Content-Type: multipart/mixed; boundary="===============0075909190974222915=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pip: upgrading to 26.1.2 SUCCEEDED
Message-ID: <0101019e83d38dc9-e23b41b4-4678-4505-b578-b4ec541926ab-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237887

--===============0075909190974222915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pip* to *26.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pip-upgrade-26.1.1-26.1.2.patch
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
From d2783a42abbabe11ad06d15175d12ab9a8b7ae47 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 09:09:43 +0000
Subject: [PATCH] python3-pip: upgrade 26.1.1 -> 26.1.2

---
 .../python/python3-pip/no_shebang_mangling.patch                | 2 +-
 .../python/{python3-pip_26.1.1.bb => python3-pip_26.1.2.bb}     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_26.1.1.bb => python3-pip_26.1.2.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
index 5823d6307c..47404896af 100644
--- a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
+++ b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
@@ -1,4 +1,4 @@
-From adccf194155f40fb1d387c2cac432341a1dc8a0e Mon Sep 17 00:00:00 2001
+From 24cb0a24aa15a4ddbad4d3e93d19b26e233733e5 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 23 Feb 2022 12:27:06 +0000
 Subject: [PATCH] python3-pip: Don't change shebang
diff --git a/meta/recipes-devtools/python/python3-pip_26.1.1.bb b/meta/recipes-devtools/python/python3-pip_26.1.2.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-pip_26.1.1.bb
rename to meta/recipes-devtools/python/python3-pip_26.1.2.bb
index 2e09075de2..dd1895ed55 100644
--- a/meta/recipes-devtools/python/python3-pip_26.1.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.1.2.bb
@@ -26,7 +26,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "d36762751d156a4ee895de8af39aa0abeeeb577f93a2eca6ab62467bbf0f8a78"
+SRC_URI[sha256sum] = "f49cd134c61cf2fd75e0ce2676db03e4054504a5a4986d00f8299ae632dc4605"
 
 do_install:append(){
 	# pip vendors distlib which ships Windows launcher templates (*.exe).
-- 
2.47.1


--===============0075909190974222915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/distro -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/distro, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/cachecontrol -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/cachecontrol, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/tomli_w -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/tomli_w, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/idna -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/idna, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/urllib3 -> /usr/lib/python3.14/site-packa
 ges/pip-26.1.2.dist-info/licenses/src/pip/_vendor/urllib3, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/pyproject_hooks, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/platformdirs -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/platformdirs, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/requests -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/requests, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/certifi -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/certifi, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pygments -> /usr/lib
 /python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/pygments, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/packaging -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/packaging, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pkg_resources -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/pkg_resources, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/rich -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/rich, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/truststore -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist
 -info/licenses/src/pip/_vendor/truststore, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/tomli -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/tomli, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/resolvelib -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/resolvelib, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/distlib -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/distlib, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/msgpack -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/msgpack
Changes to packages/x86-64-v3-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info moved to /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info

--===============0075909190974222915==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pip-upgrade-26.1.1-26.1.2.patch"

RnJvbSBkMjc4M2E0MmFiYmFiZTExYWQwNmQxNTE3NWQxMmFiOWE4YjdhZTQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwOTowOTo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGlwOiB1cGdyYWRlIDI2LjEuMSAtPiAyNi4xLjIKCi0tLQogLi4uL3B5dGhvbi9weXRo
b24zLXBpcC9ub19zaGViYW5nX21hbmdsaW5nLnBhdGNoICAgICAgICAgICAgICAgIHwgMiArLQog
Li4uL3B5dGhvbi97cHl0aG9uMy1waXBfMjYuMS4xLmJiID0+IHB5dGhvbjMtcGlwXzI2LjEuMi5i
Yn0gICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1waXBf
MjYuMS4xLmJiID0+IHB5dGhvbjMtcGlwXzI2LjEuMi5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwL25vX3NoZWJhbmdfbWFuZ2xp
bmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwL25vX3No
ZWJhbmdfbWFuZ2xpbmcucGF0Y2gKaW5kZXggNTgyM2Q2MzA3Yy4uNDc0MDQ4OTZhZiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBpcC9ub19zaGViYW5n
X21hbmdsaW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1waXAvbm9fc2hlYmFuZ19tYW5nbGluZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYWRj
Y2YxOTQxNTVmNDBmYjFkMzg3YzJjYWM0MzIzNDFhMWRjOGEwZSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gMjRjYjBhMjRhYTE1YTRkZGJhZDRkM2U5M2QxOWIyNmUyMzM3MzNlNSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRp
ZUBsaW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogV2VkLCAyMyBGZWIgMjAyMiAxMjoyNzowNiAr
MDAwMAogU3ViamVjdDogW1BBVENIXSBweXRob24zLXBpcDogRG9uJ3QgY2hhbmdlIHNoZWJhbmcK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXBfMjYu
MS4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBpcF8yNi4xLjIu
YmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXBpcF8yNi4xLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1waXBfMjYuMS4yLmJiCmluZGV4IDJlMDkwNzVkZTIuLmRkMTg5
NWVkNTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
aXBfMjYuMS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
aXBfMjYuMS4yLmJiCkBAIC0yNiw3ICsyNiw3IEBAIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0
b29sc19idWlsZF9tZXRhCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly9ub19zaGViYW5nX21hbmdsaW5n
LnBhdGNoIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDM2NzYyNzUxZDE1NmE0ZWU4OTVkZThh
ZjM5YWEwYWJlZWViNTc3ZjkzYTJlY2E2YWI2MjQ2N2JiZjBmOGE3OCIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJmNDljZDEzNGM2MWNmMmZkNzVlMGNlMjY3NmRiMDNlNDA1NDUwNGE1YTQ5ODZkMDBm
ODI5OWFlNjMyZGM0NjA1IgogCiBkb19pbnN0YWxsOmFwcGVuZCgpewogCSMgcGlwIHZlbmRvcnMg
ZGlzdGxpYiB3aGljaCBzaGlwcyBXaW5kb3dzIGxhdW5jaGVyIHRlbXBsYXRlcyAoKi5leGUpLgot
LSAKMi40Ny4xCgo=

--===============0075909190974222915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pip: PV changed from "26.1.1" to "26.1.2"
packages/x86-64-v3-poky-linux/python3-pip: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pip/pip-26.1.1.tar.gz;downloadfilename=pip-26.1.1.tar.gz file://no_shebang_mangling.patch" to "https://files.pythonhosted.org/packages/source/p/pip/pip-26.1.2.tar.gz;downloadfilename=pip-26.1.2.tar.gz file://no_shebang_mangling.patch"
packages/x86-64-v3-poky-linux/python3-pip: PKGV changed from 26.1.1 [default] to 26.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dbg: PV changed from "26.1.1" to "26.1.2"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dbg: PKGV changed from 26.1.1 [default] to 26.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dev: PV changed from "26.1.1" to "26.1.2"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dev: PKGV changed from 26.1.1 [default] to 26.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-doc: PV changed from "26.1.1" to "26.1.2"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-doc: PKGV changed from 26.1.1 [default] to 26.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-locale: PV changed from "26.1.1" to "26.1.2"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-locale: PKGV changed from 26.1.1 [default] to 26.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-src: PV changed from "26.1.1" to "26.1.2"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-src: PKGV changed from 26.1.1 [default] to 26.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-staticdev: PV changed from "26.1.1" to "26.1.2"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-staticdev: PKGV changed from 26.1.1 [default] to 26.1.2 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PV changed from "26.1.1" to "26.1.2"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PKGSIZE changed from 10674940 to 10676842 (+0%)
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/distlib -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/distlib, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/requests -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/requests, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/cachecontrol -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/cachecontrol, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pkg_resources -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/pkg_resources, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/tomli -> /usr/lib/p
 ython3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/tomli, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/certifi -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/certifi, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/tomli_w -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/tomli_w, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/resolvelib -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/resolvelib, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/platformdirs -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/platformdirs, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info -> /usr/lib/python3.14/site-packages/pi
 p-26.1.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/distro -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/distro, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/msgpack -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/msgpack, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/urllib3 -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/urllib3, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/idna -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/idna, directory renamed /usr/lib/python3.14/site-
 packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/rich -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/rich, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/truststore -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/truststore, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/packaging -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/packaging, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pygments -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/pygments, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks -> /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/pyproject_hooks
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PKGV changed from 26.1.1 [default] to 26.1.2 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.14/site-packages/pip-26.1.1.dist-info moved to /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info

--===============0075909190974222915==--

