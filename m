Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60FEBCA5FC1
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 06:22:39 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1163.1791008549765439734
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 23:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Ts5/BCNz;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HZ7c15iD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a1006da796-758bc284-7c22-4dfb-beeb-7a85c2beb726-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791008548;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=8ZoQLG1SVKkihKIGyzEleYF00mtCJVws7zluoHx/vu8=;
	b=Ts5/BCNzdb0zg/g82+PfhMDPdRvOcIvMUh+CRloGLonPDrZmXqnsH0c+fl1d90pp
	wOpB8ezCdmPMxmK3S8Sc3hIsI4EwDClFmVqSzvDpnQlcWnOk6VC2EAbfVZrIBi2z830
	u8Gw/Fcy3UTDwknGEZEkWwE/xOSJ3cxDDxMlh7ZQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791008548;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=8ZoQLG1SVKkihKIGyzEleYF00mtCJVws7zluoHx/vu8=;
	b=HZ7c15iDRZWsguMmkZyNwAWZ3yORT4ONQYyWCfUFSaBPjovFa3p7jHOsWJtPxcl1
	MvdEm9fX+hGuThFF+homUnjati0O5yjTLjQsEodrjghO+i6ooLEhcnfjD4mgezzsaCo
	uAapirlMoeM/+fdPWgiyXFOWN0MR9HZXjk9i06pI=
Content-Type: multipart/mixed; boundary="===============7520048393416203661=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libpng: upgrading to 1.6.59 SUCCEEDED
Message-ID: <010101a1006da796-758bc284-7c22-4dfb-beeb-7a85c2beb726-000000@us-west-2.amazonses.com>
Date: Sat, 3 Oct 2026 06:22:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.03-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 06:22:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247146

--===============7520048393416203661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libpng* to *1.6.59* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpng-upgrade-1.6.58-1.6.59.patch
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
From 083c6a33018a5a34bb398a04cb673056dec99f0c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 3 Oct 2026 05:43:30 +0000
Subject: [PATCH] libpng: upgrade 1.6.58 -> 1.6.59

Version 1.6.59 [September 28, 2026]
  Fixed CVE-2026-46675 (medium severity):
    Use-after-free of zlib input in `png_read_end` after incomplete zTXt, iTXt
    or iCCP decompression.
    (Reported independently by Ze Sheng and
    <JasonHonKL@users.noreply.github.com>.)
  Fixed a regression introduced in version 1.6.47 that caused libpng to reject
    hIST chunks in their correct position, after PLTE.
    (Contributed by Yuki Sekiguchi.)
  Prevented a double free of `png_struct` members after an allocation failure.
    (Contributed by Anthony Hurtado.)
  Applied fixes and updates to the CMake build.
  Adopted the REUSE Specification for licensing the CI files.
---
 ...0001-tests-stream-per-test-results-to-stdout.patch | 11 ++++-------
 .../libpng/{libpng_1.6.58.bb => libpng_1.6.59.bb}     |  2 +-
 2 files changed, 5 insertions(+), 8 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.58.bb => libpng_1.6.59.bb} (97%)

diff --git a/meta/recipes-multimedia/libpng/files/0001-tests-stream-per-test-results-to-stdout.patch b/meta/recipes-multimedia/libpng/files/0001-tests-stream-per-test-results-to-stdout.patch
index 139495d211..0c5e742bc1 100644
--- a/meta/recipes-multimedia/libpng/files/0001-tests-stream-per-test-results-to-stdout.patch
+++ b/meta/recipes-multimedia/libpng/files/0001-tests-stream-per-test-results-to-stdout.patch
@@ -1,4 +1,4 @@
-From e0898e243cbef677a862612f04b6bca2b07c2453 Mon Sep 17 00:00:00 2001
+From 22ec13788d1003de4b4f89eaaf47f28fe61523b2 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Wed, 12 Aug 2026 12:22:54 -0400
 Subject: [PATCH] tests: stream per-test results to stdout
@@ -34,7 +34,7 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  create mode 100755 test-driver-tee
 
 diff --git a/Makefile.am b/Makefile.am
-index eb7078158..a2e64fbe6 100644
+index fa5bbeb..8092616 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -111,6 +111,12 @@ TESTS =\
@@ -50,7 +50,7 @@ index eb7078158..a2e64fbe6 100644
  endif
  
  # man pages
-@@ -165,7 +171,7 @@ pkgconfig_DATA = libpng@PNGLIB_MAJOR@@PNGLIB_MINOR@.pc
+@@ -216,7 +222,7 @@ pkgconfig_DATA = libpng@PNGLIB_MAJOR@@PNGLIB_MINOR@.pc
  # not done in the source directory!
  EXTRA_DIST= \
  	ANNOUNCE AUTHORS CHANGES INSTALL LICENSE README TODO TRADEMARK \
@@ -61,7 +61,7 @@ index eb7078158..a2e64fbe6 100644
  	CMakeLists.txt example.c libpng-manual.txt
 diff --git a/test-driver-tee b/test-driver-tee
 new file mode 100755
-index 000000000..a6d5aa027
+index 0000000..a6d5aa0
 --- /dev/null
 +++ b/test-driver-tee
 @@ -0,0 +1,167 @@
@@ -232,6 +232,3 @@ index 000000000..a6d5aa027
 +# time-stamp-time-zone: "UTC0"
 +# time-stamp-end: "; # UTC"
 +# End:
--- 
-2.55.0
-
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.58.bb b/meta/recipes-multimedia/libpng/libpng_1.6.59.bb
similarity index 97%
rename from meta/recipes-multimedia/libpng/libpng_1.6.58.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.59.bb
index 928b010c9c..4dbd769cf7 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.59.bb
@@ -15,7 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://0001-tests-stream-per-test-results-to-stdout.patch \
 "
 
-SRC_URI[sha256sum] = "28eb403f51f0f7405249132cecfe82ea5c0ef97f1b32c5a65828814ae0d34775"
+SRC_URI[sha256sum] = "d80dd2a38a37f803cb9b6ac7b14bd6e74ddc3b654780a8380bdf93523fdb4389"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 
-- 
2.47.1


--===============7520048393416203661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libpng/libpng-ptest: FILELIST: added "/usr/lib/libpng/ptest/src/contrib/testpngs/ch1n3p04.png /usr/lib/libpng/ptest/src/contrib/testpngs/ch2n3p08.png"
packages/x86-64-v3-poky-linux/libpng/libpng: FILELIST: removed "/usr/lib/libpng16.so.16.58.0", added "/usr/lib/libpng16.so.16.59.0"
Changes to packages/x86-64-v3-poky-linux/libpng (sysroot):
  /usr/lib/libpng16.so.16 changed symlink target from libpng16.so.16.58.0 to libpng16.so.16.59.0
  /usr/lib/libpng16.so changed symlink target from libpng16.so.16.58.0 to libpng16.so.16.59.0
  /usr/lib/libpng16.so.16.58.0 moved to /usr/lib/libpng16.so.16.59.0

--===============7520048393416203661==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpng-upgrade-1.6.58-1.6.59.patch"

RnJvbSAwODNjNmEzMzAxOGE1YTM0YmIzOThhMDRjYjY3MzA1NmRlYzk5ZjBjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMyBPY3QgMjAyNiAwNTo0MzozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnBuZzogdXBncmFkZSAxLjYuNTggLT4gMS42LjU5CgpWZXJzaW9uIDEuNi41OSBbU2VwdGVtYmVy
IDI4LCAyMDI2XQogIEZpeGVkIENWRS0yMDI2LTQ2Njc1IChtZWRpdW0gc2V2ZXJpdHkpOgogICAg
VXNlLWFmdGVyLWZyZWUgb2YgemxpYiBpbnB1dCBpbiBgcG5nX3JlYWRfZW5kYCBhZnRlciBpbmNv
bXBsZXRlIHpUWHQsIGlUWHQKICAgIG9yIGlDQ1AgZGVjb21wcmVzc2lvbi4KICAgIChSZXBvcnRl
ZCBpbmRlcGVuZGVudGx5IGJ5IFplIFNoZW5nIGFuZAogICAgPEphc29uSG9uS0xAdXNlcnMubm9y
ZXBseS5naXRodWIuY29tPi4pCiAgRml4ZWQgYSByZWdyZXNzaW9uIGludHJvZHVjZWQgaW4gdmVy
c2lvbiAxLjYuNDcgdGhhdCBjYXVzZWQgbGlicG5nIHRvIHJlamVjdAogICAgaElTVCBjaHVua3Mg
aW4gdGhlaXIgY29ycmVjdCBwb3NpdGlvbiwgYWZ0ZXIgUExURS4KICAgIChDb250cmlidXRlZCBi
eSBZdWtpIFNla2lndWNoaS4pCiAgUHJldmVudGVkIGEgZG91YmxlIGZyZWUgb2YgYHBuZ19zdHJ1
Y3RgIG1lbWJlcnMgYWZ0ZXIgYW4gYWxsb2NhdGlvbiBmYWlsdXJlLgogICAgKENvbnRyaWJ1dGVk
IGJ5IEFudGhvbnkgSHVydGFkby4pCiAgQXBwbGllZCBmaXhlcyBhbmQgdXBkYXRlcyB0byB0aGUg
Q01ha2UgYnVpbGQuCiAgQWRvcHRlZCB0aGUgUkVVU0UgU3BlY2lmaWNhdGlvbiBmb3IgbGljZW5z
aW5nIHRoZSBDSSBmaWxlcy4KLS0tCiAuLi4wMDAxLXRlc3RzLXN0cmVhbS1wZXItdGVzdC1yZXN1
bHRzLXRvLXN0ZG91dC5wYXRjaCB8IDExICsrKystLS0tLS0tCiAuLi4vbGlicG5nL3tsaWJwbmdf
MS42LjU4LmJiID0+IGxpYnBuZ18xLjYuNTkuYmJ9ICAgICB8ICAyICstCiAyIGZpbGVzIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9saWJwbmcve2xpYnBuZ18xLjYuNTguYmIgPT4gbGlicG5nXzEuNi41OS5iYn0g
KDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJwbmcvZmlsZXMv
MDAwMS10ZXN0cy1zdHJlYW0tcGVyLXRlc3QtcmVzdWx0cy10by1zdGRvdXQucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9saWJwbmcvZmlsZXMvMDAwMS10ZXN0cy1zdHJlYW0tcGVyLXRl
c3QtcmVzdWx0cy10by1zdGRvdXQucGF0Y2gKaW5kZXggMTM5NDk1ZDIxMS4uMGM1ZTc0MmJjMSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvbGlicG5nL2ZpbGVzLzAwMDEtdGVz
dHMtc3RyZWFtLXBlci10ZXN0LXJlc3VsdHMtdG8tc3Rkb3V0LnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2xpYnBuZy9maWxlcy8wMDAxLXRlc3RzLXN0cmVhbS1wZXItdGVzdC1y
ZXN1bHRzLXRvLXN0ZG91dC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTA4OThlMjQzY2Jl
ZjY3N2E4NjI2MTJmMDRiNmJjYTJiMDdjMjQ1MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gMjJlYzEzNzg4ZDEwMDNkZTRiNGY4OWVhYWY0N2YyOGZlNjE1MjNiMiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IFRyZXZvciBHYW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+
CiBEYXRlOiBXZWQsIDEyIEF1ZyAyMDI2IDEyOjIyOjU0IC0wNDAwCiBTdWJqZWN0OiBbUEFUQ0hd
IHRlc3RzOiBzdHJlYW0gcGVyLXRlc3QgcmVzdWx0cyB0byBzdGRvdXQKQEAgLTM0LDcgKzM0LDcg
QEAgU2lnbmVkLW9mZi1ieTogVHJldm9yIEdhbWJsaW4gPHRnYW1ibGluQGJheWxpYnJlLmNvbT4K
ICBjcmVhdGUgbW9kZSAxMDA3NTUgdGVzdC1kcml2ZXItdGVlCiAKIGRpZmYgLS1naXQgYS9NYWtl
ZmlsZS5hbSBiL01ha2VmaWxlLmFtCi1pbmRleCBlYjcwNzgxNTguLmEyZTY0ZmJlNiAxMDA2NDQK
K2luZGV4IGZhNWJiZWIuLjgwOTI2MTYgMTAwNjQ0CiAtLS0gYS9NYWtlZmlsZS5hbQogKysrIGIv
TWFrZWZpbGUuYW0KIEBAIC0xMTEsNiArMTExLDEyIEBAIFRFU1RTID1cCkBAIC01MCw3ICs1MCw3
IEBAIGluZGV4IGViNzA3ODE1OC4uYTJlNjRmYmU2IDEwMDY0NAogIGVuZGlmCiAgCiAgIyBtYW4g
cGFnZXMKLUBAIC0xNjUsNyArMTcxLDcgQEAgcGtnY29uZmlnX0RBVEEgPSBsaWJwbmdAUE5HTElC
X01BSk9SQEBQTkdMSUJfTUlOT1JALnBjCitAQCAtMjE2LDcgKzIyMiw3IEBAIHBrZ2NvbmZpZ19E
QVRBID0gbGlicG5nQFBOR0xJQl9NQUpPUkBAUE5HTElCX01JTk9SQC5wYwogICMgbm90IGRvbmUg
aW4gdGhlIHNvdXJjZSBkaXJlY3RvcnkhCiAgRVhUUkFfRElTVD0gXAogIAlBTk5PVU5DRSBBVVRI
T1JTIENIQU5HRVMgSU5TVEFMTCBMSUNFTlNFIFJFQURNRSBUT0RPIFRSQURFTUFSSyBcCkBAIC02
MSw3ICs2MSw3IEBAIGluZGV4IGViNzA3ODE1OC4uYTJlNjRmYmU2IDEwMDY0NAogIAlDTWFrZUxp
c3RzLnR4dCBleGFtcGxlLmMgbGlicG5nLW1hbnVhbC50eHQKIGRpZmYgLS1naXQgYS90ZXN0LWRy
aXZlci10ZWUgYi90ZXN0LWRyaXZlci10ZWUKIG5ldyBmaWxlIG1vZGUgMTAwNzU1Ci1pbmRleCAw
MDAwMDAwMDAuLmE2ZDVhYTAyNworaW5kZXggMDAwMDAwMC4uYTZkNWFhMAogLS0tIC9kZXYvbnVs
bAogKysrIGIvdGVzdC1kcml2ZXItdGVlCiBAQCAtMCwwICsxLDE2NyBAQApAQCAtMjMyLDYgKzIz
MiwzIEBAIGluZGV4IDAwMDAwMDAwMC4uYTZkNWFhMDI3CiArIyB0aW1lLXN0YW1wLXRpbWUtem9u
ZTogIlVUQzAiCiArIyB0aW1lLXN0YW1wLWVuZDogIjsgIyBVVEMiCiArIyBFbmQ6Ci0tLSAKLTIu
NTUuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJwbmcvbGlicG5n
XzEuNi41OC5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBuZy9saWJwbmdfMS42LjU5
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2xpYnBuZy9saWJwbmdfMS42LjU4LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS9saWJwbmcvbGlicG5nXzEuNi41OS5iYgppbmRleCA5MjhiMDEwYzljLi40ZGJkNzY5Y2Y3
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJwbmcvbGlicG5nXzEuNi41
OC5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJwbmcvbGlicG5nXzEuNi41OS5i
YgpAQCAtMTUsNyArMTUsNyBAQCBTUkNfVVJJID0gIiR7U09VUkNFRk9SR0VfTUlSUk9SfS8ke0JQ
Tn0vJHtCUE59JHtMSUJWfS8ke0JQfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS10
ZXN0cy1zdHJlYW0tcGVyLXRlc3QtcmVzdWx0cy10by1zdGRvdXQucGF0Y2ggXAogIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiMjhlYjQwM2Y1MWYwZjc0MDUyNDkxMzJjZWNmZTgyZWE1YzBlZjk3
ZjFiMzJjNWE2NTgyODgxNGFlMGQzNDc3NSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkODBkZDJh
MzhhMzdmODAzY2I5YjZhYzdiMTRiZDZlNzRkZGMzYjY1NDc4MGE4MzgwYmRmOTM1MjNmZGI0Mzg5
IgogCiBNSVJST1JTICs9ICIke1NPVVJDRUZPUkdFX01JUlJPUn0vcHJvamVjdC8ke0JQTn0vJHtC
UE59JHtMSUJWfS8gJHtTT1VSQ0VGT1JHRV9NSVJST1J9L3Byb2plY3QvJHtCUE59LyR7QlBOfSR7
TElCVn0vb2xkZXItcmVsZWFzZXMvIgogCi0tIAoyLjQ3LjEKCg==

--===============7520048393416203661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libpng-changelog.txt"

Version 1.6.59 [September 28, 2026]
  Fixed CVE-2026-46675 (medium severity):
    Use-after-free of zlib input in `png_read_end` after incomplete zTXt, iTXt
    or iCCP decompression.
    (Reported independently by Ze Sheng and
    <JasonHonKL@users.noreply.github.com>.)
  Fixed a regression introduced in version 1.6.47 that caused libpng to reject
    hIST chunks in their correct position, after PLTE.
    (Contributed by Yuki Sekiguchi.)
  Prevented a double free of `png_struct` members after an allocation failure.
    (Contributed by Anthony Hurtado.)
  Applied fixes and updates to the CMake build.
  Adopted the REUSE Specification for licensing the CI files.

--===============7520048393416203661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libpng: PV changed from "1.6.58" to "1.6.59"
packages/x86-64-v3-poky-linux/libpng: SRC_URI changed from "https://downloads.sourceforge.net/libpng/libpng16/libpng-1.6.58.tar.xz file://run-ptest file://0001-tests-stream-per-test-results-to-stdout.patch" to "https://downloads.sourceforge.net/libpng/libpng16/libpng-1.6.59.tar.xz file://run-ptest file://0001-tests-stream-per-test-results-to-stdout.patch"
packages/x86-64-v3-poky-linux/libpng: PKGV changed from 1.6.58 [default] to 1.6.59 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: PV changed from "1.6.58" to "1.6.59"
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: PKGV changed from 1.6.58 [default] to 1.6.59 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: FILELIST: removed "/usr/lib/.debug/libpng16.so.16.58.0", added "/usr/lib/.debug/libpng16.so.16.59.0"
packages/x86-64-v3-poky-linux/libpng/libpng-dbg: PKGSIZE changed from 1682800 to 1683984 (+0%)
packages/x86-64-v3-poky-linux/libpng/libpng-dev: PV changed from "1.6.58" to "1.6.59"
packages/x86-64-v3-poky-linux/libpng/libpng-dev: PKGV changed from 1.6.58 [default] to 1.6.59 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-dev: PKGSIZE changed from 179835 to 179839 (+0%)
packages/x86-64-v3-poky-linux/libpng/libpng-doc: PV changed from "1.6.58" to "1.6.59"
packages/x86-64-v3-poky-linux/libpng/libpng-doc: PKGV changed from 1.6.58 [default] to 1.6.59 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-doc: PKGSIZE changed from 268133 to 268149 (+0%)
packages/x86-64-v3-poky-linux/libpng/libpng-locale: PV changed from "1.6.58" to "1.6.59"
packages/x86-64-v3-poky-linux/libpng/libpng-locale: PKGV changed from 1.6.58 [default] to 1.6.59 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: PV changed from "1.6.58" to "1.6.59"
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: PKGV changed from 1.6.58 [default] to 1.6.59 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: FILELIST: added "/usr/lib/libpng/ptest/src/contrib/testpngs/ch2n3p08.png /usr/lib/libpng/ptest/src/contrib/testpngs/ch1n3p04.png"
packages/x86-64-v3-poky-linux/libpng/libpng-ptest: PKGSIZE changed from 2561218 to 2563677 (+0%)
packages/x86-64-v3-poky-linux/libpng/libpng-src: PV changed from "1.6.58" to "1.6.59"
packages/x86-64-v3-poky-linux/libpng/libpng-src: PKGV changed from 1.6.58 [default] to 1.6.59 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-src: FILELIST: directory renamed /usr/src/debug/libpng/1.6.58/mips -> /usr/src/debug/libpng/1.6.59/mips, directory renamed /usr/src/debug/libpng/1.6.58/intel -> /usr/src/debug/libpng/1.6.59/intel, directory renamed /usr/src/debug/libpng/1.6.58/contrib/libtests -> /usr/src/debug/libpng/1.6.59/contrib/libtests, directory renamed /usr/src/debug/libpng/1.6.58 -> /usr/src/debug/libpng/1.6.59, directory renamed /usr/src/debug/libpng/1.6.58/powerpc -> /usr/src/debug/libpng/1.6.59/powerpc, directory renamed /usr/src/debug/libpng/1.6.58/contrib/tools -> /usr/src/debug/libpng/1.6.59/contrib/tools
packages/x86-64-v3-poky-linux/libpng/libpng-src: PKGSIZE changed from 2276248 to 2276639 (+0%)
packages/x86-64-v3-poky-linux/libpng/libpng-staticdev: PV changed from "1.6.58" to "1.6.59"
packages/x86-64-v3-poky-linux/libpng/libpng-staticdev: PKGV changed from 1.6.58 [default] to 1.6.59 [default]
packages/x86-64-v3-poky-linux/libpng/libpng-tools: PV changed from "1.6.58" to "1.6.59"
packages/x86-64-v3-poky-linux/libpng/libpng-tools: PKGV changed from 1.6.58 [default] to 1.6.59 [default]
packages/x86-64-v3-poky-linux/libpng/libpng: PV changed from "1.6.58" to "1.6.59"
packages/x86-64-v3-poky-linux/libpng/libpng: PKGV changed from 1.6.58 [default] to 1.6.59 [default]
packages/x86-64-v3-poky-linux/libpng/libpng: FILELIST: removed "/usr/lib/libpng16.so.16.58.0", added "/usr/lib/libpng16.so.16.59.0"
Changes to packages/x86-64-v3-poky-linux/libpng (sysroot):
  /usr/lib/libpng16.so.16 changed symlink target from libpng16.so.16.58.0 to libpng16.so.16.59.0
  /usr/lib/libpng16.so changed symlink target from libpng16.so.16.58.0 to libpng16.so.16.59.0
  /usr/lib/libpng16.so.16.58.0 moved to /usr/lib/libpng16.so.16.59.0

--===============7520048393416203661==--

