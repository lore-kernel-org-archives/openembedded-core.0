Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139D3CD5BAE
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:36 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34813.1778851223005675442
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=be/azCXv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=lXsnflSg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019e2bcbc588-f1cf1a7e-f12e-42d9-b9e5-11552e966c58-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851235;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gHRrXdaMXm46wvYxod2jRqiLuvA4pr4Or8bzJ4Z5ktA=;
	b=be/azCXvvsYGScbmq0M51Sj/uVJfV/Zvlt1+rdYg2gcmKstsFbPtiLTPHi+GJf/W
	NsvcQB0aOimS+kFf1Em10yEtuPf4F3HiZe45HJy+yIZ+1amNTu3vS53ZXoSsBsQdijz
	ivwK2b+QtE/tLISzhwDZ/5u18Tz5qhCwd2P/cvXY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851235;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gHRrXdaMXm46wvYxod2jRqiLuvA4pr4Or8bzJ4Z5ktA=;
	b=lXsnflSgLXK2tsDJZSgDhaFP2dblCbtYX9ruICFzywit33/B2Uh4e3UA2ZxqH3lH
	GkcJ8WpfEh3zvRZKebaQt2vB49OgAA2NXIjFHdZj5II/Qr7J3U46Z+RYxSxo8BZDRSr
	y/DXxft6VzhJO8GF20wZfKJDrHd3b+lXJOT5/GEM=
Content-Type: multipart/mixed; boundary="===============1426957519462275348=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] tcf-agent: upgrading to 1.11.0 FAILED
Message-ID: <0101019e2bcbc588-f1cf1a7e-f12e-42d9-b9e5-11552e966c58-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237130

--===============1426957519462275348==
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
From c8c39a48fca1d754a1dc7ef51a8a609bff767f3b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 09:36:00 +0000
Subject: [PATCH] tcf-agent: upgrade 1.9.0 -> 1.11.0

---
 .../tcf-agent/tcf-agent/ldflags.patch         | 22 +++++++++----------
 ...tcf-agent_1.9.0.bb => tcf-agent_1.11.0.bb} |  2 +-
 2 files changed, 11 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/tcf-agent/{tcf-agent_1.9.0.bb => tcf-agent_1.11.0.bb} (98%)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch b/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
index d701e8dec0..73c634159d 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
@@ -1,29 +1,27 @@
+From 825ac1bcadcb1775f41c0db6a95647c9001f7e0b Mon Sep 17 00:00:00 2001
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


--===============1426957519462275348==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tcf-agent-upgrade-1.9.0-1.11.0.patch"

RnJvbSBjOGMzOWE0OGZjYTFkNzU0YTFkYzdlZjUxYThhNjA5YmZmNzY3ZjNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMDk6MzY6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
Y2YtYWdlbnQ6IHVwZ3JhZGUgMS45LjAgLT4gMS4xMS4wCgotLS0KIC4uLi90Y2YtYWdlbnQvdGNm
LWFnZW50L2xkZmxhZ3MucGF0Y2ggICAgICAgICB8IDIyICsrKysrKysrKy0tLS0tLS0tLS0KIC4u
LnRjZi1hZ2VudF8xLjkuMC5iYiA9PiB0Y2YtYWdlbnRfMS4xMS4wLmJifSB8ICAyICstCiAyIGZp
bGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy90Y2YtYWdlbnQve3RjZi1hZ2VudF8xLjkuMC5iYiA9PiB0Y2Yt
YWdlbnRfMS4xMS4wLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy90Y2YtYWdlbnQvdGNmLWFnZW50L2xkZmxhZ3MucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvdGNmLWFnZW50L3RjZi1hZ2VudC9sZGZsYWdzLnBhdGNoCmluZGV4IGQ3MDFlOGRlYzAuLjcz
YzYzNDE1OWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2YtYWdlbnQvdGNm
LWFnZW50L2xkZmxhZ3MucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjZi1hZ2Vu
dC90Y2YtYWdlbnQvbGRmbGFncy5wYXRjaApAQCAtMSwyOSArMSwyNyBAQAorRnJvbSA4MjVhYzFi
Y2FkY2IxNzc1ZjQxYzBkYjZhOTU2NDdjOTAwMWY3ZTBiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbTogQWJkdXIgUmVobWFuIDxhYmR1cl9yZWhtYW5AbWVudG9yLmNvbT4KK0RhdGU6IFdl
ZCwgMjYgQXVnIDIwMTUgMTk6MTg6MTEgKzA1MDAKK1N1YmplY3Q6IFtQQVRDSF0gdGNmLWFnZW50
OiBvYmV5IExERkxBR1MKKwogV2UgbmVlZCBMREZMQUdTIHRvIGJlIHJlc3BlY3RlZCBvdGhlcndp
c2UgdGhlcmUgYXJlIFFBIHdhcm5pbmdzIGFzIHRoZSByaWdodAogZmxhZ3MgZG9uJ3QgZ2V0IHVz
ZWQuCiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbb2UtY29yZSBzcGVjaWZpY10K
IFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogCi1Gcm9t
IGQ5MmFmMDQ4M2MyMDM2NWZkMGFmNzQwZDBiYWVmODg3MGI0YWEzNzQgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCi1Gcm9tOiBBYmR1ciBSZWhtYW4gPGFiZHVyX3JlaG1hbkBtZW50b3IuY29tPgot
RGF0ZTogV2VkLCAyNiBBdWcgMjAxNSAxOToxODoxMSArMDUwMAotU3ViamVjdDogW1BBVENIXSB0
Y2YtYWdlbnQ6IG9iZXkgTERGTEFHUwotCiBTaWduZWQtb2ZmLWJ5OiBBYmR1ciBSZWhtYW4gPGFi
ZHVyX3JlaG1hbkBtZW50b3IuY29tPgogCiBSZWJhc2VkIHRvIDRhMmM0YmFhY2NiYzhjMjljZTAy
OTc3MDVkZTlhNGUwOTZkNTdjZTUgdmVyc2lvbgogCiBTaWduZWQtb2ZmLWJ5OiBNYXJrIGhhdGxl
IDxtYXJrLmhhdGxlQGFtZC5jb20+Ci0KLQogLS0tCi0gTWFrZWZpbGUuaW5jIHwgICAgMiArLQor
IGFnZW50L01ha2VmaWxlLmluYyB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKIAotSW5kZXg6IGFnZW50L01ha2VmaWxlLmluYwotPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQotLS0tIGFnZW50Lm9yaWcvTWFrZWZpbGUuaW5jCi0rKysgYWdlbnQvTWFrZWZpbGUuaW5jCitk
aWZmIC0tZ2l0IGEvYWdlbnQvTWFrZWZpbGUuaW5jIGIvYWdlbnQvTWFrZWZpbGUuaW5jCitpbmRl
eCA2M2YwNjJiMi4uNWRhMjNjMDIgMTAwNjQ0CistLS0gYS9hZ2VudC9NYWtlZmlsZS5pbmMKKysr
KyBiL2FnZW50L01ha2VmaWxlLmluYwogQEAgLTExMSw3ICsxMTEsNyBAQCBOT19MSU5LX0YgICA/
PSAtYwogICMgTGlua2VyIGRlZmluaXRpb24gYW5kIGZsYWdzCiAgCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvdGNmLWFnZW50L3RjZi1hZ2VudF8xLjkuMC5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy90Y2YtYWdlbnQvdGNmLWFnZW50XzEuMTEuMC5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNmLWFnZW50L3RjZi1h
Z2VudF8xLjkuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjZi1hZ2VudC90
Y2YtYWdlbnRfMS4xMS4wLmJiCmluZGV4IDEzMmIzZDdkZWUuLjZlOWM3ZmMwYWQgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2YtYWdlbnQvdGNmLWFnZW50XzEuOS4wLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2YtYWdlbnQvdGNmLWFnZW50XzEuMTEuMC5iYgpA
QCAtNiw3ICs2LDcgQEAgQlVHVFJBQ0tFUiA9ICJodHRwczovL2J1Z3MuZWNsaXBzZS5vcmcvYnVn
cy8iCiBMSUNFTlNFID0gIkVQTC0xLjAgfCBCU0QtMy1DbGF1c2UiCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9lZGwtdjEwLmh0bWw7bWQ1PTUyMmEzOTBhODNkYzE4NjUxM2YwNTAwNTQzYWQz
Njc5IgogCi1TUkNSRVYgPSAiOTA3NjQyM2Y5NTlkNTNhYWZhNDAwMGQ2YmI4YmYyYTE0ODU5NzFi
OSIKK1NSQ1JFViA9ICIzMDUxYTQ4MDZhYzRiMDQxZWM3YzQ5ZmZjNmQwN2YwMDE0Yjg0ODBjIgog
CiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICIoP1A8cHZlcj4oXGQrKFwuXGQrKSspKSIK
IFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmVjbGlwc2Uub3JnL2VjbGlwc2UvdGNmL3RjZi5hZ2Vu
dC5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3Rlcjt0YWc9JHtQVn0gXAotLSAKMi40Ny4x
Cgo=

--===============1426957519462275348==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1974 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.0.99+snapshot-ec7940ac8f476848288297550fc3e53ec9dc5459"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:ec7940ac8f476848288297550fc3e53ec9dc5459"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 130 Local 116 Mirrors 0 Missed 14 Current 485 (89% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 557 of 615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_spdx_setscene)
NOTE: Running task 1076 of 1552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb:do_recipe_qa)
NOTE: recipe tcf-agent-1.11.0-r0: task do_recipe_qa: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 602 of 615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 612 of 615 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_create_spdx_setscene)
NOTE: recipe tcf-agent-1.11.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1244 of 1552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb:do_fetch)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe tcf-agent-1.11.0-r0: task do_fetch: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1528 of 1552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb:do_create_recipe_spdx)
NOTE: recipe tcf-agent-1.11.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe tcf-agent-1.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 1535 of 1552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb:do_unpack)
NOTE: Running task 1536 of 1552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcf-agent-1.11.0-r0: task do_unpack: Started
NOTE: recipe tcf-agent-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcf-agent-1.11.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe tcf-agent-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcf-agent-1.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 1537 of 1552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb:do_patch)
NOTE: recipe tcf-agent-1.11.0-r0: task do_patch: Started
NOTE: recipe tcf-agent-1.11.0-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1537 tasks of which 1531 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260515093547.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260515093547.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/tcf-agent/1.11.0/temp/log.do_patch.2289776
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: tcf-agent-1.11.0-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/tcf-agent/1.11.0/sources/tcf-agent-1.11.0/agent'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/tcf-agent/1.11.0/recipe-sysroot-native/etc/quiltrc push', 0, "stdout: Applying patch ldflags.patch
can't find file to patch at input line 25
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From 825ac1bcadcb1775f41c0db6a95647c9001f7e0b Mon Sep 17 00:00:00 2001
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
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/tcf-agent/1.11.0/temp/log.do_patch.2289776
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/tcf-agent/tcf-agent_1.11.0.bb:do_patch) failed with exit code '1'

--===============1426957519462275348==--

