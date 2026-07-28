Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A984CC54F51
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 05:33:58 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5387.1785216829584445638
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 22:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eli30aB0;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Bzfqhgn5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019fa737048d-6b4bce21-755c-4066-a144-b87a664ca75b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785216828;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9KPHk63EYgdlZIqSa55ntYTks72cz2Fuw7Z8v6LkF34=;
	b=eli30aB0v3+H5zei09AGFb0GKUFiagJbUQALlacRIDjrsfEWfjhVHsm0isKfJqZI
	PpJKzKqGFtOr4VgZPtifVtaKGWvLdLiVByaanNIA07BhVpibe/fC2eyTuB0NmJwzons
	yHNyAVcg9iM0A9Xu9Wr22Eoy/eRtolgRQUR387zI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785216828;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9KPHk63EYgdlZIqSa55ntYTks72cz2Fuw7Z8v6LkF34=;
	b=Bzfqhgn5BRhuU7cu0RgBIPLMSApsU1ilKeoBZH0D8hTOGJ9sp4x/ALUVjlfPPNy+
	uqxgNR11tMgCP801dvlYEzspVW00GWOaExHduZtOvb9urcV7qnhMSJa+PvP6FjtExtW
	9HJUys4YluV91ni3Ycd+N8EgokbGYwYzYWATdsnM=
Content-Type: multipart/mixed; boundary="===============2339790395579206327=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxmlb: upgrading to 0.3.29 SUCCEEDED
Message-ID: <0101019fa737048d-6b4bce21-755c-4066-a144-b87a664ca75b-000000@us-west-2.amazonses.com>
Date: Tue, 28 Jul 2026 05:33:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.28-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 05:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242159

--===============2339790395579206327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxmlb* to *0.3.29* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxmlb-upgrade-0.3.28-0.3.29.patch
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
From 07eec48e10635e27b3f5cbccd97f7ad2e2485b85 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 28 Jul 2026 05:16:36 +0000
Subject: [PATCH] libxmlb: upgrade 0.3.28 -> 0.3.29

Source: NEWS

Version 0.3.29
~~~~~~~~~~~~~~
Released: 2026-07-27

New Features:
Bugfixes:
 - Avoid stale query indexes when reloading the silo (Richard Hughes)
 - Clear the query cache when reloading the silo (Richard Hughes)
 - Correctly mark the silo as invalid when re-loading malformed data (Richard Hughes)
 - Fix building the silo when shared-mime-info is installed (Richard Hughes)
---
 .../libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch     | 2 +-
 .../libxmlb/{libxmlb_0.3.28.bb => libxmlb_0.3.29.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.28.bb => libxmlb_0.3.29.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
index 39e85b319a..f0db37031e 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
+++ b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
@@ -1,4 +1,4 @@
-From da7a7acacde7771ce4c0fd3ae7e55d0c151ee063 Mon Sep 17 00:00:00 2001
+From d4aa8d857e1b18dff8bc23cc810c56b4dba3aa95 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Sat, 16 Sep 2023 14:02:57 +0200
 Subject: [PATCH] xb-self-test.c: hardcode G_TEST_SRCDIR
diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.28.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.28.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb
index 47c07d0c29..b070cbf99c 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.28.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "7a1b31db70bca83345de26219eb7e858cb85d321"
+SRCREV = "d942cd68a7d78e35b312b9299e69f68f9cd2e503"
 
 DEPENDS = "glib-2.0 xz zstd"
 
-- 
2.47.1


--===============2339790395579206327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libxmlb: PV changed from "0.3.28" to "0.3.29"
packages/x86-64-v3-poky-linux/libxmlb: PKGV changed from 0.3.28 [default] to 0.3.29 [default]
packages/x86-64-v3-poky-linux/libxmlb: SRC_URI changed from "git://github.com/hughsie/libxmlb.git;branch=main;protocol=https;tag=0.3.28 file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch file://run-ptest" to "git://github.com/hughsie/libxmlb.git;branch=main;protocol=https;tag=0.3.29 file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch file://run-ptest"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-bin: PV changed from "0.3.28" to "0.3.29"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-bin: PKGV changed from 0.3.28 [default] to 0.3.29 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dbg: PV changed from "0.3.28" to "0.3.29"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dbg: PKGSIZE changed from 2031808 to 2033464 (+0%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dbg: PKGV changed from 0.3.28 [default] to 0.3.29 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dev: PV changed from "0.3.28" to "0.3.29"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dev: PKGSIZE changed from 358319 to 358274 (-0%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dev: PKGV changed from 0.3.28 [default] to 0.3.29 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-doc: PV changed from "0.3.28" to "0.3.29"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-doc: PKGV changed from 0.3.28 [default] to 0.3.29 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-locale: PV changed from "0.3.28" to "0.3.29"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-locale: PKGV changed from 0.3.28 [default] to 0.3.29 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-ptest: PV changed from "0.3.28" to "0.3.29"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-ptest: PKGV changed from 0.3.28 [default] to 0.3.29 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: PV changed from "0.3.28" to "0.3.29"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: FILELIST: directory renamed /usr/src/debug/libxmlb/0.3.28/src -> /usr/src/debug/libxmlb/0.3.29/src
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: PKGSIZE changed from 539504 to 540120 (+0%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: PKGV changed from 0.3.28 [default] to 0.3.29 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-staticdev: PV changed from "0.3.28" to "0.3.29"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-staticdev: PKGV changed from 0.3.28 [default] to 0.3.29 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb: PV changed from "0.3.28" to "0.3.29"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb: PKGV changed from 0.3.28 [default] to 0.3.29 [default]

--===============2339790395579206327==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxmlb-upgrade-0.3.28-0.3.29.patch"

RnJvbSAwN2VlYzQ4ZTEwNjM1ZTI3YjNmNWNiY2NkOTdmN2FkMmUyNDg1Yjg1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjggSnVsIDIwMjYgMDU6MTY6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4bWxiOiB1cGdyYWRlIDAuMy4yOCAtPiAwLjMuMjkKClNvdXJjZTogTkVXUwoKVmVyc2lvbiAw
LjMuMjkKfn5+fn5+fn5+fn5+fn4KUmVsZWFzZWQ6IDIwMjYtMDctMjcKCk5ldyBGZWF0dXJlczoK
QnVnZml4ZXM6CiAtIEF2b2lkIHN0YWxlIHF1ZXJ5IGluZGV4ZXMgd2hlbiByZWxvYWRpbmcgdGhl
IHNpbG8gKFJpY2hhcmQgSHVnaGVzKQogLSBDbGVhciB0aGUgcXVlcnkgY2FjaGUgd2hlbiByZWxv
YWRpbmcgdGhlIHNpbG8gKFJpY2hhcmQgSHVnaGVzKQogLSBDb3JyZWN0bHkgbWFyayB0aGUgc2ls
byBhcyBpbnZhbGlkIHdoZW4gcmUtbG9hZGluZyBtYWxmb3JtZWQgZGF0YSAoUmljaGFyZCBIdWdo
ZXMpCiAtIEZpeCBidWlsZGluZyB0aGUgc2lsbyB3aGVuIHNoYXJlZC1taW1lLWluZm8gaXMgaW5z
dGFsbGVkIChSaWNoYXJkIEh1Z2hlcykKLS0tCiAuLi4vbGlieG1sYi8wMDAxLXhiLXNlbGZ0ZXN0
LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJUi5wYXRjaCAgICAgfCAyICstCiAuLi4vbGlieG1sYi97
bGlieG1sYl8wLjMuMjguYmIgPT4gbGlieG1sYl8wLjMuMjkuYmJ9ICAgICAgICAgICAgfCAyICst
CiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi97bGlieG1sYl8wLjMuMjguYmIgPT4gbGlieG1s
Yl8wLjMuMjkuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYnht
bGIvbGlieG1sYi8wMDAxLXhiLXNlbGZ0ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJUi5wYXRj
aCBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJ4bWxiL2xpYnhtbGIvMDAwMS14Yi1zZWxmdGVzdC5j
LWhhcmRjb2RlLUdfVEVTVF9TUkNESVIucGF0Y2gKaW5kZXggMzllODViMzE5YS4uZjBkYjM3MDMx
ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYi8wMDAxLXhi
LXNlbGZ0ZXN0LmMtaGFyZGNvZGUtR19URVNUX1NSQ0RJUi5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiLzAwMDEteGItc2VsZnRlc3QuYy1oYXJkY29kZS1HX1RF
U1RfU1JDRElSLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkYTdhN2FjYWNkZTc3NzFjZTRj
MGZkM2FlN2U1NWQwYzE1MWVlMDYzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkNGFh
OGQ4NTdlMWIxOGRmZjhiYzIzY2M4MTBjNTZiNGRiYTNhYTk1IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogTWFya3VzIFZvbGsgPGZfbF9rQHQtb25saW5lLmRlPgogRGF0ZTogU2F0LCAx
NiBTZXAgMjAyMyAxNDowMjo1NyArMDIwMAogU3ViamVjdDogW1BBVENIXSB4Yi1zZWxmLXRlc3Qu
YzogaGFyZGNvZGUgR19URVNUX1NSQ0RJUgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21l
L2xpYnhtbGIvbGlieG1sYl8wLjMuMjguYmIgYi9tZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi9s
aWJ4bWxiXzAuMy4yOS5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiXzAuMy4yOC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWdub21lL2xpYnhtbGIvbGlieG1sYl8wLjMuMjkuYmIKaW5kZXggNDdjMDdkMGMyOS4uYjA3
MGNiZjk5YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYl8w
LjMuMjguYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYl8wLjMuMjku
YmIKQEAgLTgsNyArOCw3IEBAIFNSQ19VUkkgPSAiIFwKIAlmaWxlOi8vMDAwMS14Yi1zZWxmdGVz
dC5jLWhhcmRjb2RlLUdfVEVTVF9TUkNESVIucGF0Y2ggXAogCWZpbGU6Ly9ydW4tcHRlc3QgXAog
IgotU1JDUkVWID0gIjdhMWIzMWRiNzBiY2E4MzM0NWRlMjYyMTllYjdlODU4Y2I4NWQzMjEiCitT
UkNSRVYgPSAiZDk0MmNkNjhhN2Q3OGUzNWIzMTJiOTI5OWU2OWY2OGY5Y2QyZTUwMyIKIAogREVQ
RU5EUyA9ICJnbGliLTIuMCB4eiB6c3RkIgogCi0tIAoyLjQ3LjEKCg==

--===============2339790395579206327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libxmlb-changelog.txt"

Changelog for libxmlb: 0.3.28 -> 0.3.29
Source: NEWS

Version 0.3.29
~~~~~~~~~~~~~~
Released: 2026-07-27

New Features:
Bugfixes:
 - Avoid stale query indexes when reloading the silo (Richard Hughes)
 - Clear the query cache when reloading the silo (Richard Hughes)
 - Correctly mark the silo as invalid when re-loading malformed data (Richard Hughes)
 - Fix building the silo when shared-mime-info is installed (Richard Hughes)

--===============2339790395579206327==--

