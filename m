Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD481C44500
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 05:39:41 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126038.1783229976372642234
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jul 2026 22:39:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=iYbL1okK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pXl5svtx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019f30ca0b47-7ebd80ed-1dcf-4e05-bd02-b340dfe53263-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783229975;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2D2JsX94Eeb5+78N2euPDlX/fvyDKeOWXGs++GIN24o=;
	b=iYbL1okKqLKHlbfVdVv6cG55d2yLNKG+MN13qTkOrvM3q8MopFqvQXad/n/swPs/
	VTslfkzDUgDM6uuaJw8/iWg0IDzfXscQAt1B2vGsIFXZQ/mTPjzJvg8Mz3Q7+oWkQ7K
	hl+inne+ZOzHGGMQJERh8BTPky2KvS4wWgbWCz1g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783229975;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2D2JsX94Eeb5+78N2euPDlX/fvyDKeOWXGs++GIN24o=;
	b=pXl5svtx6FJ4V/08/cUhgGy5rK1V9X2YvtnN9ENF9cF26Sel768rzIkpFFZaGFvj
	2wWAF87T6V1FP5VPcwveeXv6WThxJdQSdRWzRKGuTKBNBeOxvoNoUIEftxfYlh6Jv0z
	iX1k6IUhJgOV1zNiSVcKE50TEK2Z3cFJzstR+rYk=
Content-Type: multipart/mixed; boundary="===============8256207090372587538=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 83.0.0 SUCCEEDED
Message-ID: <0101019f30ca0b47-7ebd80ed-1dcf-4e05-bd02-b340dfe53263-000000@us-west-2.amazonses.com>
Date: Sun, 5 Jul 2026 05:39:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.05-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 05:39:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240137

--===============8256207090372587538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools* to *83.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-82.0.1-83.0.0.patch
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
From 7a5e566d1bc426c48dd72cb738bd46598fc6e400 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 5 Jul 2026 05:32:53 +0000
Subject: [PATCH] python3-setuptools: upgrade 82.0.1 -> 83.0.0

---
 ...1-_distutils-sysconfig.py-make-it-possible-to-substite.patch | 2 +-
 ...ython3-setuptools_82.0.1.bb => python3-setuptools_83.0.0.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_82.0.1.bb => python3-setuptools_83.0.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
index 0fc5e3f134..6e240c47d2 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From cb37237fd60689ccf999689ff60acabe8e1ec1de Mon Sep 17 00:00:00 2001
+From 015ff68e79298c5148350cf3bf0b72d1d409ba4b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 11 May 2022 21:41:14 +0200
 Subject: [PATCH] _distutils/sysconfig.py: make it possible to substite the
diff --git a/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb b/meta/recipes-devtools/python/python3-setuptools_83.0.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_82.0.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_83.0.0.bb
index c413578faf..e5593c9f73 100644
--- a/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_83.0.0.bb
@@ -11,7 +11,7 @@ CVE_PRODUCT = "python3-setuptools python:setuptools"
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "7d872682c5d01cfde07da7bccc7b65469d3dca203318515ada1de5eda35efbf9"
+SRC_URI[sha256sum] = "025bccbbf0fa05b6192bc64ae1e7b16e001fd6d6d4d5de03c97b1c1ade523bef"
 
 do_install:append() {
 	# setuptools ships Windows launcher executables (cli*.exe, gui*.exe).
-- 
2.47.1


--===============8256207090372587538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/ca-certificates/ca-certificates-dev: FILES: removed "/lib/*.o /lib/lib*.so /lib/*.la"
packages/all-poky-linux/ca-certificates/ca-certificates-staticdev: FILES: removed "/lib/*.a"
packages/all-poky-linux/ca-certificates/ca-certificates: FILES: removed "/lib/*.so.* /bin/* /sbin/*", added "/usr/lib/*.so.*"
packages/all-poky-linux/tzdata/tzdata: FILES: removed "/lib/*.so.* /bin/* /sbin/*", added "/usr/lib/*.so.*"
packages/x86-64-v3-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-82.0.1.tar.gz;downloadfilename=setuptools-82.0.1.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-83.0.0.tar.gz;downloadfilename=setuptools-83.0.0.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
packages/x86-64-v3-poky-linux/python3-setuptools: PV changed from "82.0.1" to "83.0.0"
packages/x86-64-v3-poky-linux/python3-setuptools: PKGV changed from 82.0.1 [default] to 83.0.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "82.0.1" to "83.0.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 82.0.1 [default] to 83.0.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "82.0.1" to "83.0.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 82.0.1 [default] to 83.0.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "82.0.1" to "83.0.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 82.0.1 [default] to 83.0.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "82.0.1" to "83.0.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 82.0.1 [default] to 83.0.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "82.0.1" to "83.0.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 82.0.1 [default] to 83.0.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "82.0.1" to "83.0.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 82.0.1 [default] to 83.0.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/setuptools-82.0.1.dist-info -> /usr/lib/python3.14/site-packages/setuptools-83.0.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/setuptools-82.0.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools-83.0.0.dist-info/licenses, added "/usr/lib/python3.14/site-packages/setuptools/_distutils/py.typed /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/py.typed"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 7281940 to 7291290 (+0%)
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: PV changed from "82.0.1" to "83.0.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 82.0.1 [default] to 83.0.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.14/site-packages/setuptools-82.0.1.dist-info moved to /usr/lib/python3.14/site-packages/setuptools-83.0.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/py.typed was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/py.typed was added
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.14/site-packages/setuptools-82.0.1.dist-info moved to /usr/lib/python3.14/site-packages/setuptools-83.0.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/py.typed was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/py.typed was added

--===============8256207090372587538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/setuptools-82.0.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools-83.0.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/setuptools-82.0.1.dist-info -> /usr/lib/python3.14/site-packages/setuptools-83.0.0.dist-info, added "/usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/py.typed /usr/lib/python3.14/site-packages/setuptools/_distutils/py.typed"
Changes to packages/x86-64-v3-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.14/site-packages/setuptools-82.0.1.dist-info moved to /usr/lib/python3.14/site-packages/setuptools-83.0.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/py.typed was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/py.typed was added
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.14/site-packages/setuptools-82.0.1.dist-info moved to /usr/lib/python3.14/site-packages/setuptools-83.0.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_distutils/compilers/C/py.typed was added
  /usr/lib/python3.14/site-packages/setuptools/_distutils/py.typed was added

--===============8256207090372587538==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-82.0.1-83.0.0.patch"

RnJvbSA3YTVlNTY2ZDFiYzQyNmM0OGRkNzJjYjczOGJkNDY1OThmYzZlNDAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgNSBKdWwgMjAyNiAwNTozMjo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29sczogdXBncmFkZSA4Mi4wLjEgLT4gODMuMC4wCgotLS0KIC4uLjEtX2Rp
c3R1dGlscy1zeXNjb25maWcucHktbWFrZS1pdC1wb3NzaWJsZS10by1zdWJzdGl0ZS5wYXRjaCB8
IDIgKy0KIC4uLnl0aG9uMy1zZXR1cHRvb2xzXzgyLjAuMS5iYiA9PiBweXRob24zLXNldHVwdG9v
bHNfODMuMC4wLmJifSB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhv
bjMtc2V0dXB0b29sc184Mi4wLjEuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzXzgzLjAuMC5iYn0g
KDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c2V0dXB0b29scy8wMDAxLV9kaXN0dXRpbHMtc3lzY29uZmlnLnB5LW1ha2UtaXQtcG9zc2libGUt
dG8tc3Vic3RpdGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c2V0dXB0b29scy8wMDAxLV9kaXN0dXRpbHMtc3lzY29uZmlnLnB5LW1ha2UtaXQtcG9zc2libGUt
dG8tc3Vic3RpdGUucGF0Y2gKaW5kZXggMGZjNWUzZjEzNC4uNmUyNDBjNDdkMiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMvMDAwMS1f
ZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3NpYmxlLXRvLXN1YnN0aXRlLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLzAw
MDEtX2Rpc3R1dGlscy1zeXNjb25maWcucHktbWFrZS1pdC1wb3NzaWJsZS10by1zdWJzdGl0ZS5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gY2IzNzIzN2ZkNjA2ODljY2Y5OTk2ODlmZjYwYWNh
YmU4ZTFlYzFkZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMDE1ZmY2OGU3OTI5OGM1
MTQ4MzUwY2YzYmYwYjcyZDFkNDA5YmE0YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBXZWQsIDExIE1h
eSAyMDIyIDIxOjQxOjE0ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIF9kaXN0dXRpbHMvc3lzY29u
ZmlnLnB5OiBtYWtlIGl0IHBvc3NpYmxlIHRvIHN1YnN0aXRlIHRoZQpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfODIuMC4xLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfODMuMC4wLmJi
CnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzgyLjAuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfODMuMC4wLmJiCmluZGV4IGM0MTM1
NzhmYWYuLmU1NTkzYzlmNzMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1zZXR1cHRvb2xzXzgyLjAuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc184My4wLjAuYmIKQEAgLTExLDcgKzExLDcgQEAg
Q1ZFX1BST0RVQ1QgPSAicHl0aG9uMy1zZXR1cHRvb2xzIHB5dGhvbjpzZXR1cHRvb2xzIgogU1JD
X1VSSSArPSAiIFwKICAgICAgICAgICAgIGZpbGU6Ly8wMDAxLV9kaXN0dXRpbHMtc3lzY29uZmln
LnB5LW1ha2UtaXQtcG9zc2libGUtdG8tc3Vic3RpdGUucGF0Y2giCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICI3ZDg3MjY4MmM1ZDAxY2ZkZTA3ZGE3YmNjYzdiNjU0NjlkM2RjYTIwMzMxODUxNWFk
YTFkZTVlZGEzNWVmYmY5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjAyNWJjY2JiZjBmYTA1YjYx
OTJiYzY0YWUxZTdiMTZlMDAxZmQ2ZDZkNGQ1ZGUwM2M5N2IxYzFhZGU1MjNiZWYiCiAKIGRvX2lu
c3RhbGw6YXBwZW5kKCkgewogCSMgc2V0dXB0b29scyBzaGlwcyBXaW5kb3dzIGxhdW5jaGVyIGV4
ZWN1dGFibGVzIChjbGkqLmV4ZSwgZ3VpKi5leGUpLgotLSAKMi40Ny4xCgo=

--===============8256207090372587538==--

