Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DCB2C3ABA4
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:06 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.20172.1744723975362433644
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:32:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=BPEgfPHc;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=cwqfG2yq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019639a719b2-39ba58cd-23b6-49ed-9bde-7d7c0cbe4250-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723974;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YDHQ4DOYi4ivwiTtClLAVnxY2AK0n0piXm9zMMa/WHA=;
	b=BPEgfPHcLvh9RPYIoEmZVF/NUmZOdtRRj8MdQXitt85GvlwiDkW77FaFAXGCtI8l
	G/PCVz9vP134hiVgiDAWeoZRuWOK9XMCqC+ftqRxgnf0E6dc29tK71nN6js8/8/6L7r
	/znJEvYxyw9BrwRwUuJJbBq8yihykRDwscEnrI5o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723974;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YDHQ4DOYi4ivwiTtClLAVnxY2AK0n0piXm9zMMa/WHA=;
	b=cwqfG2yqg+hqqKVb+NOYH2niTVpSyOSp6vh4IYDiv7FnhKXT1jLFtaHrcaiHh53k
	gVUvevAgFUVPF2BfgrOjzRF+puXCoA8T6KmDdOH5JXnGpVcxwyRKZJtMPE8JCb3/mG4
	/MjJlynYSoHy4jLwOmgmCRjwvIgcsKufi1aKSAtw=
Content-Type: multipart/mixed; boundary="===============2244237273290528904=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] perl: upgrading to 5.40.2 FAILED
Message-ID: <0101019639a719b2-39ba58cd-23b6-49ed-9bde-7d7c0cbe4250-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:32:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214873

--===============2244237273290528904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *perl* to *5.40.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-perl-upgrade-5.40.1-5.40.2.patch
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
From 2426c58341460f32307b8e417468094cd81b056f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 07:23:05 +0000
Subject: [PATCH] perl: upgrade 5.40.1 -> 5.40.2

---
 ...his-module-breaks-through-the-perl-wrapper-.patch |  2 +-
 ...Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch |  2 +-
 .../perl/files/0002-Constant-Fix-up-shebang.patch    |  2 +-
 meta/recipes-devtools/perl/files/determinism.patch   |  2 +-
 meta/recipes-devtools/perl/files/encodefix.patch     |  2 +-
 meta/recipes-devtools/perl/files/errno_ver.diff      |  2 +-
 .../recipes-devtools/perl/files/native-perlinc.patch |  2 +-
 .../perl/files/perl-configpm-switch.patch            |  2 +-
 .../recipes-devtools/perl/files/perl-dynloader.patch |  2 +-
 meta/recipes-devtools/perl/perl-ptest.inc            | 12 +++++++++++-
 .../perl/{perl_5.40.1.bb => perl_5.40.2.bb}          |  2 +-
 11 files changed, 21 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/perl/{perl_5.40.1.bb => perl_5.40.2.bb} (99%)

diff --git a/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch b/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
index 2076c61ee0..124fef4e48 100644
--- a/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
+++ b/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
@@ -1,4 +1,4 @@
-From 47cd22cd213d2c5f28e674b12c264dc731682560 Mon Sep 17 00:00:00 2001
+From 1c83100870697e9e82104af2758bbad21163e878 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 5 Jun 2018 14:58:42 +0300
 Subject: [PATCH] Somehow this module breaks through the perl wrapper and
diff --git a/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
index 7e5d08d8db..c62621b931 100644
--- a/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
+++ b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
@@ -1,4 +1,4 @@
-From 322972384e0795be339252f7cf9a318dc759b51e Mon Sep 17 00:00:00 2001
+From e2e6852f33680f18cbb8d677bbc0faecf0bbb27a Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Fri, 18 Feb 2022 09:44:26 +0000
 Subject: [PATCH] cpan/Sys-Syslog/Makefile.PL: Fix _PATH_LOG for deterministic
diff --git a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
index 80986e66da..1f2182482d 100644
--- a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
+++ b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
@@ -1,4 +1,4 @@
-From a02355bdc8cde1115daf101675cdfb707d337bf1 Mon Sep 17 00:00:00 2001
+From 2c6f288406a5ca4f7436595b71e22a6acec4a3f7 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Mon, 17 Jun 2019 10:47:23 -0500
 Subject: [PATCH] Constant: Fix up shebang
diff --git a/meta/recipes-devtools/perl/files/determinism.patch b/meta/recipes-devtools/perl/files/determinism.patch
index bdb9a928bb..cb33a9c580 100644
--- a/meta/recipes-devtools/perl/files/determinism.patch
+++ b/meta/recipes-devtools/perl/files/determinism.patch
@@ -1,4 +1,4 @@
-From 5c4fd57daf125357262aa796057d7be8e78d378e Mon Sep 17 00:00:00 2001
+From 3efe68ebb975536e0e317b721ad712e21ec33087 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 5 Feb 2020 23:54:02 +0000
 Subject: [PATCH] Fixes to make the perl build reproducible:
diff --git a/meta/recipes-devtools/perl/files/encodefix.patch b/meta/recipes-devtools/perl/files/encodefix.patch
index 665699d12d..9b80c9924b 100644
--- a/meta/recipes-devtools/perl/files/encodefix.patch
+++ b/meta/recipes-devtools/perl/files/encodefix.patch
@@ -1,4 +1,4 @@
-From a4e22c7f2a519f24bc8aa89c6677017c0fe13679 Mon Sep 17 00:00:00 2001
+From 67cae59896a78542c056673fcd32c9244e40ade5 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 18 Feb 2020 17:27:26 +0000
 Subject: [PATCH] perl: Fix encode module reproducibility issues
diff --git a/meta/recipes-devtools/perl/files/errno_ver.diff b/meta/recipes-devtools/perl/files/errno_ver.diff
index 477642f457..4d8bc80bfa 100644
--- a/meta/recipes-devtools/perl/files/errno_ver.diff
+++ b/meta/recipes-devtools/perl/files/errno_ver.diff
@@ -1,4 +1,4 @@
-From 9c404d4b1c3607e827fb56b5ae4f8fbbdb52cd0b Mon Sep 17 00:00:00 2001
+From 24de162e7a62f430fa967ab7a2d39ae997aafd4e Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 16 Dec 2005 01:32:14 +1100
 Subject: [PATCH] Remove Errno version check due to upgrade problems with
diff --git a/meta/recipes-devtools/perl/files/native-perlinc.patch b/meta/recipes-devtools/perl/files/native-perlinc.patch
index 7e3e5f6652..53ce113a70 100644
--- a/meta/recipes-devtools/perl/files/native-perlinc.patch
+++ b/meta/recipes-devtools/perl/files/native-perlinc.patch
@@ -1,4 +1,4 @@
-From 9fec62b19a49d1451fd1120c5dc38baf59f73856 Mon Sep 17 00:00:00 2001
+From 510016ee0b79e0d9c5f6a27c0a6fe6ed4fa6a6f6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 30 May 2007 09:33:32 +0000
 Subject: [PATCH] perl: sync with OE
diff --git a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
index 3721277933..c24a5c54f5 100644
--- a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
+++ b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
@@ -1,4 +1,4 @@
-From 7a48538a7e8614a3342151b646d2105c0cb0cdd9 Mon Sep 17 00:00:00 2001
+From eeaa0e6b69e6cab83eb36f8d749a7f74eab2ae72 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sun, 27 May 2007 21:04:11 +0000
 Subject: [PATCH] perl: 5.8.7 -> 5.8.8 (from OE)
diff --git a/meta/recipes-devtools/perl/files/perl-dynloader.patch b/meta/recipes-devtools/perl/files/perl-dynloader.patch
index 5472602d3a..bc16a0b729 100644
--- a/meta/recipes-devtools/perl/files/perl-dynloader.patch
+++ b/meta/recipes-devtools/perl/files/perl-dynloader.patch
@@ -1,4 +1,4 @@
-From 25a26c52c320e699b37a7ad1f4f045bc8aa4cb00 Mon Sep 17 00:00:00 2001
+From 72c145ec3890b38309ce3145130ad75b5f2fd0f1 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard@openedhand.com>
 Date: Sun, 27 May 2007 21:04:11 +0000
 Subject: [PATCH] perl: 5.8.7 -> 5.8.8 (from OE)
diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index 4b4756118c..0830ff5b2a 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -1,6 +1,16 @@
 inherit ptest
 
-SRC_URI += "file://run-ptest \
+SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
+           file://perl-rdepends.txt \
+           file://0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch \
+           file://errno_ver.diff \
+           file://native-perlinc.patch \
+           file://perl-dynloader.patch \
+           file://0002-Constant-Fix-up-shebang.patch \
+           file://determinism.patch \
+           file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
+           file://run-ptest \
+           file://perl-configpm-switch.patch \
            "
 
 DEBUG_PREFIX_MAP_REGEX = "${@'\\|'.join(d.getVar('DEBUG_PREFIX_MAP').split())}"
diff --git a/meta/recipes-devtools/perl/perl_5.40.1.bb b/meta/recipes-devtools/perl/perl_5.40.2.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.40.1.bb
rename to meta/recipes-devtools/perl/perl_5.40.2.bb
index 448fd52ed6..95c230060d 100644
--- a/meta/recipes-devtools/perl/perl_5.40.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.40.2.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "02f8c45bb379ed0c3de7514fad48c714fd46be8f0b536bfd5320050165a1ee26"
+SRC_URI[perl.sha256sum] = "10d4647cfbb543a7f9ae3e5f6851ec49305232ea7621aed24c7cfbb0bef4b70d"
 
 B = "${WORKDIR}/perl-${PV}-build"
 
-- 
2.47.1


--===============2244237273290528904==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-perl-upgrade-5.40.1-5.40.2.patch"

RnJvbSAyNDI2YzU4MzQxNDYwZjMyMzA3YjhlNDE3NDY4MDk0Y2Q4MWIwNTZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMDc6MjM6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
ZXJsOiB1cGdyYWRlIDUuNDAuMSAtPiA1LjQwLjIKCi0tLQogLi4uaGlzLW1vZHVsZS1icmVha3Mt
dGhyb3VnaC10aGUtcGVybC13cmFwcGVyLS5wYXRjaCB8ICAyICstCiAuLi5TeXNsb2ctTWFrZWZp
bGUuUEwtRml4LV9QQVRIX0xPRy1mb3ItZGV0ZXJtLnBhdGNoIHwgIDIgKy0KIC4uLi9wZXJsL2Zp
bGVzLzAwMDItQ29uc3RhbnQtRml4LXVwLXNoZWJhbmcucGF0Y2ggICAgfCAgMiArLQogbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZGV0ZXJtaW5pc20ucGF0Y2ggICB8ICAyICstCiBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9lbmNvZGVmaXgucGF0Y2ggICAgIHwgIDIg
Ky0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2Vycm5vX3Zlci5kaWZmICAgICAg
fCAgMiArLQogLi4uL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9uYXRpdmUtcGVybGluYy5w
YXRjaCB8ICAyICstCiAuLi4vcGVybC9maWxlcy9wZXJsLWNvbmZpZ3BtLXN3aXRjaC5wYXRjaCAg
ICAgICAgICAgIHwgIDIgKy0KIC4uLi9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvcGVybC1k
eW5sb2FkZXIucGF0Y2ggfCAgMiArLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvcGVybC1w
dGVzdC5pbmMgICAgICAgICAgICB8IDEyICsrKysrKysrKysrLQogLi4uL3Blcmwve3BlcmxfNS40
MC4xLmJiID0+IHBlcmxfNS40MC4yLmJifSAgICAgICAgICB8ICAyICstCiAxMSBmaWxlcyBjaGFu
Z2VkLCAyMSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcGVybC97cGVybF81LjQwLjEuYmIgPT4gcGVybF81LjQwLjIuYmJ9ICg5OSUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvMDAwMS1Tb21l
aG93LXRoaXMtbW9kdWxlLWJyZWFrcy10aHJvdWdoLXRoZS1wZXJsLXdyYXBwZXItLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvMDAwMS1Tb21laG93LXRoaXMtbW9kdWxl
LWJyZWFrcy10aHJvdWdoLXRoZS1wZXJsLXdyYXBwZXItLnBhdGNoCmluZGV4IDIwNzZjNjFlZTAu
LjEyNGZlZjRlNDggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVz
LzAwMDEtU29tZWhvdy10aGlzLW1vZHVsZS1icmVha3MtdGhyb3VnaC10aGUtcGVybC13cmFwcGVy
LS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy8wMDAxLVNvbWVo
b3ctdGhpcy1tb2R1bGUtYnJlYWtzLXRocm91Z2gtdGhlLXBlcmwtd3JhcHBlci0ucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIDQ3Y2QyMmNkMjEzZDJjNWYyOGU2NzRiMTJjMjY0ZGM3MzE2ODI1
NjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDFjODMxMDA4NzA2OTdlOWU4MjEwNGFm
Mjc1OGJiYWQyMTE2M2U4NzggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5k
ZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgNSBKdW4gMjAx
OCAxNDo1ODo0MiArMDMwMAogU3ViamVjdDogW1BBVENIXSBTb21laG93IHRoaXMgbW9kdWxlIGJy
ZWFrcyB0aHJvdWdoIHRoZSBwZXJsIHdyYXBwZXIgYW5kCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcGVybC9maWxlcy8wMDAxLWNwYW4tU3lzLVN5c2xvZy1NYWtlZmlsZS5QTC1G
aXgtX1BBVEhfTE9HLWZvci1kZXRlcm0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVy
bC9maWxlcy8wMDAxLWNwYW4tU3lzLVN5c2xvZy1NYWtlZmlsZS5QTC1GaXgtX1BBVEhfTE9HLWZv
ci1kZXRlcm0ucGF0Y2gKaW5kZXggN2U1ZDA4ZDhkYi4uYzYyNjIxYjkzMSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvMDAwMS1jcGFuLVN5cy1TeXNsb2ctTWFr
ZWZpbGUuUEwtRml4LV9QQVRIX0xPRy1mb3ItZGV0ZXJtLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9wZXJsL2ZpbGVzLzAwMDEtY3Bhbi1TeXMtU3lzbG9nLU1ha2VmaWxlLlBMLUZp
eC1fUEFUSF9MT0ctZm9yLWRldGVybS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMzIyOTcy
Mzg0ZTA3OTViZTMzOTI1MmY3Y2Y5YTMxOGRjNzU5YjUxZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gZTJlNjg1MmYzMzY4MGYxOGNiYjhkNjc3YmJjMGZhZWNmMGJiYjI3YSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvYmVydCBZYW5nIDxsaWV6aGkueWFuZ0B3aW5kcml2
ZXIuY29tPgogRGF0ZTogRnJpLCAxOCBGZWIgMjAyMiAwOTo0NDoyNiArMDAwMAogU3ViamVjdDog
W1BBVENIXSBjcGFuL1N5cy1TeXNsb2cvTWFrZWZpbGUuUEw6IEZpeCBfUEFUSF9MT0cgZm9yIGRl
dGVybWluaXN0aWMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVz
LzAwMDItQ29uc3RhbnQtRml4LXVwLXNoZWJhbmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGVybC9maWxlcy8wMDAyLUNvbnN0YW50LUZpeC11cC1zaGViYW5nLnBhdGNoCmluZGV4IDgw
OTg2ZTY2ZGEuLjFmMjE4MjQ4MmQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
ZXJsL2ZpbGVzLzAwMDItQ29uc3RhbnQtRml4LXVwLXNoZWJhbmcucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvMDAwMi1Db25zdGFudC1GaXgtdXAtc2hlYmFuZy5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYTAyMzU1YmRjOGNkZTExMTVkYWYxMDE2NzVjZGZi
NzA3ZDMzN2JmMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMmM2ZjI4ODQwNmE1Y2E0
Zjc0MzY1OTViNzFlMjJhNmFjZWM0YTNmNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IEpvc2h1YSBXYXR0IDxKUEVXaGFja2VyQGdtYWlsLmNvbT4KIERhdGU6IE1vbiwgMTcgSnVuIDIw
MTkgMTA6NDc6MjMgLTA1MDAKIFN1YmplY3Q6IFtQQVRDSF0gQ29uc3RhbnQ6IEZpeCB1cCBzaGVi
YW5nCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9kZXRlcm1p
bmlzbS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2RldGVybWluaXNt
LnBhdGNoCmluZGV4IGJkYjlhOTI4YmIuLmNiMzNhOWM1ODAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2RldGVybWluaXNtLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2RldGVybWluaXNtLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSA1YzRmZDU3ZGFmMTI1MzU3MjYyYWE3OTYwNTdkN2JlOGU3OGQzNzhlIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzZWZlNjhlYmI5NzU1MzZlMGUzMTdiNzIxYWQ3MTJlMjFl
YzMzMDg3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJp
Y2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBXZWQsIDUgRmViIDIwMjAg
MjM6NTQ6MDIgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gRml4ZXMgdG8gbWFrZSB0aGUgcGVybCBi
dWlsZCByZXByb2R1Y2libGU6CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVy
bC9maWxlcy9lbmNvZGVmaXgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxl
cy9lbmNvZGVmaXgucGF0Y2gKaW5kZXggNjY1Njk5ZDEyZC4uOWI4MGM5OTI0YiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZW5jb2RlZml4LnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2VuY29kZWZpeC5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gYTRlMjJjN2YyYTUxOWYyNGJjOGFhODljNjY3NzAxN2MwZmUxMzY3OSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjdjYWU1OTg5NmE3ODU0MmMwNTY2NzNmY2Qz
MmM5MjQ0ZTQwYWRlNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVy
ZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogVHVlLCAxOCBG
ZWIgMjAyMCAxNzoyNzoyNiArMDAwMAogU3ViamVjdDogW1BBVENIXSBwZXJsOiBGaXggZW5jb2Rl
IG1vZHVsZSByZXByb2R1Y2liaWxpdHkgaXNzdWVzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcGVybC9maWxlcy9lcnJub192ZXIuZGlmZiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9wZXJsL2ZpbGVzL2Vycm5vX3Zlci5kaWZmCmluZGV4IDQ3NzY0MmY0NTcuLjRkOGJjODBiZmEg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2Vycm5vX3Zlci5k
aWZmCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2Vycm5vX3Zlci5kaWZm
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5YzQwNGQ0YjFjMzYwN2U4MjdmYjU2YjVhZTRmOGZiYmRi
NTJjZDBiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyNGRlMTYyZTdhNjJmNDMwZmE5
NjdhYjdhMmQzOWFlOTk3YWFmZDRlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQnJl
bmRhbiBPJ0RlYSA8Ym9kQGRlYmlhbi5vcmc+CiBEYXRlOiBGcmksIDE2IERlYyAyMDA1IDAxOjMy
OjE0ICsxMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIFJlbW92ZSBFcnJubyB2ZXJzaW9uIGNoZWNrIGR1
ZSB0byB1cGdyYWRlIHByb2JsZW1zIHdpdGgKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9wZXJsL2ZpbGVzL25hdGl2ZS1wZXJsaW5jLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BlcmwvZmlsZXMvbmF0aXZlLXBlcmxpbmMucGF0Y2gKaW5kZXggN2UzZTVmNjY1Mi4uNTNj
ZTExM2E3MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvbmF0
aXZlLXBlcmxpbmMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMv
bmF0aXZlLXBlcmxpbmMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDlmZWM2MmIxOWE0OWQx
NDUxZmQxMTIwYzVkYzM4YmFmNTlmNzM4NTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDUxMDAxNmVlMGI3OWUwZDljNWY2YTI3YzBhNmZlNmVkNGZhNmE2ZjYgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNv
bT4KIERhdGU6IFdlZCwgMzAgTWF5IDIwMDcgMDk6MzM6MzIgKzAwMDAKIFN1YmplY3Q6IFtQQVRD
SF0gcGVybDogc3luYyB3aXRoIE9FCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cGVybC9maWxlcy9wZXJsLWNvbmZpZ3BtLXN3aXRjaC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9wZXJsL2ZpbGVzL3BlcmwtY29uZmlncG0tc3dpdGNoLnBhdGNoCmluZGV4IDM3MjEyNzc5
MzMuLmMyNGE1YzU0ZjUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2Zp
bGVzL3BlcmwtY29uZmlncG0tc3dpdGNoLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9wZXJsL2ZpbGVzL3BlcmwtY29uZmlncG0tc3dpdGNoLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSA3YTQ4NTM4YTdlODYxNGEzMzQyMTUxYjY0NmQyMTA1YzBjYjBjZGQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSBlZWFhMGU2YjY5ZTZjYWI4M2ViMzZmOGQ3NDlhN2Y3NGVhYjJh
ZTcyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFs
ZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBTdW4sIDI3IE1heSAyMDA3IDIxOjA0OjExICsw
MDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHBlcmw6IDUuOC43IC0+IDUuOC44IChmcm9tIE9FKQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvcGVybC1keW5sb2FkZXIu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9wZXJsLWR5bmxvYWRlci5w
YXRjaAppbmRleCA1NDcyNjAyZDNhLi5iYzE2YTBiNzI5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcGVybC9maWxlcy9wZXJsLWR5bmxvYWRlci5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9wZXJsLWR5bmxvYWRlci5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gMjVhMjZjNTJjMzIwZTY5OWIzN2E3YWQxZjRmMDQ1YmM4YWE0Y2IwMCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNzJjMTQ1ZWMzODkwYjM4MzA5Y2UzMTQ1MTMwYWQ3
NWI1ZjJmZDBmMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGll
IDxyaWNoYXJkQG9wZW5lZGhhbmQuY29tPgogRGF0ZTogU3VuLCAyNyBNYXkgMjAwNyAyMTowNDox
MSArMDAwMAogU3ViamVjdDogW1BBVENIXSBwZXJsOiA1LjguNyAtPiA1LjguOCAoZnJvbSBPRSkK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL3BlcmwtcHRlc3QuaW5jIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvcGVybC1wdGVzdC5pbmMKaW5kZXggNGI0NzU2MTE4
Yy4uMDgzMGZmNWIyYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvcGVy
bC1wdGVzdC5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvcGVybC1wdGVzdC5p
bmMKQEAgLTEsNiArMSwxNiBAQAogaW5oZXJpdCBwdGVzdAogCi1TUkNfVVJJICs9ICJmaWxlOi8v
cnVuLXB0ZXN0IFwKK1NSQ19VUkkgPSAiaHR0cHM6Ly93d3cuY3Bhbi5vcmcvc3JjLzUuMC9wZXJs
LSR7UFZ9LnRhci5nejtuYW1lPXBlcmwgXAorICAgICAgICAgICBmaWxlOi8vcGVybC1yZGVwZW5k
cy50eHQgXAorICAgICAgICAgICBmaWxlOi8vMDAwMS1Tb21laG93LXRoaXMtbW9kdWxlLWJyZWFr
cy10aHJvdWdoLXRoZS1wZXJsLXdyYXBwZXItLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovL2Vy
cm5vX3Zlci5kaWZmIFwKKyAgICAgICAgICAgZmlsZTovL25hdGl2ZS1wZXJsaW5jLnBhdGNoIFwK
KyAgICAgICAgICAgZmlsZTovL3BlcmwtZHlubG9hZGVyLnBhdGNoIFwKKyAgICAgICAgICAgZmls
ZTovLzAwMDItQ29uc3RhbnQtRml4LXVwLXNoZWJhbmcucGF0Y2ggXAorICAgICAgICAgICBmaWxl
Oi8vZGV0ZXJtaW5pc20ucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vMDAwMS1jcGFuLVN5cy1T
eXNsb2ctTWFrZWZpbGUuUEwtRml4LV9QQVRIX0xPRy1mb3ItZGV0ZXJtLnBhdGNoIFwKKyAgICAg
ICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCisgICAgICAgICAgIGZpbGU6Ly9wZXJsLWNvbmZpZ3Bt
LXN3aXRjaC5wYXRjaCBcCiAgICAgICAgICAgICIKIAogREVCVUdfUFJFRklYX01BUF9SRUdFWCA9
ICIke0AnXFx8Jy5qb2luKGQuZ2V0VmFyKCdERUJVR19QUkVGSVhfTUFQJykuc3BsaXQoKSl9Igpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvcGVybF81LjQwLjEuYmIgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJsXzUuNDAuMi5iYgpzaW1pbGFyaXR5IGluZGV4
IDk5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJsXzUuNDAuMS5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvcGVybF81LjQwLjIuYmIKaW5k
ZXggNDQ4ZmQ1MmVkNi4uOTVjMjMwMDYwZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BlcmwvcGVybF81LjQwLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Blcmwv
cGVybF81LjQwLjIuYmIKQEAgLTI1LDcgKzI1LDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtdGFy
Z2V0ID0gIiBcCiAgICAgICAgICAgIGZpbGU6Ly9lbmNvZGVmaXgucGF0Y2ggXAogIgogCi1TUkNf
VVJJW3Blcmwuc2hhMjU2c3VtXSA9ICIwMmY4YzQ1YmIzNzllZDBjM2RlNzUxNGZhZDQ4YzcxNGZk
NDZiZThmMGI1MzZiZmQ1MzIwMDUwMTY1YTFlZTI2IgorU1JDX1VSSVtwZXJsLnNoYTI1NnN1bV0g
PSAiMTBkNDY0N2NmYmI1NDNhN2Y5YWUzZTVmNjg1MWVjNDkzMDUyMzJlYTc2MjFhZWQyNGM3Y2Zi
YjBiZWY0YjcwZCIKIAogQiA9ICIke1dPUktESVJ9L3BlcmwtJHtQVn0tYnVpbGQiCiAKLS0gCjIu
NDcuMQoK

--===============2244237273290528904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1899 entries from dependency cache.
Parsing recipes...done.
Parsing of 928 .bb files complete (927 cached, 1 parsed). 1897 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:964c9c6e2214e9db587f64b1d28812f62f89116a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 538 Local 203 Mirrors 0 Missed 335 Current 245 (37% match, 57% complete)
Removing 63 stale sstate objects for arch qemux86_64...done.
Removing 58 stale sstate objects for arch x86_64...done.
Removing 5 stale sstate objects for arch allarch...done.
Removing 29 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 330 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 358 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 364 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 369 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 375 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 383 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 390 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 393 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 395 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 410 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 419 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 427 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 429 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 433 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 436 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 437 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dpkg-native-1.22.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 443 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_257.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 444 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-5.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 446 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-locale-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 447 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 451 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 457 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 459 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dpkg-native-1.22.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 461 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_257.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 465 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 466 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 473 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 476 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 479 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 480 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 486 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 487 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 488 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.75-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 493 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 495 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 499 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 502 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 505 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 509 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 511 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 513 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 515 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 516 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 519 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 521 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 523 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 524 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 531 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 534 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 545 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 552 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 554 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 558 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_257.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 559 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 564 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 565 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 566 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 568 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 573 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 577 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 580 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 583 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_257.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 585 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 590 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 591 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 594 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 595 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 597 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 601 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 604 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 605 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-78.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 609 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 614 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 615 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 619 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 621 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 624 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_create_spdx_setscene)
NOTE: Running setscene task 625 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 627 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 636 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 642 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 647 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 649 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 653 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 654 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-native-2.13.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 659 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 660 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 661 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 664 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 667 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 668 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 669 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 671 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-native-2.13.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 672 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcrypt-4.4.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 676 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 678 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 681 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 683 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 684 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 686 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 687 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 688 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 690 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 691 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 693 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 698 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 699 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 700 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 701 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 703 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 704 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 707 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 709 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 712 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 717 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 718 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 720 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 726 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 731 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 732 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 736 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 737 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 738 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 742 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 756 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 760 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 762 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 763 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 767 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 768 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.31.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 770 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.40.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perlcross-native-1.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cmake-native-3.31.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-native-0.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perlcross-native-1.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-native-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-native-8.12.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 775 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe cmake-native-3.31.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-native-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-native-3.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe json-c-native-0.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 778 of 783 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-native-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-native-8.12.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 779 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-native-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-native-3.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perlcross-native-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 103 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_recipe_qa)
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 127 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 147 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_fetch)
NOTE: Running task 167 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.31.6.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-native-5.40.2-r0: task do_recipe_qa: Started
NOTE: recipe cmake-native-3.31.6-r0: task do_fetch: Started
NOTE: recipe openssl-native-3.5.0-r0: task do_fetch: Started
NOTE: recipe cmake-native-3.31.6-r0: task do_fetch: Succeeded
NOTE: recipe expat-native-2.7.1-r0: task do_fetch: Started
NOTE: Running task 234 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.31.6.bb:do_unpack)
NOTE: recipe perlcross-native-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-native-3.5.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 781 of 783 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.1.bb:do_recipe_qa_setscene)
NOTE: Running task 238 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_unpack)
NOTE: recipe expat-native-2.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 243 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_unpack)
NOTE: recipe cmake-native-3.31.6-r0: task do_unpack: Started
NOTE: recipe perlcross-native-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 361 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_fetch)
NOTE: recipe openssl-native-3.5.0-r0: task do_unpack: Started
NOTE: recipe expat-native-2.7.1-r0: task do_unpack: Started
NOTE: recipe perlcross-native-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-native-5.40.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 410 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Succeeded
NOTE: Running task 466 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_fetch)
NOTE: Running task 473 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_unpack)
NOTE: Running task 474 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-native-2.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 483 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_patch)
NOTE: Running task 490 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_fetch)
NOTE: recipe perl-native-5.40.2-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-native-5.40.2-r0: task do_fetch: Succeeded
NOTE: Running task 534 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_unpack)
NOTE: Running task 535 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_prepare_recipe_sysroot)
NOTE: Running noexec task 543 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_fetch)
NOTE: Running noexec task 551 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_fetch)
NOTE: Running task 555 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: Running task 557 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe expat-native-2.7.1-r0: task do_patch: Started
NOTE: recipe util-linux-native-2.40.4-r0: task do_fetch: Started
NOTE: Running task 565 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: Running task 567 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_fetch)
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Started
NOTE: Running task 569 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe util-linux-native-2.40.4-r0: task do_fetch: Succeeded
NOTE: Running task 571 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_fetch)
NOTE: recipe expat-native-2.7.1-r0: task do_patch: Succeeded
NOTE: Running task 572 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: Running task 574 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_generate_toolchain_file)
NOTE: recipe perl-native-5.40.2-r0: task do_unpack: Started
NOTE: recipe perl-native-5.40.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 575 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 577 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: recipe expat-2.7.1-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 579 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe gdbm-1.24-r0: task do_fetch: Started
NOTE: Running task 580 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe expat-2.7.1-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_fetch: Succeeded
NOTE: Running task 581 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_unpack)
NOTE: Running task 582 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.40.4-r0: task do_unpack: Started
NOTE: recipe perl-native-5.40.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-native-2.7.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Started
NOTE: recipe openssl-3.5.0-r0: task do_fetch: Started
NOTE: Running task 594 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe expat-native-2.7.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 595 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: Running task 596 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_unpack)
NOTE: recipe expat-2.7.1-r0: task do_unpack: Started
NOTE: recipe xz-5.6.4-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_fetch: Succeeded
NOTE: Running task 597 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 598 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_unpack)
NOTE: Running task 599 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 600 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_patch)
NOTE: recipe gdbm-1.24-r0: task do_unpack: Started
NOTE: recipe curl-native-8.12.1-r0: task do_fetch: Started
NOTE: recipe curl-native-8.12.1-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 605 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_fetch)
NOTE: Running task 606 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe xz-5.6.4-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Started
NOTE: recipe gdbm-1.24-r0: task do_unpack: Succeeded
NOTE: Running task 607 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_patch)
NOTE: recipe expat-2.7.1-r0: task do_patch: Started
NOTE: recipe xz-5.6.4-r0: task do_unpack: Succeeded
NOTE: Running task 608 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_patch)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_fetch: Started
NOTE: recipe gdbm-1.24-r0: task do_patch: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 616 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_fetch)
NOTE: recipe expat-2.7.1-r0: task do_patch: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_patch: Started
NOTE: Running task 617 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_unpack)
NOTE: recipe util-linux-native-2.40.4-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_fetch: Succeeded
NOTE: Running task 618 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_patch)
NOTE: recipe gdbm-1.24-r0: task do_patch: Succeeded
NOTE: Running task 621 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_unpack)
NOTE: recipe xz-5.6.4-r0: task do_patch: Succeeded
NOTE: recipe json-c-native-0.18-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe json-c-native-0.18-r0: task do_fetch: Succeeded
NOTE: recipe curl-native-8.12.1-r0: task do_unpack: Started
NOTE: Running task 630 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: Running task 637 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_unpack)
NOTE: Running task 641 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_generate_toolchain_file)
NOTE: Running task 647 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.40.4-r0: task do_patch: Started
NOTE: recipe expat-2.7.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe openssl-3.5.0-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: Running task 648 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_unpack)
NOTE: recipe json-c-native-0.18-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 649 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe expat-2.7.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 651 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_fetch)
NOTE: recipe json-c-native-0.18-r0: task do_unpack: Succeeded
NOTE: Running task 652 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_patch)
NOTE: recipe openssl-native-3.5.0-r0: task do_unpack: Succeeded
NOTE: recipe perl-native-5.40.2-r0: task do_unpack: Succeeded
NOTE: Running task 653 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_patch)
NOTE: Running task 654 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_patch)
NOTE: recipe openssl-3.5.0-r0: task do_unpack: Started
NOTE: recipe cmake-native-3.31.6-r0: task do_unpack: Succeeded
NOTE: Running task 655 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.31.6.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: Running task 679 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_fetch)
NOTE: recipe json-c-native-0.18-r0: task do_patch: Started
NOTE: recipe cmake-native-3.31.6-r0: task do_patch: Started
NOTE: recipe perl-native-5.40.2-r0: task do_patch: Started
NOTE: recipe openssl-native-3.5.0-r0: task do_patch: Started
NOTE: recipe curl-native-8.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 704 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_patch)
NOTE: recipe json-c-native-0.18-r0: task do_patch: Succeeded
NOTE: Running task 710 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: Running task 711 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_unpack)
NOTE: Running task 713 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_fetch)
NOTE: Running task 720 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_collect_spdx_deps)
NOTE: recipe libxcrypt-4.4.38-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 730 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_fetch)
NOTE: recipe libtirpc-1.3.6-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.7-r0: task do_fetch: Started
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 731 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_fetch)
NOTE: recipe curl-native-8.12.1-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe perl-native-5.40.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe util-linux-native-2.40.4-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_fetch: Started
NOTE: recipe perl-native-5.40.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 745 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_fetch)
NOTE: Running task 746 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_fetch)
NOTE: Running task 748 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_fetch)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_fetch: Succeeded
NOTE: Running task 754 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_fetch: Started
NOTE: recipe openssl-native-3.5.0-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_unpack: Succeeded
NOTE: Running task 757 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_patch)
NOTE: recipe curl-native-8.12.1-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_fetch: Succeeded
NOTE: recipe cmake-native-3.31.6-r0: task do_patch: Succeeded
NOTE: Running task 773 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_generate_toolchain_file)
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Started
NOTE: Running task 779 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_unpack)
NOTE: Running task 781 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_fetch)
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Succeeded
NOTE: Running task 785 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_fetch)
NOTE: Running task 786 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.38-r0: task do_unpack: Started
NOTE: Running task 787 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_unpack)
NOTE: recipe libtirpc-1.3.6-r0: task do_patch: Started
NOTE: recipe python3-3.13.2-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.7-r0: task do_unpack: Started
NOTE: recipe python3-3.13.2-r0: task do_fetch: Succeeded
NOTE: Running task 788 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_unpack)
NOTE: recipe json-c-native-0.18-r0: task do_generate_toolchain_file: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Started
NOTE: recipe libxml2-native-2.13.6-r0: task do_fetch: Started
NOTE: recipe libxml2-native-2.13.6-r0: task do_fetch: Succeeded
NOTE: recipe json-c-native-0.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 789 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_unpack)
NOTE: Running task 791 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_unpack)
NOTE: Running task 792 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_patch)
NOTE: Running task 812 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_unpack)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_unpack: Succeeded
NOTE: Running task 813 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_unpack)
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Started
NOTE: Running task 814 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_patch)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_unpack: Succeeded
NOTE: Running task 815 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_patch)
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Started
NOTE: Running task 816 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_patch)
NOTE: recipe libffi-3.4.7-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_patch: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_patch: Started
NOTE: recipe libxml2-native-2.13.6-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_patch: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Started
NOTE: Running task 851 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_fetch)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_patch: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_patch: Succeeded
NOTE: Running task 853 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_write_config)
NOTE: Running task 854 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_patch)
NOTE: Running task 857 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_fetch)
NOTE: recipe bash-completion-2.16.0-r0: task do_fetch: Started
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: Running task 858 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: recipe bash-completion-2.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 859 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_unpack)
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_patch: Started
NOTE: Running task 862 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_fetch)
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_fetch: Started
NOTE: Running task 863 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_patch)
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Started
NOTE: recipe libpcre2-10.45-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_unpack: Started
NOTE: Running task 866 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_unpack)
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Succeeded
NOTE: Running task 870 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_unpack: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 871 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_patch)
NOTE: Running task 872 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_patch)
NOTE: recipe libpam-1.7.0-r0: task do_patch: Started
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_fetch: Succeeded
NOTE: Running task 875 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_fetch)
NOTE: recipe libpcre2-10.45-r0: task do_unpack: Started
NOTE: Running task 876 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_unpack)
NOTE: recipe libxml2-2.13.6-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.0-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_fetch: Succeeded
NOTE: Running task 877 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_patch)
NOTE: recipe libpam-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 879 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_unpack: Started
NOTE: Running task 881 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_fetch)
NOTE: Running task 886 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: Running task 889 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_unpack)
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe libxml2-native-2.13.6-r0: task do_unpack: Succeeded
NOTE: Running task 891 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_patch)
NOTE: Running task 894 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_write_config)
NOTE: recipe bash-completion-2.16.0-r0: task do_patch: Started
NOTE: recipe openssl-3.5.0-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: recipe util-linux-2.40.4-r0: task do_fetch: Started
NOTE: recipe libxml2-2.13.6-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_fetch: Succeeded
NOTE: Running task 896 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_unpack)
NOTE: Running task 897 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_unpack)
NOTE: Running task 898 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_write_config: Started
NOTE: recipe libxml2-native-2.13.6-r0: task do_patch: Started
NOTE: Running task 921 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_fetch)
NOTE: Running task 923 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_fetch)
NOTE: recipe libpcre2-10.45-r0: task do_unpack: Succeeded
NOTE: Running task 924 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_write_config: Succeeded
NOTE: Running task 927 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_fetch)
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: recipe util-linux-2.40.4-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.45-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-native-2.13.6-r0: task do_patch: Succeeded
NOTE: Running task 928 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: Running task 929 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_fetch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_fetch: Started
NOTE: Running task 941 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_unpack)
NOTE: Running task 942 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_unpack)
NOTE: recipe wayland-1.23.1-r0: task do_fetch: Succeeded
NOTE: Running task 945 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_patch: Succeeded
NOTE: Running task 946 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_patch)
NOTE: Running task 949 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: Running task 952 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_unpack)
NOTE: recipe libpcre2-10.45-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Started
NOTE: Running task 956 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_fetch: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Started
NOTE: Running task 957 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.0.bb:do_patch)
NOTE: Running task 958 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_unpack)
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-78.1.0-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_unpack: Started
NOTE: Running task 959 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb:do_patch)
NOTE: Running task 960 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_patch: Started
NOTE: Running task 963 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_unpack: Started
NOTE: Running task 965 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_unpack)
NOTE: recipe python3-setuptools-78.1.0-r0: task do_patch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Succeeded
NOTE: Running task 966 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_unpack)
NOTE: recipe libxml2-2.13.6-r0: task do_unpack: Succeeded
NOTE: Running task 967 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_unpack)
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Succeeded
NOTE: Running task 968 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_patch)
NOTE: recipe wayland-1.23.1-r0: task do_unpack: Succeeded
NOTE: Running task 969 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_patch)
NOTE: recipe python3-3.13.2-r0: task do_unpack: Succeeded
NOTE: Running task 970 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_patch)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: Running task 971 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_patch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Succeeded
NOTE: Running task 972 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_patch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_unpack: Succeeded
NOTE: Running task 973 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_patch)
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Started
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Started
NOTE: Running task 974 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: recipe libxml2-2.13.6-r0: task do_patch: Started
NOTE: recipe wayland-1.23.1-r0: task do_patch: Started
NOTE: recipe util-linux-2.40.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-78.1.0-r0: task do_patch: Succeeded
NOTE: Running task 975 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_patch)
NOTE: Running task 983 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_write_config)
NOTE: recipe python3-3.13.2-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_patch: Succeeded
NOTE: Running task 985 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_write_config)
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Succeeded
NOTE: Running task 987 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_write_config)
NOTE: recipe wayland-1.23.1-r0: task do_patch: Succeeded
NOTE: Running task 988 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_patch)
NOTE: Running task 993 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_fetch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Started
NOTE: recipe util-linux-2.40.4-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Succeeded
NOTE: Running task 999 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_recipe_qa)
NOTE: Running task 1000 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_write_config)
NOTE: recipe wayland-1.23.1-r0: task do_write_config: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_write_config: Started
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Started
NOTE: Running task 1005 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe base-passwd-3.6.7-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_write_config: Succeeded
NOTE: Running task 1006 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_unpack)
NOTE: Running task 1011 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_write_config: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_unpack: Succeeded
NOTE: Running task 1012 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: Running task 1013 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_patch)
NOTE: recipe perl-5.40.2-r0: task do_recipe_qa: Started
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Started
NOTE: Running task 1015 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_fetch)
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: Running task 1017 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_fetch)
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Succeeded
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: Running task 1021 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1022 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_fetch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1026 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: Running task 1027 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_patch)
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_patch: Started
NOTE: Running task 1028 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_fetch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.84.0-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Succeeded
NOTE: Running task 1035 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: Running task 1036 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_unpack)
NOTE: Running task 1037 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: recipe shadow-4.17.3-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1038 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_unpack)
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_fetch: Started
NOTE: Running task 1039 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_unpack)
NOTE: recipe shadow-4.17.3-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Started
NOTE: Running task 1041 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_fetch)
NOTE: Running task 1042 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: Running task 1044 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1045 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_unpack)
NOTE: recipe util-linux-2.40.4-r0: task do_patch: Succeeded
NOTE: Running task 1062 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_fetch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1064 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_patch: Started
NOTE: recipe perl-5.40.2-r0: task do_fetch: Started
NOTE: recipe shadow-4.17.3-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1065 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.75-r0: task do_fetch: Started
NOTE: Running task 1066 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: Running task 1067 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_unpack)
NOTE: recipe libcap-2.75-r0: task do_fetch: Succeeded
NOTE: Running task 1068 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: recipe initscripts-1.0-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Succeeded
NOTE: Running task 1069 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: Running task 1070 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1071 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: Running task 1072 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1073 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: recipe perl-5.40.2-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: Running task 1074 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1076 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_fetch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Succeeded
NOTE: Running task 1078 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_patch: Succeeded
NOTE: Running task 1079 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: Running task 1081 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_unpack)
NOTE: recipe kmod-34.2-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_fetch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1090 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: Running task 1098 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_unpack)
NOTE: Running task 1099 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: Running task 1100 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: Running task 1102 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.44-r0: task do_unpack: Started
NOTE: Running task 1103 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.84.0-r0: task do_patch: Succeeded
NOTE: Running task 1106 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe libcap-2.75-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 1107 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_unpack)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1116 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_fetch)
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: recipe kmod-34.2-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_patch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1118 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_fetch)
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1119 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: Running task 1120 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: recipe libxkbcommon-1.8.1-r0: task do_unpack: Started
NOTE: recipe libcap-2.75-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_unpack: Succeeded
NOTE: Running task 1121 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_patch)
NOTE: recipe readline-8.2.13-r0: task do_fetch: Started
NOTE: Running task 1123 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_patch)
NOTE: Running task 1125 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Started
NOTE: recipe readline-8.2.13-r0: task do_fetch: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Started
NOTE: Running task 1127 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1129 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_fetch)
NOTE: recipe libcap-2.75-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1130 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe kmod-34.2-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_patch: Started
NOTE: Running task 1131 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.75-r0: task do_patch: Succeeded
NOTE: Running task 1133 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_write_config)
NOTE: Running task 1135 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_257.5-r0: task do_fetch: Started
NOTE: Running task 1136 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1138 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_unpack)
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_fetch: Started
NOTE: Running task 1140 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_unpack)
NOTE: recipe gawk-5.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1148 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_unpack)
NOTE: recipe initscripts-1.0-r0: task do_patch: Started
NOTE: recipe kmod-34.2-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_write_config: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe readline-8.2.13-r0: task do_unpack: Started
NOTE: recipe kmod-34.2-r0: task do_patch: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Started
NOTE: Running task 1158 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.44-r0: task do_write_config: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1171 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe initscripts-1.0-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_257.5-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_unpack: Succeeded
NOTE: Running task 1176 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_unpack)
NOTE: Running task 1177 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1178 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_patch)
NOTE: Running task 1179 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: recipe readline-8.2.13-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Started
NOTE: Running task 1180 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: Running task 1181 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: recipe perl-5.40.2-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1182 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_patch)
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1183 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_patch)
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1184 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1185 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe readline-8.2.13-r0: task do_patch: Started
NOTE: recipe systemd-1_257.5-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_patch: Started
NOTE: recipe gawk-5.3.2-r0: task do_unpack: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.8.1-r0: task do_patch: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1186 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: Running task 1188 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: Running task 1189 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_patch)
NOTE: Running task 1192 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb:do_write_config)
NOTE: Running task 1194 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_write_config)
NOTE: Running task 1195 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: Running task 1200 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running task 1201 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_unpack)
NOTE: Running task 1203 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe perl-5.40.2-r0: task do_patch: Succeeded
NOTE: Running task 1206 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1208 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_warn_musl)
NOTE: Running task 1209 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_write_config)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_write_config: Started
NOTE: recipe gawk-5.3.2-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Started
NOTE: recipe procps-4.0.5-r0: task do_fetch: Started
NOTE: recipe kmod-34.2-r0: task do_write_config: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.8.1-r0: task do_write_config: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1214 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: recipe kmod-34.2-r0: task do_write_config: Succeeded
NOTE: Running task 1215 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: Running task 1216 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: recipe systemd-1_257.5-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_257.5-r0: task do_write_config: Started
NOTE: recipe systemd-1_257.5-r0: task do_warn_musl: Succeeded
NOTE: Running task 1218 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb:do_fetch)
NOTE: recipe initscripts-1.0-r0: task do_compile: Started
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: recipe systemd-1_257.5-r0: task do_write_config: Succeeded
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: recipe procps-4.0.5-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_patch: Succeeded
NOTE: Running task 1229 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_unpack)
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 1234 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: Running task 1235 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: Running task 1240 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_collect_spdx_deps)
NOTE: recipe initscripts-1.0-r0: task do_compile: Succeeded
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1241 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: Running task 1242 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: recipe dpkg-native-1.22.11-r0: task do_fetch: Started
NOTE: Running task 1245 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe procps-4.0.5-r0: task do_unpack: Started
NOTE: recipe perl-5.40.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_install: Started
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_unpack: Started
NOTE: Running task 1247 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: recipe perl-5.40.2-r0: task do_populate_lic: Started
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1248 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_patch)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1249 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_patch)
NOTE: recipe dpkg-native-1.22.11-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_257.5-r0: task do_unpack: Succeeded
NOTE: Running task 1250 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb:do_unpack)
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: Running task 1252 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.5.bb:do_patch)
NOTE: recipe make-4.4.1-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Started
NOTE: recipe perl-5.40.2-r0: task do_populate_lic: Succeeded
NOTE: recipe dpkg-native-1.22.11-r0: task do_unpack: Started
NOTE: recipe systemd-1_257.5-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Succeeded
NOTE: Running task 1254 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_patch)
NOTE: Running task 1255 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_collect_spdx_deps)
NOTE: recipe linux-libc-headers-6.12-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe make-4.4.1-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1257 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: Running task 1258 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_patch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_patch: Succeeded
NOTE: Running noexec task 1260 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_configure)
NOTE: Running noexec task 1261 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_compile)
NOTE: Running task 1262 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_install)
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_patch: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_patch: Started
NOTE: Running task 1263 of 2170 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: recipe systemd-1_257.5-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_install: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe procps-4.0.5-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: recipe dpkg-native-1.22.11-r0: task do_unpack: Succeeded
NOTE: Running task 1268 of 2170 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb:do_patch)
NOTE: recipe initscripts-1.0-r0: task do_install: Succeeded
NOTE: recipe dpkg-native-1.22.11-r0: task do_patch: Started
NOTE: recipe dpkg-native-1.22.11-r0: task do_patch: Succeeded
NOTE: recipe perl-native-5.40.2-r0: task do_patch: Failed
NOTE: recipe linux-libc-headers-6.12-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 1270 tasks of which 1013 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250415072248.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250415072248.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.40.2/temp/log.do_patch.1856050
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: perl-native-5.40.2-r0 do_patch: Applying patch 'perl-configpm-switch.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.40.2/perl-5.40.2'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.40.2/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch perl-configpm-switch.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.40.2/temp/log.do_patch.1856050
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_patch) failed with exit code '1'

--===============2244237273290528904==--

