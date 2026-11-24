Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12516.1795501913076488405
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 22:31:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YU6ayPLF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NBPDtw9w;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a20c40f075-657d748a-df89-4061-8136-93c3782b6907-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795501912;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/xMSODB2I758d7DkE3zk8r6RxSva1Qpr2Y2uK58Ht/M=;
	b=YU6ayPLFbD0c2HoN4iiMp4Aq/W4hGnMnnKwNciGvo1uYTu2TabCHeGQDiErjsPrJ
	qarnabvL0gcfcbovjF8ojnaHwiLJymMGsf3xOKl8Pa2SymgcscILoF48KUTqRpT/RB5
	JXmkniQ+5oFMu7ugAXymCuHizYLKZ1gQuCvg4vFA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795501912;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/xMSODB2I758d7DkE3zk8r6RxSva1Qpr2Y2uK58Ht/M=;
	b=NBPDtw9wi63v4ETN+QPStOsz35/ZU3YN7bfV2YDupvNnJUr9zmGVacpILtr2Ix/y
	vDATHmhHf2/ZFA2rgaY0JXPa4cg08geNJSZQ7r0nfl0otNSKDZp6cfZKyVCCGsCRNSm
	PS7beVNTX7vdc2HOqlPwHo76vI/uDw2uTb/xxvws=
Content-Type: multipart/mixed; boundary="===============2719345190268848235=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Kusuma Dirisala <kusuma.dirisala@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] expat: upgrading to 2.11.0 SUCCEEDED
Message-ID: <010101a20c40f075-657d748a-df89-4061-8136-93c3782b6907-000000@us-west-2.amazonses.com>
Date: Tue, 24 Nov 2026 06:31:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.24-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 06:31:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250952

--===============2719345190268848235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *expat* to *2.11.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-expat-upgrade-2.10.0-2.11.0.patch
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
From a7b6790cdd2b143861cca72c8dbc3b3b4e29ef21 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 24 Nov 2026 05:21:34 +0000
Subject: [PATCH] expat: upgrade 2.10.0 -> 2.11.0

---
 meta/recipes-core/expat/{expat_2.10.0.bb => expat_2.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.10.0.bb => expat_2.11.0.bb} (92%)

diff --git a/meta/recipes-core/expat/expat_2.10.0.bb b/meta/recipes-core/expat/expat_2.11.0.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.10.0.bb
rename to meta/recipes-core/expat/expat_2.11.0.bb
index 5b252f6146..14f6025799 100644
--- a/meta/recipes-core/expat/expat_2.10.0.bb
+++ b/meta/recipes-core/expat/expat_2.11.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.xz  \
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "c624ba2998fc65df1163a49641ff3f9ab73138b11641d92c86bee0fb01b1bc7f"
+SRC_URI[sha256sum] = "61e7614b602201c28a189dafee78f5bceaee192bbde46a930752ff09cf5542fa"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.47.1


--===============2719345190268848235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/expat/expat-dev: FILELIST: directory renamed /usr/lib/cmake/expat-2.10.0 -> /usr/lib/cmake/expat-2.11.0
packages/x86-64-v3-poky-linux/expat/expat: FILELIST: removed "/usr/lib/libexpat.so.1.13.1", added "/usr/lib/libexpat.so.1.14.0"
Changes to packages/x86-64-v3-poky-linux/expat (sysroot):
  /usr/lib/libexpat.so.1 changed symlink target from libexpat.so.1.13.1 to libexpat.so.1.14.0
  /usr/lib/cmake/expat-2.10.0 moved to /usr/lib/cmake/expat-2.11.0
  /usr/lib/libexpat.so.1.13.1 moved to /usr/lib/libexpat.so.1.14.0
Changes to packages/x86_64-linux/expat-native (sysroot):
  /usr/lib/libexpat.so.1 changed symlink target from libexpat.so.1.13.1 to libexpat.so.1.14.0
  /usr/lib/cmake/expat-2.10.0 moved to /usr/lib/cmake/expat-2.11.0
  /usr/lib/libexpat.so.1.13.1 moved to /usr/lib/libexpat.so.1.14.0

--===============2719345190268848235==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-expat-upgrade-2.10.0-2.11.0.patch"

RnJvbSBhN2I2NzkwY2RkMmIxNDM4NjFjY2E3MmM4ZGJjM2IzYjRlMjllZjIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjQgTm92IDIwMjYgMDU6MjE6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
eHBhdDogdXBncmFkZSAyLjEwLjAgLT4gMi4xMS4wCgotLS0KIG1ldGEvcmVjaXBlcy1jb3JlL2V4
cGF0L3tleHBhdF8yLjEwLjAuYmIgPT4gZXhwYXRfMi4xMS4wLmJifSB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1jb3JlL2V4cGF0L3tleHBhdF8yLjEwLjAuYmIgPT4gZXhwYXRfMi4xMS4wLmJifSAoOTIlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2V4cGF0L2V4cGF0XzIuMTAuMC5iYiBiL21l
dGEvcmVjaXBlcy1jb3JlL2V4cGF0L2V4cGF0XzIuMTEuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDky
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9leHBhdC9leHBhdF8yLjEwLjAuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL2V4cGF0L2V4cGF0XzIuMTEuMC5iYgppbmRleCA1YjI1
MmY2MTQ2Li4xNGY2MDI1Nzk5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9leHBhdC9l
eHBhdF8yLjEwLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZXhwYXQvZXhwYXRfMi4xMS4w
LmJiCkBAIC0xNSw3ICsxNSw3IEBAIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25s
b2FkL1JfJHtWRVJTSU9OX1RBR30vZXhwYXQtJHtQVn0udGFyLnh6ICBcCiBHSVRIVUJfQkFTRV9V
UkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL2xpYmV4cGF0L2xpYmV4cGF0L3JlbGVhc2VzLyIKIFVQ
U1RSRUFNX0NIRUNLX1JFR0VYID0gInJlbGVhc2VzL3RhZy9SXyg/UDxwdmVyPi4rKSIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gImM2MjRiYTI5OThmYzY1ZGYxMTYzYTQ5NjQxZmYzZjlhYjczMTM4
YjExNjQxZDkyYzg2YmVlMGZiMDFiMWJjN2YiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjFlNzYx
NGI2MDIyMDFjMjhhMTg5ZGFmZWU3OGY1YmNlYWVlMTkyYmJkZTQ2YTkzMDc1MmZmMDljZjU1NDJm
YSIKIAogRVhUUkFfT0VDTUFLRTpjbGFzcy1uYXRpdmUgKz0gIi1ERVhQQVRfQlVJTERfRE9DUz1P
RkYiCiAKLS0gCjIuNDcuMQoK

--===============2719345190268848235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/expat/expat-bin: PV changed from "2.10.0" to "2.11.0"
packages/x86-64-v3-poky-linux/expat/expat-bin: PKGV changed from 2.10.0 [default] to 2.11.0 [default]
packages/x86-64-v3-poky-linux/expat/expat-dbg: PV changed from "2.10.0" to "2.11.0"
packages/x86-64-v3-poky-linux/expat/expat-dbg: PKGV changed from 2.10.0 [default] to 2.11.0 [default]
packages/x86-64-v3-poky-linux/expat/expat-dbg: FILELIST: removed "/usr/lib/.debug/libexpat.so.1.13.1", added "/usr/lib/.debug/libexpat.so.1.14.0"
packages/x86-64-v3-poky-linux/expat/expat-dbg: PKGSIZE changed from 1965840 to 2133424 (+9%)
packages/x86-64-v3-poky-linux/expat/expat-dev: PV changed from "2.10.0" to "2.11.0"
packages/x86-64-v3-poky-linux/expat/expat-dev: PKGV changed from 2.10.0 [default] to 2.11.0 [default]
packages/x86-64-v3-poky-linux/expat/expat-dev: FILELIST: directory renamed /usr/lib/cmake/expat-2.10.0 -> /usr/lib/cmake/expat-2.11.0
packages/x86-64-v3-poky-linux/expat/expat-dev: PKGSIZE changed from 70447 to 70585 (+0%)
packages/x86-64-v3-poky-linux/expat/expat-doc: PV changed from "2.10.0" to "2.11.0"
packages/x86-64-v3-poky-linux/expat/expat-doc: PKGV changed from 2.10.0 [default] to 2.11.0 [default]
packages/x86-64-v3-poky-linux/expat/expat-doc: PKGSIZE changed from 135863 to 142970 (+5%)
packages/x86-64-v3-poky-linux/expat/expat-locale: PV changed from "2.10.0" to "2.11.0"
packages/x86-64-v3-poky-linux/expat/expat-locale: PKGV changed from 2.10.0 [default] to 2.11.0 [default]
packages/x86-64-v3-poky-linux/expat/expat-ptest: PV changed from "2.10.0" to "2.11.0"
packages/x86-64-v3-poky-linux/expat/expat-ptest: PKGV changed from 2.10.0 [default] to 2.11.0 [default]
packages/x86-64-v3-poky-linux/expat/expat-ptest: PKGSIZE changed from 588736 to 629696 (+7%)
packages/x86-64-v3-poky-linux/expat/expat-src: PV changed from "2.10.0" to "2.11.0"
packages/x86-64-v3-poky-linux/expat/expat-src: PKGV changed from 2.10.0 [default] to 2.11.0 [default]
packages/x86-64-v3-poky-linux/expat/expat-src: FILELIST: directory renamed /usr/src/debug/expat/2.10.0/tests/benchmark -> /usr/src/debug/expat/2.11.0/tests/benchmark, directory renamed /usr/src/debug/expat/2.10.0/lib -> /usr/src/debug/expat/2.11.0/lib, directory renamed /usr/src/debug/expat/2.10.0/xmlwf -> /usr/src/debug/expat/2.11.0/xmlwf, removed "/usr/src/debug/expat/2.10.0/tests/dummy.c /usr/src/debug/expat/2.10.0/tests/hash_tests.c /usr/src/debug/expat/2.10.0/tests/misc_tests.c /usr/src/debug/expat/2.10.0/tests/ns_tests.h /usr/src/debug/expat/2.10.0/tests/hash_tests.h /usr/src/debug/expat/2.10.0/tests/misc_tests.h /usr/src/debug/expat/2.10.0/tests/dummy.h /usr/src/debug/expat/2.10.0/tests/ns_tests.c /usr/src/debug/expat/2.10.0/tests/runtests.c /usr/src/debug/expat/2.10.0/tests/nsalloc_tests.c /usr/src/debug/expat/2.10.0/tests/acc_tests.c /usr/src/debug/expat/2.10.0/tests/xcs_tests.c /usr/src/debug/expat/2.10.0/tests/structdata.c /usr/src/debug/expat/2.10.0/tests/acc_tests.h /usr
 /src/debug/expat/2.10.0/tests/nsalloc_tests.h /usr/src/debug/expat/2.10.0/tests/xcs_tests.h /usr/src/debug/expat/2.10.0/tests/structdata.h /usr/src/debug/expat/2.10.0/tests/common.h /usr/src/debug/expat/2.10.0/tests/common.c /usr/src/debug/expat/2.10.0/tests/chardata.h /usr/src/debug/expat/2.10.0/tests/minicheck.h /usr/src/debug/expat/2.10.0/tests/minicheck.c /usr/src/debug/expat/2.10.0/tests/chardata.c /usr/src/debug/expat/2.10.0/tests/entities_tests.h /usr/src/debug/expat/2.10.0/tests/alloc_tests.c /usr/src/debug/expat/2.10.0/tests/basic_tests.c /usr/src/debug/expat/2.10.0/tests/entities_tests.c /usr/src/debug/expat/2.10.0/tests/props_tests.c /usr/src/debug/expat/2.10.0/tests/basic_tests.h /usr/src/debug/expat/2.10.0/tests/alloc_tests.h /usr/src/debug/expat/2.10.0/tests/props_tests.h /usr/src/debug/expat/2.10.0/tests/handlers.c /usr/src/debug/expat/2.10.0/tests/handlers.h /usr/src/debug/expat/2.10.0/tests/memcheck.h /usr/src/debug/expat/2.10.0/tests/memcheck.c", added "/usr/src/de
 bug/expat/2.11.0/tests/utfx.c /usr/src/debug/expat/2.11.0/tests/dummy.h /usr/src/debug/expat/2.11.0/tests/entities_tests.c /usr/src/debug/expat/2.11.0/tests/hash_tests.h /usr/src/debug/expat/2.11.0/tests/misc_tests.h /usr/src/debug/expat/2.11.0/tests/dummy.c /usr/src/debug/expat/2.11.0/tests/utfx.h /usr/src/debug/expat/2.11.0/tests/hash_tests.c /usr/src/debug/expat/2.11.0/tests/entities_tests.h /usr/src/debug/expat/2.11.0/tests/misc_tests.c /usr/src/debug/expat/2.11.0/tests/alloc_tests.h /usr/src/debug/expat/2.11.0/tests/basic_tests.h /usr/src/debug/expat/2.11.0/tests/props_tests.h /usr/src/debug/expat/2.11.0/tests/basic_tests.c /usr/src/debug/expat/2.11.0/tests/props_tests.c /usr/src/debug/expat/2.11.0/tests/alloc_tests.c /usr/src/debug/expat/2.11.0/tests/common.h /usr/src/debug/expat/2.11.0/tests/minicheck.h /usr/src/debug/expat/2.11.0/tests/minicheck.c /usr/src/debug/expat/2.11.0/tests/fifth_edition_tests.h /usr/src/debug/expat/2.11.0/tests/chardata.c /usr/src/debug/expat/2.11.0/
 tests/ns_tests.c /usr/src/debug/expat/2.11.0/tests/runtests.c /usr/src/debug/expat/2.11.0/tests/ns_tests.h /usr/src/debug/expat/2.11.0/tests/chardata.h /usr/src/debug/expat/2.11.0/tests/fifth_edition_tests.c /usr/src/debug/expat/2.11.0/tests/structdata.c /usr/src/debug/expat/2.11.0/tests/acc_tests.h /usr/src/debug/expat/2.11.0/tests/xcs_tests.h /usr/src/debug/expat/2.11.0/tests/nsalloc_tests.c /usr/src/debug/expat/2.11.0/tests/structdata.h /usr/src/debug/expat/2.11.0/tests/nsalloc_tests.h /usr/src/debug/expat/2.11.0/tests/acc_tests.c /usr/src/debug/expat/2.11.0/tests/xcs_tests.c /usr/src/debug/expat/2.11.0/tests/handlers.c /usr/src/debug/expat/2.11.0/tests/common.c /usr/src/debug/expat/2.11.0/tests/handlers.h /usr/src/debug/expat/2.11.0/tests/memcheck.c /usr/src/debug/expat/2.11.0/tests/memcheck.h"
packages/x86-64-v3-poky-linux/expat/expat-src: PKGSIZE changed from 1492849 to 1588122 (+6%)
packages/x86-64-v3-poky-linux/expat/expat-staticdev: PV changed from "2.10.0" to "2.11.0"
packages/x86-64-v3-poky-linux/expat/expat-staticdev: PKGV changed from 2.10.0 [default] to 2.11.0 [default]
packages/x86-64-v3-poky-linux/expat/expat: PV changed from "2.10.0" to "2.11.0"
packages/x86-64-v3-poky-linux/expat/expat: PKGV changed from 2.10.0 [default] to 2.11.0 [default]
packages/x86-64-v3-poky-linux/expat/expat: FILELIST: removed "/usr/lib/libexpat.so.1.13.1", added "/usr/lib/libexpat.so.1.14.0"
packages/x86-64-v3-poky-linux/expat/expat: PKGSIZE changed from 202738 to 215026 (+6%)
packages/x86-64-v3-poky-linux/expat: PV changed from "2.10.0" to "2.11.0"
packages/x86-64-v3-poky-linux/expat: PKGV changed from 2.10.0 [default] to 2.11.0 [default]
packages/x86-64-v3-poky-linux/expat: SRC_URI changed from "https://github.com/libexpat/libexpat/releases//download/R_2_10_0/expat-2.10.0.tar.xz file://run-ptest" to "https://github.com/libexpat/libexpat/releases//download/R_2_11_0/expat-2.11.0.tar.xz file://run-ptest"
Changes to packages/x86-64-v3-poky-linux/expat (sysroot):
  /usr/lib/libexpat.so.1 changed symlink target from libexpat.so.1.13.1 to libexpat.so.1.14.0
  /usr/lib/cmake/expat-2.10.0 moved to /usr/lib/cmake/expat-2.11.0
  /usr/lib/libexpat.so.1.13.1 moved to /usr/lib/libexpat.so.1.14.0
Changes to packages/x86_64-linux/expat-native (sysroot):
  /usr/lib/libexpat.so.1 changed symlink target from libexpat.so.1.13.1 to libexpat.so.1.14.0
  /usr/lib/cmake/expat-2.10.0 moved to /usr/lib/cmake/expat-2.11.0
  /usr/lib/libexpat.so.1.13.1 moved to /usr/lib/libexpat.so.1.14.0

--===============2719345190268848235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="expat-changelog.txt"

UmVsZWFzZSAyLjExLjAgTW9uIE5vdmVtYmVyIDIzIDIwMjYKICAgICAgICBTZWN1cml0eSBmaXhl
czoKICAgICAgICAgICAjMTQ5MuKBoCAgQ1ZFLTIwMjYtMTI0MzE3IC0tIEZpeCBvdmVycmVhZCBp
biB1bmtub3duIGVuY29kaW5nIGRlY29kZXIKICAgICAgICAgICAgICAgICAgICBJdCBuZWVkcyB1
c2Ugb2YgYFhNTF9TZXRVbmtub3duRW5jb2RpbmdIYW5kbGVyYCB0byBiZQogICAgICAgICAgICAg
ICAgICAgIGFmZmVjdGVkLgogICAgICAgICAgICMxNTAy4oGgICBDVkUtMjAyNi0xMjgyNDEgLS0g
eG1sd2Y6IFBsdWcgc3ltbGluayBhdHRhY2tzIHdpdGggdGhlCiAgICAgICAgICAgICAgICAgICAg
YC1kIDxkaXJlY3Rvcnk+YCBtb2RlLiBUaGUgeG1sd2YgQ0xJIG9mIGxpYmV4cGF0IHdhcwogICAg
ICAgICAgICAgICAgICAgIHZ1bG5lcmFibGUgdG8gc3ltbGluayBhdHRhY2tzIGluIHRoZSBgLWQg
PGRpcmVjdG9yeT5gIG1vZGUKICAgICAgICAgICAgICAgICAgICB3aXRoIGEgdGFyZ2V0IGRpcmVj
dG9yeSB3cml0YWJsZSBieSBvdGhlciB1c2VycywgZS5nLiAvdG1wLgogICAgICAgICAgICAgICAg
ICAgIFRoZSBhdHRhY2sgYWxsb3dlZCB0cnVuY2F0aW9uIG9yIG92ZXJ3cml0aW5nIHRoZSBzeW1s
aW5rCiAgICAgICAgICAgICAgICAgICAgdGFyZ2V0IGZpbGUgZGVwZW5kaW5nIG9uIHRoZSB3ZWxs
LWZvcm1lZG5lc3Mgb2YgdGhlIFhNTAogICAgICAgICAgICAgICAgICAgIGJlaW5nIHBhcnNlZC4K
ICAgICAgICAgICAjMTUxOSAgQ1ZFLTIwMjYtMTM0NzAzIC0tIE1hbGZvcm1lZCBVVEYtMTYgY29u
dGVudCBlbmRpbmcgaW4KICAgICAgICAgICAgICAgICAgICBpc29sYXRlZCBoaWdoIHN1cnJvZ2F0
ZXMgY291bGQgYmUgcGFzc2VkIHRvIGNoYXJhY3RlciBkYXRhCiAgICAgICAgICAgICAgICAgICAg
YW5kIGRlZmF1bHQgaGFuZGxlcnMgZGVwZW5kaW5nIG9uIHRoZWlyIGxvY2F0aW9uIGluIHRoZQog
ICAgICAgICAgICAgICAgICAgIHBhcnNlZCBkb2N1bWVudCBhbmQgY291bGQgY2F1c2UgYXJiaXRy
YXJ5IGRhbWFnZSBkZXBlbmRpbmcKICAgICAgICAgICAgICAgICAgICBvbiB0aGUgaGFuZGxlciBj
b2RlIGluIHRoZSBhcHBsaWNhdGlvbiB1c2luZyBsaWJleHBhdC4KICAgICAgICAgICAgICAgICAg
ICBBcHBsaWNhdGlvbnMgY2FuIGV4cGVjdCB0ZXh0IGZyZWUgZnJvbSBpc29sYXRlZCBzdXJyb2dh
dGVzCiAgICAgICAgICAgICAgICAgICAgZnJvbSBFeHBhdC4KICAgICAgICAgICAgICAgICAgICBT
aW1pbGFyIHRvIHBhc3QgQ1ZFLTIwMjYtOTM5OTAgYW5kIENWRS0yMDIyLTI1MjM1LgogICAgICAg
ICAgICMxNDk1ICBSZXN0b3JlIGFuZCBkb2N1bWVudCBgLWZuby1zdHJpY3QtYWxpYXNpbmdgIGZv
ciBzZWN1cml0eQogICAgICAgICAgICAgICAgICAgIHdpdGggYm90aCBHQ0MgYW5kIENsYW5nID49
MjAuCiAgICAgICAgICAgICAgICAgICAgbGliZXhwYXQgY29udGludWVzIHRvIGJlIGAtV3N0cmlj
dC1hbGlhc2luZz0zYCBjbGVhbiBhbmQKICAgICAgICAgICAgICAgICAgICB0byByZWplY3Qgdmlv
bGF0aW9ucyB2aWEgQ0kgYnV0IHRoZXJlIGFyZSBtdWx0aXBsZSBrbm93bgogICAgICAgICAgICAg
ICAgICAgIHN0cmljdCBhbGlhc2luZyB2aW9sYXRpb25zIHdpdGhpbiBsaWJleHBhdCB0aGF0IGRl
c3BpdGUKICAgICAgICAgICAgICAgICAgICBgLVdzdHJpY3QtYWxpYXNpbmc9M2AgYXJlIG5vdCBk
ZXRlY3RlZCBieSBHQ0MgYW5kIHdoaWNoCiAgICAgICAgICAgICAgICAgICAgYXJlIGhhcmQgdG8g
aW1wb3NzaWJsZSB0byByZXNvbHZlIHdpdGhvdXQgYSBtZXNzLiBUaGVzZSBhbmQKICAgICAgICAg
ICAgICAgICAgICBwb3RlbnRpYWxseSBvdGhlciBjYXNlcyBydW4gdGhlIHJpc2sgb2YgbWlzY29t
cGlsYXRpb24oISkKICAgICAgICAgICAgICAgICAgICB3aXRoIGAtTzIvLU8zL09zYCB3aXRob3V0
IGV4cGxpY2l0IGAtZm5vLXN0cmljdC1hbGlhc2luZ2AuCiAgICAgICAgICAgICAgICAgICAgSGVu
Y2UgYC1mbm8tc3RyaWN0LWFsaWFzaW5nYCBpcyBicm91Z2h0IGJhY2sgdG8gYm90aCBidWlsZAog
ICAgICAgICAgICAgICAgICAgIHN5c3RlbXMgYW5kIGlzIHJlY29tbWVuZGVkIHRvIGV2ZXJ5b25l
IGVtYmVkZGluZyBsaWJleHBhdAogICAgICAgICAgICAgICAgICAgIGluIHBhcnRpY3VsYXIgKGJ1
dCBub3Qgb25seSkgdG8gYXZvaWQgc3VycHJpc2VzIGZyb20KICAgICAgICAgICAgICAgICAgICBw
b3RlbnRpYWwgbWlzY29tcGlsYXRpb24uIElmIGN1cmlvdXMsIGZvciB0aGUgMjAxNiBhcnRpY2xl
CiAgICAgICAgICAgICAgICAgICAgYnkgSm9obiBSZWdlaHIgdGhhdCBtb3RpdmF0ZWQgdGhpcyBt
b3ZlIHBsZWFzZSBzZWU6CiAgICAgICAgICAgICAgICAgICAgaHR0cHM6Ly9ibG9nLnJlZ2Voci5v
cmcvYXJjaGl2ZXMvMTMwNyAuCgogICAgICAgIEJ1ZyBmaXhlczoKICAgICAjMTQ2OSAjMTQ4NSAg
bGliOiBCZSByb2J1c3QgdG93YXJkcyBoYW5kbGVyIHJlc2V0CiAgICAgIzE0MzAgIzE0ODHigaAg
IGxpYjogRW5zdXJlIG5vbi1OVUxMIGBwYXJzZXItPm1fZXZlbnRQdHJgIGZvciBub24tZXJyb3Ig
Y2FsbHMKICAgICAgICAgICAgICAgICAgICB0byBgWE1MX1BhcnNlYCB3aXRoIGBYTUxfQ09OVEVY
VF9CWVRFUyA9PSAwYAogICAgICMxNDMwICMxNDkxICBsaWI6IEFkdmFuY2UgYG1fZXZlbnRQdHJg
IHRvIGBtX2J1ZmZlclB0cmAgd2hlbiBwb3NzaWJsZQogICAgICAgICAgICMxNTAxICBsaWI6IEVu
c3VyZSBoZWFsdGh5IGBtX2V2ZW50UHRyYCBhbmQgYG1fcG9zaXRpb25QdHJgIHBhaXJpbmcKICAg
ICAgICAgICAgICAgICAgICBhZnRlciBmaW5hbCBwYXJzZQogICAgICMxNTA1ICMxNTA2ICBsaWI6
IE1ha2UgYGV2ZW50UHRyYCBpbmRlcGVuZGVudCBpbiBpbml0aWFsIGVycm9yIHBhcnNlCiAgICAg
ICAgICAgIzE1MDcgIGxpYjogRml4IHRocmVlIG5hbWUgYW5kIG5hbWVzdGFydCBjaGFyYWN0ZXIg
ZmFsc2UgcG9zaXRpdmVzOgogICAgICAgICAgICAgICAgICAtIFUrMDBBQSg9MTcwKSAiZmVtaW5p
bmUgb3JkaW5hbCBpbmRpY2F0b3IiCiAgICAgICAgICAgICAgICAgIC0gVSswMEI1KD0xODEpICJt
aWNybyBzaWduIgogICAgICAgICAgICAgICAgICAtIFUrMDBCQSg9MTg2KSAibWFzY3VsaW5lIG9y
ZGluYWwgaW5kaWNhdG9yIgogICAgICAgICAgICMxNTE34oGgICBsaWI6IEluaXRpYWxpemUgYG1f
aWRBdHRJbmRleGAgaW4gYHBhcnNlckluaXRgCiAgICAgICAgICAgIzE0OTAgIHhtbHdmOiBSZWpl
Y3QgemVybyByZWFkIGJ1ZmZlciBzaXplCiAgICAgICAgICAgIzE1MDIgIHhtbHdmOiBDcmVhdGUg
ZmlsZXMgd2l0aCAwNjAwIHJhdGhlciB0aGFuIDA2NjYgbW9kZQogICAgICMxNTE0ICMxNTE4ICB4
bWx3ZjogUmVqZWN0IGVtcHR5LCBuZWdhdGl2ZSBhbmQgd2hpdGVzcGFjZS1zdGFydGluZyB2YWx1
ZXMKICAgICAgICAgICAgICAgICAgICBmb3IgY29tbWFuZCBsaW5lIGFyZ3VtZW50cyBgLWJgIGFu
ZCBgLWdgCgogICAgICAgIE5ldyBmZWF0dXJlczoKICAgICAgICAgICAjMTQ3NiAgbGliOiBBZGQg
bmV3IGBzaXplX3RgLWJhc2VkIHB1YmxpYyBwYXJzaW5nIGZ1bmN0aW9uczoKICAgICAgICAgICAg
ICAgICAgLSBYTUxfR2V0QnVmZmVyNjQKICAgICAgICAgICAgICAgICAgLSBYTUxfUGFyc2U2NAog
ICAgICAgICAgICAgICAgICAtIFhNTF9QYXJzZUJ1ZmZlcjY0CiAgICAgIzE0NzYgIzE1MDMgIGxp
YjogQWxsb3cgdG90YWwgYnVmZmVyIHNpemUgYmV5b25kIGBJTlRfTUFYYAogICAgICAgICAgICMx
NDU1ICBsaWI6IExldmVyYWdlIGluaXRpYWwgbm8tYnVmZmVyIHBhcnNlIHdpdGgKICAgICAgICAg
ICAgICAgICAgICBgWE1MX0NPTlRFWFRfQllURVMgPiAwYCBhcyB3ZWxsLi4uIHdoaWNoIHJlZHVj
ZXMgdGhlIG1lbW9yeQogICAgICAgICAgICAgICAgICAgIGZvb3RwcmludCBmb3IgdGhlIGZpcnN0
IHBhcnNpbmcgY2FsbCBwZXIgcGFyc2VyIGluc3RhbmNlCiAgICAgICAgICAgIzE0NzYgIHhtbHdm
OiBSYWlzZSBsaW1pdCBmb3IgYC1nIDxidWZmZXJzaXplPmAgZnJvbSBgSU5UX01BWC8yKzFgCiAg
ICAgICAgICAgICAgICAgICAgdG8gYElOVF9NQVhgCiMxNzEgIzE1MDfigaAgIzE1MjAgIGxpYjog
TWlncmF0ZSBmcm9tIFhNTCAxLjByNCB0byBYTUwgMS4wcjUgbmFtZSBjaGFyYWN0ZXIgc2V0CiAg
ICAgICAgICAgICAgICAgICAgZm9yIFVURi04IGFuZCBVVEYtMTYgKGJvdGggbGl0dGxlLSBhbmQg
YmlnLWVuZGlhbikuCiAgICAgICAgICAgICAgICAgICAgRXZlcnkgc2luZ2xlIGNvZGVwb2ludCBp
cyB0ZXN0ZWQgYnkgdGhlIHRlc3Qgc3VpdGUuCgogICAgICAgIE90aGVyIGNoYW5nZXM6CiAgIzE0
NjIgIzE0NjQgLi4KICAjMTQ2NSAjMTQ2NiAuLgogICMxNDc1ICMxNDc5IC4uCiAgICAgIzE0ODAg
IzE0ODcgIGxpYjogTWlncmF0ZSB0byBgc2l6ZV90YCBpbnRlcm5hbGx5CiAgICAgICAgICAgIzE0
NzEgIGxpYjogRW5mb3JjZSB0aGF0IGBYTUxfR2V0SW5wdXRDb250ZXh0KmAgY2FuIG9ubHkgYmUg
Y2FsbGVkCiAgICAgICAgICAgICAgICAgICAgZnJvbSB3aXRoaW4gaGFuZGxlcnMKICAgICAjMTQy
MiAjMTQ2OOKBoCAgbGliOiBEcm9wICJ1IiBzdWZmaXhlcyBmb3IgbGl0ZXJhbHMgdXNlZCBpbiBk
ZWJ1ZyBsZXZlbAogICAgICAgICAgICAgICAgICAgIGNvbXBhcmlzb25zCiAgICAgICAgICAgIzE0
NzIgIGxpYjogRXh0cmFjdCBmdW5jdGlvbiBgaW50ZXJuYWxHZXRCdWZmZXI2NGAKICAgICAgICAg
ICAjMTQ3MyAgbGliOiBSZXNvbHZlIHJlZHVuZGFudCBgZWxzZWAgbmVhciBgcGFyc2VyLT5tX2Vy
cm9yQ29kZQogICAgICAgICAgICAgICAgICAgICE9IFhNTF9FUlJPUl9OT05FYAogICAgICAgICAg
ICMxNDk2ICBsaWI6IEEgY291cGxlIG9mIGBsb29rdXBXaXRoTGVuZ3RoYCBzaW1wbGlmaWNhdGlv
bnMKICAgICAgICAgICAjMTQ3N+KBoCAgbGlifHhtbHdmOiBQYXNzIGBOVUxMYCBpbnN0ZWFkIG9m
IDAgZm9yIGEgcG9pbnRlcgogICAgICAgICAgICMxNDk3ICB4bWx3ZjogTWlncmF0ZSB0byBgc2l6
ZV90YCBpbnRlcm5hbGx5CiAgICAgICAgICAgIzE0ODnigaAgIHhtbHdmfGV4YW1wbGVzOiBJbmNy
ZWFzZSBidWZmZXIgc2l6ZSB0byAzMiBLaUIKICAgICAgICAgICAjMTQ4OCAgZXhhbXBsZXM6IE1p
Z3JhdGUgdG8gYHNpemVfdGAKICAgICAgICAgICAjMTQ4MyAgdGVzdHM6IERyb3AgbGVhZGluZyB1
bmRlcnNjb3JlIGZyb20gYF9YTUxfUGFyc2VfU0lOR0xFX0JZVEVTYAogICAgICAgICAgICAgICAg
ICAgIGJlY2F1c2UgaXQgaXMgZm9yYmlkZGVuIGJ5IEM5OQogICAgICAgICAgICMxNDkzICB0ZXN0
czogQ2hlY2sgZm9yIGxlYWtzIG9uIGFsbG9jYXRpb24tZmFpbHVyZSBjb2RlIHBhdGhzCiAgICAg
ICAgICAgICAgICAgICAgaW4gdGhlIGFic2VuY2Ugb2YgTGVha1Nhbml0aXplcgogICAgICAgICAg
ICMxNTA34oGgICB0ZXN0czogVXBncmFkZSBXM0MgWE1MIHRlc3Qgc3VpdGUgZnJvbSAyMDA4IHRv
IDIwMTMKICAgICAgICAgICAjMTUyMSAgdGVzdHM6IEFkZHJlc3MgaGFybWxlc3MgYG1lbXNldGAg
dHJ1bmNhdGlvbiB3YXJuaW5nCiAgICAgICAgICAgIzE1MDQgIEF1dG90b29sc3xtYWNPUzogU3lu
YyBtYWNPUyBDTWFrZSB0ZW1wbGF0ZXMgd2l0aCBDTWFrZSA0LjUuMAogICAgICAgICAgICMxNTEy
4oGgICBBdXRvdG9vbHN8Q01ha2U6IEludGVncmF0ZSBnZW5ubXRhYi5jIHdpdGggYm90aCBidWls
ZCBzeXN0ZW1zCiAgICAgIzE0NzAgIzE0OTQgIFZlcnNpb24gaW5mbyBidW1wZWQgZnJvbSAxNDox
OjEzIChsaWJleHBhdCouc28uMS4xMy4xKQogICAgICAgICAgICAgICAgICAgIHRvIDE1OjA6MTQg
KGxpYmV4cGF0Ki5zby4xLjE0LjApOyBzZWUgaHR0cHM6Ly92ZXJidW1wLmRlLwogICAgICAgICAg
ICAgICAgICAgIGZvciB3aGF0IHRoZXNlIG51bWJlcnMgZG8KCiAgICAgICAgSW5mcmFzdHJ1Y3R1
cmU6CiAgICAgICAgICAgIzE0ODQgIENJOiBGaXggcnVubmVyIGltYWdlIHR5cG8gIm1hY29TLTI2
IiBpbiBgYXV0b3Rvb2xzLWNtYWtlLnltbGAKICAgICAgICAgICAjMTQ4NiAgQ0k6IEJ1bXAgTWlu
R1cgQ2xhbmcgZnJvbSAyMy4xLjQgdG8gMjMuMS41CiAgICAgICAgICAgIzE1MTEgIENJOiBHZXQg
cmlkIG9mIFBvd2VyU2hlbGwgKGluIGZhdm9yIG9mIEJhc2gpCiAgICAgICAgICAgIzE1MTPigaAg
IENJOiBWYWxpZGF0ZSBkb3dubG9hZHMgaW4gV2luZG93cyBiaW5hcmllcyBDSQogICAgICAgICAg
ICMxNTE1ICBDSTogQnVtcCBJbm5vIFNldHVwIHRvIDcuMS4xIHdpdGggV2luZG93cyBiaW5hcmll
cyBDSQogICAgICAgICAgICMxNTE24oGgICBDSTogQnVtcCBDbGFuZy1iYXNlZCBNaW5HVyB0byAy
MDI2MTExNyB3aXRoIENsYW5nIDIzLjEuNgoKICAgICAgICBTcGVjaWFsIHRoYW5rcyB0bzoKICAg
ICAgICAgICAgQXppeiBFbGJlbGF5Y2h5CiAgICAgICAgICAgIEJhc2hlZXIgQWwtSmFycmFoCiAg
ICAgICAgICAgIEJlcmtheSBFcmVuIMOccsO8bgogICAgICAgICAgICBDYW1lcm9uIFNwYXJrcwog
ICAgICAgICAgICBIdWFuZyBXZW5iaW4KICAgICAgICAgICAgSW9uIFRlcmVzaGVua28KICAgICAg
ICAgICAgSm9obiBSZWdlaHIKICAgICAgICAgICAgTWF0dGhldyBGZXJuYW5kZXoKICAgICAgICAg
ICAgT8SfdXpoYW4gRGVtaXJiYcWfCiAgICAgICAgICAgIFBhc2NhbCBDdW9xCiAgICAgICAgICAg
IFB1IENoZW5nCiAgICAgICAgICAgIFJ5YW4gVmFuZGVyTWV1bGVuCiAgICAgICAgICAgIFNjb3R0
IE1vb3JlCiAgICAgICAgICAgIFN0ZXZlbiBCdXNoCiAgICAgICAgICAgIFRzdWtpa28gSGFrdXJh
CiAgICAgICAgICAgIFdlaS1MdW4gTGkKICAgICAgICAgICAgICAgICBhbmQKICAgICAgICAgICAg
Q2l0eSBvZiBNdW5pY2ggT3BlbiBTb3VyY2UgU2FiYmF0aWNhbAogICAgICAgICAgICBPU1MtRnV6
eiAvIENsdXN0ZXJGdXp6CiAgICAgICAgICAgIE9zdG9ybGFiCiAgICAgICAgICAgIFNpZW1lbnMK
ICAgICAgICAgICAgVHJ1c3RJblNvZnQKICAgICAgICAgICAgVnVsbkNoZWNrCgogICAgICAjOTY3
ICMxMzU0ICBsaWI6IFJlamVjdCBhbiBYTUwgZGVjbGFyYXRpb24gdmVyc2lvbiBvdGhlciB0aGFu
IGAxLlswLTldK2AKICAgICAgICAgICAgICAgICAgICBwcmUtZXJyYXRhIGFuZCBtYXRjaGVzIFhN
TCAxLjByNSAoZmlmdGggZWRpdGlvbikpCiAgICAgICAgICAgIFRydXN0SW5Tb2Z0CiAgICAgICAg
ICAgIFRydXN0SW5Tb2Z0CiAgICAgICAgICAgICAgICAgYW5kCiAgICAgICAgICAgIFRydXN0SW5T
b2Z0Cg==

--===============2719345190268848235==--
