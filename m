Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43144C18E5B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:14:58 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.22192.1701436491724711378
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:14:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dKDNWE5B;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FEfNqoNp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018c2584848b-b29ef22d-de1b-44c6-a701-82ebd268bdc3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701436491;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7ThZdoGbvxkAWo95lxlyjKuXjf78R5IebSNaYniHmI4=;
	b=dKDNWE5B29YwAApbGM+wYPQLUtAsM30P0kYa4/xcMZrUGnrkqo9JP+J1WLK7GH11
	YyARKBXhc4Ib3Vo/VvLm/HNZkEqrNtGrDkXEDoq+KEWYHrS8KNByDsNRLPv7PcOK/SK
	Sm+OS77B1RNVVhGx4n+WTn9Z+ffJQZRO51Gw3IPA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701436491;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7ThZdoGbvxkAWo95lxlyjKuXjf78R5IebSNaYniHmI4=;
	b=FEfNqoNp1AaZLCr6eLVcvKtLuMf3pHTUeM8lBChYMLHd6MM7TeSsewzacXTKjN3n
	S8tAhC3oEighi9IsksBR7k4WE7HbSGAI0Bg27v14zdYdV0ii2AEoXHWYEuwB1U8EQ3a
	pn64AEdUWzURSi9QTwZvarA+RBSppHODWTlgiMnE=
Content-Type: multipart/mixed; boundary="===============6701538978112074164=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] perl: upgrading to 5.38.2 FAILED
Message-ID: <0101018c2584848b-b29ef22d-de1b-44c6-a701-82ebd268bdc3-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 13:14:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:14:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191595

--===============6701538978112074164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *perl* to *5.38.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-perl-upgrade-5.38.0-5.38.2.patch
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
From fc4fa18a62f3a8aefad1258569b4bf76e2013603 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Dec 2023 08:14:36 +0000
Subject: [PATCH] perl: upgrade 5.38.0 -> 5.38.2

---
 .../perl/files/encodefix.patch                | 20 -------------------
 .../perl/files/perl-configpm-switch.patch     |  2 +-
 meta/recipes-devtools/perl/perl-ptest.inc     | 13 +++++++++++-
 .../perl/{perl_5.38.0.bb => perl_5.38.2.bb}   |  2 +-
 4 files changed, 14 insertions(+), 23 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/files/encodefix.patch
 rename meta/recipes-devtools/perl/{perl_5.38.0.bb => perl_5.38.2.bb} (99%)

diff --git a/meta/recipes-devtools/perl/files/encodefix.patch b/meta/recipes-devtools/perl/files/encodefix.patch
deleted file mode 100644
index 396ed0d53e..0000000000
--- a/meta/recipes-devtools/perl/files/encodefix.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-The code is encoding host compiler parameters into target builds. Avoid
-this for our target builds (patch is target specific, not native)
-
-Upstream-Status: Inappropriate [Cross compile hack]
-RP 2020/2/18
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: perl-5.30.1/cpan/Encode/bin/enc2xs
-===================================================================
---- perl-5.30.1.orig/cpan/Encode/bin/enc2xs
-+++ perl-5.30.1/cpan/Encode/bin/enc2xs
-@@ -195,7 +195,7 @@ sub compiler_info {
-     # above becomes false.
-     my $sized  = $declaration && !($compat && !$pedantic);
- 
--    return ($cpp, $static, $sized);
-+    return (0, 1, 1);
- }
- 
- 
diff --git a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
index 0be1d5a93c..849207abdc 100644
--- a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
+++ b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
@@ -1,4 +1,4 @@
-From c25d460a2f00e9af25087d40447fe1a81c89710c Mon Sep 17 00:00:00 2001
+From 817f76f69e744650226aef0b8def832f9495183f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sun, 27 May 2007 21:04:11 +0000
 Subject: [PATCH] perl: 5.8.7 -> 5.8.8 (from OE)
diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index e07355d3f5..079099e48f 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -1,6 +1,17 @@
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
+           file://0001-Fix-intermittent-failure-of-test-t-op-sigsystem.t.patch \
+           file://run-ptest \
+           file://perl-configpm-switch.patch \
            "
 
 DEBUG_PREFIX_MAP_REGEX = "${@'\\|'.join(d.getVar('DEBUG_PREFIX_MAP').split())}"
diff --git a/meta/recipes-devtools/perl/perl_5.38.0.bb b/meta/recipes-devtools/perl/perl_5.38.2.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.38.0.bb
rename to meta/recipes-devtools/perl/perl_5.38.2.bb
index 639664e355..a9d684cfc5 100644
--- a/meta/recipes-devtools/perl/perl_5.38.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.2.bb
@@ -26,7 +26,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "213ef58089d2f2c972ea353517dc60ec3656f050dcc027666e118b508423e517"
+SRC_URI[perl.sha256sum] = "a0a31534451eb7b83c7d6594a497543a54d488bc90ca00f5e34762577f40655e"
 
 B = "${WORKDIR}/perl-${PV}-build"
 
-- 
2.39.2


--===============6701538978112074164==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-perl-upgrade-5.38.0-5.38.2.patch"

RnJvbSBmYzRmYTE4YTYyZjNhOGFlZmFkMTI1ODU2OWI0YmY3NmUyMDEzNjAzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBEZWMgMjAyMyAwODoxNDozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBl
cmw6IHVwZ3JhZGUgNS4zOC4wIC0+IDUuMzguMgoKLS0tCiAuLi4vcGVybC9maWxlcy9lbmNvZGVm
aXgucGF0Y2ggICAgICAgICAgICAgICAgfCAyMCAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4vcGVy
bC9maWxlcy9wZXJsLWNvbmZpZ3BtLXN3aXRjaC5wYXRjaCAgICAgfCAgMiArLQogbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3BlcmwvcGVybC1wdGVzdC5pbmMgICAgIHwgMTMgKysrKysrKysrKystCiAu
Li4vcGVybC97cGVybF81LjM4LjAuYmIgPT4gcGVybF81LjM4LjIuYmJ9ICAgfCAgMiArLQogNCBm
aWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9lbmNvZGVmaXgucGF0
Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC97cGVybF81LjM4LjAuYmIgPT4g
cGVybF81LjM4LjIuYmJ9ICg5OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3BlcmwvZmlsZXMvZW5jb2RlZml4LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Blcmwv
ZmlsZXMvZW5jb2RlZml4LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAzOTZl
ZDBkNTNlLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVz
L2VuY29kZWZpeC5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDIwICswLDAgQEAKLVRoZSBjb2Rl
IGlzIGVuY29kaW5nIGhvc3QgY29tcGlsZXIgcGFyYW1ldGVycyBpbnRvIHRhcmdldCBidWlsZHMu
IEF2b2lkCi10aGlzIGZvciBvdXIgdGFyZ2V0IGJ1aWxkcyAocGF0Y2ggaXMgdGFyZ2V0IHNwZWNp
ZmljLCBub3QgbmF0aXZlKQotCi1VcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW0Nyb3Nz
IGNvbXBpbGUgaGFja10KLVJQIDIwMjAvMi8xOAotU2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJk
aWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+Ci0KLUluZGV4OiBwZXJsLTUu
MzAuMS9jcGFuL0VuY29kZS9iaW4vZW5jMnhzCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLS0gcGVybC01LjMwLjEu
b3JpZy9jcGFuL0VuY29kZS9iaW4vZW5jMnhzCi0rKysgcGVybC01LjMwLjEvY3Bhbi9FbmNvZGUv
YmluL2VuYzJ4cwotQEAgLTE5NSw3ICsxOTUsNyBAQCBzdWIgY29tcGlsZXJfaW5mbyB7Ci0gICAg
ICMgYWJvdmUgYmVjb21lcyBmYWxzZS4KLSAgICAgbXkgJHNpemVkICA9ICRkZWNsYXJhdGlvbiAm
JiAhKCRjb21wYXQgJiYgISRwZWRhbnRpYyk7Ci0gCi0tICAgIHJldHVybiAoJGNwcCwgJHN0YXRp
YywgJHNpemVkKTsKLSsgICAgcmV0dXJuICgwLCAxLCAxKTsKLSB9Ci0gCi0gCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9maWxlcy9wZXJsLWNvbmZpZ3BtLXN3aXRjaC5w
YXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL3BlcmwtY29uZmlncG0tc3dp
dGNoLnBhdGNoCmluZGV4IDBiZTFkNWE5M2MuLjg0OTIwN2FiZGMgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL3BlcmwtY29uZmlncG0tc3dpdGNoLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL3BlcmwtY29uZmlncG0tc3dpdGNo
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjMjVkNDYwYTJmMDBlOWFmMjUwODdkNDA0NDdm
ZTFhODFjODk3MTBjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4MTdmNzZmNjllNzQ0
NjUwMjI2YWVmMGI4ZGVmODMyZjk0OTUxODNmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBTdW4s
IDI3IE1heSAyMDA3IDIxOjA0OjExICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHBlcmw6IDUuOC43
IC0+IDUuOC44IChmcm9tIE9FKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Bl
cmwvcGVybC1wdGVzdC5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJsLXB0ZXN0
LmluYwppbmRleCBlMDczNTVkM2Y1Li4wNzkwOTllNDhmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcGVybC9wZXJsLXB0ZXN0LmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGVybC9wZXJsLXB0ZXN0LmluYwpAQCAtMSw2ICsxLDE3IEBACiBpbmhlcml0IHB0ZXN0CiAK
LVNSQ19VUkkgKz0gImZpbGU6Ly9ydW4tcHRlc3QgXAorU1JDX1VSSSA9ICJodHRwczovL3d3dy5j
cGFuLm9yZy9zcmMvNS4wL3BlcmwtJHtQVn0udGFyLmd6O25hbWU9cGVybCBcCisgICAgICAgICAg
IGZpbGU6Ly9wZXJsLXJkZXBlbmRzLnR4dCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDAxLVNvbWVo
b3ctdGhpcy1tb2R1bGUtYnJlYWtzLXRocm91Z2gtdGhlLXBlcmwtd3JhcHBlci0ucGF0Y2ggXAor
ICAgICAgICAgICBmaWxlOi8vZXJybm9fdmVyLmRpZmYgXAorICAgICAgICAgICBmaWxlOi8vbmF0
aXZlLXBlcmxpbmMucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vcGVybC1keW5sb2FkZXIucGF0
Y2ggXAorICAgICAgICAgICBmaWxlOi8vMDAwMi1Db25zdGFudC1GaXgtdXAtc2hlYmFuZy5wYXRj
aCBcCisgICAgICAgICAgIGZpbGU6Ly9kZXRlcm1pbmlzbS5wYXRjaCBcCisgICAgICAgICAgIGZp
bGU6Ly8wMDAxLWNwYW4tU3lzLVN5c2xvZy1NYWtlZmlsZS5QTC1GaXgtX1BBVEhfTE9HLWZvci1k
ZXRlcm0ucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vMDAwMS1GaXgtaW50ZXJtaXR0ZW50LWZh
aWx1cmUtb2YtdGVzdC10LW9wLXNpZ3N5c3RlbS50LnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTov
L3J1bi1wdGVzdCBcCisgICAgICAgICAgIGZpbGU6Ly9wZXJsLWNvbmZpZ3BtLXN3aXRjaC5wYXRj
aCBcCiAgICAgICAgICAgICIKIAogREVCVUdfUFJFRklYX01BUF9SRUdFWCA9ICIke0AnXFx8Jy5q
b2luKGQuZ2V0VmFyKCdERUJVR19QUkVGSVhfTUFQJykuc3BsaXQoKSl9IgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvcGVybF81LjM4LjAuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcGVybC9wZXJsXzUuMzguMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk5JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJsXzUuMzguMC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvcGVybF81LjM4LjIuYmIKaW5kZXggNjM5NjY0ZTM1
NS4uYTlkNjg0Y2ZjNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvcGVy
bF81LjM4LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvcGVybF81LjM4LjIu
YmIKQEAgLTI2LDcgKzI2LDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0gIiBcCiAg
ICAgICAgICAgIGZpbGU6Ly9lbmNvZGVmaXgucGF0Y2ggXAogIgogCi1TUkNfVVJJW3Blcmwuc2hh
MjU2c3VtXSA9ICIyMTNlZjU4MDg5ZDJmMmM5NzJlYTM1MzUxN2RjNjBlYzM2NTZmMDUwZGNjMDI3
NjY2ZTExOGI1MDg0MjNlNTE3IgorU1JDX1VSSVtwZXJsLnNoYTI1NnN1bV0gPSAiYTBhMzE1MzQ0
NTFlYjdiODNjN2Q2NTk0YTQ5NzU0M2E1NGQ0ODhiYzkwY2EwMGY1ZTM0NzYyNTc3ZjQwNjU1ZSIK
IAogQiA9ICIke1dPUktESVJ9L3BlcmwtJHtQVn0tYnVpbGQiCiAKLS0gCjIuMzkuMgoK

--===============6701538978112074164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1847 entries from dependency cache.
Parsing recipes...
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb: Unable to get checksum for perl SRC_URI entry encodefix.patch: file could not be found
The following paths were searched:
/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl-5.38.2/poky/encodefix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl/poky/encodefix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/files/poky/encodefix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl-5.38.2/qemux86-64/encodefix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl/qemux86-64/encodefix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/files/qemux86-64/encodefix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl-5.38.2/qemuall/encodefix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl/qemuall/encodefix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/files/qemuall/encodefix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl-5.38.2/x86-64/encodefix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl/x86-64/encodefix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/files/x86-64/encodefix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl-5.38.2/encodefix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl/encodefix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/files/encodefix.patch
ERROR: Parsing halted due to errors, see error messages above

--===============6701538978112074164==--

