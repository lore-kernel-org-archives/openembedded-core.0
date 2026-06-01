Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2858CD8CA6
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:47 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1561.1780328133183049099
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ehu4zkWM;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=i3qJZ/nQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019e83d39d0d-34f4dda9-bfc2-408f-9e65-28ddd48ea4b3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328144;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Vk97IXOXtkgNLOK6C35df69xWLLWajWqTFAkVpIx3uQ=;
	b=ehu4zkWMmLT5ekEfnDcVG4RsFHca/UmxCDtqmHN09OOvQj73mLaWoY3COV7yImu8
	osjWA4ijpQD6KhKdZS2dcqnWWxqQzb5GsdsMNBENisIPAZy2yiSRx8DdUyQ0gryzcP/
	bbuldHkSZTIjxtW+4UmtJLEF/2ShlWsbxVVuH6a8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328144;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Vk97IXOXtkgNLOK6C35df69xWLLWajWqTFAkVpIx3uQ=;
	b=i3qJZ/nQM2UkFxpI81Qs/JOQvXpW7AcMHTNp5LkZDXsdDmclszUmFcQTLrAUBR7C
	WWusudoDGUFHcT08UV7PjvJnJtblqvtVk8lHy83vnu5Aq6bHz1gC557t7UyNJKcpJEE
	ehJ/SB7tqk0Rn/THxQgmOD5Ho9fGuSpf84V7fJsg=
Content-Type: multipart/mixed; boundary="===============2686624619913377672=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] tcf-agent: upgrading to 1.11.0 FAILED
Message-ID: <0101019e83d39d0d-34f4dda9-bfc2-408f-9e65-28ddd48ea4b3-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237902

--===============2686624619913377672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *tcf-agent* to *1.11.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-tcf-agent-upgrade-1.9.0-1.11.0.patch
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
From 0bc194a9f28d73a413ec8595907bfdcc7078825a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 10:13:58 +0000
Subject: [PATCH] tcf-agent: upgrade 1.9.0 -> 1.11.0

---
 .../tcf-agent/tcf-agent/ldflags.patch         | 22 +++++++++----------
 ...tcf-agent_1.9.0.bb => tcf-agent_1.11.0.bb} |  2 +-
 2 files changed, 11 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/tcf-agent/{tcf-agent_1.9.0.bb => tcf-agent_1.11.0.bb} (98%)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch b/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
index d701e8dec0..65ed5cd82c 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
@@ -1,29 +1,27 @@
+From 0d65ec825813961d3ca1553566ed2c6fed94ef2e Mon Sep 17 00:00:00 2001
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
+index 63f062b2..5da23c02 100644
+--- a/agent/Makefile.inc
++++ b/agent/Makefile.inc
 @@ -111,7 +111,7 @@ NO_LINK_F   ?= -c
  # Linker definition and flags
  
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb
similarity index 98%
rename from meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb
rename to meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb
index 132b3d7dee..6e9c7fc0ad 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_1.9.0.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://bugs.eclipse.org/bugs/"
 LICENSE = "EPL-1.0 | BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://edl-v10.html;md5=522a390a83dc186513f0500543ad3679"
 
-SRCREV = "9076423f959d53aafa4000d6bb8bf2a1485971b9"
+SRCREV = "3051a4806ac4b041ec7c49ffc6d07f0014b8480c"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 SRC_URI = "git://gitlab.eclipse.org/eclipse/tcf/tcf.agent.git;protocol=https;branch=master;tag=${PV} \
-- 
2.47.1


--===============2686624619913377672==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tcf-agent-upgrade-1.9.0-1.11.0.patch"

RnJvbSAwYmMxOTRhOWYyOGQ3M2E0MTNlYzg1OTU5MDdiZmRjYzcwNzg4MjVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxMDoxMzo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHRj
Zi1hZ2VudDogdXBncmFkZSAxLjkuMCAtPiAxLjExLjAKCi0tLQogLi4uL3RjZi1hZ2VudC90Y2Yt
YWdlbnQvbGRmbGFncy5wYXRjaCAgICAgICAgIHwgMjIgKysrKysrKysrLS0tLS0tLS0tLQogLi4u
dGNmLWFnZW50XzEuOS4wLmJiID0+IHRjZi1hZ2VudF8xLjExLjAuYmJ9IHwgIDIgKy0KIDIgZmls
ZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3RjZi1hZ2VudC97dGNmLWFnZW50XzEuOS4wLmJiID0+IHRjZi1h
Z2VudF8xLjExLjAuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3RjZi1hZ2VudC90Y2YtYWdlbnQvbGRmbGFncy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy90Y2YtYWdlbnQvdGNmLWFnZW50L2xkZmxhZ3MucGF0Y2gKaW5kZXggZDcwMWU4ZGVjMC4uNjVl
ZDVjZDgyYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjZi1hZ2VudC90Y2Yt
YWdlbnQvbGRmbGFncy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNmLWFnZW50
L3RjZi1hZ2VudC9sZGZsYWdzLnBhdGNoCkBAIC0xLDI5ICsxLDI3IEBACitGcm9tIDBkNjVlYzgy
NTgxMzk2MWQzY2ExNTUzNTY2ZWQyYzZmZWQ5NGVmMmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tOiBBYmR1ciBSZWhtYW4gPGFiZHVyX3JlaG1hbkBtZW50b3IuY29tPgorRGF0ZTogV2Vk
LCAyNiBBdWcgMjAxNSAxOToxODoxMSArMDUwMAorU3ViamVjdDogW1BBVENIXSB0Y2YtYWdlbnQ6
IG9iZXkgTERGTEFHUworCiBXZSBuZWVkIExERkxBR1MgdG8gYmUgcmVzcGVjdGVkIG90aGVyd2lz
ZSB0aGVyZSBhcmUgUUEgd2FybmluZ3MgYXMgdGhlIHJpZ2h0CiBmbGFncyBkb24ndCBnZXQgdXNl
ZC4KIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtvZS1jb3JlIHNwZWNpZmljXQog
U2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CiAKLUZyb20g
ZDkyYWYwNDgzYzIwMzY1ZmQwYWY3NDBkMGJhZWY4ODcwYjRhYTM3NCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKLUZyb206IEFiZHVyIFJlaG1hbiA8YWJkdXJfcmVobWFuQG1lbnRvci5jb20+Ci1E
YXRlOiBXZWQsIDI2IEF1ZyAyMDE1IDE5OjE4OjExICswNTAwCi1TdWJqZWN0OiBbUEFUQ0hdIHRj
Zi1hZ2VudDogb2JleSBMREZMQUdTCi0KIFNpZ25lZC1vZmYtYnk6IEFiZHVyIFJlaG1hbiA8YWJk
dXJfcmVobWFuQG1lbnRvci5jb20+CiAKIFJlYmFzZWQgdG8gNGEyYzRiYWFjY2JjOGMyOWNlMDI5
NzcwNWRlOWE0ZTA5NmQ1N2NlNSB2ZXJzaW9uCiAKIFNpZ25lZC1vZmYtYnk6IE1hcmsgaGF0bGUg
PG1hcmsuaGF0bGVAYW1kLmNvbT4KLQotCiAtLS0KLSBNYWtlZmlsZS5pbmMgfCAgICAyICstCisg
YWdlbnQvTWFrZWZpbGUuaW5jIHwgMiArLQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQogCi1JbmRleDogYWdlbnQvTWFrZWZpbGUuaW5jCi09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
Ci0tLS0gYWdlbnQub3JpZy9NYWtlZmlsZS5pbmMKLSsrKyBhZ2VudC9NYWtlZmlsZS5pbmMKK2Rp
ZmYgLS1naXQgYS9hZ2VudC9NYWtlZmlsZS5pbmMgYi9hZ2VudC9NYWtlZmlsZS5pbmMKK2luZGV4
IDYzZjA2MmIyLi41ZGEyM2MwMiAxMDA2NDQKKy0tLSBhL2FnZW50L01ha2VmaWxlLmluYworKysr
IGIvYWdlbnQvTWFrZWZpbGUuaW5jCiBAQCAtMTExLDcgKzExMSw3IEBAIE5PX0xJTktfRiAgID89
IC1jCiAgIyBMaW5rZXIgZGVmaW5pdGlvbiBhbmQgZmxhZ3MKICAKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy90Y2YtYWdlbnQvdGNmLWFnZW50XzEuOS4wLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3RjZi1hZ2VudC90Y2YtYWdlbnRfMS4xMS4wLmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2YtYWdlbnQvdGNmLWFn
ZW50XzEuOS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNmLWFnZW50L3Rj
Zi1hZ2VudF8xLjExLjAuYmIKaW5kZXggMTMyYjNkN2RlZS4uNmU5YzdmYzBhZCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjZi1hZ2VudC90Y2YtYWdlbnRfMS45LjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjZi1hZ2VudC90Y2YtYWdlbnRfMS4xMS4wLmJiCkBA
IC02LDcgKzYsNyBAQCBCVUdUUkFDS0VSID0gImh0dHBzOi8vYnVncy5lY2xpcHNlLm9yZy9idWdz
LyIKIExJQ0VOU0UgPSAiRVBMLTEuMCB8IEJTRC0zLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL2VkbC12MTAuaHRtbDttZDU9NTIyYTM5MGE4M2RjMTg2NTEzZjA1MDA1NDNhZDM2
NzkiCiAKLVNSQ1JFViA9ICI5MDc2NDIzZjk1OWQ1M2FhZmE0MDAwZDZiYjhiZjJhMTQ4NTk3MWI5
IgorU1JDUkVWID0gIjMwNTFhNDgwNmFjNGIwNDFlYzdjNDlmZmM2ZDA3ZjAwMTRiODQ4MGMiCiAK
IFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIig/UDxwdmVyPihcZCsoXC5cZCspKykpIgog
U1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZWNsaXBzZS5vcmcvZWNsaXBzZS90Y2YvdGNmLmFnZW50
LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyO3RhZz0ke1BWfSBcCi0tIAoyLjQ3LjEK
Cg==

--===============2686624619913377672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1975 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-6a85f136dcd6b77c6a59f0d70dbbb97b51483221"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:6a85f136dcd6b77c6a59f0d70dbbb97b51483221"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 120 Local 107 Mirrors 0 Missed 13 Current 495 (89% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 595 of 615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 599 of 615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe tcf-agent-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe tcf-agent-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1308 of 1552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb:do_fetch)
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 607 of 615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe tcf-agent-1.11.0-r0: task do_fetch: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1532 of 1552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb:do_create_recipe_spdx)
NOTE: recipe tcf-agent-1.11.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe tcf-agent-1.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 1535 of 1552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb:do_unpack)
NOTE: Running task 1536 of 1552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcf-agent-1.11.0-r0: task do_unpack: Started
NOTE: recipe tcf-agent-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcf-agent-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcf-agent-1.11.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe tcf-agent-1.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 1537 of 1552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb:do_patch)
NOTE: recipe tcf-agent-1.11.0-r0: task do_patch: Started
NOTE: recipe tcf-agent-1.11.0-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1537 tasks of which 1532 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601101345.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601101345.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/tcf-agent/1.11.0/temp/log.do_patch.2638892
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: tcf-agent-1.11.0-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/tcf-agent/1.11.0/sources/tcf-agent-1.11.0/agent'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/tcf-agent/1.11.0/recipe-sysroot-native/etc/quiltrc push', 0, "stdout: Applying patch ldflags.patch
can't find file to patch at input line 25
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From 0d65ec825813961d3ca1553566ed2c6fed94ef2e Mon Sep 17 00:00:00 2001
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
|index 63f062b2..5da23c02 100644
|--- a/agent/Makefile.inc
|+++ b/agent/Makefile.inc
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
Patch ldflags.patch does not apply (enforce with -f)

stderr: ")
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/tcf-agent/1.11.0/temp/log.do_patch.2638892
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb:do_patch) failed with exit code '1'

--===============2686624619913377672==--

