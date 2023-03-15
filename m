Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 620B0C7EE2D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:32 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.12291.1678895725245672049
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=KZLgVUg4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010186e5fbbdb1-2d009443-364b-4f87-baa0-55bbf22ddb56-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895726;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=gpJjKBBiEQG3X/9YaFFPtC1r+XZ1zHBiUk2O/GEJNko=;
	b=KZLgVUg46+QBwjAGbQw5yoJ0JNMqcwz7rw9JGS6ip+bByz8VEV0wX0nJI0VVvHuT
	qTsIEklfupZtm6l2E6qSN7eezBLz3VYTKpsYKhpvLssLQcjhbh9riA1Ytp+2t0UScis
	oDrm0I9FmEfU2bsAoeGMuPBXGRXnA0SYw9nZ3amc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895726;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=gpJjKBBiEQG3X/9YaFFPtC1r+XZ1zHBiUk2O/GEJNko=;
	b=b4u+No4hoqgBeCCP+HSIBTbBxaLUidIoqP4+X98wdSRcGFyFlGiQZb24kBB53NVc
	rwslkTKt8osuJRJCNT8dcF1faoxjWB62OuEjVWVVVvwWvSK02cYOS3Uiyt54Fmip0RN
	aAKDNbtPcseY6xuPbnLpmO17Ks/YryqzLZ05tV2I=
Content-Type: multipart/mixed; boundary="===============4548057227697005730=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] cracklib: upgrading to 2.9.9 FAILED
Message-ID: <01010186e5fbbdb1-2d009443-364b-4f87-baa0-55bbf22ddb56-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178606

--===============4548057227697005730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cracklib* to *2.9.9* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cracklib-upgrade-2.9.8-2.9.9.patch
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
--===============4548057227697005730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1790 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (895 cached, 1 parsed). 1790 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-044ee69054b731b22aeb1010539eaaecd5ef8379"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:044ee69054b731b22aeb1010539eaaecd5ef8379"
workspace            = "master:37b5d544d34c9caaf70def0a29dfb0cf896dc1b7"

Initialising tasks...done.
Sstate summary: Wanted 29 Local 20 Mirrors 0 Missed 9 Current 135 (68% match, 94% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 630 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.9.bb:do_fetch)
NOTE: Running task 631 of 679 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.9.bb:do_fetch)
NOTE: recipe cracklib-2.9.9-r0: task do_fetch: Started
NOTE: recipe cracklib-native-2.9.9-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.9-r0: task do_fetch: Succeeded
NOTE: Running task 658 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.9.bb:do_unpack)
NOTE: recipe cracklib-native-2.9.9-r0: task do_fetch: Succeeded
NOTE: Running task 659 of 679 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.9.bb:do_unpack)
NOTE: Running task 660 of 679 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe cracklib-2.9.9-r0: task do_unpack: Started
NOTE: recipe cracklib-native-2.9.9-r0: task do_unpack: Started
NOTE: recipe cracklib-native-2.9.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cracklib-native-2.9.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cracklib-2.9.9-r0: task do_unpack: Succeeded
NOTE: Running task 661 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.9.bb:do_patch)
NOTE: recipe cracklib-2.9.9-r0: task do_patch: Started
NOTE: recipe cracklib-2.9.9-r0: task do_patch: Failed
NOTE: recipe cracklib-native-2.9.9-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 661 tasks of which 655 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.9.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: cracklib-2.9.9-r0 do_patch: Applying patch '0001-packlib.c-support-dictionary-byte-order-dependent.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cracklib/2.9.9-r0/git/src'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cracklib/2.9.9-r0/recipe-sysroot-native/etc/quiltrc push', 0, "stdout: Applying patch 0001-packlib.c-support-dictionary-byte-order-dependent.patch
can't find file to patch at input line 33
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From ba61a0589e5733da84c0dea2754f1cf203d54a28 Mon Sep 17 00:00:00 2001
|From: Lei Maohui <leimaohui@cn.fujitsu.com>
|Date: Tue, 9 Jun 2015 11:11:48 +0900
|Subject: [PATCH] packlib.c: support dictionary byte order dependent
|
|The previous dict files are NOT byte-order independent, in fact they are
|probably ARCHITECTURE SPECIFIC.
|Create the dict files in big endian, and convert to host endian while
|load them. This could fix the endian issue on multiple platform.
|
|Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
|Upstream-Status: Submitted [https://github.com/cracklib/cracklib/pull/41]
|
|We can't use the endian.h, htobe* and be*toh functions because they are
|not available on older versions of glibc, such as that found in RHEL
|5.9.
|
|Change to checking endian and directly calling bswap_* as defined in
|byteswap.h.
|
|Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
|
|Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
|
|---
| src/lib/packlib.c | 214 +++++++++++++++++++++++++++++++++++++++++++++-
| 1 file changed, 210 insertions(+), 4 deletions(-)
|
|diff --git a/src/lib/packlib.c b/src/lib/packlib.c
|index 9396e1d..d0bb181 100644
|--- a/src/lib/packlib.c
|+++ b/src/lib/packlib.c
--------------------------
No file to patch.  Skipping patch.
13 out of 13 hunks ignored
Patch 0001-packlib.c-support-dictionary-byte-order-dependent.patch does not apply (enforce with -f)

stderr: ")
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cracklib/2.9.9-r0/temp/log.do_patch.178553
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.9.bb:do_patch) failed with exit code '1'

--===============4548057227697005730==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cracklib-upgrade-2.9.8-2.9.9.patch"

RnJvbSA4M2RlODdmY2M1ZjFlNGViOTI5ZDA5OTNlNGE0OGRjY2NjMDQwMjBmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWFyIDIwMjMgMDk6NTQ6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
cmFja2xpYjogdXBncmFkZSAyLjkuOCAtPiAyLjkuOQoKLS0tCiAuLi5wb3J0LWRpY3Rpb25hcnkt
Ynl0ZS1vcmRlci1kZXBlbmRlbnQucGF0Y2ggfCA0NCArKysrKysrKystLS0tLS0tLS0tCiAuLi4v
e2NyYWNrbGliXzIuOS44LmJiID0+IGNyYWNrbGliXzIuOS45LmJifSAgfCAgMiArLQogMiBmaWxl
cyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvY3JhY2tsaWIve2NyYWNrbGliXzIuOS44LmJiID0+IGNyYWNrbGli
XzIuOS45LmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9jcmFj
a2xpYi9jcmFja2xpYi8wMDAxLXBhY2tsaWIuYy1zdXBwb3J0LWRpY3Rpb25hcnktYnl0ZS1vcmRl
ci1kZXBlbmRlbnQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3JhY2tsaWIvY3JhY2ts
aWIvMDAwMS1wYWNrbGliLmMtc3VwcG9ydC1kaWN0aW9uYXJ5LWJ5dGUtb3JkZXItZGVwZW5kZW50
LnBhdGNoCmluZGV4IDhmYjUxMmEyMjQuLmRiYWNhNDdjNGIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9jcmFja2xpYi9jcmFja2xpYi8wMDAxLXBhY2tsaWIuYy1zdXBwb3J0LWRp
Y3Rpb25hcnktYnl0ZS1vcmRlci1kZXBlbmRlbnQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2NyYWNrbGliL2NyYWNrbGliLzAwMDEtcGFja2xpYi5jLXN1cHBvcnQtZGljdGlvbmFy
eS1ieXRlLW9yZGVyLWRlcGVuZGVudC5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gYWFlMDNi
N2U2MjZkNWY2MmFiOTI5ZDUxZDExMzUyYTVhMmZmNmIyZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gYmE2MWEwNTg5ZTU3MzNkYTg0YzBkZWEyNzU0ZjFjZjIwM2Q1NGEyOCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IExlaSBNYW9odWkgPGxlaW1hb2h1aUBjbi5mdWppdHN1
LmNvbT4KIERhdGU6IFR1ZSwgOSBKdW4gMjAxNSAxMToxMTo0OCArMDkwMAotU3ViamVjdDogW1BB
VENIIDEvMl0gcGFja2xpYi5jOiBzdXBwb3J0IGRpY3Rpb25hcnkgYnl0ZSBvcmRlciBkZXBlbmRl
bnQKK1N1YmplY3Q6IFtQQVRDSF0gcGFja2xpYi5jOiBzdXBwb3J0IGRpY3Rpb25hcnkgYnl0ZSBv
cmRlciBkZXBlbmRlbnQKIAogVGhlIHByZXZpb3VzIGRpY3QgZmlsZXMgYXJlIE5PVCBieXRlLW9y
ZGVyIGluZGVwZW5kZW50LCBpbiBmYWN0IHRoZXkgYXJlCiBwcm9iYWJseSBBUkNISVRFQ1RVUkUg
U1BFQ0lGSUMuCkBAIC0yMSwxNCArMjEsMTUgQEAgYnl0ZXN3YXAuaC4KIFNpZ25lZC1vZmYtYnk6
IE1hcmsgSGF0bGUgPG1hcmsuaGF0bGVAd2luZHJpdmVyLmNvbT4KIAogU2lnbmVkLW9mZi1ieTog
TGVpIE1hb2h1aSA8bGVpbWFvaHVpQGNuLmZ1aml0c3UuY29tPgorCiAtLS0KLSBsaWIvcGFja2xp
Yi5jIHwgMjE0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0K
KyBzcmMvbGliL3BhY2tsaWIuYyB8IDIxNCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystCiAgMSBmaWxlIGNoYW5nZWQsIDIxMCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQogCi1kaWZmIC0tZ2l0IGEvbGliL3BhY2tsaWIuYyBiL2xpYi9wYWNrbGliLmMK
LWluZGV4IDhhY2I3YmUuLmE5ZDg3NTAgMTAwNjQ0Ci0tLS0gYS9saWIvcGFja2xpYi5jCi0rKysg
Yi9saWIvcGFja2xpYi5jCitkaWZmIC0tZ2l0IGEvc3JjL2xpYi9wYWNrbGliLmMgYi9zcmMvbGli
L3BhY2tsaWIuYworaW5kZXggOTM5NmUxZC4uZDBiYjE4MSAxMDA2NDQKKy0tLSBhL3NyYy9saWIv
cGFja2xpYi5jCisrKysgYi9zcmMvbGliL3BhY2tsaWIuYwogQEAgLTE2LDYgKzE2LDEyIEBACiAg
I2lmZGVmIEhBVkVfU1RESU5UX0gKICAjaW5jbHVkZSA8c3RkaW50Lmg+CkBAIC00MSw4ICs0Miw4
IEBAIGluZGV4IDhhY2I3YmUuLmE5ZDg3NTAgMTAwNjQ0CiArI2luY2x1ZGUgPGJ5dGVzd2FwLmg+
CiAgI2luY2x1ZGUgInBhY2tlci5oIgogIAotIHN0YXRpYyBjb25zdCBjaGFyIHZlcnNfaWRbXSA9
ICJwYWNrbGliLmMgOiB2Mi4zcDIgQWxlYyBNdWZmZXR0IDE4IE1heSAxOTkzIjsKLUBAIC00NSw2
ICs1MSwxODUgQEAgdHlwZWRlZiBzdHJ1Y3QKKyAjZGVmaW5lIERFQlVHIDAKK0BAIC00Myw2ICs0
OSwxODUgQEAgdHlwZWRlZiBzdHJ1Y3QKICAgICAgY2hhciBkYXRhX2dldFtOVU1XT1JEU11bTUFY
V09SRExFTl07CiAgfSBQV0RJQ1Q2NDsKICAKQEAgLTIyOCw3ICsyMjksNyBAQCBpbmRleCA4YWNi
N2JlLi5hOWQ4NzUwIDEwMDY0NAogIAogIHN0YXRpYyBpbnQKICBfUFdJc0Jyb2tlbjY0KEZJTEUg
KmlmcCkKLUBAIC01Nyw2ICsyNDIsNyBAQCBfUFdJc0Jyb2tlbjY0KEZJTEUgKmlmcCkKK0BAIC01
NSw2ICsyNDAsNyBAQCBfUFdJc0Jyb2tlbjY0KEZJTEUgKmlmcCkKICAgICAgICAgcmV0dXJuIDA7
CiAgICAgIH0KICAKQEAgLTIzNiw3ICsyMzcsNyBAQCBpbmRleCA4YWNiN2JlLi5hOWQ4NzUwIDEw
MDY0NAogICAgICByZXR1cm4gKHBkZXNjNjQuaGVhZGVyLnBpaF9tYWdpYyA9PSBQSUhfTUFHSUMp
OwogIH0KICAKLUBAIC0xNDksNyArMzM1LDExIEBAIFBXT3BlbihwcmVmaXgsIG1vZGUpCitAQCAt
MTQ3LDcgKzMzMywxMSBAQCBQV09wZW4ocHJlZml4LCBtb2RlKQogIAlwZGVzYy5oZWFkZXIucGlo
X2Jsb2NrbGVuID0gTlVNV09SRFM7CiAgCXBkZXNjLmhlYWRlci5waWhfbnVtd29yZHMgPSAwOwog
IApAQCAtMjQ5LDcgKzI1MCw3IEBAIGluZGV4IDhhY2I3YmUuLmE5ZDg3NTAgMTAwNjQ0CiAgICAg
IH0gZWxzZQogICAgICB7CiAgCXBkZXNjLmZsYWdzICY9IH5QRk9SX1dSSVRFOwotQEAgLTE3Myw2
ICszNjMsNyBAQCBQV09wZW4ocHJlZml4LCBtb2RlKQorQEAgLTE3MSw2ICszNjEsNyBAQCBQV09w
ZW4ocHJlZml4LCBtb2RlKQogIAkgICAgcmV0dXJuIE5VTEw7CiAgCX0KICAKQEAgLTI1Nyw3ICsy
NTgsNyBAQCBpbmRleCA4YWNiN2JlLi5hOWQ4NzUwIDEwMDY0NAogICAgICAgICAgaWYgKChwZGVz
Yy5oZWFkZXIucGloX21hZ2ljID09IDApIHx8IChwZGVzYy5oZWFkZXIucGloX251bXdvcmRzID09
IDApKQogICAgICAgICAgewogICAgICAgICAgICAgIC8qIHVoLW9oLiBlaXRoZXIgYSBicm9rZW4g
IjY0LWJpdCIgZmlsZSBvciBhIGdhcmJhZ2UgZmlsZS4gKi8KLUBAIC0xOTUsNiArMzg2LDcgQEAg
UFdPcGVuKHByZWZpeCwgbW9kZSkKK0BAIC0xOTMsNiArMzg0LDcgQEAgUFdPcGVuKHByZWZpeCwg
bW9kZSkKICAJCX0KICAgICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7CiAgICAgICAgICAgICAg
fQpAQCAtMjY1LDcgKzI2Niw3IEBAIGluZGV4IDhhY2I3YmUuLmE5ZDg3NTAgMTAwNjQ0CiAgICAg
ICAgICAgICAgaWYgKHBkZXNjNjQuaGVhZGVyLnBpaF9tYWdpYyAhPSBQSUhfTUFHSUMpCiAgICAg
ICAgICAgICAgewogICAgICAgICAgICAgICAgICAvKiBub3BlLCBub3QgIjY0LWJpdCIgYWZ0ZXIg
YWxsICovCi1AQCAtMjkwLDYgKzQ4Miw3IEBAIFBXT3BlbihwcmVmaXgsIG1vZGUpCitAQCAtMjg4
LDYgKzQ4MCw3IEBAIFBXT3BlbihwcmVmaXgsIG1vZGUpCiAgICAgICAgICAgICAgICAgIHsKICAg
ICAgICAgICAgICAgICAgICAgIHBkZXNjLmZsYWdzICY9IH5QRk9SX1VTRUhXTVM7CiAgICAgICAg
ICAgICAgICAgIH0KQEAgLTI3Myw3ICsyNzQsNyBAQCBpbmRleCA4YWNiN2JlLi5hOWQ4NzUwIDEw
MDY0NAogICAgICAgICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgc2l6ZW9mKHBkZXNjLmh3bXMp
IC8gc2l6ZW9mKHBkZXNjLmh3bXNbMF0pOyBpKyspCiAgICAgICAgICAgICAgICAgIHsKICAgICAg
ICAgICAgICAgICAgICAgIHBkZXNjLmh3bXNbaV0gPSBwZGVzYzY0Lmh3bXNbaV07Ci1AQCAtMjk5
LDYgKzQ5Miw3IEBAIFBXT3BlbihwcmVmaXgsIG1vZGUpCitAQCAtMjk3LDYgKzQ5MCw3IEBAIFBX
T3BlbihwcmVmaXgsIG1vZGUpCiAgCSAgICB7CiAgCQlwZGVzYy5mbGFncyAmPSB+UEZPUl9VU0VI
V01TOwogIAkgICAgfQpAQCAtMjgxLDcgKzI4Miw3IEBAIGluZGV4IDhhY2I3YmUuLmE5ZDg3NTAg
MTAwNjQ0CiAgI2lmIERFQlVHCiAgICAgICAgICAgICAgZm9yIChpPTE7IGk8PTB4ZmY7IGkrKykK
ICAgICAgICAgICAgICB7Ci1AQCAtMzMyLDcgKzUyNiwxMSBAQCBQV0Nsb3NlKHB3cCkKK0BAIC0z
MzAsNyArNTI0LDExIEBAIFBXQ2xvc2UocHdwKQogIAkgICAgcmV0dXJuICgtMSk7CiAgCX0KICAK
QEAgLTI5NCw3ICsyOTUsNyBAQCBpbmRleCA4YWNiN2JlLi5hOWQ4NzUwIDEwMDY0NAogIAl7CiAg
CSAgICBmcHJpbnRmKHN0ZGVyciwgImluZGV4IG1hZ2ljIGZ3cml0ZSBmYWlsZWRcbiIpOwogIAkg
ICAgcmV0dXJuICgtMSk7Ci1AQCAtMzUxLDcgKzU0OSwxMiBAQCBQV0Nsb3NlKHB3cCkKK0BAIC0z
NDksNyArNTQ3LDEyIEBAIFBXQ2xvc2UocHdwKQogIAkgICAgCXByaW50ZigiaHdtWyUwMnhdID0g
JWRcbiIsIGksIHB3cC0+aHdtc1tpXSk7CiAgI2VuZGlmCiAgCSAgICB9CkBAIC0zMDgsNyArMzA5
LDcgQEAgaW5kZXggOGFjYjdiZS4uYTlkODc1MCAxMDA2NDQKICAJfQogICAgICB9CiAgCi1AQCAt
NDA1LDcgKzYwOCw4IEBAIFB1dFBXKHB3cCwgc3RyaW5nKQorQEAgLTQwMyw3ICs2MDYsOCBAQCBQ
dXRQVyhwd3AsIHN0cmluZykKICAKICAJZGF0dW0gPSAodWludDMyX3QpIGZ0ZWxsKHB3cC0+ZGZw
KTsKICAKQEAgLTMxOCw3ICszMTksNyBAQCBpbmRleCA4YWNiN2JlLi5hOWQ4NzUwIDEwMDY0NAog
IAogIAlmcHV0cyhwd3AtPmRhdGFfcHV0WzBdLCBwd3AtPmRmcCk7CiAgCXB1dGMoMCwgKEZJTEUq
KSBwd3AtPmRmcCk7Ci1AQCAtNDY0LDYgKzY2OCw3IEBAIEdldFBXKHB3cCwgbnVtYmVyKQorQEAg
LTQ2Miw2ICs2NjYsNyBAQCBHZXRQVyhwd3AsIG51bWJlcikKICAgICAgICAgICAgIHBlcnJvcigi
KGluZGV4IGZyZWFkIGZhaWxlZCkiKTsKICAgICAgICAgICAgIHJldHVybiBOVUxMOwogICAgICAg
ICB9CkBAIC0zMjYsNyArMzI3LDcgQEAgaW5kZXggOGFjYjdiZS4uYTlkODc1MCAxMDA2NDQKICAg
ICAgICAgZGF0dW0gPSBkYXR1bTY0OwogICAgICB9IGVsc2UgewogICAgICAgICBpZiAoZnNlZWso
cHdwLT5pZnAsIHNpemVvZihzdHJ1Y3QgcGlfaGVhZGVyKSArICh0aGlzYmxvY2sgKiBzaXplb2Yo
dWludDMyX3QpKSwgMCkpCi1AQCAtNDc3LDYgKzY4Miw3IEBAIEdldFBXKHB3cCwgbnVtYmVyKQor
QEAgLTQ3NSw2ICs2ODAsNyBAQCBHZXRQVyhwd3AsIG51bWJlcikKICAgICAgICAgICAgIHBlcnJv
cigiKGluZGV4IGZyZWFkIGZhaWxlZCkiKTsKICAgICAgICAgICAgIHJldHVybiBOVUxMOwogICAg
ICAgICB9CkBAIC0zMzQsNiArMzM1LDMgQEAgaW5kZXggOGFjYjdiZS4uYTlkODc1MCAxMDA2NDQK
ICAgICAgfQogIAogIAlpbnQgciA9IDE7Ci0tLSAKLTIuMjAuMQotCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvY3JhY2tsaWIvY3JhY2tsaWJfMi45LjguYmIgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvY3JhY2tsaWIvY3JhY2tsaWJfMi45LjkuYmIKc2ltaWxhcml0eSBpbmRleCA5
NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2NyYWNrbGliL2NyYWNrbGliXzIu
OS44LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3JhY2tsaWIvY3JhY2tsaWJf
Mi45LjkuYmIKaW5kZXggNzg2OTQwYTdlMC4uMmNmNzY5YzgwOCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2NyYWNrbGliL2NyYWNrbGliXzIuOS44LmJiCisrKyBiL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9jcmFja2xpYi9jcmFja2xpYl8yLjkuOS5iYgpAQCAtMTQsNyArMTQsNyBA
QCBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vY3JhY2tsaWIvY3JhY2tsaWI7cHJvdG9jb2w9
aHR0cHM7YnJhbmNoPW1hc3RlciBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLWNyYWtsaWItZml4
LXRlc3RudW0tYW5kLXRlc3RzdHItZmFpbGVkLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNS
RVYgPSAiZDllOGY5ZjQ3NzE4NTM5YWViYTgwZjkwZjRlMDcyNTQ5OTI2ZGM5YyIKK1NSQ1JFViA9
ICI0OTIwNDYyOGY4Yjc0MmM3MjBiNWZjZjE1NTY1OTYxYTJlM2Q0NDRhIgogUyA9ICIke1dPUktE
SVJ9L2dpdC9zcmMiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIGdldHRleHQKLS0gCjIuMzkuMgoK

--===============4548057227697005730==--

