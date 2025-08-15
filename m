Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1640CA0EE9
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:10 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.11329.1755263222710767112
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ABrkk9MI;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=DBq+Ql5c;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010198add76186-f7b5b3a1-48cc-4b4c-8b03-7a4b2a31c6c0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263230;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jYQpRhrbfEEfzBewM01x3n/A2RGcC3M7KLizDZ9dFOY=;
	b=ABrkk9MIQdvQAnwreqqawbha6N+W1dleuDMIYaE30UyMLkcwEkS23FW9VOOTFgOt
	pVNjyhRI4yuCM6PvMVx45wvKTxt9Su0pTGoKiWE96DZTeE0/D6W948ykI1q7eRA3q2s
	vlW+J+6ZGB7VpzeK3QJIhXw/fDgo7NH68Hg8YxEk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263230;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jYQpRhrbfEEfzBewM01x3n/A2RGcC3M7KLizDZ9dFOY=;
	b=DBq+Ql5cQ78gxqXBfRwxbyaBAHmBwmaWWNO/2WpzuHX8akXscQR321ddFDj5QhDi
	W3CUn8ats+CCZhPTK0JEDkTHFthWiom7kaNuTm2PlWpT4cflnhMg4id5CF1yV4iSg04
	kiw9mbLZwMAna1RNPcw3+o+E7KTowdSY0tZFsMSA=
Content-Type: multipart/mixed; boundary="===============6855672670594926768=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] acpica: upgrading to 20250807 SUCCEEDED
Message-ID: <01010198add76186-f7b5b3a1-48cc-4b4c-8b03-7a4b2a31c6c0-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221924

--===============6855672670594926768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *acpica* to *20250807* has Succeeded.

Next steps:
    - apply the patch: git am 0001-acpica-upgrade-20240827-20250807.patch
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
From d3a28e53e8c7725f7f58dd4691ea768d79595271 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 10:19:43 +0000
Subject: [PATCH] acpica: upgrade 20240827 -> 20250807

---
 ...{acpica_20240827.bb => acpica_20250807.bb} | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/acpica/{acpica_20240827.bb => acpica_20250807.bb} (66%)

diff --git a/meta/recipes-extended/acpica/acpica_20240827.bb b/meta/recipes-extended/acpica/acpica_20250807.bb
similarity index 66%
rename from meta/recipes-extended/acpica/acpica_20240827.bb
rename to meta/recipes-extended/acpica/acpica_20250807.bb
index f9f9f9f687..cba1a51fdd 100644
--- a/meta/recipes-extended/acpica/acpica_20240827.bb
+++ b/meta/recipes-extended/acpica/acpica_20250807.bb
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
+# - * Some or all of this work - Copyright (c) 1999 - 2024, Intel Corp.
+# + * Some or all of this work - Copyright (c) 1999 - 2025, Intel Corp.
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
-LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=05eb845b15a27440410f456adc2ed082"
+LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=8566a414d226d05b68e41f30698f9624"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "git://github.com/acpica/acpica;protocol=https;branch=master"
-SRCREV = "e80cbd7b52de20aa8c75bfba9845e9cb61f2e681"
+SRCREV = "aa98db3bd149fc1f8d2a3017cb05b6b1982c3296"
 
 inherit update-alternatives
 
-- 
2.47.1


--===============6855672670594926768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/acpica/acpica-dbg: PKGSIZE changed from 10748024 to 10772880 (+0%)
packages/core2-64-poky-linux/acpica/acpica-dbg: PV changed from "20240827" to "20250807"
packages/core2-64-poky-linux/acpica/acpica-dbg: PKGV changed from 20240827 [default] to 20250807 [default]
packages/core2-64-poky-linux/acpica/acpica-dev: PV changed from "20240827" to "20250807"
packages/core2-64-poky-linux/acpica/acpica-dev: PKGV changed from 20240827 [default] to 20250807 [default]
packages/core2-64-poky-linux/acpica/acpica-doc: PV changed from "20240827" to "20250807"
packages/core2-64-poky-linux/acpica/acpica-doc: PKGV changed from 20240827 [default] to 20250807 [default]
packages/core2-64-poky-linux/acpica/acpica-locale: PV changed from "20240827" to "20250807"
packages/core2-64-poky-linux/acpica/acpica-locale: PKGV changed from 20240827 [default] to 20250807 [default]
packages/core2-64-poky-linux/acpica/acpica-src: PKGSIZE changed from 10463157 to 10553641 (+1%)
packages/core2-64-poky-linux/acpica/acpica-src: PV changed from "20240827" to "20250807"
packages/core2-64-poky-linux/acpica/acpica-src: PKGV changed from 20240827 [default] to 20250807 [default]
packages/core2-64-poky-linux/acpica/acpica-staticdev: PV changed from "20240827" to "20250807"
packages/core2-64-poky-linux/acpica/acpica-staticdev: PKGV changed from 20240827 [default] to 20250807 [default]
packages/core2-64-poky-linux/acpica/acpica: PKGSIZE changed from 2656864 to 2673824 (+1%)
packages/core2-64-poky-linux/acpica/acpica: PV changed from "20240827" to "20250807"
packages/core2-64-poky-linux/acpica/acpica: PKGV changed from 20240827 [default] to 20250807 [default]
packages/core2-64-poky-linux/acpica: PV changed from "20240827" to "20250807"
packages/core2-64-poky-linux/acpica: PKGV changed from 20240827 [default] to 20250807 [default]

--===============6855672670594926768==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-acpica-upgrade-20240827-20250807.patch"

RnJvbSBkM2EyOGU1M2U4Yzc3MjVmN2Y1OGRkNDY5MWVhNzY4ZDc5NTk1MjcxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMTA6MTk6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
Y3BpY2E6IHVwZ3JhZGUgMjAyNDA4MjcgLT4gMjAyNTA4MDcKCi0tLQogLi4ue2FjcGljYV8yMDI0
MDgyNy5iYiA9PiBhY3BpY2FfMjAyNTA4MDcuYmJ9IHwgMjYgKysrKysrKysrKysrKysrKystLQog
MSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2FjcGljYS97YWNwaWNhXzIwMjQwODI3LmJiID0+IGFjcGlj
YV8yMDI1MDgwNy5iYn0gKDY2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
YWNwaWNhL2FjcGljYV8yMDI0MDgyNy5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9hY3BpY2Ev
YWNwaWNhXzIwMjUwODA3LmJiCnNpbWlsYXJpdHkgaW5kZXggNjYlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9hY3BpY2EvYWNwaWNhXzIwMjQwODI3LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvYWNwaWNhL2FjcGljYV8yMDI1MDgwNy5iYgppbmRleCBmOWY5Zjlm
Njg3Li5jYmExYTUxZmRkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYWNwaWNh
L2FjcGljYV8yMDI0MDgyNy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYWNwaWNhL2Fj
cGljYV8yMDI1MDgwNy5iYgpAQCAtMSwzICsxLDI1IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVT
X0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisj
IFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUg
bmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBu
ZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdl
IHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6
IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0g
c291cmNlL2NvbXBpbGVyL2FzbGNvbXBpbGUuYworIyArKysgc291cmNlL2NvbXBpbGVyL2FzbGNv
bXBpbGUuYworIyBAQCAtMiw3ICsyLDcgQEAKKyMgICAqCisjICAgKiAxLiBDb3B5cmlnaHQgTm90
aWNlCisjICAgKgorIyAtICogU29tZSBvciBhbGwgb2YgdGhpcyB3b3JrIC0gQ29weXJpZ2h0IChj
KSAxOTk5IC0gMjAyNCwgSW50ZWwgQ29ycC4KKyMgKyAqIFNvbWUgb3IgYWxsIG9mIHRoaXMgd29y
ayAtIENvcHlyaWdodCAoYykgMTk5OSAtIDIwMjUsIEludGVsIENvcnAuCisjICAgKiBBbGwgcmln
aHRzIHJlc2VydmVkLgorIyAgICoKKyMgICAqIDIuIExpY2Vuc2UKKyMgCisjCisKIFNVTU1BUlkg
PSAiQUNQSUNBIHRvb2xzIGZvciB0aGUgZGV2ZWxvcG1lbnQgYW5kIGRlYnVnIG9mIEFDUEkgdGFi
bGVzIgogREVTQ1JJUFRJT04gPSAiVGhlIEFDUEkgQ29tcG9uZW50IEFyY2hpdGVjdHVyZSAoQUNQ
SUNBKSBwcm9qZWN0IHByb3ZpZGVzIGFuIFwKIE9TLWluZGVwZW5kZW50IHJlZmVyZW5jZSBpbXBs
ZW1lbnRhdGlvbiBvZiB0aGUgQWR2YW5jZWQgQ29uZmlndXJhdGlvbiBhbmQgXApAQCAtMTAsMTQg
KzMyLDE0IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vd3d3LmludGVsLmNvbS9jb250ZW50L3d3dy91
cy9lbi9kZXZlbG9wZXIvdG9waWMtdGVjaG5vbG9neS9vCiBTRUNUSU9OID0gImNvbnNvbGUvdG9v
bHMiCiAKIExJQ0VOU0UgPSAiSW50ZWwgfCBCU0QtMy1DbGF1c2UgfCBHUEwtMi4wLW9ubHkiCi1M
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9zb3VyY2UvY29tcGlsZXIvYXNsY29tcGlsZS5jO2Jl
Z2lubGluZT03O2VuZGxpbmU9MTUwO21kNT0wNWViODQ1YjE1YTI3NDQwNDEwZjQ1NmFkYzJlZDA4
MiIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL3NvdXJjZS9jb21waWxlci9hc2xjb21waWxl
LmM7YmVnaW5saW5lPTc7ZW5kbGluZT0xNTA7bWQ1PTg1NjZhNDE0ZDIyNmQwNWI2OGU0MWYzMDY5
OGY5NjI0IgogCiBDT01QQVRJQkxFX0hPU1QgPSAiKGkuODZ8eDg2XzY0fGFybXxhYXJjaDY0KS4q
LWxpbnV4IgogCiBERVBFTkRTID0gIm00LW5hdGl2ZSBmbGV4LW5hdGl2ZSBiaXNvbi1uYXRpdmUi
CiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9hY3BpY2EvYWNwaWNhO3Byb3RvY29sPWh0
dHBzO2JyYW5jaD1tYXN0ZXIiCi1TUkNSRVYgPSAiZTgwY2JkN2I1MmRlMjBhYThjNzViZmJhOTg0
NWU5Y2I2MWYyZTY4MSIKK1NSQ1JFViA9ICJhYTk4ZGIzYmQxNDlmYzFmOGQyYTMwMTdjYjA1YjZi
MTk4MmMzMjk2IgogCiBpbmhlcml0IHVwZGF0ZS1hbHRlcm5hdGl2ZXMKIAotLSAKMi40Ny4xCgo=

--===============6855672670594926768==--

