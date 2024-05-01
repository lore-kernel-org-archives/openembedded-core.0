Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7234C3DA40
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:24 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.1096.1714579215359261225
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZhkOvPJk;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=TA1OrKLh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018f34e29117-2ac6067b-a319-4e75-a931-47d63fe523c5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579214;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cWWtRYdIEWcq1DZp5tEgNQZQUkUu46ltvJWZ5LhHCD0=;
	b=ZhkOvPJkv7kjpqgEC1sHdFMT6uBX25q7ggce6UjleaocDVS2r++ch0xt8O3PYG9M
	YyauIt0IUAzRlDVgZDnLUyke0SDBWaLp9DUW8M7/0HjXQp29ASudz3jVg9D1hogZv+a
	KyPZqtfG+teyPLBPwkhVL1KpvqT6qWGqhQ6i0mFk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579214;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cWWtRYdIEWcq1DZp5tEgNQZQUkUu46ltvJWZ5LhHCD0=;
	b=TA1OrKLh8uSuVluOHwoz4MVEThmFo57zkdqumY+KQZCnLeU8An7ZNlm970N8LCdG
	KlK0OA1z41xpXuYkUrBdA0Yoar+qhjtM0TMWHzfuVM85am3kTgyF7CjLX92Kq/ZIZ9D
	qhLVP6W+EQLzlx93Px2PT9FR8XTb7PcXiTvA/Uwo=
Content-Type: multipart/mixed; boundary="===============0710565800399213426=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dmidecode: upgrading to 3.6 SUCCEEDED
Message-ID: <0101018f34e29117-2ac6067b-a319-4e75-a931-47d63fe523c5-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198797

--===============0710565800399213426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dmidecode* to *3.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dmidecode-upgrade-3.5-3.6.patch
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
From 45024cde0de0750394449f3c8b95caf7a3fa00e5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 05:55:57 +0000
Subject: [PATCH] dmidecode: upgrade 3.5 -> 3.6

---
 .../dmidecode/{dmidecode_3.5.bb => dmidecode_3.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dmidecode/{dmidecode_3.5.bb => dmidecode_3.6.bb} (89%)

diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.5.bb b/meta/recipes-devtools/dmidecode/dmidecode_3.6.bb
similarity index 89%
rename from meta/recipes-devtools/dmidecode/dmidecode_3.5.bb
rename to meta/recipes-devtools/dmidecode/dmidecode_3.6.bb
index 3e2bb6e30b..e5b4e27687 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_3.5.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_3.6.bb
@@ -18,4 +18,4 @@ do_install() {
         install
 }
 
-SRC_URI[sha256sum] = "79d76735ee8e25196e2a722964cf9683f5a09581503537884b256b01389cc073"
+SRC_URI[sha256sum] = "e40c65f3ec3dafe31ad8349a4ef1a97122d38f65004ed66575e1a8d575dd8bae"
-- 
2.44.0


--===============0710565800399213426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dmidecode/dmidecode-dbg: PKGSIZE changed from 365224 to 374464 (+3%)
packages/core2-64-poky-linux/dmidecode/dmidecode-dbg: PV changed from "3.5" to "3.6"
packages/core2-64-poky-linux/dmidecode/dmidecode-dbg: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-64-poky-linux/dmidecode/dmidecode-dev: PV changed from "3.5" to "3.6"
packages/core2-64-poky-linux/dmidecode/dmidecode-dev: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-64-poky-linux/dmidecode/dmidecode-doc: PKGSIZE changed from 30266 to 31365 (+4%)
packages/core2-64-poky-linux/dmidecode/dmidecode-doc: PV changed from "3.5" to "3.6"
packages/core2-64-poky-linux/dmidecode/dmidecode-doc: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-64-poky-linux/dmidecode/dmidecode-locale: PV changed from "3.5" to "3.6"
packages/core2-64-poky-linux/dmidecode/dmidecode-locale: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-64-poky-linux/dmidecode/dmidecode-src: PKGSIZE changed from 252624 to 269813 (+7%)
packages/core2-64-poky-linux/dmidecode/dmidecode-src: PV changed from "3.5" to "3.6"
packages/core2-64-poky-linux/dmidecode/dmidecode-src: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-64-poky-linux/dmidecode/dmidecode-staticdev: PV changed from "3.5" to "3.6"
packages/core2-64-poky-linux/dmidecode/dmidecode-staticdev: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-64-poky-linux/dmidecode/dmidecode: PKGSIZE changed from 210832 to 219088 (+4%)
packages/core2-64-poky-linux/dmidecode/dmidecode: PV changed from "3.5" to "3.6"
packages/core2-64-poky-linux/dmidecode/dmidecode: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-64-poky-linux/dmidecode: SRC_URI changed from "https://download.savannah.nongnu.org/releases/dmidecode/dmidecode-3.5.tar.xz" to "https://download.savannah.nongnu.org/releases/dmidecode/dmidecode-3.6.tar.xz"
packages/core2-64-poky-linux/dmidecode: PV changed from "3.5" to "3.6"
packages/core2-64-poky-linux/dmidecode: PKGV changed from 3.5 [default] to 3.6 [default]

--===============0710565800399213426==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dmidecode-upgrade-3.5-3.6.patch"

RnJvbSA0NTAyNGNkZTBkZTA3NTAzOTQ0NDlmM2M4Yjk1Y2FmN2EzZmEwMGU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAwNTo1NTo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRt
aWRlY29kZTogdXBncmFkZSAzLjUgLT4gMy42CgotLS0KIC4uLi9kbWlkZWNvZGUve2RtaWRlY29k
ZV8zLjUuYmIgPT4gZG1pZGVjb2RlXzMuNi5iYn0gICAgICAgICAgICB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9kbWlkZWNvZGUve2RtaWRlY29kZV8zLjUuYmIgPT4gZG1pZGVjb2RlXzMuNi5i
Yn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG1pZGVjb2RlL2Rt
aWRlY29kZV8zLjUuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG1pZGVjb2RlL2RtaWRlY29k
ZV8zLjYuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2RtaWRlY29kZS9kbWlkZWNvZGVfMy41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZG1pZGVjb2RlL2RtaWRlY29kZV8zLjYuYmIKaW5kZXggM2UyYmI2ZTMwYi4uZTVi
NGUyNzY4NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RtaWRlY29kZS9kbWlk
ZWNvZGVfMy41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbWlkZWNvZGUvZG1pZGVj
b2RlXzMuNi5iYgpAQCAtMTgsNCArMTgsNCBAQCBkb19pbnN0YWxsKCkgewogICAgICAgICBpbnN0
YWxsCiB9CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3OWQ3NjczNWVlOGUyNTE5NmUyYTcyMjk2
NGNmOTY4M2Y1YTA5NTgxNTAzNTM3ODg0YjI1NmIwMTM4OWNjMDczIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImU0MGM2NWYzZWMzZGFmZTMxYWQ4MzQ5YTRlZjFhOTcxMjJkMzhmNjUwMDRlZDY2NTc1
ZTFhOGQ1NzVkZDhiYWUiCi0tIAoyLjQ0LjAKCg==

--===============0710565800399213426==--

