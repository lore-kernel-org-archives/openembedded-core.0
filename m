Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C85F43825
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:56 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19815.1776261874440482013
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=uuICBAGO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=yJZxoKTK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019d91758f4c-c356ad6e-1f86-497d-b155-4a5e8982b9d2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261894;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1aH6VueS+OXcARx9V0rh5EcHa4cZP8Lbgaf9SybURyU=;
	b=uuICBAGOzavkM87soggu6x6JQ3KkiHQp7p/Hgk/csxEoShmVD2k6ArY3wam6XKMN
	KCwkW6Dc3riSs8sFL8kx17BNNkm0he+Otw+y/6HNh7apc2rcZwN8ccPB3/mLC9DdcTf
	BAkUXlrYKWe/lQ00XY7J8tlAn+j41mYSQ7VSDDWI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261894;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1aH6VueS+OXcARx9V0rh5EcHa4cZP8Lbgaf9SybURyU=;
	b=yJZxoKTKjEq3oB7nc6gorSqWRv5za1h7l1fts5aAAKT3prRpTx0o+jlLSyWvP6Ld
	6ExtuuMp2GsIXUgiRFc8rR69V6QUN7fcNXE64wHd4IGTwU4dPBAy37cFLb/vjqSx2rg
	Q6+pHi6gcL+DVG55YCWgdShAUgz6iYaAZ0rD/8Cg=
Content-Type: multipart/mixed; boundary="===============0707089278230854485=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libexif: upgrading to 0.6.26 SUCCEEDED
Message-ID: <0101019d91758f4c-c356ad6e-1f86-497d-b155-4a5e8982b9d2-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235297

--===============0707089278230854485==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libexif* to *0.6.26* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libexif-upgrade-0.6.25-0.6.26.patch
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
From 3afebde5d8daa7f63b348d4cb3d42f3b2195069c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 13:17:26 +0000
Subject: [PATCH] libexif: upgrade 0.6.25 -> 0.6.26

---
 .../0001-Add-serial-tests-config-needed-by-ptest.patch        | 4 ++--
 .../libexif/{libexif_0.6.25.bb => libexif_0.6.26.bb}          | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libexif/{libexif_0.6.25.bb => libexif_0.6.26.bb} (93%)

diff --git a/meta/recipes-support/libexif/libexif/0001-Add-serial-tests-config-needed-by-ptest.patch b/meta/recipes-support/libexif/libexif/0001-Add-serial-tests-config-needed-by-ptest.patch
index 26ab7f657f..44f6221880 100644
--- a/meta/recipes-support/libexif/libexif/0001-Add-serial-tests-config-needed-by-ptest.patch
+++ b/meta/recipes-support/libexif/libexif/0001-Add-serial-tests-config-needed-by-ptest.patch
@@ -1,4 +1,4 @@
-From ea0110e5def8eaf2567193323601f06ff892ce15 Mon Sep 17 00:00:00 2001
+From acaf743269b742209b24c57adde1cb0b7e677904 Mon Sep 17 00:00:00 2001
 From: Julien Stephan <jstephan@baylibre.com>
 Date: Tue, 11 Jul 2023 16:07:54 +0200
 Subject: [PATCH] Add serial-tests config needed by ptest
@@ -13,7 +13,7 @@ Signed-off-by: Julien Stephan <jstephan@baylibre.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/configure.ac b/configure.ac
-index 9e483c9..561b61c 100644
+index d43d33f..63a57cd 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -21,6 +21,7 @@ AM_INIT_AUTOMAKE([
diff --git a/meta/recipes-support/libexif/libexif_0.6.25.bb b/meta/recipes-support/libexif/libexif_0.6.26.bb
similarity index 93%
rename from meta/recipes-support/libexif/libexif_0.6.25.bb
rename to meta/recipes-support/libexif/libexif_0.6.26.bb
index c57855303f..56b2e1e168 100644
--- a/meta/recipes-support/libexif/libexif_0.6.25.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.26.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libexif-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "7c9eba99aed3e6594d8c3e85861f1c6aaf450c218621528bc989d3b3e7a26307"
+SRC_URI[sha256sum] = "0830ed253fceeb60444fb309598bc8a9491d3007dc054aad3a50a347c5597c57"
 
 inherit autotools gettext github-releases ptest
 
-- 
2.47.1


--===============0707089278230854485==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libexif-upgrade-0.6.25-0.6.26.patch"

RnJvbSAzYWZlYmRlNWQ4ZGFhN2Y2M2IzNDhkNGNiM2Q0MmYzYjIxOTUwNjljIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMTM6MTc6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJleGlmOiB1cGdyYWRlIDAuNi4yNSAtPiAwLjYuMjYKCi0tLQogLi4uLzAwMDEtQWRkLXNlcmlh
bC10ZXN0cy1jb25maWctbmVlZGVkLWJ5LXB0ZXN0LnBhdGNoICAgICAgICB8IDQgKystLQogLi4u
L2xpYmV4aWYve2xpYmV4aWZfMC42LjI1LmJiID0+IGxpYmV4aWZfMC42LjI2LmJifSAgICAgICAg
ICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmV4aWYve2xpYmV4aWZfMC42LjI1LmJi
ID0+IGxpYmV4aWZfMC42LjI2LmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2xpYmV4aWYvbGliZXhpZi8wMDAxLUFkZC1zZXJpYWwtdGVzdHMtY29uZmlnLW5lZWRl
ZC1ieS1wdGVzdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmV4aWYvbGliZXhpZi8w
MDAxLUFkZC1zZXJpYWwtdGVzdHMtY29uZmlnLW5lZWRlZC1ieS1wdGVzdC5wYXRjaAppbmRleCAy
NmFiN2Y2NTdmLi40NGY2MjIxODgwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJleGlmL2xpYmV4aWYvMDAwMS1BZGQtc2VyaWFsLXRlc3RzLWNvbmZpZy1uZWVkZWQtYnktcHRl
c3QucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZXhpZi9saWJleGlmLzAwMDEt
QWRkLXNlcmlhbC10ZXN0cy1jb25maWctbmVlZGVkLWJ5LXB0ZXN0LnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSBlYTAxMTBlNWRlZjhlYWYyNTY3MTkzMzIzNjAxZjA2ZmY4OTJjZTE1IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhY2FmNzQzMjY5Yjc0MjIwOWIyNGM1N2FkZGUxY2Iw
YjdlNjc3OTA0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSnVsaWVuIFN0ZXBoYW4g
PGpzdGVwaGFuQGJheWxpYnJlLmNvbT4KIERhdGU6IFR1ZSwgMTEgSnVsIDIwMjMgMTY6MDc6NTQg
KzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gQWRkIHNlcmlhbC10ZXN0cyBjb25maWcgbmVlZGVkIGJ5
IHB0ZXN0CkBAIC0xMyw3ICsxMyw3IEBAIFNpZ25lZC1vZmYtYnk6IEp1bGllbiBTdGVwaGFuIDxq
c3RlcGhhbkBiYXlsaWJyZS5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAK
IGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDllNDgzYzku
LjU2MWI2MWMgMTAwNjQ0CitpbmRleCBkNDNkMzNmLi42M2E1N2NkIDEwMDY0NAogLS0tIGEvY29u
ZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKIEBAIC0yMSw2ICsyMSw3IEBAIEFNX0lOSVRf
QVVUT01BS0UoWwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZXhpZi9saWJl
eGlmXzAuNi4yNS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmV4aWYvbGliZXhpZl8wLjYu
MjYuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBv
cnQvbGliZXhpZi9saWJleGlmXzAuNi4yNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBv
cnQvbGliZXhpZi9saWJleGlmXzAuNi4yNi5iYgppbmRleCBjNTc4NTUzMDNmLi41NmIyZTFlMTY4
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJleGlmL2xpYmV4aWZfMC42LjI1
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmV4aWYvbGliZXhpZl8wLjYuMjYuYmIK
QEAgLTEyLDcgKzEyLDcgQEAgU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQv
diR7UFZ9L2xpYmV4aWYtJHtQVn0udGFyLmJ6MiBcCiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRl
c3QgXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3YzllYmE5OWFlZDNl
NjU5NGQ4YzNlODU4NjFmMWM2YWFmNDUwYzIxODYyMTUyOGJjOTg5ZDNiM2U3YTI2MzA3IgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjA4MzBlZDI1M2ZjZWViNjA0NDRmYjMwOTU5OGJjOGE5NDkxZDMw
MDdkYzA1NGFhZDNhNTBhMzQ3YzU1OTdjNTciCiAKIGluaGVyaXQgYXV0b3Rvb2xzIGdldHRleHQg
Z2l0aHViLXJlbGVhc2VzIHB0ZXN0CiAKLS0gCjIuNDcuMQoK

--===============0707089278230854485==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libexif: SRC_URI changed from "https://github.com/libexif/libexif/releases//download/v0.6.25/libexif-0.6.25.tar.bz2 file://0001-Add-serial-tests-config-needed-by-ptest.patch file://run-ptest" to "https://github.com/libexif/libexif/releases//download/v0.6.26/libexif-0.6.26.tar.bz2 file://0001-Add-serial-tests-config-needed-by-ptest.patch file://run-ptest"
packages/x86-64-v3-poky-linux/libexif: PKGV changed from 0.6.25 [default] to 0.6.26 [default]
packages/x86-64-v3-poky-linux/libexif: PV changed from "0.6.25" to "0.6.26"
packages/x86-64-v3-poky-linux/libexif/libexif-dbg: PKGV changed from 0.6.25 [default] to 0.6.26 [default]
packages/x86-64-v3-poky-linux/libexif/libexif-dbg: PKGSIZE changed from 743424 to 744856 (+0%)
packages/x86-64-v3-poky-linux/libexif/libexif-dbg: PV changed from "0.6.25" to "0.6.26"
packages/x86-64-v3-poky-linux/libexif/libexif-dev: PKGV changed from 0.6.25 [default] to 0.6.26 [default]
packages/x86-64-v3-poky-linux/libexif/libexif-dev: PKGSIZE changed from 60641 to 60670 (+0%)
packages/x86-64-v3-poky-linux/libexif/libexif-dev: PV changed from "0.6.25" to "0.6.26"
packages/x86-64-v3-poky-linux/libexif/libexif-doc: PKGV changed from 0.6.25 [default] to 0.6.26 [default]
packages/x86-64-v3-poky-linux/libexif/libexif-doc: PKGSIZE changed from 206097 to 206718 (+0%)
packages/x86-64-v3-poky-linux/libexif/libexif-doc: PV changed from "0.6.25" to "0.6.26"
packages/x86-64-v3-poky-linux/libexif/libexif-locale: PKGV changed from 0.6.25 [default] to 0.6.26 [default]
packages/x86-64-v3-poky-linux/libexif/libexif-locale: PV changed from "0.6.25" to "0.6.26"
packages/x86-64-v3-poky-linux/libexif/libexif-ptest: PKGV changed from 0.6.25 [default] to 0.6.26 [default]
packages/x86-64-v3-poky-linux/libexif/libexif-ptest: PV changed from "0.6.25" to "0.6.26"
packages/x86-64-v3-poky-linux/libexif/libexif-src: FILELIST: directory renamed /usr/src/debug/libexif/0.6.25/libexif/fuji -> /usr/src/debug/libexif/0.6.26/libexif/fuji, directory renamed /usr/src/debug/libexif/0.6.25/libexif/olympus -> /usr/src/debug/libexif/0.6.26/libexif/olympus, directory renamed /usr/src/debug/libexif/0.6.25/libexif -> /usr/src/debug/libexif/0.6.26/libexif, directory renamed /usr/src/debug/libexif/0.6.25/test -> /usr/src/debug/libexif/0.6.26/test, directory renamed /usr/src/debug/libexif/0.6.25/libexif/canon -> /usr/src/debug/libexif/0.6.26/libexif/canon, directory renamed /usr/src/debug/libexif/0.6.25/libexif/pentax -> /usr/src/debug/libexif/0.6.26/libexif/pentax
packages/x86-64-v3-poky-linux/libexif/libexif-src: PKGV changed from 0.6.25 [default] to 0.6.26 [default]
packages/x86-64-v3-poky-linux/libexif/libexif-src: PKGSIZE changed from 545530 to 546287 (+0%)
packages/x86-64-v3-poky-linux/libexif/libexif-src: PV changed from "0.6.25" to "0.6.26"
packages/x86-64-v3-poky-linux/libexif/libexif-staticdev: PKGV changed from 0.6.25 [default] to 0.6.26 [default]
packages/x86-64-v3-poky-linux/libexif/libexif-staticdev: PV changed from "0.6.25" to "0.6.26"
packages/x86-64-v3-poky-linux/libexif/libexif: PKGV changed from 0.6.25 [default] to 0.6.26 [default]
packages/x86-64-v3-poky-linux/libexif/libexif: PV changed from "0.6.25" to "0.6.26"

--===============0707089278230854485==--

