Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20AC1C54E83
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:14 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.75498.1722536829728278654
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Y/x2FcF5;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Qoz/Mhn4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101910f322cea-16c90bbf-c902-49e0-bd05-7261be43f547-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536832;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=w2cUzT4GGvZEp/JoZzBT68qJE2zxwG8DTiaofJaSaVA=;
	b=Y/x2FcF5XbqxGMNjMUzpQ0ZqqVIUlmubMH2P+Ri783huw4MEsxeD3n1Rrj8/xgQ8
	YFfTg8ikdfNwAHQPboqj+nZhcecLBcB1JcDlOt2rrjFOojnoN8tY/ajMwzKgkqVG5g0
	yakjk7my/LPs85a9zCuX75fPDA2MkQN1ke8iMC3M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536832;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=w2cUzT4GGvZEp/JoZzBT68qJE2zxwG8DTiaofJaSaVA=;
	b=Qoz/Mhn4zXqpxgju1U48qVelX9DcBF4FfjUThqzdeH/dgfmUI2SU67nkt8rvy7HE
	vhdqRev356NMFjxmlBdqG868IGAYaIxcs7AHZ+/KBOMOCHRKcdZkg8+T3powHgL+Aft
	fin1OzCVdXi1oZpDwwhUgl4REB7mJ0QjHyUmrPto=
Content-Type: multipart/mixed; boundary="===============6057282583382115006=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Carlos Rafael Giani <crg7475@mailbox.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kmscube: upgrading to 467e86c5cbeb2a2051b31ce2c240d6ddf5bc3112
 SUCCEEDED
Message-ID: <010101910f322cea-16c90bbf-c902-49e0-bd05-7261be43f547-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202842

--===============6057282583382115006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *kmscube* to *467e86c5cbeb2a2051b31ce2c240d6ddf5bc3112* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kmscube-upgrade-to-latest-revision.patch
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
From 7c0633409481fb4b06635f2926a9736382585cc8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 13:50:08 +0000
Subject: [PATCH] kmscube: upgrade to latest revision

---
 .../0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch     | 2 +-
 meta/recipes-graphics/kmscube/kmscube_git.bb                    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube/0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch b/meta/recipes-graphics/kmscube/kmscube/0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch
index f8608d4676..cbe58e3a7f 100644
--- a/meta/recipes-graphics/kmscube/kmscube/0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch
+++ b/meta/recipes-graphics/kmscube/kmscube/0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch
@@ -1,4 +1,4 @@
-From 5f54f067da7ee24a61d6cb41e0636383729e2bad Mon Sep 17 00:00:00 2001
+From 26c97e6b63db05eaa85d9d3d001351a3306d513b Mon Sep 17 00:00:00 2001
 From: Fabio Estevam <festevam@gmail.com>
 Date: Mon, 8 Jan 2024 15:00:01 -0300
 Subject: [PATCH] cube-gears: Change header file to <GLES3/gl3.h>
diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 19bbcd195d..34d5a7d71d 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "6ab022fdfcfedd28f4b5dbd8d3299414a367746f"
+SRCREV = "467e86c5cbeb2a2051b31ce2c240d6ddf5bc3112"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https \
            file://0001-cube-gears-Change-header-file-to-GLES3-gl3.h.patch \
            "
-- 
2.44.0


--===============6057282583382115006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/kmscube/kmscube-dbg: PKGV changed from 0.0.1+git0+6ab022fdfc to 0.0.1+git0+467e86c5cb
packages/core2-64-poky-linux/kmscube/kmscube-dev: PKGV changed from 0.0.1+git0+6ab022fdfc to 0.0.1+git0+467e86c5cb
packages/core2-64-poky-linux/kmscube/kmscube-doc: PKGV changed from 0.0.1+git0+6ab022fdfc to 0.0.1+git0+467e86c5cb
packages/core2-64-poky-linux/kmscube/kmscube-locale: PKGV changed from 0.0.1+git0+6ab022fdfc to 0.0.1+git0+467e86c5cb
packages/core2-64-poky-linux/kmscube/kmscube-src: PKGV changed from 0.0.1+git0+6ab022fdfc to 0.0.1+git0+467e86c5cb
packages/core2-64-poky-linux/kmscube/kmscube-staticdev: PKGV changed from 0.0.1+git0+6ab022fdfc to 0.0.1+git0+467e86c5cb
packages/core2-64-poky-linux/kmscube/kmscube: PKGV changed from 0.0.1+git0+6ab022fdfc to 0.0.1+git0+467e86c5cb

--===============6057282583382115006==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-kmscube-upgrade-to-latest-revision.patch"

RnJvbSA3YzA2MzM0MDk0ODFmYjRiMDY2MzVmMjkyNmE5NzM2MzgyNTg1Y2M4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxMzo1MDowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGtt
c2N1YmU6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIC4uLi8wMDAxLWN1YmUtZ2Vh
cnMtQ2hhbmdlLWhlYWRlci1maWxlLXRvLUdMRVMzLWdsMy5oLnBhdGNoICAgICB8IDIgKy0KIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy9rbXNjdWJlL2ttc2N1YmVfZ2l0LmJiICAgICAgICAgICAgICAg
ICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9rbXNjdWJlL2ttc2N1YmUv
MDAwMS1jdWJlLWdlYXJzLUNoYW5nZS1oZWFkZXItZmlsZS10by1HTEVTMy1nbDMuaC5wYXRjaCBi
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9rbXNjdWJlL2ttc2N1YmUvMDAwMS1jdWJlLWdlYXJzLUNo
YW5nZS1oZWFkZXItZmlsZS10by1HTEVTMy1nbDMuaC5wYXRjaAppbmRleCBmODYwOGQ0Njc2Li5j
YmU1OGUzYTdmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mva21zY3ViZS9rbXNj
dWJlLzAwMDEtY3ViZS1nZWFycy1DaGFuZ2UtaGVhZGVyLWZpbGUtdG8tR0xFUzMtZ2wzLmgucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ttc2N1YmUva21zY3ViZS8wMDAxLWN1YmUt
Z2VhcnMtQ2hhbmdlLWhlYWRlci1maWxlLXRvLUdMRVMzLWdsMy5oLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSA1ZjU0ZjA2N2RhN2VlMjRhNjFkNmNiNDFlMDYzNjM4MzcyOWUyYmFkIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyNmM5N2U2YjYzZGIwNWVhYTg1ZDlkM2QwMDEzNTFh
MzMwNmQ1MTNiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogRmFiaW8gRXN0ZXZhbSA8
ZmVzdGV2YW1AZ21haWwuY29tPgogRGF0ZTogTW9uLCA4IEphbiAyMDI0IDE1OjAwOjAxIC0wMzAw
CiBTdWJqZWN0OiBbUEFUQ0hdIGN1YmUtZ2VhcnM6IENoYW5nZSBoZWFkZXIgZmlsZSB0byA8R0xF
UzMvZ2wzLmg+CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mva21zY3ViZS9rbXNj
dWJlX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9rbXNjdWJlL2ttc2N1YmVfZ2l0LmJi
CmluZGV4IDE5YmJjZDE5NWQuLjM0ZDVhN2Q3MWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9rbXNjdWJlL2ttc2N1YmVfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9rbXNjdWJlL2ttc2N1YmVfZ2l0LmJiCkBAIC0xMCw3ICsxMCw3IEBAIERFUEVORFMgPSAidmly
dHVhbC9saWJnbGVzMyB2aXJ0dWFsL2xpYmdsZXMyIHZpcnR1YWwvZWdsIGxpYmRybSB2aXJ0dWFs
L2xpYmdibSIKIAogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8va21zY3ViZS5jO2JlZ2lubGlu
ZT0xO2VuZGxpbmU9MjM7bWQ1PThiMzA5ZDRlZTY3YjczMTVmZjczODEyNzBkZDYzMWZiIgogCi1T
UkNSRVYgPSAiNmFiMDIyZmRmY2ZlZGQyOGY0YjVkYmQ4ZDMyOTk0MTRhMzY3NzQ2ZiIKK1NSQ1JF
ViA9ICI0NjdlODZjNWNiZWIyYTIwNTFiMzFjZTJjMjQwZDZkZGY1YmMzMTEyIgogU1JDX1VSSSA9
ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2Eva21zY3ViZTticmFuY2g9bWFzdGVy
O3Byb3RvY29sPWh0dHBzIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtY3ViZS1nZWFycy1DaGFu
Z2UtaGVhZGVyLWZpbGUtdG8tR0xFUzMtZ2wzLmgucGF0Y2ggXAogICAgICAgICAgICAiCi0tIAoy
LjQ0LjAKCg==

--===============6057282583382115006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/kmscube/kmscube-dbg: PKGV changed from 0.0.1+git0+6ab022fdfc to 0.0.1+git0+467e86c5cb
packages/core2-64-poky-linux/kmscube/kmscube-dbg: PKGSIZE changed from 349136 to 349592 (+0%)
packages/core2-64-poky-linux/kmscube/kmscube-dev: PKGV changed from 0.0.1+git0+6ab022fdfc to 0.0.1+git0+467e86c5cb
packages/core2-64-poky-linux/kmscube/kmscube-doc: PKGV changed from 0.0.1+git0+6ab022fdfc to 0.0.1+git0+467e86c5cb
packages/core2-64-poky-linux/kmscube/kmscube-locale: PKGV changed from 0.0.1+git0+6ab022fdfc to 0.0.1+git0+467e86c5cb
packages/core2-64-poky-linux/kmscube/kmscube-src: PKGV changed from 0.0.1+git0+6ab022fdfc to 0.0.1+git0+467e86c5cb
packages/core2-64-poky-linux/kmscube/kmscube-src: PKGSIZE changed from 4610109 to 4610560 (+0%)
packages/core2-64-poky-linux/kmscube/kmscube-staticdev: PKGV changed from 0.0.1+git0+6ab022fdfc to 0.0.1+git0+467e86c5cb
packages/core2-64-poky-linux/kmscube/kmscube: PKGV changed from 0.0.1+git0+6ab022fdfc to 0.0.1+git0+467e86c5cb

--===============6057282583382115006==--

