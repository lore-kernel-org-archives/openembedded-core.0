Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E793CA5FCE
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 06:31:52 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5427.1790836306197206915
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 23:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=b+OhD9bW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TjsGBvrx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a0f6296df5-e481a6f9-c378-4c57-ac92-bf7b3a7b7a85-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790836305;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sh33WexOhFTVNM9Lkh3+rYAEZnCatwW9BQ9RsfQhRZ8=;
	b=b+OhD9bWKFugLqtDYXoecETpgNGSjFoOQKnuz0DRkzlS1Z5Em+5UYHYkcprXr/9x
	Rsf222Mh3vsmLf5Caxt58Xg6eNteK+caHa++nJw/gMredGxw14cO0HOpbmverdZ0Te9
	q+c6qs66MudDxzeAWTdb2NXDFn9IuHCxiqet0qN8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790836305;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sh33WexOhFTVNM9Lkh3+rYAEZnCatwW9BQ9RsfQhRZ8=;
	b=TjsGBvrxg85KFUmweYgLVYrOSt+xpq4p6wCtmMvIJh/r16wm30vMWygKgBclcT5N
	4Cdw912qrxuP4hq9fvDOCo0mWysU7ew1U0DklZKAW0QtWqDo361UfFWsTLMICS8jDSO
	67pTkoHNs4rIPHANZFnThoVB61jk5J5hkrbgJOT8=
Content-Type: multipart/mixed; boundary="===============8402621198303702527=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-llvm-translator: upgrading to 23.1.2 SUCCEEDED
Message-ID: <010101a0f6296df5-e481a6f9-c378-4c57-ac92-bf7b3a7b7a85-000000@us-west-2.amazonses.com>
Date: Thu, 1 Oct 2026 06:31:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 06:31:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247009

--===============8402621198303702527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *spirv-llvm-translator* to *23.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-llvm-translator-upgrade-23.1.1-23.1.2.patch
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
From 58aeacf03c462e01b11bd065f03e84e39f9573b6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Oct 2026 06:26:09 +0000
Subject: [PATCH] spirv-llvm-translator: upgrade 23.1.1 -> 23.1.2

[Backport to 23] Fix FPRoundingMode decoration handling on mini-float
conversions (#4021)
[Backport to 23] Make the error handling kind selectable through TranslatorOpts
[Backport to 23] Support new OpTypeVectorIdEXT op with constant instructions in
Reader (#3951)
[Backport to 23] Mangle `OpUMulExtended` builtin arguments as unsigned (#3963)
---
 ...lvm-translator_23.1.1.bb => spirv-llvm-translator_23.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-llvm-translator_23.1.1.bb => spirv-llvm-translator_23.1.2.bb} (94%)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_23.1.1.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_23.1.2.bb
similarity index 94%
rename from meta/recipes-graphics/spir/spirv-llvm-translator_23.1.1.bb
rename to meta/recipes-graphics/spir/spirv-llvm-translator_23.1.2.bb
index 42e3236b38..a428d559bf 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_23.1.1.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_23.1.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
 
 # pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
 SPIRV_BRANCH = "llvm_release_230"
-SRCREV = "c808623558686b7b285cabfa71542a93a5390f55"
+SRCREV = "e65dde28ce8f12ef7245914fa2850260328669e4"
 SRC_URI = " \
     git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;branch=${SPIRV_BRANCH};tag=v${PV} \
 "
-- 
2.47.1


--===============8402621198303702527==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-llvm-translator-upgrade-23.1.1-23.1.2.patch"

RnJvbSA1OGFlYWNmMDNjNDYyZTAxYjExYmQwNjVmMDNlODRlMzlmOTU3M2I2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBPY3QgMjAyNiAwNjoyNjowOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNw
aXJ2LWxsdm0tdHJhbnNsYXRvcjogdXBncmFkZSAyMy4xLjEgLT4gMjMuMS4yCgpbQmFja3BvcnQg
dG8gMjNdIEZpeCBGUFJvdW5kaW5nTW9kZSBkZWNvcmF0aW9uIGhhbmRsaW5nIG9uIG1pbmktZmxv
YXQKY29udmVyc2lvbnMgKCM0MDIxKQpbQmFja3BvcnQgdG8gMjNdIE1ha2UgdGhlIGVycm9yIGhh
bmRsaW5nIGtpbmQgc2VsZWN0YWJsZSB0aHJvdWdoIFRyYW5zbGF0b3JPcHRzCltCYWNrcG9ydCB0
byAyM10gU3VwcG9ydCBuZXcgT3BUeXBlVmVjdG9ySWRFWFQgb3Agd2l0aCBjb25zdGFudCBpbnN0
cnVjdGlvbnMgaW4KUmVhZGVyICgjMzk1MSkKW0JhY2twb3J0IHRvIDIzXSBNYW5nbGUgYE9wVU11
bEV4dGVuZGVkYCBidWlsdGluIGFyZ3VtZW50cyBhcyB1bnNpZ25lZCAoIzM5NjMpCi0tLQogLi4u
bHZtLXRyYW5zbGF0b3JfMjMuMS4xLmJiID0+IHNwaXJ2LWxsdm0tdHJhbnNsYXRvcl8yMy4xLjIu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIve3NwaXJ2LWxsdm0tdHJhbnNsYXRv
cl8yMy4xLjEuYmIgPT4gc3BpcnYtbGx2bS10cmFuc2xhdG9yXzIzLjEuMi5iYn0gKDk0JSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1sbHZtLXRyYW5zbGF0
b3JfMjMuMS4xLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtbGx2bS10cmFu
c2xhdG9yXzIzLjEuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1sbHZtLXRyYW5zbGF0b3JfMjMuMS4xLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1sbHZtLXRyYW5zbGF0b3JfMjMu
MS4yLmJiCmluZGV4IDQyZTMyMzZiMzguLmE0MjhkNTU5YmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWxsdm0tdHJhbnNsYXRvcl8yMy4xLjEuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtbGx2bS10cmFuc2xhdG9yXzIzLjEuMi5i
YgpAQCAtNiw3ICs2LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5UWFQ7
bWQ1PTQ3ZTMxMWFhOWNhZWRkMWIzYWJmMDk4YmQ3ODE0ZDFkIgogCiAjIHBhdHRlcm46IGxsdm1f
YnJhbmNoXzIwMCwgY3VycmVudGx5IHRoZXJlIGFyZSBubyBtaW5vciByZWxlYXNlcywgc28sIG5v
IGxsdm1fYnJhbmNoXzIwMQogU1BJUlZfQlJBTkNIID0gImxsdm1fcmVsZWFzZV8yMzAiCi1TUkNS
RVYgPSAiYzgwODYyMzU1ODY4NmI3YjI4NWNhYmZhNzE1NDJhOTNhNTM5MGY1NSIKK1NSQ1JFViA9
ICJlNjVkZGUyOGNlOGYxMmVmNzI0NTkxNGZhMjg1MDI2MDMyODY2OWU0IgogU1JDX1VSSSA9ICIg
XAogICAgIGdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1NQSVJWLUxMVk0tVHJhbnNsYXRv
cjtwcm90b2NvbD1odHRwczticmFuY2g9JHtTUElSVl9CUkFOQ0h9O3RhZz12JHtQVn0gXAogIgot
LSAKMi40Ny4xCgo=

--===============8402621198303702527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/spirv-llvm-translator: PKGV changed from 23.1.1 [default] to 23.1.2 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator: SRC_URI changed from "git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;branch=llvm_release_230;tag=v23.1.1" to "git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;branch=llvm_release_230;tag=v23.1.2"
packages/x86-64-v3-poky-linux/spirv-llvm-translator: PV changed from "23.1.1" to "23.1.2"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-bin: PKGV changed from 23.1.1 [default] to 23.1.2 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-bin: PV changed from "23.1.1" to "23.1.2"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-bin: PKGSIZE changed from 161992 to 170184 (+5%)
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dbg: PKGV changed from 23.1.1 [default] to 23.1.2 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dbg: PV changed from "23.1.1" to "23.1.2"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dbg: PKGSIZE changed from 137606472 to 137758600 (+0%)
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dev: PKGV changed from 23.1.1 [default] to 23.1.2 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dev: PV changed from "23.1.1" to "23.1.2"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dev: PKGSIZE changed from 28408 to 29448 (+4%)
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-doc: PKGV changed from 23.1.1 [default] to 23.1.2 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-doc: PV changed from "23.1.1" to "23.1.2"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-locale: PKGV changed from 23.1.1 [default] to 23.1.2 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-locale: PV changed from "23.1.1" to "23.1.2"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-src: PKGV changed from 23.1.1 [default] to 23.1.2 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-src: FILELIST: directory renamed /usr/src/debug/spirv-llvm-translator/23.1.1/lib/SPIRV -> /usr/src/debug/spirv-llvm-translator/23.1.2/lib/SPIRV, directory renamed /usr/src/debug/spirv-llvm-translator/23.1.1/lib/SPIRV/libSPIRV -> /usr/src/debug/spirv-llvm-translator/23.1.2/lib/SPIRV/libSPIRV, directory renamed /usr/src/debug/spirv-llvm-translator/23.1.1/tools/llvm-spirv -> /usr/src/debug/spirv-llvm-translator/23.1.2/tools/llvm-spirv, directory renamed /usr/src/debug/spirv-llvm-translator/23.1.1/include -> /usr/src/debug/spirv-llvm-translator/23.1.2/include, directory renamed /usr/src/debug/spirv-llvm-translator/23.1.1/lib/SPIRV/Mangler -> /usr/src/debug/spirv-llvm-translator/23.1.2/lib/SPIRV/Mangler
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-src: PV changed from "23.1.1" to "23.1.2"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-src: PKGSIZE changed from 2497675 to 2508804 (+0%)
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-staticdev: PKGV changed from 23.1.1 [default] to 23.1.2 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-staticdev: PV changed from "23.1.1" to "23.1.2"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator: PKGV changed from 23.1.1 [default] to 23.1.2 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator: PV changed from "23.1.1" to "23.1.2"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator: PKGSIZE changed from 6118864 to 6131184 (+0%)

--===============8402621198303702527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="spirv-llvm-translator-changelog.txt"

[Backport to 23] Fix FPRoundingMode decoration handling on mini-float
conversions (#4021)
[Backport to 23] Make the error handling kind selectable through TranslatorOpts
[Backport to 23] Support new OpTypeVectorIdEXT op with constant instructions in
Reader (#3951)
[Backport to 23] Mangle `OpUMulExtended` builtin arguments as unsigned (#3963)

--===============8402621198303702527==--

