Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD430C54EF9
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:41 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.20182.1708018346604285622
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NBHhSpVj;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=LvLxCduy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018dadd3acfd-de733ebc-3d4f-4eb1-934f-4e0a80eaf4d5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018347;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=1WE5Uexu3w87A1klYksD5HiC+rO3L0e1q0XCR0r2TGg=;
	b=NBHhSpVj++rjp9SE+0t/s1GGGwMDVBSG7DG0VfvaczWX/dXzt8oNMHY0+uSmWzNj
	5B7cy5jBaVrZawG8toLEF327PYcSPKFpJAMmCT1HwpQ7U1k/iOni0nr42+fOtEtn+tz
	QsraFKPzPLuqk1XTc0CWhaN1/SrPghgIQjmLVnoM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018347;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=1WE5Uexu3w87A1klYksD5HiC+rO3L0e1q0XCR0r2TGg=;
	b=LvLxCduyHeoVGryIylmcDD100POzYrp6f/BP3lcJyjfP9hSjgsMNLS3e0XYKNATC
	NGQmwH9pPe85cmFqiyhAI8hGDVdjLIm3ohll+c85bYb2ar/kFaFUlt0uEvzzXUpvANJ
	6RQEXvQhnPAODSRxpvex1fNuU2DoywuuzAOpcNHs=
Content-Type: multipart/mixed; boundary="===============6203953045599122849=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libgit2: upgrading to 1.7.2 SUCCEEDED
Message-ID: <0101018dadd3acfd-de733ebc-3d4f-4eb1-934f-4e0a80eaf4d5-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195688

--===============6203953045599122849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libgit2* to *1.7.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libgit2-upgrade-1.7.1-1.7.2.patch
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
From a4e09492eaa1e0f49269b6f9c4a878ca9a8d6416 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 16:57:20 +0000
Subject: [PATCH] libgit2: upgrade 1.7.1 -> 1.7.2

---
 .../libgit2/{libgit2_1.7.1.bb => libgit2_1.7.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgit2/{libgit2_1.7.1.bb => libgit2_1.7.2.bb} (92%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.7.1.bb b/meta/recipes-support/libgit2/libgit2_1.7.2.bb
similarity index 92%
rename from meta/recipes-support/libgit2/libgit2_1.7.1.bb
rename to meta/recipes-support/libgit2/libgit2_1.7.2.bb
index 92af0b8454..d1629c0c0b 100644
--- a/meta/recipes-support/libgit2/libgit2_1.7.1.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.7.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5bdf47bbc9a39dc6ce076d59e322dc17"
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.7;protocol=https"
-SRCREV = "a2bde63741977ca0f4ef7db2f609df320be67a08"
+SRCREV = "a418d9d4ab87bae16b87d8f37143a4687ae0e4b2"
 
 S = "${WORKDIR}/git"
 
-- 
2.42.0


--===============6203953045599122849==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libgit2-upgrade-1.7.1-1.7.2.patch"

RnJvbSBhNGUwOTQ5MmVhYTFlMGY0OTI2OWI2ZjljNGE4NzhjYTlhOGQ2NDE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMTY6NTc6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJnaXQyOiB1cGdyYWRlIDEuNy4xIC0+IDEuNy4yCgotLS0KIC4uLi9saWJnaXQyL3tsaWJnaXQy
XzEuNy4xLmJiID0+IGxpYmdpdDJfMS43LjIuYmJ9ICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYmdpdDIve2xpYmdpdDJfMS43LjEuYmIgPT4gbGliZ2l0Ml8xLjcuMi5i
Yn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnaXQyL2xpYmdp
dDJfMS43LjEuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnaXQyL2xpYmdpdDJfMS43LjIu
YmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGliZ2l0Mi9saWJnaXQyXzEuNy4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJnaXQyL2xpYmdpdDJfMS43LjIuYmIKaW5kZXggOTJhZjBiODQ1NC4uZDE2MjljMGMwYiAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2l0Mi9saWJnaXQyXzEuNy4xLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdpdDIvbGliZ2l0Ml8xLjcuMi5iYgpAQCAtNiw3
ICs2LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NWJkZjQ3YmJj
OWEzOWRjNmNlMDc2ZDU5ZTMyMmRjMTciCiBERVBFTkRTID0gImN1cmwgb3BlbnNzbCB6bGliIGxp
YnNzaDIgbGliZ2NyeXB0IGxpYnBjcmUyIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20v
bGliZ2l0Mi9saWJnaXQyLmdpdDticmFuY2g9bWFpbnQvdjEuNztwcm90b2NvbD1odHRwcyIKLVNS
Q1JFViA9ICJhMmJkZTYzNzQxOTc3Y2EwZjRlZjdkYjJmNjA5ZGYzMjBiZTY3YTA4IgorU1JDUkVW
ID0gImE0MThkOWQ0YWI4N2JhZTE2Yjg3ZDhmMzcxNDNhNDY4N2FlMGU0YjIiCiAKIFMgPSAiJHtX
T1JLRElSfS9naXQiCiAKLS0gCjIuNDIuMAoK

--===============6203953045599122849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libgit2: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/libgit2: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libgit2/libgit2-dbg: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/libgit2/libgit2-dbg: PKGSIZE changed from 9876904 to 9876304 (-0%)
packages/core2-64-poky-linux/libgit2/libgit2-dbg: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libgit2/libgit2-dbg: FILELIST: removed "/usr/lib/.debug/libgit2.so.1.7.1", added "/usr/lib/.debug/libgit2.so.1.7.2"
packages/core2-64-poky-linux/libgit2/libgit2-dev: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/libgit2/libgit2-dev: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libgit2/libgit2-doc: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/libgit2/libgit2-doc: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libgit2/libgit2-locale: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/libgit2/libgit2-locale: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libgit2/libgit2-src: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/libgit2/libgit2-src: PKGSIZE changed from 4172330 to 4172460 (+0%)
packages/core2-64-poky-linux/libgit2/libgit2-src: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libgit2/libgit2-staticdev: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/libgit2/libgit2-staticdev: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libgit2/libgit2: PV changed from "1.7.1" to "1.7.2"
packages/core2-64-poky-linux/libgit2/libgit2: PKGV changed from 1.7.1 [default] to 1.7.2 [default]
packages/core2-64-poky-linux/libgit2/libgit2: FILELIST: removed "/usr/lib/libgit2.so.1.7.1", added "/usr/lib/libgit2.so.1.7.2"
Changes to packages/core2-64-poky-linux/libgit2 (sysroot):
  /usr/lib/libgit2.so.1.7 changed symlink target from libgit2.so.1.7.1 to libgit2.so.1.7.2
  /usr/lib/libgit2.so.1.7.1 moved to /usr/lib/libgit2.so.1.7.2

--===============6203953045599122849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libgit2/libgit2: FILELIST: removed "/usr/lib/libgit2.so.1.7.1", added "/usr/lib/libgit2.so.1.7.2"
Changes to packages/core2-64-poky-linux/libgit2 (sysroot):
  /usr/lib/libgit2.so.1.7 changed symlink target from libgit2.so.1.7.1 to libgit2.so.1.7.2
  /usr/lib/libgit2.so.1.7.1 moved to /usr/lib/libgit2.so.1.7.2

--===============6203953045599122849==--

