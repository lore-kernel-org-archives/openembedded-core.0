Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7CBDCD98F0
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:50 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50417.1781195501857594655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NopV1oKH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CUOHGJl9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019eb7866e55-a93da627-0ea6-4eb1-9220-c4892b924062-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195501;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AAaWfX9Vz0x5TwIKcGqCvzLJd6/jJKtgsXjPIq8m/KU=;
	b=NopV1oKHEzFsJccsjVMOMmzdIdOxRNd3CLcTDUP2bxt+vSSFBRTSiKvPvVl5lQeF
	c6izIJTJbO6zQBhNERvmKVaTtk8vPpQ7Ha0Z3U2AXxWQ0i7YC9gC+SQm9hZwk5b0hRP
	LI0Nl6E1DHYhFVli2jU2z1F5u/tqcpUBeMBRcHH0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195501;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AAaWfX9Vz0x5TwIKcGqCvzLJd6/jJKtgsXjPIq8m/KU=;
	b=CUOHGJl98BgNKKkSkr+oTIrOUJt6lU6TnsgAC61JBg/sCIuhPoK5yPy0LLCUukW7
	k/MvmlpUiHm/6ePbbUY57oLMnA6o31iwnPSQQLDRD9xouCBaI+cuE5UbmPFME2Ac8mZ
	knGp/5vqny2uCyTnXEcgcnS5h+EoIa3XObKxWVxU=
Content-Type: multipart/mixed; boundary="===============8886739076440075913=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.13.6 SUCCEEDED
Message-ID: <0101019eb7866e55-a93da627-0ea6-4eb1-9220-c4892b924062-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238477

--===============8886739076440075913==
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
From 11fa0391935400a0f9c1041a790b9cd94c26283e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 08:47:48 +0000
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


--===============8886739076440075913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PV changed from "4.13.5" to "4.13.6"
packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PKGSIZE changed from 41515384 to 41525088 (+0%)
packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PKGV changed from 4.13.5 [default] to 4.13.6 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-dev: PV changed from "4.13.5" to "4.13.6"
packages/x86-64-v3-poky-linux/ccache/ccache-dev: PKGV changed from 4.13.5 [default] to 4.13.6 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-doc: PV changed from "4.13.5" to "4.13.6"
packages/x86-64-v3-poky-linux/ccache/ccache-doc: PKGV changed from 4.13.5 [default] to 4.13.6 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-locale: PV changed from "4.13.5" to "4.13.6"
packages/x86-64-v3-poky-linux/ccache/ccache-locale: PKGV changed from 4.13.5 [default] to 4.13.6 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-src: PV changed from "4.13.5" to "4.13.6"
packages/x86-64-v3-poky-linux/ccache/ccache-src: PKGSIZE changed from 1844233 to 1844974 (+0%)
packages/x86-64-v3-poky-linux/ccache/ccache-src: FILELIST: directory renamed /usr/src/debug/ccache/4.13.5/src/ccache/core -> /usr/src/debug/ccache/4.13.6/src/ccache/core, directory renamed /usr/src/debug/ccache/4.13.5/src/ccache/util -> /usr/src/debug/ccache/4.13.6/src/ccache/util, directory renamed /usr/src/debug/ccache/4.13.5/src/ccache/storage/remote -> /usr/src/debug/ccache/4.13.6/src/ccache/storage/remote, directory renamed /usr/src/debug/ccache/4.13.5/src/third_party/cpp-httplib -> /usr/src/debug/ccache/4.13.6/src/third_party/cpp-httplib, directory renamed /usr/src/debug/ccache/4.13.5/src/ccache/storage -> /usr/src/debug/ccache/4.13.6/src/ccache/storage, directory renamed /usr/src/debug/ccache/4.13.5/src/third_party/tl-expected/tl -> /usr/src/debug/ccache/4.13.6/src/third_party/tl-expected/tl, directory renamed /usr/src/debug/ccache/4.13.5/src/ccache/storage/local -> /usr/src/debug/ccache/4.13.6/src/ccache/storage/local, directory renamed /usr/src/debug/ccache/4.13.5/src/third_
 party/blake3/blake3 -> /usr/src/debug/ccache/4.13.6/src/third_party/blake3/blake3, directory renamed /usr/src/debug/ccache/4.13.5/src/ccache -> /usr/src/debug/ccache/4.13.6/src/ccache, directory renamed /usr/src/debug/ccache/4.13.5/src/ccache/compiler -> /usr/src/debug/ccache/4.13.6/src/ccache/compiler, directory renamed /usr/src/debug/ccache/4.13.5/src/third_party/cxxurl/cxxurl -> /usr/src/debug/ccache/4.13.6/src/third_party/cxxurl/cxxurl
packages/x86-64-v3-poky-linux/ccache/ccache-src: PKGV changed from 4.13.5 [default] to 4.13.6 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-staticdev: PV changed from "4.13.5" to "4.13.6"
packages/x86-64-v3-poky-linux/ccache/ccache-staticdev: PKGV changed from 4.13.5 [default] to 4.13.6 [default]
packages/x86-64-v3-poky-linux/ccache/ccache: PV changed from "4.13.5" to "4.13.6"
packages/x86-64-v3-poky-linux/ccache/ccache: PKGV changed from 4.13.5 [default] to 4.13.6 [default]
packages/x86-64-v3-poky-linux/ccache: PV changed from "4.13.5" to "4.13.6"
packages/x86-64-v3-poky-linux/ccache: SRC_URI changed from "https://github.com/ccache/ccache/releases//download/v4.13.5/ccache-4.13.5.tar.gz" to "https://github.com/ccache/ccache/releases//download/v4.13.6/ccache-4.13.6.tar.gz"
packages/x86-64-v3-poky-linux/ccache: PKGV changed from 4.13.5 [default] to 4.13.6 [default]

--===============8886739076440075913==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-4.13.5-4.13.6.patch"

RnJvbSAxMWZhMDM5MTkzNTQwMGEwZjljMTA0MWE3OTBiOWNkOTRjMjYyODNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMDg6NDc6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
Y2FjaGU6IHVwZ3JhZGUgNC4xMy41IC0+IDQuMTMuNgoKLS0tCiAuLi4vY2NhY2hlL3tjY2FjaGVf
NC4xMy41LmJiID0+IGNjYWNoZV80LjEzLjYuYmJ9ICAgICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvY2NhY2hlL3tjY2FjaGVfNC4xMy41LmJiID0+IGNjYWNoZV80LjEzLjYu
YmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2Fj
aGVfNC4xMy41LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC4xMy42
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9jY2FjaGUvY2NhY2hlXzQuMTMuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NjYWNoZS9jY2FjaGVfNC4xMy42LmJiCmluZGV4IGQwZTE1NGY1MWYuLjc4OTQ0MGY3NjEgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQuMTMuNS5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjEzLjYuYmIKQEAgLTE2
LDcgKzE2LDcgQEAgREVQRU5EUyA9ICJ6c3RkIGZtdCB4eGhhc2giCiAKIFNSQ19VUkkgPSAiJHtH
SVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkL3Yke1BWfS8ke0JQfS50YXIuZ3oiCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICIyZmI0ODk2MjY5YTFlZjE1ZGE5OWJhOTQwYWMxNDc4YjM4ZjJjNGI3MjA3
OTcyMDU4NjBiZjQwMzY0ZjM3ZDM3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ0MmFjZTk1ZGVj
MTQ1ODNmYjhhZjE5ZWQxMTc5MTk5OTViZDkxMDM3NmY1MmQ5YjZmNTQ2MDQ2Yjc5MmRmYjciCiAK
IGluaGVyaXQgY21ha2UgZ2l0aHViLXJlbGVhc2VzCiAKLS0gCjIuNDcuMQoK

--===============8886739076440075913==--

