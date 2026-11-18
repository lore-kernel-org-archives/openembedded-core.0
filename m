Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6703.1794980485794196275
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 21:41:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WBMgqho1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=lEiRvNwO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a1ed2c976a-38667831-7cc1-4d11-9bfa-a231f1c25950-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794980485;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=lstnXOAU2jfDe9Cx7wUR56G9J2u1fBAfXTz48Pr3oSc=;
	b=WBMgqho1H7i/VyWKVkg4du1m92AQPcpSXKtqWUjHHgb2fZVLxRvyKoggpkoHOIe0
	JlTmnoWU1NmmL7ADgBqyjUXK+5hUPuFdJe9YvG3NMk8SvrSCHMc/hfneT5lgR3iZ4zP
	sYXl81274EbfBbWl+50ILlHn7XBLbPHbktXMoZtU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794980485;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=lstnXOAU2jfDe9Cx7wUR56G9J2u1fBAfXTz48Pr3oSc=;
	b=lEiRvNwOC009bfmvv8uH941AV2BLediZoP1Esb+GSzl7+DlWjy9z2fH3uRkC2a45
	avte5pRcyxTnaqYFRbK4QGeU5czIHjpMjNyeW4MPQOIxG/6iQGgp4pZh/AjI3YafLdO
	iyfCAJ0W6SzyAQavZYVshDPUABw6hHXdD64k9Cq0=
Content-Type: multipart/mixed; boundary="===============2031877017138451725=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libksba: upgrading to 1.9.0 SUCCEEDED
Message-ID: <010101a1ed2c976a-38667831-7cc1-4d11-9bfa-a231f1c25950-000000@us-west-2.amazonses.com>
Date: Wed, 18 Nov 2026 05:41:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.18-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 05:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250508

--===============2031877017138451725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libksba* to *1.9.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libksba-upgrade-1.8.1-1.9.0.patch
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
From 66f8bccae8627743af02c85314e3865fe705a8c4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Nov 2026 05:41:18 +0000
Subject: [PATCH] libksba: upgrade 1.8.1 -> 1.9.0

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
 .../libksba/{libksba_1.8.1.bb => libksba_1.9.0.bb}              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libksba/{libksba_1.8.1.bb => libksba_1.9.0.bb} (95%)

diff --git a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
index 1ba19e5c75..a79fd2b740 100644
--- a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
@@ -1,4 +1,4 @@
-From 1d1feec71e364aba1fe9e2608f422e8970bd9e9e Mon Sep 17 00:00:00 2001
+From a1918b12e6a2fd11c9645343c9e00b8e1ada8ad0 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 3 Dec 2012 18:17:31 +0800
 Subject: [PATCH] libksba: add pkgconfig support
diff --git a/meta/recipes-support/libksba/libksba_1.8.1.bb b/meta/recipes-support/libksba/libksba_1.9.0.bb
similarity index 95%
rename from meta/recipes-support/libksba/libksba_1.8.1.bb
rename to meta/recipes-support/libksba/libksba_1.9.0.bb
index ce08fe4426..c0fbeef4f0 100644
--- a/meta/recipes-support/libksba/libksba_1.8.1.bb
+++ b/meta/recipes-support/libksba/libksba_1.9.0.bb
@@ -28,7 +28,7 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "c2f84393011827219ae117131dba8e7684c2bed0961eed11b0642c2acba440b5"
+SRC_URI[sha256sum] = "b070f3da9113df3804379f55e10cd00f0bc4993d5392157fecb5fd174a5d58ce"
 
 do_configure:prepend () {
 	# Else these could be used in preference to those in aclocal-copy
-- 
2.47.1


--===============2031877017138451725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libksba: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.8.1.tar.bz2 file://ksba-add-pkgconfig-support.patch file://run-ptest" to "https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.9.0.tar.bz2 file://ksba-add-pkgconfig-support.patch file://run-ptest"
packages/x86-64-v3-poky-linux/libksba: PKGV changed from 1.8.1 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libksba: PV changed from "1.8.1" to "1.9.0"
packages/x86-64-v3-poky-linux/libksba/libksba-dbg: PKGSIZE changed from 1461472 to 1575648 (+8%)
packages/x86-64-v3-poky-linux/libksba/libksba-dbg: PKGV changed from 1.8.1 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-dbg: FILELIST: removed "/usr/lib/.debug/libksba.so.8.16.1", added "/usr/lib/.debug/libksba.so.8.17.0"
packages/x86-64-v3-poky-linux/libksba/libksba-dbg: PV changed from "1.8.1" to "1.9.0"
packages/x86-64-v3-poky-linux/libksba/libksba-dev: PKGSIZE changed from 34015 to 37672 (+11%)
packages/x86-64-v3-poky-linux/libksba/libksba-dev: PKGV changed from 1.8.1 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-dev: PV changed from "1.8.1" to "1.9.0"
packages/x86-64-v3-poky-linux/libksba/libksba-doc: PKGSIZE changed from 86622 to 87121 (+1%)
packages/x86-64-v3-poky-linux/libksba/libksba-doc: PKGV changed from 1.8.1 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-doc: PV changed from "1.8.1" to "1.9.0"
packages/x86-64-v3-poky-linux/libksba/libksba-locale: PKGV changed from 1.8.1 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-locale: PV changed from "1.8.1" to "1.9.0"
packages/x86-64-v3-poky-linux/libksba/libksba-ptest: PKGSIZE changed from 225155 to 247488 (+10%)
packages/x86-64-v3-poky-linux/libksba/libksba-ptest: PKGV changed from 1.8.1 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-ptest: FILELIST: added "/usr/lib/libksba/ptest/tests/samples/mldsa87-rfc9881.crt /usr/lib/libksba/ptest/tests/samples/mldsa65-rfc9881.crt /usr/lib/libksba/ptest/tests/samples/mlkem768-np256.crt /usr/lib/libksba/ptest/tests/samples/mlkem768-np256.pkcs8"
packages/x86-64-v3-poky-linux/libksba/libksba-ptest: PV changed from "1.8.1" to "1.9.0"
packages/x86-64-v3-poky-linux/libksba/libksba-src: PKGSIZE changed from 1013977 to 1092593 (+8%)
packages/x86-64-v3-poky-linux/libksba/libksba-src: PKGV changed from 1.8.1 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-src: FILELIST: directory renamed /usr/src/debug/libksba/1.8.1/tests -> /usr/src/debug/libksba/1.9.0/tests, removed "/usr/src/debug/libksba/1.8.1/src/cms-parser.c /usr/src/debug/libksba/1.8.1/src/asn1-constants.h /usr/src/debug/libksba/1.8.1/src/stringbuf.h /usr/src/debug/libksba/1.8.1/src/dn.c /usr/src/debug/libksba/1.8.1/src/certreq.c /usr/src/debug/libksba/1.8.1/src/keyinfo.c /usr/src/debug/libksba/1.8.1/src/version.c /usr/src/debug/libksba/1.8.1/src/certreq.h /usr/src/debug/libksba/1.8.1/src/convert.h /usr/src/debug/libksba/1.8.1/src/keyinfo.h /usr/src/debug/libksba/1.8.1/src/oid.c /usr/src/debug/libksba/1.8.1/src/asn1-func.c /usr/src/debug/libksba/1.8.1/src/ksba.h /usr/src/debug/libksba/1.8.1/src/util.h /usr/src/debug/libksba/1.8.1/src/name.c /usr/src/debug/libksba/1.8.1/src/asn1-func.h /usr/src/debug/libksba/1.8.1/src/util.c /usr/src/debug/libksba/1.8.1/src/der-builder.h /usr/src/debug/libksba/1.8.1/src/asn1-tables.c /usr/src/debug/l
 ibksba/1.8.1/src/cms.h /usr/src/debug/libksba/1.8.1/src/ber-decoder.c /usr/src/debug/libksba/1.8.1/src/der-encoder.c /usr/src/debug/libksba/1.8.1/src/der-builder.c /usr/src/debug/libksba/1.8.1/src/ber-decoder.h /usr/src/debug/libksba/1.8.1/src/der-encoder.h /usr/src/debug/libksba/1.8.1/src/cms.c /usr/src/debug/libksba/1.8.1/src/reader.h /usr/src/debug/libksba/1.8.1/src/cert.c /usr/src/debug/libksba/1.8.1/src/time.c /usr/src/debug/libksba/1.8.1/src/writer.h /usr/src/debug/libksba/1.8.1/src/crl.h /usr/src/debug/libksba/1.8.1/src/reader.c /usr/src/debug/libksba/1.8.1/src/writer.c /usr/src/debug/libksba/1.8.1/src/crl.c /usr/src/debug/libksba/1.8.1/src/cert.h /usr/src/debug/libksba/1.8.1/src/asn1-parse.c /usr/src/debug/libksba/1.8.1/src/ocsp.c /usr/src/debug/libksba/1.8.1/src/sexp-parse.h /usr/src/debug/libksba/1.8.1/src/ocsp.h /usr/src/debug/libksba/1.8.1/src/asn1-func2.c /usr/src/debug/libksba/1.8.1/src/visibility.c /usr/src/debug/libksba/1.8.1/src/ber-help.h /usr/src/debug/libksba/1.8
 .1/src/ber-help.c", added "/usr/src/debug/libksba/1.9.0/src/cms-parser.c /usr/src/debug/libksba/1.9.0/src/der-parser.c /usr/src/debug/libksba/1.9.0/src/stringbuf.h /usr/src/debug/libksba/1.9.0/src/der-parser.h /usr/src/debug/libksba/1.9.0/src/dn.c /usr/src/debug/libksba/1.9.0/src/certreq.c /usr/src/debug/libksba/1.9.0/src/keyinfo.c /usr/src/debug/libksba/1.9.0/src/version.c /usr/src/debug/libksba/1.9.0/src/certreq.h /usr/src/debug/libksba/1.9.0/src/convert.h /usr/src/debug/libksba/1.9.0/src/keyinfo.h /usr/src/debug/libksba/1.9.0/src/oid.c /usr/src/debug/libksba/1.9.0/src/asn1-func.c /usr/src/debug/libksba/1.9.0/src/ksba.h /usr/src/debug/libksba/1.9.0/src/util.h /usr/src/debug/libksba/1.9.0/src/name.c /usr/src/debug/libksba/1.9.0/src/asn1-func.h /usr/src/debug/libksba/1.9.0/src/util.c /usr/src/debug/libksba/1.9.0/src/der-builder.h /usr/src/debug/libksba/1.9.0/src/asn1-tables.c /usr/src/debug/libksba/1.9.0/src/cms.h /usr/src/debug/libksba/1.9.0/src/ber-decoder.c /usr/src/debug/libksba
 /1.9.0/src/der-encoder.c /usr/src/debug/libksba/1.9.0/src/der-builder.c /usr/src/debug/libksba/1.9.0/src/ber-decoder.h /usr/src/debug/libksba/1.9.0/src/der-encoder.h /usr/src/debug/libksba/1.9.0/src/cms.c /usr/src/debug/libksba/1.9.0/src/reader.h /usr/src/debug/libksba/1.9.0/src/cert.c /usr/src/debug/libksba/1.9.0/src/time.c /usr/src/debug/libksba/1.9.0/src/writer.h /usr/src/debug/libksba/1.9.0/src/crl.h /usr/src/debug/libksba/1.9.0/src/reader.c /usr/src/debug/libksba/1.9.0/src/writer.c /usr/src/debug/libksba/1.9.0/src/ber-help.h /usr/src/debug/libksba/1.9.0/src/crl.c /usr/src/debug/libksba/1.9.0/src/cert.h /usr/src/debug/libksba/1.9.0/src/asn1-parse.c /usr/src/debug/libksba/1.9.0/src/ocsp.c /usr/src/debug/libksba/1.9.0/src/sexp-parse.h /usr/src/debug/libksba/1.9.0/src/ocsp.h /usr/src/debug/libksba/1.9.0/src/asn1-func2.c /usr/src/debug/libksba/1.9.0/src/visibility.c /usr/src/debug/libksba/1.9.0/src/asn1-constants.h /usr/src/debug/libksba/1.9.0/src/ber-help.c"
packages/x86-64-v3-poky-linux/libksba/libksba-src: PV changed from "1.8.1" to "1.9.0"
packages/x86-64-v3-poky-linux/libksba/libksba-staticdev: PKGV changed from 1.8.1 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libksba/libksba-staticdev: PV changed from "1.8.1" to "1.9.0"
packages/x86-64-v3-poky-linux/libksba/libksba: PKGSIZE changed from 317529 to 346201 (+9%)
packages/x86-64-v3-poky-linux/libksba/libksba: PKGV changed from 1.8.1 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libksba/libksba: FILELIST: removed "/usr/lib/libksba.so.8.16.1", added "/usr/lib/libksba.so.8.17.0"
packages/x86-64-v3-poky-linux/libksba/libksba: PV changed from "1.8.1" to "1.9.0"
Changes to packages/x86-64-v3-poky-linux/libksba (sysroot):
  /usr/lib/libksba.so.8 changed symlink target from libksba.so.8.16.1 to libksba.so.8.17.0
  /usr/lib/libksba.so changed symlink target from libksba.so.8.16.1 to libksba.so.8.17.0
  /usr/lib/libksba.so.8.16.1 moved to /usr/lib/libksba.so.8.17.0

--===============2031877017138451725==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libksba-upgrade-1.8.1-1.9.0.patch"

RnJvbSA2NmY4YmNjYWU4NjI3NzQzYWYwMmM4NTMxNGUzODY1ZmU3MDVhOGM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggTm92IDIwMjYgMDU6NDE6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJrc2JhOiB1cGdyYWRlIDEuOC4xIC0+IDEuOS4wCgpSZWxlYXNlIDEuOS4wLgpBZGQgc3VwcG9y
dCB0byBjcmVhdGUgYSBjb21wb3NpdGUgTUwtS0VNIGNlcnRpZmljYXRlLgpBZGQgYSBzYW1wbGUg
Y2VydGlmaWNhdGUgZm9yIENvbXBvc2l0ZSBNTC1LRU0uCkFkZCBmbGFncyB0byBFZDI1NTE5IGFu
ZCBDdXJ2ZTI1NTE5IHB1YmxpYyBrZXlzLgpGaXggYXBwZW5kX3VjczJfdmFsdWUuClN1cHBvcnQg
d3JpdGluZyBjb21wb3NpdGUgTUwtS0VNIGVucnlwdGVkIGRhdGEuCk1ha2UgdGhlIG5ldyBETiBw
YXJzZXIgdXNhYmxlIGZvciBub24tc3RhbmRhbG9uZSBETnMuCkltcHJvdmUgdGhlIEROIHBhcnNl
ci4KTmV3IGZ1bmN0aW9uIGtzYmFfcGFyc2VyX2dldF90YWcuCk1pbm9yIGNvZGUgcmVmYWN0b3Jp
bmcgZm9yIHRoZSBETiBwYXJzZXIuCkZpeCBnZXR0aW5nIGNvbXBvc2l0ZSBNTC1LRU0ga2V5aW5m
by4KRml4IGFuIGFzc2VydGlvbiBmYWlsdXJlIGluIHBhcnNpbmcgYW4gT0NTUCByZXNwb25zZS4K
TmV3IGZ1bmN0aW9uIGtzYmFfY21zX3ZlcmJvc2l0eS4KTmV3IEFQSSBrc2JhX2Ntc19nZXRfcmVj
cF9pZGVudCBhbmQgc3VwcG9ydCBjb21wb3NpdGUgTUwtS0VNLgpBZGQgbmV3IGhlbHBlciBmdW5j
dGlvbnMgYW5kIHJlcGxhY2Ugc29tZSBjb2RlLgpOZXcgc2V0IG9mIHB1YmxpYyBmdW5jdGlvbnMg
dG8gcGFyc2UgREVSIGRhdGEuCkFsbG93IE1MLURTQSBDTVMgc2lnbmF0dXJlIGNyZWF0aW9uLgpB
ZGQgc3VwcG9ydCBNTC1EU0EgYXMgc3BlY2lmaWVkIGJ5IFJGQy05ODgxLgpGaXggX2tzYmFfYXNu
X2V4cGFuZF90cmVlIHdpdGggY2FjaGUgdGFibGUuCkZpeCBjbGVhbnVwIHdpdGggcmVsZWFzZV9v
Y3NwX2V4dGVuc2lvbnMuCkZpeCBhdHRyaWJ1dGUgdG8gc3RyaW5nIGZvciBVQ1M0IGFuZCBVQ1My
LgpGaXggYXR0cmlidXRlIHRvIHN0cmluZyBPT0IgZm9yIFVDUzIgYW5kIFVDUzQuCkZpeCBhdHRy
aWJ1dGUgdG8gc3RyaW5nIGZvciBVQ1MyIGFuZCBVQ1M0IGZvciBhIHNwYWNlIGF0IHRoZSBlbmQu
CkZpeCBhdHRyaWJ1dGUgdG8gc3RyaW5nIGZvciBlc2NhcGluZyBhIHNwYWNlIGF0IHRoZSBlbmQu
CmJ1aWxkOiBVc2UgQEZHUkVQQCBieSBjb25maWd1cmUgZm9yIGtzYmEtY29uZmlnLgotLS0KIC4u
Li9saWJrc2JhL2xpYmtzYmEva3NiYS1hZGQtcGtnY29uZmlnLXN1cHBvcnQucGF0Y2ggICAgICAg
ICAgICB8IDIgKy0KIC4uLi9saWJrc2JhL3tsaWJrc2JhXzEuOC4xLmJiID0+IGxpYmtzYmFfMS45
LjAuYmJ9ICAgICAgICAgICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmtzYmEv
e2xpYmtzYmFfMS44LjEuYmIgPT4gbGlia3NiYV8xLjkuMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJrc2JhL2xpYmtzYmEva3NiYS1hZGQtcGtnY29uZmln
LXN1cHBvcnQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJrc2JhL2xpYmtzYmEva3Ni
YS1hZGQtcGtnY29uZmlnLXN1cHBvcnQucGF0Y2gKaW5kZXggMWJhMTllNWM3NS4uYTc5ZmQyYjc0
MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlia3NiYS9saWJrc2JhL2tzYmEt
YWRkLXBrZ2NvbmZpZy1zdXBwb3J0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YmtzYmEvbGlia3NiYS9rc2JhLWFkZC1wa2djb25maWctc3VwcG9ydC5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gMWQxZmVlYzcxZTM2NGFiYTFmZTllMjYwOGY0MjJlODk3MGJkOWU5ZSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYTE5MThiMTJlNmEyZmQxMWM5NjQ1MzQzYzllMDBi
OGUxYWRhOGFkMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoZW4gUWkgPFFpLkNo
ZW5Ad2luZHJpdmVyLmNvbT4KIERhdGU6IE1vbiwgMyBEZWMgMjAxMiAxODoxNzozMSArMDgwMAog
U3ViamVjdDogW1BBVENIXSBsaWJrc2JhOiBhZGQgcGtnY29uZmlnIHN1cHBvcnQKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmtzYmEvbGlia3NiYV8xLjguMS5iYiBiL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYmtzYmEvbGlia3NiYV8xLjkuMC5iYgpzaW1pbGFyaXR5IGluZGV4
IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJrc2JhL2xpYmtzYmFfMS44
LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmtzYmEvbGlia3NiYV8xLjku
MC5iYgppbmRleCBjZTA4ZmU0NDI2Li5jMGZiZWVmNGYwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9saWJrc2JhL2xpYmtzYmFfMS44LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGlia3NiYS9saWJrc2JhXzEuOS4wLmJiCkBAIC0yOCw3ICsyOCw3IEBAIFNSQ19VUkkg
PSAiJHtHTlVQR19NSVJST1J9LyR7QlBOfS8ke0JQTn0tJHtQVn0udGFyLmJ6MiBcCiAgICAgICAg
ICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJjMmY4NDM5MzAxMTgyNzIxOWFlMTE3MTMxZGJhOGU3Njg0YzJiZWQwOTYxZWVkMTFiMDY0
MmMyYWNiYTQ0MGI1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImIwNzBmM2RhOTExM2RmMzgwNDM3
OWY1NWUxMGNkMDBmMGJjNDk5M2Q1MzkyMTU3ZmVjYjVmZDE3NGE1ZDU4Y2UiCiAKIGRvX2NvbmZp
Z3VyZTpwcmVwZW5kICgpIHsKIAkjIEVsc2UgdGhlc2UgY291bGQgYmUgdXNlZCBpbiBwcmVmZXJl
bmNlIHRvIHRob3NlIGluIGFjbG9jYWwtY29weQotLSAKMi40Ny4xCgo=

--===============2031877017138451725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libksba/libksba-dev: PKGSIZE changed from 34015 to 37672 (+11%)
packages/x86-64-v3-poky-linux/libksba/libksba-ptest: FILELIST: added "/usr/lib/libksba/ptest/tests/samples/mldsa65-rfc9881.crt /usr/lib/libksba/ptest/tests/samples/mldsa87-rfc9881.crt /usr/lib/libksba/ptest/tests/samples/mlkem768-np256.pkcs8 /usr/lib/libksba/ptest/tests/samples/mlkem768-np256.crt"
packages/x86-64-v3-poky-linux/libksba/libksba: FILELIST: removed "/usr/lib/libksba.so.8.16.1", added "/usr/lib/libksba.so.8.17.0"
Changes to packages/x86-64-v3-poky-linux/libksba (sysroot):
  /usr/lib/libksba.so.8 changed symlink target from libksba.so.8.16.1 to libksba.so.8.17.0
  /usr/lib/libksba.so changed symlink target from libksba.so.8.16.1 to libksba.so.8.17.0
  /usr/lib/libksba.so.8.16.1 moved to /usr/lib/libksba.so.8.17.0

--===============2031877017138451725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libksba-changelog.txt"

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

--===============2031877017138451725==--
