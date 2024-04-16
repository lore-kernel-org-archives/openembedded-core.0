Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C280C3065E
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:13 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.13579.1713248036884918981
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MIWxEww6;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=nStxe+Aq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018ee58a64fc-1802c7ad-40a5-418c-b87b-b95977550c48-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248036;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nihnrOL8q8ezTqY1P5iMrUNMcHcp2ChM8ROODhiT/vw=;
	b=MIWxEww6B/Z89I12K+2eKNcDU9SduppG5nqymteAYWXRb301ebX/Jz42rsTL90va
	NFVRicFfjtvgdh1aHbw7vFVNOwgykKaeAPf2odqKkSjfaE4eRneMrtG7XnZ4K6vqcNr
	eYp3gs34iaF7j+TWYVnoOflGui78zNL9ZCNRsTEM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248036;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nihnrOL8q8ezTqY1P5iMrUNMcHcp2ChM8ROODhiT/vw=;
	b=nStxe+AqkCDs2WMdKHKcxZCwAZ+lmWjzLQ/QSXzzeBDuZHRUv/55Q6eauJjzns1I
	sACyBM0GD6BW/IZT/HKAlQt/lG2f6J44iIpBZC9ze6GYscEfc65J1CyhiAJASqHOe8N
	BXEkERrDqkw2C1P8WuOI7lRLV4iF5fRl6lU66ON8=
Content-Type: multipart/mixed; boundary="===============8219413524950634892=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] u-boot: upgrading to 2024.04 SUCCEEDED
Message-ID: <0101018ee58a64fc-1802c7ad-40a5-418c-b87b-b95977550c48-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:56 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198249

--===============8219413524950634892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *u-boot* to *2024.04* has Succeeded.

Next steps:
    - apply the patch: git am 0001-u-boot-upgrade-2024.01-2024.04.patch
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
From 54962184639e1d64fa522e66a5724bda14c1e259 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 17:19:00 +0000
Subject: [PATCH] u-boot: upgrade 2024.01 -> 2024.04

---
 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 .../recipes-bsp/u-boot/{u-boot_2024.01.bb => u-boot_2024.04.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot_2024.01.bb => u-boot_2024.04.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 1f17bd7d0a..ca5357392a 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "866ca972d6c3cabeaf6dbac431e8e08bb30b3c8e"
+SRCREV = "25049ad560826f7dc1c4740883b0016014a59789"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot_2024.01.bb b/meta/recipes-bsp/u-boot/u-boot_2024.04.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2024.01.bb
rename to meta/recipes-bsp/u-boot/u-boot_2024.04.bb
-- 
2.42.0


--===============8219413524950634892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/qemux86_64-poky-linux/u-boot (sysroot):
  /boot/u-boot.bin changed symlink target from u-boot-qemux86-64-2024.01-r0.bin to u-boot-qemux86-64-2024.04-r0.bin
  /boot/u-boot-qemux86-64-2024.01-r0.bin moved to /boot/u-boot-qemux86-64-2024.04-r0.bin
packages/qemux86_64-poky-linux/u-boot/u-boot-env: FILELIST: removed "/etc/u-boot-initial-env-qemux86-64-2024.01-r0", added "/etc/u-boot-initial-env-qemux86-64-2024.04-r0"
packages/qemux86_64-poky-linux/u-boot/u-boot: FILELIST: removed "/boot/u-boot-qemux86-64-2024.01-r0.bin", added "/boot/u-boot-qemux86-64-2024.04-r0.bin"

--===============8219413524950634892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/qemux86_64-poky-linux/u-boot: PV changed from "2024.01" to "2024.04"
packages/qemux86_64-poky-linux/u-boot: PKGV changed from 2024.01 [default] to 2024.04 [default]
Changes to packages/qemux86_64-poky-linux/u-boot (sysroot):
  /boot/u-boot.bin changed symlink target from u-boot-qemux86-64-2024.01-r0.bin to u-boot-qemux86-64-2024.04-r0.bin
  /boot/u-boot-qemux86-64-2024.01-r0.bin moved to /boot/u-boot-qemux86-64-2024.04-r0.bin
packages/qemux86_64-poky-linux/u-boot/u-boot-dbg: PV changed from "2024.01" to "2024.04"
packages/qemux86_64-poky-linux/u-boot/u-boot-dbg: PKGV changed from 2024.01 [default] to 2024.04 [default]
packages/qemux86_64-poky-linux/u-boot/u-boot-dev: PV changed from "2024.01" to "2024.04"
packages/qemux86_64-poky-linux/u-boot/u-boot-dev: PKGV changed from 2024.01 [default] to 2024.04 [default]
packages/qemux86_64-poky-linux/u-boot/u-boot-doc: PV changed from "2024.01" to "2024.04"
packages/qemux86_64-poky-linux/u-boot/u-boot-doc: PKGV changed from 2024.01 [default] to 2024.04 [default]
packages/qemux86_64-poky-linux/u-boot/u-boot-env: PV changed from "2024.01" to "2024.04"
packages/qemux86_64-poky-linux/u-boot/u-boot-env: PKGV changed from 2024.01 [default] to 2024.04 [default]
packages/qemux86_64-poky-linux/u-boot/u-boot-env: FILELIST: removed "/etc/u-boot-initial-env-qemux86-64-2024.01-r0", added "/etc/u-boot-initial-env-qemux86-64-2024.04-r0"
packages/qemux86_64-poky-linux/u-boot/u-boot-extlinux: PV changed from "2024.01" to "2024.04"
packages/qemux86_64-poky-linux/u-boot/u-boot-extlinux: PKGV changed from 2024.01 [default] to 2024.04 [default]
packages/qemux86_64-poky-linux/u-boot/u-boot-locale: PV changed from "2024.01" to "2024.04"
packages/qemux86_64-poky-linux/u-boot/u-boot-locale: PKGV changed from 2024.01 [default] to 2024.04 [default]
packages/qemux86_64-poky-linux/u-boot/u-boot-src: PV changed from "2024.01" to "2024.04"
packages/qemux86_64-poky-linux/u-boot/u-boot-src: PKGV changed from 2024.01 [default] to 2024.04 [default]
packages/qemux86_64-poky-linux/u-boot/u-boot-staticdev: PV changed from "2024.01" to "2024.04"
packages/qemux86_64-poky-linux/u-boot/u-boot-staticdev: PKGV changed from 2024.01 [default] to 2024.04 [default]
packages/qemux86_64-poky-linux/u-boot/u-boot: PV changed from "2024.01" to "2024.04"
packages/qemux86_64-poky-linux/u-boot/u-boot: PKGV changed from 2024.01 [default] to 2024.04 [default]
packages/qemux86_64-poky-linux/u-boot/u-boot: FILELIST: removed "/boot/u-boot-qemux86-64-2024.01-r0.bin", added "/boot/u-boot-qemux86-64-2024.04-r0.bin"
packages/qemux86_64-poky-linux/u-boot/u-boot: PKGSIZE changed from 853530 to 857786 (+0%)

--===============8219413524950634892==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-u-boot-upgrade-2024.01-2024.04.patch"

RnJvbSA1NDk2MjE4NDYzOWUxZDY0ZmE1MjJlNjZhNTcyNGJkYTE0YzFlMjU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTc6MTk6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
LWJvb3Q6IHVwZ3JhZGUgMjAyNC4wMSAtPiAyMDI0LjA0CgotLS0KIG1ldGEvcmVjaXBlcy1ic3Av
dS1ib290L3UtYm9vdC1jb21tb24uaW5jICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIC4u
Li9yZWNpcGVzLWJzcC91LWJvb3Qve3UtYm9vdF8yMDI0LjAxLmJiID0+IHUtYm9vdF8yMDI0LjA0
LmJifSB8IDAKIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC97dS1ib290XzIwMjQuMDEuYmIgPT4gdS1i
b290XzIwMjQuMDQuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ic3AvdS1i
b290L3UtYm9vdC1jb21tb24uaW5jIGIvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290LWNv
bW1vbi5pbmMKaW5kZXggMWYxN2JkN2QwYS4uY2E1MzU3MzkyYSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWJzcC91LWJvb3QvdS1ib290LWNvbW1vbi5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWJz
cC91LWJvb3QvdS1ib290LWNvbW1vbi5pbmMKQEAgLTEyLDcgKzEyLDcgQEAgUEUgPSAiMSIKIAog
IyBXZSB1c2UgdGhlIHJldmlzaW9uIGluIG9yZGVyIHRvIGF2b2lkIGhhdmluZyB0byBmZXRjaCBp
dCBmcm9tIHRoZQogIyByZXBvIGR1cmluZyBwYXJzZQotU1JDUkVWID0gIjg2NmNhOTcyZDZjM2Nh
YmVhZjZkYmFjNDMxZThlMDhiYjMwYjNjOGUiCitTUkNSRVYgPSAiMjUwNDlhZDU2MDgyNmY3ZGMx
YzQ3NDA4ODNiMDAxNjAxNGE1OTc4OSIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9zb3VyY2UuZGVueC5k
ZS91LWJvb3QvdS1ib290LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIgogCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC91LWJvb3RfMjAyNC4wMS5iYiBiL21ldGEv
cmVjaXBlcy1ic3AvdS1ib290L3UtYm9vdF8yMDI0LjA0LmJiCnNpbWlsYXJpdHkgaW5kZXggMTAw
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC91LWJvb3RfMjAyNC4wMS5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290XzIwMjQuMDQuYmIKLS0gCjIu
NDIuMAoK

--===============8219413524950634892==--

