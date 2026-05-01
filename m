Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D374CD4851
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:59 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15726.1777645553494782885
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NWPIL5NA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ARAZCno4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019de3ee8528-8cea2f89-b775-43c2-abb8-b43e3283e9a0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZF9a3UKaUDGPPCp1TKvYhMo4vlgS7glhMdWZ7RYpRzM=;
	b=NWPIL5NAQZDu2cfuO0b0G1CmY7i6j8D+rTJMtBQKbKmgrKFP1CIhSgMcw/HV2Hpx
	RxKo4H4cf/9klFhhwdqy5hk40l7BnH/UA9j5MpW0N0ja1Lg/RfDosInwzhMefxxKEvV
	rxufP0i7Jr1hF67KZA2DKmzB05dizYUFlMm0/koo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZF9a3UKaUDGPPCp1TKvYhMo4vlgS7glhMdWZ7RYpRzM=;
	b=ARAZCno4MrPSEeWoxzeejl38ZV1XsZG2vTGn7c6PvSp+lnl+LvHtAXB3i7Z4K+La
	fdt5x3diokp1S+ySyBQ6WOaIozhNx8B/NudJPbQGMcsTADS2LEmXNVl6rM+6NbLk5zF
	dLAuMDVb+URH4mwp5cxHhapribP2WsCTAyM0E58E=
Content-Type: multipart/mixed; boundary="===============9160574127593084801=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Etienne Cordonnier <ecordonnier@snap.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] makedumpfile: upgrading to 1.7.9 SUCCEEDED
Message-ID: <0101019de3ee8528-8cea2f89-b775-43c2-abb8-b43e3283e9a0-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236287

--===============9160574127593084801==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *makedumpfile* to *1.7.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-makedumpfile-upgrade-1.7.8-1.7.9.patch
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
From 7b7a74c8d82eb276393c7f060e95ae4fe31baec4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 12:49:10 +0000
Subject: [PATCH] makedumpfile: upgrade 1.7.8 -> 1.7.9

---
 .../0001-makedumpfile-replace-hardcode-CFLAGS.patch           | 4 ++--
 .../{makedumpfile_1.7.8.bb => makedumpfile_1.7.9.bb}          | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/makedumpfile/{makedumpfile_1.7.8.bb => makedumpfile_1.7.9.bb} (96%)

diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
index 554402454f..9b527cfb99 100644
--- a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
@@ -1,4 +1,4 @@
-From bb16dc839a8a45cc7d2e271ebbe41d7e39a799bd Mon Sep 17 00:00:00 2001
+From 8d200d7cd700f93333353632e7dce48cf4b871fe Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Sun, 24 Apr 2022 17:25:33 +0800
 Subject: [PATCH] makedumpfile: replace hardcode CFLAGS
@@ -24,7 +24,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 21 insertions(+), 19 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 05ab5f2..57328f8 100644
+index b2ffcec..e416f4e 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -8,12 +8,6 @@ ifeq ($(strip $CC),)
diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.8.bb b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.9.bb
similarity index 96%
rename from meta/recipes-kernel/makedumpfile/makedumpfile_1.7.8.bb
rename to meta/recipes-kernel/makedumpfile/makedumpfile_1.7.9.bb
index 6b582729a1..8704481da7 100644
--- a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.8.bb
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.9.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 LICENSE = "GPL-2.0-only"
 
 SRCBRANCH ?= "master"
-SRCREV = "65e0b5488ffe840035c6e165a5149dc5da769d97"
+SRCREV = "eb42d6330b275ba344ca170286480917450d7f73"
 
 DEPENDS = "bzip2 zlib elfutils xz"
 RDEPENDS:${PN}-tools = "perl ${PN}"
-- 
2.47.1


--===============9160574127593084801==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-makedumpfile-upgrade-1.7.8-1.7.9.patch"

RnJvbSA3YjdhNzRjOGQ4MmViMjc2MzkzYzdmMDYwZTk1YWU0ZmUzMWJhZWM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAxMjo0OToxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1h
a2VkdW1wZmlsZTogdXBncmFkZSAxLjcuOCAtPiAxLjcuOQoKLS0tCiAuLi4vMDAwMS1tYWtlZHVt
cGZpbGUtcmVwbGFjZS1oYXJkY29kZS1DRkxBR1MucGF0Y2ggICAgICAgICAgIHwgNCArKy0tCiAu
Li4ve21ha2VkdW1wZmlsZV8xLjcuOC5iYiA9PiBtYWtlZHVtcGZpbGVfMS43LjkuYmJ9ICAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9tYWtlZHVtcGZpbGUve21ha2VkdW1wZmls
ZV8xLjcuOC5iYiA9PiBtYWtlZHVtcGZpbGVfMS43LjkuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWtlcm5lbC9tYWtlZHVtcGZpbGUvbWFrZWR1bXBmaWxlLzAwMDEtbWFrZWR1
bXBmaWxlLXJlcGxhY2UtaGFyZGNvZGUtQ0ZMQUdTLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5l
bC9tYWtlZHVtcGZpbGUvbWFrZWR1bXBmaWxlLzAwMDEtbWFrZWR1bXBmaWxlLXJlcGxhY2UtaGFy
ZGNvZGUtQ0ZMQUdTLnBhdGNoCmluZGV4IDU1NDQwMjQ1NGYuLjliNTI3Y2ZiOTkgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbWFrZWR1bXBmaWxlL21ha2VkdW1wZmlsZS8wMDAxLW1h
a2VkdW1wZmlsZS1yZXBsYWNlLWhhcmRjb2RlLUNGTEFHUy5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMta2VybmVsL21ha2VkdW1wZmlsZS9tYWtlZHVtcGZpbGUvMDAwMS1tYWtlZHVtcGZpbGUtcmVw
bGFjZS1oYXJkY29kZS1DRkxBR1MucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGJiMTZkYzgz
OWE4YTQ1Y2M3ZDJlMjcxZWJiZTQxZDdlMzlhNzk5YmQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDhkMjAwZDdjZDcwMGY5MzMzMzM1MzYzMmU3ZGNlNDhjZjRiODcxZmUgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBNaW5nbGkgWXUgPG1pbmdsaS55dUB3aW5kcml2ZXIuY29t
PgogRGF0ZTogU3VuLCAyNCBBcHIgMjAyMiAxNzoyNTozMyArMDgwMAogU3ViamVjdDogW1BBVENI
XSBtYWtlZHVtcGZpbGU6IHJlcGxhY2UgaGFyZGNvZGUgQ0ZMQUdTCkBAIC0yNCw3ICsyNCw3IEBA
IFNpZ25lZC1vZmYtYnk6IE1pbmdsaSBZdSA8bWluZ2xpLnl1QHdpbmRyaXZlci5jb20+CiAgMSBm
aWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQogCiBkaWZmIC0t
Z2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQotaW5kZXggMDVhYjVmMi4uNTczMjhmOCAxMDA2NDQK
K2luZGV4IGIyZmZjZWMuLmU0MTZmNGUgMTAwNjQ0CiAtLS0gYS9NYWtlZmlsZQogKysrIGIvTWFr
ZWZpbGUKIEBAIC04LDEyICs4LDYgQEAgaWZlcSAoJChzdHJpcCAkQ0MpLCkKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1rZXJuZWwvbWFrZWR1bXBmaWxlL21ha2VkdW1wZmlsZV8xLjcuOC5iYiBi
L21ldGEvcmVjaXBlcy1rZXJuZWwvbWFrZWR1bXBmaWxlL21ha2VkdW1wZmlsZV8xLjcuOS5iYgpz
aW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMta2VybmVsL21ha2Vk
dW1wZmlsZS9tYWtlZHVtcGZpbGVfMS43LjguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJu
ZWwvbWFrZWR1bXBmaWxlL21ha2VkdW1wZmlsZV8xLjcuOS5iYgppbmRleCA2YjU4MjcyOWExLi44
NzA0NDgxZGE3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL21ha2VkdW1wZmlsZS9t
YWtlZHVtcGZpbGVfMS43LjguYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9tYWtlZHVtcGZp
bGUvbWFrZWR1bXBmaWxlXzEuNy45LmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTc1MTQxOTI2MGFhOTU0NDk5ZjdhYmFhYmFhODgyYmJl
IgogTElDRU5TRSA9ICJHUEwtMi4wLW9ubHkiCiAKIFNSQ0JSQU5DSCA/PSAibWFzdGVyIgotU1JD
UkVWID0gIjY1ZTBiNTQ4OGZmZTg0MDAzNWM2ZTE2NWE1MTQ5ZGM1ZGE3NjlkOTciCitTUkNSRVYg
PSAiZWI0MmQ2MzMwYjI3NWJhMzQ0Y2ExNzAyODY0ODA5MTc0NTBkN2Y3MyIKIAogREVQRU5EUyA9
ICJiemlwMiB6bGliIGVsZnV0aWxzIHh6IgogUkRFUEVORFM6JHtQTn0tdG9vbHMgPSAicGVybCAk
e1BOfSIKLS0gCjIuNDcuMQoK

--===============9160574127593084801==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/makedumpfile: PKGV changed from 1.7.8 [default] to 1.7.9 [default]
packages/x86-64-v3-poky-linux/makedumpfile: PV changed from "1.7.8" to "1.7.9"
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-dbg: PKGV changed from 1.7.8 [default] to 1.7.9 [default]
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-dbg: PV changed from "1.7.8" to "1.7.9"
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-dev: PKGV changed from 1.7.8 [default] to 1.7.9 [default]
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-dev: PV changed from "1.7.8" to "1.7.9"
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-doc: PKGV changed from 1.7.8 [default] to 1.7.9 [default]
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-doc: PV changed from "1.7.8" to "1.7.9"
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-locale: PKGV changed from 1.7.8 [default] to 1.7.9 [default]
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-locale: PV changed from "1.7.8" to "1.7.9"
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-src: PKGV changed from 1.7.8 [default] to 1.7.9 [default]
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-src: FILELIST: directory renamed /usr/src/debug/makedumpfile/1.7.8/arch -> /usr/src/debug/makedumpfile/1.7.9/arch, directory renamed /usr/src/debug/makedumpfile/1.7.8 -> /usr/src/debug/makedumpfile/1.7.9
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-src: PV changed from "1.7.8" to "1.7.9"
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-src: PKGSIZE changed from 693112 to 693110 (-0%)
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-staticdev: PKGV changed from 1.7.8 [default] to 1.7.9 [default]
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-staticdev: PV changed from "1.7.8" to "1.7.9"
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-tools: PKGV changed from 1.7.8 [default] to 1.7.9 [default]
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-tools: PV changed from "1.7.8" to "1.7.9"
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile: PKGV changed from 1.7.8 [default] to 1.7.9 [default]
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile: PV changed from "1.7.8" to "1.7.9"

--===============9160574127593084801==--

