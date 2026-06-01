Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EF26CD6E72
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:41 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1565.1780328135338340405
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CAZDysMS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Qj8AKqE4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019e83d377ca-e5086596-2ae4-4a94-a5c3-c4bb774eef1f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328134;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=k/InRr2kyVNdY+PjSHaTx8hvADvXUpAVSNU1KiChaNw=;
	b=CAZDysMS7iMLnQkvbp9tiSUo/Q5I8IVB5JjkcB4sZZmql/5PQU2Rg2CX0ShGm/Cu
	dQ1vfno4D2XNCcEyCt/Y/lyvgR+resinvjzj2shb4tpxulIeLJEyvyw/4cLyimo2Guq
	8MoMfMyKLyHqrEKkakfCRRITpL3xvL7kkpeSNFuE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328134;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=k/InRr2kyVNdY+PjSHaTx8hvADvXUpAVSNU1KiChaNw=;
	b=Qj8AKqE4M1suVfAnMze23PQWSdq/jhleExeUzprA55C6EAtsYYjLP95h/t/O8J2f
	LuwNI3MzOzGhONtqeRL9gC3EJ2jdJDfcpbG8a5JzrS8rZ5BTI8LkTBgCAoQF+xZHiw4
	RVCy/AY9C4EHAMcBA02Yhn4f4xde40F7XnBECXs0=
Content-Type: multipart/mixed; boundary="===============4391009747808512196=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.13.6 SUCCEEDED
Message-ID: <0101019e83d377ca-e5086596-2ae4-4a94-a5c3-c4bb774eef1f-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237868

--===============4391009747808512196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ccache* to *4.13.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ccache-upgrade-4.13.5-4.13.6.patch
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
From 5f78fd36364669a3ed3a6074cba9b24bf94fd1c8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 07:45:15 +0000
Subject: [PATCH] ccache: upgrade 4.13.5 -> 4.13.6

---
 .../ccache/{ccache_4.13.5.bb => ccache_4.13.6.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.13.5.bb => ccache_4.13.6.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.13.5.bb b/meta/recipes-devtools/ccache/ccache_4.13.6.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.13.5.bb
rename to meta/recipes-devtools/ccache/ccache_4.13.6.bb
index d0e154f51f..789440f761 100644
--- a/meta/recipes-devtools/ccache/ccache_4.13.5.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.13.6.bb
@@ -16,7 +16,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "2fb4896269a1ef15da99ba940ac1478b38f2c4b720797205860bf40364f37d37"
+SRC_URI[sha256sum] = "d42ace95dec14583fb8af19ed117919995bd910376f52d9b6f546046b792dfb7"
 
 inherit cmake github-releases
 
-- 
2.47.1


--===============4391009747808512196==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-4.13.5-4.13.6.patch"

RnJvbSA1Zjc4ZmQzNjM2NDY2OWEzZWQzYTYwNzRjYmE5YjI0YmY5NGZkMWM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwNzo0NToxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNj
YWNoZTogdXBncmFkZSA0LjEzLjUgLT4gNC4xMy42CgotLS0KIC4uLi9jY2FjaGUve2NjYWNoZV80
LjEzLjUuYmIgPT4gY2NhY2hlXzQuMTMuNi5iYn0gICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9jY2FjaGUve2NjYWNoZV80LjEzLjUuYmIgPT4gY2NhY2hlXzQuMTMuNi5i
Yn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNo
ZV80LjEzLjUuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjEzLjYu
YmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NjYWNoZS9jY2FjaGVfNC4xMy41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Y2NhY2hlL2NjYWNoZV80LjEzLjYuYmIKaW5kZXggZDBlMTU0ZjUxZi4uNzg5NDQwZjc2MSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC4xMy41LmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQuMTMuNi5iYgpAQCAtMTYs
NyArMTYsNyBAQCBERVBFTkRTID0gInpzdGQgZm10IHh4aGFzaCIKIAogU1JDX1VSSSA9ICIke0dJ
VEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9LyR7QlB9LnRhci5neiIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjJmYjQ4OTYyNjlhMWVmMTVkYTk5YmE5NDBhYzE0NzhiMzhmMmM0YjcyMDc5
NzIwNTg2MGJmNDAzNjRmMzdkMzciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDQyYWNlOTVkZWMx
NDU4M2ZiOGFmMTllZDExNzkxOTk5NWJkOTEwMzc2ZjUyZDliNmY1NDYwNDZiNzkyZGZiNyIKIAog
aW5oZXJpdCBjbWFrZSBnaXRodWItcmVsZWFzZXMKIAotLSAKMi40Ny4xCgo=

--===============4391009747808512196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PKGV changed from 4.13.5 [default] to 4.13.6 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PV changed from "4.13.5" to "4.13.6"
packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PKGSIZE changed from 41515384 to 41525088 (+0%)
packages/x86-64-v3-poky-linux/ccache/ccache-dev: PKGV changed from 4.13.5 [default] to 4.13.6 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-dev: PV changed from "4.13.5" to "4.13.6"
packages/x86-64-v3-poky-linux/ccache/ccache-doc: PKGV changed from 4.13.5 [default] to 4.13.6 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-doc: PV changed from "4.13.5" to "4.13.6"
packages/x86-64-v3-poky-linux/ccache/ccache-locale: PKGV changed from 4.13.5 [default] to 4.13.6 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-locale: PV changed from "4.13.5" to "4.13.6"
packages/x86-64-v3-poky-linux/ccache/ccache-src: PKGV changed from 4.13.5 [default] to 4.13.6 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-src: PV changed from "4.13.5" to "4.13.6"
packages/x86-64-v3-poky-linux/ccache/ccache-src: PKGSIZE changed from 1844233 to 1844974 (+0%)
packages/x86-64-v3-poky-linux/ccache/ccache-src: FILELIST: directory renamed /usr/src/debug/ccache/4.13.5/src/ccache/storage/local -> /usr/src/debug/ccache/4.13.6/src/ccache/storage/local, directory renamed /usr/src/debug/ccache/4.13.5/src/third_party/blake3/blake3 -> /usr/src/debug/ccache/4.13.6/src/third_party/blake3/blake3, directory renamed /usr/src/debug/ccache/4.13.5/src/ccache/core -> /usr/src/debug/ccache/4.13.6/src/ccache/core, directory renamed /usr/src/debug/ccache/4.13.5/src/ccache/storage/remote -> /usr/src/debug/ccache/4.13.6/src/ccache/storage/remote, directory renamed /usr/src/debug/ccache/4.13.5/src/third_party/cxxurl/cxxurl -> /usr/src/debug/ccache/4.13.6/src/third_party/cxxurl/cxxurl, directory renamed /usr/src/debug/ccache/4.13.5/src/ccache/util -> /usr/src/debug/ccache/4.13.6/src/ccache/util, directory renamed /usr/src/debug/ccache/4.13.5/src/ccache/compiler -> /usr/src/debug/ccache/4.13.6/src/ccache/compiler, directory renamed /usr/src/debug/ccache/4.13.5/src/cc
 ache/storage -> /usr/src/debug/ccache/4.13.6/src/ccache/storage, directory renamed /usr/src/debug/ccache/4.13.5/src/ccache -> /usr/src/debug/ccache/4.13.6/src/ccache, directory renamed /usr/src/debug/ccache/4.13.5/src/third_party/tl-expected/tl -> /usr/src/debug/ccache/4.13.6/src/third_party/tl-expected/tl, directory renamed /usr/src/debug/ccache/4.13.5/src/third_party/cpp-httplib -> /usr/src/debug/ccache/4.13.6/src/third_party/cpp-httplib
packages/x86-64-v3-poky-linux/ccache/ccache-staticdev: PKGV changed from 4.13.5 [default] to 4.13.6 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-staticdev: PV changed from "4.13.5" to "4.13.6"
packages/x86-64-v3-poky-linux/ccache/ccache: PKGV changed from 4.13.5 [default] to 4.13.6 [default]
packages/x86-64-v3-poky-linux/ccache/ccache: PV changed from "4.13.5" to "4.13.6"
packages/x86-64-v3-poky-linux/ccache: PKGV changed from 4.13.5 [default] to 4.13.6 [default]
packages/x86-64-v3-poky-linux/ccache: PV changed from "4.13.5" to "4.13.6"
packages/x86-64-v3-poky-linux/ccache: SRC_URI changed from "https://github.com/ccache/ccache/releases//download/v4.13.5/ccache-4.13.5.tar.gz" to "https://github.com/ccache/ccache/releases//download/v4.13.6/ccache-4.13.6.tar.gz"

--===============4391009747808512196==--

