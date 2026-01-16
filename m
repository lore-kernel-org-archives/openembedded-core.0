Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34EE5D4A5E2
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:26:05 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1434.1768526747487332367
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TmcHlMfb;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Pr8zdoun;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019bc468b641-11db1b79-c86e-4c67-b6c3-fd5632c25d3c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526755;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=08fTuS3zbRJJNBwsnGcnJqqsZqE++t6D5MI4bn05I34=;
	b=TmcHlMfbheCGJbqVyt1neTuUvSIk0n0wOY1BRZKKMUDHJe5jxGD9a9M8JH0LNaZM
	v15rKwE0Vubq1i0fhl05FmO1B5sYSqEg+UkXDConErWW+5/Zqfsh+TI+7n4zRj3lmeZ
	3S3dazxcPo40ple+GKayc+vRELPLCFL6dLdVec6Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526755;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=08fTuS3zbRJJNBwsnGcnJqqsZqE++t6D5MI4bn05I34=;
	b=Pr8zdounzyYmFqbrXi1ni2bsX6qIlZS6CXQafDAqqZgX4l8bbRkm0HLn3lk6Ikz4
	NTc2GyuW5q2RGsYzv79NhmRHZGM6B7qiT4MXzCSk/T+Uakjfg1cvXhZY2OV7Nrt9I85
	MXlN5QcIzndHEZnqzG5WxCLur++mWZe6FTOYCsB0=
Content-Type: multipart/mixed; boundary="===============5191518842111500222=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-ucm-conf: upgrading to 1.2.15.3 SUCCEEDED
Message-ID: <0101019bc468b641-11db1b79-c86e-4c67-b6c3-fd5632c25d3c-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229497

--===============5191518842111500222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *alsa-ucm-conf* to *1.2.15.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-alsa-ucm-conf-upgrade-1.2.15.1-1.2.15.3.patch
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
From 117cc23a4a2044678ce07e92d6bf6522bf4021fd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 16 Jan 2026 00:18:47 +0000
Subject: [PATCH] alsa-ucm-conf: upgrade 1.2.15.1 -> 1.2.15.3

---
 .../{alsa-ucm-conf_1.2.15.1.bb => alsa-ucm-conf_1.2.15.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.15.1.bb => alsa-ucm-conf_1.2.15.3.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.1.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.1.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
index 961a1444e3..0ac51b6c5d 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.3.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "246c5d59d217b6f7f47a11fd10f1b766d25abcb0d9c996af3079bb9c9ac5a1b0"
+SRC_URI[sha256sum] = "9f79e813c08fc86cfa46dd75c4fcda1a4a51b482db2607e1fcfaafb92f588a31"
 # Something went wrong at upstream tarballing
 
 inherit allarch
-- 
2.47.1


--===============5191518842111500222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: FILELIST: removed "/usr/share/alsa/ucm2/common/direct-verb.conf /usr/share/alsa/ucm2/common/direct.conf", added "/usr/share/alsa/ucm2/common/directm.conf"
Changes to packages/all-poky-linux/alsa-ucm-conf (sysroot):
  /usr/share/alsa/ucm2/common/directm.conf was added
  /usr/share/alsa/ucm2/common/direct.conf was removed
  /usr/share/alsa/ucm2/common/direct-verb.conf was removed

--===============5191518842111500222==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-alsa-ucm-conf-upgrade-1.2.15.1-1.2.15.3.patch"

RnJvbSAxMTdjYzIzYTRhMjA0NDY3OGNlMDdlOTJkNmJmNjUyMmJmNDAyMWZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTYgSmFuIDIwMjYgMDA6MTg6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
bHNhLXVjbS1jb25mOiB1cGdyYWRlIDEuMi4xNS4xIC0+IDEuMi4xNS4zCgotLS0KIC4uLi97YWxz
YS11Y20tY29uZl8xLjIuMTUuMS5iYiA9PiBhbHNhLXVjbS1jb25mXzEuMi4xNS4zLmJifSAgICB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2Eve2Fsc2EtdWNtLWNvbmZfMS4yLjE1LjEu
YmIgPT4gYWxzYS11Y20tY29uZl8xLjIuMTUuMy5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdWNtLWNvbmZfMS4yLjE1LjEuYmIgYi9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdWNtLWNvbmZfMS4yLjE1LjMuYmIKc2ltaWxh
cml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9h
bHNhLXVjbS1jb25mXzEuMi4xNS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS9hbHNhL2Fsc2EtdWNtLWNvbmZfMS4yLjE1LjMuYmIKaW5kZXggOTYxYTE0NDRlMy4uMGFjNTFi
NmM1ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXVjbS1j
b25mXzEuMi4xNS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11
Y20tY29uZl8xLjIuMTUuMy5iYgpAQCAtOCw3ICs4LDcgQEAgTElDRU5TRSA9ICJCU0QtMy1DbGF1
c2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0yMGQ3NGQ3NGRiOTc0
MTY5NzkwMzM3MmFkMDAxZDNiNCIKIAogU1JDX1VSSSA9ICJodHRwczovL3d3dy5hbHNhLXByb2pl
Y3Qub3JnL2ZpbGVzL3B1Yi9saWIvJHtCUH0udGFyLmJ6MiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICIyNDZjNWQ1OWQyMTdiNmY3ZjQ3YTExZmQxMGYxYjc2NmQyNWFiY2IwZDljOTk2YWYzMDc5YmI5
YzlhYzVhMWIwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjlmNzllODEzYzA4ZmM4NmNmYTQ2ZGQ3
NWM0ZmNkYTFhNGE1MWI0ODJkYjI2MDdlMWZjZmFhZmI5MmY1ODhhMzEiCiAjIFNvbWV0aGluZyB3
ZW50IHdyb25nIGF0IHVwc3RyZWFtIHRhcmJhbGxpbmcKIAogaW5oZXJpdCBhbGxhcmNoCi0tIAoy
LjQ3LjEKCg==

--===============5191518842111500222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf-src: PV changed from "1.2.15.1" to "1.2.15.3"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf-src: PKGV changed from 1.2.15.1 [default] to 1.2.15.3 [default]
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PV changed from "1.2.15.1" to "1.2.15.3"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGSIZE changed from 641707 to 646795 (+1%)
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: FILELIST: removed "/usr/share/alsa/ucm2/common/direct-verb.conf /usr/share/alsa/ucm2/common/direct.conf", added "/usr/share/alsa/ucm2/common/directm.conf"
packages/all-poky-linux/alsa-ucm-conf/alsa-ucm-conf: PKGV changed from 1.2.15.1 [default] to 1.2.15.3 [default]
packages/all-poky-linux/alsa-ucm-conf: PV changed from "1.2.15.1" to "1.2.15.3"
packages/all-poky-linux/alsa-ucm-conf: PKGV changed from 1.2.15.1 [default] to 1.2.15.3 [default]
packages/all-poky-linux/alsa-ucm-conf: SRC_URI changed from "https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.15.1.tar.bz2" to "https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.15.3.tar.bz2"
Changes to packages/all-poky-linux/alsa-ucm-conf (sysroot):
  /usr/share/alsa/ucm2/common/directm.conf was added
  /usr/share/alsa/ucm2/common/direct.conf was removed
  /usr/share/alsa/ucm2/common/direct-verb.conf was removed

--===============5191518842111500222==--

