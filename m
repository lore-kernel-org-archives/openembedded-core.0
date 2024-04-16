Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16C2C30658
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:12 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.13588.1713248038694395223
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dA0M16tu;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=GZmKzIIZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018ee58a6cdf-1eae235c-d1cb-49e7-a3e0-b123ed1039f5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gHlcbMcT+TPn0DSgwWY8dCXCoDILGsKGjgE2/PC5ykI=;
	b=dA0M16tusp2izTNM0otrVMfVPzNP0duj4mg/Mgn5WfwprFRuc+1QYwZb3uggKHup
	9S84zA9iOawlU3gBtwXUvqLwa5StFasjGFCLpYQkQYIFEdzuyAG7/f93xHYDyX2zXK0
	idiEoUIKzAziGPmCaZ//u640wfPI4XWsnTGGQ4jI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gHlcbMcT+TPn0DSgwWY8dCXCoDILGsKGjgE2/PC5ykI=;
	b=GZmKzIIZ+3zDEkSNEW7uxtgBy1xi9SlUrJJv1Bpq0+7bgH43ZvgzXx+bFeRvrpov
	mmFmt9fDQisVnNQC2pnLAVBLaDUrNx47QS+Q0+43GUzpfmwpRW/vpG0Rn5TkTzKbO7L
	5u8zFVAfTgNF0Lrrd9QVdhr383GIRmRK0JQHiQkY=
Content-Type: multipart/mixed; boundary="===============5074632901663065552=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] liburi-perl: upgrading to 5.28 SUCCEEDED
Message-ID: <0101018ee58a6cdf-1eae235c-d1cb-49e7-a3e0-b123ed1039f5-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198272

--===============5074632901663065552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *liburi-perl* to *5.28* has Succeeded.

Next steps:
    - apply the patch: git am 0001-liburi-perl-upgrade-5.27-5.28.patch
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
From 439fec02bf9856845838ee4713f617187387f275 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 18:49:26 +0000
Subject: [PATCH] liburi-perl: upgrade 5.27 -> 5.28

---
 .../perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch | 3 +--
 .../perl/{liburi-perl_5.27.bb => liburi-perl_5.28.bb}          | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/perl/{liburi-perl_5.27.bb => liburi-perl_5.28.bb} (94%)

diff --git a/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch b/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
index ed1f25125f..374bf5b732 100644
--- a/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
+++ b/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
@@ -1,4 +1,4 @@
-From 5a4271456104bdf027644c81c3a208cde5cf522e Mon Sep 17 00:00:00 2001
+From 002332303e24619e421f8680a9f7ad92a90ac0ff Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/perl/liburi-perl_5.27.bb b/meta/recipes-devtools/perl/liburi-perl_5.28.bb
similarity index 94%
rename from meta/recipes-devtools/perl/liburi-perl_5.27.bb
rename to meta/recipes-devtools/perl/liburi-perl_5.28.bb
index e5db7b3cfe..1fc0efd3e5 100644
--- a/meta/recipes-devtools/perl/liburi-perl_5.27.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_5.28.bb
@@ -12,7 +12,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/URI-${PV}.tar.gz \
            file://0001-Skip-TODO-test-cases-that-fail.patch \
            "
 
-SRC_URI[sha256sum] = "11962d8a8a8496906e5d34774affc235a1c95c112d390c0b4171f3e91e9e2a97"
+SRC_URI[sha256sum] = "e7985da359b15efd00917fa720292b711c396f2f9f9a7349e4e7dec74aa79765"
 
 S = "${WORKDIR}/URI-${PV}"
 
-- 
2.42.0


--===============5074632901663065552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/liburi-perl: PKGV changed from 5.27 [default] to 5.28 [default]
packages/core2-64-poky-linux/liburi-perl: SRC_URI changed from "https://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/URI-5.27.tar.gz file://0001-Skip-TODO-test-cases-that-fail.patch file://ptest-perl/run-ptest" to "https://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/URI-5.28.tar.gz file://0001-Skip-TODO-test-cases-that-fail.patch file://ptest-perl/run-ptest"
packages/core2-64-poky-linux/liburi-perl: PV changed from "5.27" to "5.28"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-dbg: PKGV changed from 5.27 [default] to 5.28 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-dbg: PV changed from "5.27" to "5.28"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-dev: PKGV changed from 5.27 [default] to 5.28 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-dev: PV changed from "5.27" to "5.28"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-doc: PKGV changed from 5.27 [default] to 5.28 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-doc: PV changed from "5.27" to "5.28"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-locale: PKGV changed from 5.27 [default] to 5.28 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-locale: PV changed from "5.27" to "5.28"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: PKGV changed from 5.27 [default] to 5.28 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: PV changed from "5.27" to "5.28"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: PKGSIZE changed from 137377 to 140064 (+2%)
packages/core2-64-poky-linux/liburi-perl/liburi-perl-src: PKGV changed from 5.27 [default] to 5.28 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-src: PV changed from "5.27" to "5.28"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-staticdev: PKGV changed from 5.27 [default] to 5.28 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-staticdev: PV changed from "5.27" to "5.28"
packages/core2-64-poky-linux/liburi-perl/liburi-perl: PKGV changed from 5.27 [default] to 5.28 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl: PV changed from "5.27" to "5.28"
packages/core2-64-poky-linux/liburi-perl/liburi-perl: PKGSIZE changed from 152492 to 152722 (+0%)

--===============5074632901663065552==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-liburi-perl-upgrade-5.27-5.28.patch"

RnJvbSA0MzlmZWMwMmJmOTg1Njg0NTgzOGVlNDcxM2Y2MTcxODczODdmMjc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTg6NDk6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ1cmktcGVybDogdXBncmFkZSA1LjI3IC0+IDUuMjgKCi0tLQogLi4uL3BlcmwvbGlidXJpLXBl
cmwvMDAwMS1Ta2lwLVRPRE8tdGVzdC1jYXNlcy10aGF0LWZhaWwucGF0Y2ggfCAzICstLQogLi4u
L3Blcmwve2xpYnVyaS1wZXJsXzUuMjcuYmIgPT4gbGlidXJpLXBlcmxfNS4yOC5iYn0gICAgICAg
ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC97bGlidXJpLXBlcmxfNS4yNy5i
YiA9PiBsaWJ1cmktcGVybF81LjI4LmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9wZXJsL2xpYnVyaS1wZXJsLzAwMDEtU2tpcC1UT0RPLXRlc3QtY2FzZXMtdGhh
dC1mYWlsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidXJpLXBlcmwvMDAw
MS1Ta2lwLVRPRE8tdGVzdC1jYXNlcy10aGF0LWZhaWwucGF0Y2gKaW5kZXggZWQxZjI1MTI1Zi4u
Mzc0YmY1YjczMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidXJp
LXBlcmwvMDAwMS1Ta2lwLVRPRE8tdGVzdC1jYXNlcy10aGF0LWZhaWwucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidXJpLXBlcmwvMDAwMS1Ta2lwLVRPRE8tdGVzdC1j
YXNlcy10aGF0LWZhaWwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDVhNDI3MTQ1NjEwNGJk
ZjAyNzY0NGM4MWMzYTIwOGNkZTVjZjUyMmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDAwMjMzMjMwM2UyNDYxOWU0MjFmODY4MGE5ZjdhZDkyYTkwYWMwZmYgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBUaW0gT3JsaW5nIDx0aW0ub3JsaW5nQGtvbnN1bGtvLmNvbT4KIERh
dGU6IFRodSwgMTcgTm92IDIwMjIgMTY6MzM6MjAgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gU2tp
cCBUT0RPIHRlc3QgY2FzZXMgdGhhdCBmYWlsCkBAIC04LDcgKzgsNiBAQCBUT0RPIGNhc2VzIHJl
cG9ydCBhcyAibm90IG9rIiB3aXRoIHB0ZXN0LXJ1bm5lcgogVXBzdHJlYW0tU3RhdHVzOiBJbmFw
cHJvcHJpYXRlIFtwdGVzdC1ydW5uZXIgc3BlY2lmaWNdCiAKIFNpZ25lZC1vZmYtYnk6IFRpbSBP
cmxpbmcgPHRpbS5vcmxpbmdAa29uc3Vsa28uY29tPgotCiAtLS0KICB0L2VzY2FwZS1jaGFyLnQg
fCAyMCArKysrKysrKysrLS0tLS0tLS0tLQogIHQvaXJpLnQgICAgICAgICB8IDE4ICsrKysrKysr
Ky0tLS0tLS0tLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidXJp
LXBlcmxfNS4yNy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2xpYnVyaS1wZXJsXzUu
MjguYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BlcmwvbGlidXJpLXBlcmxfNS4yNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BlcmwvbGlidXJpLXBlcmxfNS4yOC5iYgppbmRleCBlNWRiN2IzY2ZlLi4xZmMwZWZkM2U1
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9saWJ1cmktcGVybF81LjI3
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2xpYnVyaS1wZXJsXzUuMjguYmIK
QEAgLTEyLDcgKzEyLDcgQEAgU1JDX1VSSSA9ICIke0NQQU5fTUlSUk9SfS9hdXRob3JzL2lkL08v
T0EvT0FMREVSUy9VUkktJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtU2tp
cC1UT0RPLXRlc3QtY2FzZXMtdGhhdC1mYWlsLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiMTE5NjJkOGE4YTg0OTY5MDZlNWQzNDc3NGFmZmMyMzVhMWM5NWMx
MTJkMzkwYzBiNDE3MWYzZTkxZTllMmE5NyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlNzk4NWRh
MzU5YjE1ZWZkMDA5MTdmYTcyMDI5MmI3MTFjMzk2ZjJmOWY5YTczNDllNGU3ZGVjNzRhYTc5NzY1
IgogCiBTID0gIiR7V09SS0RJUn0vVVJJLSR7UFZ9IgogCi0tIAoyLjQyLjAKCg==

--===============5074632901663065552==--

