Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 316D4F428E2
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:52 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19812.1776261873807100432
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=D5O76jTB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jyRlynNb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019d91756d5a-08e552f2-d77e-4ead-b71c-1ba956ff963b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261885;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DKrFqqC9v9Iz+6PhKB0RlnPRkRd24Vv31QtHW56Qn3I=;
	b=D5O76jTBLRecRYrrj60a25u3gVzyoCAA5KsEdvRTy8Uvrp48IQpeIqzPnVsMpNyD
	7xvX8jYyfJ8EMGglem5KHZ1dsGF1soXT346sylPMIEOcrGctpF9AS7eKorBCTiCh/HL
	6WBqvZ3wD09iMC/VPIX/SA3nuQlKC5hNZNSCg4nY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261885;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DKrFqqC9v9Iz+6PhKB0RlnPRkRd24Vv31QtHW56Qn3I=;
	b=jyRlynNbKpDzSAzCwewTMMbakBqeJIZe7UlVhU2Wm0tTICR9z0rLRWsxBBDrYSMy
	9V4ttgsMnCKmeI1Qg8u1CQDCG6nb5QvcbePxvD0qVtmVKwZOmJxtk/ryrvhj9g0FcU4
	wQAJzZn0wY71NdGPosDjWPNg+gkGsAmOKScAa7Mo=
Content-Type: multipart/mixed; boundary="===============3849455076468926632=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] acpica: upgrading to 20260408 SUCCEEDED
Message-ID: <0101019d91756d5a-08e552f2-d77e-4ead-b71c-1ba956ff963b-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235259

--===============3849455076468926632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *acpica* to *20260408* has Succeeded.

Next steps:
    - apply the patch: git am 0001-acpica-upgrade-20251212-20260408.patch
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
From 65bb60f4e374ec7684b3f8d6d6d9d77f4c05eee4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 09:40:10 +0000
Subject: [PATCH] acpica: upgrade 20251212 -> 20260408

---
 ...{acpica_20251212.bb => acpica_20260408.bb} | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/acpica/{acpica_20251212.bb => acpica_20260408.bb} (66%)

diff --git a/meta/recipes-extended/acpica/acpica_20251212.bb b/meta/recipes-extended/acpica/acpica_20260408.bb
similarity index 66%
rename from meta/recipes-extended/acpica/acpica_20251212.bb
rename to meta/recipes-extended/acpica/acpica_20260408.bb
index 812a62547b..ccb414f7d9 100644
--- a/meta/recipes-extended/acpica/acpica_20251212.bb
+++ b/meta/recipes-extended/acpica/acpica_20260408.bb
@@ -1,3 +1,25 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- source/compiler/aslcompile.c
+# +++ source/compiler/aslcompile.c
+# @@ -2,7 +2,7 @@
+#   *
+#   * 1. Copyright Notice
+#   *
+# - * Some or all of this work - Copyright (c) 1999 - 2025, Intel Corp.
+# + * Some or all of this work - Copyright (c) 1999 - 2026, Intel Corp.
+#   * All rights reserved.
+#   *
+#   * 2. License
+# 
+#
+
 SUMMARY = "ACPICA tools for the development and debug of ACPI tables"
 DESCRIPTION = "The ACPI Component Architecture (ACPICA) project provides an \
 OS-independent reference implementation of the Advanced Configuration and \
@@ -10,14 +32,14 @@ HOMEPAGE = "https://www.intel.com/content/www/us/en/developer/topic-technology/o
 SECTION = "console/tools"
 
 LICENSE = "Intel | BSD-3-Clause | GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=8566a414d226d05b68e41f30698f9624"
+LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=4877caee45a613e9706946c3205a6fb9"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "git://github.com/acpica/acpica;protocol=https;branch=master;tag=${PV}"
-SRCREV = "446be438238e9d339eed5182b807ac5f82df56c9"
+SRCREV = "232ff3f8ae1a4da11c709f61d9154482cfe8e6df"
 
 inherit update-alternatives
 
-- 
2.47.1


--===============3849455076468926632==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-acpica-upgrade-20251212-20260408.patch"

RnJvbSA2NWJiNjBmNGUzNzRlYzc2ODRiM2Y4ZDZkNmQ5ZDc3ZjRjMDVlZWU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDk6NDA6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
Y3BpY2E6IHVwZ3JhZGUgMjAyNTEyMTIgLT4gMjAyNjA0MDgKCi0tLQogLi4ue2FjcGljYV8yMDI1
MTIxMi5iYiA9PiBhY3BpY2FfMjAyNjA0MDguYmJ9IHwgMjYgKysrKysrKysrKysrKysrKystLQog
MSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2FjcGljYS97YWNwaWNhXzIwMjUxMjEyLmJiID0+IGFjcGlj
YV8yMDI2MDQwOC5iYn0gKDY2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
YWNwaWNhL2FjcGljYV8yMDI1MTIxMi5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9hY3BpY2Ev
YWNwaWNhXzIwMjYwNDA4LmJiCnNpbWlsYXJpdHkgaW5kZXggNjYlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9hY3BpY2EvYWNwaWNhXzIwMjUxMjEyLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvYWNwaWNhL2FjcGljYV8yMDI2MDQwOC5iYgppbmRleCA4MTJhNjI1
NDdiLi5jY2I0MTRmN2Q5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYWNwaWNh
L2FjcGljYV8yMDI1MTIxMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYWNwaWNhL2Fj
cGljYV8yMDI2MDQwOC5iYgpAQCAtMSwzICsxLDI1IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVT
X0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisj
IFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUg
bmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBu
ZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdl
IHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6
IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0g
c291cmNlL2NvbXBpbGVyL2FzbGNvbXBpbGUuYworIyArKysgc291cmNlL2NvbXBpbGVyL2FzbGNv
bXBpbGUuYworIyBAQCAtMiw3ICsyLDcgQEAKKyMgICAqCisjICAgKiAxLiBDb3B5cmlnaHQgTm90
aWNlCisjICAgKgorIyAtICogU29tZSBvciBhbGwgb2YgdGhpcyB3b3JrIC0gQ29weXJpZ2h0IChj
KSAxOTk5IC0gMjAyNSwgSW50ZWwgQ29ycC4KKyMgKyAqIFNvbWUgb3IgYWxsIG9mIHRoaXMgd29y
ayAtIENvcHlyaWdodCAoYykgMTk5OSAtIDIwMjYsIEludGVsIENvcnAuCisjICAgKiBBbGwgcmln
aHRzIHJlc2VydmVkLgorIyAgICoKKyMgICAqIDIuIExpY2Vuc2UKKyMgCisjCisKIFNVTU1BUlkg
PSAiQUNQSUNBIHRvb2xzIGZvciB0aGUgZGV2ZWxvcG1lbnQgYW5kIGRlYnVnIG9mIEFDUEkgdGFi
bGVzIgogREVTQ1JJUFRJT04gPSAiVGhlIEFDUEkgQ29tcG9uZW50IEFyY2hpdGVjdHVyZSAoQUNQ
SUNBKSBwcm9qZWN0IHByb3ZpZGVzIGFuIFwKIE9TLWluZGVwZW5kZW50IHJlZmVyZW5jZSBpbXBs
ZW1lbnRhdGlvbiBvZiB0aGUgQWR2YW5jZWQgQ29uZmlndXJhdGlvbiBhbmQgXApAQCAtMTAsMTQg
KzMyLDE0IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vd3d3LmludGVsLmNvbS9jb250ZW50L3d3dy91
cy9lbi9kZXZlbG9wZXIvdG9waWMtdGVjaG5vbG9neS9vCiBTRUNUSU9OID0gImNvbnNvbGUvdG9v
bHMiCiAKIExJQ0VOU0UgPSAiSW50ZWwgfCBCU0QtMy1DbGF1c2UgfCBHUEwtMi4wLW9ubHkiCi1M
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9zb3VyY2UvY29tcGlsZXIvYXNsY29tcGlsZS5jO2Jl
Z2lubGluZT03O2VuZGxpbmU9MTUwO21kNT04NTY2YTQxNGQyMjZkMDViNjhlNDFmMzA2OThmOTYy
NCIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL3NvdXJjZS9jb21waWxlci9hc2xjb21waWxl
LmM7YmVnaW5saW5lPTc7ZW5kbGluZT0xNTA7bWQ1PTQ4NzdjYWVlNDVhNjEzZTk3MDY5NDZjMzIw
NWE2ZmI5IgogCiBDT01QQVRJQkxFX0hPU1QgPSAiKGkuODZ8eDg2XzY0fGFybXxhYXJjaDY0KS4q
LWxpbnV4IgogCiBERVBFTkRTID0gIm00LW5hdGl2ZSBmbGV4LW5hdGl2ZSBiaXNvbi1uYXRpdmUi
CiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9hY3BpY2EvYWNwaWNhO3Byb3RvY29sPWh0
dHBzO2JyYW5jaD1tYXN0ZXI7dGFnPSR7UFZ9IgotU1JDUkVWID0gIjQ0NmJlNDM4MjM4ZTlkMzM5
ZWVkNTE4MmI4MDdhYzVmODJkZjU2YzkiCitTUkNSRVYgPSAiMjMyZmYzZjhhZTFhNGRhMTFjNzA5
ZjYxZDkxNTQ0ODJjZmU4ZTZkZiIKIAogaW5oZXJpdCB1cGRhdGUtYWx0ZXJuYXRpdmVzCiAKLS0g
CjIuNDcuMQoK

--===============3849455076468926632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/acpica/acpica-dbg: PKGV changed from 20251212 [default] to 20260408 [default]
packages/x86-64-v3-poky-linux/acpica/acpica-dbg: PKGSIZE changed from 10807528 to 10828776 (+0%)
packages/x86-64-v3-poky-linux/acpica/acpica-dbg: PV changed from "20251212" to "20260408"
packages/x86-64-v3-poky-linux/acpica/acpica-dev: PKGV changed from 20251212 [default] to 20260408 [default]
packages/x86-64-v3-poky-linux/acpica/acpica-dev: PV changed from "20251212" to "20260408"
packages/x86-64-v3-poky-linux/acpica/acpica-doc: PKGV changed from 20251212 [default] to 20260408 [default]
packages/x86-64-v3-poky-linux/acpica/acpica-doc: PV changed from "20251212" to "20260408"
packages/x86-64-v3-poky-linux/acpica/acpica-locale: PKGV changed from 20251212 [default] to 20260408 [default]
packages/x86-64-v3-poky-linux/acpica/acpica-locale: PV changed from "20251212" to "20260408"
packages/x86-64-v3-poky-linux/acpica/acpica-src: PKGV changed from 20251212 [default] to 20260408 [default]
packages/x86-64-v3-poky-linux/acpica/acpica-src: PKGSIZE changed from 10585354 to 10631366 (+0%)
packages/x86-64-v3-poky-linux/acpica/acpica-src: PV changed from "20251212" to "20260408"
packages/x86-64-v3-poky-linux/acpica/acpica-src: FILELIST: directory renamed /usr/src/debug/acpica/20251212/source/components/tables -> /usr/src/debug/acpica/20260408/source/components/tables, directory renamed /usr/src/debug/acpica/20251212/source/os_specific/service_layers -> /usr/src/debug/acpica/20260408/source/os_specific/service_layers, directory renamed /usr/src/debug/acpica/20251212/generate/unix/iasl/obj -> /usr/src/debug/acpica/20260408/generate/unix/iasl/obj, directory renamed /usr/src/debug/acpica/20251212/source/tools/acpidump -> /usr/src/debug/acpica/20260408/source/tools/acpidump, directory renamed /usr/src/debug/acpica/20251212/source/include -> /usr/src/debug/acpica/20260408/source/include, directory renamed /usr/src/debug/acpica/20251212/source/compiler -> /usr/src/debug/acpica/20260408/source/compiler, directory renamed /usr/src/debug/acpica/20251212/source/components/utilities -> /usr/src/debug/acpica/20260408/source/components/utilities, directory renamed /usr/sr
 c/debug/acpica/20251212/source/components/resources -> /usr/src/debug/acpica/20260408/source/components/resources, directory renamed /usr/src/debug/acpica/20251212/source/components/namespace -> /usr/src/debug/acpica/20260408/source/components/namespace, directory renamed /usr/src/debug/acpica/20251212/source/tools/acpisrc -> /usr/src/debug/acpica/20260408/source/tools/acpisrc, directory renamed /usr/src/debug/acpica/20251212/source/components/parser -> /usr/src/debug/acpica/20260408/source/components/parser, directory renamed /usr/src/debug/acpica/20251212/source/tools/acpibin -> /usr/src/debug/acpica/20260408/source/tools/acpibin, directory renamed /usr/src/debug/acpica/20251212/source/tools/examples -> /usr/src/debug/acpica/20260408/source/tools/examples, directory renamed /usr/src/debug/acpica/20251212/source/components/dispatcher -> /usr/src/debug/acpica/20260408/source/components/dispatcher, directory renamed /usr/src/debug/acpica/20251212/source/components/events -> /usr/src/
 debug/acpica/20260408/source/components/events, directory renamed /usr/src/debug/acpica/20251212/source/tools/acpiexec -> /usr/src/debug/acpica/20260408/source/tools/acpiexec, directory renamed /usr/src/debug/acpica/20251212/source/common -> /usr/src/debug/acpica/20260408/source/common, directory renamed /usr/src/debug/acpica/20251212/source/components/debugger -> /usr/src/debug/acpica/20260408/source/components/debugger, directory renamed /usr/src/debug/acpica/20251212/source/components/executer -> /usr/src/debug/acpica/20260408/source/components/executer, directory renamed /usr/src/debug/acpica/20251212/source/tools/acpihelp -> /usr/src/debug/acpica/20260408/source/tools/acpihelp, directory renamed /usr/src/debug/acpica/20251212/source/tools/acpixtract -> /usr/src/debug/acpica/20260408/source/tools/acpixtract, directory renamed /usr/src/debug/acpica/20251212/source/components/disassembler -> /usr/src/debug/acpica/20260408/source/components/disassembler, directory renamed /usr/src/
 debug/acpica/20251212/source/components/hardware -> /usr/src/debug/acpica/20260408/source/components/hardware
packages/x86-64-v3-poky-linux/acpica/acpica-staticdev: PKGV changed from 20251212 [default] to 20260408 [default]
packages/x86-64-v3-poky-linux/acpica/acpica-staticdev: PV changed from "20251212" to "20260408"
packages/x86-64-v3-poky-linux/acpica/acpica: PKGV changed from 20251212 [default] to 20260408 [default]
packages/x86-64-v3-poky-linux/acpica/acpica: PKGSIZE changed from 2688408 to 2711512 (+1%)
packages/x86-64-v3-poky-linux/acpica/acpica: PV changed from "20251212" to "20260408"
packages/x86-64-v3-poky-linux/acpica: SRC_URI changed from "git://github.com/acpica/acpica;protocol=https;branch=master;tag=20251212" to "git://github.com/acpica/acpica;protocol=https;branch=master;tag=20260408"
packages/x86-64-v3-poky-linux/acpica: PV changed from "20251212" to "20260408"
packages/x86-64-v3-poky-linux/acpica: PKGV changed from 20251212 [default] to 20260408 [default]

--===============3849455076468926632==--

