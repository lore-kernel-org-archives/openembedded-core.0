Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C102CD98F0
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 05:32:25 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9058.1781674308967337609
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 22:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OLeBAcEa;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=wycQ2faf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019ed410721c-e0916fab-ee8d-4f27-89c6-c202e0945336-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781674308;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5EZSljEO2ht2xjHTl1aDo/P4QNCp419Ia0Xe1jjuxa8=;
	b=OLeBAcEaM5qzyjSbkP/r9GY/QnGuKDYQOUFzwmLlui4uN/XG5anPvkBUvft/0Wf0
	BshTOk0iU+JoDuhmRYPnQD9JzP0H/FFYmmpbz4mmmFVSOJboNcYf3aRgkpnySPtdNCk
	H4PfvieGc0vdDKbBoLESaX5UZpD6H2TkDNjp8798=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781674308;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5EZSljEO2ht2xjHTl1aDo/P4QNCp419Ia0Xe1jjuxa8=;
	b=wycQ2fafA90IUnjjfbvkmekppTQZDWQdcr9QB2fslHiFmzsalycUA1xEJWOlWsih
	nyVqBQQG6fKl8L4cjvtJqJGx0SJkZQlKiCDPV7eqdFK0rCJKXUjQ4Kr1gdeS7RbR7xy
	581UPOaCbBq82yYjp6G+x2cR3WuzH/M50seVVMQw=
Content-Type: multipart/mixed; boundary="===============1320895766948446016=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lsof: upgrading to 4.99.7 SUCCEEDED
Message-ID: <0101019ed410721c-e0916fab-ee8d-4f27-89c6-c202e0945336-000000@us-west-2.amazonses.com>
Date: Wed, 17 Jun 2026 05:31:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.17-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 05:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238974

--===============1320895766948446016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lsof* to *4.99.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lsof-upgrade-4.99.6-4.99.7.patch
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
From 0035f03fc79fde3fa08659cf318a4276ed69ff34 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 17 Jun 2026 05:22:47 +0000
Subject: [PATCH] lsof: upgrade 4.99.6 -> 4.99.7

---
 .../recipes-extended/lsof/files/remove-host-information.patch | 4 ++--
 meta/recipes-extended/lsof/{lsof_4.99.6.bb => lsof_4.99.7.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/lsof/{lsof_4.99.6.bb => lsof_4.99.7.bb} (93%)

diff --git a/meta/recipes-extended/lsof/files/remove-host-information.patch b/meta/recipes-extended/lsof/files/remove-host-information.patch
index 1f2b4afa69..e93197e261 100644
--- a/meta/recipes-extended/lsof/files/remove-host-information.patch
+++ b/meta/recipes-extended/lsof/files/remove-host-information.patch
@@ -1,4 +1,4 @@
-From 4f05492ac07a7bbaf06dd8265b9cba329e1b53e9 Mon Sep 17 00:00:00 2001
+From 0873414e87d04561e531418a3a3c0f1574f31773 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Wed, 30 Aug 2017 15:05:16 +0800
 Subject: [PATCH] lsof: remove host information from version.h
@@ -42,7 +42,7 @@ index aac0b80..2e635a5 100644
  
  #endif
 diff --git a/lib/dialects/linux/Makefile b/lib/dialects/linux/Makefile
-index f8adaa6..7a79ca7 100644
+index 53bfc97..8512e36 100644
 --- a/lib/dialects/linux/Makefile
 +++ b/lib/dialects/linux/Makefile
 @@ -83,64 +83,17 @@ ${LIB}: FRC
diff --git a/meta/recipes-extended/lsof/lsof_4.99.6.bb b/meta/recipes-extended/lsof/lsof_4.99.7.bb
similarity index 93%
rename from meta/recipes-extended/lsof/lsof_4.99.6.bb
rename to meta/recipes-extended/lsof/lsof_4.99.7.bb
index 853924fd21..1aad09275c 100644
--- a/meta/recipes-extended/lsof/lsof_4.99.6.bb
+++ b/meta/recipes-extended/lsof/lsof_4.99.7.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a48ac97a8550eff12395a2c0d6151510"
 
 SRC_URI = "git://github.com/lsof-org/lsof;branch=master;protocol=https;tag=${PV} \
            file://remove-host-information.patch"
-SRCREV = "b173315c8f94bf61d52094857ea3fe7d0f5aaff9"
+SRCREV = "646395f8e893edb5572405b2311a079f55f269f2"
 
 inherit update-alternatives autotools pkgconfig manpages
 PACKAGECONFIG[manpages] = ""
-- 
2.47.1


--===============1320895766948446016==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lsof-upgrade-4.99.6-4.99.7.patch"

RnJvbSAwMDM1ZjAzZmM3OWZkZTNmYTA4NjU5Y2YzMThhNDI3NmVkNjlmZjM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTcgSnVuIDIwMjYgMDU6MjI6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
c29mOiB1cGdyYWRlIDQuOTkuNiAtPiA0Ljk5LjcKCi0tLQogLi4uL3JlY2lwZXMtZXh0ZW5kZWQv
bHNvZi9maWxlcy9yZW1vdmUtaG9zdC1pbmZvcm1hdGlvbi5wYXRjaCB8IDQgKystLQogbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2xzb2Yve2xzb2ZfNC45OS42LmJiID0+IGxzb2ZfNC45OS43LmJifSB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29mL3tsc29mXzQuOTkuNi5iYiA9PiBsc29m
XzQuOTkuNy5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHNv
Zi9maWxlcy9yZW1vdmUtaG9zdC1pbmZvcm1hdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9sc29mL2ZpbGVzL3JlbW92ZS1ob3N0LWluZm9ybWF0aW9uLnBhdGNoCmluZGV4IDFmMmI0
YWZhNjkuLmU5MzE5N2UyNjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29m
L2ZpbGVzL3JlbW92ZS1ob3N0LWluZm9ybWF0aW9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9sc29mL2ZpbGVzL3JlbW92ZS1ob3N0LWluZm9ybWF0aW9uLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSA0ZjA1NDkyYWMwN2E3YmJhZjA2ZGQ4MjY1YjljYmEzMjllMWI1M2U5IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwODczNDE0ZTg3ZDA0NTYxZTUzMTQxOGEzYTNj
MGYxNTc0ZjMxNzczIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24g
PHJvc3MuYnVydG9uQGFybS5jb20+CiBEYXRlOiBXZWQsIDMwIEF1ZyAyMDE3IDE1OjA1OjE2ICsw
ODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxzb2Y6IHJlbW92ZSBob3N0IGluZm9ybWF0aW9uIGZyb20g
dmVyc2lvbi5oCkBAIC00Miw3ICs0Miw3IEBAIGluZGV4IGFhYzBiODAuLjJlNjM1YTUgMTAwNjQ0
CiAgCiAgI2VuZGlmCiBkaWZmIC0tZ2l0IGEvbGliL2RpYWxlY3RzL2xpbnV4L01ha2VmaWxlIGIv
bGliL2RpYWxlY3RzL2xpbnV4L01ha2VmaWxlCi1pbmRleCBmOGFkYWE2Li43YTc5Y2E3IDEwMDY0
NAoraW5kZXggNTNiZmM5Ny4uODUxMmUzNiAxMDA2NDQKIC0tLSBhL2xpYi9kaWFsZWN0cy9saW51
eC9NYWtlZmlsZQogKysrIGIvbGliL2RpYWxlY3RzL2xpbnV4L01ha2VmaWxlCiBAQCAtODMsNjQg
KzgzLDE3IEBAICR7TElCfTogRlJDCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
bHNvZi9sc29mXzQuOTkuNi5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29mL2xzb2ZfNC45
OS43LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRl
bmRlZC9sc29mL2xzb2ZfNC45OS42LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
bHNvZi9sc29mXzQuOTkuNy5iYgppbmRleCA4NTM5MjRmZDIxLi4xYWFkMDkyNzVjIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHNvZi9sc29mXzQuOTkuNi5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbHNvZi9sc29mXzQuOTkuNy5iYgpAQCAtOCw3ICs4LDcgQEAgTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YTQ4YWM5N2E4NTUwZWZmMTIzOTVh
MmMwZDYxNTE1MTAiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9sc29mLW9yZy9sc29m
O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHM7dGFnPSR7UFZ9IFwKICAgICAgICAgICAgZmls
ZTovL3JlbW92ZS1ob3N0LWluZm9ybWF0aW9uLnBhdGNoIgotU1JDUkVWID0gImIxNzMzMTVjOGY5
NGJmNjFkNTIwOTQ4NTdlYTNmZTdkMGY1YWFmZjkiCitTUkNSRVYgPSAiNjQ2Mzk1ZjhlODkzZWRi
NTU3MjQwNWIyMzExYTA3OWY1NWYyNjlmMiIKIAogaW5oZXJpdCB1cGRhdGUtYWx0ZXJuYXRpdmVz
IGF1dG90b29scyBwa2djb25maWcgbWFucGFnZXMKIFBBQ0tBR0VDT05GSUdbbWFucGFnZXNdID0g
IiIKLS0gCjIuNDcuMQoK

--===============1320895766948446016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/lsof: PV changed from "4.99.6" to "4.99.7"
packages/x86-64-v3-poky-linux/lsof: SRC_URI changed from "git://github.com/lsof-org/lsof;branch=master;protocol=https;tag=4.99.6 file://remove-host-information.patch" to "git://github.com/lsof-org/lsof;branch=master;protocol=https;tag=4.99.7 file://remove-host-information.patch"
packages/x86-64-v3-poky-linux/lsof: PKGV changed from 4.99.6 [default] to 4.99.7 [default]
packages/x86-64-v3-poky-linux/lsof/lsof-dbg: PKGSIZE changed from 1174448 to 1230944 (+5%)
packages/x86-64-v3-poky-linux/lsof/lsof-dbg: PV changed from "4.99.6" to "4.99.7"
packages/x86-64-v3-poky-linux/lsof/lsof-dbg: PKGV changed from 4.99.6 [default] to 4.99.7 [default]
packages/x86-64-v3-poky-linux/lsof/lsof-dev: PKGSIZE changed from 28442 to 28491 (+0%)
packages/x86-64-v3-poky-linux/lsof/lsof-dev: PV changed from "4.99.6" to "4.99.7"
packages/x86-64-v3-poky-linux/lsof/lsof-dev: PKGV changed from 4.99.6 [default] to 4.99.7 [default]
packages/x86-64-v3-poky-linux/lsof/lsof-doc: PKGSIZE changed from 125818 to 127543 (+1%)
packages/x86-64-v3-poky-linux/lsof/lsof-doc: PV changed from "4.99.6" to "4.99.7"
packages/x86-64-v3-poky-linux/lsof/lsof-doc: PKGV changed from 4.99.6 [default] to 4.99.7 [default]
packages/x86-64-v3-poky-linux/lsof/lsof-locale: PV changed from "4.99.6" to "4.99.7"
packages/x86-64-v3-poky-linux/lsof/lsof-locale: PKGV changed from 4.99.6 [default] to 4.99.7 [default]
packages/x86-64-v3-poky-linux/lsof/lsof-src: PKGSIZE changed from 992042 to 1010909 (+2%)
packages/x86-64-v3-poky-linux/lsof/lsof-src: PV changed from "4.99.6" to "4.99.7"
packages/x86-64-v3-poky-linux/lsof/lsof-src: PKGV changed from 4.99.6 [default] to 4.99.7 [default]
packages/x86-64-v3-poky-linux/lsof/lsof-src: FILELIST: directory renamed /usr/src/debug/lsof/4.99.6/lib -> /usr/src/debug/lsof/4.99.7/lib, directory renamed /usr/src/debug/lsof/4.99.6/include -> /usr/src/debug/lsof/4.99.7/include, directory renamed /usr/src/debug/lsof/4.99.6/src -> /usr/src/debug/lsof/4.99.7/src, directory renamed /usr/src/debug/lsof/4.99.6/src/dialects/linux -> /usr/src/debug/lsof/4.99.7/src/dialects/linux, removed "/usr/src/debug/lsof/4.99.6/lib/dialects/linux/dmnt.c /usr/src/debug/lsof/4.99.6/lib/dialects/linux/dfile.c /usr/src/debug/lsof/4.99.6/lib/dialects/linux/dstore.c /usr/src/debug/lsof/4.99.6/lib/dialects/linux/dproto.h /usr/src/debug/lsof/4.99.6/lib/dialects/linux/dsock.c /usr/src/debug/lsof/4.99.6/lib/dialects/linux/dlsof.h /usr/src/debug/lsof/4.99.6/lib/dialects/linux/dproc.c /usr/src/debug/lsof/4.99.6/lib/dialects/linux/dnode.c", added "/usr/src/debug/lsof/4.99.7/lib/dialects/linux/dmnt.c /usr/src/debug/lsof/4.99.7/lib/dialects/linux/dfile.c /usr/src/de
 bug/lsof/4.99.7/lib/dialects/linux/dstore.c /usr/src/debug/lsof/4.99.7/lib/dialects/linux/dproto.h /usr/src/debug/lsof/4.99.7/lib/dialects/linux/dsock.c /usr/src/debug/lsof/4.99.7/lib/dialects/linux/dlsof.h /usr/src/debug/lsof/4.99.7/lib/dialects/linux/dproc.c /usr/src/debug/lsof/4.99.7/lib/dialects/linux/dnode.c /usr/src/debug/lsof/4.99.7/lib/dialects/linux/dlsof.c"
packages/x86-64-v3-poky-linux/lsof/lsof-staticdev: PV changed from "4.99.6" to "4.99.7"
packages/x86-64-v3-poky-linux/lsof/lsof-staticdev: PKGV changed from 4.99.6 [default] to 4.99.7 [default]
packages/x86-64-v3-poky-linux/lsof/lsof: PKGSIZE changed from 358832 to 371056 (+3%)
packages/x86-64-v3-poky-linux/lsof/lsof: PV changed from "4.99.6" to "4.99.7"
packages/x86-64-v3-poky-linux/lsof/lsof: PKGV changed from 4.99.6 [default] to 4.99.7 [default]

--===============1320895766948446016==--

