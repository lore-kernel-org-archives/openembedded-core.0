Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7FDAD5E396
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:52 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17383.1765872127805893802
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kGVcWhHQ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Hg2IuM8y;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019b262ef347-6ae378ba-16f4-440f-bf35-3254cf1475cd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=whaiPM+X1YaryHds9hr5WNoQDYX8CSw7UBIdXwwGs/o=;
	b=kGVcWhHQAtkXee8Kx12jLYH/GSN3199chabAUXO8FCrROXI/AalE6JFUN9CCa8nh
	kKvHWCn5a8MNuxlLmEqGMcv6KMncuE4jLgUCKPFhi7tK/e+VHWU3PfIwzEW2sX3jEmh
	jJ7OV9dR99fVl1Dmu71hYzTvkUz2uCjeAQ4IX7jg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=whaiPM+X1YaryHds9hr5WNoQDYX8CSw7UBIdXwwGs/o=;
	b=Hg2IuM8ym1+Co8LE34dXh2TlxfafKrOB+HdZFDdKzw3a8tcOMwFHi2+rbhXy4l/r
	JCVwFjXt6IT1myJLttd6zkESK7yhwVnCzQi19Ro789G4xbK7O9OYZe7Qp5a8YAE9w53
	NR+ijEmAg25Ss69wxMhWgivZq1f/kyyQ8iVvNVyI=
Content-Type: multipart/mixed; boundary="===============5444078467997628082=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libgit2: upgrading to 1.9.2 SUCCEEDED
Message-ID: <0101019b262ef347-6ae378ba-16f4-440f-bf35-3254cf1475cd-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227915

--===============5444078467997628082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libgit2* to *1.9.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libgit2-upgrade-1.9.1-1.9.2.patch
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
From 0c8c4493341ea0774dd5e396d6ea5acd85c0b3ac Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 07:16:34 +0000
Subject: [PATCH] libgit2: upgrade 1.9.1 -> 1.9.2

---
 .../libgit2/{libgit2_1.9.1.bb => libgit2_1.9.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgit2/{libgit2_1.9.1.bb => libgit2_1.9.2.bb} (93%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.9.1.bb b/meta/recipes-support/libgit2/libgit2_1.9.2.bb
similarity index 93%
rename from meta/recipes-support/libgit2/libgit2_1.9.1.bb
rename to meta/recipes-support/libgit2/libgit2_1.9.2.bb
index 43957a2087..2e023b44ff 100644
--- a/meta/recipes-support/libgit2/libgit2_1.9.1.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.9.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8eacfdc17c8f4d219e131a073973b97d"
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.9;protocol=https;tag=v${PV}"
-SRCREV = "0060d9cf5666f015b1067129bd874c6cc4c9c7ac"
+SRCREV = "ca225744b992bf2bf24e9a2eb357ddef78179667"
 
 inherit cmake
 
-- 
2.47.1


--===============5444078467997628082==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libgit2-upgrade-1.9.1-1.9.2.patch"

RnJvbSAwYzhjNDQ5MzM0MWVhMDc3NGRkNWUzOTZkNmVhNWFjZDg1YzBiM2FjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDc6MTY6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJnaXQyOiB1cGdyYWRlIDEuOS4xIC0+IDEuOS4yCgotLS0KIC4uLi9saWJnaXQyL3tsaWJnaXQy
XzEuOS4xLmJiID0+IGxpYmdpdDJfMS45LjIuYmJ9ICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYmdpdDIve2xpYmdpdDJfMS45LjEuYmIgPT4gbGliZ2l0Ml8xLjkuMi5i
Yn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnaXQyL2xpYmdp
dDJfMS45LjEuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnaXQyL2xpYmdpdDJfMS45LjIu
YmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGliZ2l0Mi9saWJnaXQyXzEuOS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJnaXQyL2xpYmdpdDJfMS45LjIuYmIKaW5kZXggNDM5NTdhMjA4Ny4uMmUwMjNiNDRmZiAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2l0Mi9saWJnaXQyXzEuOS4xLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdpdDIvbGliZ2l0Ml8xLjkuMi5iYgpAQCAtNiw3
ICs2LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9OGVhY2ZkYzE3
YzhmNGQyMTllMTMxYTA3Mzk3M2I5N2QiCiBERVBFTkRTID0gImN1cmwgb3BlbnNzbCB6bGliIGxp
YnNzaDIgbGliZ2NyeXB0IGxpYnBjcmUyIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20v
bGliZ2l0Mi9saWJnaXQyLmdpdDticmFuY2g9bWFpbnQvdjEuOTtwcm90b2NvbD1odHRwczt0YWc9
diR7UFZ9IgotU1JDUkVWID0gIjAwNjBkOWNmNTY2NmYwMTViMTA2NzEyOWJkODc0YzZjYzRjOWM3
YWMiCitTUkNSRVYgPSAiY2EyMjU3NDRiOTkyYmYyYmYyNGU5YTJlYjM1N2RkZWY3ODE3OTY2NyIK
IAogaW5oZXJpdCBjbWFrZQogCi0tIAoyLjQ3LjEKCg==

--===============5444078467997628082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libgit2/libgit2: FILELIST: removed "/usr/lib/libgit2.so.1.9.1", added "/usr/lib/libgit2.so.1.9.2"
Changes to packages/x86-64-v3-poky-linux/libgit2 (sysroot):
  /usr/lib/libgit2.so.1.9 changed symlink target from libgit2.so.1.9.1 to libgit2.so.1.9.2
  /usr/lib/libgit2.so.1.9.1 moved to /usr/lib/libgit2.so.1.9.2

--===============5444078467997628082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libgit2: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libgit2: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libgit2: SRC_URI changed from "git://github.com/libgit2/libgit2.git;branch=maint/v1.9;protocol=https;tag=v1.9.1" to "git://github.com/libgit2/libgit2.git;branch=maint/v1.9;protocol=https;tag=v1.9.2"
packages/x86-64-v3-poky-linux/libgit2/libgit2-dbg: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libgit2/libgit2-dbg: FILELIST: removed "/usr/lib/.debug/libgit2.so.1.9.1", added "/usr/lib/.debug/libgit2.so.1.9.2"
packages/x86-64-v3-poky-linux/libgit2/libgit2-dbg: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2-dbg: PKGSIZE changed from 10958528 to 10968784 (+0%)
packages/x86-64-v3-poky-linux/libgit2/libgit2-dev: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libgit2/libgit2-dev: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2-doc: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libgit2/libgit2-doc: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2-locale: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libgit2/libgit2-locale: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2-src: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libgit2/libgit2-src: FILELIST: directory renamed /usr/src/debug/libgit2/1.9.1/src/util/hash -> /usr/src/debug/libgit2/1.9.2/src/util/hash, directory renamed /usr/src/debug/libgit2/1.9.1/src/cli/unix -> /usr/src/debug/libgit2/1.9.2/src/cli/unix, directory renamed /usr/src/debug/libgit2/1.9.1/deps/ntlmclient -> /usr/src/debug/libgit2/1.9.2/deps/ntlmclient, directory renamed /usr/src/debug/libgit2/1.9.1/src/libgit2 -> /usr/src/debug/libgit2/1.9.2/src/libgit2, directory renamed /usr/src/debug/libgit2/1.9.1/src/libgit2/streams -> /usr/src/debug/libgit2/1.9.2/src/libgit2/streams, directory renamed /usr/src/debug/libgit2/1.9.1/src/util/unix -> /usr/src/debug/libgit2/1.9.2/src/util/unix, directory renamed /usr/src/debug/libgit2/1.9.1/include/git2/sys -> /usr/src/debug/libgit2/1.9.2/include/git2/sys, directory renamed /usr/src/debug/libgit2/1.9.1/src/util/allocators -> /usr/src/debug/libgit2/1.9.2/src/util/allocators, directory renamed /usr/src/debug/libgit2/1.9.
 1/deps/xdiff -> /usr/src/debug/libgit2/1.9.2/deps/xdiff, directory renamed /usr/src/debug/libgit2/1.9.1/src/libgit2/transports -> /usr/src/debug/libgit2/1.9.2/src/libgit2/transports, directory renamed /usr/src/debug/libgit2/1.9.1/src/cli -> /usr/src/debug/libgit2/1.9.2/src/cli, directory renamed /usr/src/debug/libgit2/1.9.1/src/util/hash/sha1dc -> /usr/src/debug/libgit2/1.9.2/src/util/hash/sha1dc, directory renamed /usr/src/debug/libgit2/1.9.1/include/git2 -> /usr/src/debug/libgit2/1.9.2/include/git2, directory renamed /usr/src/debug/libgit2/1.9.1/src/util -> /usr/src/debug/libgit2/1.9.2/src/util, directory renamed /usr/src/debug/libgit2/1.9.1/deps/llhttp -> /usr/src/debug/libgit2/1.9.2/deps/llhttp
packages/x86-64-v3-poky-linux/libgit2/libgit2-src: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2-src: PKGSIZE changed from 4618382 to 4622180 (+0%)
packages/x86-64-v3-poky-linux/libgit2/libgit2-staticdev: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libgit2/libgit2-staticdev: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2: PV changed from "1.9.1" to "1.9.2"
packages/x86-64-v3-poky-linux/libgit2/libgit2: FILELIST: removed "/usr/lib/libgit2.so.1.9.1", added "/usr/lib/libgit2.so.1.9.2"
packages/x86-64-v3-poky-linux/libgit2/libgit2: PKGV changed from 1.9.1 [default] to 1.9.2 [default]
packages/x86-64-v3-poky-linux/libgit2/libgit2: PKGSIZE changed from 2688304 to 2692400 (+0%)
Changes to packages/x86-64-v3-poky-linux/libgit2 (sysroot):
  /usr/lib/libgit2.so.1.9 changed symlink target from libgit2.so.1.9.1 to libgit2.so.1.9.2
  /usr/lib/libgit2.so.1.9.1 moved to /usr/lib/libgit2.so.1.9.2

--===============5444078467997628082==--

