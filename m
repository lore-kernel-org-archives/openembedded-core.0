Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E0DD5C0FD
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:27 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17188.1765872139220084245
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=29niiRoG;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=bIQ+8Ej/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019b262e8d8f-d1ad65af-796d-49ca-9cd3-d30d6a63675d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872143;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ebKSTDZE4+jkiEwI714r9VGRgK+9Yew0SKcqUbQtSdI=;
	b=29niiRoG3eV1B13vBYIhgE9GtjaObIi/b8gCZAF/Ofj9ssN7EOQviYJR+wtjCu0t
	bnV6GORotHOG1+ask5lNENG0KwrBLU2JX0RESpQuj2c6U2MsB4ELfTNYIJcd+TFrIoH
	Y+SV4zZn9vXhwyDtQittSDRVu1yXbLEtvre/J7IM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872143;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ebKSTDZE4+jkiEwI714r9VGRgK+9Yew0SKcqUbQtSdI=;
	b=bIQ+8Ej/oZBhQNjuhoiMHi3fe3tLKHeRWbplAtPwAzbAzMwSqrh1iGkXGxA2eLj5
	vfMBVPxGt3jmC+q+umliTyD9jRY233etz1cqKpgXwebFw/5OzY0qr3pTd2rbyLokd7D
	UjiI2u8quEDbiogW52Yhs9/4MdJpayhcnxBTFiE8=
Content-Type: multipart/mixed; boundary="===============0286223058890465487=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pip: upgrading to 25.3 SUCCEEDED
Message-ID: <0101019b262e8d8f-d1ad65af-796d-49ca-9cd3-d30d6a63675d-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:23 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227812

--===============0286223058890465487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pip* to *25.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pip-upgrade-25.2-25.3.patch
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
From 76096e547f05a947fcae34790cee8161d3aaa497 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 00:41:41 +0000
Subject: [PATCH] python3-pip: upgrade 25.2 -> 25.3

---
 .../python/python3-pip/no_shebang_mangling.patch                | 2 +-
 .../python/{python3-pip_25.2.bb => python3-pip_25.3.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_25.2.bb => python3-pip_25.3.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
index 7f15e9c0da..c71b46bca4 100644
--- a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
+++ b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
@@ -1,4 +1,4 @@
-From 6adf47097928ee3bb1b02c204126ed923faa7446 Mon Sep 17 00:00:00 2001
+From 48fa8ab5e68b0e349d988ea45bb6a8e2f9bf8fd3 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 23 Feb 2022 12:27:06 +0000
 Subject: [PATCH] python3-pip: Don't change shebang
diff --git a/meta/recipes-devtools/python/python3-pip_25.2.bb b/meta/recipes-devtools/python/python3-pip_25.3.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-pip_25.2.bb
rename to meta/recipes-devtools/python/python3-pip_25.3.bb
index 350092d9ad..bbc70e3eae 100644
--- a/meta/recipes-devtools/python/python3-pip_25.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_25.3.bb
@@ -26,7 +26,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "578283f006390f85bb6282dffb876454593d637f5d1be494b5202ce4877e71f2"
+SRC_URI[sha256sum] = "8d0538dbbd7babbd207f261ed969c65de439f6bc9e5dbd3b3b9a77f25d95f343"
 
 RDEPENDS:${PN} = "\
   python3-compile \
-- 
2.47.1


--===============0286223058890465487==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pip-upgrade-25.2-25.3.patch"

RnJvbSA3NjA5NmU1NDdmMDVhOTQ3ZmNhZTM0NzkwY2VlODE2MWQzYWFhNDk3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDA6NDE6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBpcDogdXBncmFkZSAyNS4yIC0+IDI1LjMKCi0tLQogLi4uL3B5dGhvbi9weXRob24z
LXBpcC9ub19zaGViYW5nX21hbmdsaW5nLnBhdGNoICAgICAgICAgICAgICAgIHwgMiArLQogLi4u
L3B5dGhvbi97cHl0aG9uMy1waXBfMjUuMi5iYiA9PiBweXRob24zLXBpcF8yNS4zLmJifSAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1waXBfMjUu
Mi5iYiA9PiBweXRob24zLXBpcF8yNS4zLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXAvbm9fc2hlYmFuZ19tYW5nbGluZy5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXAvbm9fc2hlYmFuZ19t
YW5nbGluZy5wYXRjaAppbmRleCA3ZjE1ZTljMGRhLi5jNzFiNDZiY2E0IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwL25vX3NoZWJhbmdfbWFuZ2xp
bmcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBpcC9u
b19zaGViYW5nX21hbmdsaW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2YWRmNDcwOTc5
MjhlZTNiYjFiMDJjMjA0MTI2ZWQ5MjNmYWE3NDQ2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSA0OGZhOGFiNWU2OGIwZTM0OWQ5ODhlYTQ1YmI2YThlMmY5YmY4ZmQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4
Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBXZWQsIDIzIEZlYiAyMDIyIDEyOjI3OjA2ICswMDAwCiBT
dWJqZWN0OiBbUEFUQ0hdIHB5dGhvbjMtcGlwOiBEb24ndCBjaGFuZ2Ugc2hlYmFuZwpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBpcF8yNS4yLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBpcF8yNS4zLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1waXBfMjUuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXBpcF8yNS4zLmJiCmluZGV4IDM1MDA5MmQ5YWQuLmJiYzcwZTNlYWUgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXBfMjUuMi5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwXzI1LjMuYmIKQEAgLTI2
LDcgKzI2LDcgQEAgaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIAog
U1JDX1VSSSArPSAiZmlsZTovL25vX3NoZWJhbmdfbWFuZ2xpbmcucGF0Y2giCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI1NzgyODNmMDA2MzkwZjg1YmI2MjgyZGZmYjg3NjQ1NDU5M2Q2MzdmNWQx
YmU0OTRiNTIwMmNlNDg3N2U3MWYyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhkMDUzOGRiYmQ3
YmFiYmQyMDdmMjYxZWQ5NjljNjVkZTQzOWY2YmM5ZTVkYmQzYjNiOWE3N2YyNWQ5NWYzNDMiCiAK
IFJERVBFTkRTOiR7UE59ID0gIlwKICAgcHl0aG9uMy1jb21waWxlIFwKLS0gCjIuNDcuMQoK

--===============0286223058890465487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/dependency_groups -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/dependency_groups, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/distlib -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/distlib, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/rich -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/tomli, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/pkg_resources -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/rich, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/requests -> /usr/lib/python3.13/site-packag
 es/pip-25.3.dist-info/licenses/src/pip/_vendor/pkg_resources, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/msgpack -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/msgpack, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/distro -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/requests, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/pyproject_hooks -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/distro, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/pygments -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/pyproject_hooks, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/packaging -> /usr/lib/python3.13/site-packages/
 pip-25.3.dist-info/licenses/src/pip/_vendor/packaging, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/idna -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/idna, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/tomli_w -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/pygments, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/resolvelib -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/tomli_w, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/urllib3 -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/urllib3, directory renamed /usr
 /lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/certifi -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/resolvelib, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/cachecontrol -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/cachecontrol, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/truststore -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/certifi, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/platformdirs -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/truststore, removed "/usr/lib/python3.13/site-packages/pip/_internal/operations/build/__pycache__/metadata_legacy.cpython-313.pyc /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/tomli/LICENSE-HEADER /u
 sr/lib/python3.13/site-packages/pip/_internal/utils/setuptools_build.py /usr/lib/python3.13/site-packages/pip/_internal/operations/build/__pycache__/wheel_legacy.cpython-313.pyc /usr/lib/python3.13/site-packages/pip/_internal/utils/__pycache__/setuptools_build.cpython-313.pyc /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/tomli/LICENSE /usr/lib/python3.13/site-packages/pip-25.2.dist-info/METADATA /usr/lib/python3.13/site-packages/pip/_internal/operations/build/wheel_legacy.py /usr/lib/python3.13/site-packages/pip-25.2.dist-info/entry_points.txt /usr/lib/python3.13/site-packages/pip-25.2.dist-info/top_level.txt /usr/lib/python3.13/site-packages/pip-25.2.dist-info/WHEEL /usr/lib/python3.13/site-packages/pip/_internal/operations/install/editable_legacy.py /usr/lib/python3.13/site-packages/pip/_internal/operations/build/metadata_legacy.py /usr/lib/python3.13/site-packages/pip/_internal/operations/install/__pycache__/editable_legacy.cpython-313.pyc", added 
 "/usr/lib/python3.13/site-packages/pip/_vendor/urllib3/LICENSE.txt /usr/lib/python3.13/site-packages/pip/_vendor/packaging/LICENSE.APACHE /usr/lib/python3.13/site-packages/pip/_vendor/README.rst /usr/lib/python3.13/site-packages/pip-25.3.dist-info/METADATA /usr/lib/python3.13/site-packages/pip/_vendor/packaging/LICENSE /usr/lib/python3.13/site-packages/pip/_vendor/certifi/LICENSE /usr/lib/python3.13/site-packages/pip/_vendor/pkg_resources/LICENSE /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/platformdirs/LICENSE /usr/lib/python3.13/site-packages/pip/_vendor/platformdirs/LICENSE /usr/lib/python3.13/site-packages/pip/_vendor/dependency_groups/LICENSE.txt /usr/lib/python3.13/site-packages/pip/_vendor/pyproject_hooks/LICENSE /usr/lib/python3.13/site-packages/pip/_vendor/truststore/LICENSE /usr/lib/python3.13/site-packages/pip/_vendor/packaging/LICENSE.BSD /usr/lib/python3.13/site-packages/pip/_vendor/idna/LICENSE.md /usr/lib/python3.13/site-packages/pip/_
 vendor/requests/LICENSE /usr/lib/python3.13/site-packages/pip/_vendor/resolvelib/LICENSE /usr/lib/python3.13/site-packages/pip-25.3.dist-info/WHEEL /usr/lib/python3.13/site-packages/pip/_vendor/pygments/LICENSE /usr/lib/python3.13/site-packages/pip/_vendor/tomli/LICENSE /usr/lib/python3.13/site-packages/pip/_vendor/distlib/LICENSE.txt /usr/lib/python3.13/site-packages/pip/_vendor/tomli_w/LICENSE /usr/lib/python3.13/site-packages/pip-25.3.dist-info/entry_points.txt /usr/lib/python3.13/site-packages/pip/_vendor/rich/LICENSE /usr/lib/python3.13/site-packages/pip/_vendor/distro/LICENSE /usr/lib/python3.13/site-packages/pip/_vendor/msgpack/COPYING /usr/lib/python3.13/site-packages/pip/_vendor/cachecontrol/LICENSE.txt"
Changes to packages/x86-64-v3-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.13/site-packages/pip/_internal/__init__.py changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.13/site-packages/pip-25.2.dist-info moved to /usr/lib/python3.13/site-packages/pip-25.3.dist-info
  /usr/lib/python3.13/site-packages/pip/_vendor/cachecontrol/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/pip/_vendor/certifi/LICENSE was added
  /usr/lib/python3.13/site-packages/pip/_vendor/dependency_groups/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/pip/_vendor/distlib/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/pip/_vendor/distro/LICENSE was added
  /usr/lib/python3.13/site-packages/pip/_vendor/idna/LICENSE.md was added
  /usr/lib/python3.13/site-packages/pip/_vendor/msgpack/COPYING was added
  /usr/lib/python3.13/site-packages/pip/_vendor/packaging/LICENSE was added
  /usr/lib/python3.13/site-packages/pip/_vendor/packaging/LICENSE.APACHE was added
  /usr/lib/python3.13/site-packages/pip/_vendor/packaging/LICENSE.BSD was added
  /usr/lib/python3.13/site-packages/pip/_vendor/pkg_resources/LICENSE was added
  /usr/lib/python3.13/site-packages/pip/_vendor/platformdirs/LICENSE was added
  /usr/lib/python3.13/site-packages/pip/_vendor/pygments/LICENSE was added
  /usr/lib/python3.13/site-packages/pip/_vendor/pyproject_hooks/LICENSE was added
  /usr/lib/python3.13/site-packages/pip/_vendor/README.rst was added
  /usr/lib/python3.13/site-packages/pip/_vendor/requests/LICENSE was added
  /usr/lib/python3.13/site-packages/pip/_vendor/resolvelib/LICENSE was added
  /usr/lib/python3.13/site-packages/pip/_vendor/rich/LICENSE was added
  /usr/lib/python3.13/site-packages/pip/_vendor/tomli/LICENSE was added
  /usr/lib/python3.13/site-packages/pip/_vendor/tomli_w/LICENSE was added
  /usr/lib/python3.13/site-packages/pip/_vendor/truststore/LICENSE was added
  /usr/lib/python3.13/site-packages/pip/_vendor/urllib3/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/tomli/LICENSE-HEADER was removed
  /usr/lib/python3.13/site-packages/pip-25.2.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/pip/_internal/operations/build/metadata_legacy.py was removed
  /usr/lib/python3.13/site-packages/pip/_internal/operations/build/__pycache__/metadata_legacy.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/pip/_internal/operations/build/__pycache__/wheel_legacy.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/pip/_internal/operations/build/wheel_legacy.py was removed
  /usr/lib/python3.13/site-packages/pip/_internal/operations/install/editable_legacy.py was removed
  /usr/lib/python3.13/site-packages/pip/_internal/operations/install/__pycache__/editable_legacy.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/pip/_internal/utils/__pycache__/setuptools_build.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/pip/_internal/utils/setuptools_build.py was removed

--===============0286223058890465487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pip: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pip/pip-25.2.tar.gz;downloadfilename=pip-25.2.tar.gz file://no_shebang_mangling.patch" to "https://files.pythonhosted.org/packages/source/p/pip/pip-25.3.tar.gz;downloadfilename=pip-25.3.tar.gz file://no_shebang_mangling.patch"
packages/x86-64-v3-poky-linux/python3-pip: PV changed from "25.2" to "25.3"
packages/x86-64-v3-poky-linux/python3-pip: PKGV changed from 25.2 [default] to 25.3 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dbg: PV changed from "25.2" to "25.3"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dbg: PKGV changed from 25.2 [default] to 25.3 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dev: PV changed from "25.2" to "25.3"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dev: PKGV changed from 25.2 [default] to 25.3 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-doc: PV changed from "25.2" to "25.3"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-doc: PKGV changed from 25.2 [default] to 25.3 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-locale: PV changed from "25.2" to "25.3"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-locale: PKGV changed from 25.2 [default] to 25.3 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-src: PV changed from "25.2" to "25.3"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-src: PKGV changed from 25.2 [default] to 25.3 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-staticdev: PV changed from "25.2" to "25.3"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-staticdev: PKGV changed from 25.2 [default] to 25.3 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PV changed from "25.2" to "25.3"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PKGSIZE changed from 10129474 to 10169490 (+0%)
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PKGV changed from 25.2 [default] to 25.3 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/packaging -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/packaging, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/idna -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/idna, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/msgpack -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/msgpack, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/pygments -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/pygments, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/distro -> /usr/lib/python3.13/site-packages/pip-25.3.dist-inf
 o/licenses/src/pip/_vendor/distro, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/pyproject_hooks -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/pyproject_hooks, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/rich -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/rich, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/requests -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/requests, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/pkg_resources -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/pkg_resources, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/distlib -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/li
 censes/src/pip/_vendor/distlib, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/dependency_groups -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/dependency_groups, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/cachecontrol -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/cachecontrol, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/platformdirs -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/tomli, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/truststore -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/platformdirs, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/certifi -> /usr/lib/python3.13/site-packages/pip-25.
 3.dist-info/licenses/src/pip/_vendor/truststore, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/urllib3 -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/urllib3, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/tomli_w -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/certifi, directory renamed /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/resolvelib -> /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/tomli_w, removed "/usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/tomli/LICENSE /usr/lib/python3.13/site-packages/pip-25.2.dist-info/WHEEL /usr/lib/python3.13/site-packages/pip-25.2.dist-info/top_
 level.txt /usr/lib/python3.13/site-packages/pip/_internal/operations/install/__pycache__/editable_legacy.cpython-313.pyc /usr/lib/python3.13/site-packages/pip/_internal/operations/install/editable_legacy.py /usr/lib/python3.13/site-packages/pip/_internal/operations/build/metadata_legacy.py /usr/lib/python3.13/site-packages/pip/_internal/operations/build/__pycache__/wheel_legacy.cpython-313.pyc /usr/lib/python3.13/site-packages/pip/_internal/utils/setuptools_build.py /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/tomli/LICENSE-HEADER /usr/lib/python3.13/site-packages/pip/_internal/operations/build/__pycache__/metadata_legacy.cpython-313.pyc /usr/lib/python3.13/site-packages/pip/_internal/operations/build/wheel_legacy.py /usr/lib/python3.13/site-packages/pip-25.2.dist-info/entry_points.txt /usr/lib/python3.13/site-packages/pip-25.2.dist-info/METADATA /usr/lib/python3.13/site-packages/pip/_internal/utils/__pycache__/setuptools_build.cpython-313.pyc", adde
 d "/usr/lib/python3.13/site-packages/pip/_vendor/pyproject_hooks/LICENSE /usr/lib/python3.13/site-packages/pip/_vendor/dependency_groups/LICENSE.txt /usr/lib/python3.13/site-packages/pip/_vendor/platformdirs/LICENSE /usr/lib/python3.13/site-packages/pip/_vendor/pkg_resources/LICENSE /usr/lib/python3.13/site-packages/pip/_vendor/certifi/LICENSE /usr/lib/python3.13/site-packages/pip/_vendor/packaging/LICENSE.APACHE /usr/lib/python3.13/site-packages/pip/_vendor/README.rst /usr/lib/python3.13/site-packages/pip/_vendor/urllib3/LICENSE.txt /usr/lib/python3.13/site-packages/pip/_vendor/packaging/LICENSE /usr/lib/python3.13/site-packages/pip-25.3.dist-info/METADATA /usr/lib/python3.13/site-packages/pip/_vendor/msgpack/COPYING /usr/lib/python3.13/site-packages/pip/_vendor/rich/LICENSE /usr/lib/python3.13/site-packages/pip/_vendor/cachecontrol/LICENSE.txt /usr/lib/python3.13/site-packages/pip-25.3.dist-info/entry_points.txt /usr/lib/python3.13/site-packages/pip/_vendor/distro/LICENSE /usr/lib
 /python3.13/site-packages/pip/_vendor/tomli/LICENSE /usr/lib/python3.13/site-packages/pip-25.3.dist-info/WHEEL /usr/lib/python3.13/site-packages/pip/_vendor/pygments/LICENSE /usr/lib/python3.13/site-packages/pip/_vendor/tomli_w/LICENSE /usr/lib/python3.13/site-packages/pip/_vendor/distlib/LICENSE.txt /usr/lib/python3.13/site-packages/pip/_vendor/idna/LICENSE.md /usr/lib/python3.13/site-packages/pip/_vendor/truststore/LICENSE /usr/lib/python3.13/site-packages/pip/_vendor/resolvelib/LICENSE /usr/lib/python3.13/site-packages/pip-25.3.dist-info/licenses/src/pip/_vendor/resolvelib/LICENSE /usr/lib/python3.13/site-packages/pip/_vendor/packaging/LICENSE.BSD /usr/lib/python3.13/site-packages/pip/_vendor/requests/LICENSE"
Changes to packages/x86-64-v3-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.13/site-packages/pip/_internal/__init__.py changed permissions from rw-r--r-- to rwxr-xr-x
  /usr/lib/python3.13/site-packages/pip-25.2.dist-info moved to /usr/lib/python3.13/site-packages/pip-25.3.dist-info
  /usr/lib/python3.13/site-packages/pip/_vendor/cachecontrol/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/pip/_vendor/certifi/LICENSE was added
  /usr/lib/python3.13/site-packages/pip/_vendor/dependency_groups/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/pip/_vendor/distlib/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/pip/_vendor/distro/LICENSE was added
  /usr/lib/python3.13/site-packages/pip/_vendor/idna/LICENSE.md was added
  /usr/lib/python3.13/site-packages/pip/_vendor/msgpack/COPYING was added
  /usr/lib/python3.13/site-packages/pip/_vendor/packaging/LICENSE was added
  /usr/lib/python3.13/site-packages/pip/_vendor/packaging/LICENSE.APACHE was added
  /usr/lib/python3.13/site-packages/pip/_vendor/packaging/LICENSE.BSD was added
  /usr/lib/python3.13/site-packages/pip/_vendor/pkg_resources/LICENSE was added
  /usr/lib/python3.13/site-packages/pip/_vendor/platformdirs/LICENSE was added
  /usr/lib/python3.13/site-packages/pip/_vendor/pygments/LICENSE was added
  /usr/lib/python3.13/site-packages/pip/_vendor/pyproject_hooks/LICENSE was added
  /usr/lib/python3.13/site-packages/pip/_vendor/README.rst was added
  /usr/lib/python3.13/site-packages/pip/_vendor/requests/LICENSE was added
  /usr/lib/python3.13/site-packages/pip/_vendor/resolvelib/LICENSE was added
  /usr/lib/python3.13/site-packages/pip/_vendor/rich/LICENSE was added
  /usr/lib/python3.13/site-packages/pip/_vendor/tomli/LICENSE was added
  /usr/lib/python3.13/site-packages/pip/_vendor/tomli_w/LICENSE was added
  /usr/lib/python3.13/site-packages/pip/_vendor/truststore/LICENSE was added
  /usr/lib/python3.13/site-packages/pip/_vendor/urllib3/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/pip-25.2.dist-info/licenses/src/pip/_vendor/tomli/LICENSE-HEADER was removed
  /usr/lib/python3.13/site-packages/pip-25.2.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/pip/_internal/operations/build/metadata_legacy.py was removed
  /usr/lib/python3.13/site-packages/pip/_internal/operations/build/__pycache__/metadata_legacy.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/pip/_internal/operations/build/__pycache__/wheel_legacy.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/pip/_internal/operations/build/wheel_legacy.py was removed
  /usr/lib/python3.13/site-packages/pip/_internal/operations/install/editable_legacy.py was removed
  /usr/lib/python3.13/site-packages/pip/_internal/operations/install/__pycache__/editable_legacy.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/pip/_internal/utils/__pycache__/setuptools_build.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/pip/_internal/utils/setuptools_build.py was removed

--===============0286223058890465487==--

