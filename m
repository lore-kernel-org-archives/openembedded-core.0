Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA3AC54FAD
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:26 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.75497.1722536828104115023
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=GMzB/Lgw;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=x6NpryXF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101910f32365b-61f42c7e-0e97-4c8f-813e-dcdd6dd7710a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536834;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UsfkP+avKtIVurymTRCRJLwjQUjwGHgavtmtI5Ic3XA=;
	b=GMzB/LgwB5WGJA9YRRHNsxPjgqNWmzWPirZhZKlYgTAt+T3zKbuz26M3RwoAQcXB
	90tBgtfjOaWL4H353ToRrycdGlPaDs+BxzjL0gzjqd2khqarGIC1HwjKbwQcZ0+awVW
	Ve+xwU+O3BBeVflkne9ugndPgS+iA1Wc+KYrKpFs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536834;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UsfkP+avKtIVurymTRCRJLwjQUjwGHgavtmtI5Ic3XA=;
	b=x6NpryXFujKkv5TbbeQz1eo915Lx/H+u9fua4JDg2J93XrQk9QW6BiZGc5YNGvn1
	6QZFqtm/isAdWxeUs1zXsppTVpIwYiZOvBrcfPnFM991jXcgfXcLWZLz6Dj6YCazuVO
	CZh1GxFSF+aXidSk605wVD51Q4sZChWbgxtEUpP8=
Content-Type: multipart/mixed; boundary="===============8435530529154425334=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtraceevent: upgrading to 1.8.3 FAILED
Message-ID: <010101910f32365b-61f42c7e-0e97-4c8f-813e-dcdd6dd7710a-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202858

--===============8435530529154425334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libtraceevent* to *1.8.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libtraceevent-upgrade-1.8.2-1.8.3.patch
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
From a1f77ce5584bbfaf24e155a6db2e397fc1e0a74c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 14:59:32 +0000
Subject: [PATCH] libtraceevent: upgrade 1.8.2 -> 1.8.3

---
 .../{libtraceevent_1.8.2.bb => libtraceevent_1.8.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/libtraceevent/{libtraceevent_1.8.2.bb => libtraceevent_1.8.3.bb} (93%)

diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.2.bb b/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb
similarity index 93%
rename from meta/recipes-kernel/libtraceevent/libtraceevent_1.8.2.bb
rename to meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb
index d4ace54884..c98fdc5fad 100644
--- a/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.2.bb
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97
                     file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
 SECTION = "libs"
 
-SRCREV = "6f6d5802f31992e7527a4c32b43a32fda6bf6bdf"
+SRCREV = "645a883516e343ee970ebb80398cfd7b7dbd227e"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=${BPN};protocol=https \
            file://meson.patch"
 
-- 
2.44.0


--===============8435530529154425334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1883 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (919 cached, 1 parsed). 1883 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-9dbed84d9ddd4b43cc8fd11d5ed746518b71eb49"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:9dbed84d9ddd4b43cc8fd11d5ed746518b71eb49"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 100 Local 88 Mirrors 0 Missed 12 Current 255 (88% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 920 of 1059 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb:do_recipe_qa)
NOTE: Running task 983 of 1059 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb:do_write_config)
NOTE: recipe libtraceevent-1.8.3-r0: task do_recipe_qa: Started
NOTE: recipe libtraceevent-1.8.3-r0: task do_write_config: Started
NOTE: recipe libtraceevent-1.8.3-r0: task do_write_config: Succeeded
NOTE: recipe libtraceevent-1.8.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1040 of 1059 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb:do_fetch)
NOTE: recipe libtraceevent-1.8.3-r0: task do_fetch: Started
NOTE: recipe libtraceevent-1.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 1041 of 1059 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb:do_unpack)
NOTE: Running task 1042 of 1059 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtraceevent-1.8.3-r0: task do_unpack: Started
NOTE: recipe libtraceevent-1.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtraceevent-1.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtraceevent-1.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 1043 of 1059 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb:do_patch)
NOTE: Running task 1044 of 1059 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb:do_collect_spdx_deps)
NOTE: recipe libtraceevent-1.8.3-r0: task do_patch: Started
NOTE: recipe libtraceevent-1.8.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtraceevent-1.8.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtraceevent-1.8.3-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1044 tasks of which 1037 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801145916.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801145916.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: libtraceevent-1.8.3-r0 do_patch: Applying patch 'meson.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libtraceevent/1.8.3/git'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libtraceevent/1.8.3/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch meson.patch
patching file meson.build
Hunk #1 FAILED at 25.
1 out of 1 hunk FAILED -- rejects in file meson.build
patching file plugins/meson.build
Hunk #1 FAILED at 19.
1 out of 1 hunk FAILED -- rejects in file plugins/meson.build
Patch meson.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libtraceevent/1.8.3/temp/log.do_patch.3845254
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb:do_patch) failed with exit code '1'

--===============8435530529154425334==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libtraceevent-upgrade-1.8.2-1.8.3.patch"

RnJvbSBhMWY3N2NlNTU4NGJiZmFmMjRlMTU1YTZkYjJlMzk3ZmMxZTBhNzRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxNDo1OTozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnRyYWNlZXZlbnQ6IHVwZ3JhZGUgMS44LjIgLT4gMS44LjMKCi0tLQogLi4uL3tsaWJ0cmFjZWV2
ZW50XzEuOC4yLmJiID0+IGxpYnRyYWNlZXZlbnRfMS44LjMuYmJ9ICAgICAgICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWtlcm5lbC9saWJ0cmFjZWV2ZW50L3tsaWJ0cmFjZWV2ZW50XzEuOC4yLmJiID0+
IGxpYnRyYWNlZXZlbnRfMS44LjMuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWtlcm5lbC9saWJ0cmFjZWV2ZW50L2xpYnRyYWNlZXZlbnRfMS44LjIuYmIgYi9tZXRhL3JlY2lw
ZXMta2VybmVsL2xpYnRyYWNlZXZlbnQvbGlidHJhY2VldmVudF8xLjguMy5iYgpzaW1pbGFyaXR5
IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMta2VybmVsL2xpYnRyYWNlZXZlbnQv
bGlidHJhY2VldmVudF8xLjguMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9saWJ0
cmFjZWV2ZW50L2xpYnRyYWNlZXZlbnRfMS44LjMuYmIKaW5kZXggZDRhY2U1NDg4NC4uYzk4ZmRj
NWZhZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saWJ0cmFjZWV2ZW50L2xpYnRy
YWNlZXZlbnRfMS44LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saWJ0cmFjZWV2ZW50
L2xpYnRyYWNlZXZlbnRfMS44LjMuYmIKQEAgLTgsNyArOCw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0VTL0dQTC0yLjA7bWQ1PWU2YTc1MzcxYmE0ZDE2NzQ5MjU0YTUxMjE1
ZDEzZjk3CiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFUy9MR1BMLTIuMTttZDU9
YjM3MDg4Nzk4MGRiNWRkNDA2NTliNTA5MDkyMzhkYmQiCiBTRUNUSU9OID0gImxpYnMiCiAKLVNS
Q1JFViA9ICI2ZjZkNTgwMmYzMTk5MmU3NTI3YTRjMzJiNDNhMzJmZGE2YmY2YmRmIgorU1JDUkVW
ID0gIjY0NWE4ODM1MTZlMzQzZWU5NzBlYmI4MDM5OGNmZDdiN2RiZDIyN2UiCiBTUkNfVVJJID0g
ImdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlicy9saWJ0cmFjZS9saWJ0cmFjZWV2ZW50
LmdpdDticmFuY2g9JHtCUE59O3Byb3RvY29sPWh0dHBzIFwKICAgICAgICAgICAgZmlsZTovL21l
c29uLnBhdGNoIgogCi0tIAoyLjQ0LjAKCg==

--===============8435530529154425334==--

