Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DED5CA9EC3
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:44 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.7624.1685693431682253217
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZK73jYRN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101887b288752-8e16df9b-7e58-4743-8a34-406aac8cf1d3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693433;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mxGP48elCwS0cFNiu+MNVikWS9MrHFAO+ta4Tq0y9Do=;
	b=ZK73jYRNjyeT1A6XauHYSqQycFPzaXD2z4q5lWuq1mDHkY7fLj1xI1UTNT4TDeTV
	290qqwU1tpyCbqeCchCzHAVHUb/gyAwAXoKiN4XV2y30CVzE+2YU155TyUttN+Di/Ve
	UwzXyX7fhMs/c9ZokHMdouKJGoSMMM/UQ7IBArjs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693433;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mxGP48elCwS0cFNiu+MNVikWS9MrHFAO+ta4Tq0y9Do=;
	b=KIq//oVMhnO5aZ2TQeYMvq1yA/ZEyyA98de2/XKY9/3kQnwojCmmpJUkYP/5/Nng
	M6pSthfZYU6gYJnCfBXxD2B3Y2Y5FD1r9JbeZoN9SdhpkEgr4zk0sCmTsoGUSO0AGNI
	wGZ9hRys+D1xfgWpbJz22exyi/Ox9bVSSgOS5lhY=
Content-Type: multipart/mixed; boundary="===============6224640687771217672=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ghostscript: upgrading to 10.01.1 FAILED
Message-ID: <010101887b288752-8e16df9b-7e58-4743-8a34-406aac8cf1d3-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182211

--===============6224640687771217672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ghostscript* to *10.01.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-ghostscript-upgrade-10.0.0-10.01.1.patch
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
--===============6224640687771217672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1800 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (896 cached, 1 parsed). 1800 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:ef56ba2c014d3401fe12b9beb459ec8d041c64f7"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 146 Local 137 Mirrors 0 Missed 9 Current 328 (93% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1615 of 1708 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb:do_fetch)
NOTE: Running task 1616 of 1708 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb:do_fetch)
NOTE: recipe ghostscript-10.01.1-r0: task do_fetch: Started
NOTE: recipe ghostscript-native-10.01.1-r0: task do_fetch: Started
NOTE: recipe ghostscript-10.01.1-r0: task do_fetch: Succeeded
NOTE: Running task 1687 of 1708 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb:do_unpack)
NOTE: recipe ghostscript-native-10.01.1-r0: task do_fetch: Succeeded
NOTE: Running task 1688 of 1708 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb:do_unpack)
NOTE: Running task 1689 of 1708 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe ghostscript-10.01.1-r0: task do_unpack: Started
NOTE: recipe ghostscript-native-10.01.1-r0: task do_unpack: Started
NOTE: recipe ghostscript-native-10.01.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ghostscript-native-10.01.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ghostscript-10.01.1-r0: task do_unpack: Succeeded
NOTE: Running task 1690 of 1708 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb:do_patch)
NOTE: recipe ghostscript-10.01.1-r0: task do_patch: Started
NOTE: recipe ghostscript-10.01.1-r0: task do_patch: Failed
NOTE: recipe ghostscript-native-10.01.1-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1690 tasks of which 1684 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb:do_patch
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: ghostscript-10.01.1-r0 do_patch: Applying patch 'cross-compile.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ghostscript/10.01.1-r0/ghostscript-10.01.1'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ghostscript/10.01.1-r0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch cross-compile.patch
patching file configure.ac
Hunk #1 FAILED at 138.
Hunk #2 FAILED at 2530.
2 out of 2 hunks FAILED -- rejects in file configure.ac
Patch cross-compile.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ghostscript/10.01.1-r0/temp/log.do_patch.2250100
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb:do_patch) failed with exit code '1'

--===============6224640687771217672==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ghostscript-upgrade-10.0.0-10.01.1.patch"

RnJvbSBjNGM2YWM5MTVlYmU3Njg2YTQ1OGVmMTE4NDBhOGE0ZTE2ZTlkMDYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxOTozMjoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdo
b3N0c2NyaXB0OiB1cGdyYWRlIDEwLjAuMCAtPiAxMC4wMS4xCgotLS0KIC4uLi97Z2hvc3RzY3Jp
cHRfMTAuMC4wLmJiID0+IGdob3N0c2NyaXB0XzEwLjAxLjEuYmJ9ICAgICAgICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC97Z2hvc3RzY3JpcHRfMTAuMC4wLmJiID0+
IGdob3N0c2NyaXB0XzEwLjAxLjEuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2NyaXB0XzEwLjAuMC5iYiBiL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdF8xMC4wMS4xLmJiCnNpbWlsYXJpdHkg
aW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9n
aG9zdHNjcmlwdF8xMC4wLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9z
dHNjcmlwdC9naG9zdHNjcmlwdF8xMC4wMS4xLmJiCmluZGV4IDg2ZWNkYmUyNGEuLjhiMjk4Zjgz
ZDEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9zdHNj
cmlwdF8xMC4wLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2do
b3N0c2NyaXB0XzEwLjAxLjEuYmIKQEAgLTQ2LDcgKzQ2LDcgQEAgU1JDX1VSSTpjbGFzcy1uYXRp
dmUgPSAiJHtTUkNfVVJJX0JBU0V9IFwKICAgICAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9i
YXNlLWdlbmh0LmMtYWRkLWEtcHJlcHJvY2Vzc29yLWRlZmluZS10by1hbGxvdy1mb3BlLnBhdGNo
IFwKICAgICAgICAgICAgICAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImE1
Nzc2NGQ3MGNhZjg1ZTJmYzBiMGY1OWI4M2I5MmUyNTc3NTYzMTcxNGRjZGI5N2NjNmUwY2VhNDE0
YmI1YTMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNGRmMThhODA4Y2Q0MzY5ZjI1ZTAyZGJjZWMy
ZjEzM2NiNmQ2NzQ2MjdiMmM2YjE1MDIwMjBlNThkNDNlMzJjZSIKIAogIyBQdXQgc29tZXRoaW5n
IGxpa2UKICMKLS0gCjIuMzkuMgoK

--===============6224640687771217672==--

