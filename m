Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1612.1793425335819300562
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 22:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Os3dDPhA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=R9YUkuR3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a1907ae1c3-5fc629b4-6a52-4642-9d0f-3e4db3d1a738-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793425334;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=TgOwaUHHZEaHwgdRDug3lu+3ABB/3d7l2PxXIL2qfFc=;
	b=Os3dDPhAi1rWIVxaKdzZ22PHpqdlx2BdWsR9SdOZ/R3hKw9akPtthXUHMI/s8t7Q
	xwS5HItjddS8BOHYqLAGJi1b5HNdG49LuHTe26qbsT1kQuDD2M8sEQ4gcuw5EVzBTht
	xKw9eGJ4LWsfbH5DLqRFRpHQ5OvCRo5KqRhP3qDU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793425334;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=TgOwaUHHZEaHwgdRDug3lu+3ABB/3d7l2PxXIL2qfFc=;
	b=R9YUkuR3k4rafAkIJAYwaAcUGrIvurNaeQy18xXarAwoB3lQWrea533iafPCXgYF
	c0YTFpqCplr1CJAvBhhZoWWjVDRCeGWa7eWcabs3MxM2QFQSirumxaS3X/tJtkSNap1
	5TvAt0ENXeBu1ofql+724Pt9Z40Mr/Yf8fayJi3M=
Content-Type: multipart/mixed; boundary="===============8109220680156685013=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] mtools: upgrading to 4.0.50 SUCCEEDED
Message-ID: <010101a1907ae1c3-5fc629b4-6a52-4642-9d0f-3e4db3d1a738-000000@us-west-2.amazonses.com>
Date: Sat, 31 Oct 2026 05:42:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.31-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 05:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249133

--===============8109220680156685013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mtools* to *4.0.50* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mtools-upgrade-4.0.49-4.0.50.patch
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
From eddd1424c4742da009ff7db49cb2b8dd5d7c702f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 31 Oct 2026 05:12:14 +0000
Subject: [PATCH] mtools: upgrade 4.0.49 -> 4.0.50

mtools (4.0.50) stable; urgency=low
 -- Alain Knaff <alain@knaff.lu>  Fri, 30 Oct 2026 00:05:25 +0100
---
 meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch      | 2 +-
 .../mtools/mtools/disable-hardcoded-configs.patch           | 2 +-
 meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch   | 6 +++---
 .../mtools/{mtools_4.0.49.bb => mtools_4.0.50.bb}           | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.49.bb => mtools_4.0.50.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
index ddf3706f51..3b975d5c40 100644
--- a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
+++ b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
@@ -1,4 +1,4 @@
-From 6914c6e15cd15daf1dae81458e5346958c9d5449 Mon Sep 17 00:00:00 2001
+From 1e420800695fce8af0f2c93d3485646d0f50e93a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 19 Sep 2018 11:55:41 -0700
 Subject: [PATCH] Undefine UNUSED macros with clang
diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 63992ac547..2220295f84 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From 16969d42ec6514883bcee87cc89b3e7864481d7e Mon Sep 17 00:00:00 2001
+From 8b7a818762eb2d87428e0e1dfe439456cc3e6e85 Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
diff --git a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
index fb7ba56eec..682341af2b 100644
--- a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
+++ b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
@@ -1,4 +1,4 @@
-From b517158e8ffc6a665506007b20708d6c2589cec1 Mon Sep 17 00:00:00 2001
+From f487cd37a3fce9b2829e62f29347a06c75677a2e Mon Sep 17 00:00:00 2001
 From: Marcin Juszkiewicz <hrw@openedhand.com>
 Date: Fri, 8 Jun 2007 08:35:12 +0000
 Subject: [PATCH] mtools: imported from OE
@@ -10,7 +10,7 @@ Upstream-Status: Inappropriate [licensing]
  2 files changed, 33 insertions(+), 5 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 7b305b0..70c8c74 100644
+index d9cc6e3..1f8d93f 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -26,10 +26,11 @@ USERCFLAGS =
@@ -39,7 +39,7 @@ index 7b305b0..70c8c74 100644
  pdf: mtools.pdf
  %.pdf: %.texi sysconfdir.texi
 diff --git a/configure.ac b/configure.ac
-index 37f0d00..c93cfb5 100644
+index fa73f7b..c42a232 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -36,6 +36,33 @@ AC_PATH_PROG(INSTALL_INFO, install-info, "")
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.49.bb b/meta/recipes-devtools/mtools/mtools_4.0.50.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.49.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.50.bb
index 294b2f37b2..0e3b754f1d 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.49.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.50.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "6fe5193583d6e7c59da75e63d7234f76c0b07caf33b103894f46f66a871ffc9f"
+SRC_URI[sha256sum] = "f3a58e6cfc2634b03c240442548e3b00103692357afc28e1e7104744dd6478b5"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.47.1


--===============8109220680156685013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mtools: PKGV changed from 4.0.49 [default] to 4.0.50 [default]
packages/x86-64-v3-poky-linux/mtools: SRC_URI changed from "https://ftpmirror.gnu.org//mtools/mtools-4.0.49.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch" to "https://ftpmirror.gnu.org//mtools/mtools-4.0.50.tar.bz2 file://mtools-makeinfo.patch file://clang_UNUSED.patch"
packages/x86-64-v3-poky-linux/mtools: PV changed from "4.0.49" to "4.0.50"
packages/x86-64-v3-poky-linux/mtools/mtools-dbg: PKGV changed from 4.0.49 [default] to 4.0.50 [default]
packages/x86-64-v3-poky-linux/mtools/mtools-dbg: PV changed from "4.0.49" to "4.0.50"
packages/x86-64-v3-poky-linux/mtools/mtools-dbg: PKGSIZE changed from 892472 to 892456 (-0%)
packages/x86-64-v3-poky-linux/mtools/mtools-dev: PKGV changed from 4.0.49 [default] to 4.0.50 [default]
packages/x86-64-v3-poky-linux/mtools/mtools-dev: PV changed from "4.0.49" to "4.0.50"
packages/x86-64-v3-poky-linux/mtools/mtools-doc: PKGV changed from 4.0.49 [default] to 4.0.50 [default]
packages/x86-64-v3-poky-linux/mtools/mtools-doc: PV changed from "4.0.49" to "4.0.50"
packages/x86-64-v3-poky-linux/mtools/mtools-doc: PKGSIZE changed from 210229 to 212776 (+1%)
packages/x86-64-v3-poky-linux/mtools/mtools-locale: PKGV changed from 4.0.49 [default] to 4.0.50 [default]
packages/x86-64-v3-poky-linux/mtools/mtools-locale: PV changed from "4.0.49" to "4.0.50"
packages/x86-64-v3-poky-linux/mtools/mtools-src: FILELIST: directory renamed /usr/src/debug/mtools/4.0.49 -> /usr/src/debug/mtools/4.0.50
packages/x86-64-v3-poky-linux/mtools/mtools-src: PKGV changed from 4.0.49 [default] to 4.0.50 [default]
packages/x86-64-v3-poky-linux/mtools/mtools-src: PV changed from "4.0.49" to "4.0.50"
packages/x86-64-v3-poky-linux/mtools/mtools-src: PKGSIZE changed from 606515 to 606528 (+0%)
packages/x86-64-v3-poky-linux/mtools/mtools-staticdev: PKGV changed from 4.0.49 [default] to 4.0.50 [default]
packages/x86-64-v3-poky-linux/mtools/mtools-staticdev: PV changed from "4.0.49" to "4.0.50"
packages/x86-64-v3-poky-linux/mtools/mtools: PKGV changed from 4.0.49 [default] to 4.0.50 [default]
packages/x86-64-v3-poky-linux/mtools/mtools: PV changed from "4.0.49" to "4.0.50"

--===============8109220680156685013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="mtools-changelog.txt"

mtools (4.0.50) stable; urgency=low
 -- Alain Knaff <alain@knaff.lu>  Fri, 30 Oct 2026 00:05:25 +0100

--===============8109220680156685013==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mtools-upgrade-4.0.49-4.0.50.patch"

RnJvbSBlZGRkMTQyNGM0NzQyZGEwMDlmZjdkYjQ5Y2IyYjhkZDVkN2M3MDJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMzEgT2N0IDIwMjYgMDU6MTI6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
dG9vbHM6IHVwZ3JhZGUgNC4wLjQ5IC0+IDQuMC41MAoKbXRvb2xzICg0LjAuNTApIHN0YWJsZTsg
dXJnZW5jeT1sb3cKIC0tIEFsYWluIEtuYWZmIDxhbGFpbkBrbmFmZi5sdT4gIEZyaSwgMzAgT2N0
IDIwMjYgMDA6MDU6MjUgKzAxMDAKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210
b29scy9jbGFuZ19VTlVTRUQucGF0Y2ggICAgICB8IDIgKy0KIC4uLi9tdG9vbHMvbXRvb2xzL2Rp
c2FibGUtaGFyZGNvZGVkLWNvbmZpZ3MucGF0Y2ggICAgICAgICAgIHwgMiArLQogbWV0YS9yZWNp
cGVzLWRldnRvb2xzL210b29scy9tdG9vbHMvbXRvb2xzLW1ha2VpbmZvLnBhdGNoICAgfCA2ICsr
Ky0tLQogLi4uL210b29scy97bXRvb2xzXzQuMC40OS5iYiA9PiBtdG9vbHNfNC4wLjUwLmJifSAg
ICAgICAgICAgfCAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL3ttdG9vbHNfNC4w
LjQ5LmJiID0+IG10b29sc180LjAuNTAuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL210b29scy9tdG9vbHMvY2xhbmdfVU5VU0VELnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL210b29scy9tdG9vbHMvY2xhbmdfVU5VU0VELnBhdGNoCmluZGV4IGRkZjM3
MDZmNTEuLjNiOTc1ZDVjNDAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9v
bHMvbXRvb2xzL2NsYW5nX1VOVVNFRC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bXRvb2xzL210b29scy9jbGFuZ19VTlVTRUQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDY5
MTRjNmUxNWNkMTVkYWYxZGFlODE0NThlNTM0Njk1OGM5ZDU0NDkgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDFlNDIwODAwNjk1ZmNlOGFmMGYyYzkzZDM0ODU2NDZkMGY1MGU5M2EgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29t
PgogRGF0ZTogV2VkLCAxOSBTZXAgMjAxOCAxMTo1NTo0MSAtMDcwMAogU3ViamVjdDogW1BBVENI
XSBVbmRlZmluZSBVTlVTRUQgbWFjcm9zIHdpdGggY2xhbmcKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL2Rpc2FibGUtaGFyZGNvZGVkLWNvbmZpZ3MucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29scy9kaXNhYmxlLWhhcmRjb2Rl
ZC1jb25maWdzLnBhdGNoCmluZGV4IDYzOTkyYWM1NDcuLjIyMjAyOTVmODQgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL2Rpc2FibGUtaGFyZGNvZGVkLWNv
bmZpZ3MucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHMvZGlz
YWJsZS1oYXJkY29kZWQtY29uZmlncy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMTY5Njlk
NDJlYzY1MTQ4ODNiY2VlODdjYzg5YjNlNzg2NDQ4MWQ3ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gOGI3YTgxODc2MmViMmQ4NzQyOGUwZTFkZmU0Mzk0NTZjYzNlNmU4NSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEVkIEJhcnRvc2ggPGVkLmJhcnRvc2hAbGludXguaW50
ZWwuY29tPgogRGF0ZTogVHVlLCAxMyBKdW4gMjAxNyAxNDo1NTo1MiArMDMwMAogU3ViamVjdDog
W1BBVENIXSBEaXNhYmxlZCByZWFkaW5nIGhvc3QgY29uZmlncy4KZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL210b29scy1tYWtlaW5mby5wYXRjaCBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzL210b29scy1tYWtlaW5mby5wYXRjaApp
bmRleCBmYjdiYTU2ZWVjLi42ODIzNDFhZjJiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvbXRvb2xzL210b29scy9tdG9vbHMtbWFrZWluZm8ucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL210b29scy9tdG9vbHMvbXRvb2xzLW1ha2VpbmZvLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBiNTE3MTU4ZThmZmM2YTY2NTUwNjAwN2IyMDcwOGQ2YzI1ODljZWMxIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmNDg3Y2QzN2EzZmNlOWIyODI5ZTYyZjI5MzQ3
YTA2Yzc1Njc3YTJlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWFyY2luIEp1c3pr
aWV3aWN6IDxocndAb3BlbmVkaGFuZC5jb20+CiBEYXRlOiBGcmksIDggSnVuIDIwMDcgMDg6MzU6
MTIgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gbXRvb2xzOiBpbXBvcnRlZCBmcm9tIE9FCkBAIC0x
MCw3ICsxMCw3IEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbbGljZW5zaW5nXQog
IDIgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKIAogZGlm
ZiAtLWdpdCBhL01ha2VmaWxlLmluIGIvTWFrZWZpbGUuaW4KLWluZGV4IDdiMzA1YjAuLjcwYzhj
NzQgMTAwNjQ0CitpbmRleCBkOWNjNmUzLi4xZjhkOTNmIDEwMDY0NAogLS0tIGEvTWFrZWZpbGUu
aW4KICsrKyBiL01ha2VmaWxlLmluCiBAQCAtMjYsMTAgKzI2LDExIEBAIFVTRVJDRkxBR1MgPQpA
QCAtMzksNyArMzksNyBAQCBpbmRleCA3YjMwNWIwLi43MGM4Yzc0IDEwMDY0NAogIHBkZjogbXRv
b2xzLnBkZgogICUucGRmOiAlLnRleGkgc3lzY29uZmRpci50ZXhpCiBkaWZmIC0tZ2l0IGEvY29u
ZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCAzN2YwZDAwLi5jOTNjZmI1IDEwMDY0NAor
aW5kZXggZmE3M2Y3Yi4uYzQyYTIzMiAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIv
Y29uZmlndXJlLmFjCiBAQCAtMzYsNiArMzYsMzMgQEAgQUNfUEFUSF9QUk9HKElOU1RBTExfSU5G
TywgaW5zdGFsbC1pbmZvLCAiIikKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9t
dG9vbHMvbXRvb2xzXzQuMC40OS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tdG9vbHMvbXRv
b2xzXzQuMC41MC5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbXRvb2xzL210b29sc180LjAuNDkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9tdG9vbHMvbXRvb2xzXzQuMC41MC5iYgppbmRleCAyOTRiMmYzN2IyLi4wZTNi
NzU0ZjFkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbXRvb2xzL210b29sc180
LjAuNDkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL210b29scy9tdG9vbHNfNC4wLjUw
LmJiCkBAIC0yNCw3ICsyNCw3IEBAIFJSRUNPTU1FTkRTOiR7UE59OmxpYmMtZ2xpYmMgPSAiXAog
CWdsaWJjLWdjb252LWlibTg2NiBcCiAJZ2xpYmMtZ2NvbnYtaWJtODY5IFwKIAkiCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNmZlNTE5MzU4M2Q2ZTdjNTlkYTc1ZTYzZDcyMzRmNzZjMGIwN2NhZjMz
YjEwMzg5NGY0NmY2NmE4NzFmZmM5ZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmM2E1OGU2Y2Zj
MjYzNGIwM2MyNDA0NDI1NDhlM2IwMDEwMzY5MjM1N2FmYzI4ZTFlNzEwNDc0NGRkNjQ3OGI1Igog
CiBTUkNfVVJJID0gIiR7R05VX01JUlJPUn0vbXRvb2xzL210b29scy0ke1BWfS50YXIuYnoyIFwK
ICAgICAgICAgICAgZmlsZTovL210b29scy1tYWtlaW5mby5wYXRjaCBcCi0tIAoyLjQ3LjEKCg==

--===============8109220680156685013==--
