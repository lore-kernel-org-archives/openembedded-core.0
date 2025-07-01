Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D257DC8303C
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:22 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.1436.1751386811025648976
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=wFPWdg5a;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=U/IS5RCF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010197c6c9f292-a2f627ff-f87e-4b16-a042-95aabc8b29a1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386813;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MvbTQ6DtqtlVSJLzk2ObeEmApbrd5TsQ+68V+qeiGhM=;
	b=wFPWdg5aZaghvonR6KE7Ces/GPjaQ4FitKIsCIpeXkZ65bYkeSvHBdd77DvkziEx
	wWWP44Wn3u0AKz9pgPbrpHFUXzXsPc8XN7wyWnEpWQNtc3MjIvWveFxx2QBSVD0coUW
	IRXSGxlZUeDF2FiCXHhryXKixXQd6WFknPeA6GHA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386813;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MvbTQ6DtqtlVSJLzk2ObeEmApbrd5TsQ+68V+qeiGhM=;
	b=U/IS5RCFaUyGiTJ55jbhck+8HpEGAbEaimansNOVEJ6OLYxniPGw3f/2V0RFrItw
	28KgjHvo5frUIDvmPm1gdhqZGfg4xpk29gl/iPDDw5oY6miHyiHjliXnj1jVtx3rnM9
	3l08ot9qwHGCFnTdGQlIKlwl00Au7VRw2Q4BsjCg=
Content-Type: multipart/mixed; boundary="===============4745951898119971177=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pkgconf: upgrading to 2.5.1 SUCCEEDED
Message-ID: <01010197c6c9f292-a2f627ff-f87e-4b16-a042-95aabc8b29a1-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219631

--===============4745951898119971177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pkgconf* to *2.5.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pkgconf-upgrade-2.4.3-2.5.1.patch
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
From ab7faacdef30fa14e071ca18c4338f95e8b04f04 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 08:44:59 +0000
Subject: [PATCH] pkgconf: upgrade 2.4.3 -> 2.5.1

---
 .../pkgconf/{pkgconf_2.4.3.bb => pkgconf_2.5.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_2.4.3.bb => pkgconf_2.5.1.bb} (96%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_2.4.3.bb b/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
similarity index 96%
rename from meta/recipes-devtools/pkgconf/pkgconf_2.4.3.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
index 9695e37bbd..12ca075b5d 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_2.4.3.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "51203d99ed573fa7344bf07ca626f10c7cc094e0846ac4aa0023bd0c83c25a41"
+SRC_URI[sha256sum] = "cd05c9589b9f86ecf044c10a2269822bc9eb001eced2582cfffd658b0a50c243"
 
 inherit autotools
 
-- 
2.47.1


--===============4745951898119971177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/pkgconf/pkgconf-doc: FILELIST: added "/usr/share/man/man1/bomtool.1"
packages/core2-64-poky-linux/pkgconf/pkgconf-doc: PKGSIZE changed from 29240 to 44352 (+52%)
packages/core2-64-poky-linux/pkgconf/pkgconf: FILELIST: removed "/usr/lib/libpkgconf.so.6 /usr/lib/libpkgconf.so.6.0.0", added "/usr/lib/libpkgconf.so.7 /usr/lib/libpkgconf.so.7.0.0"
Changes to packages/core2-64-poky-linux/pkgconf (sysroot):
  /usr/lib/libpkgconf.so changed symlink target from libpkgconf.so.6.0.0 to libpkgconf.so.7.0.0
  /usr/lib/libpkgconf.so.6.0.0 moved to /usr/lib/libpkgconf.so.7.0.0
  /usr/lib/libpkgconf.so.6 moved to /usr/lib/libpkgconf.so.7

--===============4745951898119971177==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pkgconf-upgrade-2.4.3-2.5.1.patch"

RnJvbSBhYjdmYWFjZGVmMzBmYTE0ZTA3MWNhMThjNDMzOGY5NWU4YjA0ZjA0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAwODo0NDo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBr
Z2NvbmY6IHVwZ3JhZGUgMi40LjMgLT4gMi41LjEKCi0tLQogLi4uL3BrZ2NvbmYve3BrZ2NvbmZf
Mi40LjMuYmIgPT4gcGtnY29uZl8yLjUuMS5iYn0gICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3BrZ2NvbmYve3BrZ2NvbmZfMi40LjMuYmIgPT4gcGtnY29uZl8yLjUuMS5i
Yn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2dj
b25mXzIuNC4zLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtnY29uZl8yLjUu
MS5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGtnY29uZi9wa2djb25mXzIuNC4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcGtnY29uZi9wa2djb25mXzIuNS4xLmJiCmluZGV4IDk2OTVlMzdiYmQuLjEyY2EwNzViNWQg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMi40LjMu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtnY29uZl8yLjUuMS5iYgpA
QCAtMjAsNyArMjAsNyBAQCBTUkNfVVJJID0gIlwKICAgICBmaWxlOi8vcGtnLWNvbmZpZy1uYXRp
dmUuaW4gXAogICAgIGZpbGU6Ly9wa2ctY29uZmlnLWVzZGsuaW4gXAogIgotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjUxMjAzZDk5ZWQ1NzNmYTczNDRiZjA3Y2E2MjZmMTBjN2NjMDk0ZTA4NDZhYzRh
YTAwMjNiZDBjODNjMjVhNDEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2QwNWM5NTg5YjlmODZl
Y2YwNDRjMTBhMjI2OTgyMmJjOWViMDAxZWNlZDI1ODJjZmZmZDY1OGIwYTUwYzI0MyIKIAogaW5o
ZXJpdCBhdXRvdG9vbHMKIAotLSAKMi40Ny4xCgo=

--===============4745951898119971177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/pkgconf: PKGV changed from 2.4.3 [default] to 2.5.1 [default]
packages/core2-64-poky-linux/pkgconf: SRC_URI changed from "https://distfiles.ariadne.space/pkgconf/pkgconf-2.4.3.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in" to "https://distfiles.ariadne.space/pkgconf/pkgconf-2.5.1.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in"
packages/core2-64-poky-linux/pkgconf: PV changed from "2.4.3" to "2.5.1"
packages/core2-64-poky-linux/pkgconf/pkgconf-dbg: PKGV changed from 2.4.3 [default] to 2.5.1 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-dbg: FILELIST: removed "/usr/lib/.debug/libpkgconf.so.6.0.0", added "/usr/lib/.debug/libpkgconf.so.7.0.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 349272 to 377432 (+8%)
packages/core2-64-poky-linux/pkgconf/pkgconf-dbg: PV changed from "2.4.3" to "2.5.1"
packages/core2-64-poky-linux/pkgconf/pkgconf-dev: PKGV changed from 2.4.3 [default] to 2.5.1 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-dev: PKGSIZE changed from 25651 to 27212 (+6%)
packages/core2-64-poky-linux/pkgconf/pkgconf-dev: PV changed from "2.4.3" to "2.5.1"
packages/core2-64-poky-linux/pkgconf/pkgconf-doc: PKGV changed from 2.4.3 [default] to 2.5.1 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-doc: FILELIST: added "/usr/share/man/man1/bomtool.1"
packages/core2-64-poky-linux/pkgconf/pkgconf-doc: PKGSIZE changed from 29240 to 44352 (+52%)
packages/core2-64-poky-linux/pkgconf/pkgconf-doc: PV changed from "2.4.3" to "2.5.1"
packages/core2-64-poky-linux/pkgconf/pkgconf-locale: PKGV changed from 2.4.3 [default] to 2.5.1 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-locale: PV changed from "2.4.3" to "2.5.1"
packages/core2-64-poky-linux/pkgconf/pkgconf-src: PKGV changed from 2.4.3 [default] to 2.5.1 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-src: PV changed from "2.4.3" to "2.5.1"
packages/core2-64-poky-linux/pkgconf/pkgconf-staticdev: PKGV changed from 2.4.3 [default] to 2.5.1 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-staticdev: PV changed from "2.4.3" to "2.5.1"
packages/core2-64-poky-linux/pkgconf/pkgconf: PKGV changed from 2.4.3 [default] to 2.5.1 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf: FILELIST: removed "/usr/lib/libpkgconf.so.6 /usr/lib/libpkgconf.so.6.0.0", added "/usr/lib/libpkgconf.so.7 /usr/lib/libpkgconf.so.7.0.0"
packages/core2-64-poky-linux/pkgconf/pkgconf: PKGSIZE changed from 162725 to 166821 (+3%)
packages/core2-64-poky-linux/pkgconf/pkgconf: PV changed from "2.4.3" to "2.5.1"
Changes to packages/core2-64-poky-linux/pkgconf (sysroot):
  /usr/lib/libpkgconf.so changed symlink target from libpkgconf.so.6.0.0 to libpkgconf.so.7.0.0
  /usr/lib/libpkgconf.so.6.0.0 moved to /usr/lib/libpkgconf.so.7.0.0
  /usr/lib/libpkgconf.so.6 moved to /usr/lib/libpkgconf.so.7

--===============4745951898119971177==--

