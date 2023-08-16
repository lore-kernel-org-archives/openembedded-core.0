Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24AEEC52D6F
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:14 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.173811.1692224345044631087
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BSrJENQq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZI3sNgga;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018a006e6fa8-01debed9-996c-4c22-aaec-2ef6e021584e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224352;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=lCmSnsxkYicj0TaElBDf6XAvvjvIVHqZoviBg3JoOoM=;
	b=BSrJENQqcM8HbDetArvoa51dzcFF7kUKyfM3+R2MST6ou757jZn7YcpeiXrY4vNu
	j1LLBFGovzK2TF7TeZ4vjnQ7xEG0j+n14ikdlUJchUDgwQRwRggb3h4L1NUaGQ6zVnk
	A148U48Wgtpaw8dp5gB6si0VOZKaTb4mnYCgkWj4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224352;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=lCmSnsxkYicj0TaElBDf6XAvvjvIVHqZoviBg3JoOoM=;
	b=ZI3sNgga9XSGFgBQQ3B2i3XEe3l4MxvRwj3GUfazxJNAElgRp+8smenPW/glCYhp
	FmTtexyI0icv7pTr835rPL8woXPrFnolY6hOqR4idgSt1YNmD4dhaFEj2RyirQy6yFa
	lphuS9+oJGmHg0kDNxJ637MU+5/8H/LNXB7t0iEQ=
Content-Type: multipart/mixed; boundary="===============7573367264929943135=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libgit2: upgrading to 1.7.1 SUCCEEDED
Message-ID: <0101018a006e6fa8-01debed9-996c-4c22-aaec-2ef6e021584e-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186253

--===============7573367264929943135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libgit2* to *1.7.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libgit2-upgrade-1.7.0-1.7.1.patch
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
From 66c71fcd118322999c086f56a8398af8b67c92d8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 22:14:01 +0000
Subject: [PATCH] libgit2: upgrade 1.7.0 -> 1.7.1

---
 .../libgit2/{libgit2_1.7.0.bb => libgit2_1.7.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgit2/{libgit2_1.7.0.bb => libgit2_1.7.1.bb} (92%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.7.0.bb b/meta/recipes-support/libgit2/libgit2_1.7.1.bb
similarity index 92%
rename from meta/recipes-support/libgit2/libgit2_1.7.0.bb
rename to meta/recipes-support/libgit2/libgit2_1.7.1.bb
index 15a91cfb27..92af0b8454 100644
--- a/meta/recipes-support/libgit2/libgit2_1.7.0.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.7.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5bdf47bbc9a39dc6ce076d59e322dc17"
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.7;protocol=https"
-SRCREV = "3e2baa6d0bfb42f9016e24cba1733a6ae26a8ae6"
+SRCREV = "a2bde63741977ca0f4ef7db2f609df320be67a08"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============7573367264929943135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libgit2: PV changed from "1.7.0" to "1.7.1"
packages/core2-32-poky-linux/libgit2: PKGV changed from 1.7.0 [default] to 1.7.1 [default]
packages/core2-32-poky-linux/libgit2/libgit2-dbg: PKGSIZE changed from 8327460 to 8333800 (+0%)
packages/core2-32-poky-linux/libgit2/libgit2-dbg: PV changed from "1.7.0" to "1.7.1"
packages/core2-32-poky-linux/libgit2/libgit2-dbg: PKGV changed from 1.7.0 [default] to 1.7.1 [default]
packages/core2-32-poky-linux/libgit2/libgit2-dbg: FILELIST: removed "/usr/lib/.debug/libgit2.so.1.7.0", added "/usr/lib/.debug/libgit2.so.1.7.1"
packages/core2-32-poky-linux/libgit2/libgit2-dev: PKGSIZE changed from 769351 to 769378 (+0%)
packages/core2-32-poky-linux/libgit2/libgit2-dev: PV changed from "1.7.0" to "1.7.1"
packages/core2-32-poky-linux/libgit2/libgit2-dev: PKGV changed from 1.7.0 [default] to 1.7.1 [default]
packages/core2-32-poky-linux/libgit2/libgit2-doc: PV changed from "1.7.0" to "1.7.1"
packages/core2-32-poky-linux/libgit2/libgit2-doc: PKGV changed from 1.7.0 [default] to 1.7.1 [default]
packages/core2-32-poky-linux/libgit2/libgit2-locale: PV changed from "1.7.0" to "1.7.1"
packages/core2-32-poky-linux/libgit2/libgit2-locale: PKGV changed from 1.7.0 [default] to 1.7.1 [default]
packages/core2-32-poky-linux/libgit2/libgit2-src: PKGSIZE changed from 4169994 to 4172330 (+0%)
packages/core2-32-poky-linux/libgit2/libgit2-src: PV changed from "1.7.0" to "1.7.1"
packages/core2-32-poky-linux/libgit2/libgit2-src: PKGV changed from 1.7.0 [default] to 1.7.1 [default]
packages/core2-32-poky-linux/libgit2/libgit2-staticdev: PV changed from "1.7.0" to "1.7.1"
packages/core2-32-poky-linux/libgit2/libgit2-staticdev: PKGV changed from 1.7.0 [default] to 1.7.1 [default]
packages/core2-32-poky-linux/libgit2/libgit2: PV changed from "1.7.0" to "1.7.1"
packages/core2-32-poky-linux/libgit2/libgit2: PKGV changed from 1.7.0 [default] to 1.7.1 [default]
packages/core2-32-poky-linux/libgit2/libgit2: FILELIST: removed "/usr/lib/libgit2.so.1.7.0", added "/usr/lib/libgit2.so.1.7.1"
Changes to packages/core2-32-poky-linux/libgit2 (sysroot):
  /usr/lib/libgit2.so.1.7 changed symlink target from libgit2.so.1.7.0 to libgit2.so.1.7.1
  /usr/lib/libgit2.so.1.7.0 moved to /usr/lib/libgit2.so.1.7.1

--===============7573367264929943135==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libgit2-upgrade-1.7.0-1.7.1.patch"

RnJvbSA2NmM3MWZjZDExODMyMjk5OWMwODZmNTZhODM5OGFmOGI2N2M5MmQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMjI6MTQ6MDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJnaXQyOiB1cGdyYWRlIDEuNy4wIC0+IDEuNy4xCgotLS0KIC4uLi9saWJnaXQyL3tsaWJnaXQy
XzEuNy4wLmJiID0+IGxpYmdpdDJfMS43LjEuYmJ9ICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYmdpdDIve2xpYmdpdDJfMS43LjAuYmIgPT4gbGliZ2l0Ml8xLjcuMS5i
Yn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnaXQyL2xpYmdp
dDJfMS43LjAuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnaXQyL2xpYmdpdDJfMS43LjEu
YmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGliZ2l0Mi9saWJnaXQyXzEuNy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJnaXQyL2xpYmdpdDJfMS43LjEuYmIKaW5kZXggMTVhOTFjZmIyNy4uOTJhZjBiODQ1NCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2l0Mi9saWJnaXQyXzEuNy4wLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdpdDIvbGliZ2l0Ml8xLjcuMS5iYgpAQCAtNiw3
ICs2LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NWJkZjQ3YmJj
OWEzOWRjNmNlMDc2ZDU5ZTMyMmRjMTciCiBERVBFTkRTID0gImN1cmwgb3BlbnNzbCB6bGliIGxp
YnNzaDIgbGliZ2NyeXB0IGxpYnBjcmUyIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20v
bGliZ2l0Mi9saWJnaXQyLmdpdDticmFuY2g9bWFpbnQvdjEuNztwcm90b2NvbD1odHRwcyIKLVNS
Q1JFViA9ICIzZTJiYWE2ZDBiZmI0MmY5MDE2ZTI0Y2JhMTczM2E2YWUyNmE4YWU2IgorU1JDUkVW
ID0gImEyYmRlNjM3NDE5NzdjYTBmNGVmN2RiMmY2MDlkZjMyMGJlNjdhMDgiCiAKIFMgPSAiJHtX
T1JLRElSfS9naXQiCiAKLS0gCjIuMzkuMgoK

--===============7573367264929943135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libgit2/libgit2: FILELIST: removed "/usr/lib/libgit2.so.1.7.0", added "/usr/lib/libgit2.so.1.7.1"
Changes to packages/core2-32-poky-linux/libgit2 (sysroot):
  /usr/lib/libgit2.so.1.7 changed symlink target from libgit2.so.1.7.0 to libgit2.so.1.7.1
  /usr/lib/libgit2.so.1.7.0 moved to /usr/lib/libgit2.so.1.7.1

--===============7573367264929943135==--

