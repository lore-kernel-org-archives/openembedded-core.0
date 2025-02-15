Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5213CC021B4
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:21 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.8099.1739623336236227279
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=QORRsmFK;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=FUaLxJlJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019509a1865c-021d0776-1ab9-40b3-8234-7667872b4552-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+gCA3X0OGBJfkGp5cJBx3AXGSvNK0dSsBzor3Knvdt8=;
	b=QORRsmFKGoZKBUWhV5bXLnnQ4HHRWO0js/QxD+3Wf/33R8dnEmDHs+bZNBDWaxHv
	FTkHc4JNftxILX3cEBaeEV/Pu7SkogSTpF27yn8etgbtRqywls/IB/j+ioaI9GvHIVK
	AWX2HtKTmhpoHsj+qQ2t7Hgcyusf74OFFQcrwEqg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+gCA3X0OGBJfkGp5cJBx3AXGSvNK0dSsBzor3Knvdt8=;
	b=FUaLxJlJrC5d0n4dZaDEHfPtJZAXO7HDM0MwSfCX+XFPhs6RUN2sFzow61Xtdl0F
	O/vSkw2mbO3XU0g6j0Yiu0rvnzTgg9BFkeWw2Dz6wmXOJulIFxa9YSrSzmkTywD0+ys
	Bsa6ryyXDkRpuwiGmrs13sEWL24RbojHi7TzQVZk=
Content-Type: multipart/mixed; boundary="===============8545339527827297523=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtest-warnings-perl: upgrading to 0.038 SUCCEEDED
Message-ID: <0101019509a1865c-021d0776-1ab9-40b3-8234-7667872b4552-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211417

--===============8545339527827297523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libtest-warnings-perl* to *0.038* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libtest-warnings-perl-upgrade-0.037-0.038.patch
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
From 627da0601d2890bf59950242105ab767e2e443d9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 07:24:42 +0000
Subject: [PATCH] libtest-warnings-perl: upgrade 0.037 -> 0.038

---
 ...st-warnings-perl_0.037.bb => libtest-warnings-perl_0.038.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl/{libtest-warnings-perl_0.037.bb => libtest-warnings-perl_0.038.bb} (93%)

diff --git a/meta/recipes-devtools/perl/libtest-warnings-perl_0.037.bb b/meta/recipes-devtools/perl/libtest-warnings-perl_0.038.bb
similarity index 93%
rename from meta/recipes-devtools/perl/libtest-warnings-perl_0.037.bb
rename to meta/recipes-devtools/perl/libtest-warnings-perl_0.038.bb
index 1cdc93d776..656b38f2d8 100644
--- a/meta/recipes-devtools/perl/libtest-warnings-perl_0.037.bb
+++ b/meta/recipes-devtools/perl/libtest-warnings-perl_0.038.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=f98106ac3cc05d9cbebcdb8fbf7b7815"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Test-Warnings-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "682de3e7a3e8ac9265c53d0e314b8b903294c5199c005bd37e808f4484c25df2"
+SRC_URI[sha256sum] = "3da27e003a3c3cafed3c09b42be05cf9bdbff0bee5c8590a731b02853880a273"
 
 S = "${WORKDIR}/Test-Warnings-${PV}"
 
-- 
2.44.1


--===============8545339527827297523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libtest-warnings-perl: PV changed from "0.037" to "0.038"
packages/core2-64-poky-linux/libtest-warnings-perl: PKGV changed from 0.037 [default] to 0.038 [default]
packages/core2-64-poky-linux/libtest-warnings-perl: SRC_URI changed from "https://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Test-Warnings-0.037.tar.gz file://ptest-perl/run-ptest" to "https://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Test-Warnings-0.038.tar.gz file://ptest-perl/run-ptest"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-dbg: PV changed from "0.037" to "0.038"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-dbg: PKGV changed from 0.037 [default] to 0.038 [default]
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-dev: PV changed from "0.037" to "0.038"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-dev: PKGV changed from 0.037 [default] to 0.038 [default]
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-doc: PV changed from "0.037" to "0.038"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-doc: PKGV changed from 0.037 [default] to 0.038 [default]
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-locale: PV changed from "0.037" to "0.038"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-locale: PKGV changed from 0.037 [default] to 0.038 [default]
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-ptest: PV changed from "0.037" to "0.038"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-ptest: PKGSIZE changed from 38516 to 38658 (+0%)
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-ptest: PKGV changed from 0.037 [default] to 0.038 [default]
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-src: PV changed from "0.037" to "0.038"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-src: PKGV changed from 0.037 [default] to 0.038 [default]
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-staticdev: PV changed from "0.037" to "0.038"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl-staticdev: PKGV changed from 0.037 [default] to 0.038 [default]
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl: PV changed from "0.037" to "0.038"
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl: PKGSIZE changed from 20857 to 20898 (+0%)
packages/core2-64-poky-linux/libtest-warnings-perl/libtest-warnings-perl: PKGV changed from 0.037 [default] to 0.038 [default]

--===============8545339527827297523==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libtest-warnings-perl-upgrade-0.037-0.038.patch"

RnJvbSA2MjdkYTA2MDFkMjg5MGJmNTk5NTAyNDIxMDVhYjc2N2UyZTQ0M2Q5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMDc6MjQ6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ0ZXN0LXdhcm5pbmdzLXBlcmw6IHVwZ3JhZGUgMC4wMzcgLT4gMC4wMzgKCi0tLQogLi4uc3Qt
d2FybmluZ3MtcGVybF8wLjAzNy5iYiA9PiBsaWJ0ZXN0LXdhcm5pbmdzLXBlcmxfMC4wMzguYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Blcmwve2xpYnRlc3Qtd2FybmluZ3MtcGVybF8w
LjAzNy5iYiA9PiBsaWJ0ZXN0LXdhcm5pbmdzLXBlcmxfMC4wMzguYmJ9ICg5MyUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidGVzdC13YXJuaW5ncy1wZXJsXzAu
MDM3LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidGVzdC13YXJuaW5ncy1wZXJs
XzAuMDM4LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9wZXJsL2xpYnRlc3Qtd2FybmluZ3MtcGVybF8wLjAzNy5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlidGVzdC13YXJuaW5ncy1wZXJsXzAuMDM4LmJiCmlu
ZGV4IDFjZGM5M2Q3NzYuLjY1NmIzOGYyZDggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9wZXJsL2xpYnRlc3Qtd2FybmluZ3MtcGVybF8wLjAzNy5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcGVybC9saWJ0ZXN0LXdhcm5pbmdzLXBlcmxfMC4wMzguYmIKQEAgLTE1LDcg
KzE1LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5DRTttZDU9Zjk4MTA2YWMz
Y2MwNWQ5Y2JlYmNkYjhmYmY3Yjc4MTUiCiAKIFNSQ19VUkkgPSAiJHtDUEFOX01JUlJPUn0vYXV0
aG9ycy9pZC9FL0VUL0VUSEVSL1Rlc3QtV2FybmluZ3MtJHtQVn0udGFyLmd6IgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNjgyZGUzZTdhM2U4YWM5MjY1YzUzZDBlMzE0YjhiOTAzMjk0YzUxOTlj
MDA1YmQzN2U4MDhmNDQ4NGMyNWRmMiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzZGEyN2UwMDNh
M2MzY2FmZWQzYzA5YjQyYmUwNWNmOWJkYmZmMGJlZTVjODU5MGE3MzFiMDI4NTM4ODBhMjczIgog
CiBTID0gIiR7V09SS0RJUn0vVGVzdC1XYXJuaW5ncy0ke1BWfSIKIAotLSAKMi40NC4xCgo=

--===============8545339527827297523==--

