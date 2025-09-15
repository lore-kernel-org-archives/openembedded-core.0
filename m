Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20829CCA471
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:55:00 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.30919.1757937278907563967
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=pdf56AGS;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=GDKjtndA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101994d3a5df3-7d71c528-4d60-4101-8e65-1d7bcf6124dd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937294;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JaM8nZ9FnAoME4RvSQZbRRw4iix+yU13rqF/weq2OWI=;
	b=pdf56AGSJjvBFgOaWXTaE4V2UnntALeFjTeH5lWrYtkW1zQxoHfeHdTyVUPmvi66
	RypFzqtwBeU3L47xJkx4Ems2LASoUL4Jj9pFFx8RrvdCVC8hyCwFQIO7wNGV9bqltH+
	u8+P5dBAHFw9qoSKi5TqH+k+MCXPlxHA0R1mcv78=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937294;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JaM8nZ9FnAoME4RvSQZbRRw4iix+yU13rqF/weq2OWI=;
	b=GDKjtndAmK8XUMD8J8APp0oasflo3IS7yhBhjDJBsu9ZoYEvfSF/De2YyRCcSx2b
	jv74wgUMyD0SGIZII0s6j876agVWOk00rIdPvQxL6aHqkhCa6JWhjDE3LqoKTLvC8WQ
	yLVQFg8+wZE9rejTABfPQyXpDodeLMZvjUYnNBOM=
Content-Type: multipart/mixed; boundary="===============0565588156359340326=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] x264: upgrading to b35605ace3ddf7c1a5d67a2eb553f034aef41d55
 SUCCEEDED
Message-ID: <010101994d3a5df3-7d71c528-4d60-4101-8e65-1d7bcf6124dd-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:55:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223470

--===============0565588156359340326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *x264* to *b35605ace3ddf7c1a5d67a2eb553f034aef41d55* has Succeeded.

Next steps:
    - apply the patch: git am 0001-x264-upgrade-to-latest-revision.patch
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
From 58b815859a8d08b3d12b7bf04364b89029e769d4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 11:15:35 +0000
Subject: [PATCH] x264: upgrade to latest revision

---
 meta/recipes-multimedia/x264/x264_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 3cc3392593..2c5f024eea 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -8,11 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "nasm-native"
 
-SRC_URI = "git://code.videolan.org/videolan/x264.git;branch=stable;protocol=https \
-           "
+SRC_URI = "git://code.videolan.org/videolan/x264.git;branch=master;protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "31e19f92f00c7003fa115047ce50978bc98c3a0d"
+SRCREV = "b35605ace3ddf7c1a5d67a2eb553f034aef41d55"
 
 PV = "r3039+git"
 
-- 
2.47.1


--===============0565588156359340326==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-x264-upgrade-to-latest-revision.patch"

RnJvbSA1OGI4MTU4NTlhOGQwOGIzZDEyYjdiZjA0MzY0Yjg5MDI5ZTc2OWQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMTE6MTU6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
MjY0OiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS94MjY0L3gyNjRfZ2l0LmJiIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGlt
ZWRpYS94MjY0L3gyNjRfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEveDI2NC94MjY0
X2dpdC5iYgppbmRleCAzY2MzMzkyNTkzLi4yYzVmMDI0ZWVhIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS94MjY0L3gyNjRfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL3gyNjQveDI2NF9naXQuYmIKQEAgLTgsMTEgKzgsMTAgQEAgTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vQ09QWUlORzttZDU9OTRkNTVkNTEyYTliYTM2Y2FhOWI3ZGYwNzliYWUxOWYi
CiAKIERFUEVORFMgPSAibmFzbS1uYXRpdmUiCiAKLVNSQ19VUkkgPSAiZ2l0Oi8vY29kZS52aWRl
b2xhbi5vcmcvdmlkZW9sYW4veDI2NC5naXQ7YnJhbmNoPXN0YWJsZTtwcm90b2NvbD1odHRwcyBc
Ci0gICAgICAgICAgICIKK1NSQ19VUkkgPSAiZ2l0Oi8vY29kZS52aWRlb2xhbi5vcmcvdmlkZW9s
YW4veDI2NC5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyIKIFVQU1RSRUFNX0NIRUNL
X0NPTU1JVFMgPSAiMSIKIAotU1JDUkVWID0gIjMxZTE5ZjkyZjAwYzcwMDNmYTExNTA0N2NlNTA5
NzhiYzk4YzNhMGQiCitTUkNSRVYgPSAiYjM1NjA1YWNlM2RkZjdjMWE1ZDY3YTJlYjU1M2YwMzRh
ZWY0MWQ1NSIKIAogUFYgPSAicjMwMzkrZ2l0IgogCi0tIAoyLjQ3LjEKCg==

--===============0565588156359340326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/x264: SRC_URI changed from "git://code.videolan.org/videolan/x264.git;branch=stable;protocol=https" to "git://code.videolan.org/videolan/x264.git;branch=master;protocol=https"
Changes to packages/x86-64-v3-poky-linux/x264 (sysroot):
  /usr/lib/libx264.so changed symlink target from libx264.so.164 to libx264.so.165
  /usr/lib/libx264.so.164 moved to /usr/lib/libx264.so.165
packages/x86-64-v3-poky-linux/x264/x264-bin: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264-dbg: PKGSIZE changed from 12732640 to 12731712 (-0%)
packages/x86-64-v3-poky-linux/x264/x264-dbg: FILELIST: removed "/usr/lib/.debug/libx264.so.164", added "/usr/lib/.debug/libx264.so.165"
packages/x86-64-v3-poky-linux/x264/x264-dbg: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264-dev: PKGSIZE changed from 49168 to 49574 (+1%)
packages/x86-64-v3-poky-linux/x264/x264-dev: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264-doc: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264-locale: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264-src: PKGSIZE changed from 2228009 to 2246041 (+1%)
packages/x86-64-v3-poky-linux/x264/x264-src: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264-staticdev: PKGSIZE changed from 10464066 to 10468890 (+0%)
packages/x86-64-v3-poky-linux/x264/x264-staticdev: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264: PKG changed from libx264-164 to libx264-165
packages/x86-64-v3-poky-linux/x264/x264: FILELIST: removed "/usr/lib/libx264.so.164", added "/usr/lib/libx264.so.165"
packages/x86-64-v3-poky-linux/x264/x264: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3

--===============0565588156359340326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/x264 (sysroot):
  /usr/lib/libx264.so changed symlink target from libx264.so.164 to libx264.so.165
  /usr/lib/libx264.so.164 moved to /usr/lib/libx264.so.165
packages/x86-64-v3-poky-linux/x264/x264-bin: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264-dbg: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264-dev: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264-doc: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264-locale: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264-src: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264-staticdev: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264: FILELIST: removed "/usr/lib/libx264.so.164", added "/usr/lib/libx264.so.165"
packages/x86-64-v3-poky-linux/x264/x264: PKGV changed from r3039+git0+31e19f92f0 to r3039+git0+b35605ace3
packages/x86-64-v3-poky-linux/x264/x264: PKG changed from libx264-164 to libx264-165

--===============0565588156359340326==--

