Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF1DC30620
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:12 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.174038.1692224349282543178
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PJvtwC2u;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mUpwQW67;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018a006e5fc1-3c539919-2382-45ba-b504-1e219f702a8a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224348;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=HV1yjbIUmsQz7okWpzQTDqOF+A5vONz7LDKojXO65iI=;
	b=PJvtwC2u7i5TsGkSv2NIpAgZHn3kYlxOUK6+3PzaXOjIvjzARHIC+HvXqq2SpBwI
	7zm7XOXQ54Q5/nZO7xm0UJMUwlgaKgJMToEHR/rRusUuxCeHOfALBYQpRhwEUNhcXns
	859iV4NxZunHQLviOY+mkkAtvu7U8o4UCmR4RriU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224348;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=HV1yjbIUmsQz7okWpzQTDqOF+A5vONz7LDKojXO65iI=;
	b=mUpwQW67PGqSgJxeppYhVehKN9XuVuV1ltIcu9sNBNdCi40zbxjKIyPpSjkKHFpM
	exSkH3XA8lN3eDM4kCF4gcTTYLbaAwWMCShpIkDENrsPJNCz9CeAYdIxpMoiROEn+Ys
	iBIxH6VAet8IUKHCt3muZUe6erBv6j5Tm2ie+aT0=
Content-Type: multipart/mixed; boundary="===============5175833920600462901=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 68.1.0 SUCCEEDED
Message-ID: <0101018a006e5fc1-3c539919-2382-45ba-b504-1e219f702a8a-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186194

--===============5175833920600462901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *68.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-68.0.0-68.1.0.patch
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
From f18770c38d61cd0ab11c25f496507a8516b8e54d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 06:23:44 +0000
Subject: [PATCH] python3-setuptools: upgrade 68.0.0 -> 68.1.0

---
 ...-conditionally-do-not-fetch-code-by-easy_install.patch | 8 +++-----
 ...-setuptools_68.0.0.bb => python3-setuptools_68.1.0.bb} | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_68.0.0.bb => python3-setuptools_68.1.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 1e5ab498a4..fac0708d88 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 5e603da9c01ccb828a03ea3e82d15599971f794f Mon Sep 17 00:00:00 2001
+From 3f934a5a0d739963c547f338a342dfe8be2964dc Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -9,12 +9,13 @@ internet by easy_install.
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  setuptools/command/easy_install.py | 5 +++++
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 0b8d1159..93308060 100644
+index 0b8d115..9330806 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
 @@ -644,6 +644,11 @@ class easy_install(Command):
@@ -29,6 +30,3 @@ index 0b8d1159..93308060 100644
          with self._tmpdir() as tmpdir:
              if not isinstance(spec, Requirement):
                  if URL_SCHEME(spec):
--- 
-2.41.0
-
diff --git a/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_68.1.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_68.0.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_68.1.0.bb
index 4ac789d18c..e04cd1dcd0 100644
--- a/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_68.1.0.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "baf1fdb41c6da4cd2eae722e135500da913332ab3f2f5c7d33af9b492acb5235"
+SRC_URI[sha256sum] = "d59c97e7b774979a5ccb96388efc9eb65518004537e85d52e81eaee89ab6dd91"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.39.2


--===============5175833920600462901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools: PV changed from "68.0.0" to "68.1.0"
packages/core2-32-poky-linux/python3-setuptools: PKGV changed from 68.0.0 [default] to 68.1.0 [default]
packages/core2-32-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-68.0.0.tar.gz;downloadfilename=setuptools-68.0.0.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-68.1.0.tar.gz;downloadfilename=setuptools-68.1.0.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "68.0.0" to "68.1.0"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 68.0.0 [default] to 68.1.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGSIZE changed from 1437018 to 1437020 (+0%)
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "68.0.0" to "68.1.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 68.0.0 [default] to 68.1.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "68.0.0" to "68.1.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 68.0.0 [default] to 68.1.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "68.0.0" to "68.1.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 68.0.0 [default] to 68.1.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "68.0.0" to "68.1.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 68.0.0 [default] to 68.1.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "68.0.0" to "68.1.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 68.0.0 [default] to 68.1.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "68.0.0" to "68.1.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 68.0.0 [default] to 68.1.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PV changed from "68.0.0" to "68.1.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 68.0.0 [default] to 68.1.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 4738454 to 4747560 (+0%)
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-68.0.0.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-68.1.0.dist-info
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-68.0.0.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-68.1.0.dist-info

--===============5175833920600462901==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-68.0.0-68.1.0.patch"

RnJvbSBmMTg3NzBjMzhkNjFjZDBhYjExYzI1ZjQ5NjUwN2E4NTE2YjhlNTRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMDY6MjM6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHM6IHVwZ3JhZGUgNjguMC4wIC0+IDY4LjEuMAoKLS0tCiAuLi4tY29u
ZGl0aW9uYWxseS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lYXN5X2luc3RhbGwucGF0Y2ggfCA4ICsr
Ky0tLS0tCiAuLi4tc2V0dXB0b29sc182OC4wLjAuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzXzY4
LjEuMC5iYn0gfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNl
dHVwdG9vbHNfNjguMC4wLmJiID0+IHB5dGhvbjMtc2V0dXB0b29sc182OC4xLjAuYmJ9ICg5NSUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHMvMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFs
bC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xz
LzAwMDEtY29uZGl0aW9uYWxseS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lYXN5X2luc3RhbGwucGF0
Y2gKaW5kZXggMWU1YWI0OThhNC4uZmFjMDcwOGQ4OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMvMDAwMS1jb25kaXRpb25hbGx5LWRv
LW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFsbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFsbHktZG8t
bm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSA1ZTYwM2RhOWMwMWNjYjgyOGEwM2VhM2U4MmQxNTU5OTk3MWY3OTRmIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSAzZjkzNGE1YTBkNzM5OTYzYzU0N2YzMzhhMzQyZGZlOGJlMjk2NGRj
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3
aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAxNyBKdWwgMjAxOCAxMDoxMzozOCArMDgwMAogU3Vi
amVjdDogW1BBVENIXSBjb25kaXRpb25hbGx5IGRvIG5vdCBmZXRjaCBjb2RlIGJ5IGVhc3lfaW5z
dGFsbApAQCAtOSwxMiArOSwxMyBAQCBpbnRlcm5ldCBieSBlYXN5X2luc3RhbGwuCiBVcHN0cmVh
bS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29lIHNwZWNpZmljXQogCiBTaWduZWQtb2ZmLWJ5OiBI
b25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CisKIC0tLQogIHNldHVwdG9vbHMv
Y29tbWFuZC9lYXN5X2luc3RhbGwucHkgfCA1ICsrKysrCiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvc2V0dXB0b29scy9jb21tYW5kL2Vhc3lfaW5zdGFs
bC5weSBiL3NldHVwdG9vbHMvY29tbWFuZC9lYXN5X2luc3RhbGwucHkKLWluZGV4IDBiOGQxMTU5
Li45MzMwODA2MCAxMDA2NDQKK2luZGV4IDBiOGQxMTUuLjkzMzA4MDYgMTAwNjQ0CiAtLS0gYS9z
ZXR1cHRvb2xzL2NvbW1hbmQvZWFzeV9pbnN0YWxsLnB5CiArKysgYi9zZXR1cHRvb2xzL2NvbW1h
bmQvZWFzeV9pbnN0YWxsLnB5CiBAQCAtNjQ0LDYgKzY0NCwxMSBAQCBjbGFzcyBlYXN5X2luc3Rh
bGwoQ29tbWFuZCk6CkBAIC0yOSw2ICszMCwzIEBAIGluZGV4IDBiOGQxMTU5Li45MzMwODA2MCAx
MDA2NDQKICAgICAgICAgIHdpdGggc2VsZi5fdG1wZGlyKCkgYXMgdG1wZGlyOgogICAgICAgICAg
ICAgIGlmIG5vdCBpc2luc3RhbmNlKHNwZWMsIFJlcXVpcmVtZW50KToKICAgICAgICAgICAgICAg
ICAgaWYgVVJMX1NDSEVNRShzcGVjKToKLS0tIAotMi40MS4wCi0KZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY4LjAuMC5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY4LjEuMC5iYgpz
aW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtc2V0dXB0b29sc182OC4wLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY4LjEuMC5iYgppbmRleCA0YWM3ODlk
MThjLi5lMDRjZDFkY2QwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtc2V0dXB0b29sc182OC4wLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfNjguMS4wLmJiCkBAIC0xMSw3ICsxMSw3IEBAIFNS
Q19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgZmlsZTovLzAwMDEtY29uZGl0aW9uYWxseS1k
by1ub3QtZmV0Y2gtY29kZS1ieS1lCiBTUkNfVVJJICs9ICIgXAogICAgICAgICAgICAgZmlsZTov
LzAwMDEtX2Rpc3R1dGlscy1zeXNjb25maWcucHktbWFrZS1pdC1wb3NzaWJsZS10by1zdWJzdGl0
ZS5wYXRjaCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImJhZjFmZGI0MWM2ZGE0Y2QyZWFlNzIy
ZTEzNTUwMGRhOTEzMzMyYWIzZjJmNWM3ZDMzYWY5YjQ5MmFjYjUyMzUiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiZDU5Yzk3ZTdiNzc0OTc5YTVjY2I5NjM4OGVmYzllYjY1NTE4MDA0NTM3ZTg1ZDUy
ZTgxZWFlZTg5YWI2ZGQ5MSIKIAogREVQRU5EUyArPSAiJHtQWVRIT05fUE59IgogCi0tIAoyLjM5
LjIKCg==

--===============5175833920600462901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-68.0.0.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-68.1.0.dist-info
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-68.0.0.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-68.1.0.dist-info

--===============5175833920600462901==--

