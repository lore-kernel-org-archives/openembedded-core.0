Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66FFDC61DBD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 05:57:52 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.432.1787896671309462521
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 22:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=kteUC6PO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=YdTs5Yg6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a046f2289e-2b99edaf-9b3f-456e-8877-8540d5f8d79a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787896670;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KcG1Qw5bpvAiapu8DmBZdkDQRBsdR5nPMX9UEj9pmzw=;
	b=kteUC6PON57HI0Ow4vIYFyz6gt2XfaNVtg4fPaeImUje+er+uC/X+fzf4EhYO7r5
	IJcBp6AMQGZv7LDzT2L3DHfYfh/4ffRofFJDfhAuSh00tchjecivatNL3zpQ1KbEG9r
	ewFpxRjEJS/KrzSlhID4WOwCy89qoxygsImsojcQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787896670;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KcG1Qw5bpvAiapu8DmBZdkDQRBsdR5nPMX9UEj9pmzw=;
	b=YdTs5Yg69MAUXGCe/X5wnJC3e+3U+rrDDF1g6sW57ABTtbJIhAncyLO+s76xSuI+
	PIyUJSCUpkoYx1kRfE7cjl2b40raYQOqD7/QaXF04/Vrzip+WZtT1Dx1GiAMv3dKZ+S
	EQtBd0Hio2MdkAJggS1w0JNVygHGxN+Mpy93hTFY=
Content-Type: multipart/mixed; boundary="===============5845518209903387664=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] debianutils: upgrading to 5.24 SUCCEEDED
Message-ID: <010101a046f2289e-2b99edaf-9b3f-456e-8877-8540d5f8d79a-000000@us-west-2.amazonses.com>
Date: Fri, 28 Aug 2026 05:57:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.28-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 05:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244513

--===============5845518209903387664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *debianutils* to *5.24* has Succeeded.

Next steps:
    - apply the patch: git am 0001-debianutils-upgrade-5.23.2-5.24.patch
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
From 3ed24ceea91ff61dacc84f92c5611a0ac7274379 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 28 Aug 2026 05:55:03 +0000
Subject: [PATCH] debianutils: upgrade 5.23.2 -> 5.24

Source: debian/changelog

debianutils (5.24) unstable; urgency=medium

  * d/control: Bump standards version from 4.7.2 to 4.7.4, bump
    debhelper-compat version from 13 to 14, and remove redundant
    field, Rules-Requires-Root: no.
  * acinclude.m4: Update DEBIANUTILS_VERSION to 5.24.
  * run-parts.c: Recognise short option for --debug (Closes: #1131363).
  * run-parts: Add options -A, --after and -B, --before for greater
    flexibility (Closes: #1131375).
  * d/tests/run-parts.test: Extend testing of run-parts for new options.

 -- Ileana Dumitrescu <ileanadumitrescu95@gmail.com>  Thu, 27 Aug 2026 17:54:35 +0300
---
 .../debianutils/{debianutils_5.23.2.bb => debianutils_5.24.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_5.23.2.bb => debianutils_5.24.bb} (97%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.23.2.bb b/meta/recipes-support/debianutils/debianutils_5.24.bb
similarity index 97%
rename from meta/recipes-support/debianutils/debianutils_5.23.2.bb
rename to meta/recipes-support/debianutils/debianutils_5.24.bb
index 06bc4060c9..89522eb82d 100644
--- a/meta/recipes-support/debianutils/debianutils_5.23.2.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.24.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=4b667f30411d21bc8fd7db85d502a8e9
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master;tag=debian/${PV} \
            "
 
-SRCREV = "b999bb0969471d302f1db85e58f17dcb64f274c2"
+SRCREV = "015efec85971f1ce0fcfe6e26180f574846036ca"
 
 inherit autotools update-alternatives
 
-- 
2.47.1


--===============5845518209903387664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="debianutils-changelog.txt"

Changelog for debianutils: 5.23.2 -> 5.24
Source: debian/changelog

debianutils (5.24) unstable; urgency=medium

  * d/control: Bump standards version from 4.7.2 to 4.7.4, bump
    debhelper-compat version from 13 to 14, and remove redundant
    field, Rules-Requires-Root: no.
  * acinclude.m4: Update DEBIANUTILS_VERSION to 5.24.
  * run-parts.c: Recognise short option for --debug (Closes: #1131363).
  * run-parts: Add options -A, --after and -B, --before for greater
    flexibility (Closes: #1131375).
  * d/tests/run-parts.test: Extend testing of run-parts for new options.

 -- Ileana Dumitrescu <ileanadumitrescu95@gmail.com>  Thu, 27 Aug 2026 17:54:35 +0300

--===============5845518209903387664==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-debianutils-upgrade-5.23.2-5.24.patch"

RnJvbSAzZWQyNGNlZWE5MWZmNjFkYWNjODRmOTJjNTYxMWEwYWM3Mjc0Mzc5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjggQXVnIDIwMjYgMDU6NTU6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
ZWJpYW51dGlsczogdXBncmFkZSA1LjIzLjIgLT4gNS4yNAoKU291cmNlOiBkZWJpYW4vY2hhbmdl
bG9nCgpkZWJpYW51dGlscyAoNS4yNCkgdW5zdGFibGU7IHVyZ2VuY3k9bWVkaXVtCgogICogZC9j
b250cm9sOiBCdW1wIHN0YW5kYXJkcyB2ZXJzaW9uIGZyb20gNC43LjIgdG8gNC43LjQsIGJ1bXAK
ICAgIGRlYmhlbHBlci1jb21wYXQgdmVyc2lvbiBmcm9tIDEzIHRvIDE0LCBhbmQgcmVtb3ZlIHJl
ZHVuZGFudAogICAgZmllbGQsIFJ1bGVzLVJlcXVpcmVzLVJvb3Q6IG5vLgogICogYWNpbmNsdWRl
Lm00OiBVcGRhdGUgREVCSUFOVVRJTFNfVkVSU0lPTiB0byA1LjI0LgogICogcnVuLXBhcnRzLmM6
IFJlY29nbmlzZSBzaG9ydCBvcHRpb24gZm9yIC0tZGVidWcgKENsb3NlczogIzExMzEzNjMpLgog
ICogcnVuLXBhcnRzOiBBZGQgb3B0aW9ucyAtQSwgLS1hZnRlciBhbmQgLUIsIC0tYmVmb3JlIGZv
ciBncmVhdGVyCiAgICBmbGV4aWJpbGl0eSAoQ2xvc2VzOiAjMTEzMTM3NSkuCiAgKiBkL3Rlc3Rz
L3J1bi1wYXJ0cy50ZXN0OiBFeHRlbmQgdGVzdGluZyBvZiBydW4tcGFydHMgZm9yIG5ldyBvcHRp
b25zLgoKIC0tIElsZWFuYSBEdW1pdHJlc2N1IDxpbGVhbmFkdW1pdHJlc2N1OTVAZ21haWwuY29t
PiAgVGh1LCAyNyBBdWcgMjAyNiAxNzo1NDozNSArMDMwMAotLS0KIC4uLi9kZWJpYW51dGlscy97
ZGViaWFudXRpbHNfNS4yMy4yLmJiID0+IGRlYmlhbnV0aWxzXzUuMjQuYmJ9ICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2RlYmlhbnV0aWxzL3tkZWJpYW51dGlsc181LjIzLjIuYmIgPT4gZGVi
aWFudXRpbHNfNS4yNC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9kZWJpYW51dGlscy9kZWJpYW51dGlsc181LjIzLjIuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9kZWJpYW51dGlscy9kZWJpYW51dGlsc181LjI0LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2RlYmlhbnV0aWxzL2RlYmlhbnV0aWxzXzUu
MjMuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGViaWFudXRpbHMvZGViaWFu
dXRpbHNfNS4yNC5iYgppbmRleCAwNmJjNDA2MGM5Li44OTUyMmViODJkIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy9kZWJpYW51dGlsc181LjIzLjIuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGViaWFudXRpbHMvZGViaWFudXRpbHNfNS4yNC5iYgpA
QCAtMTEsNyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9kZWJpYW4vY29weXJp
Z2h0O21kNT00YjY2N2YzMDQxMWQyMWJjOGZkN2RiODVkNTAyYThlOQogU1JDX1VSSSA9ICJnaXQ6
Ly9zYWxzYS5kZWJpYW4ub3JnL2RlYmlhbi9kZWJpYW51dGlscy5naXQ7cHJvdG9jb2w9aHR0cHM7
YnJhbmNoPW1hc3Rlcjt0YWc9ZGViaWFuLyR7UFZ9IFwKICAgICAgICAgICAgIgogCi1TUkNSRVYg
PSAiYjk5OWJiMDk2OTQ3MWQzMDJmMWRiODVlNThmMTdkY2I2NGYyNzRjMiIKK1NSQ1JFViA9ICIw
MTVlZmVjODU5NzFmMWNlMGZjZmU2ZTI2MTgwZjU3NDg0NjAzNmNhIgogCiBpbmhlcml0IGF1dG90
b29scyB1cGRhdGUtYWx0ZXJuYXRpdmVzCiAKLS0gCjIuNDcuMQoK

--===============5845518209903387664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/debianutils/debianutils-run-parts: PKGSIZE changed from 27208 to 31368 (+15%)

--===============5845518209903387664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/debianutils/debianutils-dbg: PKGV changed from 5.23.2 [default] to 5.24 [default]
packages/x86-64-v3-poky-linux/debianutils/debianutils-dbg: PV changed from "5.23.2" to "5.24"
packages/x86-64-v3-poky-linux/debianutils/debianutils-dbg: PKGSIZE changed from 94496 to 98248 (+4%)
packages/x86-64-v3-poky-linux/debianutils/debianutils-dev: PKGV changed from 5.23.2 [default] to 5.24 [default]
packages/x86-64-v3-poky-linux/debianutils/debianutils-dev: PV changed from "5.23.2" to "5.24"
packages/x86-64-v3-poky-linux/debianutils/debianutils-doc: PKGV changed from 5.23.2 [default] to 5.24 [default]
packages/x86-64-v3-poky-linux/debianutils/debianutils-doc: PV changed from "5.23.2" to "5.24"
packages/x86-64-v3-poky-linux/debianutils/debianutils-doc: PKGSIZE changed from 14141 to 14911 (+5%)
packages/x86-64-v3-poky-linux/debianutils/debianutils-locale: PKGV changed from 5.23.2 [default] to 5.24 [default]
packages/x86-64-v3-poky-linux/debianutils/debianutils-locale: PV changed from "5.23.2" to "5.24"
packages/x86-64-v3-poky-linux/debianutils/debianutils-run-parts: PKGV changed from 5.23.2 [default] to 5.24 [default]
packages/x86-64-v3-poky-linux/debianutils/debianutils-run-parts: PV changed from "5.23.2" to "5.24"
packages/x86-64-v3-poky-linux/debianutils/debianutils-run-parts: PKGSIZE changed from 27208 to 31368 (+15%)
packages/x86-64-v3-poky-linux/debianutils/debianutils-src: FILELIST: directory renamed /usr/src/debug/debianutils/5.23.2 -> /usr/src/debug/debianutils/5.24
packages/x86-64-v3-poky-linux/debianutils/debianutils-src: PKGV changed from 5.23.2 [default] to 5.24 [default]
packages/x86-64-v3-poky-linux/debianutils/debianutils-src: PV changed from "5.23.2" to "5.24"
packages/x86-64-v3-poky-linux/debianutils/debianutils-src: PKGSIZE changed from 33269 to 35391 (+6%)
packages/x86-64-v3-poky-linux/debianutils/debianutils-staticdev: PKGV changed from 5.23.2 [default] to 5.24 [default]
packages/x86-64-v3-poky-linux/debianutils/debianutils-staticdev: PV changed from "5.23.2" to "5.24"
packages/x86-64-v3-poky-linux/debianutils/debianutils: PKGV changed from 5.23.2 [default] to 5.24 [default]
packages/x86-64-v3-poky-linux/debianutils/debianutils: PV changed from "5.23.2" to "5.24"
packages/x86-64-v3-poky-linux/debianutils: PKGV changed from 5.23.2 [default] to 5.24 [default]
packages/x86-64-v3-poky-linux/debianutils: SRC_URI changed from "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master;tag=debian/5.23.2" to "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master;tag=debian/5.24"
packages/x86-64-v3-poky-linux/debianutils: PV changed from "5.23.2" to "5.24"

--===============5845518209903387664==--

