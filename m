Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DEFC47DA9
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:05 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.4641.1704114721021140988
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:12:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cPQpD/H/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=atb3edyW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018cc5270ee5-b7573c6b-43ae-4f00-87e1-30dc29fdc25f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AuxUTYBkPrkHqg//yGh4U2E97ZukfBiQYCG9eURxej8=;
	b=cPQpD/H/SQ73uCBSRyNIGH/YyqfxsbkL1wGgcGXB/I8T5pKyegmq8mla8epJw25W
	smzTyb3JN/dS6R3gL108s/R5MC9g+zbhn0kfBADmSIifHold6qDJxqujHGSjq5Y8bTO
	epwKQxBUx/SCMk76gcWPgoGDzxD0/8W1FDTZY30g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AuxUTYBkPrkHqg//yGh4U2E97ZukfBiQYCG9eURxej8=;
	b=atb3edyWFTQFx1qBjn1Yh79griVQI5jzFNaPAH9zM1jwCLCDhz82N7f11WRjxCVz
	gbjHBWRkvrNAuxL/pTAwA6D9mVILxdu5WxQzCQOcUtSEemEYaZ9uuVI87+Y0x1+URDS
	RmLVna30+iXqvKLBem0aiO2veET8kl0XsB3UPdgY=
Content-Type: multipart/mixed; boundary="===============7627802613317412107=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] appstream: upgrading to 1.0.1 SUCCEEDED
Message-ID: <0101018cc5270ee5-b7573c6b-43ae-4f00-87e1-30dc29fdc25f-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:12:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193175

--===============7627802613317412107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *appstream* to *1.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-appstream-upgrade-1.0.0-1.0.1.patch
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
From 8370fb6a3fc00c1b719f0ffebea78f6dceada751 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jan 2024 12:15:51 +0000
Subject: [PATCH] appstream: upgrade 1.0.0 -> 1.0.1

---
 .../appstream/0001-remove-hardcoded-path.patch       | 12 +++++-------
 .../{appstream_1.0.0.bb => appstream_1.0.1.bb}       |  2 +-
 2 files changed, 6 insertions(+), 8 deletions(-)
 rename meta/recipes-support/appstream/{appstream_1.0.0.bb => appstream_1.0.1.bb} (93%)

diff --git a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
index 66687a5b89..a086598922 100644
--- a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
+++ b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
@@ -1,4 +1,4 @@
-From 6ab00a4279823829a9b82dc9e4d055da4de88c6e Mon Sep 17 00:00:00 2001
+From eb2c75d565a111d61321a506e49e7e78120d462f Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Mon, 12 Dec 2022 15:42:42 +0100
 Subject: [PATCH] remove hardcoded path
@@ -9,12 +9,13 @@ Dont include hardcoded path. This fixes:
 | cc1: error: include location "/usr/include" is unsafe for cross-compilation [-Werror=poison-system-directories]
 
 Upstream-Status: Inappropriate [oe-specific]
+
 ---
- meson.build       | 2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index fd0e3373..2f273ada 100644
+index 0556b1e..f9694b3 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -185,10 +185,10 @@ endif
@@ -30,6 +31,3 @@ index fd0e3373..2f273ada 100644
          else
              error('Unable to find Snowball header "libstemmer.h". Please ensure libstemmer/Snowball is installed properly in order to continue.')
          endif
--- 
-2.34.1
-
diff --git a/meta/recipes-support/appstream/appstream_1.0.0.bb b/meta/recipes-support/appstream/appstream_1.0.1.bb
similarity index 93%
rename from meta/recipes-support/appstream/appstream_1.0.0.bb
rename to meta/recipes-support/appstream/appstream_1.0.1.bb
index 3f8bfcd263..1114011835 100644
--- a/meta/recipes-support/appstream/appstream_1.0.0.bb
+++ b/meta/recipes-support/appstream/appstream_1.0.1.bb
@@ -28,7 +28,7 @@ SRC_URI = " \
 	https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz \
 	file://0001-remove-hardcoded-path.patch \
 "
-SRC_URI[sha256sum] = "ef23477a380e8b525e92cfa87687f1146b9cef74c641349a1ae11250be5401d0"
+SRC_URI[sha256sum] = "fa4d5994e5c6f22e9b66cb0b52e8b5f5d96e7353ea5528b56436e0150829203b"
 
 S = "${WORKDIR}/AppStream-${PV}"
 
-- 
2.42.0


--===============7627802613317412107==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-appstream-upgrade-1.0.0-1.0.1.patch"

RnJvbSA4MzcwZmI2YTNmYzAwYzFiNzE5ZjBmZmViZWE3OGY2ZGNlYWRhNzUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKYW4gMjAyNCAxMjoxNTo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFw
cHN0cmVhbTogdXBncmFkZSAxLjAuMCAtPiAxLjAuMQoKLS0tCiAuLi4vYXBwc3RyZWFtLzAwMDEt
cmVtb3ZlLWhhcmRjb2RlZC1wYXRoLnBhdGNoICAgICAgIHwgMTIgKysrKystLS0tLS0tCiAuLi4v
e2FwcHN0cmVhbV8xLjAuMC5iYiA9PiBhcHBzdHJlYW1fMS4wLjEuYmJ9ICAgICAgIHwgIDIgKy0K
IDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS97YXBwc3RyZWFtXzEuMC4wLmJiID0+IGFw
cHN0cmVhbV8xLjAuMS5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDEtcmVtb3ZlLWhhcmRjb2RlZC1wYXRoLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbS8wMDAxLXJlbW92ZS1oYXJk
Y29kZWQtcGF0aC5wYXRjaAppbmRleCA2NjY4N2E1Yjg5Li5hMDg2NTk4OTIyIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDEtcmVtb3ZlLWhh
cmRjb2RlZC1wYXRoLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9h
cHBzdHJlYW0vMDAwMS1yZW1vdmUtaGFyZGNvZGVkLXBhdGgucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDZhYjAwYTQyNzk4MjM4MjlhOWI4MmRjOWU0ZDA1NWRhNGRlODhjNmUgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIGViMmM3NWQ1NjVhMTExZDYxMzIxYTUwNmU0OWU3ZTc4MTIw
ZDQ2MmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNYXJrdXMgVm9sayA8Zl9sX2tA
dC1vbmxpbmUuZGU+CiBEYXRlOiBNb24sIDEyIERlYyAyMDIyIDE1OjQyOjQyICswMTAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIHJlbW92ZSBoYXJkY29kZWQgcGF0aApAQCAtOSwxMiArOSwxMyBAQCBEb250
IGluY2x1ZGUgaGFyZGNvZGVkIHBhdGguIFRoaXMgZml4ZXM6CiB8IGNjMTogZXJyb3I6IGluY2x1
ZGUgbG9jYXRpb24gIi91c3IvaW5jbHVkZSIgaXMgdW5zYWZlIGZvciBjcm9zcy1jb21waWxhdGlv
biBbLVdlcnJvcj1wb2lzb24tc3lzdGVtLWRpcmVjdG9yaWVzXQogCiBVcHN0cmVhbS1TdGF0dXM6
IEluYXBwcm9wcmlhdGUgW29lLXNwZWNpZmljXQorCiAtLS0KLSBtZXNvbi5idWlsZCAgICAgICB8
IDIgKy0KLSAxIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbnMoLSkK
KyBtZXNvbi5idWlsZCB8IDQgKystLQorIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxk
Ci1pbmRleCBmZDBlMzM3My4uMmYyNzNhZGEgMTAwNjQ0CitpbmRleCAwNTU2YjFlLi5mOTY5NGIz
IDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxkCiBAQCAtMTg1LDEw
ICsxODUsMTAgQEAgZW5kaWYKQEAgLTMwLDYgKzMxLDMgQEAgaW5kZXggZmQwZTMzNzMuLjJmMjcz
YWRhIDEwMDY0NAogICAgICAgICAgZWxzZQogICAgICAgICAgICAgIGVycm9yKCdVbmFibGUgdG8g
ZmluZCBTbm93YmFsbCBoZWFkZXIgImxpYnN0ZW1tZXIuaCIuIFBsZWFzZSBlbnN1cmUgbGlic3Rl
bW1lci9Tbm93YmFsbCBpcyBpbnN0YWxsZWQgcHJvcGVybHkgaW4gb3JkZXIgdG8gY29udGludWUu
JykKICAgICAgICAgIGVuZGlmCi0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtXzEuMC4wLmJiIGIvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbV8xLjAuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtXzEuMC4w
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtXzEu
MC4xLmJiCmluZGV4IDNmOGJmY2QyNjMuLjExMTQwMTE4MzUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW1fMS4wLjAuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbV8xLjAuMS5iYgpAQCAtMjgsNyArMjgsNyBA
QCBTUkNfVVJJID0gIiBcCiAJaHR0cHM6Ly93d3cuZnJlZWRlc2t0b3Aub3JnL3NvZnR3YXJlL2Fw
cHN0cmVhbS9yZWxlYXNlcy9BcHBTdHJlYW0tJHtQVn0udGFyLnh6IFwKIAlmaWxlOi8vMDAwMS1y
ZW1vdmUtaGFyZGNvZGVkLXBhdGgucGF0Y2ggXAogIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImVm
MjM0NzdhMzgwZThiNTI1ZTkyY2ZhODc2ODdmMTE0NmI5Y2VmNzRjNjQxMzQ5YTFhZTExMjUwYmU1
NDAxZDAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmE0ZDU5OTRlNWM2ZjIyZTliNjZjYjBiNTJl
OGI1ZjVkOTZlNzM1M2VhNTUyOGI1NjQzNmUwMTUwODI5MjAzYiIKIAogUyA9ICIke1dPUktESVJ9
L0FwcFN0cmVhbS0ke1BWfSIKIAotLSAKMi40Mi4wCgo=

--===============7627802613317412107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/appstream/appstream: FILELIST: removed "/usr/lib/libappstream.so.1.0.0", added "/usr/lib/libappstream.so.1.0.1"
Changes to packages/core2-64-poky-linux/appstream (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.0.0 to libappstream.so.1.0.1
  /usr/lib/libappstream.so.1.0.0 moved to /usr/lib/libappstream.so.1.0.1
Changes to packages/x86_64-linux/appstream-native (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.0.0 to libappstream.so.1.0.1
  /usr/lib/libappstream.so.1.0.0 moved to /usr/lib/libappstream.so.1.0.1

--===============7627802613317412107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/appstream/appstream-dbg: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-dbg: FILELIST: removed "/usr/lib/.debug/libappstream.so.1.0.0", added "/usr/lib/.debug/libappstream.so.1.0.1"
packages/core2-64-poky-linux/appstream/appstream-dbg: PKGSIZE changed from 2373624 to 2376528 (+0%)
packages/core2-64-poky-linux/appstream/appstream-dbg: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-dev: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-dev: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-doc: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-doc: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-ain: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-ain: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-ar: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-ar: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-bn-bd: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-bn-bd: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-bn: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-bn: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-ca: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-ca: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-ckb: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-ckb: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-cs: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-cs: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-da: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-da: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-de: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-de: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-en-gb: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-en-gb: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-eo: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-eo: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-es: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-es: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-et: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-et: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-eu: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-eu: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-fi: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-fi: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-fr: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-fr: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-gd: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-gd: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-gl: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-gl: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-he: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-he: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-hi: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-hi: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-hr: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-hr: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-hu: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-hu: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-id: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-id: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-it: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-it: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-ja: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-ja: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-ka: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-ka: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-ko: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-ko: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-lt: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-lt: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-nb: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-nb: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-nl: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-nl: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-oc: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-oc: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-pl: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-pl: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-pt-br: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-pt-br: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-pt: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-pt: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-ro: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-ro: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-rom: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-rom: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-ru: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-ru: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-sk: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-sk: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-sl: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-sl: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-sr+latin: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-sr+latin: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-sr: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-sr: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-sv: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-sv: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-tr: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-tr: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-uk: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-uk: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-zh-cn: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-zh-cn: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-locale-zh-tw: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-zh-tw: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-src: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-src: PKGSIZE changed from 1829227 to 1832848 (+0%)
packages/core2-64-poky-linux/appstream/appstream-src: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream-staticdev: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream-staticdev: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream/appstream: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream/appstream: FILELIST: removed "/usr/lib/libappstream.so.1.0.0", added "/usr/lib/libappstream.so.1.0.1"
packages/core2-64-poky-linux/appstream/appstream: PKGSIZE changed from 3571943 to 3577830 (+0%)
packages/core2-64-poky-linux/appstream/appstream: PV changed from "1.0.0" to "1.0.1"
packages/core2-64-poky-linux/appstream: SRC_URI changed from "https://www.freedesktop.org/software/appstream/releases/AppStream-1.0.0.tar.xz file://0001-remove-hardcoded-path.patch" to "https://www.freedesktop.org/software/appstream/releases/AppStream-1.0.1.tar.xz file://0001-remove-hardcoded-path.patch"
packages/core2-64-poky-linux/appstream: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-64-poky-linux/appstream: PV changed from "1.0.0" to "1.0.1"
Changes to packages/core2-64-poky-linux/appstream (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.0.0 to libappstream.so.1.0.1
  /usr/lib/libappstream.so.1.0.0 moved to /usr/lib/libappstream.so.1.0.1
Changes to packages/x86_64-linux/appstream-native (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.0.0 to libappstream.so.1.0.1
  /usr/lib/libappstream.so.1.0.0 moved to /usr/lib/libappstream.so.1.0.1

--===============7627802613317412107==--

