Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC28CD13A9
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:31 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.2009.1711994602577747313
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XfNlqbdJ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=mKy/1lj6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018e9ad48206-15840fb1-f73a-4f66-bfb1-2113f4a2c97d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2H5vrG0jAuyZSgIy0r0wVi3OmtXUv/5+eqTw7V2WGWk=;
	b=XfNlqbdJQ2px8Oe2SL5c4INQUt9kkTnGrMgA8FgB2luEfuEuzlZ5ndm2Xx3ndn+3
	IabUqma4gvaZG9IAqO6anSCCg98FdVd6NCLUX2smaBi+7vA1fQjACSas9xanbXRCFrs
	37HYocMqSoChMp5JgkkDJrrt2+MZ2xQcFaNmrEFY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2H5vrG0jAuyZSgIy0r0wVi3OmtXUv/5+eqTw7V2WGWk=;
	b=mKy/1lj65BP3DRC7dh6yXHBu3owW0tfmV3FqpGYVoU5taUoRclGI13o6J+Mw787w
	qwb1PNwPWEqdJAgwqWrdqmeVd4UKDnELTHm6m2Amk+Mp5c/QeN6eY1TbPhAsVWPxt26
	/57hozAZyEIAmRmlZjD9XQrfJpnFcD1uArNVlkBE=
Content-Type: multipart/mixed; boundary="===============5222599177678035601=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vala: upgrading to 0.56.16 SUCCEEDED
Message-ID: <0101018e9ad48206-15840fb1-f73a-4f66-bfb1-2113f4a2c97d-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197737

--===============5222599177678035601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vala* to *0.56.16* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vala-upgrade-0.56.15-0.56.16.patch
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
From a404b08724272c0eb599c8fca2933105656456a5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 10:50:03 +0000
Subject: [PATCH] vala: upgrade 0.56.15 -> 0.56.16

---
 ...tk4-Preserve-compatibility-with-4.14.patch | 39 -------------------
 .../vala/{vala_0.56.15.bb => vala_0.56.16.bb} |  7 +---
 2 files changed, 2 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-devtools/vala/vala/0001-gtk4-Preserve-compatibility-with-4.14.patch
 rename meta/recipes-devtools/vala/{vala_0.56.15.bb => vala_0.56.16.bb} (92%)

diff --git a/meta/recipes-devtools/vala/vala/0001-gtk4-Preserve-compatibility-with-4.14.patch b/meta/recipes-devtools/vala/vala/0001-gtk4-Preserve-compatibility-with-4.14.patch
deleted file mode 100644
index 161474086e..0000000000
--- a/meta/recipes-devtools/vala/vala/0001-gtk4-Preserve-compatibility-with-4.14.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 17349020fb95454d06f827fd555b05248f10a370 Mon Sep 17 00:00:00 2001
-From: Rico Tzschichholz <ricotz@ubuntu.com>
-Date: Thu, 7 Mar 2024 17:56:05 +0100
-Subject: [PATCH] gtk4: Preserve compatibility with < 4.14
-
-Don't prefer new accessor methods for Calendar.day/month/year
-
-Fixes https://gitlab.gnome.org/GNOME/vala/issues/1531
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/vala/-/commit/e0c4ea8c4a0bbf859b5341a7465b395892789d9e]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- vapi/gtk4.vapi                 | 3 +++
- vapi/metadata/Gtk-4.0.metadata | 5 +++++
- 2 files changed, 8 insertions(+)
-
-diff --git a/vapi/gtk4.vapi b/vapi/gtk4.vapi
-index 49f8b2078..51ecea27d 100644
---- a/vapi/gtk4.vapi
-+++ b/vapi/gtk4.vapi
-@@ -7350,11 +7350,14 @@ namespace Gtk {
- 		[Version (since = "4.14")]
- 		public void set_year (int year);
- 		public void unmark_day (uint day);
-+		[NoAccessorMethod]
- 		public int day { get; set; }
-+		[NoAccessorMethod]
- 		public int month { get; set; }
- 		public bool show_day_names { get; set; }
- 		public bool show_heading { get; set; }
- 		public bool show_week_numbers { get; set; }
-+		[NoAccessorMethod]
- 		public int year { get; set; }
- 		public signal void day_selected ();
- 		public signal void next_month ();
--- 
-2.44.0
-
diff --git a/meta/recipes-devtools/vala/vala_0.56.15.bb b/meta/recipes-devtools/vala/vala_0.56.16.bb
similarity index 92%
rename from meta/recipes-devtools/vala/vala_0.56.15.bb
rename to meta/recipes-devtools/vala/vala_0.56.16.bb
index 915ddd8e4d..1c8e4fc673 100644
--- a/meta/recipes-devtools/vala/vala_0.56.15.bb
+++ b/meta/recipes-devtools/vala/vala_0.56.16.bb
@@ -18,11 +18,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI = " \
-	http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz \
-	file://0001-gtk4-Preserve-compatibility-with-4.14.patch \
-"
-SRC_URI[sha256sum] = "535b6452ed310fd5fb5c7dd6794b6213dac3b48e645e5bff3173741ec2cb3f2b"
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz"
+SRC_URI[sha256sum] = "05487b5600f5d2f09e66a753cccd8f39c1bff9f148aea1b7774d505b9c8bca9b"
 
 inherit autotools pkgconfig upstream-version-is-even
 
-- 
2.42.0


--===============5222599177678035601==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vala-upgrade-0.56.15-0.56.16.patch"

RnJvbSBhNDA0YjA4NzI0MjcyYzBlYjU5OWM4ZmNhMjkzMzEwNTY1NjQ1NmE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxMDo1MDowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZh
bGE6IHVwZ3JhZGUgMC41Ni4xNSAtPiAwLjU2LjE2CgotLS0KIC4uLnRrNC1QcmVzZXJ2ZS1jb21w
YXRpYmlsaXR5LXdpdGgtNC4xNC5wYXRjaCB8IDM5IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi92
YWxhL3t2YWxhXzAuNTYuMTUuYmIgPT4gdmFsYV8wLjU2LjE2LmJifSB8ICA3ICstLS0KIDIgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0NCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsYS92YWxhLzAwMDEtZ3RrNC1QcmVzZXJ2
ZS1jb21wYXRpYmlsaXR5LXdpdGgtNC4xNC5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy92YWxhL3t2YWxhXzAuNTYuMTUuYmIgPT4gdmFsYV8wLjU2LjE2LmJifSAoOTIlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxhL3ZhbGEvMDAwMS1ndGs0LVByZXNl
cnZlLWNvbXBhdGliaWxpdHktd2l0aC00LjE0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3ZhbGEvdmFsYS8wMDAxLWd0azQtUHJlc2VydmUtY29tcGF0aWJpbGl0eS13aXRoLTQuMTQucGF0
Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDE2MTQ3NDA4NmUuLjAwMDAwMDAwMDAK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGEvdmFsYS8wMDAxLWd0azQtUHJlc2VydmUt
Y29tcGF0aWJpbGl0eS13aXRoLTQuMTQucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzOSArMCww
IEBACi1Gcm9tIDE3MzQ5MDIwZmI5NTQ1NGQwNmY4MjdmZDU1NWIwNTI0OGYxMGEzNzAgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBSaWNvIFR6c2NoaWNoaG9seiA8cmljb3R6QHVidW50
dS5jb20+Ci1EYXRlOiBUaHUsIDcgTWFyIDIwMjQgMTc6NTY6MDUgKzAxMDAKLVN1YmplY3Q6IFtQ
QVRDSF0gZ3RrNDogUHJlc2VydmUgY29tcGF0aWJpbGl0eSB3aXRoIDwgNC4xNAotCi1Eb24ndCBw
cmVmZXIgbmV3IGFjY2Vzc29yIG1ldGhvZHMgZm9yIENhbGVuZGFyLmRheS9tb250aC95ZWFyCi0K
LUZpeGVzIGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS92YWxhL2lzc3Vlcy8xNTMxCi0K
LVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9N
RS92YWxhLy0vY29tbWl0L2UwYzRlYThjNGEwYmJmODU5YjUzNDFhNzQ2NWIzOTU4OTI3ODlkOWVd
Ci0KLVNpZ25lZC1vZmYtYnk6IE1hcmt1cyBWb2xrIDxmX2xfa0B0LW9ubGluZS5kZT4KLS0tLQot
IHZhcGkvZ3RrNC52YXBpICAgICAgICAgICAgICAgICB8IDMgKysrCi0gdmFwaS9tZXRhZGF0YS9H
dGstNC4wLm1ldGFkYXRhIHwgNSArKysrKwotIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspCi0KLWRpZmYgLS1naXQgYS92YXBpL2d0azQudmFwaSBiL3ZhcGkvZ3RrNC52YXBpCi1pbmRl
eCA0OWY4YjIwNzguLjUxZWNlYTI3ZCAxMDA2NDQKLS0tLSBhL3ZhcGkvZ3RrNC52YXBpCi0rKysg
Yi92YXBpL2d0azQudmFwaQotQEAgLTczNTAsMTEgKzczNTAsMTQgQEAgbmFtZXNwYWNlIEd0ayB7
Ci0gCQlbVmVyc2lvbiAoc2luY2UgPSAiNC4xNCIpXQotIAkJcHVibGljIHZvaWQgc2V0X3llYXIg
KGludCB5ZWFyKTsKLSAJCXB1YmxpYyB2b2lkIHVubWFya19kYXkgKHVpbnQgZGF5KTsKLSsJCVtO
b0FjY2Vzc29yTWV0aG9kXQotIAkJcHVibGljIGludCBkYXkgeyBnZXQ7IHNldDsgfQotKwkJW05v
QWNjZXNzb3JNZXRob2RdCi0gCQlwdWJsaWMgaW50IG1vbnRoIHsgZ2V0OyBzZXQ7IH0KLSAJCXB1
YmxpYyBib29sIHNob3dfZGF5X25hbWVzIHsgZ2V0OyBzZXQ7IH0KLSAJCXB1YmxpYyBib29sIHNo
b3dfaGVhZGluZyB7IGdldDsgc2V0OyB9Ci0gCQlwdWJsaWMgYm9vbCBzaG93X3dlZWtfbnVtYmVy
cyB7IGdldDsgc2V0OyB9Ci0rCQlbTm9BY2Nlc3Nvck1ldGhvZF0KLSAJCXB1YmxpYyBpbnQgeWVh
ciB7IGdldDsgc2V0OyB9Ci0gCQlwdWJsaWMgc2lnbmFsIHZvaWQgZGF5X3NlbGVjdGVkICgpOwot
IAkJcHVibGljIHNpZ25hbCB2b2lkIG5leHRfbW9udGggKCk7Ci0tLSAKLTIuNDQuMAotCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsYS92YWxhXzAuNTYuMTUuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvdmFsYS92YWxhXzAuNTYuMTYuYmIKc2ltaWxhcml0eSBpbmRleCA5
MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGEvdmFsYV8wLjU2LjE1LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsYS92YWxhXzAuNTYuMTYuYmIKaW5k
ZXggOTE1ZGRkOGU0ZC4uMWM4ZTRmYzY3MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3ZhbGEvdmFsYV8wLjU2LjE1LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxh
L3ZhbGFfMC41Ni4xNi5iYgpAQCAtMTgsMTEgKzE4LDggQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9ZmJjMDkzOTAxODU3ZmNkMTE4ZjA2NWY5MDA5ODJjMjQiCiAKIFNI
UlRfVkVSID0gIiR7QGQuZ2V0VmFyKCdQVicpLnNwbGl0KCcuJylbMF19LiR7QGQuZ2V0VmFyKCdQ
VicpLnNwbGl0KCcuJylbMV19IgogCi1TUkNfVVJJID0gIiBcCi0JaHR0cDovL2Z0cC5nbm9tZS5v
cmcvcHViL0dOT01FL3NvdXJjZXMvJHtCUE59LyR7U0hSVF9WRVJ9LyR7QlB9LnRhci54eiBcCi0J
ZmlsZTovLzAwMDEtZ3RrNC1QcmVzZXJ2ZS1jb21wYXRpYmlsaXR5LXdpdGgtNC4xNC5wYXRjaCBc
Ci0iCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTM1YjY0NTJlZDMxMGZkNWZiNWM3ZGQ2Nzk0YjYy
MTNkYWMzYjQ4ZTY0NWU1YmZmMzE3Mzc0MWVjMmNiM2YyYiIKK1NSQ19VUkkgPSAiaHR0cDovL2Z0
cC5nbm9tZS5vcmcvcHViL0dOT01FL3NvdXJjZXMvJHtCUE59LyR7U0hSVF9WRVJ9LyR7QlB9LnRh
ci54eiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwNTQ4N2I1NjAwZjVkMmYwOWU2NmE3NTNjY2Nk
OGYzOWMxYmZmOWYxNDhhZWExYjc3NzRkNTA1YjljOGJjYTliIgogCiBpbmhlcml0IGF1dG90b29s
cyBwa2djb25maWcgdXBzdHJlYW0tdmVyc2lvbi1pcy1ldmVuCiAKLS0gCjIuNDIuMAoK

--===============5222599177678035601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vala: PV changed from "0.56.15" to "0.56.16"
packages/core2-64-poky-linux/vala: SRC_URI changed from "http://ftp.gnome.org/pub/GNOME/sources/vala/0.56/vala-0.56.15.tar.xz file://0001-gtk4-Preserve-compatibility-with-4.14.patch" to "http://ftp.gnome.org/pub/GNOME/sources/vala/0.56/vala-0.56.16.tar.xz"
packages/core2-64-poky-linux/vala: PKGV changed from 0.56.15 [default] to 0.56.16 [default]
packages/core2-64-poky-linux/vala/vala-dbg: PV changed from "0.56.15" to "0.56.16"
packages/core2-64-poky-linux/vala/vala-dbg: PKGV changed from 0.56.15 [default] to 0.56.16 [default]
packages/core2-64-poky-linux/vala/vala-dbg: PKGSIZE changed from 18915760 to 18916824 (+0%)
packages/core2-64-poky-linux/vala/vala-dev: PV changed from "0.56.15" to "0.56.16"
packages/core2-64-poky-linux/vala/vala-dev: PKGV changed from 0.56.15 [default] to 0.56.16 [default]
packages/core2-64-poky-linux/vala/vala-doc: PV changed from "0.56.15" to "0.56.16"
packages/core2-64-poky-linux/vala/vala-doc: PKGV changed from 0.56.15 [default] to 0.56.16 [default]
packages/core2-64-poky-linux/vala/vala-locale: PV changed from "0.56.15" to "0.56.16"
packages/core2-64-poky-linux/vala/vala-locale: PKGV changed from 0.56.15 [default] to 0.56.16 [default]
packages/core2-64-poky-linux/vala/vala-src: PV changed from "0.56.15" to "0.56.16"
packages/core2-64-poky-linux/vala/vala-src: PKGV changed from 0.56.15 [default] to 0.56.16 [default]
packages/core2-64-poky-linux/vala/vala-src: PKGSIZE changed from 15918697 to 15919441 (+0%)
packages/core2-64-poky-linux/vala/vala-staticdev: PV changed from "0.56.15" to "0.56.16"
packages/core2-64-poky-linux/vala/vala-staticdev: PKGV changed from 0.56.15 [default] to 0.56.16 [default]
packages/core2-64-poky-linux/vala/vala: PV changed from "0.56.15" to "0.56.16"
packages/core2-64-poky-linux/vala/vala: PKGV changed from 0.56.15 [default] to 0.56.16 [default]
packages/core2-64-poky-linux/vala/vala: PKGSIZE changed from 12388164 to 12388322 (+0%)

--===============5222599177678035601==--

