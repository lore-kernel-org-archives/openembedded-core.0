Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C6FEC3DA4A
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:27 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.7055.1740828325278188373
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=jn7+vpel;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=FenPZ971;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010195517432db-7335f8e1-a3d8-418e-897f-77b4c1b47e7d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Xs0vIgmu6AOA4G3R0sQPbKf7fDsEzLmp8JpVgiQvr8U=;
	b=jn7+vpeleWuX0zZ1i5FoTI8SX96cLirgURkyEfD/ntZhx87hAPVMfWxTxq0rfCCl
	/cedGGsWPwTUD1Pr7iHzLV1saivIzsWWU1KhZkQNz/IBAD6JJ2mZUj7JLD4uwYXABTf
	/ryEPFYV/7GgG13FB3Yh8BWBpypCXVXoBmBtsPEM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Xs0vIgmu6AOA4G3R0sQPbKf7fDsEzLmp8JpVgiQvr8U=;
	b=FenPZ971+eaqL0hinyjUznVATYICZNWge/lmbp3co1OxFVRDH+dqa0wgH09ryzGQ
	+6E+uTK3j0yi1gUjG9vk4aPPxsRwSll/oLSBUhBWncYq7jzgG9EkMSXCZDokaQbfb4L
	kPUb0hrxXTx9Ip6zbWLESJgrCvI/oE3yB4kSIBu8=
Content-Type: multipart/mixed; boundary="===============3734958246915212200=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] perl: upgrading to 5.40.1 FAILED
Message-ID: <01010195517432db-7335f8e1-a3d8-418e-897f-77b4c1b47e7d-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212122

--===============3734958246915212200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *perl* to *5.40.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-perl-upgrade-5.40.0-5.40.1.patch
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
From 5ae2f3638ad0e2e556f0b0f8c89fc9da47162e6b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 07:46:45 +0000
Subject: [PATCH] perl: upgrade 5.40.0 -> 5.40.1

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
 .../perl/{perl_5.40.0.bb => perl_5.40.1.bb}          |  2 +-
 11 files changed, 21 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/perl/{perl_5.40.0.bb => perl_5.40.1.bb} (99%)

diff --git a/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch b/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
index 2076c61ee0..acb547f5c7 100644
--- a/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
+++ b/meta/recipes-devtools/perl/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
@@ -1,4 +1,4 @@
-From 47cd22cd213d2c5f28e674b12c264dc731682560 Mon Sep 17 00:00:00 2001
+From 821cf3bec7c664a63477537eee4a49aa1a72ebd6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 5 Jun 2018 14:58:42 +0300
 Subject: [PATCH] Somehow this module breaks through the perl wrapper and
diff --git a/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
index 7e5d08d8db..dfd62e02b0 100644
--- a/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
+++ b/meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch
@@ -1,4 +1,4 @@
-From 322972384e0795be339252f7cf9a318dc759b51e Mon Sep 17 00:00:00 2001
+From e542d82308c5d8aec661d89d868d00b214f3f243 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Fri, 18 Feb 2022 09:44:26 +0000
 Subject: [PATCH] cpan/Sys-Syslog/Makefile.PL: Fix _PATH_LOG for deterministic
diff --git a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
index 80986e66da..2cae4ad974 100644
--- a/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
+++ b/meta/recipes-devtools/perl/files/0002-Constant-Fix-up-shebang.patch
@@ -1,4 +1,4 @@
-From a02355bdc8cde1115daf101675cdfb707d337bf1 Mon Sep 17 00:00:00 2001
+From 862606d449d2075becc70cc5e440c8efda50e867 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Mon, 17 Jun 2019 10:47:23 -0500
 Subject: [PATCH] Constant: Fix up shebang
diff --git a/meta/recipes-devtools/perl/files/determinism.patch b/meta/recipes-devtools/perl/files/determinism.patch
index bdb9a928bb..02d88b36fb 100644
--- a/meta/recipes-devtools/perl/files/determinism.patch
+++ b/meta/recipes-devtools/perl/files/determinism.patch
@@ -1,4 +1,4 @@
-From 5c4fd57daf125357262aa796057d7be8e78d378e Mon Sep 17 00:00:00 2001
+From 05cba8c197f7a546e2880462c8aa981b3dea9d9b Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 5 Feb 2020 23:54:02 +0000
 Subject: [PATCH] Fixes to make the perl build reproducible:
diff --git a/meta/recipes-devtools/perl/files/encodefix.patch b/meta/recipes-devtools/perl/files/encodefix.patch
index 665699d12d..c7cf311127 100644
--- a/meta/recipes-devtools/perl/files/encodefix.patch
+++ b/meta/recipes-devtools/perl/files/encodefix.patch
@@ -1,4 +1,4 @@
-From a4e22c7f2a519f24bc8aa89c6677017c0fe13679 Mon Sep 17 00:00:00 2001
+From 5de837d1ef0c444cf534679ced02a9c7f53e42fc Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 18 Feb 2020 17:27:26 +0000
 Subject: [PATCH] perl: Fix encode module reproducibility issues
diff --git a/meta/recipes-devtools/perl/files/errno_ver.diff b/meta/recipes-devtools/perl/files/errno_ver.diff
index 477642f457..b5130eb07a 100644
--- a/meta/recipes-devtools/perl/files/errno_ver.diff
+++ b/meta/recipes-devtools/perl/files/errno_ver.diff
@@ -1,4 +1,4 @@
-From 9c404d4b1c3607e827fb56b5ae4f8fbbdb52cd0b Mon Sep 17 00:00:00 2001
+From 28ac0cacae5b8686d11fef595aabf541e6c11ffc Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 16 Dec 2005 01:32:14 +1100
 Subject: [PATCH] Remove Errno version check due to upgrade problems with
diff --git a/meta/recipes-devtools/perl/files/native-perlinc.patch b/meta/recipes-devtools/perl/files/native-perlinc.patch
index 7e3e5f6652..73d3c2de49 100644
--- a/meta/recipes-devtools/perl/files/native-perlinc.patch
+++ b/meta/recipes-devtools/perl/files/native-perlinc.patch
@@ -1,4 +1,4 @@
-From 9fec62b19a49d1451fd1120c5dc38baf59f73856 Mon Sep 17 00:00:00 2001
+From 182b6e595c426668245e06f07a39e74d18e27c3b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 30 May 2007 09:33:32 +0000
 Subject: [PATCH] perl: sync with OE
diff --git a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
index 3721277933..bc81afb477 100644
--- a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
+++ b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
@@ -1,4 +1,4 @@
-From 7a48538a7e8614a3342151b646d2105c0cb0cdd9 Mon Sep 17 00:00:00 2001
+From ab524afcb7c366cda05f11e2564ee3894ee88368 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sun, 27 May 2007 21:04:11 +0000
 Subject: [PATCH] perl: 5.8.7 -> 5.8.8 (from OE)
diff --git a/meta/recipes-devtools/perl/files/perl-dynloader.patch b/meta/recipes-devtools/perl/files/perl-dynloader.patch
index 5472602d3a..cf6ca9e117 100644
--- a/meta/recipes-devtools/perl/files/perl-dynloader.patch
+++ b/meta/recipes-devtools/perl/files/perl-dynloader.patch
@@ -1,4 +1,4 @@
-From 25a26c52c320e699b37a7ad1f4f045bc8aa4cb00 Mon Sep 17 00:00:00 2001
+From 746817a9a3b254d2c3916d6f57fcc173eb47246b Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/perl/perl_5.40.0.bb b/meta/recipes-devtools/perl/perl_5.40.1.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.40.0.bb
rename to meta/recipes-devtools/perl/perl_5.40.1.bb
index 30f2431f27..419f57e2d3 100644
--- a/meta/recipes-devtools/perl/perl_5.40.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.40.1.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "c740348f357396327a9795d3e8323bafd0fe8a5c7835fc1cbaba0cc8dfe7161f"
+SRC_URI[perl.sha256sum] = "02f8c45bb379ed0c3de7514fad48c714fd46be8f0b536bfd5320050165a1ee26"
 
 B = "${WORKDIR}/perl-${PV}-build"
 
-- 
2.44.1


--===============3734958246915212200==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-perl-upgrade-5.40.0-5.40.1.patch"

RnJvbSA1YWUyZjM2MzhhZDBlMmU1NTZmMGIwZjhjODlmYzlkYTQ3MTYyZTZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAwNzo0Njo0NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBl
cmw6IHVwZ3JhZGUgNS40MC4wIC0+IDUuNDAuMQoKLS0tCiAuLi5oaXMtbW9kdWxlLWJyZWFrcy10
aHJvdWdoLXRoZS1wZXJsLXdyYXBwZXItLnBhdGNoIHwgIDIgKy0KIC4uLlN5c2xvZy1NYWtlZmls
ZS5QTC1GaXgtX1BBVEhfTE9HLWZvci1kZXRlcm0ucGF0Y2ggfCAgMiArLQogLi4uL3BlcmwvZmls
ZXMvMDAwMi1Db25zdGFudC1GaXgtdXAtc2hlYmFuZy5wYXRjaCAgICB8ICAyICstCiBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9kZXRlcm1pbmlzbS5wYXRjaCAgIHwgIDIgKy0KIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2VuY29kZWZpeC5wYXRjaCAgICAgfCAgMiAr
LQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZXJybm9fdmVyLmRpZmYgICAgICB8
ICAyICstCiAuLi4vcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL25hdGl2ZS1wZXJsaW5jLnBh
dGNoIHwgIDIgKy0KIC4uLi9wZXJsL2ZpbGVzL3BlcmwtY29uZmlncG0tc3dpdGNoLnBhdGNoICAg
ICAgICAgICAgfCAgMiArLQogLi4uL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9wZXJsLWR5
bmxvYWRlci5wYXRjaCB8ICAyICstCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJsLXB0
ZXN0LmluYyAgICAgICAgICAgIHwgMTIgKysrKysrKysrKystCiAuLi4vcGVybC97cGVybF81LjQw
LjAuYmIgPT4gcGVybF81LjQwLjEuYmJ9ICAgICAgICAgIHwgIDIgKy0KIDExIGZpbGVzIGNoYW5n
ZWQsIDIxIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9wZXJsL3twZXJsXzUuNDAuMC5iYiA9PiBwZXJsXzUuNDAuMS5iYn0gKDk5JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy8wMDAxLVNvbWVo
b3ctdGhpcy1tb2R1bGUtYnJlYWtzLXRocm91Z2gtdGhlLXBlcmwtd3JhcHBlci0ucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy8wMDAxLVNvbWVob3ctdGhpcy1tb2R1bGUt
YnJlYWtzLXRocm91Z2gtdGhlLXBlcmwtd3JhcHBlci0ucGF0Y2gKaW5kZXggMjA3NmM2MWVlMC4u
YWNiNTQ3ZjVjNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMv
MDAwMS1Tb21laG93LXRoaXMtbW9kdWxlLWJyZWFrcy10aHJvdWdoLXRoZS1wZXJsLXdyYXBwZXIt
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzLzAwMDEtU29tZWhv
dy10aGlzLW1vZHVsZS1icmVha3MtdGhyb3VnaC10aGUtcGVybC13cmFwcGVyLS5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gNDdjZDIyY2QyMTNkMmM1ZjI4ZTY3NGIxMmMyNjRkYzczMTY4MjU2
MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gODIxY2YzYmVjN2M2NjRhNjM0Nzc1Mzdl
ZWU0YTQ5YWExYTcyZWJkNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRl
ciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVHVlLCA1IEp1biAyMDE4
IDE0OjU4OjQyICswMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIFNvbWVob3cgdGhpcyBtb2R1bGUgYnJl
YWtzIHRocm91Z2ggdGhlIHBlcmwgd3JhcHBlciBhbmQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9wZXJsL2ZpbGVzLzAwMDEtY3Bhbi1TeXMtU3lzbG9nLU1ha2VmaWxlLlBMLUZp
eC1fUEFUSF9MT0ctZm9yLWRldGVybS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJs
L2ZpbGVzLzAwMDEtY3Bhbi1TeXMtU3lzbG9nLU1ha2VmaWxlLlBMLUZpeC1fUEFUSF9MT0ctZm9y
LWRldGVybS5wYXRjaAppbmRleCA3ZTVkMDhkOGRiLi5kZmQ2MmUwMmIwIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy8wMDAxLWNwYW4tU3lzLVN5c2xvZy1NYWtl
ZmlsZS5QTC1GaXgtX1BBVEhfTE9HLWZvci1kZXRlcm0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3BlcmwvZmlsZXMvMDAwMS1jcGFuLVN5cy1TeXNsb2ctTWFrZWZpbGUuUEwtRml4
LV9QQVRIX0xPRy1mb3ItZGV0ZXJtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzMjI5NzIz
ODRlMDc5NWJlMzM5MjUyZjdjZjlhMzE4ZGM3NTliNTFlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBlNTQyZDgyMzA4YzVkOGFlYzY2MWQ4OWQ4NjhkMDBiMjE0ZjNmMjQzIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9iZXJ0IFlhbmcgPGxpZXpoaS55YW5nQHdpbmRyaXZl
ci5jb20+CiBEYXRlOiBGcmksIDE4IEZlYiAyMDIyIDA5OjQ0OjI2ICswMDAwCiBTdWJqZWN0OiBb
UEFUQ0hdIGNwYW4vU3lzLVN5c2xvZy9NYWtlZmlsZS5QTDogRml4IF9QQVRIX0xPRyBmb3IgZGV0
ZXJtaW5pc3RpYwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMv
MDAwMi1Db25zdGFudC1GaXgtdXAtc2hlYmFuZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9wZXJsL2ZpbGVzLzAwMDItQ29uc3RhbnQtRml4LXVwLXNoZWJhbmcucGF0Y2gKaW5kZXggODA5
ODZlNjZkYS4uMmNhZTRhZDk3NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Bl
cmwvZmlsZXMvMDAwMi1Db25zdGFudC1GaXgtdXAtc2hlYmFuZy5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy8wMDAyLUNvbnN0YW50LUZpeC11cC1zaGViYW5nLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhMDIzNTViZGM4Y2RlMTExNWRhZjEwMTY3NWNkZmI3
MDdkMzM3YmYxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4NjI2MDZkNDQ5ZDIwNzVi
ZWNjNzBjYzVlNDQwYzhlZmRhNTBlODY3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
Sm9zaHVhIFdhdHQgPEpQRVdoYWNrZXJAZ21haWwuY29tPgogRGF0ZTogTW9uLCAxNyBKdW4gMjAx
OSAxMDo0NzoyMyAtMDUwMAogU3ViamVjdDogW1BBVENIXSBDb25zdGFudDogRml4IHVwIHNoZWJh
bmcKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL2RldGVybWlu
aXNtLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZGV0ZXJtaW5pc20u
cGF0Y2gKaW5kZXggYmRiOWE5MjhiYi4uMDJkODhiMzZmYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZGV0ZXJtaW5pc20ucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZGV0ZXJtaW5pc20ucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDVjNGZkNTdkYWYxMjUzNTcyNjJhYTc5NjA1N2Q3YmU4ZTc4ZDM3OGUgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDA1Y2JhOGMxOTdmN2E1NDZlMjg4MDQ2MmM4YWE5ODFiM2Rl
YTlkOWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IFdlZCwgNSBGZWIgMjAyMCAy
Mzo1NDowMiArMDAwMAogU3ViamVjdDogW1BBVENIXSBGaXhlcyB0byBtYWtlIHRoZSBwZXJsIGJ1
aWxkIHJlcHJvZHVjaWJsZToKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJs
L2ZpbGVzL2VuY29kZWZpeC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVz
L2VuY29kZWZpeC5wYXRjaAppbmRleCA2NjU2OTlkMTJkLi5jN2NmMzExMTI3IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9lbmNvZGVmaXgucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZW5jb2RlZml4LnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBhNGUyMmM3ZjJhNTE5ZjI0YmM4YWE4OWM2Njc3MDE3YzBmZTEzNjc5IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1ZGU4MzdkMWVmMGM0NDRjZjUzNDY3OWNlZDAy
YTljN2Y1M2U0MmZjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJk
aWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBUdWUsIDE4IEZl
YiAyMDIwIDE3OjI3OjI2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHBlcmw6IEZpeCBlbmNvZGUg
bW9kdWxlIHJlcHJvZHVjaWJpbGl0eSBpc3N1ZXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9wZXJsL2ZpbGVzL2Vycm5vX3Zlci5kaWZmIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3BlcmwvZmlsZXMvZXJybm9fdmVyLmRpZmYKaW5kZXggNDc3NjQyZjQ1Ny4uYjUxMzBlYjA3YSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZXJybm9fdmVyLmRp
ZmYKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvZXJybm9fdmVyLmRpZmYK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDljNDA0ZDRiMWMzNjA3ZTgyN2ZiNTZiNWFlNGY4ZmJiZGI1
MmNkMGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDI4YWMwY2FjYWU1Yjg2ODZkMTFm
ZWY1OTVhYWJmNTQxZTZjMTFmZmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBCcmVu
ZGFuIE8nRGVhIDxib2RAZGViaWFuLm9yZz4KIERhdGU6IEZyaSwgMTYgRGVjIDIwMDUgMDE6MzI6
MTQgKzExMDAKIFN1YmplY3Q6IFtQQVRDSF0gUmVtb3ZlIEVycm5vIHZlcnNpb24gY2hlY2sgZHVl
IHRvIHVwZ3JhZGUgcHJvYmxlbXMgd2l0aApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BlcmwvZmlsZXMvbmF0aXZlLXBlcmxpbmMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGVybC9maWxlcy9uYXRpdmUtcGVybGluYy5wYXRjaAppbmRleCA3ZTNlNWY2NjUyLi43M2Qz
YzJkZTQ5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9uYXRp
dmUtcGVybGluYy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9u
YXRpdmUtcGVybGluYy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOWZlYzYyYjE5YTQ5ZDE0
NTFmZDExMjBjNWRjMzhiYWY1OWY3Mzg1NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
MTgyYjZlNTk1YzQyNjY2ODI0NWUwNmYwN2EzOWU3NGQxOGUyN2MzYiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29t
PgogRGF0ZTogV2VkLCAzMCBNYXkgMjAwNyAwOTozMzozMiArMDAwMAogU3ViamVjdDogW1BBVENI
XSBwZXJsOiBzeW5jIHdpdGggT0UKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
ZXJsL2ZpbGVzL3BlcmwtY29uZmlncG0tc3dpdGNoLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BlcmwvZmlsZXMvcGVybC1jb25maWdwbS1zd2l0Y2gucGF0Y2gKaW5kZXggMzcyMTI3Nzkz
My4uYmM4MWFmYjQ3NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmls
ZXMvcGVybC1jb25maWdwbS1zd2l0Y2gucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3BlcmwvZmlsZXMvcGVybC1jb25maWdwbS1zd2l0Y2gucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDdhNDg1MzhhN2U4NjE0YTMzNDIxNTFiNjQ2ZDIxMDVjMGNiMGNkZDkgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIGFiNTI0YWZjYjdjMzY2Y2RhMDVmMTFlMjU2NGVlMzg5NGVlODgz
NjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFN1biwgMjcgTWF5IDIwMDcgMjE6MDQ6MTEgKzAw
MDAKIFN1YmplY3Q6IFtQQVRDSF0gcGVybDogNS44LjcgLT4gNS44LjggKGZyb20gT0UpCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9wZXJsLWR5bmxvYWRlci5w
YXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL3BlcmwtZHlubG9hZGVyLnBh
dGNoCmluZGV4IDU0NzI2MDJkM2EuLmNmNmNhOWUxMTcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9wZXJsL2ZpbGVzL3BlcmwtZHlubG9hZGVyLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL3BlcmwtZHlubG9hZGVyLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSAyNWEyNmM1MmMzMjBlNjk5YjM3YTdhZDFmNGYwNDViYzhhYTRjYjAwIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3NDY4MTdhOWEzYjI1NGQyYzM5MTZkNmY1N2ZjYzE3
M2ViNDcyNDZiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUg
PHJpY2hhcmRAb3BlbmVkaGFuZC5jb20+CiBEYXRlOiBTdW4sIDI3IE1heSAyMDA3IDIxOjA0OjEx
ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHBlcmw6IDUuOC43IC0+IDUuOC44IChmcm9tIE9FKQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvcGVybC1wdGVzdC5pbmMgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJsLXB0ZXN0LmluYwppbmRleCA0YjQ3NTYxMThj
Li4wODMwZmY1YjJhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJs
LXB0ZXN0LmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJsLXB0ZXN0Lmlu
YwpAQCAtMSw2ICsxLDE2IEBACiBpbmhlcml0IHB0ZXN0CiAKLVNSQ19VUkkgKz0gImZpbGU6Ly9y
dW4tcHRlc3QgXAorU1JDX1VSSSA9ICJodHRwczovL3d3dy5jcGFuLm9yZy9zcmMvNS4wL3Blcmwt
JHtQVn0udGFyLmd6O25hbWU9cGVybCBcCisgICAgICAgICAgIGZpbGU6Ly9wZXJsLXJkZXBlbmRz
LnR4dCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDAxLVNvbWVob3ctdGhpcy1tb2R1bGUtYnJlYWtz
LXRocm91Z2gtdGhlLXBlcmwtd3JhcHBlci0ucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vZXJy
bm9fdmVyLmRpZmYgXAorICAgICAgICAgICBmaWxlOi8vbmF0aXZlLXBlcmxpbmMucGF0Y2ggXAor
ICAgICAgICAgICBmaWxlOi8vcGVybC1keW5sb2FkZXIucGF0Y2ggXAorICAgICAgICAgICBmaWxl
Oi8vMDAwMi1Db25zdGFudC1GaXgtdXAtc2hlYmFuZy5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6
Ly9kZXRlcm1pbmlzbS5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDAxLWNwYW4tU3lzLVN5
c2xvZy1NYWtlZmlsZS5QTC1GaXgtX1BBVEhfTE9HLWZvci1kZXRlcm0ucGF0Y2ggXAorICAgICAg
ICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKKyAgICAgICAgICAgZmlsZTovL3BlcmwtY29uZmlncG0t
c3dpdGNoLnBhdGNoIFwKICAgICAgICAgICAgIgogCiBERUJVR19QUkVGSVhfTUFQX1JFR0VYID0g
IiR7QCdcXHwnLmpvaW4oZC5nZXRWYXIoJ0RFQlVHX1BSRUZJWF9NQVAnKS5zcGxpdCgpKX0iCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJsXzUuNDAuMC5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL3BlcmxfNS40MC4xLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL3BlcmxfNS40MC4wLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJsXzUuNDAuMS5iYgppbmRl
eCAzMGYyNDMxZjI3Li40MTlmNTdlMmQzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGVybC9wZXJsXzUuNDAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9w
ZXJsXzUuNDAuMS5iYgpAQCAtMjUsNyArMjUsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy10YXJn
ZXQgPSAiIFwKICAgICAgICAgICAgZmlsZTovL2VuY29kZWZpeC5wYXRjaCBcCiAiCiAKLVNSQ19V
UklbcGVybC5zaGEyNTZzdW1dID0gImM3NDAzNDhmMzU3Mzk2MzI3YTk3OTVkM2U4MzIzYmFmZDBm
ZThhNWM3ODM1ZmMxY2JhYmEwY2M4ZGZlNzE2MWYiCitTUkNfVVJJW3Blcmwuc2hhMjU2c3VtXSA9
ICIwMmY4YzQ1YmIzNzllZDBjM2RlNzUxNGZhZDQ4YzcxNGZkNDZiZThmMGI1MzZiZmQ1MzIwMDUw
MTY1YTFlZTI2IgogCiBCID0gIiR7V09SS0RJUn0vcGVybC0ke1BWfS1idWlsZCIKIAotLSAKMi40
NC4xCgo=

--===============3734958246915212200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1883 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (921 cached, 1 parsed). 1881 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:40a3bc6cced45ffd5d40c755445a98887597e3b5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 551 Local 254 Mirrors 0 Missed 297 Current 229 (46% match, 61% complete)
Removing 54 stale sstate objects for arch x86_64...done.
Removing 5 stale sstate objects for arch allarch...done.
Removing 63 stale sstate objects for arch qemux86_64...done.
Removing 16 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 333 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 340 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 353 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 360 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 366 of 780 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 370 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 372 of 780 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 373 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 375 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 379 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 381 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 385 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 401 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 423 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 426 of 780 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 431 of 780 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gawk-5.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.40.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dpkg-native-1.22.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perlcross-native-1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-native-1_6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 432 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: recipe perl-5.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 433 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 434 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 435 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe dpkg-native-1.22.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 436 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perlcross-native-1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe unzip-native-1_6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 438 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 441 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 443 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 445 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 454 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 461 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 465 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 480 of 780 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sed-4.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 482 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 483 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 491 of 780 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gawk-5.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-33-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 495 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 497 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 501 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-5.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 503 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 507 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_create_spdx_setscene)
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_257.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-33-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 508 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 513 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.73-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 517 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 519 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 522 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 525 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_257.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 526 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 529 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 532 of 780 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 534 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.73-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 535 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 536 of 780 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 539 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 542 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 543 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 546 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 548 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 550 of 780 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 551 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 552 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 553 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 554 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_257.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 556 of 780 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 558 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 559 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 560 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_recipe_qa_setscene)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 561 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 562 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_257.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 564 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 566 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 569 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxslt-native-1.1.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 570 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.73-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 573 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 576 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxslt-native-1.1.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 579 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 580 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 582 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 584 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.73-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 585 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 586 of 780 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 590 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 591 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 592 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 595 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 597 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 598 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 599 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 600 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 603 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-native-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 604 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 605 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 606 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 608 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 609 of 780 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 611 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-native-1.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 612 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 616 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 617 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 618 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 619 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 620 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 626 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.17.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 627 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 628 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 634 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 635 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-native-2.13.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.17.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 637 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 643 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-75.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 644 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 646 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-native-2.13.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 648 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 649 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 651 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 653 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 657 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 658 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 661 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-75.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 663 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 664 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 669 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 673 of 780 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.17.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 677 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-75.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 678 of 780 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 679 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 680 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 681 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 682 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.17.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 683 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 684 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 686 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-75.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 687 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 688 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 691 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 692 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 693 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-native-75.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 694 of 780 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 695 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 696 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 697 of 780 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-3.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-native-75.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 698 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 699 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 702 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 703 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 704 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 705 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 706 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 708 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 711 of 780 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 712 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe meson-native-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 714 of 780 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 715 of 780 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe meson-native-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 719 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 720 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 721 of 780 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 722 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 723 of 780 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.11.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 724 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-build-native-1.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 727 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 728 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 729 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 730 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 731 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-packaging-native-24.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 732 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 734 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe python3-build-native-1.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 735 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-flit-core-native-3.11.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-packaging-native-24.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 737 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_stash_locale_setscene)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 742 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 751 of 780 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 753 of 780 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 760 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.31.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 761 of 780 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 762 of 780 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 763 of 780 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 764 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe python3-flit-core-native-3.11.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cmake-native-3.31.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 765 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perlcross-native-1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-native-8.12.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 766 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cmake-native-3.31.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 316 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.31.5.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-native-5.40.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 328 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_fetch)
NOTE: recipe openssl-native-3.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 414 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.11.0.bb:do_fetch)
NOTE: Running noexec task 416 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_fetch)
NOTE: Running task 420 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running noexec task 428 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_fetch)
NOTE: Running task 430 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_fetch)
NOTE: Running task 432 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: Running task 436 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_fetch)
NOTE: recipe curl-native-8.12.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 767 of 780 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_recipe_qa_setscene)
NOTE: Running task 440 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_fetch)
NOTE: recipe perl-native-5.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cmake-native-3.31.5-r0: task do_fetch: Started
NOTE: Running task 448 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_fetch)
NOTE: Running task 450 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: recipe openssl-native-3.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 451 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_fetch)
NOTE: recipe cmake-native-3.31.5-r0: task do_fetch: Succeeded
NOTE: Running task 452 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.31.5.bb:do_unpack)
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Started
NOTE: Running task 454 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Succeeded
NOTE: Running task 455 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 768 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-flit-core-native-3.11.0-r0: task do_fetch: Started
NOTE: recipe cmake-native-3.31.5-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_fetch: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_fetch: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_fetch: Started
NOTE: recipe python3-packaging-native-24.2-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 456 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perlcross-native-1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-native-5.40.1-r0: task do_fetch: Started
NOTE: recipe expat-2.6.4-r0: task do_fetch: Started
NOTE: recipe openssl-native-3.4.1-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Started
NOTE: recipe expat-2.6.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-flit-core-native-3.11.0-r0: task do_fetch: Succeeded
NOTE: recipe perl-native-5.40.1-r0: task do_fetch: Succeeded
NOTE: recipe openssl-native-3.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-build-native-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-native-24.2-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 770 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 771 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 772 of 780 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl-cross/perlcross_1.6.bb:do_recipe_qa_setscene)
NOTE: Running task 457 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_unpack)
NOTE: Running task 458 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_unpack)
NOTE: Running task 459 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.11.0.bb:do_unpack)
NOTE: Running task 460 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_unpack)
NOTE: Running task 462 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: Running task 463 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_unpack)
NOTE: Running task 464 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: Running task 465 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_unpack)
NOTE: Running task 466 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_unpack)
NOTE: Running task 468 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe perlcross-native-1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-flit-core-native-3.11.0-r0: task do_unpack: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_unpack: Started
NOTE: Running task 470 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_fetch)
NOTE: Running task 471 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_unpack: Started
NOTE: recipe perl-native-5.40.1-r0: task do_unpack: Started
NOTE: recipe openssl-native-3.4.1-r0: task do_unpack: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_unpack: Started
NOTE: recipe python3-packaging-native-24.2-r0: task do_unpack: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-flit-core-native-3.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 472 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_patch)
NOTE: recipe python3-build-native-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 473 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-flit-core_3.11.0.bb:do_patch)
NOTE: recipe perlcross-native-1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 474 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_patch)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-packaging-native-24.2-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 485 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 486 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_patch)
NOTE: Running task 487 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_fetch)
NOTE: Running task 488 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.2.bb:do_patch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 773 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_fetch: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_patch: Started
NOTE: recipe python3-flit-core-native-3.11.0-r0: task do_patch: Started
NOTE: recipe python3-build-native-1.2.2-r0: task do_patch: Started
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_patch: Started
NOTE: Running setscene task 775 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Started
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-native-5.40.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-native-24.2-r0: task do_patch: Started
NOTE: Running task 491 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-flit-core-native-3.11.0-r0: task do_patch: Succeeded
NOTE: Running task 493 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_unpack)
NOTE: recipe python3-build-native-1.2.2-r0: task do_patch: Succeeded
NOTE: Running task 496 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_fetch)
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Succeeded
NOTE: Running task 499 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_fetch)
NOTE: Running task 500 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-packaging-native-24.2-r0: task do_patch: Succeeded
NOTE: Running task 503 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_fetch)
NOTE: recipe libgcc-initial-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 518 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb:do_fetch)
NOTE: Running task 521 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: recipe gdbm-1.24-r0: task do_fetch: Started
NOTE: recipe expat-2.6.4-r0: task do_unpack: Started
NOTE: recipe perl-native-5.40.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_fetch: Started
NOTE: recipe gdbm-1.24-r0: task do_fetch: Succeeded
NOTE: Running task 523 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_unpack)
NOTE: Running task 527 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_fetch)
NOTE: recipe xz-5.6.4-r0: task do_fetch: Started
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: Running task 528 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe python3-setuptools-native-75.8.0-r0: task do_fetch: Started
NOTE: Running task 531 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_unpack)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 533 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_unpack)
NOTE: recipe python3-setuptools-native-75.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 550 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 551 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe expat-2.6.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_unpack: Started
NOTE: Running task 552 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_patch)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: recipe gdbm-1.24-r0: task do_unpack: Started
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_unpack: Succeeded
NOTE: recipe curl-native-8.12.1-r0: task do_fetch: Started
NOTE: recipe xz-5.6.4-r0: task do_unpack: Started
NOTE: Running task 553 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.45.1.bb:do_patch)
NOTE: recipe curl-native-8.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 557 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_fetch: Started
NOTE: recipe expat-2.6.4-r0: task do_patch: Started
NOTE: recipe gdbm-1.24-r0: task do_unpack: Succeeded
NOTE: Running task 558 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_patch)
NOTE: recipe openssl-3.4.1-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_patch: Started
NOTE: Running task 559 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_unpack)
NOTE: Running task 560 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_patch)
NOTE: recipe python3-setuptools-native-75.8.0-r0: task do_unpack: Started
NOTE: recipe python3-wheel-native-0.45.1-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 565 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_unpack)
NOTE: recipe gdbm-1.24-r0: task do_patch: Started
NOTE: Running task 573 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.7.0.bb:do_fetch)
NOTE: recipe openssl-native-3.4.1-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_patch: Succeeded
NOTE: Running task 574 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_patch)
NOTE: Running task 602 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_generate_toolchain_file)
NOTE: recipe openssl-3.4.1-r0: task do_unpack: Started
NOTE: recipe xz-5.6.4-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-native-75.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 604 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb:do_patch)
NOTE: Running task 606 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_fetch: Succeeded
NOTE: Running task 607 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_unpack)
NOTE: recipe curl-native-8.12.1-r0: task do_unpack: Started
NOTE: recipe meson-native-1.7.0-r0: task do_fetch: Started
NOTE: recipe expat-2.6.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe openssl-native-3.4.1-r0: task do_patch: Started
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: recipe xz-5.6.4-r0: task do_patch: Succeeded
NOTE: Running task 610 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_fetch)
NOTE: recipe python3-setuptools-native-75.8.0-r0: task do_patch: Started
NOTE: recipe expat-2.6.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_patch: Succeeded
NOTE: Running task 632 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_fetch)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_unpack: Started
NOTE: Running task 681 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 682 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe libtirpc-1.3.6-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_fetch: Succeeded
NOTE: Running task 683 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.38-r0: task do_fetch: Started
NOTE: recipe perl-native-5.40.1-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_fetch: Started
NOTE: Running task 684 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_patch)
NOTE: recipe libffi-3.4.7-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: Running task 686 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_fetch)
NOTE: Running task 687 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: recipe python3-setuptools-native-75.8.0-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_unpack: Started
NOTE: Running task 691 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_fetch)
NOTE: recipe openssl-native-3.4.1-r0: task do_patch: Succeeded
NOTE: Running task 693 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: recipe perl-native-5.40.1-r0: task do_patch: Started
NOTE: recipe cmake-native-3.31.5-r0: task do_unpack: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_fetch: Succeeded
NOTE: Running task 694 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.31.5.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_fetch: Started
NOTE: Running task 695 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_fetch: Succeeded
NOTE: Running task 696 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_patch)
NOTE: Running task 699 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_fetch)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_fetch: Succeeded
NOTE: Running task 700 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_fetch)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_fetch: Succeeded
NOTE: recipe curl-native-8.12.1-r0: task do_unpack: Succeeded
NOTE: recipe cmake-native-3.31.5-r0: task do_patch: Started
NOTE: Running task 702 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_fetch)
NOTE: Running task 703 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 730 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_unpack)
NOTE: recipe libxcrypt-4.4.38-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Succeeded
NOTE: Running task 732 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_fetch)
NOTE: recipe libffi-3.4.7-r0: task do_unpack: Started
NOTE: recipe curl-native-8.12.1-r0: task do_patch: Started
NOTE: recipe python3-3.13.2-r0: task do_fetch: Started
NOTE: recipe openssl-3.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 733 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_patch)
NOTE: recipe libtirpc-1.3.6-r0: task do_patch: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_fetch: Succeeded
NOTE: Running task 734 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_unpack)
NOTE: Running task 736 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_fetch)
NOTE: recipe libffi-3.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 737 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_patch)
NOTE: recipe libxml2-native-2.13.6-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 738 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_unpack)
NOTE: recipe libxml2-native-2.13.6-r0: task do_fetch: Succeeded
NOTE: Running task 739 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_unpack)
NOTE: recipe openssl-3.4.1-r0: task do_patch: Started
NOTE: recipe curl-native-8.12.1-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cmake-native-3.31.5-r0: task do_patch: Succeeded
NOTE: Running setscene task 776 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_gcc_stash_builddir_setscene)
NOTE: Running task 743 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_unpack)
NOTE: Running task 744 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_unpack)
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.7-r0: task do_patch: Started
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_unpack: Started
NOTE: Running task 745 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Succeeded
NOTE: Running task 746 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_patch)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_unpack: Succeeded
NOTE: Running task 747 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_patch)
NOTE: recipe python3-3.13.2-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_unpack: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_unpack: Succeeded
NOTE: Running task 748 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_patch)
NOTE: Running task 749 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_patch)
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Started
NOTE: recipe libffi-3.4.7-r0: task do_patch: Succeeded
NOTE: Running task 752 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_unpack)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_patch: Started
NOTE: recipe openssl-3.4.1-r0: task do_patch: Succeeded
NOTE: Running task 754 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_unpack)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_patch: Started
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: Running task 755 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: recipe libxml2-native-2.13.6-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_patch: Succeeded
NOTE: Running task 784 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_write_config)
NOTE: recipe libxcrypt-4.4.38-r0: task do_patch: Succeeded
NOTE: Running task 791 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_fetch)
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: Running task 793 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_write_config)
NOTE: recipe meson-native-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 794 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.7.0.bb:do_unpack)
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_fetch: Started
NOTE: Running task 795 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_patch)
NOTE: recipe bash-completion-2.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 796 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_unpack)
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_write_config: Started
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_unpack: Succeeded
NOTE: Running task 797 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Started
NOTE: Running task 798 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_write_config: Succeeded
NOTE: recipe meson-native-1.7.0-r0: task do_unpack: Started
NOTE: Running task 800 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_fetch)
NOTE: recipe bash-completion-2.16.0-r0: task do_unpack: Started
NOTE: Running task 804 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.4.bb:do_fetch)
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 805 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_patch: Started
NOTE: recipe libpcre2-10.45-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_patch: Started
NOTE: recipe libpcre2-10.45-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_patch: Succeeded
NOTE: Running task 808 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_unpack)
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 813 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_fetch)
NOTE: Running task 816 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_fetch: Succeeded
NOTE: Running task 817 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.4.bb:do_unpack)
NOTE: recipe libpam-1.7.0-r0: task do_patch: Started
NOTE: recipe libpcre2-10.45-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Started
NOTE: Running task 818 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_patch)
NOTE: recipe libxml2-2.13.6-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_unpack: Started
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_fetch: Succeeded
NOTE: Running task 821 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_fetch)
NOTE: Running task 831 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: recipe libpam-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_patch: Started
NOTE: Running task 835 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_unpack)
NOTE: recipe libxml2-native-2.13.6-r0: task do_unpack: Succeeded
NOTE: Running task 836 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_fetch: Started
NOTE: Running task 840 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.4.bb:do_write_config)
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 847 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_collect_spdx_deps)
NOTE: recipe libcap-ng-0.8.5-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_fetch: Succeeded
NOTE: Running task 848 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_unpack)
NOTE: Running task 849 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_unpack)
NOTE: recipe meson-native-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_unpack: Started
NOTE: Running task 850 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.7.0.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_write_config: Started
NOTE: recipe libxml2-native-2.13.6-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Started
NOTE: recipe perl-native-5.40.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_write_config: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_unpack: Started
NOTE: Running task 857 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: recipe meson-native-1.7.0-r0: task do_patch: Started
NOTE: recipe perl-native-5.40.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_patch: Succeeded
NOTE: Running task 859 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_patch)
NOTE: Running task 891 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_fetch)
NOTE: Running task 893 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb:do_fetch)
NOTE: recipe libxml2-native-2.13.6-r0: task do_patch: Succeeded
NOTE: Running task 896 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_fetch)
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.45-r0: task do_patch: Started
NOTE: recipe python3-setuptools-75.8.0-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-75.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 897 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_fetch: Started
NOTE: Running task 900 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_fetch)
NOTE: recipe wayland-native-1.23.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_fetch: Succeeded
NOTE: recipe wayland-native-1.23.1-r0: task do_fetch: Succeeded
NOTE: Running task 901 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_fetch)
NOTE: Running task 906 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_unpack: Succeeded
NOTE: Running task 907 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.4.bb:do_patch)
NOTE: recipe libpcre2-10.45-r0: task do_patch: Succeeded
NOTE: Running task 909 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: recipe wayland-1.23.1-r0: task do_fetch: Started
NOTE: recipe wayland-1.23.1-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Succeeded
NOTE: Running task 910 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_fetch: Started
NOTE: Running task 911 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_patch: Started
NOTE: recipe python3-3.13.2-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_fetch: Succeeded
NOTE: recipe wayland-native-1.23.1-r0: task do_unpack: Started
NOTE: Running task 912 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_patch)
NOTE: Running task 915 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: recipe glib-2.0-native-1_2.82.4-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-75.8.0-r0: task do_unpack: Started
NOTE: recipe meson-native-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 917 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_fetch)
NOTE: Running task 921 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_unpack)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_patch: Started
NOTE: recipe python3-setuptools-75.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 922 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_patch)
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: Running task 923 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb:do_patch)
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: Running task 924 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_unpack)
NOTE: recipe wayland-1.23.1-r0: task do_unpack: Started
NOTE: Running task 928 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_fetch)
NOTE: recipe libxml2-2.13.6-r0: task do_unpack: Succeeded
NOTE: Running task 929 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_patch)
NOTE: recipe python3-3.13.2-r0: task do_patch: Started
NOTE: recipe wayland-native-1.23.1-r0: task do_unpack: Succeeded
NOTE: Running task 930 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_patch)
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Started
NOTE: recipe python3-setuptools-75.8.0-r0: task do_patch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_unpack: Started
NOTE: recipe util-linux-2.40.4-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_patch: Started
NOTE: Running task 931 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_patch)
NOTE: Running task 932 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_fetch)
NOTE: recipe wayland-1.23.1-r0: task do_unpack: Succeeded
NOTE: recipe wayland-native-1.23.1-r0: task do_patch: Started
NOTE: Running task 933 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_patch)
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 935 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_fetch)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_fetch: Started
NOTE: Running task 936 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_patch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_fetch: Succeeded
NOTE: Running task 937 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: recipe util-linux-2.40.4-r0: task do_patch: Started
NOTE: recipe libxml2-2.13.6-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_patch: Succeeded
NOTE: Running task 939 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_unpack)
NOTE: recipe wayland-1.23.1-r0: task do_patch: Started
NOTE: recipe python3-setuptools-75.8.0-r0: task do_patch: Succeeded
NOTE: Running task 941 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_unpack)
NOTE: Running task 942 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_unpack)
NOTE: recipe libxslt-native-1.1.42-r0: task do_fetch: Started
NOTE: recipe wayland-native-1.23.1-r0: task do_patch: Succeeded
NOTE: Running task 944 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_write_config)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_unpack: Started
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_patch: Succeeded
NOTE: Running task 947 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_fetch)
NOTE: recipe wayland-1.23.1-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 948 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_fetch)
NOTE: Running task 949 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: Running task 950 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_patch)
NOTE: recipe wayland-native-1.23.1-r0: task do_write_config: Started
NOTE: recipe wayland-native-1.23.1-r0: task do_write_config: Succeeded
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_fetch: Started
NOTE: Running task 953 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_write_config)
NOTE: recipe glib-2.0-initial-1_2.82.4-r0: task do_patch: Succeeded
NOTE: Running task 956 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_write_config)
NOTE: recipe util-macros-1_1.20.2-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Succeeded
NOTE: Running task 957 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_patch)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_write_config: Started
NOTE: recipe wayland-1.23.1-r0: task do_write_config: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Running setscene task 777 of 780 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_unpack: Succeeded
NOTE: Running task 968 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_patch)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_write_config: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_write_config: Succeeded
NOTE: Running task 969 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_write_config)
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Succeeded
NOTE: Running task 971 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_fetch)
NOTE: Running task 973 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_fetch)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_patch: Succeeded
NOTE: Running task 976 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_write_config)
NOTE: recipe util-linux-2.40.4-r0: task do_patch: Succeeded
NOTE: Running task 979 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_write_config: Started
NOTE: recipe perl-5.40.1-r0: task do_fetch: Started
NOTE: recipe libxslt-native-1.1.42-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_fetch: Succeeded
NOTE: Running task 982 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_unpack)
NOTE: Running task 983 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_unpack)
NOTE: Running task 984 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Started
NOTE: recipe perl-5.40.1-r0: task do_fetch: Succeeded
NOTE: Running task 989 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_write_config: Succeeded
NOTE: Running task 990 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_patch)
NOTE: Running task 991 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_fetch: Started
NOTE: Running task 992 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_fetch)
NOTE: recipe base-passwd-3.6.6-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe libxslt-native-1.1.42-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: Running task 993 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Started
NOTE: Running task 994 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_unpack)
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Succeeded
NOTE: Running task 997 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 998 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.2.bb:do_fetch)
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe perl-5.40.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1002 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_fetch)
NOTE: Setscene tasks completed
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1014 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_unpack: Succeeded
NOTE: Running task 1017 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: Running task 1018 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_patch)
NOTE: Running task 1019 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: recipe shadow-4.17.2-r0: task do_fetch: Started
NOTE: recipe shadow-4.17.2-r0: task do_fetch: Succeeded
NOTE: Running task 1020 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.44-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_patch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1021 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: Running task 1022 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_unpack)
NOTE: recipe libxslt-native-1.1.42-r0: task do_unpack: Succeeded
NOTE: Running task 1023 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_patch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Started
NOTE: recipe glibc-2.41+git-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Started
NOTE: Running task 1027 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1028 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: recipe libxslt-native-1.1.42-r0: task do_patch: Started
NOTE: recipe python3-3.13.2-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Running task 1030 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.2.bb:do_unpack)
NOTE: Running task 1031 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_patch)
NOTE: recipe libxslt-native-1.1.42-r0: task do_patch: Succeeded
NOTE: Running task 1048 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_fetch)
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: Running task 1049 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 1050 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_patch)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_patch: Succeeded
NOTE: Running task 1051 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_patch)
NOTE: Running task 1053 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.0.bb:do_fetch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Started
NOTE: recipe shadow-4.17.2-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.73-r0: task do_fetch: Started
NOTE: Running task 1054 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1055 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libcap-2.73-r0: task do_fetch: Succeeded
NOTE: Running task 1056 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Started
NOTE: Running task 1057 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_fetch)
NOTE: recipe libxkbcommon-1.8.0-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Succeeded
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running task 1059 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_fetch)
NOTE: Running task 1061 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe initscripts-1.0-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1062 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_unpack)
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1063 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: recipe kmod-33-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1071 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe libxkbcommon-1.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1079 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_unpack)
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1080 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.0.bb:do_unpack)
NOTE: recipe base-passwd-3.6.6-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_unpack: Started
NOTE: Running task 1082 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1083 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.73-r0: task do_unpack: Started
NOTE: Running task 1084 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.8.0-r0: task do_unpack: Started
NOTE: Running task 1087 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe initscripts-1.0-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe kmod-33-r0: task do_fetch: Succeeded
NOTE: Running task 1088 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_unpack)
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1089 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_unpack: Succeeded
NOTE: Running task 1098 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.5.bb:do_fetch)
NOTE: Running task 1099 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_patch)
NOTE: recipe libcap-2.73-r0: task do_unpack: Succeeded
NOTE: Running task 1100 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_patch)
NOTE: recipe kmod-33-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: recipe perl-5.40.1-r0: task do_unpack: Succeeded
NOTE: Running task 1101 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_patch)
NOTE: recipe xkeyboard-config-2.44-r0: task do_patch: Started
NOTE: recipe python3-jinja2-native-3.1.5-r0: task do_fetch: Started
NOTE: recipe libcap-2.73-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1102 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe xkeyboard-config-2.44-r0: task do_patch: Succeeded
NOTE: Running task 1104 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_fetch)
NOTE: recipe python3-jinja2-native-3.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1107 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_fetch)
NOTE: recipe perl-5.40.1-r0: task do_patch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1108 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_fetch)
NOTE: recipe initscripts-1.0-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.1-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.1-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_fetch: Started
NOTE: Running task 1110 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.3.bb:do_fetch)
NOTE: recipe libcap-2.73-r0: task do_patch: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_fetch: Succeeded
NOTE: Running task 1112 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1114 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_fetch)
NOTE: recipe initscripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1118 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_write_config)
NOTE: recipe libxkbcommon-1.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1119 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.3.1-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe systemd-1_257.3-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_write_config: Started
NOTE: Running task 1120 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe gawk-5.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 1122 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe libxkbcommon-1.8.0-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1123 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.5.bb:do_unpack)
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_write_config: Succeeded
NOTE: Running task 1124 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch)
NOTE: Running task 1125 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe shadow-4.17.2-r0: task do_unpack: Succeeded
NOTE: recipe kmod-33-r0: task do_unpack: Succeeded
NOTE: Running task 1126 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.2.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1127 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_patch)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: Running task 1128 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe libxkbcommon-1.8.0-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_patch: Started
NOTE: Running task 1129 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe python3-jinja2-native-3.1.5-r0: task do_unpack: Started
NOTE: Running task 1130 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_unpack: Started
NOTE: recipe systemd-1_257.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-jinja2-native-3.1.5-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.17.2-r0: task do_patch: Started
NOTE: Running task 1131 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_unpack)
NOTE: recipe kmod-33-r0: task do_patch: Started
NOTE: Running task 1132 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.5.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1133 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_patch)
NOTE: recipe mpfr-4.2.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe zstd-1.5.6-r0: task do_patch: Succeeded
NOTE: Running task 1134 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.3.bb:do_unpack)
NOTE: recipe readline-8.2.13-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1135 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-jinja2-native-3.1.5-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_patch: Started
NOTE: recipe python3-jinja2-native-3.1.5-r0: task do_patch: Succeeded
NOTE: recipe python3-markupsafe-native-3.0.2-r0: task do_patch: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.17.2-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_257.3-r0: task do_unpack: Started
NOTE: recipe mpfr-4.2.1-r0: task do_unpack: Succeeded
NOTE: recipe kmod-33-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: recipe perl-5.40.1-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_fetch: Succeeded
NOTE: Running task 1136 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_unpack)
NOTE: Running task 1137 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_unpack)
NOTE: Running task 1138 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1140 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: Running task 1141 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_patch)
NOTE: Running task 1142 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_patch)
NOTE: Running task 1150 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_unpack)
NOTE: Running task 1160 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_fetch)
NOTE: Running task 1180 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.0.bb:do_write_config)
NOTE: Running task 1181 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: Running task 1182 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.1-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Started
NOTE: recipe perl-5.40.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe readline-8.2.13-r0: task do_patch: Started
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.3.1-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.8.0-r0: task do_write_config: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1184 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: recipe libxkbcommon-1.8.0-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: Running task 1189 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_fetch)
NOTE: Running task 1191 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_fetch: Succeeded
NOTE: Running task 1192 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Succeeded
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_unpack: Succeeded
NOTE: Running task 1193 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_patch)
NOTE: Running task 1194 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_collect_spdx_deps)
NOTE: recipe mpfr-4.2.1-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_configure: Started
NOTE: Running task 1195 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_patch)
NOTE: recipe procps-4.0.5-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1196 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_unpack)
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_fetch: Started
NOTE: recipe readline-8.2.13-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_configure: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_unpack: Started
NOTE: Running task 1204 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.3.bb:do_warn_musl)
NOTE: recipe linux-libc-headers-6.12-r0: task do_patch: Started
NOTE: Running task 1205 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: recipe linux-libc-headers-6.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe perl-5.40.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_patch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_deploy_source_date_epoch unihash changed to 8b780ba8ba00d0a0d36d348c790ef42b6a7874dc339cb6791d8577f14d0063b7
NOTE: recipe linux-libc-headers-6.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Started
NOTE: recipe gawk-5.3.1-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running noexec task 1207 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_configure)
NOTE: Running noexec task 1208 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_compile)
NOTE: Running task 1209 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_install)
NOTE: Running task 1210 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.1.bb:do_patch)
NOTE: Running task 1211 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.3.bb:do_write_config)
NOTE: Running task 1216 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1218 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: recipe systemd-1_257.3-r0: task do_warn_musl: Started
NOTE: recipe procps-4.0.5-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_257.3-r0: task do_warn_musl: Succeeded
NOTE: Running task 1219 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_patch: Succeeded
NOTE: Running task 1220 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_unpack)
NOTE: Running task 1222 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb:do_fetch)
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1237 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: Running task 1240 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: recipe gawk-5.3.1-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_install: Started
NOTE: Running task 1246 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_collect_spdx_deps)
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_unpack: Succeeded
NOTE: Running task 1247 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_patch)
NOTE: recipe systemd-1_257.3-r0: task do_write_config: Started
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1248 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: recipe initscripts-1.0-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_unpack: Started
NOTE: Running task 1250 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_populate_lic)
NOTE: recipe dpkg-native-1.22.11-r0: task do_fetch: Started
NOTE: recipe systemd-1_257.3-r0: task do_write_config: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe initscripts-1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_patch: Started
NOTE: recipe perl-5.40.1-r0: task do_populate_lic: Started
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: Running task 1251 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: recipe systemd-1_257.3-r0: task do_unpack: Succeeded
NOTE: recipe gawk-5.3.1-r0: task do_patch: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_patch: Succeeded
NOTE: Running task 1252 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.3.bb:do_patch)
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1255 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_patch)
NOTE: recipe dpkg-native-1.22.11-r0: task do_fetch: Succeeded
NOTE: Running task 1256 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: Running task 1257 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_patch)
NOTE: recipe systemd-1_257.3-r0: task do_patch: Started
NOTE: recipe make-4.4.1-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Started
NOTE: recipe perl-5.40.1-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_populate_lic unihash changed to c3e0b536b000f54649a2e3fb4e0e3e1605fbadd7ec201f7052f3d10e4b71913a
NOTE: recipe dpkg-native-1.22.11-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1259 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe procps-4.0.5-r0: task do_unpack: Succeeded
NOTE: recipe make-4.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1260 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_patch)
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_patch: Started
NOTE: recipe procps-4.0.5-r0: task do_patch: Started
NOTE: recipe systemd-1_257.3-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: Running task 1263 of 2162 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: recipe opkg-utils-native-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: recipe dpkg-native-1.22.11-r0: task do_unpack: Succeeded
NOTE: Running task 1267 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb:do_patch)
NOTE: recipe initscripts-1.0-r0: task do_install: Succeeded
NOTE: recipe dpkg-native-1.22.11-r0: task do_patch: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_unpack: Succeeded
NOTE: Running task 1269 of 2162 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_patch)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_patch: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_patch: Succeeded
NOTE: recipe dpkg-native-1.22.11-r0: task do_patch: Succeeded
NOTE: recipe perl-native-5.40.1-r0: task do_patch: Failed
NOTE: recipe linux-libc-headers-6.12-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 1271 tasks of which 980 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250301074627.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250301074627.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.40.1/temp/log.do_patch.2624492
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: perl-native-5.40.1-r0 do_patch: Applying patch 'perl-configpm-switch.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.40.1/perl-5.40.1'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.40.1/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch perl-configpm-switch.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/perl-native/5.40.1/temp/log.do_patch.2624492
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.1.bb:do_patch) failed with exit code '1'

--===============3734958246915212200==--

