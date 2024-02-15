Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 237EEC54EE8
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:40 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.20157.1708018344555640532
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KYsHbxet;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WUhPlAod;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018dadd39f04-26286979-8bf6-450f-91f7-e03bcbddc2f3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aW/mqnhfGtBHriSkKK+P3qdurai6MWNkBJ8D5jYw8tk=;
	b=KYsHbxetUFjSyWnToadTqCXvu5KjWD/T+9eZhGQ/UEVQOAH95MYmHAUekhzZtejr
	ty4jDZWwbEi12OWdnRftdSriJ22QTO1oK8yGE1jyWbKBAuJagLGIp/yLsR9LsVMNsnw
	AmvmLgU7pcrRxOQSx2oj9qQXrfTJrZCvA/Ws6H1I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aW/mqnhfGtBHriSkKK+P3qdurai6MWNkBJ8D5jYw8tk=;
	b=WUhPlAodaKZQk+YeGtjTF2TSeLlcmaMiV48FcBI3SpDlJis3eGzm9z9QVNg94JAo
	B0sLPOY6LtzuJXciCFg5nIyypO4yfhY3MT+VljHJiB+SZOyZ7WpLgm4EgbsirygBdkW
	nun+1SGyOTTPR6vO7/m5Qkt2w8NqD7Fe32CWkj2s=
Content-Type: multipart/mixed; boundary="===============1544284830447483016=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.9.1 SUCCEEDED
Message-ID: <0101018dadd39f04-26286979-8bf6-450f-91f7-e03bcbddc2f3-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195571

--===============1544284830447483016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ccache* to *4.9.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ccache-upgrade-4.9-4.9.1.patch
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
From f57b1640c14556cfbed5bda5ac0d78b05e7bcca1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 06:48:10 +0000
Subject: [PATCH] ccache: upgrade 4.9 -> 4.9.1

---
 .../ccache/{ccache_4.9.bb => ccache_4.9.1.bb} | 26 +++++++++++++++++--
 .../0001-xxhash.h-Fix-build-with-gcc-12.patch |  2 +-
 2 files changed, 25 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.9.bb => ccache_4.9.1.bb} (50%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.9.bb b/meta/recipes-devtools/ccache/ccache_4.9.1.bb
similarity index 50%
rename from meta/recipes-devtools/ccache/ccache_4.9.bb
rename to meta/recipes-devtools/ccache/ccache_4.9.1.bb
index 8550470e3f..c21987ded4 100644
--- a/meta/recipes-devtools/ccache/ccache_4.9.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.9.1.bb
@@ -1,3 +1,25 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.adoc
+# +++ LICENSE.adoc
+# @@ -35,7 +35,7 @@
+#  
+#  ----
+#  Copyright (C) 2002-2007 Andrew Tridgell
+# -Copyright (C) 2009-2023 Joel Rosdahl and other contributors
+# +Copyright (C) 2009-2024 Joel Rosdahl and other contributors
+#  ----
+#  
+#  
+# 
+#
+
 SUMMARY = "a fast C/C++ compiler cache"
 DESCRIPTION = "ccache is a compiler cache. It speeds up recompilation \
 by caching the result of previous compilations and detecting when the \
@@ -7,14 +29,14 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPL-3.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=11b0b581dd56bbac4f5de214d47927ca"
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=9896d6f0aee4d89b9e5ff0afaae0af06"
 
 DEPENDS = "zstd"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://0001-xxhash.h-Fix-build-with-gcc-12.patch \
            "
-SRC_URI[sha256sum] = "866b2223d59333640f0e7a003cbb85b32d9ca3c9445bd9e3cf142942e69dd3ec"
+SRC_URI[sha256sum] = "12834ecaaaf2db069dda1d1d991f91c19e3274cc04a471af5b64195def17e90f"
 
 inherit cmake github-releases
 
diff --git a/meta/recipes-devtools/ccache/files/0001-xxhash.h-Fix-build-with-gcc-12.patch b/meta/recipes-devtools/ccache/files/0001-xxhash.h-Fix-build-with-gcc-12.patch
index e65b830257..ff98156c22 100644
--- a/meta/recipes-devtools/ccache/files/0001-xxhash.h-Fix-build-with-gcc-12.patch
+++ b/meta/recipes-devtools/ccache/files/0001-xxhash.h-Fix-build-with-gcc-12.patch
@@ -1,4 +1,4 @@
-From d17fdacf4892a15fafb56b0890ece05b485e89fb Mon Sep 17 00:00:00 2001
+From 08364b8e61dbb85adb9a7ed7a6504d8b6f74c57d Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 6 Jun 2022 17:53:20 +0800
 Subject: [PATCH] xxhash.h: Fix build with gcc-12
-- 
2.42.0


--===============1544284830447483016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ccache/ccache-dbg: PKGSIZE changed from 33606768 to 33772656 (+0%)
packages/core2-64-poky-linux/ccache/ccache-dbg: PKGV changed from 4.9 [default] to 4.9.1 [default]
packages/core2-64-poky-linux/ccache/ccache-dbg: PV changed from "4.9" to "4.9.1"
packages/core2-64-poky-linux/ccache/ccache-dev: PKGV changed from 4.9 [default] to 4.9.1 [default]
packages/core2-64-poky-linux/ccache/ccache-dev: PV changed from "4.9" to "4.9.1"
packages/core2-64-poky-linux/ccache/ccache-doc: PKGV changed from 4.9 [default] to 4.9.1 [default]
packages/core2-64-poky-linux/ccache/ccache-doc: PV changed from "4.9" to "4.9.1"
packages/core2-64-poky-linux/ccache/ccache-locale: PKGV changed from 4.9 [default] to 4.9.1 [default]
packages/core2-64-poky-linux/ccache/ccache-locale: PV changed from "4.9" to "4.9.1"
packages/core2-64-poky-linux/ccache/ccache-src: PKGSIZE changed from 2249863 to 2250219 (+0%)
packages/core2-64-poky-linux/ccache/ccache-src: PKGV changed from 4.9 [default] to 4.9.1 [default]
packages/core2-64-poky-linux/ccache/ccache-src: PV changed from "4.9" to "4.9.1"
packages/core2-64-poky-linux/ccache/ccache-staticdev: PKGV changed from 4.9 [default] to 4.9.1 [default]
packages/core2-64-poky-linux/ccache/ccache-staticdev: PV changed from "4.9" to "4.9.1"
packages/core2-64-poky-linux/ccache/ccache: PKGSIZE changed from 1641784 to 1649976 (+0%)
packages/core2-64-poky-linux/ccache/ccache: PKGV changed from 4.9 [default] to 4.9.1 [default]
packages/core2-64-poky-linux/ccache/ccache: PV changed from "4.9" to "4.9.1"
packages/core2-64-poky-linux/ccache: SRC_URI changed from "https://github.com/ccache/ccache/releases//download/v4.9/ccache-4.9.tar.gz file://0001-xxhash.h-Fix-build-with-gcc-12.patch" to "https://github.com/ccache/ccache/releases//download/v4.9.1/ccache-4.9.1.tar.gz file://0001-xxhash.h-Fix-build-with-gcc-12.patch"
packages/core2-64-poky-linux/ccache: PKGV changed from 4.9 [default] to 4.9.1 [default]
packages/core2-64-poky-linux/ccache: PV changed from "4.9" to "4.9.1"

--===============1544284830447483016==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-4.9-4.9.1.patch"

RnJvbSBmNTdiMTY0MGMxNDU1NmNmYmVkNWJkYTVhYzBkNzhiMDVlN2JjY2ExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMDY6NDg6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
Y2FjaGU6IHVwZ3JhZGUgNC45IC0+IDQuOS4xCgotLS0KIC4uLi9jY2FjaGUve2NjYWNoZV80Ljku
YmIgPT4gY2NhY2hlXzQuOS4xLmJifSB8IDI2ICsrKysrKysrKysrKysrKysrLS0KIC4uLi8wMDAx
LXh4aGFzaC5oLUZpeC1idWlsZC13aXRoLWdjYy0xMi5wYXRjaCB8ICAyICstCiAyIGZpbGVzIGNo
YW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2NjYWNoZS97Y2NhY2hlXzQuOS5iYiA9PiBjY2FjaGVfNC45LjEuYmJ9ICg1
MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC45
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC45LjEuYmIKc2ltaWxh
cml0eSBpbmRleCA1MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9j
Y2FjaGVfNC45LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNo
ZV80LjkuMS5iYgppbmRleCA4NTUwNDcwZTNmLi5jMjE5ODdkZWQ0IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjkuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC45LjEuYmIKQEAgLTEsMyArMSwyNSBAQAorIyBGSVhN
RTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0
b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4g
dGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJ
Q0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRo
ZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTog
J0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hh
bmdlczoKKyMKKyMgLS0tIExJQ0VOU0UuYWRvYworIyArKysgTElDRU5TRS5hZG9jCisjIEBAIC0z
NSw3ICszNSw3IEBACisjICAKKyMgIC0tLS0KKyMgIENvcHlyaWdodCAoQykgMjAwMi0yMDA3IEFu
ZHJldyBUcmlkZ2VsbAorIyAtQ29weXJpZ2h0IChDKSAyMDA5LTIwMjMgSm9lbCBSb3NkYWhsIGFu
ZCBvdGhlciBjb250cmlidXRvcnMKKyMgK0NvcHlyaWdodCAoQykgMjAwOS0yMDI0IEpvZWwgUm9z
ZGFobCBhbmQgb3RoZXIgY29udHJpYnV0b3JzCisjICAtLS0tCisjICAKKyMgIAorIyAKKyMKKwog
U1VNTUFSWSA9ICJhIGZhc3QgQy9DKysgY29tcGlsZXIgY2FjaGUiCiBERVNDUklQVElPTiA9ICJj
Y2FjaGUgaXMgYSBjb21waWxlciBjYWNoZS4gSXQgc3BlZWRzIHVwIHJlY29tcGlsYXRpb24gXAog
YnkgY2FjaGluZyB0aGUgcmVzdWx0IG9mIHByZXZpb3VzIGNvbXBpbGF0aW9ucyBhbmQgZGV0ZWN0
aW5nIHdoZW4gdGhlIFwKQEAgLTcsMTQgKzI5LDE0IEBAIEhPTUVQQUdFID0gImh0dHA6Ly9jY2Fj
aGUuc2FtYmEub3JnIgogU0VDVElPTiA9ICJkZXZlbCIKIAogTElDRU5TRSA9ICJHUEwtMy4wLW9y
LWxhdGVyIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5hZG9jO21kNT0xMWIw
YjU4MWRkNTZiYmFjNGY1ZGUyMTRkNDc5MjdjYSIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOU0UuYWRvYzttZDU9OTg5NmQ2ZjBhZWU0ZDg5YjllNWZmMGFmYWFlMGFmMDYiCiAKIERF
UEVORFMgPSAienN0ZCIKIAogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQv
diR7UFZ9LyR7QlB9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXh4aGFzaC5oLUZp
eC1idWlsZC13aXRoLWdjYy0xMi5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICI4NjZiMjIyM2Q1OTMzMzY0MGYwZTdhMDAzY2JiODViMzJkOWNhM2M5NDQ1YmQ5ZTNj
ZjE0Mjk0MmU2OWRkM2VjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjEyODM0ZWNhYWFmMmRiMDY5
ZGRhMWQxZDk5MWY5MWMxOWUzMjc0Y2MwNGE0NzFhZjViNjQxOTVkZWYxN2U5MGYiCiAKIGluaGVy
aXQgY21ha2UgZ2l0aHViLXJlbGVhc2VzCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9jY2FjaGUvZmlsZXMvMDAwMS14eGhhc2guaC1GaXgtYnVpbGQtd2l0aC1nY2MtMTIucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2ZpbGVzLzAwMDEteHhoYXNoLmgtRml4
LWJ1aWxkLXdpdGgtZ2NjLTEyLnBhdGNoCmluZGV4IGU2NWI4MzAyNTcuLmZmOTgxNTZjMjIgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvZmlsZXMvMDAwMS14eGhhc2gu
aC1GaXgtYnVpbGQtd2l0aC1nY2MtMTIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NjYWNoZS9maWxlcy8wMDAxLXh4aGFzaC5oLUZpeC1idWlsZC13aXRoLWdjYy0xMi5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gZDE3ZmRhY2Y0ODkyYTE1ZmFmYjU2YjA4OTBlY2UwNWI0ODVl
ODlmYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMDgzNjRiOGU2MWRiYjg1YWRiOWE3
ZWQ3YTY1MDRkOGI2Zjc0YzU3ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1pbmds
aSBZdSA8bWluZ2xpLnl1QHdpbmRyaXZlci5jb20+CiBEYXRlOiBNb24sIDYgSnVuIDIwMjIgMTc6
NTM6MjAgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0geHhoYXNoLmg6IEZpeCBidWlsZCB3aXRoIGdj
Yy0xMgotLSAKMi40Mi4wCgo=

--===============1544284830447483016==--

