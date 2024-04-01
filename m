Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420C0CD13D0
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:33 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.1986.1711994600842351272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QrBvGMWL;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Mdhy4iUN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018e9ad47dd7-2d374427-9323-4da8-9048-b6452461ebd8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AkzZOsKsWFFg9E94D0aiWUOb3YisvlbD2EwQCkiFXx8=;
	b=QrBvGMWLhn0Nz9TxEl0XOTMG618TdusQY/stNFM838KuEx8MlP1YT4TPxBrjS5at
	uld5z4k0rqlEEpQOnNilGYgICx392i5AH7bca2Xm2xJ7RDhZfEnQj27Pehp0JPTmfxv
	zxG9MwgAj8Ft4MHMKeb8FXEBAmX59L3k/QI4W2sU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AkzZOsKsWFFg9E94D0aiWUOb3YisvlbD2EwQCkiFXx8=;
	b=Mdhy4iUNcPIGGfM70q63v/SrHipqtzhLhdiATxRo5MKP0e/vGbHHz9oXcDXyz5Ns
	X2FnZH/WD5J5U25OLxHlCouoUhfUC5HdLaev3fWHltcdW0musAH9qN+x2d4ss+EgB8u
	97NwiLW62m79Rye1nRzo4fCOR0vuMmanoSM25AWE=
Content-Type: multipart/mixed; boundary="===============6304705330504259327=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] liburi-perl: upgrading to 5.28 SUCCEEDED
Message-ID: <0101018e9ad47dd7-2d374427-9323-4da8-9048-b6452461ebd8-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:20 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197701

--===============6304705330504259327==
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
From e446f09c28d0f94cedd01e55bd92ce32b25190ff Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 07:30:33 +0000
Subject: [PATCH] liburi-perl: upgrade 5.27 -> 5.28

---
 .../perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch | 3 +--
 .../perl/{liburi-perl_5.27.bb => liburi-perl_5.28.bb}          | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/perl/{liburi-perl_5.27.bb => liburi-perl_5.28.bb} (94%)

diff --git a/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch b/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
index ed1f25125f..aa5ab39c06 100644
--- a/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
+++ b/meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
@@ -1,4 +1,4 @@
-From 5a4271456104bdf027644c81c3a208cde5cf522e Mon Sep 17 00:00:00 2001
+From a46b5d7d5078f53865fd49a2ee6bc3172f6f6901 Mon Sep 17 00:00:00 2001
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


--===============6304705330504259327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/liburi-perl: PV changed from "5.27" to "5.28"
packages/core2-64-poky-linux/liburi-perl: PKGV changed from 5.27 [default] to 5.28 [default]
packages/core2-64-poky-linux/liburi-perl: SRC_URI changed from "https://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/URI-5.27.tar.gz file://0001-Skip-TODO-test-cases-that-fail.patch file://ptest-perl/run-ptest" to "https://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/URI-5.28.tar.gz file://0001-Skip-TODO-test-cases-that-fail.patch file://ptest-perl/run-ptest"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-dbg: PV changed from "5.27" to "5.28"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-dbg: PKGV changed from 5.27 [default] to 5.28 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-dev: PV changed from "5.27" to "5.28"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-dev: PKGV changed from 5.27 [default] to 5.28 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-doc: PV changed from "5.27" to "5.28"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-doc: PKGV changed from 5.27 [default] to 5.28 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-locale: PV changed from "5.27" to "5.28"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-locale: PKGV changed from 5.27 [default] to 5.28 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: PV changed from "5.27" to "5.28"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: PKGV changed from 5.27 [default] to 5.28 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-ptest: PKGSIZE changed from 137377 to 140064 (+2%)
packages/core2-64-poky-linux/liburi-perl/liburi-perl-src: PV changed from "5.27" to "5.28"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-src: PKGV changed from 5.27 [default] to 5.28 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl-staticdev: PV changed from "5.27" to "5.28"
packages/core2-64-poky-linux/liburi-perl/liburi-perl-staticdev: PKGV changed from 5.27 [default] to 5.28 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl: PV changed from "5.27" to "5.28"
packages/core2-64-poky-linux/liburi-perl/liburi-perl: PKGV changed from 5.27 [default] to 5.28 [default]
packages/core2-64-poky-linux/liburi-perl/liburi-perl: PKGSIZE changed from 152492 to 152722 (+0%)

--===============6304705330504259327==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-liburi-perl-upgrade-5.27-5.28.patch"

RnJvbSBlNDQ2ZjA5YzI4ZDBmOTRjZWRkMDFlNTViZDkyY2UzMmIyNTE5MGZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwNzozMDozMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnVyaS1wZXJsOiB1cGdyYWRlIDUuMjcgLT4gNS4yOAoKLS0tCiAuLi4vcGVybC9saWJ1cmktcGVy
bC8wMDAxLVNraXAtVE9ETy10ZXN0LWNhc2VzLXRoYXQtZmFpbC5wYXRjaCB8IDMgKy0tCiAuLi4v
cGVybC97bGlidXJpLXBlcmxfNS4yNy5iYiA9PiBsaWJ1cmktcGVybF81LjI4LmJifSAgICAgICAg
ICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL3tsaWJ1cmktcGVybF81LjI3LmJi
ID0+IGxpYnVyaS1wZXJsXzUuMjguYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3BlcmwvbGlidXJpLXBlcmwvMDAwMS1Ta2lwLVRPRE8tdGVzdC1jYXNlcy10aGF0
LWZhaWwucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9saWJ1cmktcGVybC8wMDAx
LVNraXAtVE9ETy10ZXN0LWNhc2VzLXRoYXQtZmFpbC5wYXRjaAppbmRleCBlZDFmMjUxMjVmLi5h
YTVhYjM5YzA2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9saWJ1cmkt
cGVybC8wMDAxLVNraXAtVE9ETy10ZXN0LWNhc2VzLXRoYXQtZmFpbC5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcGVybC9saWJ1cmktcGVybC8wMDAxLVNraXAtVE9ETy10ZXN0LWNh
c2VzLXRoYXQtZmFpbC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNWE0MjcxNDU2MTA0YmRm
MDI3NjQ0YzgxYzNhMjA4Y2RlNWNmNTIyZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
YTQ2YjVkN2Q1MDc4ZjUzODY1ZmQ0OWEyZWU2YmMzMTcyZjZmNjkwMSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IFRpbSBPcmxpbmcgPHRpbS5vcmxpbmdAa29uc3Vsa28uY29tPgogRGF0
ZTogVGh1LCAxNyBOb3YgMjAyMiAxNjozMzoyMCAtMDgwMAogU3ViamVjdDogW1BBVENIXSBTa2lw
IFRPRE8gdGVzdCBjYXNlcyB0aGF0IGZhaWwKQEAgLTgsNyArOCw2IEBAIFRPRE8gY2FzZXMgcmVw
b3J0IGFzICJub3Qgb2siIHdpdGggcHRlc3QtcnVubmVyCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBw
cm9wcmlhdGUgW3B0ZXN0LXJ1bm5lciBzcGVjaWZpY10KIAogU2lnbmVkLW9mZi1ieTogVGltIE9y
bGluZyA8dGltLm9ybGluZ0Brb25zdWxrby5jb20+Ci0KIC0tLQogIHQvZXNjYXBlLWNoYXIudCB8
IDIwICsrKysrKysrKystLS0tLS0tLS0tCiAgdC9pcmkudCAgICAgICAgIHwgMTggKysrKysrKysr
LS0tLS0tLS0tCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9saWJ1cmkt
cGVybF81LjI3LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidXJpLXBlcmxfNS4y
OC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGVybC9saWJ1cmktcGVybF81LjI3LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGVybC9saWJ1cmktcGVybF81LjI4LmJiCmluZGV4IGU1ZGI3YjNjZmUuLjFmYzBlZmQzZTUg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2xpYnVyaS1wZXJsXzUuMjcu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidXJpLXBlcmxfNS4yOC5iYgpA
QCAtMTIsNyArMTIsNyBAQCBTUkNfVVJJID0gIiR7Q1BBTl9NSVJST1J9L2F1dGhvcnMvaWQvTy9P
QS9PQUxERVJTL1VSSS0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1Ta2lw
LVRPRE8tdGVzdC1jYXNlcy10aGF0LWZhaWwucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICIxMTk2MmQ4YThhODQ5NjkwNmU1ZDM0Nzc0YWZmYzIzNWExYzk1YzEx
MmQzOTBjMGI0MTcxZjNlOTFlOWUyYTk3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImU3OTg1ZGEz
NTliMTVlZmQwMDkxN2ZhNzIwMjkyYjcxMWMzOTZmMmY5ZjlhNzM0OWU0ZTdkZWM3NGFhNzk3NjUi
CiAKIFMgPSAiJHtXT1JLRElSfS9VUkktJHtQVn0iCiAKLS0gCjIuNDIuMAoK

--===============6304705330504259327==--

