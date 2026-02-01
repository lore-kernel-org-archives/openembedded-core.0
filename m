Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F92E6528D
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:13:09 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29183.1769951561014824633
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:13:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=0LNgpOpM;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=RJqWlIQ3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019c1955cce7-141c6fc9-bcfd-4fb1-be2f-5386e8538252-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951579;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oJLn0Bldlhsn8sZzrOE7XMJyY9JPwuv9tCmTRMD7cTA=;
	b=0LNgpOpM5HrZXCw+yQ+3SmL2LWUy0Kj8TKt13o7EQkHMvvbdI1wPoPu1cqrC6AtM
	klYW/Ar9BZDrzhV/Tz5FaYwcpqIYqlnrIR9KYIMFi4YTcvEVNgvTftX4+yLwKBSGYwm
	PIG9/XGuzR32j9J39dIUlu6cO8l0OsCImX83FHxo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951579;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oJLn0Bldlhsn8sZzrOE7XMJyY9JPwuv9tCmTRMD7cTA=;
	b=RJqWlIQ3WS2EdB87msSiIJvFpBmxdyNIjd5BJQlD9MI8A2UedWMTcO8acWttva8J
	3xvefaIfm0GMi+dNucU4gDaQJamQP14N+cHuMFREm8bKFEafll/wvlDjAF9jGBng1xZ
	Nwx19LghRQdfGwA9YwwbkM28n9jDz8E/leaRm6XI=
Content-Type: multipart/mixed; boundary="===============4167736961029984258=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] mpg123: upgrading to 1.33.4 SUCCEEDED
Message-ID: <0101019c1955cce7-141c6fc9-bcfd-4fb1-be2f-5386e8538252-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:13:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230326

--===============4167736961029984258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mpg123* to *1.33.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mpg123-upgrade-1.33.3-1.33.4.patch
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
From 0addaca8895bd9d3ba1396e05b28d07b76eadc23 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 12:43:05 +0000
Subject: [PATCH] mpg123: upgrade 1.33.3 -> 1.33.4

---
 .../mpg123/{mpg123_1.33.3.bb => mpg123_1.33.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.33.3.bb => mpg123_1.33.4.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.33.3.bb b/meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.33.3.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb
index b1897fe95d..648eb21500 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.33.3.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "6a0c6472dd156e213c2068f40115ebbb73978c2d873e66bae2a250e2d2198d26"
+SRC_URI[sha256sum] = "3ae8c9ff80a97bfc0e22e89fbcd74687eca4fc1db315b12607f27f01cb5a47d9"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.47.1


--===============4167736961029984258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mpg123: PV changed from "1.33.3" to "1.33.4"
packages/x86-64-v3-poky-linux/mpg123: SRC_URI changed from "https://www.mpg123.de/download/mpg123-1.33.3.tar.bz2" to "https://www.mpg123.de/download/mpg123-1.33.4.tar.bz2"
packages/x86-64-v3-poky-linux/mpg123: PKGV changed from 1.33.3 [default] to 1.33.4 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-dbg: PV changed from "1.33.3" to "1.33.4"
packages/x86-64-v3-poky-linux/mpg123/mpg123-dbg: PKGSIZE changed from 2389168 to 2389432 (+0%)
packages/x86-64-v3-poky-linux/mpg123/mpg123-dbg: PKGV changed from 1.33.3 [default] to 1.33.4 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-dev: PV changed from "1.33.3" to "1.33.4"
packages/x86-64-v3-poky-linux/mpg123/mpg123-dev: PKGV changed from 1.33.3 [default] to 1.33.4 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-doc: PV changed from "1.33.3" to "1.33.4"
packages/x86-64-v3-poky-linux/mpg123/mpg123-doc: PKGV changed from 1.33.3 [default] to 1.33.4 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-locale: PV changed from "1.33.3" to "1.33.4"
packages/x86-64-v3-poky-linux/mpg123/mpg123-locale: PKGV changed from 1.33.3 [default] to 1.33.4 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-src: PV changed from "1.33.3" to "1.33.4"
packages/x86-64-v3-poky-linux/mpg123/mpg123-src: PKGSIZE changed from 1915330 to 1916492 (+0%)
packages/x86-64-v3-poky-linux/mpg123/mpg123-src: FILELIST: directory renamed /usr/src/debug/mpg123/1.33.3/src/libout123 -> /usr/src/debug/mpg123/1.33.4/src/libout123, directory renamed /usr/src/debug/mpg123/1.33.3/src/libmpg123 -> /usr/src/debug/mpg123/1.33.4/src/libmpg123, directory renamed /usr/src/debug/mpg123/1.33.3/src/include -> /usr/src/debug/mpg123/1.33.4/src/include, directory renamed /usr/src/debug/mpg123/1.33.3/src/common -> /usr/src/debug/mpg123/1.33.4/src/common, directory renamed /usr/src/debug/mpg123/1.33.3/src/libout123/modules -> /usr/src/debug/mpg123/1.33.4/src/libout123/modules, directory renamed /usr/src/debug/mpg123/1.33.3/src/compat -> /usr/src/debug/mpg123/1.33.4/src/compat, directory renamed /usr/src/debug/mpg123/1.33.3/src -> /usr/src/debug/mpg123/1.33.4/src, directory renamed /usr/src/debug/mpg123/1.33.3/src/libsyn123 -> /usr/src/debug/mpg123/1.33.4/src/libsyn123
packages/x86-64-v3-poky-linux/mpg123/mpg123-src: PKGV changed from 1.33.3 [default] to 1.33.4 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-staticdev: PV changed from "1.33.3" to "1.33.4"
packages/x86-64-v3-poky-linux/mpg123/mpg123-staticdev: PKGV changed from 1.33.3 [default] to 1.33.4 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123: PV changed from "1.33.3" to "1.33.4"
packages/x86-64-v3-poky-linux/mpg123/mpg123: PKGV changed from 1.33.3 [default] to 1.33.4 [default]

--===============4167736961029984258==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mpg123-upgrade-1.33.3-1.33.4.patch"

RnJvbSAwYWRkYWNhODg5NWJkOWQzYmExMzk2ZTA1YjI4ZDA3Yjc2ZWFkYzIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAxMjo0MzowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1w
ZzEyMzogdXBncmFkZSAxLjMzLjMgLT4gMS4zMy40CgotLS0KIC4uLi9tcGcxMjMve21wZzEyM18x
LjMzLjMuYmIgPT4gbXBnMTIzXzEuMzMuNC5iYn0gICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL21wZzEyMy97bXBnMTIzXzEuMzMuMy5iYiA9PiBtcGcxMjNfMS4zMy40
LmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9t
cGcxMjNfMS4zMy4zLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvbXBnMTIzL21wZzEyM18x
LjMzLjQuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvbXBnMTIzL21wZzEyM18xLjMzLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL21wZzEyMy9tcGcxMjNfMS4zMy40LmJiCmluZGV4IGIxODk3ZmU5NWQuLjY0OGVi
MjE1MDAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9tcGcxMjNf
MS4zMy4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9tcGcxMjNfMS4z
My40LmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ0VOU0UgPSAiTEdQTC0yLjEtb25seSIKIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWU3YjljMTVmY2ZiOTg2YWJiNGNjNWU4
NDAwYTI0MTY5IgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3Lm1wZzEyMy5kZS9kb3dubG9hZC8k
e0JQfS50YXIuYnoyIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjZhMGM2NDcyZGQxNTZlMjEzYzIw
NjhmNDAxMTVlYmJiNzM5NzhjMmQ4NzNlNjZiYWUyYTI1MGUyZDIxOThkMjYiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiM2FlOGM5ZmY4MGE5N2JmYzBlMjJlODlmYmNkNzQ2ODdlY2E0ZmMxZGIzMTVi
MTI2MDdmMjdmMDFjYjVhNDdkOSIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAibXBnMTIzLSg/
UDxwdmVyPlxkKyhcLlxkKykrKVwudGFyIgogCi0tIAoyLjQ3LjEKCg==

--===============4167736961029984258==--

