Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE780C71148
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:35 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.144497.1671136351519799536
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Oeb8Y3Kr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010185177d1157-18ca383c-a275-4406-96cf-4a9bcb99947b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AwGD1Y1U5FgO8bcl1W+c+7QRybI+EQu7iTHpygnm7Ko=;
	b=Oeb8Y3Kr6Vvf5Y4IP0GIF7DqUvpMUisIlokZXP0jtOg46yfMs5DfsxH/olKDv+/D
	UYO6cRIZbYs1IQsDp/L1B0YEEkG7KUklkisz2Yq7RHR3xj6nZtAkM1GdQHFfpPh5S8/
	DPGQlSHsUoe/jQ/bmodYkOHoWEELfRqfbCOC5TcI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AwGD1Y1U5FgO8bcl1W+c+7QRybI+EQu7iTHpygnm7Ko=;
	b=YbraK7YOMz/2aVV3Aec0mSV2TJew31DuJxSAKTTG8EntO8QL6SQnsUjOaqwbpGD9
	AdQSrCy36h8ScFRuFCi4vR9XZ4z2/lbxV0g/xG9e1yLjcYRfeEusweX5qtPDQ587v9r
	UNFn/bilY51ARwscLTGO+5OBCNqWuKwrY21QwL2E=
Content-Type: multipart/mixed; boundary="===============6041808034710810863=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libmodule-build-perl: upgrading to 0.4232 FAILED
Message-ID: <01010185177d1157-18ca383c-a275-4406-96cf-4a9bcb99947b-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:30 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174639

--===============6041808034710810863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libmodule-build-perl* to *0.4232* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libmodule-build-perl-upgrade-0.4231-0.4232.patch
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
--===============6041808034710810863==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libmodule-build-perl-upgrade-0.4231-0.4232.patch"

RnJvbSAwMzg5OGJlMDZjYjRkOTczMGE1MWZmNjAyNTczMmE5NDcxYTExM2VlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMDk6NTc6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJtb2R1bGUtYnVpbGQtcGVybDogdXBncmFkZSAwLjQyMzEgLT4gMC40MjMyCgotLS0KIC4uLjAw
MS1Db21taXR0aW5nLWNoYW5nZXMtZnJvbS1kb19wYXRjaC5wYXRjaCB8IDIyICsrKysrKysrKysr
KysrKwogLi4uNDIzMS5iYiA9PiBsaWJtb2R1bGUtYnVpbGQtcGVybF8wLjQyMzIuYmJ9IHwgMjcg
KysrKysrKysrKysrKysrKy0tLQogMiBmaWxlcyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
ZXJsL2xpYm1vZHVsZS1idWlsZC1wZXJsLzAwMDEtQ29tbWl0dGluZy1jaGFuZ2VzLWZyb20tZG9f
cGF0Y2gucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC97bGlibW9kdWxl
LWJ1aWxkLXBlcmxfMC40MjMxLmJiID0+IGxpYm1vZHVsZS1idWlsZC1wZXJsXzAuNDIzMi5iYn0g
KDgyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9saWJtb2R1bGUt
YnVpbGQtcGVybC8wMDAxLUNvbW1pdHRpbmctY2hhbmdlcy1mcm9tLWRvX3BhdGNoLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlibW9kdWxlLWJ1aWxkLXBlcmwvMDAwMS1Db21t
aXR0aW5nLWNoYW5nZXMtZnJvbS1kb19wYXRjaC5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwMDAwLi4xYjBjZGQyZjkxCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3BlcmwvbGlibW9kdWxlLWJ1aWxkLXBlcmwvMDAwMS1Db21taXR0aW5nLWNo
YW5nZXMtZnJvbS1kb19wYXRjaC5wYXRjaApAQCAtMCwwICsxLDIyIEBACitGcm9tIDk4YjZhZjE2
ZGE2OGQzZjczMWEwODU3Mzc2N2UzOWE3M2JkZDgwZjcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tOiBPcGVuRW1iZWRkZWQgPG9lLnBhdGNoQG9lPgorRGF0ZTogVGh1LCAxNSBEZWMgMjAy
MiAwOTo1Njo1OSArMDAwMAorU3ViamVjdDogW1BBVENIXSBDb21taXR0aW5nIGNoYW5nZXMgZnJv
bSBkb19wYXRjaAorCistLS0KKyBsaWIvTW9kdWxlL0J1aWxkL0Jhc2UucG0gfCAyICstCisgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCisKK2RpZmYgLS1naXQg
YS9saWIvTW9kdWxlL0J1aWxkL0Jhc2UucG0gYi9saWIvTW9kdWxlL0J1aWxkL0Jhc2UucG0KK2lu
ZGV4IDQ0OGViNDQuLjI3NmRlNDcgMTAwNjQ0CistLS0gYS9saWIvTW9kdWxlL0J1aWxkL0Jhc2Uu
cG0KKysrKyBiL2xpYi9Nb2R1bGUvQnVpbGQvQmFzZS5wbQorQEAgLTMwODksNyArMzA4OSw3IEBA
IHN1YiBmaXhfc2hlYmFuZ19saW5lIHsgIyBBZGFwdGVkIGZyb20gZml4aW4oKSBpbiBFeHRVdGls
czo6TU1fVW5peCAxLjM1CisgCisgICAgIG15ICgkY21kLCAkYXJnKSA9IChzcGxpdCgnICcsICRs
aW5lLCAyKSwgJycpOworICAgICBuZXh0IHVubGVzcyAkY21kID1+IC9wZXJsL2k7CistICAgIG15
ICRpbnRlcnByZXRlciA9ICRzZWxmLT57cHJvcGVydGllc317cGVybH07CisrICAgIG15ICRpbnRl
cnByZXRlciA9ICIvdXNyL2Jpbi9wZXJsIjsKKyAKKyAgICAgJHNlbGYtPmxvZ192ZXJib3NlKCJD
aGFuZ2luZyBzaGFycGJhbmcgaW4gJGZpbGUgdG8gJGludGVycHJldGVyXG4iKTsKKyAgICAgbXkg
JHNoYiA9ICcnOwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlibW9k
dWxlLWJ1aWxkLXBlcmxfMC40MjMxLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGli
bW9kdWxlLWJ1aWxkLXBlcmxfMC40MjMyLmJiCnNpbWlsYXJpdHkgaW5kZXggODIlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2xpYm1vZHVsZS1idWlsZC1wZXJsXzAuNDIz
MS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlibW9kdWxlLWJ1aWxk
LXBlcmxfMC40MjMyLmJiCmluZGV4IDg4MWQ1ZTY3MmUuLjczMzQwZjI0ZjUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2xpYm1vZHVsZS1idWlsZC1wZXJsXzAuNDIzMS5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9saWJtb2R1bGUtYnVpbGQtcGVybF8w
LjQyMzIuYmIKQEAgLTEsMyArMSwyMyBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0g
dmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9s
bG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNl
bnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBh
bmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xp
Y2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmln
aHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIFJFQURNRQor
IyArKysgUkVBRE1FCisjIEBAIC0xLDYgKzAsMCBAQAorIyAtQ09QWVJJR0hUCisjIC0KKyMgLSAg
ICBDb3B5cmlnaHQgKGMpIDIwMDEtMjAwNiBLZW4gV2lsbGlhbXMuIEFsbCByaWdodHMgcmVzZXJ2
ZWQuCisjIC0KKyMgLSAgICBUaGlzIGxpYnJhcnkgaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiBy
ZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeSBpdAorIyAtICAgIHVuZGVyIHRoZSBzYW1lIHRl
cm1zIGFzIFBlcmwgaXRzZWxmLgorIyAKKyMKKwogU1VNTUFSWSA9ICJNb2R1bGU6OkJ1aWxkIC0g
QnVpbGQgYW5kIGluc3RhbGwgUGVybCBtb2R1bGVzIgogREVTQ1JJUFRJT04gPSAiTWFueSBQZXJs
IGRpc3RyaWJ1dGlvbnMgdXNlIGEgQnVpbGQuUEwgZmlsZSBpbnN0ZWFkIG9mIGEgXAogTWFrZWZp
bGUuUEwgZmlsZSB0byBkcml2ZSBkaXN0cmlidXRpb24gY29uZmlndXJhdGlvbiwgYnVpbGQsIHRl
c3QgYW5kIFwKQEAgLTExLDEzICszMSwxNCBAQCBTRUNUSU9OID0gImxpYnMiCiBIT01FUEFHRSA9
ICJodHRwczovL21ldGFjcGFuLm9yZy9yZWxlYXNlL01vZHVsZS1CdWlsZCIKIAogTElDRU5TRSA9
ICJBcnRpc3RpYy0xLjAgfCBHUEwtMS4wLW9yLWxhdGVyIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vUkVBRE1FO2JlZ2lubGluZT05NDk7ZW5kbGluZT05NTQ7bWQ1PTYyNGMwNmRiNTZhMmFm
NGQ3MGNmOWVkYzI5ZmNhZTFiIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vUkVBRE1FO2Jl
Z2lubGluZT05NDk7ZW5kbGluZT05NTQ7bWQ1PWQ0MWQ4Y2Q5OGYwMGIyMDRlOTgwMDk5OGVjZjg0
MjdlIgogCiBTUkNfVVJJID0gIiR7Q1BBTl9NSVJST1J9L2F1dGhvcnMvaWQvTC9MRS9MRU9OVC9N
b2R1bGUtQnVpbGQtJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBc
CisgICAgICAgICAgIGZpbGU6Ly9wdGVzdC1wZXJsL3J1bi1wdGVzdCBcCisgICAgICAgICAgIGZp
bGU6Ly8wMDAxLUNvbW1pdHRpbmctY2hhbmdlcy1mcm9tLWRvX3BhdGNoLnBhdGNoIFwKICAgICAg
ICAgICAgIgotU1JDX1VSSVttZDVzdW1dID0gIjA2NmIxOTNlNDYxZDdkZmUxZWNhMTdhMTM5MzUz
MDAxIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdlMGY0YzY5MmMxNzQwYzFhYzg0ZWExNGQ3ZWEz
ZDhiYzc5OGIyZmIyNmMwOTg3NzIyOWUwNGY0MzBiMmI3MTciCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiNjdjODJlZTI0NWQ5NGJhMDZkZWNmYTI1NTcyYWI3NWZkY2QyNmE5MDA5MDk0Mjg5ZDhmNDVi
YzU0MDQxNzcxYiIKIAogUyA9ICIke1dPUktESVJ9L01vZHVsZS1CdWlsZC0ke1BWfSIKIAotLSAK
Mi4zNy4zCgo=

--===============6041808034710810863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1672 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (887 cached, 1 parsed). 1672 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:eb8cb39cbaffe6badd40b7b5409f8419c18519f6"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 114 Local 107 Mirrors 0 Missed 7 Current 297 (93% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1091 of 1480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb:do_fetch)
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_fetch: Started
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_fetch: Succeeded
NOTE: Running task 1463 of 1480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb:do_unpack)
NOTE: Running task 1464 of 1480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_unpack: Started
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_unpack: Succeeded
NOTE: Running task 1465 of 1480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb:do_patch)
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_patch: Started
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_patch: Succeeded
NOTE: Running task 1466 of 1480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb:do_deploy_source_date_epoch)
NOTE: Running task 1467 of 1480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb:do_populate_lic)
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_populate_lic: Started
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_populate_lic: Succeeded
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1468 of 1480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb:do_configure)
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_configure: Started
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_configure: Succeeded
NOTE: Running task 1469 of 1480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb:do_configure_ptest_base)
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_configure_ptest_base: Started
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1470 of 1480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb:do_compile)
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_compile: Started
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_compile: Succeeded
NOTE: Running task 1471 of 1480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb:do_compile_ptest_base)
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_compile_ptest_base: Started
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1472 of 1480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb:do_install)
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_install: Started
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_install: Succeeded
NOTE: Running task 1473 of 1480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb:do_install_ptest_base)
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_install_ptest_base: Started
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1474 of 1480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb:do_install_ptest_perl)
NOTE: Running task 1475 of 1480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb:do_populate_sysroot)
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_populate_sysroot: Started
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_install_ptest_perl: Started
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_install_ptest_perl: Succeeded
NOTE: Running task 1476 of 1480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb:do_package)
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_package: Started
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_package: Succeeded
NOTE: Running task 1477 of 1480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb:do_packagedata)
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_packagedata: Started
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_packagedata: Succeeded
NOTE: Running task 1478 of 1480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb:do_package_write_rpm)
NOTE: Running task 1479 of 1480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb:do_package_qa)
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_package_write_rpm: Started
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_package_qa: Started
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_package_qa: Succeeded
NOTE: recipe libmodule-build-perl-0.4232-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1480 of 1480 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb:do_build)
NOTE: Tasks Summary: Attempted 1480 tasks of which 1461 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: libmodule-build-perl-0.4232-r0 do_patch: Missing Upstream-Status in patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/libmodule-build-perl/0001-Committing-changes-from-do_patch.patch
Please add according to https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status .

--===============6041808034710810863==--

