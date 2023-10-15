Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC96FC04E68
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:23 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.102672.1697399114541423766
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hVUx8Drp;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=k+nDZXFC;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.192, mailfrom: 0101018b34df0799-f57b4fd2-624e-4917-8830-eee27701b105-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=y+xHMJjc0/tNXjrV7WBKIZqUZm4wIlOXR6KEWKk13nk=;
	b=hVUx8DrpiEK/6nyCaYAynYKvbClxqEXQnkPIbJY+qtf1WoL/+ghZbk8oi3v3bz1a
	4yzCDyokpPIS2i+Y0DArNKr3rwPx+AlTypYLy9pV29z1Vbr+VcOQ4FRtkCAxi4072c/
	dOZqT4WrbfaIZ1Ue7/mIqTH0nAaKos1FnjqOezeQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=y+xHMJjc0/tNXjrV7WBKIZqUZm4wIlOXR6KEWKk13nk=;
	b=k+nDZXFCyJs/Uol1pbkWy6K2K3iYamStSFvGQzanZn+KRRP9fNhO4dXqRxhjHFDg
	RfB7qLB/KBU2acD4p62+LAm48x7f6d4+77QyHKVE/Bhzbmo2CkwvXaJEubBchrGiByW
	2rjgg/Fa1OA5xZ2S1bbD8xGSyTsHNqyy6HsBcJ6U=
Content-Type: multipart/mixed; boundary="===============6725846626073795249=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2023.9 FAILED
Message-ID: <0101018b34df0799-f57b4fd2-624e-4917-8830-eee27701b105-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189185

--===============6725846626073795249==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dtschema* to *2023.9* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2023.7-2023.9.patch
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
From 67e3fdf0c8f4d37f445aa7996c6d7405776ebbcb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 10:55:19 +0000
Subject: [PATCH] python3-dtschema: upgrade 2023.7 -> 2023.9

---
 .../{python3-dtschema_2023.7.bb => python3-dtschema_2023.9.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2023.7.bb => python3-dtschema_2023.9.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2023.7.bb b/meta/recipes-devtools/python/python3-dtschema_2023.9.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2023.7.bb
rename to meta/recipes-devtools/python/python3-dtschema_2023.9.bb
index c1dc3e019a..8cf6f54f76 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2023.7.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2023.9.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "de7cd73a35244cf76a8cdd9919bbeb31f362aa5744f3c76c80e0e612489dd0c0"
+SRC_URI[sha256sum] = "52c6d271065155ca134d8a0bcf7e0ebed67b3991acbbd7a98b74eb8642f67d87"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.39.2


--===============6725846626073795249==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2023.7-2023.9.patch"

RnJvbSA2N2UzZmRmMGM4ZjRkMzdmNDQ1YWE3OTk2YzZkNzQwNTc3NmViYmNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTA6NTU6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWR0c2NoZW1hOiB1cGdyYWRlIDIwMjMuNyAtPiAyMDIzLjkKCi0tLQogLi4uL3tweXRo
b24zLWR0c2NoZW1hXzIwMjMuNy5iYiA9PiBweXRob24zLWR0c2NoZW1hXzIwMjMuOS5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1kdHNjaGVtYV8yMDIzLjcu
YmIgPT4gcHl0aG9uMy1kdHNjaGVtYV8yMDIzLjkuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjMuNy5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDIzLjkuYmIKc2lt
aWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWR0c2NoZW1hXzIwMjMuNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjMuOS5iYgppbmRleCBjMWRjM2UwMTlhLi44
Y2Y2ZjU0Zjc2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtZHRzY2hlbWFfMjAyMy43LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1kdHNjaGVtYV8yMDIzLjkuYmIKQEAgLTcsNyArNyw3IEBAIGluaGVyaXQgcHlwaSBz
ZXR1cHRvb2xzMwogCiBQWVBJX1BBQ0tBR0UgPSAiZHRzY2hlbWEiCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICJkZTdjZDczYTM1MjQ0Y2Y3NmE4Y2RkOTkxOWJiZWIzMWYzNjJhYTU3NDRmM2M3NmM4
MGUwZTYxMjQ4OWRkMGMwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjUyYzZkMjcxMDY1MTU1Y2Ex
MzRkOGEwYmNmN2UwZWJlZDY3YjM5OTFhY2JiZDdhOThiNzRlYjg2NDJmNjdkODciCiAKIERFUEVO
RFMgKz0gInB5dGhvbjMtc2V0dXB0b29scy1zY20tbmF0aXZlIgogUkRFUEVORFM6JHtQTn0gKz0g
IlwKLS0gCjIuMzkuMgoK

--===============6725846626073795249==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1844 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (911 cached, 1 parsed). 1844 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-656dfc6a5bec8d642c0a675b05723cbbe5e7540d"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:656dfc6a5bec8d642c0a675b05723cbbe5e7540d"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 233 Local 222 Mirrors 0 Missed 11 Current 538 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1522 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_recipe_qa)
NOTE: recipe python3-dtschema-2023.9-r0: task do_recipe_qa: Started
NOTE: recipe python3-dtschema-2023.9-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2178 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_fetch)
NOTE: recipe python3-dtschema-2023.9-r0: task do_fetch: Started
NOTE: recipe python3-dtschema-2023.9-r0: task do_fetch: Succeeded
NOTE: Running task 2179 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_unpack)
NOTE: Running task 2180 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-dtschema-2023.9-r0: task do_unpack: Started
NOTE: recipe python3-dtschema-2023.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dtschema-2023.9-r0: task do_unpack: Succeeded
NOTE: Running task 2181 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_patch)
NOTE: Running task 2182 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_collect_spdx_deps)
NOTE: recipe python3-dtschema-2023.9-r0: task do_patch: Started
NOTE: recipe python3-dtschema-2023.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-dtschema-2023.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dtschema-2023.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-dtschema-2023.9-r0: task do_patch: Succeeded
NOTE: Running task 2183 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2184 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_populate_lic)
NOTE: recipe python3-dtschema-2023.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dtschema-2023.9-r0: task do_populate_lic: Started
NOTE: recipe python3-dtschema-2023.9-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-dtschema-2023.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2185 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_configure)
NOTE: recipe python3-dtschema-2023.9-r0: task do_configure: Started
NOTE: recipe python3-dtschema-2023.9-r0: task do_configure: Succeeded
NOTE: Running task 2186 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_compile)
NOTE: recipe python3-dtschema-2023.9-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dtschema/2023.9/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dtschema/2023.9/dtschema-2023.9/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dtschema/2023.9/temp/run.do_compile.1544040:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dtschema/2023.9/temp/run.do_compile.1544040, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dtschema/2023.9/temp/run.do_compile.1544040, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dtschema/2023.9/temp/run.do_compile.1544040, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dtschema/2023.9/temp/run.do_compile.1544040, line 184
NOTE: recipe python3-dtschema-2023.9-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2186 tasks of which 2176 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-dtschema-2023.9-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-dtschema-2023.9-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dtschema/2023.9/temp/run.do_compile.1544040', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dtschema/2023.9/temp/log.do_compile.1544040
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_compile) failed with exit code '1'

--===============6725846626073795249==--

