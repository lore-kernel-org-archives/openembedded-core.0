Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B29C5DF74
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 05:20:39 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23742.1786944029763659252
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 22:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hCqa0tB3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jqvpgxyd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a00e29fff0-3d38c2e3-56e3-4a41-a92d-0c30b9dc35a3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786944028;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RkP1IUONgjkDJ5GDBYbeU45Mfko1ORsnDoitGTM0NGc=;
	b=hCqa0tB3sXpR6WD7xLsKh2KMsoT5b+9gjFloiG4NfxCRgD8ZlcEAQ3SWVWg2AHkB
	SI4Nbv9aRdjjG46xBpC1Go8SK/ICBZPvhSHd7rIeBFl3EC/r9dX1511/upWVo4LcwZf
	azYwaYGkolDhBtyNj3Y8f7oiTS3tx4GBxfDUCdvo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786944028;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RkP1IUONgjkDJ5GDBYbeU45Mfko1ORsnDoitGTM0NGc=;
	b=jqvpgxydHpXjCnuQdQuE+AAjTKfUZhRwYxyM4k7YmTSp2fqqodJ0Xkh+nIjRIchF
	iPNCAeXTjh2G6/OvY3A+aNHlLV4fejOpKb4ax08DA5158MqQWaXavBh4kjeH4YDKOux
	4tfgroG6cMyCLxDPRl366g3YZR7Vrtc1Qe2qazu0=
Content-Type: multipart/mixed; boundary="===============8281204770124912393=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] makedepend: upgrading to 1.0.10 SUCCEEDED
Message-ID: <010101a00e29fff0-3d38c2e3-56e3-4a41-a92d-0c30b9dc35a3-000000@us-west-2.amazonses.com>
Date: Mon, 17 Aug 2026 05:20:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.17-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 05:20:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243591

--===============8281204770124912393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *makedepend* to *1.0.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-makedepend-upgrade-1.0.9-1.0.10.patch
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
From 3fd684c51f10173934a821a7b6a66d2eee4f7f3f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 17 Aug 2026 05:07:20 +0000
Subject: [PATCH] makedepend: upgrade 1.0.9 -> 1.0.10

Source: ChangeLog

makedepend 1.0.10
meson: include headers when checking for functions
meson: Add option to build with meson
gitlab CI: drop the ci-fairy check-mr job
Improve man page formatting
---
 .../xorg-util/{makedepend_1.0.9.bb => makedepend_1.0.10.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-util/{makedepend_1.0.9.bb => makedepend_1.0.10.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-util/makedepend_1.0.9.bb b/meta/recipes-graphics/xorg-util/makedepend_1.0.10.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-util/makedepend_1.0.9.bb
rename to meta/recipes-graphics/xorg-util/makedepend_1.0.10.bb
index 6db7d04079..643624485c 100644
--- a/meta/recipes-graphics/xorg-util/makedepend_1.0.9.bb
+++ b/meta/recipes-graphics/xorg-util/makedepend_1.0.10.bb
@@ -17,4 +17,4 @@ BBCLASSEXTEND = "native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=43a6eda34b48ee821b3b66f4f753ce4f"
 
-SRC_URI[sha256sum] = "bc94ffda6cd4671603a69c39dbe8f96b317707b9185b2aaa3b54b5d134b41884"
+SRC_URI[sha256sum] = "baf742fb6c76c15febf5181e5cd814066205d8be9aef4abfdc2c54b235e14917"
-- 
2.47.1


--===============8281204770124912393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/makedepend: SRC_URI changed from "https://www.x.org/releases//individual/util/makedepend-1.0.9.tar.gz" to "https://www.x.org/releases//individual/util/makedepend-1.0.10.tar.gz"
packages/x86-64-v3-poky-linux/makedepend: PV changed from "1.0.9" to "1.0.10"
packages/x86-64-v3-poky-linux/makedepend: PKGV changed from 1.0.9 [default] to 1.0.10 [default]
packages/x86-64-v3-poky-linux/makedepend/makedepend-dbg: PKGSIZE changed from 102728 to 102736 (+0%)
packages/x86-64-v3-poky-linux/makedepend/makedepend-dbg: PV changed from "1.0.9" to "1.0.10"
packages/x86-64-v3-poky-linux/makedepend/makedepend-dbg: PKGV changed from 1.0.9 [default] to 1.0.10 [default]
packages/x86-64-v3-poky-linux/makedepend/makedepend-dev: PV changed from "1.0.9" to "1.0.10"
packages/x86-64-v3-poky-linux/makedepend/makedepend-dev: PKGV changed from 1.0.9 [default] to 1.0.10 [default]
packages/x86-64-v3-poky-linux/makedepend/makedepend-doc: PKGSIZE changed from 9539 to 9659 (+1%)
packages/x86-64-v3-poky-linux/makedepend/makedepend-doc: PV changed from "1.0.9" to "1.0.10"
packages/x86-64-v3-poky-linux/makedepend/makedepend-doc: PKGV changed from 1.0.9 [default] to 1.0.10 [default]
packages/x86-64-v3-poky-linux/makedepend/makedepend-locale: PV changed from "1.0.9" to "1.0.10"
packages/x86-64-v3-poky-linux/makedepend/makedepend-locale: PKGV changed from 1.0.9 [default] to 1.0.10 [default]
packages/x86-64-v3-poky-linux/makedepend/makedepend-src: PV changed from "1.0.9" to "1.0.10"
packages/x86-64-v3-poky-linux/makedepend/makedepend-src: FILELIST: directory renamed /usr/src/debug/makedepend/1.0.9 -> /usr/src/debug/makedepend/1.0.10
packages/x86-64-v3-poky-linux/makedepend/makedepend-src: PKGV changed from 1.0.9 [default] to 1.0.10 [default]
packages/x86-64-v3-poky-linux/makedepend/makedepend-staticdev: PV changed from "1.0.9" to "1.0.10"
packages/x86-64-v3-poky-linux/makedepend/makedepend-staticdev: PKGV changed from 1.0.9 [default] to 1.0.10 [default]
packages/x86-64-v3-poky-linux/makedepend/makedepend: PV changed from "1.0.9" to "1.0.10"
packages/x86-64-v3-poky-linux/makedepend/makedepend: PKGV changed from 1.0.9 [default] to 1.0.10 [default]

--===============8281204770124912393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="makedepend-changelog.txt"

Changelog for makedepend: 1.0.9 -> 1.0.10
Source: ChangeLog

makedepend 1.0.10
meson: include headers when checking for functions
meson: Add option to build with meson
gitlab CI: drop the ci-fairy check-mr job
Improve man page formatting

--===============8281204770124912393==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-makedepend-upgrade-1.0.9-1.0.10.patch"

RnJvbSAzZmQ2ODRjNTFmMTAxNzM5MzRhODIxYTdiNmE2NmQyZWVlNGY3ZjNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTcgQXVnIDIwMjYgMDU6MDc6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
YWtlZGVwZW5kOiB1cGdyYWRlIDEuMC45IC0+IDEuMC4xMAoKU291cmNlOiBDaGFuZ2VMb2cKCm1h
a2VkZXBlbmQgMS4wLjEwCm1lc29uOiBpbmNsdWRlIGhlYWRlcnMgd2hlbiBjaGVja2luZyBmb3Ig
ZnVuY3Rpb25zCm1lc29uOiBBZGQgb3B0aW9uIHRvIGJ1aWxkIHdpdGggbWVzb24KZ2l0bGFiIENJ
OiBkcm9wIHRoZSBjaS1mYWlyeSBjaGVjay1tciBqb2IKSW1wcm92ZSBtYW4gcGFnZSBmb3JtYXR0
aW5nCi0tLQogLi4uL3hvcmctdXRpbC97bWFrZWRlcGVuZF8xLjAuOS5iYiA9PiBtYWtlZGVwZW5k
XzEuMC4xMC5iYn0gICAgIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctdXRpbC97bWFr
ZWRlcGVuZF8xLjAuOS5iYiA9PiBtYWtlZGVwZW5kXzEuMC4xMC5iYn0gKDg4JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy11dGlsL21ha2VkZXBlbmRfMS4wLjkuYmIg
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy11dGlsL21ha2VkZXBlbmRfMS4wLjEwLmJiCnNp
bWlsYXJpdHkgaW5kZXggODglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3Jn
LXV0aWwvbWFrZWRlcGVuZF8xLjAuOS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3hvcmctdXRpbC9tYWtlZGVwZW5kXzEuMC4xMC5iYgppbmRleCA2ZGI3ZDA0MDc5Li42NDM2MjQ0
ODVjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy11dGlsL21ha2VkZXBl
bmRfMS4wLjkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctdXRpbC9tYWtlZGVw
ZW5kXzEuMC4xMC5iYgpAQCAtMTcsNCArMTcsNCBAQCBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSIK
IAogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NDNhNmVkYTM0YjQ4ZWU4
MjFiM2I2NmY0Zjc1M2NlNGYiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiYzk0ZmZkYTZjZDQ2
NzE2MDNhNjljMzlkYmU4Zjk2YjMxNzcwN2I5MTg1YjJhYWEzYjU0YjVkMTM0YjQxODg0IgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gImJhZjc0MmZiNmM3NmMxNWZlYmY1MTgxZTVjZDgxNDA2NjIwNWQ4
YmU5YWVmNGFiZmRjMmM1NGIyMzVlMTQ5MTciCi0tIAoyLjQ3LjEKCg==

--===============8281204770124912393==--

