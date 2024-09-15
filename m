Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF326C36014
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:20 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.115399.1726410841498843664
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Yz46rCG3;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=mnlSEFff;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010191f61adae4-4e4749a9-0b82-4184-89f6-57d15750e264-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410840;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WyjvAzYtdsyTkJL1EQ2PtOt7YB2ct15XIbR2DcRY6jU=;
	b=Yz46rCG3KdMr8DGgiFDVvv10t4vzj4pcoXg0fMP75NA2JrH/48jVPzMKYn1v7M4p
	6snX/SbLiRSoSWJcc8oUFf+B1OehqsuV+xXYBybthITvuJ4ItOUs/0XLCQ6SA5V6eGK
	pV9W/qgufIRc0Rzct+64neDQG+vN0LnXY+N/6ocE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410840;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WyjvAzYtdsyTkJL1EQ2PtOt7YB2ct15XIbR2DcRY6jU=;
	b=mnlSEFffKI4MZDlPQZiFDyxah92Pa314ZokyguyDspgmATyKtKvokCuJLSb1qFGY
	rXF7vB6hP4WI3dkCQPQAp921WOf94dwvtRFKbwjCowO26mcWxGNdOcG5ucWnMLsAfTT
	tKf9bgpig2AMS2PugxzANHhCpdNqDQVabPxn+Oro=
Content-Type: multipart/mixed; boundary="===============4511389598122834530=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] liburi-perl: upgrading to 5.29 SUCCEEDED
Message-ID: <01010191f61adae4-4e4749a9-0b82-4184-89f6-57d15750e264-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:34:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204551

--===============4511389598122834530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *liburi-perl* to *5.29* has Succeeded.

Next steps:
    - apply the patch: git am 0001-liburi-perl-upgrade-5.28-5.29.patch
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
From 93ace99f0be052cba432dd1f8395d70bd28a99c9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 08:13:05 +0000
Subject: [PATCH] liburi-perl: upgrade 5.28 -> 5.29

---
 .../perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch | 3 +--
 .../perl/{liburi-perl_5.28.bb => liburi-perl_5.29.bb}          | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/perl/{liburi-perl_5.28.bb => liburi-perl_5.29.bb} (94%)

diff --git a/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch b/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
index ed1f25125f..93b68da065 100644
--- a/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
+++ b/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
@@ -1,4 +1,4 @@
-From 5a4271456104bdf027644c81c3a208cde5cf522e Mon Sep 17 00:00:00 2001
+From 27f048f6fc71179720da5ba98a889b3f2e8b2423 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/perl/liburi-perl_5.28.bb b/meta/recipes-devtools/perl/liburi-perl_5.29.bb
similarity index 94%
rename from meta/recipes-devtools/perl/liburi-perl_5.28.bb
rename to meta/recipes-devtools/perl/liburi-perl_5.29.bb
index 1fc0efd3e5..4eb769f102 100644
--- a/meta/recipes-devtools/perl/liburi-perl_5.28.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_5.29.bb
@@ -12,7 +12,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/URI-${PV}.tar.gz \
            file://0001-Skip-TODO-test-cases-that-fail.patch \
            "
 
-SRC_URI[sha256sum] = "e7985da359b15efd00917fa720292b711c396f2f9f9a7349e4e7dec74aa79765"
+SRC_URI[sha256sum] = "a34b9f626c3ff1e20c0d4a23ec5c8b7ae1de1fb674ecefed7e46791388137372"
 
 S = "${WORKDIR}/URI-${PV}"
 
-- 
2.44.0


--===============4511389598122834530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/liburi-perl/liburi-perl-doc: FILELIST: added "/usr/share/man/man3/URI::otpauth.3"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: FILELIST: added "/usr/lib/liburi-perl/ptest/t/otpauth.t"
packages/core2-64-poky-linux/liburi-perl/liburi-perl: FILELIST: added "/usr/lib/perl5/vendor_perl/5.40.0/URI/otpauth.pm"
Changes to packages/core2-64-poky-linux/liburi-perl (sysroot):
  /usr/lib/perl5/vendor_perl/5.40.0/URI/otpauth.pm was added

--===============4511389598122834530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/liburi-perl: PKGV changed from 5.28 [default] to 5.29 [default]
packages/core2-64-poky-linux/liburi-perl: SRC_URI changed from "https://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/URI-5.28.tar.gz file://0001-Skip-TODO-test-cases-that-fail.patch file://ptest-perl/run-ptest" to "https://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/URI-5.29.tar.gz file://0001-Skip-TODO-test-cases-that-fail.patch file://ptest-perl/run-ptest"
packages/core2-64-poky-linux/liburi-perl: PV changed from "5.28" to "5.29"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-dbg: PKGV changed from 5.28 [default] to 5.29 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-dbg: PV changed from "5.28" to "5.29"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-dev: PKGV changed from 5.28 [default] to 5.29 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-dev: PV changed from "5.28" to "5.29"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-doc: PKGV changed from 5.28 [default] to 5.29 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-doc: FILELIST: added "/usr/share/man/man3/URI::otpauth.3"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-doc: PV changed from "5.28" to "5.29"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-doc: PKGSIZE changed from 104222 to 111191 (+7%)
packages/core2-64-poky-linux/liburi-perl/liburi-perl-locale: PKGV changed from 5.28 [default] to 5.29 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-locale: PV changed from "5.28" to "5.29"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: PKGV changed from 5.28 [default] to 5.29 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: FILELIST: added "/usr/lib/liburi-perl/ptest/t/otpauth.t"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: PV changed from "5.28" to "5.29"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: PKGSIZE changed from 140064 to 148618 (+6%)
packages/core2-64-poky-linux/liburi-perl/liburi-perl-src: PKGV changed from 5.28 [default] to 5.29 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-src: PV changed from "5.28" to "5.29"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-staticdev: PKGV changed from 5.28 [default] to 5.29 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-staticdev: PV changed from "5.28" to "5.29"
packages/core2-64-poky-linux/liburi-perl/liburi-perl: PKGV changed from 5.28 [default] to 5.29 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl: FILELIST: added "/usr/lib/perl5/vendor_perl/5.40.0/URI/otpauth.pm"
packages/core2-64-poky-linux/liburi-perl/liburi-perl: PV changed from "5.28" to "5.29"
packages/core2-64-poky-linux/liburi-perl/liburi-perl: PKGSIZE changed from 152722 to 161514 (+6%)
Changes to packages/core2-64-poky-linux/liburi-perl (sysroot):
  /usr/lib/perl5/vendor_perl/5.40.0/URI/otpauth.pm was added

--===============4511389598122834530==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-liburi-perl-upgrade-5.28-5.29.patch"

RnJvbSA5M2FjZTk5ZjBiZTA1MmNiYTQzMmRkMWY4Mzk1ZDcwYmQyOGE5OWM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMDg6MTM6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ1cmktcGVybDogdXBncmFkZSA1LjI4IC0+IDUuMjkKCi0tLQogLi4uL3BlcmwvbGlidXJpLXBl
cmwvMDAwMS1Ta2lwLVRPRE8tdGVzdC1jYXNlcy10aGF0LWZhaWwucGF0Y2ggfCAzICstLQogLi4u
L3Blcmwve2xpYnVyaS1wZXJsXzUuMjguYmIgPT4gbGlidXJpLXBlcmxfNS4yOS5iYn0gICAgICAg
ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC97bGlidXJpLXBlcmxfNS4yOC5i
YiA9PiBsaWJ1cmktcGVybF81LjI5LmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9wZXJsL2xpYnVyaS1wZXJsLzAwMDEtU2tpcC1UT0RPLXRlc3QtY2FzZXMtdGhh
dC1mYWlsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidXJpLXBlcmwvMDAw
MS1Ta2lwLVRPRE8tdGVzdC1jYXNlcy10aGF0LWZhaWwucGF0Y2gKaW5kZXggZWQxZjI1MTI1Zi4u
OTNiNjhkYTA2NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidXJp
LXBlcmwvMDAwMS1Ta2lwLVRPRE8tdGVzdC1jYXNlcy10aGF0LWZhaWwucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidXJpLXBlcmwvMDAwMS1Ta2lwLVRPRE8tdGVzdC1j
YXNlcy10aGF0LWZhaWwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDVhNDI3MTQ1NjEwNGJk
ZjAyNzY0NGM4MWMzYTIwOGNkZTVjZjUyMmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDI3ZjA0OGY2ZmM3MTE3OTcyMGRhNWJhOThhODg5YjNmMmU4YjI0MjMgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBUaW0gT3JsaW5nIDx0aW0ub3JsaW5nQGtvbnN1bGtvLmNvbT4KIERh
dGU6IFRodSwgMTcgTm92IDIwMjIgMTY6MzM6MjAgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gU2tp
cCBUT0RPIHRlc3QgY2FzZXMgdGhhdCBmYWlsCkBAIC04LDcgKzgsNiBAQCBUT0RPIGNhc2VzIHJl
cG9ydCBhcyAibm90IG9rIiB3aXRoIHB0ZXN0LXJ1bm5lcgogVXBzdHJlYW0tU3RhdHVzOiBJbmFw
cHJvcHJpYXRlIFtwdGVzdC1ydW5uZXIgc3BlY2lmaWNdCiAKIFNpZ25lZC1vZmYtYnk6IFRpbSBP
cmxpbmcgPHRpbS5vcmxpbmdAa29uc3Vsa28uY29tPgotCiAtLS0KICB0L2VzY2FwZS1jaGFyLnQg
fCAyMCArKysrKysrKysrLS0tLS0tLS0tLQogIHQvaXJpLnQgICAgICAgICB8IDE4ICsrKysrKysr
Ky0tLS0tLS0tLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidXJp
LXBlcmxfNS4yOC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2xpYnVyaS1wZXJsXzUu
MjkuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BlcmwvbGlidXJpLXBlcmxfNS4yOC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BlcmwvbGlidXJpLXBlcmxfNS4yOS5iYgppbmRleCAxZmMwZWZkM2U1Li40ZWI3NjlmMTAy
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9saWJ1cmktcGVybF81LjI4
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2xpYnVyaS1wZXJsXzUuMjkuYmIK
QEAgLTEyLDcgKzEyLDcgQEAgU1JDX1VSSSA9ICIke0NQQU5fTUlSUk9SfS9hdXRob3JzL2lkL08v
T0EvT0FMREVSUy9VUkktJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtU2tp
cC1UT0RPLXRlc3QtY2FzZXMtdGhhdC1mYWlsLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiZTc5ODVkYTM1OWIxNWVmZDAwOTE3ZmE3MjAyOTJiNzExYzM5NmYy
ZjlmOWE3MzQ5ZTRlN2RlYzc0YWE3OTc2NSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhMzRiOWY2
MjZjM2ZmMWUyMGMwZDRhMjNlYzVjOGI3YWUxZGUxZmI2NzRlY2VmZWQ3ZTQ2NzkxMzg4MTM3Mzcy
IgogCiBTID0gIiR7V09SS0RJUn0vVVJJLSR7UFZ9IgogCi0tIAoyLjQ0LjAKCg==

--===============4511389598122834530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (0 cached, 916 parsed). 1868 targets, 51 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.0+snapshot-3704a4485875ace7f9612e1759b2aa2259088bb4"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3704a4485875ace7f9612e1759b2aa2259088bb4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 269 Local 254 Mirrors 0 Missed 15 Current 193 (94% match, 96% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 198 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 199 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 200 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 201 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 202 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 203 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-warnings-perl_0.033.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 205 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-warnings-perl_0.033.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 206 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-warnings-perl_0.033.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb:do_create_spdx_setscene)
NOTE: Running setscene task 209 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb:do_create_spdx_setscene)
NOTE: Running setscene task 210 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-warnings-perl_0.033.bb:do_create_spdx_setscene)
NOTE: Running setscene task 218 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.29.bb:do_populate_lic_setscene)
NOTE: Running setscene task 221 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 222 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 223 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_create_spdx_setscene: Started
NOTE: recipe liburi-perl-5.29-r0: task do_populate_lic_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 226 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_create_spdx_setscene)
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liburi-perl-5.29-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 227 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 228 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb:do_packagedata_setscene)
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 230 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 231 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_package_write_rpm_setscene)
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 256 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb:do_packagedata_setscene)
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 294 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb:do_packagedata_setscene)
NOTE: Running setscene task 295 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtest-warnings-perl_0.033.bb:do_packagedata_setscene)
NOTE: Running setscene task 297 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_packagedata_setscene: Started
NOTE: recipe libtry-tiny-perl-0.31-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_packagedata_setscene: Started
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 298 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 596 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.29.bb:do_recipe_qa)
NOTE: recipe libtest-fatal-perl-0.017-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_package_write_rpm_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libtry-tiny-perl/0.31/temp/log.do_packagedata_setscene.1293421
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 311 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb:do_package_setscene)
NOTE: recipe libtest-warnings-perl-0.033-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libtest-needs-perl-0.002010-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe liburi-perl-5.29-r0: task do_recipe_qa: Started
NOTE: Running setscene task 320 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 321 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 325 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_packagedata_setscene)
NOTE: recipe liburi-perl-5.29-r0: task do_recipe_qa: Succeeded
NOTE: Running task 695 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.29.bb:do_fetch)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe liburi-perl-5.29-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe liburi-perl-5.29-r0: task do_fetch: Succeeded
NOTE: Running task 701 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.29.bb:do_unpack)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 333 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 338 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 339 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe liburi-perl-5.29-r0: task do_unpack: Started
NOTE: recipe procps-4.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 348 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe liburi-perl-5.29-r0: task do_unpack: Succeeded
NOTE: Running task 717 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.29.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 352 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 359 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe liburi-perl-5.29-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 729 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libtry-tiny-perl-0.31-r0: task do_package_setscene: Started
NOTE: recipe liburi-perl-5.29-r0: task do_patch: Succeeded
NOTE: Running task 730 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.29.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 376 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe liburi-perl-5.29-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 780 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 781 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 782 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libtry-tiny-perl-0.31-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 383 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 384 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liburi-perl-5.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe libtry-tiny-perl-0.31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 790 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe perl-5.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtry-tiny-perl-0.31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 796 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 797 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 390 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_packagedata_setscene)
NOTE: recipe perl-5.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 401 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 403 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 407 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running task 915 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe perl-5.40.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 415 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 417 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 419 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 425 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 427 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 429 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 430 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 432 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 433 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 435 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 437 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 438 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 440 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 441 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 443 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 451 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 453 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 454 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 993 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 0914254c7e98c2dcacbf6ad346ab81fe83878306674c5c75a61f3c4e871b47e4
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash d2817ec97396bbb7ae88043d30f74da36530b9fbe68e4d544b16c440c8a6b369 to wss://hashserv.yoctoproject.org/ws ({'taskhash': '574d7f4cec0f1c6316715128a4615e2a9d3b8aa4c16bc51d9440e21950dc7609', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd2817ec97396bbb7ae88043d30f74da36530b9fbe68e4d544b16c440c8a6b369'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 574d7f4cec0f1c6316715128a4615e2a9d3b8aa4c16bc51d9440e21950dc7609 -> d2817ec97396bbb7ae88043d30f74da36530b9fbe68e4d544b16c440c8a6b369 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 458 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 459 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 461 of 462 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1134 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.29.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1256 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb:do_packagedata)
NOTE: Running task 1262 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.29.bb:do_collect_spdx_deps)
NOTE: recipe liburi-perl-5.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtry-tiny-perl-0.31-r0: task do_packagedata: Started
NOTE: recipe liburi-perl-5.29-r0: task do_collect_spdx_deps: Started
NOTE: recipe liburi-perl-5.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liburi-perl-5.29-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1298 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.29.bb:do_configure)
NOTE: recipe libtry-tiny-perl-0.31-r0: task do_packagedata: Succeeded
NOTE: recipe liburi-perl-5.29-r0: task do_configure: Started
NOTE: recipe liburi-perl-5.29-r0: task do_configure: Succeeded
NOTE: Running task 1302 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.29.bb:do_configure_ptest_base)
NOTE: recipe liburi-perl-5.29-r0: task do_configure_ptest_base: Started
NOTE: recipe liburi-perl-5.29-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1303 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.29.bb:do_compile)
NOTE: recipe liburi-perl-5.29-r0: task do_compile: Started
NOTE: recipe liburi-perl-5.29-r0: task do_compile: Succeeded
NOTE: Running task 1304 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.29.bb:do_compile_ptest_base)
NOTE: recipe liburi-perl-5.29-r0: task do_compile_ptest_base: Started
NOTE: recipe liburi-perl-5.29-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1305 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.29.bb:do_install)
NOTE: recipe liburi-perl-5.29-r0: task do_install: Started
NOTE: recipe liburi-perl-5.29-r0: task do_install: Succeeded
NOTE: Running task 1306 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.29.bb:do_install_ptest_base)
NOTE: recipe liburi-perl-5.29-r0: task do_install_ptest_base: Started
NOTE: recipe liburi-perl-5.29-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1307 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.29.bb:do_install_ptest_perl)
NOTE: Running task 1308 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.29.bb:do_populate_sysroot)
NOTE: recipe liburi-perl-5.29-r0: task do_populate_sysroot: Started
NOTE: recipe liburi-perl-5.29-r0: task do_install_ptest_perl: Started
NOTE: recipe liburi-perl-5.29-r0: task do_install_ptest_perl: Succeeded
NOTE: Running task 1309 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.29.bb:do_package)
NOTE: recipe liburi-perl-5.29-r0: task do_package: Started
NOTE: recipe liburi-perl-5.29-r0: task do_populate_sysroot: Succeeded
NOTE: recipe liburi-perl-5.29-r0: task do_package: Succeeded
NOTE: Running task 1310 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.29.bb:do_packagedata)
NOTE: recipe liburi-perl-5.29-r0: task do_packagedata: Started
NOTE: recipe liburi-perl-5.29-r0: task do_packagedata: Succeeded
NOTE: Running task 1311 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.29.bb:do_create_spdx)
NOTE: Running task 1312 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.29.bb:do_package_write_ipk)
NOTE: Running task 1313 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.29.bb:do_package_write_deb)
NOTE: Running task 1314 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.29.bb:do_package_write_rpm)
NOTE: Running task 1315 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.29.bb:do_package_qa)
NOTE: recipe liburi-perl-5.29-r0: task do_create_spdx: Started
NOTE: recipe liburi-perl-5.29-r0: task do_package_write_ipk: Started
NOTE: recipe liburi-perl-5.29-r0: task do_package_write_deb: Started
NOTE: recipe liburi-perl-5.29-r0: task do_package_write_rpm: Started
NOTE: recipe liburi-perl-5.29-r0: task do_package_qa: Started
NOTE: recipe liburi-perl-5.29-r0: task do_create_spdx: Succeeded
NOTE: Running task 1316 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.29.bb:do_create_package_spdx)
NOTE: recipe liburi-perl-5.29-r0: task do_create_package_spdx: Started
NOTE: recipe liburi-perl-5.29-r0: task do_package_write_ipk: Succeeded
NOTE: recipe liburi-perl-5.29-r0: task do_package_qa: Succeeded
NOTE: recipe liburi-perl-5.29-r0: task do_package_write_deb: Succeeded
NOTE: recipe liburi-perl-5.29-r0: task do_create_package_spdx: Succeeded
NOTE: recipe liburi-perl-5.29-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1317 of 1317 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/liburi-perl_5.29.bb:do_build)
NOTE: Tasks Summary: Attempted 1317 tasks of which 1283 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

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

--===============4511389598122834530==--

