Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 404D9CDB466
	for <webhook@archiver.kernel.org>; Sun, 21 Jun 2026 05:20:39 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18753.1782019230046847957
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 22:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=X9eYfyz/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DTiOyKfD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019ee89f85e8-dce725cc-4d6d-431e-bb73-7721250032ff-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782019229;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KEyKephnj51DwGpDRXHD5D6y2uIqlSQKNjO1W4WEXik=;
	b=X9eYfyz/U0BsHN/LxnLW9XnLqdSWCqeY5iijmv9SrBzpkqbiP+HFrmuRAYKBP9I7
	nT3rRg7NR50zijHKH9iT4x1cfl+fV70fIr/ezyzU53EXmJnepmnkmYW/g88ggqHLD6U
	NwsAluXleb49TH126BJUskRIYioJId9A0D+tpWvQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782019229;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KEyKephnj51DwGpDRXHD5D6y2uIqlSQKNjO1W4WEXik=;
	b=DTiOyKfD8YC67Rvs9yB86XcRxJfHFsGXJZ+RP19JsLV8YWnnJgVrjEy/959+bNhe
	x6iMhwfwxSFfWEZfHQ7MMG7imYD+oWDR8HQcRmYzOUOo1lDcdpnubxOrhwV29Lkb183
	asBxf/ITjZVRC8AeFA406yeoWryMxnDV9pxlMgGA=
Content-Type: multipart/mixed; boundary="===============7547424024539030080=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libffi: upgrading to 3.6.0 SUCCEEDED
Message-ID: <0101019ee89f85e8-dce725cc-4d6d-431e-bb73-7721250032ff-000000@us-west-2.amazonses.com>
Date: Sun, 21 Jun 2026 05:20:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.21-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Jun 2026 05:20:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239253

--===============7547424024539030080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libffi* to *3.6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libffi-upgrade-3.5.2-3.6.0.patch
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
From 5adf642259275ae8c69f77d743ea22bb1d8ca7e6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 21 Jun 2026 05:20:25 +0000
Subject: [PATCH] libffi: upgrade 3.5.2 -> 3.6.0

---
 meta/recipes-support/libffi/libffi/not-win32.patch          | 6 +++---
 .../libffi/{libffi_3.5.2.bb => libffi_3.6.0.bb}             | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libffi/{libffi_3.5.2.bb => libffi_3.6.0.bb} (94%)

diff --git a/meta/recipes-support/libffi/libffi/not-win32.patch b/meta/recipes-support/libffi/libffi/not-win32.patch
index ca76fde855..17f45456ad 100644
--- a/meta/recipes-support/libffi/libffi/not-win32.patch
+++ b/meta/recipes-support/libffi/libffi/not-win32.patch
@@ -1,4 +1,4 @@
-From 28d0fd6b73163fc2dbc10c7dc838a8222671f88c Mon Sep 17 00:00:00 2001
+From b89a6b1ebfde657a8ff3c325297caf2bfbd1f7f4 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Thu, 4 Feb 2016 16:22:50 +0000
 Subject: [PATCH] libffi: ensure sysroot paths are not in libffi.pc
@@ -20,10 +20,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 258107d..ef1a285 100644
+index 2c8ba77..4e92515 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -411,7 +411,7 @@ AC_ARG_ENABLE(multi-os-directory,
+@@ -423,7 +423,7 @@ AC_ARG_ENABLE(multi-os-directory,
  
  # These variables are only ever used when we cross-build to X86_WIN32.
  # And we only support this with GCC, so...
diff --git a/meta/recipes-support/libffi/libffi_3.5.2.bb b/meta/recipes-support/libffi/libffi_3.6.0.bb
similarity index 94%
rename from meta/recipes-support/libffi/libffi_3.5.2.bb
rename to meta/recipes-support/libffi/libffi_3.6.0.bb
index d3aa90d429..8868279d6a 100644
--- a/meta/recipes-support/libffi/libffi_3.5.2.bb
+++ b/meta/recipes-support/libffi/libffi_3.6.0.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ce4763670c5b7756000561f9af1ab178"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://not-win32.patch \
            "
-SRC_URI[sha256sum] = "f3a3082a23b37c293a4fcd1053147b371f2ff91fa7ea1b2a52e335676bac82dc"
+SRC_URI[sha256sum] = "31ff1fe32deaebfbb388727f32677bb254bf2a41382c51464c0b1837c9ee9828"
 
 EXTRA_OECONF = "--disable-builddir"
 EXTRA_OECONF:class-native += "--with-gcc-arch=generic"
-- 
2.47.1


--===============7547424024539030080==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libffi-upgrade-3.5.2-3.6.0.patch"

RnJvbSA1YWRmNjQyMjU5Mjc1YWU4YzY5Zjc3ZDc0M2VhMjJiYjFkOGNhN2U2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMjEgSnVuIDIwMjYgMDU6MjA6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJmZmk6IHVwZ3JhZGUgMy41LjIgLT4gMy42LjAKCi0tLQogbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGliZmZpL2xpYmZmaS9ub3Qtd2luMzIucGF0Y2ggICAgICAgICAgfCA2ICsrKy0tLQogLi4uL2xp
YmZmaS97bGliZmZpXzMuNS4yLmJiID0+IGxpYmZmaV8zLjYuMC5iYn0gICAgICAgICAgICAgfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJmZmkve2xpYmZmaV8zLjUuMi5iYiA9PiBsaWJm
ZmlfMy42LjAuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGli
ZmZpL2xpYmZmaS9ub3Qtd2luMzIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJmZmkv
bGliZmZpL25vdC13aW4zMi5wYXRjaAppbmRleCBjYTc2ZmRlODU1Li4xN2Y0NTQ1NmFkIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJmZmkvbGliZmZpL25vdC13aW4zMi5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJmZmkvbGliZmZpL25vdC13aW4zMi5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMjhkMGZkNmI3MzE2M2ZjMmRiYzEwYzdkYzgzOGE4MjIy
NjcxZjg4YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjg5YTZiMWViZmRlNjU3YThm
ZjNjMzI1Mjk3Y2FmMmJmYmQxZjdmNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJv
c3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiBEYXRlOiBUaHUsIDQgRmViIDIwMTYg
MTY6MjI6NTAgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gbGliZmZpOiBlbnN1cmUgc3lzcm9vdCBw
YXRocyBhcmUgbm90IGluIGxpYmZmaS5wYwpAQCAtMjAsMTAgKzIwLDEwIEBAIFNpZ25lZC1vZmYt
Ynk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUu
YWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDI1ODEwN2QuLmVmMWEyODUgMTAwNjQ0CitpbmRleCAy
YzhiYTc3Li40ZTkyNTE1IDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1
cmUuYWMKLUBAIC00MTEsNyArNDExLDcgQEAgQUNfQVJHX0VOQUJMRShtdWx0aS1vcy1kaXJlY3Rv
cnksCitAQCAtNDIzLDcgKzQyMyw3IEBAIEFDX0FSR19FTkFCTEUobXVsdGktb3MtZGlyZWN0b3J5
LAogIAogICMgVGhlc2UgdmFyaWFibGVzIGFyZSBvbmx5IGV2ZXIgdXNlZCB3aGVuIHdlIGNyb3Nz
LWJ1aWxkIHRvIFg4Nl9XSU4zMi4KICAjIEFuZCB3ZSBvbmx5IHN1cHBvcnQgdGhpcyB3aXRoIEdD
Qywgc28uLi4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZmaS9saWJmZmlf
My41LjIuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJmZmkvbGliZmZpXzMuNi4wLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZm
aS9saWJmZmlfMy41LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZmaS9s
aWJmZmlfMy42LjAuYmIKaW5kZXggZDNhYTkwZDQyOS4uODg2ODI3OWQ2YSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZmZpL2xpYmZmaV8zLjUuMi5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJmZmkvbGliZmZpXzMuNi4wLmJiCkBAIC0xMyw3ICsxMyw3IEBAIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWNlNDc2MzY3MGM1Yjc3NTYwMDA1
NjFmOWFmMWFiMTc4IgogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7
UFZ9LyR7QlBOfS0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vbm90LXdpbjMyLnBh
dGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImYzYTMwODJhMjNiMzdj
MjkzYTRmY2QxMDUzMTQ3YjM3MWYyZmY5MWZhN2VhMWIyYTUyZTMzNTY3NmJhYzgyZGMiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiMzFmZjFmZTMyZGVhZWJmYmIzODg3MjdmMzI2NzdiYjI1NGJmMmE0
MTM4MmM1MTQ2NGMwYjE4MzdjOWVlOTgyOCIKIAogRVhUUkFfT0VDT05GID0gIi0tZGlzYWJsZS1i
dWlsZGRpciIKIEVYVFJBX09FQ09ORjpjbGFzcy1uYXRpdmUgKz0gIi0td2l0aC1nY2MtYXJjaD1n
ZW5lcmljIgotLSAKMi40Ny4xCgo=

--===============7547424024539030080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libffi: PKGV changed from 3.5.2 [default] to 3.6.0 [default]
packages/x86-64-v3-poky-linux/libffi: PV changed from "3.5.2" to "3.6.0"
packages/x86-64-v3-poky-linux/libffi: SRC_URI changed from "https://github.com/libffi/libffi/releases//download/v3.5.2/libffi-3.5.2.tar.gz file://not-win32.patch" to "https://github.com/libffi/libffi/releases//download/v3.6.0/libffi-3.6.0.tar.gz file://not-win32.patch"
packages/x86-64-v3-poky-linux/libffi/libffi-dbg: PKGSIZE changed from 155344 to 182632 (+18%)
packages/x86-64-v3-poky-linux/libffi/libffi-dbg: PKGV changed from 3.5.2 [default] to 3.6.0 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-dbg: PV changed from "3.5.2" to "3.6.0"
packages/x86-64-v3-poky-linux/libffi/libffi-dbg: FILELIST: removed "/usr/lib/.debug/libffi.so.8.2.0", added "/usr/lib/.debug/libffi.so.8.3.1"
packages/x86-64-v3-poky-linux/libffi/libffi-dev: PKGSIZE changed from 20806 to 21032 (+1%)
packages/x86-64-v3-poky-linux/libffi/libffi-dev: PKGV changed from 3.5.2 [default] to 3.6.0 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-dev: PV changed from "3.5.2" to "3.6.0"
packages/x86-64-v3-poky-linux/libffi/libffi-doc: PKGSIZE changed from 46053 to 46477 (+1%)
packages/x86-64-v3-poky-linux/libffi/libffi-doc: PKGV changed from 3.5.2 [default] to 3.6.0 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-doc: PV changed from "3.5.2" to "3.6.0"
packages/x86-64-v3-poky-linux/libffi/libffi-locale: PKGV changed from 3.5.2 [default] to 3.6.0 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-locale: PV changed from "3.5.2" to "3.6.0"
packages/x86-64-v3-poky-linux/libffi/libffi-src: PKGSIZE changed from 320190 to 367981 (+15%)
packages/x86-64-v3-poky-linux/libffi/libffi-src: PKGV changed from 3.5.2 [default] to 3.6.0 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-src: PV changed from "3.5.2" to "3.6.0"
packages/x86-64-v3-poky-linux/libffi/libffi-src: FILELIST: directory renamed /usr/src/debug/libffi/3.5.2/src/x86 -> /usr/src/debug/libffi/3.6.0/src/x86, directory renamed /usr/src/debug/libffi/3.5.2/src -> /usr/src/debug/libffi/3.6.0/src, directory renamed /usr/src/debug/libffi/3.5.2/include -> /usr/src/debug/libffi/3.6.0/include
packages/x86-64-v3-poky-linux/libffi/libffi-staticdev: PKGV changed from 3.5.2 [default] to 3.6.0 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-staticdev: PV changed from "3.5.2" to "3.6.0"
packages/x86-64-v3-poky-linux/libffi/libffi: PKGSIZE changed from 59519 to 67711 (+14%)
packages/x86-64-v3-poky-linux/libffi/libffi: PKGV changed from 3.5.2 [default] to 3.6.0 [default]
packages/x86-64-v3-poky-linux/libffi/libffi: PV changed from "3.5.2" to "3.6.0"
packages/x86-64-v3-poky-linux/libffi/libffi: FILELIST: removed "/usr/lib/libffi.so.8.2.0", added "/usr/lib/libffi.so.8.3.1"
Changes to packages/x86-64-v3-poky-linux/libffi (sysroot):
  /usr/lib/libffi.so.8 changed symlink target from libffi.so.8.2.0 to libffi.so.8.3.1
  /usr/lib/libffi.so changed symlink target from libffi.so.8.2.0 to libffi.so.8.3.1
  /usr/lib/libffi.so.8.2.0 moved to /usr/lib/libffi.so.8.3.1
Changes to packages/x86_64-linux/libffi-native (sysroot):
  /usr/lib/libffi.so.8 changed symlink target from libffi.so.8.2.0 to libffi.so.8.3.1
  /usr/lib/libffi.so changed symlink target from libffi.so.8.2.0 to libffi.so.8.3.1
  /usr/lib/libffi.so.8.2.0 moved to /usr/lib/libffi.so.8.3.1

--===============7547424024539030080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libffi/libffi-dbg: PKGSIZE changed from 155344 to 182632 (+18%)
packages/x86-64-v3-poky-linux/libffi/libffi-src: PKGSIZE changed from 320190 to 367981 (+15%)
packages/x86-64-v3-poky-linux/libffi/libffi: PKGSIZE changed from 59519 to 67711 (+14%)
packages/x86-64-v3-poky-linux/libffi/libffi: FILELIST: removed "/usr/lib/libffi.so.8.2.0", added "/usr/lib/libffi.so.8.3.1"
Changes to packages/x86-64-v3-poky-linux/libffi (sysroot):
  /usr/lib/libffi.so.8 changed symlink target from libffi.so.8.2.0 to libffi.so.8.3.1
  /usr/lib/libffi.so changed symlink target from libffi.so.8.2.0 to libffi.so.8.3.1
  /usr/lib/libffi.so.8.2.0 moved to /usr/lib/libffi.so.8.3.1
Changes to packages/x86_64-linux/libffi-native (sysroot):
  /usr/lib/libffi.so.8 changed symlink target from libffi.so.8.2.0 to libffi.so.8.3.1
  /usr/lib/libffi.so changed symlink target from libffi.so.8.2.0 to libffi.so.8.3.1
  /usr/lib/libffi.so.8.2.0 moved to /usr/lib/libffi.so.8.3.1

--===============7547424024539030080==--

