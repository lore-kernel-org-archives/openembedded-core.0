Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC738C5475B
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:38 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.20162.1708018345192749775
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FygYX0Js;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=c3b9t6tr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018dadd3a1c0-4eacc0b3-c077-4724-a904-e3703bfa6309-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=opo4DiYNulzAnlZC5X81tShmGb5f5VkyhyO2pGcPC0M=;
	b=FygYX0JslRV2EiJ86aF5ajA5AWX3Z2qBvkcbF58U4LDhBFUK/kZ/uUf1N6xgXJ7i
	Qr0JOP6C22a5BG3DJDOCK0hBvX/8/PYgLwAZ6kuRGM0nZyluGFuErdQiL51ewYmBcZD
	FCGiW1U1krCn4Vure9sjSUhQbjZATifoVdo0babw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=opo4DiYNulzAnlZC5X81tShmGb5f5VkyhyO2pGcPC0M=;
	b=c3b9t6trddR2vF2Smm0CaNVTedo2/6yIltWPt5dlMnvvuAlLzTTMdztMpA2Ip5Ye
	OCT2nVxik59TNdgSOCDAynpZGmMUuyJtlpFh3ivbUa9NCUpJBer5tjMMDQI3iLeoQ7B
	K6MOQ2HVs9c99NzkbByligvPTWjgBMObaBRZkEb8=
Content-Type: multipart/mixed; boundary="===============3879958510487857952=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] liburi-perl: upgrading to 5.27 SUCCEEDED
Message-ID: <0101018dadd3a1c0-4eacc0b3-c077-4724-a904-e3703bfa6309-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195587

--===============3879958510487857952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *liburi-perl* to *5.27* has Succeeded.

Next steps:
    - apply the patch: git am 0001-liburi-perl-upgrade-5.25-5.27.patch
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
From 01826a7917b5194050e15dc1abf9f189aefb7d88 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 07:51:04 +0000
Subject: [PATCH] liburi-perl: upgrade 5.25 -> 5.27

---
 .../perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch  | 2 +-
 .../perl/{liburi-perl_5.25.bb => liburi-perl_5.27.bb}           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/perl/{liburi-perl_5.25.bb => liburi-perl_5.27.bb} (94%)

diff --git a/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch b/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
index ed1f25125f..e874e93a2b 100644
--- a/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
+++ b/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
@@ -1,4 +1,4 @@
-From 5a4271456104bdf027644c81c3a208cde5cf522e Mon Sep 17 00:00:00 2001
+From b7689095cb4920226d19abf834de16a638029b75 Mon Sep 17 00:00:00 2001
 From: Tim Orling <tim.orling@konsulko.com>
 Date: Thu, 17 Nov 2022 16:33:20 -0800
 Subject: [PATCH] Skip TODO test cases that fail
diff --git a/meta/recipes-devtools/perl/liburi-perl_5.25.bb b/meta/recipes-devtools/perl/liburi-perl_5.27.bb
similarity index 94%
rename from meta/recipes-devtools/perl/liburi-perl_5.25.bb
rename to meta/recipes-devtools/perl/liburi-perl_5.27.bb
index 0305955524..e5db7b3cfe 100644
--- a/meta/recipes-devtools/perl/liburi-perl_5.25.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_5.27.bb
@@ -12,7 +12,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/URI-${PV}.tar.gz \
            file://0001-Skip-TODO-test-cases-that-fail.patch \
            "
 
-SRC_URI[sha256sum] = "ef61941da09fff2503cea3692c4f2fc48c0e4442486e2a28345cb32d44d0d271"
+SRC_URI[sha256sum] = "11962d8a8a8496906e5d34774affc235a1c95c112d390c0b4171f3e91e9e2a97"
 
 S = "${WORKDIR}/URI-${PV}"
 
-- 
2.42.0


--===============3879958510487857952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/liburi-perl: PKGV changed from 5.25 [default] to 5.27 [default]
packages/core2-64-poky-linux/liburi-perl: SRC_URI changed from "https://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/URI-5.25.tar.gz file://0001-Skip-TODO-test-cases-that-fail.patch file://ptest-perl/run-ptest" to "https://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/URI-5.27.tar.gz file://0001-Skip-TODO-test-cases-that-fail.patch file://ptest-perl/run-ptest"
packages/core2-64-poky-linux/liburi-perl: PV changed from "5.25" to "5.27"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-dbg: PKGV changed from 5.25 [default] to 5.27 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-dbg: PV changed from "5.25" to "5.27"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-dev: PKGV changed from 5.25 [default] to 5.27 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-dev: PV changed from "5.25" to "5.27"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-doc: PKGSIZE changed from 95701 to 104194 (+9%)
packages/core2-64-poky-linux/liburi-perl/liburi-perl-doc: FILELIST: added "/usr/share/man/man3/URI::geo.3"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-doc: PKGV changed from 5.25 [default] to 5.27 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-doc: PV changed from "5.25" to "5.27"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-locale: PKGV changed from 5.25 [default] to 5.27 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-locale: PV changed from "5.25" to "5.27"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: PKGSIZE changed from 133030 to 137377 (+3%)
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: FILELIST: added "/usr/lib/liburi-perl/ptest/t/geo_construct.t /usr/lib/liburi-perl/ptest/t/geo_point.t /usr/lib/liburi-perl/ptest/t/geo_basic.t"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: PKGV changed from 5.25 [default] to 5.27 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: PV changed from "5.25" to "5.27"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-src: PKGV changed from 5.25 [default] to 5.27 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-src: PV changed from "5.25" to "5.27"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-staticdev: PKGV changed from 5.25 [default] to 5.27 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-staticdev: PV changed from "5.25" to "5.27"
packages/core2-64-poky-linux/liburi-perl/liburi-perl: PKGSIZE changed from 141387 to 152492 (+8%)
packages/core2-64-poky-linux/liburi-perl/liburi-perl: FILELIST: added "/usr/lib/perl5/vendor_perl/5.38.2/URI/geo.pm"
packages/core2-64-poky-linux/liburi-perl/liburi-perl: PKGV changed from 5.25 [default] to 5.27 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl: PV changed from "5.25" to "5.27"
Changes to packages/core2-64-poky-linux/liburi-perl (sysroot):
  /usr/lib/perl5/vendor_perl/5.38.2/URI/geo.pm was added

--===============3879958510487857952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/liburi-perl/liburi-perl-doc: FILELIST: added "/usr/share/man/man3/URI::geo.3"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: FILELIST: added "/usr/lib/liburi-perl/ptest/t/geo_point.t /usr/lib/liburi-perl/ptest/t/geo_construct.t /usr/lib/liburi-perl/ptest/t/geo_basic.t"
packages/core2-64-poky-linux/liburi-perl/liburi-perl: FILELIST: added "/usr/lib/perl5/vendor_perl/5.38.2/URI/geo.pm"
Changes to packages/core2-64-poky-linux/liburi-perl (sysroot):
  /usr/lib/perl5/vendor_perl/5.38.2/URI/geo.pm was added

--===============3879958510487857952==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-liburi-perl-upgrade-5.25-5.27.patch"

RnJvbSAwMTgyNmE3OTE3YjUxOTQwNTBlMTVkYzFhYmY5ZjE4OWFlZmI3ZDg4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMDc6NTE6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ1cmktcGVybDogdXBncmFkZSA1LjI1IC0+IDUuMjcKCi0tLQogLi4uL3BlcmwvbGlidXJpLXBl
cmwvMDAwMS1Ta2lwLVRPRE8tdGVzdC1jYXNlcy10aGF0LWZhaWwucGF0Y2ggIHwgMiArLQogLi4u
L3Blcmwve2xpYnVyaS1wZXJsXzUuMjUuYmIgPT4gbGlidXJpLXBlcmxfNS4yNy5iYn0gICAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Blcmwve2xpYnVyaS1wZXJsXzUuMjUu
YmIgPT4gbGlidXJpLXBlcmxfNS4yNy5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcGVybC9saWJ1cmktcGVybC8wMDAxLVNraXAtVE9ETy10ZXN0LWNhc2VzLXRo
YXQtZmFpbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2xpYnVyaS1wZXJsLzAw
MDEtU2tpcC1UT0RPLXRlc3QtY2FzZXMtdGhhdC1mYWlsLnBhdGNoCmluZGV4IGVkMWYyNTEyNWYu
LmU4NzRlOTNhMmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2xpYnVy
aS1wZXJsLzAwMDEtU2tpcC1UT0RPLXRlc3QtY2FzZXMtdGhhdC1mYWlsLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2xpYnVyaS1wZXJsLzAwMDEtU2tpcC1UT0RPLXRlc3Qt
Y2FzZXMtdGhhdC1mYWlsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1YTQyNzE0NTYxMDRi
ZGYwMjc2NDRjODFjM2EyMDhjZGU1Y2Y1MjJlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBiNzY4OTA5NWNiNDkyMDIyNmQxOWFiZjgzNGRlMTZhNjM4MDI5Yjc1IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogVGltIE9ybGluZyA8dGltLm9ybGluZ0Brb25zdWxrby5jb20+CiBE
YXRlOiBUaHUsIDE3IE5vdiAyMDIyIDE2OjMzOjIwIC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIFNr
aXAgVE9ETyB0ZXN0IGNhc2VzIHRoYXQgZmFpbApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3BlcmwvbGlidXJpLXBlcmxfNS4yNS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
ZXJsL2xpYnVyaS1wZXJsXzUuMjcuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidXJpLXBlcmxfNS4yNS5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidXJpLXBlcmxfNS4yNy5iYgppbmRleCAwMzA1
OTU1NTI0Li5lNWRiN2IzY2ZlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVy
bC9saWJ1cmktcGVybF81LjI1LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2xp
YnVyaS1wZXJsXzUuMjcuYmIKQEAgLTEyLDcgKzEyLDcgQEAgU1JDX1VSSSA9ICIke0NQQU5fTUlS
Uk9SfS9hdXRob3JzL2lkL08vT0EvT0FMREVSUy9VUkktJHtQVn0udGFyLmd6IFwKICAgICAgICAg
ICAgZmlsZTovLzAwMDEtU2tpcC1UT0RPLXRlc3QtY2FzZXMtdGhhdC1mYWlsLnBhdGNoIFwKICAg
ICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWY2MTk0MWRhMDlmZmYyNTAzY2Vh
MzY5MmM0ZjJmYzQ4YzBlNDQ0MjQ4NmUyYTI4MzQ1Y2IzMmQ0NGQwZDI3MSIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICIxMTk2MmQ4YThhODQ5NjkwNmU1ZDM0Nzc0YWZmYzIzNWExYzk1YzExMmQzOTBj
MGI0MTcxZjNlOTFlOWUyYTk3IgogCiBTID0gIiR7V09SS0RJUn0vVVJJLSR7UFZ9IgogCi0tIAoy
LjQyLjAKCg==

--===============3879958510487857952==--

