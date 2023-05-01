Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55624C88CB4
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:25:52 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.107895.1682976351373701328
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=McbonMYg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010187d9351dab-d7702085-310a-44f7-9d9d-6d6699deb34a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Zo9eD+ndFsWPjBenIXuxgEXZ0GLN4VEkIZLZUGQtK3k=;
	b=McbonMYg6WLylGi3uuwZMgD+msKEik98S4w1dJQH1HEBqDvD6glOif9CBsAoRIq7
	ej3j++k6+l1Sf0eQF7Bg7DpFkaVAy39C5clU00d5baO1wOehSNUXmU2n18Ab/i48A2e
	m7IkeMLgCEpT2DUGEaOoraZqm7om0aWUKVGzIDNo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Zo9eD+ndFsWPjBenIXuxgEXZ0GLN4VEkIZLZUGQtK3k=;
	b=rwMaVg97FKJcOQdTEJHFjCsMCRrogPs4t2F3bYJf0d5SOej++t/qeN7DMXwhWXwx
	320t7hbQmYvdRnulI1EH464mSxK5XUnAf8b3T40bXcZyYUAlkghp9cISHR3/BUFkndr
	/q3HpUFcO+00EwPLxLa37MwRGzwzOYv+mY0Jm8lA=
Content-Type: multipart/mixed; boundary="===============2222212923483947110=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libmodule-build-perl: upgrading to 0.4234 FAILED
Message-ID: <01010187d9351dab-d7702085-310a-44f7-9d9d-6d6699deb34a-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180630

--===============2222212923483947110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libmodule-build-perl* to *0.4234* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libmodule-build-perl-upgrade-0.4232-0.4234.patch
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
--===============2222212923483947110==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libmodule-build-perl-upgrade-0.4232-0.4234.patch"

RnJvbSBmZTM2OTEwYWY0ZDI5M2M4YmNlZWRkZDM5ODE3MmQ4YzI5NDA2ZGMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAwOToyNjozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Ym1vZHVsZS1idWlsZC1wZXJsOiB1cGdyYWRlIDAuNDIzMiAtPiAwLjQyMzQKCi0tLQogLi4uMDAx
LUNvbW1pdHRpbmctY2hhbmdlcy1mcm9tLWRvX3BhdGNoLnBhdGNoIHwgMjIgKysrKysrKysrKysr
KysrKysrKwogLi4uNDIzMi5iYiA9PiBsaWJtb2R1bGUtYnVpbGQtcGVybF8wLjQyMzQuYmJ9IHwg
IDQgKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlibW9kdWxl
LWJ1aWxkLXBlcmwvMDAwMS1Db21taXR0aW5nLWNoYW5nZXMtZnJvbS1kb19wYXRjaC5wYXRjaAog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL3tsaWJtb2R1bGUtYnVpbGQtcGVybF8w
LjQyMzIuYmIgPT4gbGlibW9kdWxlLWJ1aWxkLXBlcmxfMC40MjM0LmJifSAoOTUlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2xpYm1vZHVsZS1idWlsZC1wZXJsLzAw
MDEtQ29tbWl0dGluZy1jaGFuZ2VzLWZyb20tZG9fcGF0Y2gucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcGVybC9saWJtb2R1bGUtYnVpbGQtcGVybC8wMDAxLUNvbW1pdHRpbmctY2hhbmdl
cy1mcm9tLWRvX3BhdGNoLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAuLmJhNDBiZTJhOTkKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cGVybC9saWJtb2R1bGUtYnVpbGQtcGVybC8wMDAxLUNvbW1pdHRpbmctY2hhbmdlcy1mcm9tLWRv
X3BhdGNoLnBhdGNoCkBAIC0wLDAgKzEsMjIgQEAKK0Zyb20gMWM0NzUwYTQ2NGY4ZGViMjMzZjNk
YzFiMGMyMGY5YmQzOGEwNmZmZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IE9wZW5F
bWJlZGRlZCA8b2UucGF0Y2hAb2U+CitEYXRlOiBNb24sIDEgTWF5IDIwMjMgMDk6MjY6MTIgKzAw
MDAKK1N1YmplY3Q6IFtQQVRDSF0gQ29tbWl0dGluZyBjaGFuZ2VzIGZyb20gZG9fcGF0Y2gKKwor
LS0tCisgbGliL01vZHVsZS9CdWlsZC9CYXNlLnBtIHwgMiArLQorIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQorCitkaWZmIC0tZ2l0IGEvbGliL01vZHVsZS9C
dWlsZC9CYXNlLnBtIGIvbGliL01vZHVsZS9CdWlsZC9CYXNlLnBtCitpbmRleCAxMGI2NTNmLi4w
N2RmMTMxIDEwMDY0NAorLS0tIGEvbGliL01vZHVsZS9CdWlsZC9CYXNlLnBtCisrKysgYi9saWIv
TW9kdWxlL0J1aWxkL0Jhc2UucG0KK0BAIC0zMDkzLDcgKzMwOTMsNyBAQCBzdWIgZml4X3NoZWJh
bmdfbGluZSB7ICMgQWRhcHRlZCBmcm9tIGZpeGluKCkgaW4gRXh0VXRpbHM6Ok1NX1VuaXggMS4z
NQorIAorICAgICBteSAoJGNtZCwgJGFyZykgPSAoc3BsaXQoJyAnLCAkbGluZSwgMiksICcnKTsK
KyAgICAgbmV4dCB1bmxlc3MgJGNtZCA9fiAvcGVybC9pOworLSAgICBteSAkaW50ZXJwcmV0ZXIg
PSAkc2VsZi0+e3Byb3BlcnRpZXN9e3Blcmx9OworKyAgICBteSAkaW50ZXJwcmV0ZXIgPSAiL3Vz
ci9iaW4vcGVybCI7CisgCisgICAgICRzZWxmLT5sb2dfdmVyYm9zZSgiQ2hhbmdpbmcgc2hhcnBi
YW5nIGluICRmaWxlIHRvICRpbnRlcnByZXRlclxuIik7CisgICAgIG15ICRzaGIgPSAnJzsKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2xpYm1vZHVsZS1idWlsZC1wZXJs
XzAuNDIzMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2xpYm1vZHVsZS1idWlsZC1w
ZXJsXzAuNDIzNC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcGVybC9saWJtb2R1bGUtYnVpbGQtcGVybF8wLjQyMzIuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2xpYm1vZHVsZS1idWlsZC1wZXJsXzAuNDIzNC5i
YgppbmRleCAwZWFkNjkwMDY3Li5iMjVjOWY3MTk1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcGVybC9saWJtb2R1bGUtYnVpbGQtcGVybF8wLjQyMzIuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3BlcmwvbGlibW9kdWxlLWJ1aWxkLXBlcmxfMC40MjM0LmJiCkBAIC0x
NSw4ICsxNSwxMCBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9SRUFETUU7YmVnaW5saW5l
PTg4MTtlbmRsaW5lPTg4NjttZDU9MzAyN2Y1NmM2NjQ1NDVlNQogCiBTUkNfVVJJID0gIiR7Q1BB
Tl9NSVJST1J9L2F1dGhvcnMvaWQvTC9MRS9MRU9OVC9Nb2R1bGUtQnVpbGQtJHtQVn0udGFyLmd6
IFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCisgICAgICAgICAgIGZpbGU6Ly9wdGVz
dC1wZXJsL3J1bi1wdGVzdCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDAxLUNvbW1pdHRpbmctY2hh
bmdlcy1mcm9tLWRvX3BhdGNoLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjY3YzgyZWUyNDVkOTRiYTA2ZGVjZmEyNTU3MmFiNzVmZGNkMjZhOTAwOTA5NDI4OWQ4
ZjQ1YmM1NDA0MTc3MWIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjZhZWFjNjEyNzQxOGJlNWU0
NzFlYWQzNzQ0NjQ4Yzc2NmJkMDE0ODI4MjVjNWI2NjY1MjY3NWYyYmM4NmE4ZiIKIAogUyA9ICIk
e1dPUktESVJ9L01vZHVsZS1CdWlsZC0ke1BWfSIKIAotLSAKMi4zOS4yCgo=

--===============2222212923483947110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1798 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1798 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8f3cfe9a98a160d7eb2a892a4cfca69abe9e352e"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 163 Local 156 Mirrors 0 Missed 7 Current 349 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1142 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb:do_fetch)
NOTE: recipe libmodule-build-perl-0.4234-r0: task do_fetch: Started
NOTE: recipe libmodule-build-perl-0.4234-r0: task do_fetch: Succeeded
NOTE: Running task 1687 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb:do_unpack)
NOTE: Running task 1688 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodule-build-perl-0.4234-r0: task do_unpack: Started
NOTE: recipe libmodule-build-perl-0.4234-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmodule-build-perl-0.4234-r0: task do_unpack: Succeeded
NOTE: Running task 1806 of 1821 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb:do_patch)
NOTE: recipe libmodule-build-perl-0.4234-r0: task do_patch: Started
NOTE: recipe libmodule-build-perl-0.4234-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmodule-build-perl-0.4234-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1806 tasks of which 1802 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb:do_patch
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libmodule-build-perl-0.4234-r0 do_patch: QA Issue: Missing Upstream-Status in patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/libmodule-build-perl/0001-Committing-changes-from-do_patch.patch
Please add according to https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status . [patch-status-core]
ERROR: libmodule-build-perl-0.4234-r0 do_patch: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libmodule-build-perl/0.4234-r0/temp/log.do_patch.359450
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb:do_patch) failed with exit code '1'

--===============2222212923483947110==--

