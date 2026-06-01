Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56AD8CD8C8D
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:45 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1580.1780328143724228234
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=qLoblrcg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DBNlqYy1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019e83d398d7-638d251c-c31f-4e01-87e8-03d58232423f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328143;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dc8tLQqUxVSqGNVzfiTlhFGGgxcTxNWBTCMqRQ7WoLg=;
	b=qLoblrcgwnXIUNaLSMJ4/LmFIMU1eQ9hGInRmEgk0JynZ9+eX0CFQx+X5WXI1sid
	49v2tLlbwAKBI613Oo7D30QXUrONhXSFG0+kSXXxnF0tR3ED5vcjHrOwKy7CyWZd8Vh
	RkGk+MMbqxLNExqULXgTc4EeKmaYx7RS+nsxLHKo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328143;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dc8tLQqUxVSqGNVzfiTlhFGGgxcTxNWBTCMqRQ7WoLg=;
	b=DBNlqYy1NbWalQYX3LRJxJd4PCZfQ1jXyRkjcjK8FPkPTFngy7+aIiljx9pbrV7w
	3ozve+iixEquf623+4QWcPQzhnnQMQIAk8vvtc/zgWHrtQxlbgxFoLdSlETFro7dDjA
	jb/tHTJrRbjmj1tNB6sxZQjToAUEK0iQHgE4ygr8=
Content-Type: multipart/mixed; boundary="===============6982867523228964340=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-zipp: upgrading to 4.1.0 SUCCEEDED
Message-ID: <0101019e83d398d7-638d251c-c31f-4e01-87e8-03d58232423f-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237899

--===============6982867523228964340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-zipp* to *4.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-zipp-upgrade-3.23.1-4.1.0.patch
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
From e969ddb8610d6401666949c3a43a380bda519aea Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 09:48:48 +0000
Subject: [PATCH] python3-zipp: upgrade 3.23.1 -> 4.1.0

---
 .../python/{python3-zipp_3.23.1.bb => python3-zipp_4.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.23.1.bb => python3-zipp_4.1.0.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.23.1.bb b/meta/recipes-devtools/python/python3-zipp_4.1.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-zipp_3.23.1.bb
rename to meta/recipes-devtools/python/python3-zipp_4.1.0.bb
index 45b83bf347..ca3f1250c3 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.23.1.bb
+++ b/meta/recipes-devtools/python/python3-zipp_4.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2e21c3f75eb8d9427c8a611a8e83e9d6"
 
-SRC_URI[sha256sum] = "32120e378d32cd9714ad503c1d024619063ec28aad2248dc6672ad13edfa5110"
+SRC_URI[sha256sum] = "4cb57381f544315db7688e976e922a2b18cdb513d21cc194eb42232ba2a3e602"
 
 DEPENDS += "python3-setuptools-scm-native python3-coherent-licensed-native"
 
-- 
2.47.1


--===============6982867523228964340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp: FILELIST: directory renamed /usr/lib/python3.14/site-packages/zipp-3.23.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/zipp-4.1.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/zipp-3.23.1.dist-info -> /usr/lib/python3.14/site-packages/zipp-4.1.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.14/site-packages/zipp-4.1.0.dist-info was added
  /usr/lib/python3.14/site-packages/zipp-4.1.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/zipp-4.1.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/zipp-4.1.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/zipp-4.1.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/zipp-4.1.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/zipp-3.23.1.dist-info was removed
  /usr/lib/python3.14/site-packages/zipp-3.23.1.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/zipp-3.23.1.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/zipp-3.23.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/zipp-3.23.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/zipp-3.23.1.dist-info/WHEEL was removed

--===============6982867523228964340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-zipp: SRC_URI changed from "https://files.pythonhosted.org/packages/source/z/zipp/zipp-3.23.1.tar.gz;downloadfilename=zipp-3.23.1.tar.gz" to "https://files.pythonhosted.org/packages/source/z/zipp/zipp-4.1.0.tar.gz;downloadfilename=zipp-4.1.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-zipp: PV changed from "3.23.1" to "4.1.0"
packages/x86-64-v3-poky-linux/python3-zipp: PKGV changed from 3.23.1 [default] to 4.1.0 [default]
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-dbg: PV changed from "3.23.1" to "4.1.0"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-dbg: PKGV changed from 3.23.1 [default] to 4.1.0 [default]
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-dev: PV changed from "3.23.1" to "4.1.0"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-dev: PKGV changed from 3.23.1 [default] to 4.1.0 [default]
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-doc: PV changed from "3.23.1" to "4.1.0"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-doc: PKGV changed from 3.23.1 [default] to 4.1.0 [default]
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-locale: PV changed from "3.23.1" to "4.1.0"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-locale: PKGV changed from 3.23.1 [default] to 4.1.0 [default]
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-src: PV changed from "3.23.1" to "4.1.0"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-src: PKGV changed from 3.23.1 [default] to 4.1.0 [default]
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-staticdev: PV changed from "3.23.1" to "4.1.0"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-staticdev: PKGV changed from 3.23.1 [default] to 4.1.0 [default]
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp: FILELIST: directory renamed /usr/lib/python3.14/site-packages/zipp-3.23.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/zipp-4.1.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/zipp-3.23.1.dist-info -> /usr/lib/python3.14/site-packages/zipp-4.1.0.dist-info
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp: PV changed from "3.23.1" to "4.1.0"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp: PKGSIZE changed from 54221 to 53725 (-1%)
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp: PKGV changed from 3.23.1 [default] to 4.1.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.14/site-packages/zipp-4.1.0.dist-info was added
  /usr/lib/python3.14/site-packages/zipp-4.1.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/zipp-4.1.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/zipp-4.1.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/zipp-4.1.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/zipp-4.1.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/zipp-3.23.1.dist-info was removed
  /usr/lib/python3.14/site-packages/zipp-3.23.1.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/zipp-3.23.1.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/zipp-3.23.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/zipp-3.23.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/zipp-3.23.1.dist-info/WHEEL was removed

--===============6982867523228964340==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-zipp-upgrade-3.23.1-4.1.0.patch"

RnJvbSBlOTY5ZGRiODYxMGQ2NDAxNjY2OTQ5YzNhNDNhMzgwYmRhNTE5YWVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwOTo0ODo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtemlwcDogdXBncmFkZSAzLjIzLjEgLT4gNC4xLjAKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy16aXBwXzMuMjMuMS5iYiA9PiBweXRob24zLXppcHBfNC4xLjAuYmJ9ICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy16aXBwXzMuMjMuMS5iYiA9PiBweXRo
b24zLXppcHBfNC4xLjAuYmJ9ICg4MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXppcHBfMy4yMy4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXppcHBfNC4xLjAuYmIKc2ltaWxhcml0eSBpbmRleCA4MyUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXppcHBfMy4yMy4xLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtemlwcF80LjEu
MC5iYgppbmRleCA0NWI4M2JmMzQ3Li5jYTNmMTI1MGMzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtemlwcF8zLjIzLjEuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXppcHBfNC4xLjAuYmIKQEAgLTMsNyArMyw3IEBA
IEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9qYXJhY28vemlwcCIKIExJQ0VOU0UgPSAi
TUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MmUyMWMzZjc1ZWI4
ZDk0MjdjOGE2MTFhOGU4M2U5ZDYiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzMjEyMGUzNzhk
MzJjZDk3MTRhZDUwM2MxZDAyNDYxOTA2M2VjMjhhYWQyMjQ4ZGM2NjcyYWQxM2VkZmE1MTEwIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjRjYjU3MzgxZjU0NDMxNWRiNzY4OGU5NzZlOTIyYTJiMThj
ZGI1MTNkMjFjYzE5NGViNDIyMzJiYTJhM2U2MDIiCiAKIERFUEVORFMgKz0gInB5dGhvbjMtc2V0
dXB0b29scy1zY20tbmF0aXZlIHB5dGhvbjMtY29oZXJlbnQtbGljZW5zZWQtbmF0aXZlIgogCi0t
IAoyLjQ3LjEKCg==

--===============6982867523228964340==--

