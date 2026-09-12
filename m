Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA99C79FB6
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 06:46:08 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1965.1789195560003267090
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 23:46:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=sKWEoWDD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=a2vsUsY4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a0945da018-9c837ff4-3872-414c-a28a-9483360c2f0c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789195559;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3A7ESAw9DfkveIeAyw4hlQulHgRWrIFYkdexaW8tc7g=;
	b=sKWEoWDDVxFddcci1/5GZiOWMMnFsWEya6P9rzaqOtHqmnELoiAHCaH0LTYBUMU3
	x1kdtBUNOvNmpuXufPjBVvtGbJBwWz6FA31ETKVuHLgit2L+c7LBryeJuVjtWGEhbSm
	pC74QMfL9lucHlO9rujQwK6CJK9ORkQzXqxI5++4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789195559;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3A7ESAw9DfkveIeAyw4hlQulHgRWrIFYkdexaW8tc7g=;
	b=a2vsUsY4CGD2rms0Hd0MEVPgV4Pqt73wDe6WMiPWmUFYhem5VdiMEw3e6uv69mPX
	OCTci21QPDvpZjLieQwnZDe1F7wxM8Yc+8PljWzcWKedVrJY5/jtHEIMtxcGm9pNaXH
	PW44EJdlgzDii+iQ0Tva4IBFVBh/Etq3dgo42i54=
Content-Type: multipart/mixed; boundary="===============8481702105130774885=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-meson-python: upgrading to 0.21.1 SUCCEEDED
Message-ID: <010101a0945da018-9c837ff4-3872-414c-a28a-9483360c2f0c-000000@us-west-2.amazonses.com>
Date: Sat, 12 Sep 2026 06:45:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.12-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 06:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245686

--===============8481702105130774885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-meson-python* to *0.21.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-meson-python-upgrade-0.21.0-0.21.1.patch
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
From 6c8a7562129443f1993d91e335613156b342ca5c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 12 Sep 2026 05:50:42 +0000
Subject: [PATCH] python3-meson-python: upgrade 0.21.0 -> 0.21.1

Source: CHANGELOG.rst

0.21.1
======

- Restore compatibility with Python interpreters not implementing PEP 3149.

Daniele Nicolodi, Ralf Gommers --- 11-09-2026.
---
 ...n3-meson-python_0.21.0.bb => python3-meson-python_0.21.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-meson-python_0.21.0.bb => python3-meson-python_0.21.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-meson-python_0.21.0.bb b/meta/recipes-devtools/python/python3-meson-python_0.21.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-meson-python_0.21.0.bb
rename to meta/recipes-devtools/python/python3-meson-python_0.21.1.bb
index 69fb461c1f..2c86f7fed4 100644
--- a/meta/recipes-devtools/python/python3-meson-python_0.21.0.bb
+++ b/meta/recipes-devtools/python/python3-meson-python_0.21.1.bb
@@ -13,7 +13,7 @@ DEPENDS = " \
 PYPI_PACKAGE = "meson_python"
 
 inherit pypi python_mesonpy
-SRC_URI[sha256sum] = "595c2f40b76692c78274c87b733379d86562583e9ffb975487b9eafada03055b"
+SRC_URI[sha256sum] = "78b3345dcbc0fed7b939e7e37a9faab35bddaae07bf62e7542c8ad479c395af5"
 
 DEPENDS:remove:class-native = "python3-meson-python-native"
 
-- 
2.47.1


--===============8481702105130774885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python: FILELIST: directory renamed /usr/lib/python3.14/site-packages/meson_python-0.21.0.dist-info -> /usr/lib/python3.14/site-packages/meson_python-0.21.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/meson_python-0.21.0.dist-info/licenses/LICENSES -> /usr/lib/python3.14/site-packages/meson_python-0.21.1.dist-info/licenses/LICENSES
Changes to packages/x86-64-v3-poky-linux/python3-meson-python (sysroot):
  /usr/lib/python3.14/site-packages/meson_python-0.21.0.dist-info moved to /usr/lib/python3.14/site-packages/meson_python-0.21.1.dist-info

--===============8481702105130774885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-meson-python: PKGV changed from 0.21.0 [default] to 0.21.1 [default]
packages/x86-64-v3-poky-linux/python3-meson-python: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/meson_python/meson_python-0.21.0.tar.gz" to "https://files.pythonhosted.org/packages/source/m/meson_python/meson_python-0.21.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-meson-python: PV changed from "0.21.0" to "0.21.1"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-dbg: PKGV changed from 0.21.0 [default] to 0.21.1 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-dbg: PV changed from "0.21.0" to "0.21.1"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-dev: PKGV changed from 0.21.0 [default] to 0.21.1 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-dev: PV changed from "0.21.0" to "0.21.1"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-doc: PKGV changed from 0.21.0 [default] to 0.21.1 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-doc: PV changed from "0.21.0" to "0.21.1"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-locale: PKGV changed from 0.21.0 [default] to 0.21.1 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-locale: PV changed from "0.21.0" to "0.21.1"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-src: PKGV changed from 0.21.0 [default] to 0.21.1 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-src: PV changed from "0.21.0" to "0.21.1"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-staticdev: PKGV changed from 0.21.0 [default] to 0.21.1 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-staticdev: PV changed from "0.21.0" to "0.21.1"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python: PKGV changed from 0.21.0 [default] to 0.21.1 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python: PV changed from "0.21.0" to "0.21.1"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python: PKGSIZE changed from 233547 to 235790 (+1%)
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python: FILELIST: directory renamed /usr/lib/python3.14/site-packages/meson_python-0.21.0.dist-info -> /usr/lib/python3.14/site-packages/meson_python-0.21.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/meson_python-0.21.0.dist-info/licenses/LICENSES -> /usr/lib/python3.14/site-packages/meson_python-0.21.1.dist-info/licenses/LICENSES
Changes to packages/x86-64-v3-poky-linux/python3-meson-python (sysroot):
  /usr/lib/python3.14/site-packages/meson_python-0.21.0.dist-info moved to /usr/lib/python3.14/site-packages/meson_python-0.21.1.dist-info

--===============8481702105130774885==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-meson-python-upgrade-0.21.0-0.21.1.patch"

RnJvbSA2YzhhNzU2MjEyOTQ0M2YxOTkzZDkxZTMzNTYxMzE1NmIzNDJjYTVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTIgU2VwIDIwMjYgMDU6NTA6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1lc29uLXB5dGhvbjogdXBncmFkZSAwLjIxLjAgLT4gMC4yMS4xCgpTb3VyY2U6IENI
QU5HRUxPRy5yc3QKCjAuMjEuMQo9PT09PT0KCi0gUmVzdG9yZSBjb21wYXRpYmlsaXR5IHdpdGgg
UHl0aG9uIGludGVycHJldGVycyBub3QgaW1wbGVtZW50aW5nIFBFUCAzMTQ5LgoKRGFuaWVsZSBO
aWNvbG9kaSwgUmFsZiBHb21tZXJzIC0tLSAxMS0wOS0yMDI2LgotLS0KIC4uLm4zLW1lc29uLXB5
dGhvbl8wLjIxLjAuYmIgPT4gcHl0aG9uMy1tZXNvbi1weXRob25fMC4yMS4xLmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtbWVzb24tcHl0aG9uXzAuMjEuMC5i
YiA9PiBweXRob24zLW1lc29uLXB5dGhvbl8wLjIxLjEuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1lc29uLXB5dGhvbl8wLjIxLjAu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWVzb24tcHl0aG9uXzAu
MjEuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWVzb24tcHl0aG9uXzAuMjEuMC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1lc29uLXB5dGhvbl8wLjIxLjEuYmIK
aW5kZXggNjlmYjQ2MWMxZi4uMmM4NmY3ZmVkNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLW1lc29uLXB5dGhvbl8wLjIxLjAuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1lc29uLXB5dGhvbl8wLjIxLjEuYmIKQEAg
LTEzLDcgKzEzLDcgQEAgREVQRU5EUyA9ICIgXAogUFlQSV9QQUNLQUdFID0gIm1lc29uX3B5dGhv
biIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9tZXNvbnB5Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
NTk1YzJmNDBiNzY2OTJjNzgyNzRjODdiNzMzMzc5ZDg2NTYyNTgzZTlmZmI5NzU0ODdiOWVhZmFk
YTAzMDU1YiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3OGIzMzQ1ZGNiYzBmZWQ3YjkzOWU3ZTM3
YTlmYWFiMzViZGRhYWUwN2JmNjJlNzU0MmM4YWQ0NzljMzk1YWY1IgogCiBERVBFTkRTOnJlbW92
ZTpjbGFzcy1uYXRpdmUgPSAicHl0aG9uMy1tZXNvbi1weXRob24tbmF0aXZlIgogCi0tIAoyLjQ3
LjEKCg==

--===============8481702105130774885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-meson-python-changelog.txt"

Changelog for python3-meson-python: 0.21.0 -> 0.21.1
Source: CHANGELOG.rst

0.21.1
======

- Restore compatibility with Python interpreters not implementing PEP 3149.

Daniele Nicolodi, Ralf Gommers --- 11-09-2026.

--===============8481702105130774885==--

