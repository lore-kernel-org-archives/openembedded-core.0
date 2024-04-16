Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DCE3C25B5C
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:08 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.13598.1713248039711506174
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LCgqmXBq;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=b+7/7fR9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018ee58a74d6-0f6b3bd0-15b0-40ed-8827-b0cc03ec0c0b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248040;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lZ6N+q9jyk59mwqyYXs77vKBok0DFxwCcoUle71Qz6s=;
	b=LCgqmXBq4y9ygLLsbXWPtIGcBWMKxFk3F0QBN6rflhsJkXFmC39DMu8Z0VDgH/oN
	H9NEvV6NAw+mhXARhDbugfXvgUFMS4VD/pOaWGGv/e/LSyJNAMeIoICLFafWZqQ7UaV
	cke4IxO6JceqLOjKQfvJVqfUqkQTCDrOky8AYfPE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248040;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lZ6N+q9jyk59mwqyYXs77vKBok0DFxwCcoUle71Qz6s=;
	b=b+7/7fR9DfpeC4lqd3JOcmRBTWXEa/S9vf6LxzWWZeCPGk/WLWWRTLfc5GtH/nxX
	qQEMOnJ7j0p3xOsSuUt0cM3WijFwxotrVYnAUaX8StQ+5REmk3T+ObAZBuE87P8VRNg
	Ar1akhF1yKWQ28sqUYg+YZTs/pVlK7IcY/0fObzQ=
Content-Type: multipart/mixed; boundary="===============3685990703067491266=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vala: upgrading to 0.56.16 SUCCEEDED
Message-ID: <0101018ee58a74d6-0f6b3bd0-15b0-40ed-8827-b0cc03ec0c0b-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198321

--===============3685990703067491266==
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
From ec46d9fc6177dbec3128e76b8444ace4b9fb6cba Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 21:25:56 +0000
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


--===============3685990703067491266==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vala-upgrade-0.56.15-0.56.16.patch"

RnJvbSBlYzQ2ZDlmYzYxNzdkYmVjMzEyOGU3NmI4NDQ0YWNlNGI5ZmI2Y2JhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMjE6MjU6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
YWxhOiB1cGdyYWRlIDAuNTYuMTUgLT4gMC41Ni4xNgoKLS0tCiAuLi50azQtUHJlc2VydmUtY29t
cGF0aWJpbGl0eS13aXRoLTQuMTQucGF0Y2ggfCAzOSAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4v
dmFsYS97dmFsYV8wLjU2LjE1LmJiID0+IHZhbGFfMC41Ni4xNi5iYn0gfCAgNyArLS0tCiAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNDQgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9k
ZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGEvdmFsYS8wMDAxLWd0azQtUHJlc2Vy
dmUtY29tcGF0aWJpbGl0eS13aXRoLTQuMTQucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvdmFsYS97dmFsYV8wLjU2LjE1LmJiID0+IHZhbGFfMC41Ni4xNi5iYn0gKDkyJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsYS92YWxhLzAwMDEtZ3RrNC1QcmVz
ZXJ2ZS1jb21wYXRpYmlsaXR5LXdpdGgtNC4xNC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy92YWxhL3ZhbGEvMDAwMS1ndGs0LVByZXNlcnZlLWNvbXBhdGliaWxpdHktd2l0aC00LjE0LnBh
dGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAxNjE0NzQwODZlLi4wMDAwMDAwMDAw
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxhL3ZhbGEvMDAwMS1ndGs0LVByZXNlcnZl
LWNvbXBhdGliaWxpdHktd2l0aC00LjE0LnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMzkgKzAs
MCBAQAotRnJvbSAxNzM0OTAyMGZiOTU0NTRkMDZmODI3ZmQ1NTViMDUyNDhmMTBhMzcwIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogUmljbyBUenNjaGljaGhvbHogPHJpY290ekB1YnVu
dHUuY29tPgotRGF0ZTogVGh1LCA3IE1hciAyMDI0IDE3OjU2OjA1ICswMTAwCi1TdWJqZWN0OiBb
UEFUQ0hdIGd0azQ6IFByZXNlcnZlIGNvbXBhdGliaWxpdHkgd2l0aCA8IDQuMTQKLQotRG9uJ3Qg
cHJlZmVyIG5ldyBhY2Nlc3NvciBtZXRob2RzIGZvciBDYWxlbmRhci5kYXkvbW9udGgveWVhcgot
Ci1GaXhlcyBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvdmFsYS9pc3N1ZXMvMTUzMQot
Ci1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05P
TUUvdmFsYS8tL2NvbW1pdC9lMGM0ZWE4YzRhMGJiZjg1OWI1MzQxYTc0NjViMzk1ODkyNzg5ZDll
XQotCi1TaWduZWQtb2ZmLWJ5OiBNYXJrdXMgVm9sayA8Zl9sX2tAdC1vbmxpbmUuZGU+Ci0tLS0K
LSB2YXBpL2d0azQudmFwaSAgICAgICAgICAgICAgICAgfCAzICsrKwotIHZhcGkvbWV0YWRhdGEv
R3RrLTQuMC5tZXRhZGF0YSB8IDUgKysrKysKLSAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKQotCi1kaWZmIC0tZ2l0IGEvdmFwaS9ndGs0LnZhcGkgYi92YXBpL2d0azQudmFwaQotaW5k
ZXggNDlmOGIyMDc4Li41MWVjZWEyN2QgMTAwNjQ0Ci0tLS0gYS92YXBpL2d0azQudmFwaQotKysr
IGIvdmFwaS9ndGs0LnZhcGkKLUBAIC03MzUwLDExICs3MzUwLDE0IEBAIG5hbWVzcGFjZSBHdGsg
ewotIAkJW1ZlcnNpb24gKHNpbmNlID0gIjQuMTQiKV0KLSAJCXB1YmxpYyB2b2lkIHNldF95ZWFy
IChpbnQgeWVhcik7Ci0gCQlwdWJsaWMgdm9pZCB1bm1hcmtfZGF5ICh1aW50IGRheSk7Ci0rCQlb
Tm9BY2Nlc3Nvck1ldGhvZF0KLSAJCXB1YmxpYyBpbnQgZGF5IHsgZ2V0OyBzZXQ7IH0KLSsJCVtO
b0FjY2Vzc29yTWV0aG9kXQotIAkJcHVibGljIGludCBtb250aCB7IGdldDsgc2V0OyB9Ci0gCQlw
dWJsaWMgYm9vbCBzaG93X2RheV9uYW1lcyB7IGdldDsgc2V0OyB9Ci0gCQlwdWJsaWMgYm9vbCBz
aG93X2hlYWRpbmcgeyBnZXQ7IHNldDsgfQotIAkJcHVibGljIGJvb2wgc2hvd193ZWVrX251bWJl
cnMgeyBnZXQ7IHNldDsgfQotKwkJW05vQWNjZXNzb3JNZXRob2RdCi0gCQlwdWJsaWMgaW50IHll
YXIgeyBnZXQ7IHNldDsgfQotIAkJcHVibGljIHNpZ25hbCB2b2lkIGRheV9zZWxlY3RlZCAoKTsK
LSAJCXB1YmxpYyBzaWduYWwgdm9pZCBuZXh0X21vbnRoICgpOwotLS0gCi0yLjQ0LjAKLQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGEvdmFsYV8wLjU2LjE1LmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGEvdmFsYV8wLjU2LjE2LmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxhL3ZhbGFfMC41Ni4xNS5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGEvdmFsYV8wLjU2LjE2LmJiCmlu
ZGV4IDkxNWRkZDhlNGQuLjFjOGU0ZmM2NzMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy92YWxhL3ZhbGFfMC41Ni4xNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFs
YS92YWxhXzAuNTYuMTYuYmIKQEAgLTE4LDExICsxOCw4IEBAIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0NPUFlJTkc7bWQ1PWZiYzA5MzkwMTg1N2ZjZDExOGYwNjVmOTAwOTgyYzI0IgogCiBT
SFJUX1ZFUiA9ICIke0BkLmdldFZhcignUFYnKS5zcGxpdCgnLicpWzBdfS4ke0BkLmdldFZhcign
UFYnKS5zcGxpdCgnLicpWzFdfSIKIAotU1JDX1VSSSA9ICIgXAotCWh0dHA6Ly9mdHAuZ25vbWUu
b3JnL3B1Yi9HTk9NRS9zb3VyY2VzLyR7QlBOfS8ke1NIUlRfVkVSfS8ke0JQfS50YXIueHogXAot
CWZpbGU6Ly8wMDAxLWd0azQtUHJlc2VydmUtY29tcGF0aWJpbGl0eS13aXRoLTQuMTQucGF0Y2gg
XAotIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjUzNWI2NDUyZWQzMTBmZDVmYjVjN2RkNjc5NGI2
MjEzZGFjM2I0OGU2NDVlNWJmZjMxNzM3NDFlYzJjYjNmMmIiCitTUkNfVVJJID0gImh0dHA6Ly9m
dHAuZ25vbWUub3JnL3B1Yi9HTk9NRS9zb3VyY2VzLyR7QlBOfS8ke1NIUlRfVkVSfS8ke0JQfS50
YXIueHoiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDU0ODdiNTYwMGY1ZDJmMDllNjZhNzUzY2Nj
ZDhmMzljMWJmZjlmMTQ4YWVhMWI3Nzc0ZDUwNWI5YzhiY2E5YiIKIAogaW5oZXJpdCBhdXRvdG9v
bHMgcGtnY29uZmlnIHVwc3RyZWFtLXZlcnNpb24taXMtZXZlbgogCi0tIAoyLjQyLjAKCg==

--===============3685990703067491266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vala: PKGV changed from 0.56.15 [default] to 0.56.16 [default]
packages/core2-64-poky-linux/vala: SRC_URI changed from "http://ftp.gnome.org/pub/GNOME/sources/vala/0.56/vala-0.56.15.tar.xz file://0001-gtk4-Preserve-compatibility-with-4.14.patch" to "http://ftp.gnome.org/pub/GNOME/sources/vala/0.56/vala-0.56.16.tar.xz"
packages/core2-64-poky-linux/vala: PV changed from "0.56.15" to "0.56.16"
packages/core2-64-poky-linux/vala/vala-dbg: PKGSIZE changed from 18915760 to 18916824 (+0%)
packages/core2-64-poky-linux/vala/vala-dbg: PKGV changed from 0.56.15 [default] to 0.56.16 [default]
packages/core2-64-poky-linux/vala/vala-dbg: PV changed from "0.56.15" to "0.56.16"
packages/core2-64-poky-linux/vala/vala-dev: PKGV changed from 0.56.15 [default] to 0.56.16 [default]
packages/core2-64-poky-linux/vala/vala-dev: PV changed from "0.56.15" to "0.56.16"
packages/core2-64-poky-linux/vala/vala-doc: PKGV changed from 0.56.15 [default] to 0.56.16 [default]
packages/core2-64-poky-linux/vala/vala-doc: PV changed from "0.56.15" to "0.56.16"
packages/core2-64-poky-linux/vala/vala-locale: PKGV changed from 0.56.15 [default] to 0.56.16 [default]
packages/core2-64-poky-linux/vala/vala-locale: PV changed from "0.56.15" to "0.56.16"
packages/core2-64-poky-linux/vala/vala-src: PKGSIZE changed from 15918697 to 15919441 (+0%)
packages/core2-64-poky-linux/vala/vala-src: PKGV changed from 0.56.15 [default] to 0.56.16 [default]
packages/core2-64-poky-linux/vala/vala-src: PV changed from "0.56.15" to "0.56.16"
packages/core2-64-poky-linux/vala/vala-staticdev: PKGV changed from 0.56.15 [default] to 0.56.16 [default]
packages/core2-64-poky-linux/vala/vala-staticdev: PV changed from "0.56.15" to "0.56.16"
packages/core2-64-poky-linux/vala/vala: PKGSIZE changed from 12388164 to 12388322 (+0%)
packages/core2-64-poky-linux/vala/vala: PKGV changed from 0.56.15 [default] to 0.56.16 [default]
packages/core2-64-poky-linux/vala/vala: PV changed from "0.56.15" to "0.56.16"

--===============3685990703067491266==--

