Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E436ACD342F
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:38 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15609.1777645532270387654
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=0NAspRYt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=QUfwL/x/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019de3ee40f4-bb35854e-a9a1-4d84-8ba9-23808ca534c6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7r7q1bZEqIKoFH1520Od6XMJfe7bkzj7OjgHd1TkKsQ=;
	b=0NAspRYthd7au+QYwxm4I0ZZgxAwA/cqu1eodDRFqJ2EPSbOXdtwJ0SBFTMwGPhh
	VI1apXo5e15k8r8LiGuqlcJ27Swdf/bI/kmazQb9NdEnvu2heoQEyFZgS4sHeAANCfy
	aCHrBwzeHRav2yyT3JIQPcH9x6wCIeQzH58Y/JnU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7r7q1bZEqIKoFH1520Od6XMJfe7bkzj7OjgHd1TkKsQ=;
	b=QUfwL/x/ko4gEm1paRCY2xPhv7mKmKTqOPh1mDwEV+kvzJk6JqM7DgQiYseSrdm5
	vcBVlJl5GE1NiHut9Ars0ibgs/FnCCJrdYuaeDvKTZRFJi3ToB/tkicB141eHwT8JXb
	315l71sqqaqztW2talHwU1I8XEzIOWmsd2u5cJyQ=
Content-Type: multipart/mixed; boundary="===============6314054538643349032=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.13.5 SUCCEEDED
Message-ID: <0101019de3ee40f4-bb35854e-a9a1-4d84-8ba9-23808ca534c6-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236218

--===============6314054538643349032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ccache* to *4.13.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ccache-upgrade-4.13.3-4.13.5.patch
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
From c154ab53bb1ee483771a6d34a9483dc78b01b8d1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 07:13:31 +0000
Subject: [PATCH] ccache: upgrade 4.13.3 -> 4.13.5

---
 .../ccache/{ccache_4.13.3.bb => ccache_4.13.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.13.3.bb => ccache_4.13.5.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.13.3.bb b/meta/recipes-devtools/ccache/ccache_4.13.5.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.13.3.bb
rename to meta/recipes-devtools/ccache/ccache_4.13.5.bb
index ec440900f6..d0e154f51f 100644
--- a/meta/recipes-devtools/ccache/ccache_4.13.3.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.13.5.bb
@@ -16,7 +16,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "c149d71f47f6fe08e4f2e43db4b0b091c61e8ea3daa23aa998b094bd84ecdfe8"
+SRC_URI[sha256sum] = "2fb4896269a1ef15da99ba940ac1478b38f2c4b720797205860bf40364f37d37"
 
 inherit cmake github-releases
 
-- 
2.47.1


--===============6314054538643349032==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-4.13.3-4.13.5.patch"

RnJvbSBjMTU0YWI1M2JiMWVlNDgzNzcxYTZkMzRhOTQ4M2RjNzhiMDFiOGQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwNzoxMzozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNj
YWNoZTogdXBncmFkZSA0LjEzLjMgLT4gNC4xMy41CgotLS0KIC4uLi9jY2FjaGUve2NjYWNoZV80
LjEzLjMuYmIgPT4gY2NhY2hlXzQuMTMuNS5iYn0gICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9jY2FjaGUve2NjYWNoZV80LjEzLjMuYmIgPT4gY2NhY2hlXzQuMTMuNS5i
Yn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNo
ZV80LjEzLjMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjEzLjUu
YmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NjYWNoZS9jY2FjaGVfNC4xMy4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Y2NhY2hlL2NjYWNoZV80LjEzLjUuYmIKaW5kZXggZWM0NDA5MDBmNi4uZDBlMTU0ZjUxZiAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC4xMy4zLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQuMTMuNS5iYgpAQCAtMTYs
NyArMTYsNyBAQCBERVBFTkRTID0gInpzdGQgZm10IHh4aGFzaCIKIAogU1JDX1VSSSA9ICIke0dJ
VEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9LyR7QlB9LnRhci5neiIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gImMxNDlkNzFmNDdmNmZlMDhlNGYyZTQzZGI0YjBiMDkxYzYxZThlYTNkYWEy
M2FhOTk4YjA5NGJkODRlY2RmZTgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmZiNDg5NjI2OWEx
ZWYxNWRhOTliYTk0MGFjMTQ3OGIzOGYyYzRiNzIwNzk3MjA1ODYwYmY0MDM2NGYzN2QzNyIKIAog
aW5oZXJpdCBjbWFrZSBnaXRodWItcmVsZWFzZXMKIAotLSAKMi40Ny4xCgo=

--===============6314054538643349032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PKGV changed from 4.13.3 [default] to 4.13.5 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PV changed from "4.13.3" to "4.13.5"
packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PKGSIZE changed from 40658216 to 40660184 (+0%)
packages/x86-64-v3-poky-linux/ccache/ccache-dev: PKGV changed from 4.13.3 [default] to 4.13.5 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-dev: PV changed from "4.13.3" to "4.13.5"
packages/x86-64-v3-poky-linux/ccache/ccache-doc: PKGV changed from 4.13.3 [default] to 4.13.5 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-doc: PV changed from "4.13.3" to "4.13.5"
packages/x86-64-v3-poky-linux/ccache/ccache-locale: PKGV changed from 4.13.3 [default] to 4.13.5 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-locale: PV changed from "4.13.3" to "4.13.5"
packages/x86-64-v3-poky-linux/ccache/ccache-src: PKGV changed from 4.13.3 [default] to 4.13.5 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-src: FILELIST: directory renamed /usr/src/debug/ccache/4.13.3/src/ccache/compiler -> /usr/src/debug/ccache/4.13.5/src/ccache/compiler, directory renamed /usr/src/debug/ccache/4.13.3/src/third_party/blake3/blake3 -> /usr/src/debug/ccache/4.13.5/src/third_party/blake3/blake3, directory renamed /usr/src/debug/ccache/4.13.3/src/ccache -> /usr/src/debug/ccache/4.13.5/src/ccache, directory renamed /usr/src/debug/ccache/4.13.3/src/third_party/cpp-httplib -> /usr/src/debug/ccache/4.13.5/src/third_party/cpp-httplib, directory renamed /usr/src/debug/ccache/4.13.3/src/third_party/cxxurl/cxxurl -> /usr/src/debug/ccache/4.13.5/src/third_party/cxxurl/cxxurl, directory renamed /usr/src/debug/ccache/4.13.3/src/third_party/tl-expected/tl -> /usr/src/debug/ccache/4.13.5/src/third_party/tl-expected/tl, directory renamed /usr/src/debug/ccache/4.13.3/src/ccache/storage -> /usr/src/debug/ccache/4.13.5/src/ccache/storage, directory renamed /usr/src/debug/ccache/4
 .13.3/src/ccache/storage/remote -> /usr/src/debug/ccache/4.13.5/src/ccache/storage/remote, directory renamed /usr/src/debug/ccache/4.13.3/src/ccache/util -> /usr/src/debug/ccache/4.13.5/src/ccache/util, directory renamed /usr/src/debug/ccache/4.13.3/src/ccache/storage/local -> /usr/src/debug/ccache/4.13.5/src/ccache/storage/local, directory renamed /usr/src/debug/ccache/4.13.3/src/ccache/core -> /usr/src/debug/ccache/4.13.5/src/ccache/core
packages/x86-64-v3-poky-linux/ccache/ccache-src: PV changed from "4.13.3" to "4.13.5"
packages/x86-64-v3-poky-linux/ccache/ccache-src: PKGSIZE changed from 1843836 to 1844233 (+0%)
packages/x86-64-v3-poky-linux/ccache/ccache-staticdev: PKGV changed from 4.13.3 [default] to 4.13.5 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-staticdev: PV changed from "4.13.3" to "4.13.5"
packages/x86-64-v3-poky-linux/ccache/ccache: PKGV changed from 4.13.3 [default] to 4.13.5 [default]
packages/x86-64-v3-poky-linux/ccache/ccache: PV changed from "4.13.3" to "4.13.5"
packages/x86-64-v3-poky-linux/ccache: PKGV changed from 4.13.3 [default] to 4.13.5 [default]
packages/x86-64-v3-poky-linux/ccache: PV changed from "4.13.3" to "4.13.5"
packages/x86-64-v3-poky-linux/ccache: SRC_URI changed from "https://github.com/ccache/ccache/releases//download/v4.13.3/ccache-4.13.3.tar.gz" to "https://github.com/ccache/ccache/releases//download/v4.13.5/ccache-4.13.5.tar.gz"

--===============6314054538643349032==--

