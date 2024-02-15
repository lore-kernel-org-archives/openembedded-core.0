Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 283C3C54ECF
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:38 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.20165.1708018345466908407
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gf0U9wcp;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mmhqEF49;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018dadd3a2b9-56770280-4e3c-450d-a640-66d0109308c9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MqACuxZIoJQ+UgTSf5jALOrU9kTMcONqzkxggeYBkcE=;
	b=gf0U9wcprpmOBdAgMJIjS29DExveGPWotfW7xf+lIdjCEanRFQewnAl4Zl1LB5Fk
	YLUHuBCKKih4UUXyvZzg7xF+ka7N0anVrcouCE3nXptIBWLnTQ1cWKHncn42DslKdpk
	pySTok3IDBvFZUAgVpr8yPtH8zR8wf+f0T5cz6IA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MqACuxZIoJQ+UgTSf5jALOrU9kTMcONqzkxggeYBkcE=;
	b=mmhqEF49EtAUxOH/bPF00w2Oq+Xi4ZAtdmcZSu7v31YNV/goA6CgxNbIhSSiOrPo
	/b48J7swowpgXRwyXdmCPsxWv1eubsJbyBs8p/gq3zuIE4W+Jk+3lIfReQQaPRXbXDW
	oMBRP1mO65WudCV9oAkAjXCfi0QODsMyM3mRj/tI=
Content-Type: multipart/mixed; boundary="===============8225714440602755527=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pip: upgrading to 24.0 SUCCEEDED
Message-ID: <0101018dadd3a2b9-56770280-4e3c-450d-a640-66d0109308c9-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195594

--===============8225714440602755527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pip* to *24.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pip-upgrade-23.3.2-24.0.patch
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
From 6a11a4d5a0067dd2987f31b25122b1aaaff2408f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 08:14:09 +0000
Subject: [PATCH] python3-pip: upgrade 23.3.2 -> 24.0

---
 .../python/python3-pip/no_shebang_mangling.patch          | 8 ++++----
 .../python/{python3-pip_23.3.2.bb => python3-pip_24.0.bb} | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_23.3.2.bb => python3-pip_24.0.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
index b59f4888da..8d03a8d0b5 100644
--- a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
+++ b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
@@ -1,4 +1,4 @@
-From 915bf32cd117cd86cc0d4b96bc9490b1c7119ffd Mon Sep 17 00:00:00 2001
+From ef0b3b1dd02802d35ab68f9b445997f4006ec68c Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 23 Feb 2022 12:27:06 +0000
 Subject: [PATCH] python3-pip: Don't change shebang
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [OE specific config]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/src/pip/_vendor/distlib/scripts.py b/src/pip/_vendor/distlib/scripts.py
-index d270624..42c0d10 100644
+index cfa45d2..313f499 100644
 --- a/src/pip/_vendor/distlib/scripts.py
 +++ b/src/pip/_vendor/distlib/scripts.py
-@@ -137,6 +137,8 @@ class ScriptMaker(object):
+@@ -144,6 +144,8 @@ class ScriptMaker(object):
          See also: http://www.in-ulm.de/~mascheck/various/shebang/#length
                    https://hg.mozilla.org/mozilla-central/file/tip/mach
          """
@@ -26,7 +26,7 @@ index d270624..42c0d10 100644
          if os.name != 'posix':
              simple_shebang = True
          else:
-@@ -348,7 +350,7 @@ class ScriptMaker(object):
+@@ -362,7 +364,7 @@ class ScriptMaker(object):
                  return
  
              match = FIRST_LINE_RE.match(first_line.replace(b'\r\n', b'\n'))
diff --git a/meta/recipes-devtools/python/python3-pip_23.3.2.bb b/meta/recipes-devtools/python/python3-pip_24.0.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-pip_23.3.2.bb
rename to meta/recipes-devtools/python/python3-pip_24.0.bb
index 0f2ab9288b..be4a29500a 100644
--- a/meta/recipes-devtools/python/python3-pip_23.3.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_24.0.bb
@@ -33,7 +33,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "7fd9972f96db22c8077a1ee2691b172c8089b17a5652a44494a9ecb0d78f9149"
+SRC_URI[sha256sum] = "ea9bd1a847e8c5774a5777bb398c19e80bcd4e2aa16a4b301b718fe6f593aba2"
 
 do_install:append() {
     rm -f ${D}/${bindir}/pip
-- 
2.42.0


--===============8225714440602755527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pip: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pip/pip-23.3.2.tar.gz;downloadfilename=pip-23.3.2.tar.gz file://no_shebang_mangling.patch" to "https://files.pythonhosted.org/packages/source/p/pip/pip-24.0.tar.gz;downloadfilename=pip-24.0.tar.gz file://no_shebang_mangling.patch"
packages/core2-64-poky-linux/python3-pip: PV changed from "23.3.2" to "24.0"
packages/core2-64-poky-linux/python3-pip: PKGV changed from 23.3.2 [default] to 24.0 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip-dbg: PV changed from "23.3.2" to "24.0"
packages/core2-64-poky-linux/python3-pip/python3-pip-dbg: PKGV changed from 23.3.2 [default] to 24.0 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip-dev: PV changed from "23.3.2" to "24.0"
packages/core2-64-poky-linux/python3-pip/python3-pip-dev: PKGV changed from 23.3.2 [default] to 24.0 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip-doc: PV changed from "23.3.2" to "24.0"
packages/core2-64-poky-linux/python3-pip/python3-pip-doc: PKGV changed from 23.3.2 [default] to 24.0 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip-locale: PV changed from "23.3.2" to "24.0"
packages/core2-64-poky-linux/python3-pip/python3-pip-locale: PKGV changed from 23.3.2 [default] to 24.0 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip-src: PV changed from "23.3.2" to "24.0"
packages/core2-64-poky-linux/python3-pip/python3-pip-src: PKGV changed from 23.3.2 [default] to 24.0 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip-staticdev: PV changed from "23.3.2" to "24.0"
packages/core2-64-poky-linux/python3-pip/python3-pip-staticdev: PKGV changed from 23.3.2 [default] to 24.0 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip: PV changed from "23.3.2" to "24.0"
packages/core2-64-poky-linux/python3-pip/python3-pip: PKGV changed from 23.3.2 [default] to 24.0 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip: PKGSIZE changed from 13861838 to 13866734 (+0%)
Changes to packages/core2-64-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.12/site-packages/pip-24.0.dist-info was added
  /usr/lib/python3.12/site-packages/pip-24.0.dist-info/AUTHORS.txt was added
  /usr/lib/python3.12/site-packages/pip-24.0.dist-info/entry_points.txt was added
  /usr/lib/python3.12/site-packages/pip-24.0.dist-info/LICENSE.txt was added
  /usr/lib/python3.12/site-packages/pip-24.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/pip-24.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/pip-24.0.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/pip-24.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/pip-23.3.2.dist-info was removed
  /usr/lib/python3.12/site-packages/pip-23.3.2.dist-info/AUTHORS.txt was removed
  /usr/lib/python3.12/site-packages/pip-23.3.2.dist-info/entry_points.txt was removed
  /usr/lib/python3.12/site-packages/pip-23.3.2.dist-info/LICENSE.txt was removed
  /usr/lib/python3.12/site-packages/pip-23.3.2.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/pip-23.3.2.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/pip-23.3.2.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/pip-23.3.2.dist-info/WHEEL was removed

--===============8225714440602755527==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pip-upgrade-23.3.2-24.0.patch"

RnJvbSA2YTExYTRkNWEwMDY3ZGQyOTg3ZjMxYjI1MTIyYjFhYWFmZjI0MDhmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMDg6MTQ6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBpcDogdXBncmFkZSAyMy4zLjIgLT4gMjQuMAoKLS0tCiAuLi4vcHl0aG9uL3B5dGhv
bjMtcGlwL25vX3NoZWJhbmdfbWFuZ2xpbmcucGF0Y2ggICAgICAgICAgfCA4ICsrKystLS0tCiAu
Li4vcHl0aG9uL3tweXRob24zLXBpcF8yMy4zLjIuYmIgPT4gcHl0aG9uMy1waXBfMjQuMC5iYn0g
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXBpcF8yMy4zLjIu
YmIgPT4gcHl0aG9uMy1waXBfMjQuMC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwL25vX3NoZWJhbmdfbWFuZ2xpbmcucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwL25vX3NoZWJhbmdfbWFu
Z2xpbmcucGF0Y2gKaW5kZXggYjU5ZjQ4ODhkYS4uOGQwM2E4ZDBiNSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBpcC9ub19zaGViYW5nX21hbmdsaW5n
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXAvbm9f
c2hlYmFuZ19tYW5nbGluZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOTE1YmYzMmNkMTE3
Y2Q4NmNjMGQ0Yjk2YmM5NDkwYjFjNzExOWZmZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gZWYwYjNiMWRkMDI4MDJkMzVhYjY4ZjliNDQ1OTk3ZjQwMDZlYzY4YyBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZv
dW5kYXRpb24ub3JnPgogRGF0ZTogV2VkLCAyMyBGZWIgMjAyMiAxMjoyNzowNiArMDAwMAogU3Vi
amVjdDogW1BBVENIXSBweXRob24zLXBpcDogRG9uJ3QgY2hhbmdlIHNoZWJhbmcKQEAgLTE0LDEw
ICsxNCwxMCBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW09FIHNwZWNpZmljIGNv
bmZpZ10KICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAK
IGRpZmYgLS1naXQgYS9zcmMvcGlwL192ZW5kb3IvZGlzdGxpYi9zY3JpcHRzLnB5IGIvc3JjL3Bp
cC9fdmVuZG9yL2Rpc3RsaWIvc2NyaXB0cy5weQotaW5kZXggZDI3MDYyNC4uNDJjMGQxMCAxMDA2
NDQKK2luZGV4IGNmYTQ1ZDIuLjMxM2Y0OTkgMTAwNjQ0CiAtLS0gYS9zcmMvcGlwL192ZW5kb3Iv
ZGlzdGxpYi9zY3JpcHRzLnB5CiArKysgYi9zcmMvcGlwL192ZW5kb3IvZGlzdGxpYi9zY3JpcHRz
LnB5Ci1AQCAtMTM3LDYgKzEzNyw4IEBAIGNsYXNzIFNjcmlwdE1ha2VyKG9iamVjdCk6CitAQCAt
MTQ0LDYgKzE0NCw4IEBAIGNsYXNzIFNjcmlwdE1ha2VyKG9iamVjdCk6CiAgICAgICAgICBTZWUg
YWxzbzogaHR0cDovL3d3dy5pbi11bG0uZGUvfm1hc2NoZWNrL3ZhcmlvdXMvc2hlYmFuZy8jbGVu
Z3RoCiAgICAgICAgICAgICAgICAgICAgaHR0cHM6Ly9oZy5tb3ppbGxhLm9yZy9tb3ppbGxhLWNl
bnRyYWwvZmlsZS90aXAvbWFjaAogICAgICAgICAgIiIiCkBAIC0yNiw3ICsyNiw3IEBAIGluZGV4
IGQyNzA2MjQuLjQyYzBkMTAgMTAwNjQ0CiAgICAgICAgICBpZiBvcy5uYW1lICE9ICdwb3NpeCc6
CiAgICAgICAgICAgICAgc2ltcGxlX3NoZWJhbmcgPSBUcnVlCiAgICAgICAgICBlbHNlOgotQEAg
LTM0OCw3ICszNTAsNyBAQCBjbGFzcyBTY3JpcHRNYWtlcihvYmplY3QpOgorQEAgLTM2Miw3ICsz
NjQsNyBAQCBjbGFzcyBTY3JpcHRNYWtlcihvYmplY3QpOgogICAgICAgICAgICAgICAgICByZXR1
cm4KICAKICAgICAgICAgICAgICBtYXRjaCA9IEZJUlNUX0xJTkVfUkUubWF0Y2goZmlyc3RfbGlu
ZS5yZXBsYWNlKGInXHJcbicsIGInXG4nKSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1waXBfMjMuMy4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXBpcF8yNC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXBfMjMuMy4yLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwXzI0LjAuYmIK
aW5kZXggMGYyYWI5Mjg4Yi4uYmU0YTI5NTAwYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXBpcF8yMy4zLjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXBpcF8yNC4wLmJiCkBAIC0zMyw3ICszMyw3IEBAIGluaGVy
aXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhCiAKIFNSQ19VUkkgKz0gImZpbGU6
Ly9ub19zaGViYW5nX21hbmdsaW5nLnBhdGNoIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2Zk
OTk3MmY5NmRiMjJjODA3N2ExZWUyNjkxYjE3MmM4MDg5YjE3YTU2NTJhNDQ0OTRhOWVjYjBkNzhm
OTE0OSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlYTliZDFhODQ3ZThjNTc3NGE1Nzc3YmIzOThj
MTllODBiY2Q0ZTJhYTE2YTRiMzAxYjcxOGZlNmY1OTNhYmEyIgogCiBkb19pbnN0YWxsOmFwcGVu
ZCgpIHsKICAgICBybSAtZiAke0R9LyR7YmluZGlyfS9waXAKLS0gCjIuNDIuMAoK

--===============8225714440602755527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.12/site-packages/pip-24.0.dist-info was added
  /usr/lib/python3.12/site-packages/pip-24.0.dist-info/AUTHORS.txt was added
  /usr/lib/python3.12/site-packages/pip-24.0.dist-info/entry_points.txt was added
  /usr/lib/python3.12/site-packages/pip-24.0.dist-info/LICENSE.txt was added
  /usr/lib/python3.12/site-packages/pip-24.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/pip-24.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/pip-24.0.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/pip-24.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/pip-23.3.2.dist-info was removed
  /usr/lib/python3.12/site-packages/pip-23.3.2.dist-info/AUTHORS.txt was removed
  /usr/lib/python3.12/site-packages/pip-23.3.2.dist-info/entry_points.txt was removed
  /usr/lib/python3.12/site-packages/pip-23.3.2.dist-info/LICENSE.txt was removed
  /usr/lib/python3.12/site-packages/pip-23.3.2.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/pip-23.3.2.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/pip-23.3.2.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/pip-23.3.2.dist-info/WHEEL was removed

--===============8225714440602755527==--

