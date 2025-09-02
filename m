Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F050ECAC591
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:42 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.89999.1756850187705338159
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VAq2A8xE;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rl9Gny50;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101990c6ea28b-7625a845-ad4c-4dfa-9dab-fcdda38a26a1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850201;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wo1a3mmEW3SECypYumFRb78tsJIKcqa9Ba3hl4OBKvI=;
	b=VAq2A8xE7ZYsOoFtdg0/x8CdEllh1M2NNlZTb8b5Ri1J1YTQdkGhkWDvJMRKie5d
	XbyiMvXwYamilrKOPTwd4AhMEN9p+CA5y3La0zQbilOWa/VUm1xwQaiklOCwo845S+F
	PVI/0/E0PmH50PtFBswb+XmPgq49i8FKwosmYVZ4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850201;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wo1a3mmEW3SECypYumFRb78tsJIKcqa9Ba3hl4OBKvI=;
	b=rl9Gny50LV0mbC+FQRmi4Fa9ZE37LwjWOqzBnK9vbPaYE9hdxotfu4AwFLLbprF+
	X0HGvd4yjd5c+MAyxXWzaKVLqQHMISzntiDcgZ1VrxKKfsSxpaiIg5hM3sHB4Osb8t8
	PQMTcL756XNxZSh/XmiM0n9BCEWHtxHd/6g92cNE=
Content-Type: multipart/mixed; boundary="===============5739737917294127273=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.29.1 SUCCEEDED
Message-ID: <010101990c6ea28b-7625a845-ad4c-4dfa-9dab-fcdda38a26a1-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222816

--===============5739737917294127273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libinput* to *1.29.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libinput-upgrade-1.29.0-1.29.1.patch
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
From 559e37c41325d3a11a99a6834e66ef635b79b7cc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 20:47:58 +0000
Subject: [PATCH] libinput: upgrade 1.29.0 -> 1.29.1

---
 .../wayland/{libinput_1.29.0.bb => libinput_1.29.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.29.0.bb => libinput_1.29.1.bb} (94%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.29.0.bb b/meta/recipes-graphics/wayland/libinput_1.29.1.bb
similarity index 94%
rename from meta/recipes-graphics/wayland/libinput_1.29.0.bb
rename to meta/recipes-graphics/wayland/libinput_1.29.1.bb
index f38532a0c2..79df97ac06 100644
--- a/meta/recipes-graphics/wayland/libinput_1.29.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.29.1.bb
@@ -12,10 +12,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bab4ac7dc1c10bc0fb037dc76c46ef8a"
 
 DEPENDS = "libevdev udev mtdev"
 
-SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main;tag=${PV} \
+SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=1.29-branch;tag=${PV} \
            file://run-ptest \
            "
-SRCREV = "936cee224267a7d21c87c06203cd866c1572df20"
+SRCREV = "dc2c1ad181be88e1487468f7ca6f9d320981f133"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.47.1


--===============5739737917294127273==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libinput-upgrade-1.29.0-1.29.1.patch"

RnJvbSA1NTllMzdjNDEzMjVkM2ExMWE5OWE2ODM0ZTY2ZWY2MzViNzliN2NjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAyMDo0Nzo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmlucHV0OiB1cGdyYWRlIDEuMjkuMCAtPiAxLjI5LjEKCi0tLQogLi4uL3dheWxhbmQve2xpYmlu
cHV0XzEuMjkuMC5iYiA9PiBsaWJpbnB1dF8xLjI5LjEuYmJ9ICAgICAgICB8IDQgKystLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC97bGliaW5wdXRfMS4yOS4wLmJiID0+IGxpYmlucHV0
XzEuMjkuMS5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5
bGFuZC9saWJpbnB1dF8xLjI5LjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC9s
aWJpbnB1dF8xLjI5LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvbGliaW5wdXRfMS4yOS4wLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC9saWJpbnB1dF8xLjI5LjEuYmIKaW5kZXggZjM4NTMy
YTBjMi4uNzlkZjk3YWMwNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxh
bmQvbGliaW5wdXRfMS4yOS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5k
L2xpYmlucHV0XzEuMjkuMS5iYgpAQCAtMTIsMTAgKzEyLDEwIEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PWJhYjRhYzdkYzFjMTBiYzBmYjAzN2RjNzZjNDZlZjhhIgog
CiBERVBFTkRTID0gImxpYmV2ZGV2IHVkZXYgbXRkZXYiCiAKLVNSQ19VUkkgPSAiZ2l0Oi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9saWJpbnB1dC9saWJpbnB1dC5naXQ7cHJvdG9jb2w9aHR0cHM7
YnJhbmNoPW1haW47dGFnPSR7UFZ9IFwKK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNr
dG9wLm9yZy9saWJpbnB1dC9saWJpbnB1dC5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPTEuMjkt
YnJhbmNoO3RhZz0ke1BWfSBcCiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAg
ICAgICAiCi1TUkNSRVYgPSAiOTM2Y2VlMjI0MjY3YTdkMjFjODdjMDYyMDNjZDg2NmMxNTcyZGYy
MCIKK1NSQ1JFViA9ICJkYzJjMWFkMTgxYmU4OGUxNDg3NDY4ZjdjYTZmOWQzMjA5ODFmMTMzIgog
CiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJsaWJpbnB1dC0oP1A8cHZlcj5cZCtcLlxkK1wuKD8h
OVxkKylcZCspIgogCi0tIAoyLjQ3LjEKCg==

--===============5739737917294127273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libinput: PV changed from "1.29.0" to "1.29.1"
packages/x86-64-v3-poky-linux/libinput: PKGV changed from 1.29.0 [default] to 1.29.1 [default]
packages/x86-64-v3-poky-linux/libinput: SRC_URI changed from "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main;tag=1.29.0 file://run-ptest" to "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=1.29-branch;tag=1.29.1 file://run-ptest"
packages/x86-64-v3-poky-linux/libinput/libinput-bin: PV changed from "1.29.0" to "1.29.1"
packages/x86-64-v3-poky-linux/libinput/libinput-bin: PKGV changed from 1.29.0 [default] to 1.29.1 [default]
packages/x86-64-v3-poky-linux/libinput/libinput-dbg: PV changed from "1.29.0" to "1.29.1"
packages/x86-64-v3-poky-linux/libinput/libinput-dbg: PKGV changed from 1.29.0 [default] to 1.29.1 [default]
packages/x86-64-v3-poky-linux/libinput/libinput-dbg: PKGSIZE changed from 8713816 to 8714624 (+0%)
packages/x86-64-v3-poky-linux/libinput/libinput-dev: PV changed from "1.29.0" to "1.29.1"
packages/x86-64-v3-poky-linux/libinput/libinput-dev: PKGV changed from 1.29.0 [default] to 1.29.1 [default]
packages/x86-64-v3-poky-linux/libinput/libinput-doc: PV changed from "1.29.0" to "1.29.1"
packages/x86-64-v3-poky-linux/libinput/libinput-doc: PKGV changed from 1.29.0 [default] to 1.29.1 [default]
packages/x86-64-v3-poky-linux/libinput/libinput-locale: PV changed from "1.29.0" to "1.29.1"
packages/x86-64-v3-poky-linux/libinput/libinput-locale: PKGV changed from 1.29.0 [default] to 1.29.1 [default]
packages/x86-64-v3-poky-linux/libinput/libinput-ptest: PV changed from "1.29.0" to "1.29.1"
packages/x86-64-v3-poky-linux/libinput/libinput-ptest: PKGV changed from 1.29.0 [default] to 1.29.1 [default]
packages/x86-64-v3-poky-linux/libinput/libinput-src: PV changed from "1.29.0" to "1.29.1"
packages/x86-64-v3-poky-linux/libinput/libinput-src: PKGV changed from 1.29.0 [default] to 1.29.1 [default]
packages/x86-64-v3-poky-linux/libinput/libinput-staticdev: PV changed from "1.29.0" to "1.29.1"
packages/x86-64-v3-poky-linux/libinput/libinput-staticdev: PKGV changed from 1.29.0 [default] to 1.29.1 [default]
packages/x86-64-v3-poky-linux/libinput/libinput: PV changed from "1.29.0" to "1.29.1"
packages/x86-64-v3-poky-linux/libinput/libinput: PKGV changed from 1.29.0 [default] to 1.29.1 [default]
packages/x86-64-v3-poky-linux/libinput/libinput: PKGSIZE changed from 1651745 to 1652228 (+0%)
packages/x86-64-v3-poky-linux/libinput/libinput: FILELIST: added "/usr/share/libinput/50-system-tongfang.quirks"
Changes to packages/x86-64-v3-poky-linux/libinput (sysroot):
  /usr/share/libinput/50-system-tongfang.quirks was added

--===============5739737917294127273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libinput/libinput: FILELIST: added "/usr/share/libinput/50-system-tongfang.quirks"
Changes to packages/x86-64-v3-poky-linux/libinput (sysroot):
  /usr/share/libinput/50-system-tongfang.quirks was added

--===============5739737917294127273==--

