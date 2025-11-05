Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 657D0CD3424
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:24 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2357.1762384577815006049
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=uv/0zAHF;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=gMPA1+CJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019a564e8310-c59453d8-ad0b-4086-82ad-bd697b0e9c29-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384577;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=z3hv36qWFVsmjjHgyry7OPzogE2PaPwZ43i1O67FkBE=;
	b=uv/0zAHFX8wjtXwJHPi9ehLL5ky4OEq/vxoJuzNLBmvC0DZwScVlTCFJvrgZ8wkf
	dE55QrZ7l3JTVx8tKWoLTn+yHBk/RUVgpzozZBffaNoGYDBWzAQ/ICvtCD5GOwhcKrg
	Del4bCI5CRpTaa3SDNyBZAfJFbUdcKum95D9Eoak=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384577;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=z3hv36qWFVsmjjHgyry7OPzogE2PaPwZ43i1O67FkBE=;
	b=gMPA1+CJo2Qz2MPhqUO4n1w4bDgcBydyFZgxHTsV8pTQVXHNCPvjWkMUpNDllJua
	6aenl/nbVZT3LC6SZb6imo/e9gqf82lSSNEFi1naBbrOUa0UKG6479FoPRKFmaeN5DA
	PQlb9+6xrZ/VN3oqd9BuEk/doaa+Nc/7egW4QoY0=
Content-Type: multipart/mixed; boundary="===============2841200577496280914=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.12.1 SUCCEEDED
Message-ID: <0101019a564e8310-c59453d8-ad0b-4086-82ad-bd697b0e9c29-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225805

--===============2841200577496280914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ccache* to *4.12.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ccache-upgrade-4.12-4.12.1.patch
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
From ff1ea846f518df068e3a56d1e7f00d4d5c3e9a12 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 15:33:56 +0000
Subject: [PATCH] ccache: upgrade 4.12 -> 4.12.1

---
 .../ccache/{ccache_4.12.bb => ccache_4.12.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.12.bb => ccache_4.12.1.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.12.bb b/meta/recipes-devtools/ccache/ccache_4.12.1.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.12.bb
rename to meta/recipes-devtools/ccache/ccache_4.12.1.bb
index 52643c4bff..2d0b83e244 100644
--- a/meta/recipes-devtools/ccache/ccache_4.12.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.12.1.bb
@@ -17,7 +17,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "e884c62cbacae2e9488b8641a671a79fb7a1221db01310dacef61c9e55c2e55b"
+SRC_URI[sha256sum] = "a3da50ab0fb0d42f60c17d1450312e6ace9b681f6221cb77c8a09a845f9d760c"
 
 inherit cmake github-releases
 
-- 
2.47.1


--===============2841200577496280914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PKGSIZE changed from 34501176 to 34517064 (+0%)
packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PKGV changed from 4.12 [default] to 4.12.1 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PV changed from "4.12" to "4.12.1"
packages/x86-64-v3-poky-linux/ccache/ccache-dev: PKGV changed from 4.12 [default] to 4.12.1 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-dev: PV changed from "4.12" to "4.12.1"
packages/x86-64-v3-poky-linux/ccache/ccache-doc: PKGV changed from 4.12 [default] to 4.12.1 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-doc: PV changed from "4.12" to "4.12.1"
packages/x86-64-v3-poky-linux/ccache/ccache-locale: PKGV changed from 4.12 [default] to 4.12.1 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-locale: PV changed from "4.12" to "4.12.1"
packages/x86-64-v3-poky-linux/ccache/ccache-src: PKGSIZE changed from 1801295 to 1802121 (+0%)
packages/x86-64-v3-poky-linux/ccache/ccache-src: PKGV changed from 4.12 [default] to 4.12.1 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-src: PV changed from "4.12" to "4.12.1"
packages/x86-64-v3-poky-linux/ccache/ccache-staticdev: PKGV changed from 4.12 [default] to 4.12.1 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-staticdev: PV changed from "4.12" to "4.12.1"
packages/x86-64-v3-poky-linux/ccache/ccache: PKGV changed from 4.12 [default] to 4.12.1 [default]
packages/x86-64-v3-poky-linux/ccache/ccache: PV changed from "4.12" to "4.12.1"
packages/x86-64-v3-poky-linux/ccache: SRC_URI changed from "https://github.com/ccache/ccache/releases//download/v4.12/ccache-4.12.tar.gz" to "https://github.com/ccache/ccache/releases//download/v4.12.1/ccache-4.12.1.tar.gz"
packages/x86-64-v3-poky-linux/ccache: PKGV changed from 4.12 [default] to 4.12.1 [default]
packages/x86-64-v3-poky-linux/ccache: PV changed from "4.12" to "4.12.1"

--===============2841200577496280914==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-4.12-4.12.1.patch"

RnJvbSBmZjFlYTg0NmY1MThkZjA2OGUzYTU2ZDFlN2YwMGQ0ZDVjM2U5YTEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNTozMzo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNj
YWNoZTogdXBncmFkZSA0LjEyIC0+IDQuMTIuMQoKLS0tCiAuLi4vY2NhY2hlL3tjY2FjaGVfNC4x
Mi5iYiA9PiBjY2FjaGVfNC4xMi4xLmJifSAgICAgICAgICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvY2NhY2hlL3tjY2FjaGVfNC4xMi5iYiA9PiBjY2FjaGVfNC4xMi4xLmJifSAo
OTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQu
MTIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjEyLjEuYmIKc2lt
aWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNo
ZS9jY2FjaGVfNC4xMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9j
Y2FjaGVfNC4xMi4xLmJiCmluZGV4IDUyNjQzYzRiZmYuLjJkMGI4M2UyNDQgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQuMTIuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC4xMi4xLmJiCkBAIC0xNyw3ICsxNyw3IEBA
IERFUEVORFMgPSAienN0ZCBmbXQgeHhoYXNoIgogCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0Vf
VVJJfS9kb3dubG9hZC92JHtQVn0vJHtCUH0udGFyLmd6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiZTg4NGM2MmNiYWNhZTJlOTQ4OGI4NjQxYTY3MWE3OWZiN2ExMjIxZGIwMTMxMGRhY2VmNjFj
OWU1NWMyZTU1YiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhM2RhNTBhYjBmYjBkNDJmNjBjMTdk
MTQ1MDMxMmU2YWNlOWI2ODFmNjIyMWNiNzdjOGEwOWE4NDVmOWQ3NjBjIgogCiBpbmhlcml0IGNt
YWtlIGdpdGh1Yi1yZWxlYXNlcwogCi0tIAoyLjQ3LjEKCg==

--===============2841200577496280914==--

