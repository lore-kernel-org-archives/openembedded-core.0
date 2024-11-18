Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8442D6006A
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:10 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.4659.1731964617240623107
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=FvIkj1g4;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Fwv/OfF3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101934122d6ba-48773d72-c780-4b0d-be12-dbb236a4f58d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964622;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uRQT5xOzZ8jAK3kygr6O5JnuUEc/JRl94MSE9ZDj+RM=;
	b=FvIkj1g4xQQcmK67YLnC23FH/6QlxBZ4WaPnP3s5louBeGA++QckzGzKHOAMHcvh
	sei/VDoW/MXei2ivTPeArjpOaRaoZjxa6TmvDzkxVYO9oirmMDiZpJBU+gyCwxi6ClR
	IMOxo6Uru16AEvFixU61NfWZHl7sVN87GV6GRWxY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964622;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uRQT5xOzZ8jAK3kygr6O5JnuUEc/JRl94MSE9ZDj+RM=;
	b=Fwv/OfF3CwuUJ2v/mTDri7abY9MqCGVZr0COBaPSXf2qF4GXm3l56ba2hAdWPSZz
	Z6VUS8HJxksD+pgTv7VfyHAOAdypY0qhdwrhSJoUrVVE441R9/1nn4yvlv04rN6oTGC
	qGTPNpGbHrhtmAx8UAVBfTin+Sy1Vgb2foSelFas=
Content-Type: multipart/mixed; boundary="===============2473056506289551161=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] liburi-perl: upgrading to 5.31 SUCCEEDED
Message-ID: <010101934122d6ba-48773d72-c780-4b0d-be12-dbb236a4f58d-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207271

--===============2473056506289551161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *liburi-perl* to *5.31* has Succeeded.

Next steps:
    - apply the patch: git am 0001-liburi-perl-upgrade-5.28-5.31.patch
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
From ca645584d38973329a71013b0d89a0ec8e5c38ca Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 16 Nov 2024 19:25:59 +0000
Subject: [PATCH] liburi-perl: upgrade 5.28 -> 5.31

---
 .../perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch | 3 +--
 .../perl/{liburi-perl_5.28.bb => liburi-perl_5.31.bb}          | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/perl/{liburi-perl_5.28.bb => liburi-perl_5.31.bb} (94%)

diff --git a/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch b/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
index ed1f25125f..c15c3be93a 100644
--- a/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
+++ b/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
@@ -1,4 +1,4 @@
-From 5a4271456104bdf027644c81c3a208cde5cf522e Mon Sep 17 00:00:00 2001
+From c424e6118d3bd836939ce39c70ee9e6bbd984028 Mon Sep 17 00:00:00 2001
 From: Tim Orling <tim.orling@konsulko.com>
 Date: Thu, 17 Nov 2022 16:33:20 -0800
 Subject: [PATCH] Skip TODO test cases that fail
@@ -8,7 +8,6 @@ TODO cases report as "not ok" with ptest-runner
 Upstream-Status: Inappropriate [ptest-runner specific]
 
 Signed-off-by: Tim Orling <tim.orling@konsulko.com>
-
 ---
  t/escape-char.t | 20 ++++++++++----------
  t/iri.t         | 18 +++++++++---------
diff --git a/meta/recipes-devtools/perl/liburi-perl_5.28.bb b/meta/recipes-devtools/perl/liburi-perl_5.31.bb
similarity index 94%
rename from meta/recipes-devtools/perl/liburi-perl_5.28.bb
rename to meta/recipes-devtools/perl/liburi-perl_5.31.bb
index 1fc0efd3e5..e23942b81e 100644
--- a/meta/recipes-devtools/perl/liburi-perl_5.28.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_5.31.bb
@@ -12,7 +12,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/URI-${PV}.tar.gz \
            file://0001-Skip-TODO-test-cases-that-fail.patch \
            "
 
-SRC_URI[sha256sum] = "e7985da359b15efd00917fa720292b711c396f2f9f9a7349e4e7dec74aa79765"
+SRC_URI[sha256sum] = "b9c4d58b2614b8611ae03a95a6d60ed996f4b311ef3cd5a937b92f1825ecc564"
 
 S = "${WORKDIR}/URI-${PV}"
 
-- 
2.44.1


--===============2473056506289551161==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-liburi-perl-upgrade-5.28-5.31.patch"

RnJvbSBjYTY0NTU4NGQzODk3MzMyOWE3MTAxM2IwZDg5YTBlYzhlNWMzOGNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTYgTm92IDIwMjQgMTk6MjU6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ1cmktcGVybDogdXBncmFkZSA1LjI4IC0+IDUuMzEKCi0tLQogLi4uL3BlcmwvbGlidXJpLXBl
cmwvMDAwMS1Ta2lwLVRPRE8tdGVzdC1jYXNlcy10aGF0LWZhaWwucGF0Y2ggfCAzICstLQogLi4u
L3Blcmwve2xpYnVyaS1wZXJsXzUuMjguYmIgPT4gbGlidXJpLXBlcmxfNS4zMS5iYn0gICAgICAg
ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC97bGlidXJpLXBlcmxfNS4yOC5i
YiA9PiBsaWJ1cmktcGVybF81LjMxLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9wZXJsL2xpYnVyaS1wZXJsLzAwMDEtU2tpcC1UT0RPLXRlc3QtY2FzZXMtdGhh
dC1mYWlsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidXJpLXBlcmwvMDAw
MS1Ta2lwLVRPRE8tdGVzdC1jYXNlcy10aGF0LWZhaWwucGF0Y2gKaW5kZXggZWQxZjI1MTI1Zi4u
YzE1YzNiZTkzYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidXJp
LXBlcmwvMDAwMS1Ta2lwLVRPRE8tdGVzdC1jYXNlcy10aGF0LWZhaWwucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidXJpLXBlcmwvMDAwMS1Ta2lwLVRPRE8tdGVzdC1j
YXNlcy10aGF0LWZhaWwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDVhNDI3MTQ1NjEwNGJk
ZjAyNzY0NGM4MWMzYTIwOGNkZTVjZjUyMmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGM0MjRlNjExOGQzYmQ4MzY5MzljZTM5YzcwZWU5ZTZiYmQ5ODQwMjggTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBUaW0gT3JsaW5nIDx0aW0ub3JsaW5nQGtvbnN1bGtvLmNvbT4KIERh
dGU6IFRodSwgMTcgTm92IDIwMjIgMTY6MzM6MjAgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gU2tp
cCBUT0RPIHRlc3QgY2FzZXMgdGhhdCBmYWlsCkBAIC04LDcgKzgsNiBAQCBUT0RPIGNhc2VzIHJl
cG9ydCBhcyAibm90IG9rIiB3aXRoIHB0ZXN0LXJ1bm5lcgogVXBzdHJlYW0tU3RhdHVzOiBJbmFw
cHJvcHJpYXRlIFtwdGVzdC1ydW5uZXIgc3BlY2lmaWNdCiAKIFNpZ25lZC1vZmYtYnk6IFRpbSBP
cmxpbmcgPHRpbS5vcmxpbmdAa29uc3Vsa28uY29tPgotCiAtLS0KICB0L2VzY2FwZS1jaGFyLnQg
fCAyMCArKysrKysrKysrLS0tLS0tLS0tLQogIHQvaXJpLnQgICAgICAgICB8IDE4ICsrKysrKysr
Ky0tLS0tLS0tLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidXJp
LXBlcmxfNS4yOC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2xpYnVyaS1wZXJsXzUu
MzEuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BlcmwvbGlidXJpLXBlcmxfNS4yOC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BlcmwvbGlidXJpLXBlcmxfNS4zMS5iYgppbmRleCAxZmMwZWZkM2U1Li5lMjM5NDJiODFl
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9saWJ1cmktcGVybF81LjI4
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2xpYnVyaS1wZXJsXzUuMzEuYmIK
QEAgLTEyLDcgKzEyLDcgQEAgU1JDX1VSSSA9ICIke0NQQU5fTUlSUk9SfS9hdXRob3JzL2lkL08v
T0EvT0FMREVSUy9VUkktJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtU2tp
cC1UT0RPLXRlc3QtY2FzZXMtdGhhdC1mYWlsLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiZTc5ODVkYTM1OWIxNWVmZDAwOTE3ZmE3MjAyOTJiNzExYzM5NmYy
ZjlmOWE3MzQ5ZTRlN2RlYzc0YWE3OTc2NSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiOWM0ZDU4
YjI2MTRiODYxMWFlMDNhOTVhNmQ2MGVkOTk2ZjRiMzExZWYzY2Q1YTkzN2I5MmYxODI1ZWNjNTY0
IgogCiBTID0gIiR7V09SS0RJUn0vVVJJLSR7UFZ9IgogCi0tIAoyLjQ0LjEKCg==

--===============2473056506289551161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/liburi-perl/liburi-perl-doc: FILELIST: added "/usr/share/man/man3/URI::otpauth.3"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: FILELIST: added "/usr/lib/liburi-perl/ptest/t/irc.t /usr/lib/liburi-perl/ptest/t/ssh.t /usr/lib/liburi-perl/ptest/t/ftpes.t /usr/lib/liburi-perl/ptest/t/scp.t /usr/lib/liburi-perl/ptest/t/sftp.t /usr/lib/liburi-perl/ptest/t/ftps.t /usr/lib/liburi-perl/ptest/t/ircs.t /usr/lib/liburi-perl/ptest/t/otpauth.t"
packages/core2-64-poky-linux/liburi-perl/liburi-perl: FILELIST: added "/usr/lib/perl5/vendor_perl/5.40.0/URI/ftps.pm /usr/lib/perl5/vendor_perl/5.40.0/URI/scp.pm /usr/lib/perl5/vendor_perl/5.40.0/URI/irc.pm /usr/lib/perl5/vendor_perl/5.40.0/URI/ircs.pm /usr/lib/perl5/vendor_perl/5.40.0/URI/ftpes.pm /usr/lib/perl5/vendor_perl/5.40.0/URI/otpauth.pm"
Changes to packages/core2-64-poky-linux/liburi-perl (sysroot):
  /usr/lib/perl5/vendor_perl/5.40.0/URI/ftpes.pm was added
  /usr/lib/perl5/vendor_perl/5.40.0/URI/ftps.pm was added
  /usr/lib/perl5/vendor_perl/5.40.0/URI/irc.pm was added
  /usr/lib/perl5/vendor_perl/5.40.0/URI/ircs.pm was added
  /usr/lib/perl5/vendor_perl/5.40.0/URI/otpauth.pm was added
  /usr/lib/perl5/vendor_perl/5.40.0/URI/scp.pm was added

--===============2473056506289551161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/liburi-perl: SRC_URI changed from "https://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/URI-5.28.tar.gz file://0001-Skip-TODO-test-cases-that-fail.patch file://ptest-perl/run-ptest" to "https://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/URI-5.31.tar.gz file://0001-Skip-TODO-test-cases-that-fail.patch file://ptest-perl/run-ptest"
packages/core2-64-poky-linux/liburi-perl: PV changed from "5.28" to "5.31"
packages/core2-64-poky-linux/liburi-perl: PKGV changed from 5.28 [default] to 5.31 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-dbg: PV changed from "5.28" to "5.31"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-dbg: PKGV changed from 5.28 [default] to 5.31 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-dev: PV changed from "5.28" to "5.31"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-dev: PKGV changed from 5.28 [default] to 5.31 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-doc: FILELIST: added "/usr/share/man/man3/URI::otpauth.3"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-doc: PV changed from "5.28" to "5.31"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-doc: PKGSIZE changed from 104222 to 111776 (+7%)
packages/core2-64-poky-linux/liburi-perl/liburi-perl-doc: PKGV changed from 5.28 [default] to 5.31 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-locale: PV changed from "5.28" to "5.31"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-locale: PKGV changed from 5.28 [default] to 5.31 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: FILELIST: added "/usr/lib/liburi-perl/ptest/t/ftps.t /usr/lib/liburi-perl/ptest/t/ircs.t /usr/lib/liburi-perl/ptest/t/irc.t /usr/lib/liburi-perl/ptest/t/scp.t /usr/lib/liburi-perl/ptest/t/otpauth.t /usr/lib/liburi-perl/ptest/t/sftp.t /usr/lib/liburi-perl/ptest/t/ssh.t /usr/lib/liburi-perl/ptest/t/ftpes.t"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: PV changed from "5.28" to "5.31"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: PKGSIZE changed from 140064 to 151103 (+8%)
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: PKGV changed from 5.28 [default] to 5.31 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-src: PV changed from "5.28" to "5.31"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-src: PKGV changed from 5.28 [default] to 5.31 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-staticdev: PV changed from "5.28" to "5.31"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-staticdev: PKGV changed from 5.28 [default] to 5.31 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl: FILELIST: added "/usr/lib/perl5/vendor_perl/5.40.0/URI/irc.pm /usr/lib/perl5/vendor_perl/5.40.0/URI/ftpes.pm /usr/lib/perl5/vendor_perl/5.40.0/URI/otpauth.pm /usr/lib/perl5/vendor_perl/5.40.0/URI/scp.pm /usr/lib/perl5/vendor_perl/5.40.0/URI/ircs.pm /usr/lib/perl5/vendor_perl/5.40.0/URI/ftps.pm"
packages/core2-64-poky-linux/liburi-perl/liburi-perl: PV changed from "5.28" to "5.31"
packages/core2-64-poky-linux/liburi-perl/liburi-perl: PKGSIZE changed from 152722 to 166341 (+9%)
packages/core2-64-poky-linux/liburi-perl/liburi-perl: PKGV changed from 5.28 [default] to 5.31 [default]
Changes to packages/core2-64-poky-linux/liburi-perl (sysroot):
  /usr/lib/perl5/vendor_perl/5.40.0/URI/ftpes.pm was added
  /usr/lib/perl5/vendor_perl/5.40.0/URI/ftps.pm was added
  /usr/lib/perl5/vendor_perl/5.40.0/URI/irc.pm was added
  /usr/lib/perl5/vendor_perl/5.40.0/URI/ircs.pm was added
  /usr/lib/perl5/vendor_perl/5.40.0/URI/otpauth.pm was added
  /usr/lib/perl5/vendor_perl/5.40.0/URI/scp.pm was added

--===============2473056506289551161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1881 targets, 52 skipped, 0 masked, 0 errors.
Removing 15 recipes from the core2-64 sysroot...done.
Removing 62 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d0313b789870abcc560d5ca3de9aaf3fef30d8bc"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 269 Local 258 Mirrors 0 Missed 11 Current 198 (95% match, 97% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 203 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb:do_package_qa_setscene)
NOTE: Running setscene task 204 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 205 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 206 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb:do_package_qa_setscene)
NOTE: Running setscene task 208 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 209 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 210 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-warnings-perl_0.033.bb:do_package_qa_setscene)
NOTE: Running setscene task 212 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-warnings-perl_0.033.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 213 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-warnings-perl_0.033.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 214 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-warnings-perl_0.033.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb:do_create_spdx_setscene)
NOTE: Running setscene task 217 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb:do_create_spdx_setscene)
NOTE: Running setscene task 218 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-warnings-perl_0.033.bb:do_create_spdx_setscene)
NOTE: Running setscene task 226 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.31.bb:do_populate_lic_setscene)
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_package_qa_setscene: Started
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_package_qa_setscene: Started
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_package_qa_setscene: Started
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 229 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_package_qa_setscene)
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe liburi-perl-5.31-r0: task do_populate_lic_setscene: Started
NOTE: Running setscene task 230 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_package_write_deb_setscene)
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 231 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 232 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 235 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 237 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 238 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 240 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 242 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_create_spdx_setscene)
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 243 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_package_qa_setscene: Started
NOTE: Running setscene task 304 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb:do_packagedata_setscene)
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liburi-perl-5.31-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 306 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-warnings-perl_0.033.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_packagedata_setscene: Started
NOTE: recipe libtry-tiny-perl-0.31-r0: task do_packagedata_setscene: Started
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 317 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: Running task 607 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.31.bb:do_recipe_qa)
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 320 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-warnings-perl_0.033.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 323 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb:do_recipe_qa_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libtry-tiny-perl/0.31/temp/log.do_packagedata_setscene.2139597
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 324 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb:do_package_setscene)
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe liburi-perl-5.31-r0: task do_recipe_qa: Started
NOTE: recipe perl-5.40.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe liburi-perl-5.31-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 329 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 330 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 335 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 751 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.31.bb:do_fetch)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_recipe_qa_setscene: Started
NOTE: recipe liburi-perl-5.31-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe liburi-perl-5.31-r0: task do_fetch: Succeeded
NOTE: Running task 802 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.31.bb:do_unpack)
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe liburi-perl-5.31-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 344 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 346 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe procps-4.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 357 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe liburi-perl-5.31-r0: task do_unpack: Succeeded
NOTE: Running task 818 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.31.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 367 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liburi-perl-5.31-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtry-tiny-perl-0.31-r0: task do_package_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe liburi-perl-5.31-r0: task do_patch: Succeeded
NOTE: Running task 914 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.31.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 387 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe liburi-perl-5.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtry-tiny-perl-0.31-r0: task do_package_setscene: Succeeded
NOTE: recipe liburi-perl-5.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 397 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 398 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtry-tiny-perl-0.31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtry-tiny-perl-0.31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 401 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 409 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 411 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 414 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 415 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 419 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 422 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 424 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 426 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 430 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 432 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 434 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 436 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 437 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 439 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 442 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 444 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 448 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 449 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 451 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 456 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 457 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 459 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 463 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 464 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 466 of 467 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1141 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.31.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1257 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb:do_packagedata)
NOTE: Running task 1262 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.31.bb:do_collect_spdx_deps)
NOTE: recipe liburi-perl-5.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtry-tiny-perl-0.31-r0: task do_packagedata: Started
NOTE: recipe liburi-perl-5.31-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtry-tiny-perl-0.31-r0: task do_packagedata: Succeeded
NOTE: recipe liburi-perl-5.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liburi-perl-5.31-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1306 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.31.bb:do_configure)
NOTE: recipe liburi-perl-5.31-r0: task do_configure: Started
NOTE: recipe liburi-perl-5.31-r0: task do_configure: Succeeded
NOTE: Running task 1307 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.31.bb:do_configure_ptest_base)
NOTE: recipe liburi-perl-5.31-r0: task do_configure_ptest_base: Started
NOTE: recipe liburi-perl-5.31-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1308 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.31.bb:do_compile)
NOTE: recipe liburi-perl-5.31-r0: task do_compile: Started
NOTE: recipe liburi-perl-5.31-r0: task do_compile: Succeeded
NOTE: Running task 1309 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.31.bb:do_compile_ptest_base)
NOTE: recipe liburi-perl-5.31-r0: task do_compile_ptest_base: Started
NOTE: recipe liburi-perl-5.31-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1310 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.31.bb:do_install)
NOTE: recipe liburi-perl-5.31-r0: task do_install: Started
NOTE: recipe liburi-perl-5.31-r0: task do_install: Succeeded
NOTE: Running task 1311 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.31.bb:do_install_ptest_base)
NOTE: recipe liburi-perl-5.31-r0: task do_install_ptest_base: Started
NOTE: recipe liburi-perl-5.31-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1312 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.31.bb:do_install_ptest_perl)
NOTE: Running task 1313 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.31.bb:do_populate_sysroot)
NOTE: recipe liburi-perl-5.31-r0: task do_populate_sysroot: Started
NOTE: recipe liburi-perl-5.31-r0: task do_install_ptest_perl: Started
NOTE: recipe liburi-perl-5.31-r0: task do_install_ptest_perl: Succeeded
NOTE: Running task 1314 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.31.bb:do_package)
NOTE: recipe liburi-perl-5.31-r0: task do_package: Started
NOTE: recipe liburi-perl-5.31-r0: task do_populate_sysroot: Succeeded
NOTE: recipe liburi-perl-5.31-r0: task do_package: Succeeded
NOTE: Running task 1315 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.31.bb:do_packagedata)
NOTE: recipe liburi-perl-5.31-r0: task do_packagedata: Started
NOTE: recipe liburi-perl-5.31-r0: task do_packagedata: Succeeded
NOTE: Running task 1316 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.31.bb:do_create_spdx)
NOTE: Running task 1317 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.31.bb:do_package_write_ipk)
NOTE: Running task 1318 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.31.bb:do_package_write_deb)
NOTE: Running task 1319 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.31.bb:do_package_write_rpm)
NOTE: Running task 1320 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.31.bb:do_package_qa)
NOTE: recipe liburi-perl-5.31-r0: task do_create_spdx: Started
NOTE: recipe liburi-perl-5.31-r0: task do_package_write_ipk: Started
NOTE: recipe liburi-perl-5.31-r0: task do_package_write_deb: Started
NOTE: recipe liburi-perl-5.31-r0: task do_package_write_rpm: Started
NOTE: recipe liburi-perl-5.31-r0: task do_package_qa: Started
NOTE: recipe liburi-perl-5.31-r0: task do_create_spdx: Succeeded
NOTE: Running task 1321 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.31.bb:do_create_package_spdx)
NOTE: recipe liburi-perl-5.31-r0: task do_create_package_spdx: Started
NOTE: recipe liburi-perl-5.31-r0: task do_package_write_ipk: Succeeded
NOTE: recipe liburi-perl-5.31-r0: task do_package_qa: Succeeded
NOTE: recipe liburi-perl-5.31-r0: task do_package_write_deb: Succeeded
NOTE: recipe liburi-perl-5.31-r0: task do_create_package_spdx: Succeeded
NOTE: recipe liburi-perl-5.31-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1322 of 1322 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.31.bb:do_build)
NOTE: Tasks Summary: Attempted 1322 tasks of which 1297 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 12 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: libtry-tiny-perl-0.31-r0 do_packagedata_setscene: QA Issue: Package version for package libtry-tiny-perl-src went backwards which would break package feeds (from 0:0.32-r0 to 0:0.31-r0) [version-going-backwards]
ERROR: libtry-tiny-perl-0.31-r0 do_packagedata_setscene: QA Issue: Package version for package libtry-tiny-perl-dbg went backwards which would break package feeds (from 0:0.32-r0 to 0:0.31-r0) [version-going-backwards]
ERROR: libtry-tiny-perl-0.31-r0 do_packagedata_setscene: QA Issue: Package version for package libtry-tiny-perl-ptest went backwards which would break package feeds (from 0:0.32-r0 to 0:0.31-r0) [version-going-backwards]
ERROR: libtry-tiny-perl-0.31-r0 do_packagedata_setscene: QA Issue: Package version for package libtry-tiny-perl-staticdev went backwards which would break package feeds (from 0:0.32-r0 to 0:0.31-r0) [version-going-backwards]
ERROR: libtry-tiny-perl-0.31-r0 do_packagedata_setscene: QA Issue: Package version for package libtry-tiny-perl-dev went backwards which would break package feeds (from 0:0.32-r0 to 0:0.31-r0) [version-going-backwards]
ERROR: libtry-tiny-perl-0.31-r0 do_packagedata_setscene: QA Issue: Package version for package libtry-tiny-perl-doc went backwards which would break package feeds (from 0:0.32-r0 to 0:0.31-r0) [version-going-backwards]
ERROR: libtry-tiny-perl-0.31-r0 do_packagedata_setscene: QA Issue: Package version for package libtry-tiny-perl-locale went backwards which would break package feeds (from 0:0.32-r0 to 0:0.31-r0) [version-going-backwards]
ERROR: libtry-tiny-perl-0.31-r0 do_packagedata_setscene: QA Issue: Package version for package libtry-tiny-perl went backwards which would break package feeds (from 0:0.32-r0 to 0:0.31-r0) [version-going-backwards]
ERROR: libtry-tiny-perl-0.31-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2473056506289551161==--

