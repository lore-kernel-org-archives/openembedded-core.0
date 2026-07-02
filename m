Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DF90C44506
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 05:32:53 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62830.1782970364419480339
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 22:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Vt5ni1v3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JH96SL+9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019f2150aebf-345f1646-9695-444a-a4d3-42eaa3145eaf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782970363;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=gLY9WEzYZPMFxU7Q9913g8O/Qcmmb7f0Ji3LuykTC5E=;
	b=Vt5ni1v3H5VVl4hAjscluV1iGGhkK7o4ymTbkrtFHLEeM+CHurSwJQ+yUKFzymK/
	xKxhTx1orsMJzUoFNjPcbTOsqFZeXhqi+4M46ja7fIGBdwv9k2T6/hqiO1eKsQrplk4
	ofeiU+FgmPQ6+5mbcwwZDq5QE87+awCYw1gRyaxQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782970363;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=gLY9WEzYZPMFxU7Q9913g8O/Qcmmb7f0Ji3LuykTC5E=;
	b=JH96SL+9D6Eeg9LCskMGhCsYy8s1gDDO/Msdv8ftxXZ6hrRXBkysmN+TgD2iU0rS
	AYSbQ8bJy+N/ldBSm2xxFQeqxBRuGelUxniIk+fb+nCNtujQtiC2Z0QdLx0YWARNHwS
	vNdRS3U7qPye6C/dNDla2E15LuwD0njSn46iV9sM=
Content-Type: multipart/mixed; boundary="===============0258618944460515129=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] jansson: upgrading to 2.15.1 SUCCEEDED
Message-ID: <0101019f2150aebf-345f1646-9695-444a-a4d3-42eaa3145eaf-000000@us-west-2.amazonses.com>
Date: Thu, 2 Jul 2026 05:32:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 05:32:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240015

--===============0258618944460515129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *jansson* to *2.15.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-jansson-upgrade-2.15.0-2.15.1.patch
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
From c4bb2bbb62e66b198e16577c7f4fc9cba9944cac Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 2 Jul 2026 05:25:01 +0000
Subject: [PATCH] jansson: upgrade 2.15.0 -> 2.15.1

---
 ...se-default-symver-when-the-linker-su.patch | 45 -------------------
 .../{jansson_2.15.0.bb => jansson_2.15.1.bb}  |  6 +--
 2 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-extended/jansson/jansson/0001-configure-only-use-default-symver-when-the-linker-su.patch
 rename meta/recipes-extended/jansson/{jansson_2.15.0.bb => jansson_2.15.1.bb} (69%)

diff --git a/meta/recipes-extended/jansson/jansson/0001-configure-only-use-default-symver-when-the-linker-su.patch b/meta/recipes-extended/jansson/jansson/0001-configure-only-use-default-symver-when-the-linker-su.patch
deleted file mode 100644
index eb0c459f68..0000000000
--- a/meta/recipes-extended/jansson/jansson/0001-configure-only-use-default-symver-when-the-linker-su.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 7c44ab421c725ea6fed358f435c5461c0096f852 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 24 Jun 2026 14:04:19 -0700
-Subject: [PATCH] configure: only use --default-symver when the linker supports
- it
-
-jansson enables symbol versioning on glibc by passing
--Wl,--default-symver to the linker. This is a GNU ld option which is
-not understood by every linker, e.g. ld.lld errors out with:
-
-  ld.lld: error: unknown argument '--default-symver'
-
-Probe the linker with a link test before adding the flag so the build
-works with both GNU ld and lld. When the linker does not accept the
-option the symbol versioning provided by the explicit version script
-is still applied; only the implicit default version is dropped.
-
-Upstream-Status: Submitted [https://github.com/akheron/jansson/pull/744]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index e5c126a..1bb8b34 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -135,7 +135,16 @@ AC_SUBST(JSON_BSYMBOLIC_LDFLAGS)
-
- # Enable symbol versioning on GNU libc
- JSON_SYMVER_LDFLAGS=
--AC_CHECK_DECL([__GLIBC__], [JSON_SYMVER_LDFLAGS=-Wl,--default-symver])
-+AC_CHECK_DECL([__GLIBC__], [
-+    saved_LDFLAGS="$LDFLAGS"
-+    LDFLAGS="$LDFLAGS -Wl,--default-symver"
-+    AC_MSG_CHECKING([whether the linker accepts -Wl,--default-symver])
-+    AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[]])],
-+        [AC_MSG_RESULT([yes])
-+         JSON_SYMVER_LDFLAGS=-Wl,--default-symver],
-+        [AC_MSG_RESULT([no])])
-+    LDFLAGS="$saved_LDFLAGS"
-+])
- AC_SUBST([JSON_SYMVER_LDFLAGS])
-
- AC_ARG_ENABLE([dtoa],
diff --git a/meta/recipes-extended/jansson/jansson_2.15.0.bb b/meta/recipes-extended/jansson/jansson_2.15.1.bb
similarity index 69%
rename from meta/recipes-extended/jansson/jansson_2.15.0.bb
rename to meta/recipes-extended/jansson/jansson_2.15.1.bb
index 1a0b6f24ac..60bbc5ba6d 100644
--- a/meta/recipes-extended/jansson/jansson_2.15.0.bb
+++ b/meta/recipes-extended/jansson/jansson_2.15.1.bb
@@ -5,11 +5,9 @@ LICENSE = "MIT & dtoa"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9911525d4128bee234ee2d3ccaa2537"
 
 GITHUB_BASE_URI = "https://github.com/akheron/jansson/releases"
-SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
-           file://0001-configure-only-use-default-symver-when-the-linker-su.patch \
-		  "
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "070a629590723228dc3b744ae90e965a569efb9c535b3309b52e80e75d8eb3be"
+SRC_URI[sha256sum] = "0c7114dc0b2d22a670724a1f95922029d7077c19dbf79a584cb8084d2f267f2f"
 
 inherit autotools pkgconfig github-releases
 
-- 
2.47.1


--===============0258618944460515129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/jansson/jansson: FILELIST: removed "/usr/lib/libjansson.so.4.15.0", added "/usr/lib/libjansson.so.4.15.1"
Changes to packages/x86-64-v3-poky-linux/jansson (sysroot):
  /usr/lib/libjansson.so.4 changed symlink target from libjansson.so.4.15.0 to libjansson.so.4.15.1
  /usr/lib/libjansson.so changed symlink target from libjansson.so.4.15.0 to libjansson.so.4.15.1
  /usr/lib/libjansson.so.4.15.0 moved to /usr/lib/libjansson.so.4.15.1

--===============0258618944460515129==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-jansson-upgrade-2.15.0-2.15.1.patch"

RnJvbSBjNGJiMmJiYjYyZTY2YjE5OGUxNjU3N2M3ZjRmYzljYmE5OTQ0Y2FjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMiBKdWwgMjAyNiAwNToyNTowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGph
bnNzb246IHVwZ3JhZGUgMi4xNS4wIC0+IDIuMTUuMQoKLS0tCiAuLi5zZS1kZWZhdWx0LXN5bXZl
ci13aGVuLXRoZS1saW5rZXItc3UucGF0Y2ggfCA0NSAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4v
e2phbnNzb25fMi4xNS4wLmJiID0+IGphbnNzb25fMi4xNS4xLmJifSAgfCAgNiArLS0KIDIgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0OSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvamFuc3Nvbi9qYW5zc29uLzAwMDEtY29uZmln
dXJlLW9ubHktdXNlLWRlZmF1bHQtc3ltdmVyLXdoZW4tdGhlLWxpbmtlci1zdS5wYXRjaAogcmVu
YW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9qYW5zc29uL3tqYW5zc29uXzIuMTUuMC5iYiA9PiBq
YW5zc29uXzIuMTUuMS5iYn0gKDY5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvamFuc3Nvbi9qYW5zc29uLzAwMDEtY29uZmlndXJlLW9ubHktdXNlLWRlZmF1bHQtc3ltdmVy
LXdoZW4tdGhlLWxpbmtlci1zdS5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9qYW5zc29u
L2phbnNzb24vMDAwMS1jb25maWd1cmUtb25seS11c2UtZGVmYXVsdC1zeW12ZXItd2hlbi10aGUt
bGlua2VyLXN1LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBlYjBjNDU5ZjY4
Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9qYW5zc29uL2phbnNzb24v
MDAwMS1jb25maWd1cmUtb25seS11c2UtZGVmYXVsdC1zeW12ZXItd2hlbi10aGUtbGlua2VyLXN1
LnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNDUgKzAsMCBAQAotRnJvbSA3YzQ0YWI0MjFjNzI1
ZWE2ZmVkMzU4ZjQzNWM1NDYxYzAwOTZmODUyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJv
bTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLURhdGU6IFdlZCwgMjQgSnVuIDIwMjYg
MTQ6MDQ6MTkgLTA3MDAKLVN1YmplY3Q6IFtQQVRDSF0gY29uZmlndXJlOiBvbmx5IHVzZSAtLWRl
ZmF1bHQtc3ltdmVyIHdoZW4gdGhlIGxpbmtlciBzdXBwb3J0cwotIGl0Ci0KLWphbnNzb24gZW5h
YmxlcyBzeW1ib2wgdmVyc2lvbmluZyBvbiBnbGliYyBieSBwYXNzaW5nCi0tV2wsLS1kZWZhdWx0
LXN5bXZlciB0byB0aGUgbGlua2VyLiBUaGlzIGlzIGEgR05VIGxkIG9wdGlvbiB3aGljaCBpcwot
bm90IHVuZGVyc3Rvb2QgYnkgZXZlcnkgbGlua2VyLCBlLmcuIGxkLmxsZCBlcnJvcnMgb3V0IHdp
dGg6Ci0KLSAgbGQubGxkOiBlcnJvcjogdW5rbm93biBhcmd1bWVudCAnLS1kZWZhdWx0LXN5bXZl
cicKLQotUHJvYmUgdGhlIGxpbmtlciB3aXRoIGEgbGluayB0ZXN0IGJlZm9yZSBhZGRpbmcgdGhl
IGZsYWcgc28gdGhlIGJ1aWxkCi13b3JrcyB3aXRoIGJvdGggR05VIGxkIGFuZCBsbGQuIFdoZW4g
dGhlIGxpbmtlciBkb2VzIG5vdCBhY2NlcHQgdGhlCi1vcHRpb24gdGhlIHN5bWJvbCB2ZXJzaW9u
aW5nIHByb3ZpZGVkIGJ5IHRoZSBleHBsaWNpdCB2ZXJzaW9uIHNjcmlwdAotaXMgc3RpbGwgYXBw
bGllZDsgb25seSB0aGUgaW1wbGljaXQgZGVmYXVsdCB2ZXJzaW9uIGlzIGRyb3BwZWQuCi0KLVVw
c3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dpdGh1Yi5jb20vYWtoZXJvbi9qYW5z
c29uL3B1bGwvNzQ0XQotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNv
bT4KLS0tLQotIGNvbmZpZ3VyZS5hYyB8IDExICsrKysrKysrKystCi0gMSBmaWxlIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKLQotZGlmZiAtLWdpdCBhL2NvbmZpZ3Vy
ZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggZTVjMTI2YS4uMWJiOGIzNCAxMDA2NDQKLS0tLSBh
L2NvbmZpZ3VyZS5hYwotKysrIGIvY29uZmlndXJlLmFjCi1AQCAtMTM1LDcgKzEzNSwxNiBAQCBB
Q19TVUJTVChKU09OX0JTWU1CT0xJQ19MREZMQUdTKQotCi0gIyBFbmFibGUgc3ltYm9sIHZlcnNp
b25pbmcgb24gR05VIGxpYmMKLSBKU09OX1NZTVZFUl9MREZMQUdTPQotLUFDX0NIRUNLX0RFQ0wo
W19fR0xJQkNfX10sIFtKU09OX1NZTVZFUl9MREZMQUdTPS1XbCwtLWRlZmF1bHQtc3ltdmVyXSkK
LStBQ19DSEVDS19ERUNMKFtfX0dMSUJDX19dLCBbCi0rICAgIHNhdmVkX0xERkxBR1M9IiRMREZM
QUdTIgotKyAgICBMREZMQUdTPSIkTERGTEFHUyAtV2wsLS1kZWZhdWx0LXN5bXZlciIKLSsgICAg
QUNfTVNHX0NIRUNLSU5HKFt3aGV0aGVyIHRoZSBsaW5rZXIgYWNjZXB0cyAtV2wsLS1kZWZhdWx0
LXN5bXZlcl0pCi0rICAgIEFDX0xJTktfSUZFTFNFKFtBQ19MQU5HX1BST0dSQU0oW1tdXSwgW1td
XSldLAotKyAgICAgICAgW0FDX01TR19SRVNVTFQoW3llc10pCi0rICAgICAgICAgSlNPTl9TWU1W
RVJfTERGTEFHUz0tV2wsLS1kZWZhdWx0LXN5bXZlcl0sCi0rICAgICAgICBbQUNfTVNHX1JFU1VM
VChbbm9dKV0pCi0rICAgIExERkxBR1M9IiRzYXZlZF9MREZMQUdTIgotK10pCi0gQUNfU1VCU1Qo
W0pTT05fU1lNVkVSX0xERkxBR1NdKQotCi0gQUNfQVJHX0VOQUJMRShbZHRvYV0sCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvamFuc3Nvbi9qYW5zc29uXzIuMTUuMC5iYiBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9qYW5zc29uL2phbnNzb25fMi4xNS4xLmJiCnNpbWlsYXJpdHkg
aW5kZXggNjklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9qYW5zc29uL2phbnNz
b25fMi4xNS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvamFuc3Nvbi9qYW5z
c29uXzIuMTUuMS5iYgppbmRleCAxYTBiNmYyNGFjLi42MGJiYzViYTZkIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvamFuc3Nvbi9qYW5zc29uXzIuMTUuMC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvamFuc3Nvbi9qYW5zc29uXzIuMTUuMS5iYgpAQCAtNSwxMSArNSw5
IEBAIExJQ0VOU0UgPSAiTUlUICYgZHRvYSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJ
Q0VOU0U7bWQ1PWQ5OTExNTI1ZDQxMjhiZWUyMzRlZTJkM2NjYWEyNTM3IgogCiBHSVRIVUJfQkFT
RV9VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL2FraGVyb24vamFuc3Nvbi9yZWxlYXNlcyIKLVNS
Q19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkL3Yke1BWfS8ke0JQfS50YXIuZ3og
XAotICAgICAgICAgICBmaWxlOi8vMDAwMS1jb25maWd1cmUtb25seS11c2UtZGVmYXVsdC1zeW12
ZXItd2hlbi10aGUtbGlua2VyLXN1LnBhdGNoIFwKLQkJICAiCitTUkNfVVJJID0gIiR7R0lUSFVC
X0JBU0VfVVJJfS9kb3dubG9hZC92JHtQVn0vJHtCUH0udGFyLmd6IgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiMDcwYTYyOTU5MDcyMzIyOGRjM2I3NDRhZTkwZTk2NWE1NjllZmI5YzUzNWIzMzA5
YjUyZTgwZTc1ZDhlYjNiZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwYzcxMTRkYzBiMmQyMmE2
NzA3MjRhMWY5NTkyMjAyOWQ3MDc3YzE5ZGJmNzlhNTg0Y2I4MDg0ZDJmMjY3ZjJmIgogCiBpbmhl
cml0IGF1dG90b29scyBwa2djb25maWcgZ2l0aHViLXJlbGVhc2VzCiAKLS0gCjIuNDcuMQoK

--===============0258618944460515129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/jansson/jansson-dbg: FILELIST: removed "/usr/lib/.debug/libjansson.so.4.15.0", added "/usr/lib/.debug/libjansson.so.4.15.1"
packages/x86-64-v3-poky-linux/jansson/jansson-dbg: PV changed from "2.15.0" to "2.15.1"
packages/x86-64-v3-poky-linux/jansson/jansson-dbg: PKGSIZE changed from 323224 to 326400 (+1%)
packages/x86-64-v3-poky-linux/jansson/jansson-dbg: PKGV changed from 2.15.0 [default] to 2.15.1 [default]
packages/x86-64-v3-poky-linux/jansson/jansson-dev: PV changed from "2.15.0" to "2.15.1"
packages/x86-64-v3-poky-linux/jansson/jansson-dev: PKGV changed from 2.15.0 [default] to 2.15.1 [default]
packages/x86-64-v3-poky-linux/jansson/jansson-doc: PV changed from "2.15.0" to "2.15.1"
packages/x86-64-v3-poky-linux/jansson/jansson-doc: PKGV changed from 2.15.0 [default] to 2.15.1 [default]
packages/x86-64-v3-poky-linux/jansson/jansson-locale: PV changed from "2.15.0" to "2.15.1"
packages/x86-64-v3-poky-linux/jansson/jansson-locale: PKGV changed from 2.15.0 [default] to 2.15.1 [default]
packages/x86-64-v3-poky-linux/jansson/jansson-src: FILELIST: directory renamed /usr/src/debug/jansson/2.15.0/src -> /usr/src/debug/jansson/2.15.1/src
packages/x86-64-v3-poky-linux/jansson/jansson-src: PV changed from "2.15.0" to "2.15.1"
packages/x86-64-v3-poky-linux/jansson/jansson-src: PKGSIZE changed from 327158 to 328841 (+1%)
packages/x86-64-v3-poky-linux/jansson/jansson-src: PKGV changed from 2.15.0 [default] to 2.15.1 [default]
packages/x86-64-v3-poky-linux/jansson/jansson-staticdev: PV changed from "2.15.0" to "2.15.1"
packages/x86-64-v3-poky-linux/jansson/jansson-staticdev: PKGV changed from 2.15.0 [default] to 2.15.1 [default]
packages/x86-64-v3-poky-linux/jansson/jansson: FILELIST: removed "/usr/lib/libjansson.so.4.15.0", added "/usr/lib/libjansson.so.4.15.1"
packages/x86-64-v3-poky-linux/jansson/jansson: PV changed from "2.15.0" to "2.15.1"
packages/x86-64-v3-poky-linux/jansson/jansson: PKGV changed from 2.15.0 [default] to 2.15.1 [default]
packages/x86-64-v3-poky-linux/jansson: PV changed from "2.15.0" to "2.15.1"
packages/x86-64-v3-poky-linux/jansson: PKGV changed from 2.15.0 [default] to 2.15.1 [default]
packages/x86-64-v3-poky-linux/jansson: SRC_URI changed from "https://github.com/akheron/jansson/releases/download/v2.15.0/jansson-2.15.0.tar.gz file://0001-configure-only-use-default-symver-when-the-linker-su.patch" to "https://github.com/akheron/jansson/releases/download/v2.15.1/jansson-2.15.1.tar.gz"
Changes to packages/x86-64-v3-poky-linux/jansson (sysroot):
  /usr/lib/libjansson.so.4 changed symlink target from libjansson.so.4.15.0 to libjansson.so.4.15.1
  /usr/lib/libjansson.so changed symlink target from libjansson.so.4.15.0 to libjansson.so.4.15.1
  /usr/lib/libjansson.so.4.15.0 moved to /usr/lib/libjansson.so.4.15.1

--===============0258618944460515129==--

