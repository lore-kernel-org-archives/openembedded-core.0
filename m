Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5804D5C0D4
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:38 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17182.1765872136269594598
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BDJnXiqg;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=MUyU9oqB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019b262eba51-82c12f0a-5f31-43aa-826e-a0e2aee59820-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872155;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tnPwVTRR5fq0ly8AncGMuYWSA8wRjOksVDKME0Nq1zs=;
	b=BDJnXiqgrwTsKq8SkMIXcSWgJMyjMO2tNpdIusW7GxYptj5oqCRUCZ7K7u/STzMt
	MAz93TbGOpE1lXyIbg2wlpz7fY1thy6gPhWgEYrc5/clAI167giYEF+VhuGCHiBLrvu
	nYuno3qHfuI4YX6LE6zxKxwlMaO+BiXyFPjo+zbU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872155;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tnPwVTRR5fq0ly8AncGMuYWSA8wRjOksVDKME0Nq1zs=;
	b=MUyU9oqBupwW14k+1HPAuAqWfpAvcKwwDdq3ed5ogZ3iL/KdkxU9t3b+ndBk37zK
	YuHnC/AEr5C/SnNhoavco98coS+uB9ygWWa0O0ewWDd+QbPfDBy1hOZwLULRKquAuh3
	Lnd9Ry6g1clzailvt22/fxa2kh/RTaREEVJkUnNU=
Content-Type: multipart/mixed; boundary="===============4824288179488700186=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] quota: upgrading to 4.11 SUCCEEDED
Message-ID: <0101019b262eba51-82c12f0a-5f31-43aa-826e-a0e2aee59820-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227851

--===============4824288179488700186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *quota* to *4.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-quota-upgrade-4.10-4.11.patch
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
From 8a7512a6aa9ce0c9b1945f6663a8ddcd31a18929 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 02:53:36 +0000
Subject: [PATCH] quota: upgrade 4.10 -> 4.11

---
 .../0001-setproject-Fix-openWRT-build.patch   | 30 -------------------
 .../quota/{quota_4.10.bb => quota_4.11.bb}    |  6 ++--
 2 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-extended/quota/quota/0001-setproject-Fix-openWRT-build.patch
 rename meta/recipes-extended/quota/{quota_4.10.bb => quota_4.11.bb} (87%)

diff --git a/meta/recipes-extended/quota/quota/0001-setproject-Fix-openWRT-build.patch b/meta/recipes-extended/quota/quota/0001-setproject-Fix-openWRT-build.patch
deleted file mode 100644
index 8ca3d9f773..0000000000
--- a/meta/recipes-extended/quota/quota/0001-setproject-Fix-openWRT-build.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 41ba7031ca4852739dd1f66102d34e4a98490906 Mon Sep 17 00:00:00 2001
-From: Jan Kara <jack@suse.cz>
-Date: Tue, 1 Jul 2025 15:41:56 +0200
-Subject: [PATCH] setproject: Fix openWRT build
-
-basename() needs libgen.h include in openWRT build environment. Add it.
-
-Reported-by: "W. Michael Petullo" <mike@flyn.org>
-Signed-off-by: Jan Kara <jack@suse.cz>
-
-Upstream-Status: Backport [https://sourceforge.net/p/linuxquota/code/ci/41ba7031ca4852739dd1f66102d34e4a98490906/]
-
-This also fixes the build in Yocto.
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- setproject.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/setproject.c b/setproject.c
-index e688dcd..4308435 100644
---- a/setproject.c
-+++ b/setproject.c
-@@ -13,6 +13,7 @@
- #include <sys/stat.h>
- #include <sys/types.h>
- #include <unistd.h>
-+#include <libgen.h>
- 
- #include <linux/fs.h>
- 
diff --git a/meta/recipes-extended/quota/quota_4.10.bb b/meta/recipes-extended/quota/quota_4.11.bb
similarity index 87%
rename from meta/recipes-extended/quota/quota_4.10.bb
rename to meta/recipes-extended/quota/quota_4.11.bb
index 8f9e4fdf34..b386071961 100644
--- a/meta/recipes-extended/quota/quota_4.10.bb
+++ b/meta/recipes-extended/quota/quota_4.11.bb
@@ -7,10 +7,8 @@ LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://rquota_server.c;beginline=1;endline=20;md5=fe7e0d7e11c6f820f8fa62a5af71230f \
                     file://svc_socket.c;beginline=1;endline=17;md5=24d5a8792da45910786eeac750be8ceb"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/linuxquota/quota-tools/${PV}/quota-${PV}.tar.gz \
-           file://0001-setproject-Fix-openWRT-build.patch \
-           "
-SRC_URI[sha256sum] = "a04a0cafca29c15be8b6ac660e06188bccb802c19efe2e7c19ed7f3d667ecf5e"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/linuxquota/quota-tools/${PV}/quota-${PV}.tar.gz"
+SRC_URI[sha256sum] = "0a51b8f920254d8e83c34a4c3082b7d241f5d6fd65188afadf29859d5223ef78"
 
 CVE_PRODUCT = "linux_diskquota"
 
-- 
2.47.1


--===============4824288179488700186==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-quota-upgrade-4.10-4.11.patch"

RnJvbSA4YTc1MTJhNmFhOWNlMGM5YjE5NDVmNjY2M2E4ZGRjZDMxYTE4OTI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDI6NTM6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBx
dW90YTogdXBncmFkZSA0LjEwIC0+IDQuMTEKCi0tLQogLi4uLzAwMDEtc2V0cHJvamVjdC1GaXgt
b3BlbldSVC1idWlsZC5wYXRjaCAgIHwgMzAgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL3F1b3Rh
L3txdW90YV80LjEwLmJiID0+IHF1b3RhXzQuMTEuYmJ9ICAgIHwgIDYgKystLQogMiBmaWxlcyBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDM0IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAw
NjQ0IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9xdW90YS9xdW90YS8wMDAxLXNldHByb2plY3QtRml4
LW9wZW5XUlQtYnVpbGQucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcXVvdGEv
e3F1b3RhXzQuMTAuYmIgPT4gcXVvdGFfNC4xMS5iYn0gKDg3JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvcXVvdGEvcXVvdGEvMDAwMS1zZXRwcm9qZWN0LUZpeC1vcGVuV1JU
LWJ1aWxkLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3F1b3RhL3F1b3RhLzAwMDEtc2V0
cHJvamVjdC1GaXgtb3BlbldSVC1idWlsZC5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggOGNhM2Q5Zjc3My4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
cXVvdGEvcXVvdGEvMDAwMS1zZXRwcm9qZWN0LUZpeC1vcGVuV1JULWJ1aWxkLnBhdGNoCisrKyAv
ZGV2L251bGwKQEAgLTEsMzAgKzAsMCBAQAotRnJvbSA0MWJhNzAzMWNhNDg1MjczOWRkMWY2NjEw
MmQzNGU0YTk4NDkwOTA2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogSmFuIEthcmEg
PGphY2tAc3VzZS5jej4KLURhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxNTo0MTo1NiArMDIwMAotU3Vi
amVjdDogW1BBVENIXSBzZXRwcm9qZWN0OiBGaXggb3BlbldSVCBidWlsZAotCi1iYXNlbmFtZSgp
IG5lZWRzIGxpYmdlbi5oIGluY2x1ZGUgaW4gb3BlbldSVCBidWlsZCBlbnZpcm9ubWVudC4gQWRk
IGl0LgotCi1SZXBvcnRlZC1ieTogIlcuIE1pY2hhZWwgUGV0dWxsbyIgPG1pa2VAZmx5bi5vcmc+
Ci1TaWduZWQtb2ZmLWJ5OiBKYW4gS2FyYSA8amFja0BzdXNlLmN6PgotCi1VcHN0cmVhbS1TdGF0
dXM6IEJhY2twb3J0IFtodHRwczovL3NvdXJjZWZvcmdlLm5ldC9wL2xpbnV4cXVvdGEvY29kZS9j
aS80MWJhNzAzMWNhNDg1MjczOWRkMWY2NjEwMmQzNGU0YTk4NDkwOTA2L10KLQotVGhpcyBhbHNv
IGZpeGVzIHRoZSBidWlsZCBpbiBZb2N0by4KLVNpZ25lZC1vZmYtYnk6IEd5b3JneSBTYXJ2YXJp
IDxza2FuZGlncmF1bkBnbWFpbC5jb20+Ci0tLS0KLSBzZXRwcm9qZWN0LmMgfCAxICsKLSAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKLQotZGlmZiAtLWdpdCBhL3NldHByb2plY3QuYyBi
L3NldHByb2plY3QuYwotaW5kZXggZTY4OGRjZC4uNDMwODQzNSAxMDA2NDQKLS0tLSBhL3NldHBy
b2plY3QuYwotKysrIGIvc2V0cHJvamVjdC5jCi1AQCAtMTMsNiArMTMsNyBAQAotICNpbmNsdWRl
IDxzeXMvc3RhdC5oPgotICNpbmNsdWRlIDxzeXMvdHlwZXMuaD4KLSAjaW5jbHVkZSA8dW5pc3Rk
Lmg+Ci0rI2luY2x1ZGUgPGxpYmdlbi5oPgotIAotICNpbmNsdWRlIDxsaW51eC9mcy5oPgotIApk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3F1b3RhL3F1b3RhXzQuMTAuYmIgYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcXVvdGEvcXVvdGFfNC4xMS5iYgpzaW1pbGFyaXR5IGluZGV4
IDg3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcXVvdGEvcXVvdGFfNC4xMC5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3F1b3RhL3F1b3RhXzQuMTEuYmIKaW5k
ZXggOGY5ZTRmZGYzNC4uYjM4NjA3MTk2MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL3F1b3RhL3F1b3RhXzQuMTAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3F1b3Rh
L3F1b3RhXzQuMTEuYmIKQEAgLTcsMTAgKzcsOCBAQCBMSUNFTlNFID0gIkdQTC0yLjAtb3ItbGF0
ZXIgJiBMR1BMLTIuMS1vci1sYXRlciIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL3JxdW90
YV9zZXJ2ZXIuYztiZWdpbmxpbmU9MTtlbmRsaW5lPTIwO21kNT1mZTdlMGQ3ZTExYzZmODIwZjhm
YTYyYTVhZjcxMjMwZiBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zdmNfc29ja2V0LmM7
YmVnaW5saW5lPTE7ZW5kbGluZT0xNzttZDU9MjRkNWE4NzkyZGE0NTkxMDc4NmVlYWM3NTBiZThj
ZWIiCiAKLVNSQ19VUkkgPSAiJHtTT1VSQ0VGT1JHRV9NSVJST1J9L3Byb2plY3QvbGludXhxdW90
YS9xdW90YS10b29scy8ke1BWfS9xdW90YS0ke1BWfS50YXIuZ3ogXAotICAgICAgICAgICBmaWxl
Oi8vMDAwMS1zZXRwcm9qZWN0LUZpeC1vcGVuV1JULWJ1aWxkLnBhdGNoIFwKLSAgICAgICAgICAg
IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImEwNGEwY2FmY2EyOWMxNWJlOGI2YWM2NjBlMDYxODhi
Y2NiODAyYzE5ZWZlMmU3YzE5ZWQ3ZjNkNjY3ZWNmNWUiCitTUkNfVVJJID0gIiR7U09VUkNFRk9S
R0VfTUlSUk9SfS9wcm9qZWN0L2xpbnV4cXVvdGEvcXVvdGEtdG9vbHMvJHtQVn0vcXVvdGEtJHtQ
Vn0udGFyLmd6IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjBhNTFiOGY5MjAyNTRkOGU4M2MzNGE0
YzMwODJiN2QyNDFmNWQ2ZmQ2NTE4OGFmYWRmMjk4NTlkNTIyM2VmNzgiCiAKIENWRV9QUk9EVUNU
ID0gImxpbnV4X2Rpc2txdW90YSIKIAotLSAKMi40Ny4xCgo=

--===============4824288179488700186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/quota: PV changed from "4.10" to "4.11"
packages/x86-64-v3-poky-linux/quota: SRC_URI changed from "https://downloads.sourceforge.net/project/linuxquota/quota-tools/4.10/quota-4.10.tar.gz file://0001-setproject-Fix-openWRT-build.patch" to "https://downloads.sourceforge.net/project/linuxquota/quota-tools/4.11/quota-4.11.tar.gz"
packages/x86-64-v3-poky-linux/quota: PKGV changed from 4.10 [default] to 4.11 [default]
packages/x86-64-v3-poky-linux/quota/quota-dbg: PV changed from "4.10" to "4.11"
packages/x86-64-v3-poky-linux/quota/quota-dbg: PKGV changed from 4.10 [default] to 4.11 [default]
packages/x86-64-v3-poky-linux/quota/quota-dbg: PKGSIZE changed from 3270568 to 3220064 (-2%)
packages/x86-64-v3-poky-linux/quota/quota-dev: PV changed from "4.10" to "4.11"
packages/x86-64-v3-poky-linux/quota/quota-dev: PKGV changed from 4.10 [default] to 4.11 [default]
packages/x86-64-v3-poky-linux/quota/quota-doc: PV changed from "4.10" to "4.11"
packages/x86-64-v3-poky-linux/quota/quota-doc: PKGV changed from 4.10 [default] to 4.11 [default]
packages/x86-64-v3-poky-linux/quota/quota-locale-cs: PV changed from "4.10" to "4.11"
packages/x86-64-v3-poky-linux/quota/quota-locale-cs: PKGV changed from 4.10 [default] to 4.11 [default]
packages/x86-64-v3-poky-linux/quota/quota-locale-cs: PKGSIZE changed from 61496 to 61311 (-0%)
packages/x86-64-v3-poky-linux/quota/quota-locale-de: PV changed from "4.10" to "4.11"
packages/x86-64-v3-poky-linux/quota/quota-locale-de: PKGV changed from 4.10 [default] to 4.11 [default]
packages/x86-64-v3-poky-linux/quota/quota-locale-de: PKGSIZE changed from 56960 to 56767 (-0%)
packages/x86-64-v3-poky-linux/quota/quota-locale-fr: PV changed from "4.10" to "4.11"
packages/x86-64-v3-poky-linux/quota/quota-locale-fr: PKGV changed from 4.10 [default] to 4.11 [default]
packages/x86-64-v3-poky-linux/quota/quota-locale-pl: PV changed from "4.10" to "4.11"
packages/x86-64-v3-poky-linux/quota/quota-locale-pl: PKGV changed from 4.10 [default] to 4.11 [default]
packages/x86-64-v3-poky-linux/quota/quota-locale-pl: PKGSIZE changed from 88646 to 88467 (-0%)
packages/x86-64-v3-poky-linux/quota/quota-src: PV changed from "4.10" to "4.11"
packages/x86-64-v3-poky-linux/quota/quota-src: PKGV changed from 4.10 [default] to 4.11 [default]
packages/x86-64-v3-poky-linux/quota/quota-src: PKGSIZE changed from 428481 to 421709 (-2%)
packages/x86-64-v3-poky-linux/quota/quota-src: FILELIST: directory renamed /usr/src/debug/quota/4.10 -> /usr/src/debug/quota/4.11
packages/x86-64-v3-poky-linux/quota/quota-staticdev: PV changed from "4.10" to "4.11"
packages/x86-64-v3-poky-linux/quota/quota-staticdev: PKGV changed from 4.10 [default] to 4.11 [default]
packages/x86-64-v3-poky-linux/quota/quota: PV changed from "4.10" to "4.11"
packages/x86-64-v3-poky-linux/quota/quota: PKGV changed from 4.10 [default] to 4.11 [default]
packages/x86-64-v3-poky-linux/quota/quota: PKGSIZE changed from 1023046 to 1002558 (-2%)

--===============4824288179488700186==--

