Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B76CEC83F16
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:15:05 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.8897.1749993294802078388
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QePUmgxJ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ss8TGbqv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019773ba89d5-36fe99bd-d3c5-4985-aa72-bc6ef43f2a06-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993294;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=k5VGqiGp8WnlWGwcQrqGOqmkvjw8HoorUqkN7rm/oxM=;
	b=QePUmgxJ+/CgWZfB9sMDlOfDpaMV5fex9oTRv7fFdT6U7RIOVrAJQcCfZPkPdh1s
	Q2/kvjNu0dzxlc8493WCZW/ru300OFDKUlEjNpV0tk7KjPuDxcTiFAJznXFzEREsyIr
	yWYbjil7r4W5XajMdMT9I9CLCmPnmy7CbRcqlEKI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993294;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=k5VGqiGp8WnlWGwcQrqGOqmkvjw8HoorUqkN7rm/oxM=;
	b=ss8TGbqvHJKCp976S7JafMtD0Vy8zWwInz1HqG5Ip8jkjKb7uabp/6ctiAAWHrX0
	5u3QWNU1zdy6pvmiDawtBBX/dmSctwR9bkW1HQXpKnxvWn1waYBUcw8iJtPcTbC/t0b
	0urWlwmOsdh0UDC71Myf+eytNIcJnbo1KB1Zx4Yk=
Content-Type: multipart/mixed; boundary="===============2437504557362015017=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] tcf-agent: upgrading to 1.9.0 FAILED
Message-ID: <0101019773ba89d5-36fe99bd-d3c5-4985-aa72-bc6ef43f2a06-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218705

--===============2437504557362015017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *tcf-agent* to *1.9.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-tcf-agent-upgrade-1.8.0-1.9.0.patch
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
From e433faca7d436791eee822c192098d1c31c96111 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 09:40:20 +0000
Subject: [PATCH] tcf-agent: upgrade 1.8.0 -> 1.9.0

---
 .../tcf-agent/tcf-agent/ldflags.patch         | 22 +++++++++----------
 ...{tcf-agent_1.8.0.bb => tcf-agent_1.9.0.bb} |  2 +-
 2 files changed, 11 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/tcf-agent/{tcf-agent_1.8.0.bb => tcf-agent_1.9.0.bb} (97%)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch b/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
index d701e8dec0..e12ccf85e2 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
@@ -1,29 +1,27 @@
+From bc44ae96f56db3f7ae4544c9aa32b47ebd04436f Mon Sep 17 00:00:00 2001
+From: Abdur Rehman <abdur_rehman@mentor.com>
+Date: Wed, 26 Aug 2015 19:18:11 +0500
+Subject: [PATCH] tcf-agent: obey LDFLAGS
+
 We need LDFLAGS to be respected otherwise there are QA warnings as the right
 flags don't get used.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
-From d92af0483c20365fd0af740d0baef8870b4aa374 Mon Sep 17 00:00:00 2001
-From: Abdur Rehman <abdur_rehman@mentor.com>
-Date: Wed, 26 Aug 2015 19:18:11 +0500
-Subject: [PATCH] tcf-agent: obey LDFLAGS
-
 Signed-off-by: Abdur Rehman <abdur_rehman@mentor.com>
 
 Rebased to 4a2c4baaccbc8c29ce0297705de9a4e096d57ce5 version
 
 Signed-off-by: Mark hatle <mark.hatle@amd.com>
-
-
 ---
- Makefile.inc |    2 +-
+ agent/Makefile.inc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: agent/Makefile.inc
-===================================================================
---- agent.orig/Makefile.inc
-+++ agent/Makefile.inc
+diff --git a/agent/Makefile.inc b/agent/Makefile.inc
+index 76b88618..6dce28f5 100644
+--- a/agent/Makefile.inc
++++ b/agent/Makefile.inc
 @@ -111,7 +111,7 @@ NO_LINK_F   ?= -c
  # Linker definition and flags
  
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_1.8.0.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb
similarity index 97%
rename from meta/recipes-devtools/tcf-agent/tcf-agent_1.8.0.bb
rename to meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb
index b02fcb9cad..e699db1269 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_1.8.0.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://bugs.eclipse.org/bugs/"
 LICENSE = "EPL-1.0 | BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://edl-v10.html;md5=522a390a83dc186513f0500543ad3679"
 
-SRCREV = "1f11747e83ebf4f53e8d17f430136f92ec378709"
+SRCREV = "9076423f959d53aafa4000d6bb8bf2a1485971b9"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 SRC_URI = "git://gitlab.eclipse.org/eclipse/tcf/tcf.agent.git;protocol=https;branch=master \
-- 
2.47.1


--===============2437504557362015017==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tcf-agent-upgrade-1.8.0-1.9.0.patch"

RnJvbSBlNDMzZmFjYTdkNDM2NzkxZWVlODIyYzE5MjA5OGQxYzMxYzk2MTExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMDk6NDA6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
Y2YtYWdlbnQ6IHVwZ3JhZGUgMS44LjAgLT4gMS45LjAKCi0tLQogLi4uL3RjZi1hZ2VudC90Y2Yt
YWdlbnQvbGRmbGFncy5wYXRjaCAgICAgICAgIHwgMjIgKysrKysrKysrLS0tLS0tLS0tLQogLi4u
e3RjZi1hZ2VudF8xLjguMC5iYiA9PiB0Y2YtYWdlbnRfMS45LjAuYmJ9IHwgIDIgKy0KIDIgZmls
ZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3RjZi1hZ2VudC97dGNmLWFnZW50XzEuOC4wLmJiID0+IHRjZi1h
Z2VudF8xLjkuMC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
dGNmLWFnZW50L3RjZi1hZ2VudC9sZGZsYWdzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3RjZi1hZ2VudC90Y2YtYWdlbnQvbGRmbGFncy5wYXRjaAppbmRleCBkNzAxZThkZWMwLi5lMTJj
Y2Y4NWUyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNmLWFnZW50L3RjZi1h
Z2VudC9sZGZsYWdzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2YtYWdlbnQv
dGNmLWFnZW50L2xkZmxhZ3MucGF0Y2gKQEAgLTEsMjkgKzEsMjcgQEAKK0Zyb20gYmM0NGFlOTZm
NTZkYjNmN2FlNDU0NGM5YWEzMmI0N2ViZDA0NDM2ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb206IEFiZHVyIFJlaG1hbiA8YWJkdXJfcmVobWFuQG1lbnRvci5jb20+CitEYXRlOiBXZWQs
IDI2IEF1ZyAyMDE1IDE5OjE4OjExICswNTAwCitTdWJqZWN0OiBbUEFUQ0hdIHRjZi1hZ2VudDog
b2JleSBMREZMQUdTCisKIFdlIG5lZWQgTERGTEFHUyB0byBiZSByZXNwZWN0ZWQgb3RoZXJ3aXNl
IHRoZXJlIGFyZSBRQSB3YXJuaW5ncyBhcyB0aGUgcmlnaHQKIGZsYWdzIGRvbid0IGdldCB1c2Vk
LgogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29lLWNvcmUgc3BlY2lmaWNdCiBT
aWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KIAotRnJvbSBk
OTJhZjA0ODNjMjAzNjVmZDBhZjc0MGQwYmFlZjg4NzBiNGFhMzc0IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQotRnJvbTogQWJkdXIgUmVobWFuIDxhYmR1cl9yZWhtYW5AbWVudG9yLmNvbT4KLURh
dGU6IFdlZCwgMjYgQXVnIDIwMTUgMTk6MTg6MTEgKzA1MDAKLVN1YmplY3Q6IFtQQVRDSF0gdGNm
LWFnZW50OiBvYmV5IExERkxBR1MKLQogU2lnbmVkLW9mZi1ieTogQWJkdXIgUmVobWFuIDxhYmR1
cl9yZWhtYW5AbWVudG9yLmNvbT4KIAogUmViYXNlZCB0byA0YTJjNGJhYWNjYmM4YzI5Y2UwMjk3
NzA1ZGU5YTRlMDk2ZDU3Y2U1IHZlcnNpb24KIAogU2lnbmVkLW9mZi1ieTogTWFyayBoYXRsZSA8
bWFyay5oYXRsZUBhbWQuY29tPgotCi0KIC0tLQotIE1ha2VmaWxlLmluYyB8ICAgIDIgKy0KKyBh
Z2VudC9NYWtlZmlsZS5pbmMgfCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCiAKLUluZGV4OiBhZ2VudC9NYWtlZmlsZS5pbmMKLT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0K
LS0tLSBhZ2VudC5vcmlnL01ha2VmaWxlLmluYwotKysrIGFnZW50L01ha2VmaWxlLmluYworZGlm
ZiAtLWdpdCBhL2FnZW50L01ha2VmaWxlLmluYyBiL2FnZW50L01ha2VmaWxlLmluYworaW5kZXgg
NzZiODg2MTguLjZkY2UyOGY1IDEwMDY0NAorLS0tIGEvYWdlbnQvTWFrZWZpbGUuaW5jCisrKysg
Yi9hZ2VudC9NYWtlZmlsZS5pbmMKIEBAIC0xMTEsNyArMTExLDcgQEAgTk9fTElOS19GICAgPz0g
LWMKICAjIExpbmtlciBkZWZpbml0aW9uIGFuZCBmbGFncwogIApkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3RjZi1hZ2VudC90Y2YtYWdlbnRfMS44LjAuYmIgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvdGNmLWFnZW50L3RjZi1hZ2VudF8xLjkuMC5iYgpzaW1pbGFyaXR5IGluZGV4
IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNmLWFnZW50L3RjZi1hZ2Vu
dF8xLjguMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjZi1hZ2VudC90Y2Yt
YWdlbnRfMS45LjAuYmIKaW5kZXggYjAyZmNiOWNhZC4uZTY5OWRiMTI2OSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjZi1hZ2VudC90Y2YtYWdlbnRfMS44LjAuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjZi1hZ2VudC90Y2YtYWdlbnRfMS45LjAuYmIKQEAgLTYs
NyArNiw3IEBAIEJVR1RSQUNLRVIgPSAiaHR0cHM6Ly9idWdzLmVjbGlwc2Uub3JnL2J1Z3MvIgog
TElDRU5TRSA9ICJFUEwtMS4wIHwgQlNELTMtQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vZWRsLXYxMC5odG1sO21kNT01MjJhMzkwYTgzZGMxODY1MTNmMDUwMDU0M2FkMzY3OSIK
IAotU1JDUkVWID0gIjFmMTE3NDdlODNlYmY0ZjUzZThkMTdmNDMwMTM2ZjkyZWMzNzg3MDkiCitT
UkNSRVYgPSAiOTA3NjQyM2Y5NTlkNTNhYWZhNDAwMGQ2YmI4YmYyYTE0ODU5NzFiOSIKIAogVVBT
VFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAiKD9QPHB2ZXI+KFxkKyhcLlxkKykrKSkiCiBTUkNf
VVJJID0gImdpdDovL2dpdGxhYi5lY2xpcHNlLm9yZy9lY2xpcHNlL3RjZi90Y2YuYWdlbnQuZ2l0
O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIgXAotLSAKMi40Ny4xCgo=

--===============2437504557362015017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1910 entries from dependency cache.
Parsing recipes...done.
Parsing of 935 .bb files complete (934 cached, 1 parsed). 1910 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:1984077960486a64656d6f7bea938ddbd6cb107f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 208 Local 196 Mirrors 0 Missed 12 Current 328 (94% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1239 of 1544 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb:do_recipe_qa)
NOTE: recipe tcf-agent-1.9.0-r0: task do_recipe_qa: Started
NOTE: recipe tcf-agent-1.9.0-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb:do_recipe_qa unihash changed to 87f68c1084e655072422f00adea44856d331e9ae7ccbf232ba8d62191e218d5c
NOTE: Setscene tasks completed
NOTE: Running task 1525 of 1544 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb:do_fetch)
NOTE: recipe tcf-agent-1.9.0-r0: task do_fetch: Started
NOTE: recipe tcf-agent-1.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 1526 of 1544 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb:do_unpack)
NOTE: Running task 1527 of 1544 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcf-agent-1.9.0-r0: task do_unpack: Started
NOTE: recipe tcf-agent-1.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcf-agent-1.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 1528 of 1544 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb:do_patch)
NOTE: Running task 1529 of 1544 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb:do_collect_spdx_deps)
NOTE: recipe tcf-agent-1.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcf-agent-1.9.0-r0: task do_patch: Started
NOTE: recipe tcf-agent-1.9.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe tcf-agent-1.9.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tcf-agent-1.9.0-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1529 tasks of which 1523 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250615094007.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250615094007.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/tcf-agent/1.9.0/temp/log.do_patch.4180576
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: tcf-agent-1.9.0-r0 do_patch: Applying patch 'ldflags.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/tcf-agent/1.9.0/git/agent'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/tcf-agent/1.9.0/recipe-sysroot-native/etc/quiltrc push', 0, "stdout: Applying patch ldflags.patch
can't find file to patch at input line 25
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From bc44ae96f56db3f7ae4544c9aa32b47ebd04436f Mon Sep 17 00:00:00 2001
|From: Abdur Rehman <abdur_rehman@mentor.com>
|Date: Wed, 26 Aug 2015 19:18:11 +0500
|Subject: [PATCH] tcf-agent: obey LDFLAGS
|
|We need LDFLAGS to be respected otherwise there are QA warnings as the right
|flags don't get used.
|
|Upstream-Status: Inappropriate [oe-core specific]
|Signed-off-by: Ross Burton <ross.burton@arm.com>
|
|Signed-off-by: Abdur Rehman <abdur_rehman@mentor.com>
|
|Rebased to 4a2c4baaccbc8c29ce0297705de9a4e096d57ce5 version
|
|Signed-off-by: Mark hatle <mark.hatle@amd.com>
|---
| agent/Makefile.inc | 2 +-
| 1 file changed, 1 insertion(+), 1 deletion(-)
|
|diff --git a/agent/Makefile.inc b/agent/Makefile.inc
|index 76b88618..6dce28f5 100644
|--- a/agent/Makefile.inc
|+++ b/agent/Makefile.inc
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
Patch ldflags.patch does not apply (enforce with -f)

stderr: ")
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/tcf-agent/1.9.0/temp/log.do_patch.4180576
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb:do_patch) failed with exit code '1'

--===============2437504557362015017==--

