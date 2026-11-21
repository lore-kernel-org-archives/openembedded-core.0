Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12061.1795238993281085677
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 21:29:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hVHbql3J;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=XdTihJmo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a1fc951999-b987161b-e99e-4f34-979a-14f5c96efc50-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795238992;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=OwvZINmirv3nmvt4Gdba93BDmy4cu685dBxbgthbtJs=;
	b=hVHbql3JRTja7VU6tgO4x+zdKfwL0M2UFCIMrNDXJCHMfbhRDG7wBxggVuGZkFSO
	TPcEz3XtVm0jKG0crbigSDQrh5RzIl+5uH2Mt+BQGNP/kfdTcAPJSHCFFd/Knudf1Se
	b07GOcsiTnzoi4bY70TVvZTH04s0w3XFP10XRNWk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795238992;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=OwvZINmirv3nmvt4Gdba93BDmy4cu685dBxbgthbtJs=;
	b=XdTihJmo0AgCbIsqpCp3zejXVsY4CbFGQyFIPCIBqCuKcZdaYbQrbKCb2Ya2n0JJ
	NYCQ+PcMsZBomNHqGdlGSMgM8D2j/HJkVj6Djj/6sDklZN2dijmTrRDoN+joIxQJ8wb
	c0XIg6a3TR4Zkh41PMF/iV4RnnoDbi2XdrLPMqtI=
Content-Type: multipart/mixed; boundary="===============7631858025259860631=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libksba: upgrading to 1.9.1 SUCCEEDED
Message-ID: <010101a1fc951999-b987161b-e99e-4f34-979a-14f5c96efc50-000000@us-west-2.amazonses.com>
Date: Sat, 21 Nov 2026 05:29:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.21-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 05:29:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250837

--===============7631858025259860631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libksba* to *1.9.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libksba-upgrade-1.8.1-1.9.1.patch
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
From 06f767daceef569ddf5c72ece183beb8d4ece216 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 21 Nov 2026 05:25:52 +0000
Subject: [PATCH] libksba: upgrade 1.8.1 -> 1.9.1

Release 1.9.1.
w32: Fix debug format strings.  Fix typo in libksba.def.
Release 1.9.0.
Add support to create a composite ML-KEM certificate.
Add a sample certificate for Composite ML-KEM.
Add flags to Ed25519 and Curve25519 public keys.
Fix append_ucs2_value.
Support writing composite ML-KEM enrypted data.
Make the new DN parser usable for non-standalone DNs.
Improve the DN parser.
New function ksba_parser_get_tag.
Minor code refactoring for the DN parser.
Fix getting composite ML-KEM keyinfo.
Fix an assertion failure in parsing an OCSP response.
New function ksba_cms_verbosity.
New API ksba_cms_get_recp_ident and support composite ML-KEM.
Add new helper functions and replace some code.
New set of public functions to parse DER data.
Allow ML-DSA CMS signature creation.
Add support ML-DSA as specified by RFC-9881.
Fix _ksba_asn_expand_tree with cache table.
Fix cleanup with release_ocsp_extensions.
Fix attribute to string for UCS4 and UCS2.
Fix attribute to string OOB for UCS2 and UCS4.
Fix attribute to string for UCS2 and UCS4 for a space at the end.
Fix attribute to string for escaping a space at the end.
build: Use @FGREP@ by configure for ksba-config.
---
 .../libksba/libksba/ksba-add-pkgconfig-support.patch            | 2 +-
 .../libksba/{libksba_1.8.1.bb => libksba_1.9.1.bb}              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libksba/{libksba_1.8.1.bb => libksba_1.9.1.bb} (95%)

diff --git a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
index 1ba19e5c75..44a062ec7a 100644
--- a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
@@ -1,4 +1,4 @@
-From 1d1feec71e364aba1fe9e2608f422e8970bd9e9e Mon Sep 17 00:00:00 2001
+From 7aedc4fb8e2ccadbedbb1ee47e5aa879398f2b6c Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 3 Dec 2012 18:17:31 +0800
 Subject: [PATCH] libksba: add pkgconfig support
diff --git a/meta/recipes-support/libksba/libksba_1.8.1.bb b/meta/recipes-support/libksba/libksba_1.9.1.bb
similarity index 95%
rename from meta/recipes-support/libksba/libksba_1.8.1.bb
rename to meta/recipes-support/libksba/libksba_1.9.1.bb
index ce08fe4426..0b8610efd1 100644
--- a/meta/recipes-support/libksba/libksba_1.8.1.bb
+++ b/meta/recipes-support/libksba/libksba_1.9.1.bb
@@ -28,7 +28,7 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "c2f84393011827219ae117131dba8e7684c2bed0961eed11b0642c2acba440b5"
+SRC_URI[sha256sum] = "9afdd398b4a076735e1e7fd29c7f6e7670b6c382aee2d3a55aa937b283f43e5b"
 
 do_configure:prepend () {
 	# Else these could be used in preference to those in aclocal-copy
-- 
2.47.1


--===============7631858025259860631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libksba-changelog.txt"

Release 1.9.1.
w32: Fix debug format strings.  Fix typo in libksba.def.
Release 1.9.0.
Add support to create a composite ML-KEM certificate.
Add a sample certificate for Composite ML-KEM.
Add flags to Ed25519 and Curve25519 public keys.
Fix append_ucs2_value.
Support writing composite ML-KEM enrypted data.
Make the new DN parser usable for non-standalone DNs.
Improve the DN parser.
New function ksba_parser_get_tag.
Minor code refactoring for the DN parser.
Fix getting composite ML-KEM keyinfo.
Fix an assertion failure in parsing an OCSP response.
New function ksba_cms_verbosity.
New API ksba_cms_get_recp_ident and support composite ML-KEM.
Add new helper functions and replace some code.
New set of public functions to parse DER data.
Allow ML-DSA CMS signature creation.
Add support ML-DSA as specified by RFC-9881.
Fix _ksba_asn_expand_tree with cache table.
Fix cleanup with release_ocsp_extensions.
Fix attribute to string for UCS4 and UCS2.
Fix attribute to string OOB for UCS2 and UCS4.
Fix attribute to string for UCS2 and UCS4 for a space at the end.
Fix attribute to string for escaping a space at the end.
build: Use @FGREP@ by configure for ksba-config.

--===============7631858025259860631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libksba/libksba-dev: PKGSIZE changed from 34015 to 37672 (+11%)
packages/x86-64-v3-poky-linux/libksba/libksba-ptest: FILELIST: added "/usr/lib/libksba/ptest/tests/samples/mldsa87-rfc9881.crt /usr/lib/libksba/ptest/tests/samples/mlkem768-np256.pkcs8 /usr/lib/libksba/ptest/tests/samples/mldsa65-rfc9881.crt /usr/lib/libksba/ptest/tests/samples/mlkem768-np256.crt"
packages/x86-64-v3-poky-linux/libksba/libksba: FILELIST: removed "/usr/lib/libksba.so.8.16.1", added "/usr/lib/libksba.so.8.17.1"
Changes to packages/x86-64-v3-poky-linux/libksba (sysroot):
  /usr/lib/libksba.so.8 changed symlink target from libksba.so.8.16.1 to libksba.so.8.17.1
  /usr/lib/libksba.so changed symlink target from libksba.so.8.16.1 to libksba.so.8.17.1
  /usr/lib/libksba.so.8.16.1 moved to /usr/lib/libksba.so.8.17.1

--===============7631858025259860631==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libksba-upgrade-1.8.1-1.9.1.patch"

RnJvbSAwNmY3NjdkYWNlZWY1NjlkZGY1YzcyZWNlMTgzYmViOGQ0ZWNlMjE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjEgTm92IDIwMjYgMDU6MjU6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJrc2JhOiB1cGdyYWRlIDEuOC4xIC0+IDEuOS4xCgpSZWxlYXNlIDEuOS4xLgp3MzI6IEZpeCBk
ZWJ1ZyBmb3JtYXQgc3RyaW5ncy4gIEZpeCB0eXBvIGluIGxpYmtzYmEuZGVmLgpSZWxlYXNlIDEu
OS4wLgpBZGQgc3VwcG9ydCB0byBjcmVhdGUgYSBjb21wb3NpdGUgTUwtS0VNIGNlcnRpZmljYXRl
LgpBZGQgYSBzYW1wbGUgY2VydGlmaWNhdGUgZm9yIENvbXBvc2l0ZSBNTC1LRU0uCkFkZCBmbGFn
cyB0byBFZDI1NTE5IGFuZCBDdXJ2ZTI1NTE5IHB1YmxpYyBrZXlzLgpGaXggYXBwZW5kX3VjczJf
dmFsdWUuClN1cHBvcnQgd3JpdGluZyBjb21wb3NpdGUgTUwtS0VNIGVucnlwdGVkIGRhdGEuCk1h
a2UgdGhlIG5ldyBETiBwYXJzZXIgdXNhYmxlIGZvciBub24tc3RhbmRhbG9uZSBETnMuCkltcHJv
dmUgdGhlIEROIHBhcnNlci4KTmV3IGZ1bmN0aW9uIGtzYmFfcGFyc2VyX2dldF90YWcuCk1pbm9y
IGNvZGUgcmVmYWN0b3JpbmcgZm9yIHRoZSBETiBwYXJzZXIuCkZpeCBnZXR0aW5nIGNvbXBvc2l0
ZSBNTC1LRU0ga2V5aW5mby4KRml4IGFuIGFzc2VydGlvbiBmYWlsdXJlIGluIHBhcnNpbmcgYW4g
T0NTUCByZXNwb25zZS4KTmV3IGZ1bmN0aW9uIGtzYmFfY21zX3ZlcmJvc2l0eS4KTmV3IEFQSSBr
c2JhX2Ntc19nZXRfcmVjcF9pZGVudCBhbmQgc3VwcG9ydCBjb21wb3NpdGUgTUwtS0VNLgpBZGQg
bmV3IGhlbHBlciBmdW5jdGlvbnMgYW5kIHJlcGxhY2Ugc29tZSBjb2RlLgpOZXcgc2V0IG9mIHB1
YmxpYyBmdW5jdGlvbnMgdG8gcGFyc2UgREVSIGRhdGEuCkFsbG93IE1MLURTQSBDTVMgc2lnbmF0
dXJlIGNyZWF0aW9uLgpBZGQgc3VwcG9ydCBNTC1EU0EgYXMgc3BlY2lmaWVkIGJ5IFJGQy05ODgx
LgpGaXggX2tzYmFfYXNuX2V4cGFuZF90cmVlIHdpdGggY2FjaGUgdGFibGUuCkZpeCBjbGVhbnVw
IHdpdGggcmVsZWFzZV9vY3NwX2V4dGVuc2lvbnMuCkZpeCBhdHRyaWJ1dGUgdG8gc3RyaW5nIGZv
ciBVQ1M0IGFuZCBVQ1MyLgpGaXggYXR0cmlidXRlIHRvIHN0cmluZyBPT0IgZm9yIFVDUzIgYW5k
IFVDUzQuCkZpeCBhdHRyaWJ1dGUgdG8gc3RyaW5nIGZvciBVQ1MyIGFuZCBVQ1M0IGZvciBhIHNw
YWNlIGF0IHRoZSBlbmQuCkZpeCBhdHRyaWJ1dGUgdG8gc3RyaW5nIGZvciBlc2NhcGluZyBhIHNw
YWNlIGF0IHRoZSBlbmQuCmJ1aWxkOiBVc2UgQEZHUkVQQCBieSBjb25maWd1cmUgZm9yIGtzYmEt
Y29uZmlnLgotLS0KIC4uLi9saWJrc2JhL2xpYmtzYmEva3NiYS1hZGQtcGtnY29uZmlnLXN1cHBv
cnQucGF0Y2ggICAgICAgICAgICB8IDIgKy0KIC4uLi9saWJrc2JhL3tsaWJrc2JhXzEuOC4xLmJi
ID0+IGxpYmtzYmFfMS45LjEuYmJ9ICAgICAgICAgICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1z
dXBwb3J0L2xpYmtzYmEve2xpYmtzYmFfMS44LjEuYmIgPT4gbGlia3NiYV8xLjkuMS5iYn0gKDk1
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJrc2JhL2xpYmtzYmEva3Ni
YS1hZGQtcGtnY29uZmlnLXN1cHBvcnQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJr
c2JhL2xpYmtzYmEva3NiYS1hZGQtcGtnY29uZmlnLXN1cHBvcnQucGF0Y2gKaW5kZXggMWJhMTll
NWM3NS4uNDRhMDYyZWM3YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlia3Ni
YS9saWJrc2JhL2tzYmEtYWRkLXBrZ2NvbmZpZy1zdXBwb3J0LnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYmtzYmEvbGlia3NiYS9rc2JhLWFkZC1wa2djb25maWctc3VwcG9ydC5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMWQxZmVlYzcxZTM2NGFiYTFmZTllMjYwOGY0MjJl
ODk3MGJkOWU5ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gN2FlZGM0ZmI4ZTJjY2Fk
YmVkYmIxZWU0N2U1YWE4NzkzOThmMmI2YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KIERhdGU6IE1vbiwgMyBEZWMgMjAxMiAx
ODoxNzozMSArMDgwMAogU3ViamVjdDogW1BBVENIXSBsaWJrc2JhOiBhZGQgcGtnY29uZmlnIHN1
cHBvcnQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmtzYmEvbGlia3NiYV8x
LjguMS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmtzYmEvbGlia3NiYV8xLjkuMS5iYgpz
aW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJr
c2JhL2xpYmtzYmFfMS44LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmtz
YmEvbGlia3NiYV8xLjkuMS5iYgppbmRleCBjZTA4ZmU0NDI2Li4wYjg2MTBlZmQxIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJrc2JhL2xpYmtzYmFfMS44LjEuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlia3NiYS9saWJrc2JhXzEuOS4xLmJiCkBAIC0yOCw3ICsy
OCw3IEBAIFNSQ19VUkkgPSAiJHtHTlVQR19NSVJST1J9LyR7QlBOfS8ke0JQTn0tJHtQVn0udGFy
LmJ6MiBcCiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICAiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICJjMmY4NDM5MzAxMTgyNzIxOWFlMTE3MTMxZGJhOGU3Njg0YzJi
ZWQwOTYxZWVkMTFiMDY0MmMyYWNiYTQ0MGI1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjlhZmRk
Mzk4YjRhMDc2NzM1ZTFlN2ZkMjljN2Y2ZTc2NzBiNmMzODJhZWUyZDNhNTVhYTkzN2IyODNmNDNl
NWIiCiAKIGRvX2NvbmZpZ3VyZTpwcmVwZW5kICgpIHsKIAkjIEVsc2UgdGhlc2UgY291bGQgYmUg
dXNlZCBpbiBwcmVmZXJlbmNlIHRvIHRob3NlIGluIGFjbG9jYWwtY29weQotLSAKMi40Ny4xCgo=

--===============7631858025259860631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libksba: PKGV changed from 1.8.1 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libksba: PV changed from "1.8.1" to "1.9.1"
packages/x86-64-v3-poky-linux/libksba: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.8.1.tar.bz2 file://ksba-add-pkgconfig-support.patch file://run-ptest" to "https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.9.1.tar.bz2 file://ksba-add-pkgconfig-support.patch file://run-ptest"
packages/x86-64-v3-poky-linux/libksba/libksba-dbg: PKGV changed from 1.8.1 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-dbg: PV changed from "1.8.1" to "1.9.1"
packages/x86-64-v3-poky-linux/libksba/libksba-dbg: PKGSIZE changed from 1461472 to 1575648 (+8%)
packages/x86-64-v3-poky-linux/libksba/libksba-dbg: FILELIST: removed "/usr/lib/.debug/libksba.so.8.16.1", added "/usr/lib/.debug/libksba.so.8.17.1"
packages/x86-64-v3-poky-linux/libksba/libksba-dev: PKGV changed from 1.8.1 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-dev: PV changed from "1.8.1" to "1.9.1"
packages/x86-64-v3-poky-linux/libksba/libksba-dev: PKGSIZE changed from 34015 to 37672 (+11%)
packages/x86-64-v3-poky-linux/libksba/libksba-doc: PKGV changed from 1.8.1 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-doc: PV changed from "1.8.1" to "1.9.1"
packages/x86-64-v3-poky-linux/libksba/libksba-doc: PKGSIZE changed from 86622 to 87121 (+1%)
packages/x86-64-v3-poky-linux/libksba/libksba-locale: PKGV changed from 1.8.1 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-locale: PV changed from "1.8.1" to "1.9.1"
packages/x86-64-v3-poky-linux/libksba/libksba-ptest: PKGV changed from 1.8.1 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-ptest: PV changed from "1.8.1" to "1.9.1"
packages/x86-64-v3-poky-linux/libksba/libksba-ptest: PKGSIZE changed from 225155 to 247488 (+10%)
packages/x86-64-v3-poky-linux/libksba/libksba-ptest: FILELIST: added "/usr/lib/libksba/ptest/tests/samples/mldsa65-rfc9881.crt /usr/lib/libksba/ptest/tests/samples/mlkem768-np256.pkcs8 /usr/lib/libksba/ptest/tests/samples/mlkem768-np256.crt /usr/lib/libksba/ptest/tests/samples/mldsa87-rfc9881.crt"
packages/x86-64-v3-poky-linux/libksba/libksba-src: PKGV changed from 1.8.1 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-src: PV changed from "1.8.1" to "1.9.1"
packages/x86-64-v3-poky-linux/libksba/libksba-src: PKGSIZE changed from 1013977 to 1092593 (+8%)
packages/x86-64-v3-poky-linux/libksba/libksba-src: FILELIST: directory renamed /usr/src/debug/libksba/1.8.1/tests -> /usr/src/debug/libksba/1.9.1/tests, removed "/usr/src/debug/libksba/1.8.1/src/asn1-constants.h /usr/src/debug/libksba/1.8.1/src/asn1-tables.c /usr/src/debug/libksba/1.8.1/src/der-encoder.h /usr/src/debug/libksba/1.8.1/src/ber-decoder.h /usr/src/debug/libksba/1.8.1/src/ber-decoder.c /usr/src/debug/libksba/1.8.1/src/der-encoder.c /usr/src/debug/libksba/1.8.1/src/asn1-func.c /usr/src/debug/libksba/1.8.1/src/cert.h /usr/src/debug/libksba/1.8.1/src/ksba.h /usr/src/debug/libksba/1.8.1/src/asn1-func.h /usr/src/debug/libksba/1.8.1/src/cert.c /usr/src/debug/libksba/1.8.1/src/ocsp.c /usr/src/debug/libksba/1.8.1/src/reader.h /usr/src/debug/libksba/1.8.1/src/sexp-parse.h /usr/src/debug/libksba/1.8.1/src/visibility.c /usr/src/debug/libksba/1.8.1/src/ocsp.h /usr/src/debug/libksba/1.8.1/src/writer.h /usr/src/debug/libksba/1.8.1/src/oid.c /usr/src/debug/libksba/1.8.1/src/asn1-parse.c 
 /usr/src/debug/libksba/1.8.1/src/reader.c /usr/src/debug/libksba/1.8.1/src/writer.c /usr/src/debug/libksba/1.8.1/src/util.c /usr/src/debug/libksba/1.8.1/src/crl.h /usr/src/debug/libksba/1.8.1/src/crl.c /usr/src/debug/libksba/1.8.1/src/asn1-func2.c /usr/src/debug/libksba/1.8.1/src/util.h /usr/src/debug/libksba/1.8.1/src/cms-parser.c /usr/src/debug/libksba/1.8.1/src/der-builder.h /usr/src/debug/libksba/1.8.1/src/dn.c /usr/src/debug/libksba/1.8.1/src/ber-help.h /usr/src/debug/libksba/1.8.1/src/der-builder.c /usr/src/debug/libksba/1.8.1/src/ber-help.c /usr/src/debug/libksba/1.8.1/src/certreq.c /usr/src/debug/libksba/1.8.1/src/keyinfo.c /usr/src/debug/libksba/1.8.1/src/version.c /usr/src/debug/libksba/1.8.1/src/time.c /usr/src/debug/libksba/1.8.1/src/certreq.h /usr/src/debug/libksba/1.8.1/src/convert.h /usr/src/debug/libksba/1.8.1/src/keyinfo.h /usr/src/debug/libksba/1.8.1/src/stringbuf.h /usr/src/debug/libksba/1.8.1/src/name.c /usr/src/debug/libksba/1.8.1/src/cms.c /usr/src/debug/libksb
 a/1.8.1/src/cms.h", added "/usr/src/debug/libksba/1.9.1/src/asn1-constants.h /usr/src/debug/libksba/1.9.1/src/asn1-tables.c /usr/src/debug/libksba/1.9.1/src/der-encoder.h /usr/src/debug/libksba/1.9.1/src/ber-decoder.h /usr/src/debug/libksba/1.9.1/src/ber-decoder.c /usr/src/debug/libksba/1.9.1/src/der-encoder.c /usr/src/debug/libksba/1.9.1/src/asn1-func.c /usr/src/debug/libksba/1.9.1/src/cert.h /usr/src/debug/libksba/1.9.1/src/ksba.h /usr/src/debug/libksba/1.9.1/src/asn1-func.h /usr/src/debug/libksba/1.9.1/src/cert.c /usr/src/debug/libksba/1.9.1/src/ocsp.c /usr/src/debug/libksba/1.9.1/src/reader.h /usr/src/debug/libksba/1.9.1/src/sexp-parse.h /usr/src/debug/libksba/1.9.1/src/visibility.c /usr/src/debug/libksba/1.9.1/src/ocsp.h /usr/src/debug/libksba/1.9.1/src/writer.h /usr/src/debug/libksba/1.9.1/src/oid.c /usr/src/debug/libksba/1.9.1/src/asn1-parse.c /usr/src/debug/libksba/1.9.1/src/reader.c /usr/src/debug/libksba/1.9.1/src/writer.c /usr/src/debug/libksba/1.9.1/src/util.c /usr/src/d
 ebug/libksba/1.9.1/src/crl.h /usr/src/debug/libksba/1.9.1/src/crl.c /usr/src/debug/libksba/1.9.1/src/asn1-func2.c /usr/src/debug/libksba/1.9.1/src/util.h /usr/src/debug/libksba/1.9.1/src/cms-parser.c /usr/src/debug/libksba/1.9.1/src/der-builder.h /usr/src/debug/libksba/1.9.1/src/der-parser.c /usr/src/debug/libksba/1.9.1/src/dn.c /usr/src/debug/libksba/1.9.1/src/ber-help.h /usr/src/debug/libksba/1.9.1/src/der-builder.c /usr/src/debug/libksba/1.9.1/src/der-parser.h /usr/src/debug/libksba/1.9.1/src/ber-help.c /usr/src/debug/libksba/1.9.1/src/certreq.c /usr/src/debug/libksba/1.9.1/src/keyinfo.c /usr/src/debug/libksba/1.9.1/src/version.c /usr/src/debug/libksba/1.9.1/src/time.c /usr/src/debug/libksba/1.9.1/src/convert.h /usr/src/debug/libksba/1.9.1/src/certreq.h /usr/src/debug/libksba/1.9.1/src/keyinfo.h /usr/src/debug/libksba/1.9.1/src/stringbuf.h /usr/src/debug/libksba/1.9.1/src/name.c /usr/src/debug/libksba/1.9.1/src/cms.c /usr/src/debug/libksba/1.9.1/src/cms.h"
packages/x86-64-v3-poky-linux/libksba/libksba-staticdev: PKGV changed from 1.8.1 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-staticdev: PV changed from "1.8.1" to "1.9.1"
packages/x86-64-v3-poky-linux/libksba/libksba: PKGV changed from 1.8.1 [default] to 1.9.1 [default]
packages/x86-64-v3-poky-linux/libksba/libksba: PV changed from "1.8.1" to "1.9.1"
packages/x86-64-v3-poky-linux/libksba/libksba: PKGSIZE changed from 317529 to 346201 (+9%)
packages/x86-64-v3-poky-linux/libksba/libksba: FILELIST: removed "/usr/lib/libksba.so.8.16.1", added "/usr/lib/libksba.so.8.17.1"
Changes to packages/x86-64-v3-poky-linux/libksba (sysroot):
  /usr/lib/libksba.so.8 changed symlink target from libksba.so.8.16.1 to libksba.so.8.17.1
  /usr/lib/libksba.so changed symlink target from libksba.so.8.16.1 to libksba.so.8.17.1
  /usr/lib/libksba.so.8.16.1 moved to /usr/lib/libksba.so.8.17.1

--===============7631858025259860631==--
