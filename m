Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B254C54EC8
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:21 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.2101.1706810405467394132
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TWyozBGv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rx79vrPj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018d65d3ef59-f526d9b4-d6a4-4ba4-9286-28c3f1ccc81e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810404;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=USxsEul5G89SdNnbGeZxMKPy1TyFRoGBoRjcm01ReWo=;
	b=TWyozBGvDS7gYdW8NWWHD9Xz3xIrVZ1lw68Xrms/ZBDDg6vCBijraAwvSsAwzXUa
	707qXS6F827jyXSejy3LnS977UiICd21QnWbkaV0Uo1/j+5cNmjFd8k7G3AqfIR9gha
	sr4fVhUEC56MEliupUH9m+REtaA4eVgasS4tzmDw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810404;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=USxsEul5G89SdNnbGeZxMKPy1TyFRoGBoRjcm01ReWo=;
	b=rx79vrPjROD7H6y9UK5VFjeScYvvq0lBGB9HoPMdCu+zvdIIRtdw71knFCkLO1vV
	QeeYYEyXLOptqpRi7tpOcKk6hcm8Cz9o7Dtjo49pjdBar2AFXEL/nVTyaL4fCA9DORs
	83mDTFget1vSdSjKJlZCZLQ8/cU/KEZeSBeZKjsM=
Content-Type: multipart/mixed; boundary="===============3401210624560662657=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtest-warnings-perl: upgrading to 0.033 SUCCEEDED
Message-ID: <0101018d65d3ef59-f526d9b4-d6a4-4ba4-9286-28c3f1ccc81e-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194621

--===============3401210624560662657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libtest-warnings-perl* to *0.033* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libtest-warnings-perl-upgrade-0.032-0.033.patch
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
From 8f54d9556ed902e3202600a3e1ff84fb3ec9fd2f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 07:22:12 +0000
Subject: [PATCH] libtest-warnings-perl: upgrade 0.032 -> 0.033

---
 ...st-warnings-perl_0.032.bb => libtest-warnings-perl_0.033.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl/{libtest-warnings-perl_0.032.bb => libtest-warnings-perl_0.033.bb} (93%)

diff --git a/meta/recipes-devtools/perl/libtest-warnings-perl_0.032.bb b/meta/recipes-devtools/perl/libtest-warnings-perl_0.033.bb
similarity index 93%
rename from meta/recipes-devtools/perl/libtest-warnings-perl_0.032.bb
rename to meta/recipes-devtools/perl/libtest-warnings-perl_0.033.bb
index 5876e8a63c..17b4cc3c9e 100644
--- a/meta/recipes-devtools/perl/libtest-warnings-perl_0.032.bb
+++ b/meta/recipes-devtools/perl/libtest-warnings-perl_0.033.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=f98106ac3cc05d9cbebcdb8fbf7b7815"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Test-Warnings-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "4727dae2416e9f07e41e2dc3a9143ba6affc1ec57652117c99d50038e313e9d9"
+SRC_URI[sha256sum] = "b9c375719f2c61c5f97aa5ee6cf4c901a972347c415969379b0b51f67c48bbcb"
 
 S = "${WORKDIR}/Test-Warnings-${PV}"
 
-- 
2.42.0


--===============3401210624560662657==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libtest-warnings-perl-upgrade-0.032-0.033.patch"

RnJvbSA4ZjU0ZDk1NTZlZDkwMmUzMjAyNjAwYTNlMWZmODRmYjNlYzlmZDJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAwNzoyMjoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnRlc3Qtd2FybmluZ3MtcGVybDogdXBncmFkZSAwLjAzMiAtPiAwLjAzMwoKLS0tCiAuLi5zdC13
YXJuaW5ncy1wZXJsXzAuMDMyLmJiID0+IGxpYnRlc3Qtd2FybmluZ3MtcGVybF8wLjAzMy5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC97bGlidGVzdC13YXJuaW5ncy1wZXJsXzAu
MDMyLmJiID0+IGxpYnRlc3Qtd2FybmluZ3MtcGVybF8wLjAzMy5iYn0gKDkzJSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9saWJ0ZXN0LXdhcm5pbmdzLXBlcmxfMC4w
MzIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9saWJ0ZXN0LXdhcm5pbmdzLXBlcmxf
MC4wMzMuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3BlcmwvbGlidGVzdC13YXJuaW5ncy1wZXJsXzAuMDMyLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcGVybC9saWJ0ZXN0LXdhcm5pbmdzLXBlcmxfMC4wMzMuYmIKaW5k
ZXggNTg3NmU4YTYzYy4uMTdiNGNjM2M5ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BlcmwvbGlidGVzdC13YXJuaW5ncy1wZXJsXzAuMDMyLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9wZXJsL2xpYnRlc3Qtd2FybmluZ3MtcGVybF8wLjAzMy5iYgpAQCAtMTUsNyAr
MTUsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTkNFO21kNT1mOTgxMDZhYzNj
YzA1ZDljYmViY2RiOGZiZjdiNzgxNSIKIAogU1JDX1VSSSA9ICIke0NQQU5fTUlSUk9SfS9hdXRo
b3JzL2lkL0UvRVQvRVRIRVIvVGVzdC1XYXJuaW5ncy0ke1BWfS50YXIuZ3oiCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI0NzI3ZGFlMjQxNmU5ZjA3ZTQxZTJkYzNhOTE0M2JhNmFmZmMxZWM1NzY1
MjExN2M5OWQ1MDAzOGUzMTNlOWQ5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImI5YzM3NTcxOWYy
YzYxYzVmOTdhYTVlZTZjZjRjOTAxYTk3MjM0N2M0MTU5NjkzNzliMGI1MWY2N2M0OGJiY2IiCiAK
IFMgPSAiJHtXT1JLRElSfS9UZXN0LVdhcm5pbmdzLSR7UFZ9IgogCi0tIAoyLjQyLjAKCg==

--===============3401210624560662657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-ptest: FILELIST: added "/usr/lib/libtest-warnings-perl/ptest/t/25-allowed_patterns.t"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl: PKGSIZE changed from 15277 to 17943 (+17%)

--===============3401210624560662657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libtest-warnings-perl: PV changed from "0.032" to "0.033"
packages/core2-64-poky-linux/libtest-warnings-perl: SRC_URI changed from "https://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Test-Warnings-0.032.tar.gz file://ptest-perl/run-ptest" to "https://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Test-Warnings-0.033.tar.gz file://ptest-perl/run-ptest"
packages/core2-64-poky-linux/libtest-warnings-perl: PKGV changed from 0.032 [default] to 0.033 [default]
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-dbg: PV changed from "0.032" to "0.033"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-dbg: PKGV changed from 0.032 [default] to 0.033 [default]
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-dev: PV changed from "0.032" to "0.033"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-dev: PKGV changed from 0.032 [default] to 0.033 [default]
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-doc: PKGSIZE changed from 13754 to 14935 (+9%)
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-doc: PV changed from "0.032" to "0.033"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-doc: PKGV changed from 0.032 [default] to 0.033 [default]
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-locale: PV changed from "0.032" to "0.033"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-locale: PKGV changed from 0.032 [default] to 0.033 [default]
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-ptest: PKGSIZE changed from 37345 to 37901 (+1%)
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-ptest: PV changed from "0.032" to "0.033"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-ptest: PKGV changed from 0.032 [default] to 0.033 [default]
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-ptest: FILELIST: added "/usr/lib/libtest-warnings-perl/ptest/t/25-allowed_patterns.t"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-src: PV changed from "0.032" to "0.033"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-src: PKGV changed from 0.032 [default] to 0.033 [default]
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-staticdev: PV changed from "0.032" to "0.033"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-staticdev: PKGV changed from 0.032 [default] to 0.033 [default]
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl: PKGSIZE changed from 15277 to 17943 (+17%)
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl: PV changed from "0.032" to "0.033"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl: PKGV changed from 0.032 [default] to 0.033 [default]

--===============3401210624560662657==--

