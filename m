Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E45D5E37A
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:52 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17385.1765872131800834005
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=zJYMDUwx;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=LI2MCsso;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019b262ed9ba-54f021f9-5e73-4eea-a3cb-c2b9acd2d40f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872163;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FHLcrxwmw7F6zZmMBTNjecHRES9Nj4AODRL/LmQIbWM=;
	b=zJYMDUwx67OV8Zgt6OwwWGn8vIc7zXO2vNKaq2V4lR2anLaSP7az58MMhH57aSEC
	AYEpSdvfL0lN1JuLeUJ4jTOYaXv2AJrEONnl9PzLHMIoVwBu1wpy474UQelD+568/tk
	Zz8SWy8cTHTEcU+4IHTmdHwzGJLBtz1kdj29+Ir0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872163;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FHLcrxwmw7F6zZmMBTNjecHRES9Nj4AODRL/LmQIbWM=;
	b=LI2MCssooeMqfUQ+X+wWxXZg9UQVeqSoKr6Wo/8v7ldOLZ42DGKGzV3MOU+r1egT
	tx6rA7fTj3RGoclILcAL4OzKkI4i59/JmLVGRLWd7I/IqvtD6KZHyGbiUu4mwFYsRvO
	9KH7BQXL7YZBoG1ITEhR6kwSzUIfJ/iVRjNpql3A=
Content-Type: multipart/mixed; boundary="===============5986139868976096339=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Etienne Cordonnier <ecordonnier@snap.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] makedumpfile: upgrading to 1.7.8 SUCCEEDED
Message-ID: <0101019b262ed9ba-54f021f9-5e73-4eea-a3cb-c2b9acd2d40f-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227885

--===============5986139868976096339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *makedumpfile* to *1.7.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-makedumpfile-upgrade-1.7.7-1.7.8.patch
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
From f3a048d13abceed551786171e066ed49597e8098 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 05:42:11 +0000
Subject: [PATCH] makedumpfile: upgrade 1.7.7 -> 1.7.8

---
 .../0001-makedumpfile-replace-hardcode-CFLAGS.patch           | 4 ++--
 .../{makedumpfile_1.7.7.bb => makedumpfile_1.7.8.bb}          | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/makedumpfile/{makedumpfile_1.7.7.bb => makedumpfile_1.7.8.bb} (96%)

diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
index 796e036ab8..554402454f 100644
--- a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
@@ -1,4 +1,4 @@
-From 59b8d59504c1bafff52a8794e67c6025fcd418a4 Mon Sep 17 00:00:00 2001
+From bb16dc839a8a45cc7d2e271ebbe41d7e39a799bd Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Sun, 24 Apr 2022 17:25:33 +0800
 Subject: [PATCH] makedumpfile: replace hardcode CFLAGS
@@ -24,7 +24,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 21 insertions(+), 19 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index aa73252..76fcafd 100644
+index 05ab5f2..57328f8 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -8,12 +8,6 @@ ifeq ($(strip $CC),)
diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.7.bb b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.8.bb
similarity index 96%
rename from meta/recipes-kernel/makedumpfile/makedumpfile_1.7.7.bb
rename to meta/recipes-kernel/makedumpfile/makedumpfile_1.7.8.bb
index 99393e0984..6b582729a1 100644
--- a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.7.bb
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.8.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 LICENSE = "GPL-2.0-only"
 
 SRCBRANCH ?= "master"
-SRCREV = "e4ae6b5ee04edeeb03db89bee372904157e3378d"
+SRCREV = "65e0b5488ffe840035c6e165a5149dc5da769d97"
 
 DEPENDS = "bzip2 zlib elfutils xz"
 RDEPENDS:${PN}-tools = "perl ${PN}"
-- 
2.47.1


--===============5986139868976096339==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-makedumpfile-upgrade-1.7.7-1.7.8.patch"

RnJvbSBmM2EwNDhkMTNhYmNlZWQ1NTE3ODYxNzFlMDY2ZWQ0OTU5N2U4MDk4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDU6NDI6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
YWtlZHVtcGZpbGU6IHVwZ3JhZGUgMS43LjcgLT4gMS43LjgKCi0tLQogLi4uLzAwMDEtbWFrZWR1
bXBmaWxlLXJlcGxhY2UtaGFyZGNvZGUtQ0ZMQUdTLnBhdGNoICAgICAgICAgICB8IDQgKystLQog
Li4uL3ttYWtlZHVtcGZpbGVfMS43LjcuYmIgPT4gbWFrZWR1bXBmaWxlXzEuNy44LmJifSAgICAg
ICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1rZXJuZWwvbWFrZWR1bXBmaWxlL3ttYWtlZHVtcGZp
bGVfMS43LjcuYmIgPT4gbWFrZWR1bXBmaWxlXzEuNy44LmJifSAoOTYlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1rZXJuZWwvbWFrZWR1bXBmaWxlL21ha2VkdW1wZmlsZS8wMDAxLW1ha2Vk
dW1wZmlsZS1yZXBsYWNlLWhhcmRjb2RlLUNGTEFHUy5wYXRjaCBiL21ldGEvcmVjaXBlcy1rZXJu
ZWwvbWFrZWR1bXBmaWxlL21ha2VkdW1wZmlsZS8wMDAxLW1ha2VkdW1wZmlsZS1yZXBsYWNlLWhh
cmRjb2RlLUNGTEFHUy5wYXRjaAppbmRleCA3OTZlMDM2YWI4Li41NTQ0MDI0NTRmIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL21ha2VkdW1wZmlsZS9tYWtlZHVtcGZpbGUvMDAwMS1t
YWtlZHVtcGZpbGUtcmVwbGFjZS1oYXJkY29kZS1DRkxBR1MucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWtlcm5lbC9tYWtlZHVtcGZpbGUvbWFrZWR1bXBmaWxlLzAwMDEtbWFrZWR1bXBmaWxlLXJl
cGxhY2UtaGFyZGNvZGUtQ0ZMQUdTLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1OWI4ZDU5
NTA0YzFiYWZmZjUyYTg3OTRlNjdjNjAyNWZjZDQxOGE0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBiYjE2ZGM4MzlhOGE0NWNjN2QyZTI3MWViYmU0MWQ3ZTM5YTc5OWJkIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWluZ2xpIFl1IDxtaW5nbGkueXVAd2luZHJpdmVyLmNv
bT4KIERhdGU6IFN1biwgMjQgQXByIDIwMjIgMTc6MjU6MzMgKzA4MDAKIFN1YmplY3Q6IFtQQVRD
SF0gbWFrZWR1bXBmaWxlOiByZXBsYWNlIGhhcmRjb2RlIENGTEFHUwpAQCAtMjQsNyArMjQsNyBA
QCBTaWduZWQtb2ZmLWJ5OiBNaW5nbGkgWXUgPG1pbmdsaS55dUB3aW5kcml2ZXIuY29tPgogIDEg
ZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKIAogZGlmZiAt
LWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKLWluZGV4IGFhNzMyNTIuLjc2ZmNhZmQgMTAwNjQ0
CitpbmRleCAwNWFiNWYyLi41NzMyOGY4IDEwMDY0NAogLS0tIGEvTWFrZWZpbGUKICsrKyBiL01h
a2VmaWxlCiBAQCAtOCwxMiArOCw2IEBAIGlmZXEgKCQoc3RyaXAgJENDKSwpCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMta2VybmVsL21ha2VkdW1wZmlsZS9tYWtlZHVtcGZpbGVfMS43LjcuYmIg
Yi9tZXRhL3JlY2lwZXMta2VybmVsL21ha2VkdW1wZmlsZS9tYWtlZHVtcGZpbGVfMS43LjguYmIK
c2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWtlcm5lbC9tYWtl
ZHVtcGZpbGUvbWFrZWR1bXBmaWxlXzEuNy43LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMta2Vy
bmVsL21ha2VkdW1wZmlsZS9tYWtlZHVtcGZpbGVfMS43LjguYmIKaW5kZXggOTkzOTNlMDk4NC4u
NmI1ODI3MjlhMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9tYWtlZHVtcGZpbGUv
bWFrZWR1bXBmaWxlXzEuNy43LmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbWFrZWR1bXBm
aWxlL21ha2VkdW1wZmlsZV8xLjcuOC5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT03NTE0MTkyNjBhYTk1NDQ5OWY3YWJhYWJhYTg4MmJi
ZSIKIExJQ0VOU0UgPSAiR1BMLTIuMC1vbmx5IgogCiBTUkNCUkFOQ0ggPz0gIm1hc3RlciIKLVNS
Q1JFViA9ICJlNGFlNmI1ZWUwNGVkZWViMDNkYjg5YmVlMzcyOTA0MTU3ZTMzNzhkIgorU1JDUkVW
ID0gIjY1ZTBiNTQ4OGZmZTg0MDAzNWM2ZTE2NWE1MTQ5ZGM1ZGE3NjlkOTciCiAKIERFUEVORFMg
PSAiYnppcDIgemxpYiBlbGZ1dGlscyB4eiIKIFJERVBFTkRTOiR7UE59LXRvb2xzID0gInBlcmwg
JHtQTn0iCi0tIAoyLjQ3LjEKCg==

--===============5986139868976096339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/makedumpfile: PV changed from "1.7.7" to "1.7.8"
packages/x86-64-v3-poky-linux/makedumpfile: PKGV changed from 1.7.7 [default] to 1.7.8 [default]
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-dbg: PKGSIZE changed from 1231944 to 1233952 (+0%)
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-dbg: PV changed from "1.7.7" to "1.7.8"
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-dbg: PKGV changed from 1.7.7 [default] to 1.7.8 [default]
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-dev: PV changed from "1.7.7" to "1.7.8"
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-dev: PKGV changed from 1.7.7 [default] to 1.7.8 [default]
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-doc: PV changed from "1.7.7" to "1.7.8"
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-doc: PKGV changed from 1.7.7 [default] to 1.7.8 [default]
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-locale: PV changed from "1.7.7" to "1.7.8"
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-locale: PKGV changed from 1.7.7 [default] to 1.7.8 [default]
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-src: PKGSIZE changed from 691815 to 693112 (+0%)
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-src: PV changed from "1.7.7" to "1.7.8"
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-src: PKGV changed from 1.7.7 [default] to 1.7.8 [default]
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-src: FILELIST: directory renamed /usr/src/debug/makedumpfile/1.7.7/arch -> /usr/src/debug/makedumpfile/1.7.8/arch, directory renamed /usr/src/debug/makedumpfile/1.7.7 -> /usr/src/debug/makedumpfile/1.7.8
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-staticdev: PV changed from "1.7.7" to "1.7.8"
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-staticdev: PKGV changed from 1.7.7 [default] to 1.7.8 [default]
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-tools: PV changed from "1.7.7" to "1.7.8"
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile-tools: PKGV changed from 1.7.7 [default] to 1.7.8 [default]
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile: PV changed from "1.7.7" to "1.7.8"
packages/x86-64-v3-poky-linux/makedumpfile/makedumpfile: PKGV changed from 1.7.7 [default] to 1.7.8 [default]

--===============5986139868976096339==--

