Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06185CDB47F
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 05:42:41 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5193.1782366154108124133
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 22:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UwIeKpGI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dwHDpc7v;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019efd4d29c4-5037956c-8e1b-450f-8b60-cf0783681efe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782366153;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iBu3yJx+GEUwLM5Ta47SQCdvMLJ666e3pDwaUJzhR6w=;
	b=UwIeKpGI6poO0EO1hyHFTPiamlc1bahky/qo0x1GvD0VztAIuzseeqQ6MvQzaJRp
	8dFs2Jx6NVhXAytl2sbne1LyEGbLqRIsso0zibRfggZMo/O48eNJpHZUt1EMcUp/FTP
	TPGUi5x13rPcr6e3F+7lU7CxYg6/59qmoGFtLtOE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782366153;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iBu3yJx+GEUwLM5Ta47SQCdvMLJ666e3pDwaUJzhR6w=;
	b=dwHDpc7vB+i/FSobgapa9umEQEm1aVNNQsBEOqKI1Upgz12Ld7q46bLAJ6ONgTUY
	h+XsSJKDxfUqlXU35uivgiQEYIUJF41+uNi2Yk2VWGy9GvaE62ROCqwyL3y1ICiT1XU
	Kpb718Ljd/U5VOnW6nIAiOaFWxhGeFUj+kBGrZO0=
Content-Type: multipart/mixed; boundary="===============0089252228533605179=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cython: upgrading to 3.2.6 SUCCEEDED
Message-ID: <0101019efd4d29c4-5037956c-8e1b-450f-8b60-cf0783681efe-000000@us-west-2.amazonses.com>
Date: Thu, 25 Jun 2026 05:42:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.25-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 05:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239541

--===============0089252228533605179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cython* to *3.2.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cython-upgrade-3.2.5-3.2.6.patch
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
From 32f222e723d597308517270cd79fb2a29b932d41 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 25 Jun 2026 05:32:59 +0000
Subject: [PATCH] python3-cython: upgrade 3.2.5 -> 3.2.6

---
 ...1-Replace-not-predictable-build-path-prefix-with-hardc.patch | 2 +-
 .../python/{python3-cython_3.2.5.bb => python3-cython_3.2.6.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_3.2.5.bb => python3-cython_3.2.6.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
index fad7f28a60..8a4b08e1eb 100644
--- a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
+++ b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
@@ -1,4 +1,4 @@
-From 949e3c185719c37b3a3e4c11664db16533f51dc8 Mon Sep 17 00:00:00 2001
+From 4bdde55125a5aec0cbd7f06a55d582b4d6b206c6 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 17 Sep 2025 01:42:08 -0700
 Subject: [PATCH] Replace not predictable build path prefix with hardcode
diff --git a/meta/recipes-devtools/python/python3-cython_3.2.5.bb b/meta/recipes-devtools/python/python3-cython_3.2.6.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-cython_3.2.5.bb
rename to meta/recipes-devtools/python/python3-cython_3.2.6.bb
index 373387576a..985d86ea7d 100644
--- a/meta/recipes-devtools/python/python3-cython_3.2.5.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.2.6.bb
@@ -7,7 +7,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 
-SRC_URI[sha256sum] = "3dd42e4cf36ad15f265bdfec2337cc00c688c8eb6d374ffd13bb19437c27bba1"
+SRC_URI[sha256sum] = "6509472a245ccdf5fd11637a4744a1edfd38debb1a48332a8f3fe4b07db725bd"
 
 inherit pypi setuptools3 cython
 
-- 
2.47.1


--===============0089252228533605179==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cython-upgrade-3.2.5-3.2.6.patch"

RnJvbSAzMmYyMjJlNzIzZDU5NzMwODUxNzI3MGNkNzlmYjJhMjliOTMyZDQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjUgSnVuIDIwMjYgMDU6MzI6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWN5dGhvbjogdXBncmFkZSAzLjIuNSAtPiAzLjIuNgoKLS0tCiAuLi4xLVJlcGxhY2Ut
bm90LXByZWRpY3RhYmxlLWJ1aWxkLXBhdGgtcHJlZml4LXdpdGgtaGFyZGMucGF0Y2ggfCAyICst
CiAuLi4vcHl0aG9uL3tweXRob24zLWN5dGhvbl8zLjIuNS5iYiA9PiBweXRob24zLWN5dGhvbl8z
LjIuNi5iYn0gfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWN5
dGhvbl8zLjIuNS5iYiA9PiBweXRob24zLWN5dGhvbl8zLjIuNi5iYn0gKDkzJSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uLzAwMDEtUmVw
bGFjZS1ub3QtcHJlZGljdGFibGUtYnVpbGQtcGF0aC1wcmVmaXgtd2l0aC1oYXJkYy5wYXRjaCBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jeXRob24vMDAwMS1SZXBsYWNl
LW5vdC1wcmVkaWN0YWJsZS1idWlsZC1wYXRoLXByZWZpeC13aXRoLWhhcmRjLnBhdGNoCmluZGV4
IGZhZDdmMjhhNjAuLjhhNGIwOGUxZWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1jeXRob24vMDAwMS1SZXBsYWNlLW5vdC1wcmVkaWN0YWJsZS1idWls
ZC1wYXRoLXByZWZpeC13aXRoLWhhcmRjLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1jeXRob24vMDAwMS1SZXBsYWNlLW5vdC1wcmVkaWN0YWJsZS1idWls
ZC1wYXRoLXByZWZpeC13aXRoLWhhcmRjLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5NDll
M2MxODU3MTljMzdiM2EzZTRjMTE2NjRkYjE2NTMzZjUxZGM4IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSA0YmRkZTU1MTI1YTVhZWMwY2JkN2YwNmE1NWQ1ODJiNGQ2YjIwNmM2IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2
ZXIuY29tPgogRGF0ZTogV2VkLCAxNyBTZXAgMjAyNSAwMTo0MjowOCAtMDcwMAogU3ViamVjdDog
W1BBVENIXSBSZXBsYWNlIG5vdCBwcmVkaWN0YWJsZSBidWlsZCBwYXRoIHByZWZpeCB3aXRoIGhh
cmRjb2RlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
Y3l0aG9uXzMuMi41LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5
dGhvbl8zLjIuNi5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uXzMuMi41LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uXzMuMi42LmJiCmluZGV4IDM3
MzM4NzU3NmEuLjk4NWQ4NmVhN2QgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1jeXRob25fMy4yLjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWN5dGhvbl8zLjIuNi5iYgpAQCAtNyw3ICs3LDcgQEAgU0VDVElPTiA9
ICJkZXZlbC9weXRob24iCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9NjFjM2VlODk2MTU3NTg2MWZhODZjN2U2MmJjOWY2
OWMiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzZGQ0MmU0Y2YzNmFkMTVmMjY1YmRmZWMyMzM3
Y2MwMGM2ODhjOGViNmQzNzRmZmQxM2JiMTk0MzdjMjdiYmExIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjY1MDk0NzJhMjQ1Y2NkZjVmZDExNjM3YTQ3NDRhMWVkZmQzOGRlYmIxYTQ4MzMyYThmM2Zl
NGIwN2RiNzI1YmQiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMyBjeXRob24KIAotLSAKMi40
Ny4xCgo=

--===============0089252228533605179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cython-3.2.5.dist-info -> /usr/lib/python3.14/site-packages/cython-3.2.6.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.14/site-packages/cython-3.2.5.dist-info moved to /usr/lib/python3.14/site-packages/cython-3.2.6.dist-info

--===============0089252228533605179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-cython: PKGV changed from 3.2.5 [default] to 3.2.6 [default]
packages/x86-64-v3-poky-linux/python3-cython: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cython/cython-3.2.5.tar.gz;downloadfilename=cython-3.2.5.tar.gz file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch" to "https://files.pythonhosted.org/packages/source/c/cython/cython-3.2.6.tar.gz;downloadfilename=cython-3.2.6.tar.gz file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch"
packages/x86-64-v3-poky-linux/python3-cython: PV changed from "3.2.5" to "3.2.6"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PKGV changed from 3.2.5 [default] to 3.2.6 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PV changed from "3.2.5" to "3.2.6"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PKGSIZE changed from 27172384 to 27264248 (+0%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dev: PKGV changed from 3.2.5 [default] to 3.2.6 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dev: PV changed from "3.2.5" to "3.2.6"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-doc: PKGV changed from 3.2.5 [default] to 3.2.6 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-doc: PV changed from "3.2.5" to "3.2.6"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-locale: PKGV changed from 3.2.5 [default] to 3.2.6 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-locale: PV changed from "3.2.5" to "3.2.6"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PKGV changed from 3.2.5 [default] to 3.2.6 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: FILELIST: directory renamed /usr/src/debug/python3-cython/3.2.5/Cython/Plex -> /usr/src/debug/python3-cython/3.2.6/Cython/Plex, directory renamed /usr/src/debug/python3-cython/3.2.5/Cython/Runtime -> /usr/src/debug/python3-cython/3.2.6/Cython/Runtime, directory renamed /usr/src/debug/python3-cython/3.2.5/Cython/Compiler -> /usr/src/debug/python3-cython/3.2.6/Cython/Compiler, directory renamed /usr/src/debug/python3-cython/3.2.5/Cython/Tempita -> /usr/src/debug/python3-cython/3.2.6/Cython/Tempita, directory renamed /usr/src/debug/python3-cython/3.2.5/Cython -> /usr/src/debug/python3-cython/3.2.6/Cython
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PV changed from "3.2.5" to "3.2.6"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 23735594 to 23791347 (+0%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-staticdev: PKGV changed from 3.2.5 [default] to 3.2.6 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-staticdev: PV changed from "3.2.5" to "3.2.6"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PKGV changed from 3.2.5 [default] to 3.2.6 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cython-3.2.5.dist-info -> /usr/lib/python3.14/site-packages/cython-3.2.6.dist-info
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PV changed from "3.2.5" to "3.2.6"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 15319946 to 15337736 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.14/site-packages/cython-3.2.5.dist-info moved to /usr/lib/python3.14/site-packages/cython-3.2.6.dist-info

--===============0089252228533605179==--

