Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEACAC369DC
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:55 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.1806.1746113613097356396
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ZVl4vDZ0;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Gz1OHmcw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101968c7ba016-926fca46-d43d-46df-ae13-e4b456226ac1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=S5og+bf29Y0UCf18DvMRqTwcjPvc3FJH+X3fx32+py8=;
	b=ZVl4vDZ06LgK8InQj/KpOFOg4ADfOQpwAVtAC1/fCWsBmtthQO6qTk15rYI7tDfv
	b01i6B1ETxs+fZsoEXb9Whxswfdwcp9OZIZuJgb5GpzzVxcHBEn3s8v91QH9R5Ez0IE
	mNl8ftR/aMRJ4pUgbnxdjcRCytRbHUrTU/CP2w6A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=S5og+bf29Y0UCf18DvMRqTwcjPvc3FJH+X3fx32+py8=;
	b=Gz1OHmcw/5MKwpgxjjKxcqcOzAidqFt/akUVTXdfkQdxMWnZSzMFX7doisUaG1mt
	EXl9Dr98TnWLQWhdEBUpmTPIGj6NOGghqyHpllL814JdVIhaLmdqAVNG9W3oCls93ir
	yrJigDvJzrUW4gd0cX2hFnh1SfP4nuxpdlyGV5IA=
Content-Type: multipart/mixed; boundary="===============8539560430814721468=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libxkbcommon: upgrading to 1.9.0 SUCCEEDED
Message-ID: <010101968c7ba016-926fca46-d43d-46df-ae13-e4b456226ac1-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215872

--===============8539560430814721468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxkbcommon* to *1.9.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxkbcommon-upgrade-1.8.1-1.9.0.patch
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
From c11425b6890bd619381cea51b552dc8f26dfe4a3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 13:06:32 +0000
Subject: [PATCH] libxkbcommon: upgrade 1.8.1 -> 1.9.0

---
 .../xorg-lib/{libxkbcommon_1.8.1.bb => libxkbcommon_1.9.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.8.1.bb => libxkbcommon_1.9.0.bb} (96%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.9.0.bb
similarity index 96%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.9.0.bb
index 76a622e157..2500ecbe2f 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.9.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "git://github.com/xkbcommon/libxkbcommon;protocol=https;branch=master"
 
-SRCREV = "b3465081878e80ca6c11fe35c81787ec374ec15a"
+SRCREV = "ee1a98c5b3ba1f1981c5dfbea1a054cf7ad00140"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig bash-completion
-- 
2.47.1


--===============8539560430814721468==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxkbcommon-upgrade-1.8.1-1.9.0.patch"

RnJvbSBjMTE0MjViNjg5MGJkNjE5MzgxY2VhNTFiNTUyZGM4ZjI2ZGZlNGEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAxMzowNjozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhrYmNvbW1vbjogdXBncmFkZSAxLjguMSAtPiAxLjkuMAoKLS0tCiAuLi4veG9yZy1saWIve2xp
YnhrYmNvbW1vbl8xLjguMS5iYiA9PiBsaWJ4a2Jjb21tb25fMS45LjAuYmJ9ICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIve2xpYnhrYmNvbW1vbl8xLjguMS5iYiA9PiBsaWJ4
a2Jjb21tb25fMS45LjAuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3hvcmctbGliL2xpYnhrYmNvbW1vbl8xLjguMS5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy94b3JnLWxpYi9saWJ4a2Jjb21tb25fMS45LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhrYmNvbW1vbl8xLjgu
MS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhrYmNvbW1v
bl8xLjkuMC5iYgppbmRleCA3NmE2MjJlMTU3Li4yNTAwZWNiZTJmIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieGtiY29tbW9uXzEuOC4xLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4a2Jjb21tb25fMS45LjAuYmIKQEAgLTks
NyArOSw3IEBAIERFUEVORFMgPSAiZmxleC1uYXRpdmUgYmlzb24tbmF0aXZlIgogCiBTUkNfVVJJ
ID0gImdpdDovL2dpdGh1Yi5jb20veGtiY29tbW9uL2xpYnhrYmNvbW1vbjtwcm90b2NvbD1odHRw
czticmFuY2g9bWFzdGVyIgogCi1TUkNSRVYgPSAiYjM0NjUwODE4NzhlODBjYTZjMTFmZTM1Yzgx
Nzg3ZWMzNzRlYzE1YSIKK1NSQ1JFViA9ICJlZTFhOThjNWIzYmExZjE5ODFjNWRmYmVhMWEwNTRj
ZjdhZDAwMTQwIgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogaW5oZXJpdCBtZXNvbiBwa2djb25m
aWcgYmFzaC1jb21wbGV0aW9uCi0tIAoyLjQ3LjEKCg==

--===============8539560430814721468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libxkbcommon: PV changed from "1.8.1" to "1.9.0"
packages/core2-64-poky-linux/libxkbcommon: PKGV changed from 1.8.1 [default] to 1.9.0 [default]
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-bash-completion: PKGSIZE changed from 3698 to 3942 (+7%)
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-bash-completion: PV changed from "1.8.1" to "1.9.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-bash-completion: PKGV changed from 1.8.1 [default] to 1.9.0 [default]
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-dbg: PKGSIZE changed from 1499464 to 1557512 (+4%)
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-dbg: PV changed from "1.8.1" to "1.9.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-dbg: FILELIST: removed "/usr/lib/.debug/libxkbcommon-x11.so.0.8.1 /usr/lib/.debug/libxkbcommon.so.0.8.1 /usr/lib/.debug/libxkbregistry.so.0.8.1", added "/usr/lib/.debug/libxkbregistry.so.0.9.0 /usr/lib/.debug/libxkbcommon-x11.so.0.9.0 /usr/lib/.debug/libxkbcommon.so.0.9.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-dbg: PKGV changed from 1.8.1 [default] to 1.9.0 [default]
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-dev: PKGSIZE changed from 375883 to 378118 (+1%)
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-dev: PV changed from "1.8.1" to "1.9.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-dev: PKGV changed from 1.8.1 [default] to 1.9.0 [default]
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-doc: PKGSIZE changed from 12475 to 12582 (+1%)
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-doc: PV changed from "1.8.1" to "1.9.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-doc: PKGV changed from 1.8.1 [default] to 1.9.0 [default]
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-locale: PV changed from "1.8.1" to "1.9.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-locale: PKGV changed from 1.8.1 [default] to 1.9.0 [default]
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-src: PKGSIZE changed from 325504 to 338177 (+4%)
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-src: PV changed from "1.8.1" to "1.9.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-src: PKGV changed from 1.8.1 [default] to 1.9.0 [default]
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-staticdev: PV changed from "1.8.1" to "1.9.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-staticdev: PKGV changed from 1.8.1 [default] to 1.9.0 [default]
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-x11: PV changed from "1.8.1" to "1.9.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-x11: FILELIST: removed "/usr/lib/libxkbcommon-x11.so.0.8.1", added "/usr/lib/libxkbcommon-x11.so.0.9.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-x11: PKGV changed from 1.8.1 [default] to 1.9.0 [default]
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-x11: FILES: removed "/usr/lib/libxkbcommon-x11.so.0.8.1", added "/usr/lib/libxkbcommon-x11.so.0.9.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon: PKGSIZE changed from 321613 to 337997 (+5%)
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon: PV changed from "1.8.1" to "1.9.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon: FILELIST: removed "/usr/lib/libxkbcommon.so.0.8.1", added "/usr/lib/libxkbcommon.so.0.9.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon: PKGV changed from 1.8.1 [default] to 1.9.0 [default]
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon: FILES: removed "/usr/lib/libxkbcommon.so.0.8.1", added "/usr/lib/libxkbcommon.so.0.9.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbregistry: PV changed from "1.8.1" to "1.9.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbregistry: FILELIST: removed "/usr/lib/libxkbregistry.so.0.8.1", added "/usr/lib/libxkbregistry.so.0.9.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbregistry: PKGV changed from 1.8.1 [default] to 1.9.0 [default]
packages/core2-64-poky-linux/libxkbcommon/libxkbregistry: FILES: removed "/usr/lib/libxkbregistry.so.0.8.1", added "/usr/lib/libxkbregistry.so.0.9.0"
Changes to packages/core2-64-poky-linux/libxkbcommon (sysroot):
  /usr/lib/libxkbcommon.so.0 changed symlink target from libxkbcommon.so.0.8.1 to libxkbcommon.so.0.9.0
  /usr/lib/libxkbcommon-x11.so.0 changed symlink target from libxkbcommon-x11.so.0.8.1 to libxkbcommon-x11.so.0.9.0
  /usr/lib/libxkbregistry.so.0 changed symlink target from libxkbregistry.so.0.8.1 to libxkbregistry.so.0.9.0
  /usr/lib/libxkbcommon.so.0.8.1 moved to /usr/lib/libxkbcommon.so.0.9.0
  /usr/lib/libxkbcommon-x11.so.0.8.1 moved to /usr/lib/libxkbcommon-x11.so.0.9.0
  /usr/lib/libxkbregistry.so.0.8.1 moved to /usr/lib/libxkbregistry.so.0.9.0
packages/core2-64-poky-linux/libxkbcommon/xkbcli: PKGSIZE changed from 265416 to 265448 (+0%)
packages/core2-64-poky-linux/libxkbcommon/xkbcli: PV changed from "1.8.1" to "1.9.0"
packages/core2-64-poky-linux/libxkbcommon/xkbcli: PKGV changed from 1.8.1 [default] to 1.9.0 [default]

--===============8539560430814721468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libxkbcommon/libxkbcommon-x11: FILELIST: removed "/usr/lib/libxkbcommon-x11.so.0.8.1", added "/usr/lib/libxkbcommon-x11.so.0.9.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbcommon: FILELIST: removed "/usr/lib/libxkbcommon.so.0.8.1", added "/usr/lib/libxkbcommon.so.0.9.0"
packages/core2-64-poky-linux/libxkbcommon/libxkbregistry: FILELIST: removed "/usr/lib/libxkbregistry.so.0.8.1", added "/usr/lib/libxkbregistry.so.0.9.0"
Changes to packages/core2-64-poky-linux/libxkbcommon (sysroot):
  /usr/lib/libxkbcommon.so.0 changed symlink target from libxkbcommon.so.0.8.1 to libxkbcommon.so.0.9.0
  /usr/lib/libxkbcommon-x11.so.0 changed symlink target from libxkbcommon-x11.so.0.8.1 to libxkbcommon-x11.so.0.9.0
  /usr/lib/libxkbregistry.so.0 changed symlink target from libxkbregistry.so.0.8.1 to libxkbregistry.so.0.9.0
  /usr/lib/libxkbcommon.so.0.8.1 moved to /usr/lib/libxkbcommon.so.0.9.0
  /usr/lib/libxkbcommon-x11.so.0.8.1 moved to /usr/lib/libxkbcommon-x11.so.0.9.0
  /usr/lib/libxkbregistry.so.0.8.1 moved to /usr/lib/libxkbregistry.so.0.9.0

--===============8539560430814721468==--

