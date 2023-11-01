Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C764C05055
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:12 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.8477.1698848702967985255
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eGNfmNha;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=l2uA+mqx;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.30, mailfrom: 0101018b8b45fe33-9c411485-a187-4ee2-addb-9c6a0b406b3a-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848702;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wWvRq31EG4u9ACLx2sJw5XaHom2WBMYHdq7zjbhfh90=;
	b=eGNfmNhaLJQ71vhlgD4OXX5I88uga4GrqnEBLjcMhiHenl9/VLJAIOwhv6ntTX9n
	40TbFNA5V1KSLyFRGIBWImpy/IonciY4+FNe1wGav2+t1CiAdyaQeR3a5X6zHuxOymj
	fl6WrGUP0fk01pqhG3PQuKRThS7i305wTr0mCh3w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848702;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wWvRq31EG4u9ACLx2sJw5XaHom2WBMYHdq7zjbhfh90=;
	b=l2uA+mqxNGlheeYH2BNmZ6l3u5FKrHv4Ny0q8MM5mSHbraSE03NgnqXPu+4YWqBb
	XV7PCVKNh73pppVH10y0w8cP20vZFwNezvJGDnAaiAr2V4cvhfreZ8jsGk3h4FUQGxx
	vaNgbd6Owbq2GazN3Dgvnz0wygEegLT7nfnVtJb0=
Content-Type: multipart/mixed; boundary="===============3755362069964092901=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gettext: upgrading to 0.22.3 FAILED
Message-ID: <0101018b8b45fe33-9c411485-a187-4ee2-addb-9c6a0b406b3a-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189922

--===============3755362069964092901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gettext* to *0.22.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gettext-upgrade-0.22-0.22.3.patch
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
From 070eeda6b3d9cbee2416d6ba84d071c35f97679d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 05:56:37 +0000
Subject: [PATCH] gettext: upgrade 0.22 -> 0.22.3

---
 meta/recipes-core/gettext/gettext-sources.inc                   | 2 +-
 .../recipes-core/gettext/{gettext_0.22.bb => gettext_0.22.3.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/gettext/{gettext_0.22.bb => gettext_0.22.3.bb} (100%)

diff --git a/meta/recipes-core/gettext/gettext-sources.inc b/meta/recipes-core/gettext/gettext-sources.inc
index b4fb647916..31dabfc543 100644
--- a/meta/recipes-core/gettext/gettext-sources.inc
+++ b/meta/recipes-core/gettext/gettext-sources.inc
@@ -1,4 +1,4 @@
 HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            "
-SRC_URI[sha256sum] = "49f089be11b490170bbf09ed2f51e5f5177f55be4cc66504a5861820e0fb06ab"
+SRC_URI[sha256sum] = "839a260b2314ba66274dae7d245ec19fce190a3aa67869bf31354cb558df42c7"
diff --git a/meta/recipes-core/gettext/gettext_0.22.bb b/meta/recipes-core/gettext/gettext_0.22.3.bb
similarity index 100%
rename from meta/recipes-core/gettext/gettext_0.22.bb
rename to meta/recipes-core/gettext/gettext_0.22.3.bb
-- 
2.39.2


--===============3755362069964092901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1845 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (909 cached, 2 parsed). 1842 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-f87dc89c947d0106c5437882b9b936825139e7d6"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f87dc89c947d0106c5437882b9b936825139e7d6"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 370 Local 0 Mirrors 0 Missed 370 Current 254 (0% match, 40% complete)
Removing 155 stale sstate objects for arch x86_64...done.
Removing 50 stale sstate objects for arch qemux86_64...done.
Removing 147 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 19 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext-minimal-native_0.22.bb:do_recipe_qa)
NOTE: Running task 265 of 1763 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.22.3.bb:do_recipe_qa)
NOTE: recipe gettext-minimal-native-0.22-r0: task do_recipe_qa: Started
NOTE: Running task 499 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.22.3.bb:do_recipe_qa)
NOTE: Running task 510 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_fetch)
NOTE: recipe gettext-minimal-native-0.22-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext-minimal-native_0.22.bb:do_recipe_qa unihash changed to fd321419c9276f338a3d103348fdc2dc06d3f287af59591a0a0b0e25597080b4
NOTE: recipe gettext-native-0.22.3-r0: task do_recipe_qa: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_fetch: Started
NOTE: recipe gettext-0.22.3-r0: task do_recipe_qa: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_fetch: Succeeded
NOTE: recipe gettext-native-0.22.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe gettext-0.22.3-r0: task do_recipe_qa: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 571 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext-minimal-native_0.22.bb:do_fetch)
NOTE: Running task 572 of 1763 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.22.3.bb:do_fetch)
NOTE: Running task 573 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.22.3.bb:do_fetch)
NOTE: recipe gettext-minimal-native-0.22-r0: task do_fetch: Started
WARNING: gettext-minimal-native-0.22-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/gettext-0.22.tar.gz
Cleaning and trying again.
WARNING: gettext-minimal-native-0.22-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/gettext-0.22.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/gettext-0.22.tar.gz_bad-checksum_49f089be11b490170bbf09ed2f51e5f5177f55be4cc66504a5861820e0fb06ab
NOTE: recipe gettext-0.22.3-r0: task do_fetch: Started
NOTE: recipe gettext-0.22.3-r0: task do_fetch: Succeeded
NOTE: Running task 574 of 1763 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.22.3.bb:do_unpack)
NOTE: recipe gettext-native-0.22.3-r0: task do_fetch: Started
NOTE: recipe gettext-native-0.22.3-r0: task do_fetch: Succeeded
NOTE: Running task 575 of 1763 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.22.3.bb:do_unpack)
NOTE: recipe gettext-0.22.3-r0: task do_unpack: Started
NOTE: recipe gettext-native-0.22.3-r0: task do_unpack: Started
NOTE: recipe gettext-0.22.3-r0: task do_unpack: Succeeded
WARNING: gettext-minimal-native-0.22-r0 do_fetch: Checksum failure encountered with download of https://ftp.gnu.org/gnu/gettext/gettext-0.22.tar.gz - will attempt other sources if available
NOTE: recipe gettext-native-0.22.3-r0: task do_unpack: Succeeded
NOTE: Running task 576 of 1763 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.22.3.bb:do_patch)
NOTE: recipe gettext-native-0.22.3-r0: task do_patch: Started
NOTE: recipe gettext-native-0.22.3-r0: task do_patch: Succeeded
NOTE: Running task 577 of 1763 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.22.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gettext-native-0.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gettext-native-0.22.3-r0: task do_deploy_source_date_epoch: Succeeded
WARNING: gettext-minimal-native-0.22-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/gettext-0.22.tar.gz
Cleaning and trying again.
WARNING: gettext-minimal-native-0.22-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/gettext-0.22.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/gettext-0.22.tar.gz_bad-checksum_49f089be11b490170bbf09ed2f51e5f5177f55be4cc66504a5861820e0fb06ab
NOTE: recipe gettext-minimal-native-0.22-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 577 tasks of which 566 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext-minimal-native_0.22.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gettext-minimal-native-0.22-r0 do_fetch: Checksum failure fetching https://ftp.gnu.org/gnu/gettext/gettext-0.22.tar.gz
ERROR: gettext-minimal-native-0.22-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/gettext-0.22.tar.gz\' has sha256 checksum \'49f089be11b490170bbf09ed2f51e5f5177f55be4cc66504a5861820e0fb06ab\' when \'839a260b2314ba66274dae7d245ec19fce190a3aa67869bf31354cb558df42c7\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "49f089be11b490170bbf09ed2f51e5f5177f55be4cc66504a5861820e0fb06ab"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://ftp.gnu.org/gnu/gettext/gettext-0.22.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gettext-minimal-native/0.22/temp/log.do_fetch.668442
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext-minimal-native_0.22.bb:do_fetch) failed with exit code '1'

--===============3755362069964092901==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gettext-upgrade-0.22-0.22.3.patch"

RnJvbSAwNzBlZWRhNmIzZDljYmVlMjQxNmQ2YmE4NGQwNzFjMzVmOTc2NzlkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwNTo1NjozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdl
dHRleHQ6IHVwZ3JhZGUgMC4yMiAtPiAwLjIyLjMKCi0tLQogbWV0YS9yZWNpcGVzLWNvcmUvZ2V0
dGV4dC9nZXR0ZXh0LXNvdXJjZXMuaW5jICAgICAgICAgICAgICAgICAgIHwgMiArLQogLi4uL3Jl
Y2lwZXMtY29yZS9nZXR0ZXh0L3tnZXR0ZXh0XzAuMjIuYmIgPT4gZ2V0dGV4dF8wLjIyLjMuYmJ9
IHwgMAogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1jb3JlL2dldHRleHQve2dldHRleHRfMC4yMi5iYiA9PiBnZXR0ZXh0
XzAuMjIuMy5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2V0dGV4
dC9nZXR0ZXh0LXNvdXJjZXMuaW5jIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2V0dGV4dC9nZXR0ZXh0
LXNvdXJjZXMuaW5jCmluZGV4IGI0ZmI2NDc5MTYuLjMxZGFiZmM1NDMgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1jb3JlL2dldHRleHQvZ2V0dGV4dC1zb3VyY2VzLmluYworKysgYi9tZXRhL3Jl
Y2lwZXMtY29yZS9nZXR0ZXh0L2dldHRleHQtc291cmNlcy5pbmMKQEAgLTEsNCArMSw0IEBACiBI
T01FUEFHRSA9ICJodHRwOi8vd3d3LmdudS5vcmcvc29mdHdhcmUvZ2V0dGV4dC9nZXR0ZXh0Lmh0
bWwiCiBTUkNfVVJJID0gIiR7R05VX01JUlJPUn0vZ2V0dGV4dC9nZXR0ZXh0LSR7UFZ9LnRhci5n
eiBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0OWYwODliZTExYjQ5MDE3
MGJiZjA5ZWQyZjUxZTVmNTE3N2Y1NWJlNGNjNjY1MDRhNTg2MTgyMGUwZmIwNmFiIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjgzOWEyNjBiMjMxNGJhNjYyNzRkYWU3ZDI0NWVjMTlmY2UxOTBhM2Fh
Njc4NjliZjMxMzU0Y2I1NThkZjQyYzciCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9n
ZXR0ZXh0L2dldHRleHRfMC4yMi5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2dldHRleHQvZ2V0dGV4
dF8wLjIyLjMuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1jb3JlL2dldHRleHQvZ2V0dGV4dF8wLjIyLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29y
ZS9nZXR0ZXh0L2dldHRleHRfMC4yMi4zLmJiCi0tIAoyLjM5LjIKCg==

--===============3755362069964092901==--

