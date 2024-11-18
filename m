Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD90D62052
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:42 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.4835.1731964643802447174
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=K8esIQz0;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ICxM1usQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019341234a19-e9412202-5de5-44d8-bf4f-a6ca0f46a1ec-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964652;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ci9jDZuzb0R88TP3swp7dVE1uYGSCrYB2ySeYQvmszk=;
	b=K8esIQz05dCiyh4+nRjt7m9dMfxPPrPMtTsH3D2jBaI1LOECBg1jkeo2i/O5zPRV
	2d9zdsmnFKQrvXruSqEqFGUMa5LqK5hEJqsClevGwIenNIbxXW3+MCJsWPaoLFa4wFo
	qQ8aBLdZlGmvxXljj7RNO6lSnlbg/JO/YDtdCpVM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964652;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ci9jDZuzb0R88TP3swp7dVE1uYGSCrYB2ySeYQvmszk=;
	b=ICxM1usQiBfrqJR3nNC1TIH2IosyMpqkX0lO9OnmogpkzZURBtFNboDHOkFS+XLI
	oZXZ/vVh7Ncvzn8fb48Tf0t6lPyUl5Dw1q/aEPkfaxS/6G4e5oA2Pecf2HFr30mtWbL
	2pUBXbGYtU/EeCDH5cfBB4vZ4WLBzAp4+XQwctUU=
Content-Type: multipart/mixed; boundary="===============8569165808367770457=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsolv: upgrading to 0.7.31 SUCCEEDED
Message-ID: <0101019341234a19-e9412202-5de5-44d8-bf4f-a6ca0f46a1ec-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207312

--===============8569165808367770457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libsolv* to *0.7.31* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsolv-upgrade-0.7.30-0.7.31.patch
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
From d1d736f460a4b45cf2e2627b373e3521bdce5457 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 17 Nov 2024 09:47:57 +0000
Subject: [PATCH] libsolv: upgrade 0.7.30 -> 0.7.31

---
 .../libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch | 2 +-
 .../libsolv/{libsolv_0.7.30.bb => libsolv_0.7.31.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.30.bb => libsolv_0.7.31.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch b/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
index da93a12ed5..d6e983dec8 100644
--- a/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
+++ b/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
@@ -1,4 +1,4 @@
-From e1db3c41fa84391b7ab299f7351f58b413ed2994 Mon Sep 17 00:00:00 2001
+From da99bf09e83469612e2c821696025a4e591bb95c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 28 Oct 2021 22:28:45 -0700
 Subject: [PATCH] utils: Conside musl when wrapping qsort_r
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.30.bb b/meta/recipes-extended/libsolv/libsolv_0.7.31.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.7.30.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.31.bb
index 20d1baaaaf..b395ff972d 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.30.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.31.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
 "
 
-SRCREV = "27aa6a72c7db73d78aa711ae412231768e77c9e0"
+SRCREV = "95aef5cc57d0f51782e55b6903b30ec93afbfa15"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.44.1


--===============8569165808367770457==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsolv-upgrade-0.7.30-0.7.31.patch"

RnJvbSBkMWQ3MzZmNDYwYTRiNDVjZjJlMjYyN2IzNzNlMzUyMWJkY2U1NDU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTcgTm92IDIwMjQgMDk6NDc6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJzb2x2OiB1cGdyYWRlIDAuNy4zMCAtPiAwLjcuMzEKCi0tLQogLi4uL2xpYnNvbHYvMDAwMS11
dGlscy1Db25zaWRlLW11c2wtd2hlbi13cmFwcGluZy1xc29ydF9yLnBhdGNoIHwgMiArLQogLi4u
L2xpYnNvbHYve2xpYnNvbHZfMC43LjMwLmJiID0+IGxpYnNvbHZfMC43LjMxLmJifSAgICAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYve2xpYnNvbHZfMC43LjMw
LmJiID0+IGxpYnNvbHZfMC43LjMxLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9saWJzb2x2L2xpYnNvbHYvMDAwMS11dGlscy1Db25zaWRlLW11c2wtd2hlbi13
cmFwcGluZy1xc29ydF9yLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGli
c29sdi8wMDAxLXV0aWxzLUNvbnNpZGUtbXVzbC13aGVuLXdyYXBwaW5nLXFzb3J0X3IucGF0Y2gK
aW5kZXggZGE5M2ExMmVkNS4uZDZlOTgzZGVjOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2xpYnNvbHYvbGlic29sdi8wMDAxLXV0aWxzLUNvbnNpZGUtbXVzbC13aGVuLXdyYXBw
aW5nLXFzb3J0X3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGli
c29sdi8wMDAxLXV0aWxzLUNvbnNpZGUtbXVzbC13aGVuLXdyYXBwaW5nLXFzb3J0X3IucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGUxZGIzYzQxZmE4NDM5MWI3YWIyOTlmNzM1MWY1OGI0MTNl
ZDI5OTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGRhOTliZjA5ZTgzNDY5NjEyZTJj
ODIxNjk2MDI1YTRlNTkxYmI5NWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVt
IFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogVGh1LCAyOCBPY3QgMjAyMSAyMjoyODo0
NSAtMDcwMAogU3ViamVjdDogW1BBVENIXSB1dGlsczogQ29uc2lkZSBtdXNsIHdoZW4gd3JhcHBp
bmcgcXNvcnRfcgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGli
c29sdl8wLjcuMzAuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi9saWJzb2x2XzAu
Ny4zMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvbGlic29sdi9saWJzb2x2XzAuNy4zMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2xpYnNvbHYvbGlic29sdl8wLjcuMzEuYmIKaW5kZXggMjBkMWJhYWFhZi4uYjM5NWZm
OTcyZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGlic29sdl8w
LjcuMzAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGlic29sdl8wLjcu
MzEuYmIKQEAgLTEyLDcgKzEyLDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL29wZW5T
VVNFL2xpYnNvbHYuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAg
ICBmaWxlOi8vMDAwMS11dGlscy1Db25zaWRlLW11c2wtd2hlbi13cmFwcGluZy1xc29ydF9yLnBh
dGNoIFwKICIKIAotU1JDUkVWID0gIjI3YWE2YTcyYzdkYjczZDc4YWE3MTFhZTQxMjIzMTc2OGU3
N2M5ZTAiCitTUkNSRVYgPSAiOTVhZWY1Y2M1N2QwZjUxNzgyZTU1YjY5MDNiMzBlYzkzYWZiZmEx
NSIKIAogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAiKD9QPHB2ZXI+XGQrKFwuXGQrKSsp
IgogCi0tIAoyLjQ0LjEKCg==

--===============8569165808367770457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libsolv: PV changed from "0.7.30" to "0.7.31"
packages/core2-64-poky-linux/libsolv: PKGV changed from 0.7.30 [default] to 0.7.31 [default]
packages/core2-64-poky-linux/libsolv/libsolv-dbg: PV changed from "0.7.30" to "0.7.31"
packages/core2-64-poky-linux/libsolv/libsolv-dbg: PKGV changed from 0.7.30 [default] to 0.7.31 [default]
packages/core2-64-poky-linux/libsolv/libsolv-dbg: PKGSIZE changed from 2878528 to 2888392 (+0%)
packages/core2-64-poky-linux/libsolv/libsolv-dev: PV changed from "0.7.30" to "0.7.31"
packages/core2-64-poky-linux/libsolv/libsolv-dev: PKGV changed from 0.7.30 [default] to 0.7.31 [default]
packages/core2-64-poky-linux/libsolv/libsolv-dev: PKGSIZE changed from 129445 to 129868 (+0%)
packages/core2-64-poky-linux/libsolv/libsolv-doc: PV changed from "0.7.30" to "0.7.31"
packages/core2-64-poky-linux/libsolv/libsolv-doc: PKGV changed from 0.7.30 [default] to 0.7.31 [default]
packages/core2-64-poky-linux/libsolv/libsolv-locale: PV changed from "0.7.30" to "0.7.31"
packages/core2-64-poky-linux/libsolv/libsolv-locale: PKGV changed from 0.7.30 [default] to 0.7.31 [default]
packages/core2-64-poky-linux/libsolv/libsolv-src: PV changed from "0.7.30" to "0.7.31"
packages/core2-64-poky-linux/libsolv/libsolv-src: PKGV changed from 0.7.30 [default] to 0.7.31 [default]
packages/core2-64-poky-linux/libsolv/libsolv-src: PKGSIZE changed from 1647716 to 1652367 (+0%)
packages/core2-64-poky-linux/libsolv/libsolv-staticdev: PV changed from "0.7.30" to "0.7.31"
packages/core2-64-poky-linux/libsolv/libsolv-staticdev: PKGV changed from 0.7.30 [default] to 0.7.31 [default]
packages/core2-64-poky-linux/libsolv/libsolv-tools: PV changed from "0.7.30" to "0.7.31"
packages/core2-64-poky-linux/libsolv/libsolv-tools: PKGV changed from 0.7.30 [default] to 0.7.31 [default]
packages/core2-64-poky-linux/libsolv/libsolv: PV changed from "0.7.30" to "0.7.31"
packages/core2-64-poky-linux/libsolv/libsolv: PKGV changed from 0.7.30 [default] to 0.7.31 [default]
packages/core2-64-poky-linux/libsolv/libsolvext: PV changed from "0.7.30" to "0.7.31"
packages/core2-64-poky-linux/libsolv/libsolvext: PKGV changed from 0.7.30 [default] to 0.7.31 [default]

--===============8569165808367770457==--

