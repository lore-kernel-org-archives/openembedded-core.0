Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7417DCD4855
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:59 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15709.1777645532662829268
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=pYO0q+GV;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pQ6jgvEB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019de3ee856b-ff0c1acf-1d70-47ac-8041-1b93fdb7b6ca-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=y4R/PdMySpOTVyo+K8TZNcTVrjQhqqhhRfSJzNKzR5o=;
	b=pYO0q+GVMz6AAvYIO7gGuavp9wvvPpNWvUQosUvuYfZ27ep4UfyMj8EsVL7Jmfxs
	LN/rL7M2VhFU01dgVEt2hMFYSuwXWqLw53VZh20tpAdmOODB8c0Aiy6ComWx3Jhof63
	1hR7ZPYd8LPqKqmJZDDGIN1beWodWkgWgEvZFaYk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=y4R/PdMySpOTVyo+K8TZNcTVrjQhqqhhRfSJzNKzR5o=;
	b=pQ6jgvEBP6UY1wfqPCcxBxaEsbmfL+s/mZq29zngAjaWAM2o3wxzTsGi8KTVknJ1
	OegblfhMvFH1bWWbU54jozYbQv1hDYDVID83t+0nC07/9AE1eNOWGwc0a3TY6aBHbrN
	b9frLVsS5Nm5J674ejjOMuRWHSeL76CRlSy+mKZY=
Content-Type: multipart/mixed; boundary="===============5675038746495876487=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] mpg123: upgrading to 1.33.5 SUCCEEDED
Message-ID: <0101019de3ee856b-ff0c1acf-1d70-47ac-8041-1b93fdb7b6ca-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236285

--===============5675038746495876487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mpg123* to *1.33.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mpg123-upgrade-1.33.4-1.33.5.patch
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
From d28ab18366be76ec9ee08c1439b408a5b2d6cd68 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 13:03:04 +0000
Subject: [PATCH] mpg123: upgrade 1.33.4 -> 1.33.5

---
 .../mpg123/{mpg123_1.33.4.bb => mpg123_1.33.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.33.4.bb => mpg123_1.33.5.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb b/meta/recipes-multimedia/mpg123/mpg123_1.33.5.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.33.5.bb
index dd5f8a53f5..f8c08ad1f8 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.33.5.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "3ae8c9ff80a97bfc0e22e89fbcd74687eca4fc1db315b12607f27f01cb5a47d9"
+SRC_URI[sha256sum] = "0d7ebc8da0aff3ca383c8c6b5a6adbe402ee5bb256685b8c5499f3a739f9d6dd"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.47.1


--===============5675038746495876487==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mpg123-upgrade-1.33.4-1.33.5.patch"

RnJvbSBkMjhhYjE4MzY2YmU3NmVjOWVlMDhjMTQzOWI0MDhhNWIyZDZjZDY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAxMzowMzowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1w
ZzEyMzogdXBncmFkZSAxLjMzLjQgLT4gMS4zMy41CgotLS0KIC4uLi9tcGcxMjMve21wZzEyM18x
LjMzLjQuYmIgPT4gbXBnMTIzXzEuMzMuNS5iYn0gICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL21wZzEyMy97bXBnMTIzXzEuMzMuNC5iYiA9PiBtcGcxMjNfMS4zMy41
LmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9t
cGcxMjNfMS4zMy40LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvbXBnMTIzL21wZzEyM18x
LjMzLjUuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvbXBnMTIzL21wZzEyM18xLjMzLjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL21wZzEyMy9tcGcxMjNfMS4zMy41LmJiCmluZGV4IGRkNWY4YTUzZjUuLmY4YzA4
YWQxZjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9tcGcxMjNf
MS4zMy40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9tcGcxMjNfMS4z
My41LmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ0VOU0UgPSAiTEdQTC0yLjEtb25seSIKIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWU3YjljMTVmY2ZiOTg2YWJiNGNjNWU4
NDAwYTI0MTY5IgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3Lm1wZzEyMy5kZS9kb3dubG9hZC8k
e0JQfS50YXIuYnoyIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNhZThjOWZmODBhOTdiZmMwZTIy
ZTg5ZmJjZDc0Njg3ZWNhNGZjMWRiMzE1YjEyNjA3ZjI3ZjAxY2I1YTQ3ZDkiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiMGQ3ZWJjOGRhMGFmZjNjYTM4M2M4YzZiNWE2YWRiZTQwMmVlNWJiMjU2Njg1
YjhjNTQ5OWYzYTczOWY5ZDZkZCIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAibXBnMTIzLSg/
UDxwdmVyPlxkKyhcLlxkKykrKVwudGFyIgogCi0tIAoyLjQ3LjEKCg==

--===============5675038746495876487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mpg123: SRC_URI changed from "https://www.mpg123.de/download/mpg123-1.33.4.tar.bz2" to "https://www.mpg123.de/download/mpg123-1.33.5.tar.bz2"
packages/x86-64-v3-poky-linux/mpg123: PKGV changed from 1.33.4 [default] to 1.33.5 [default]
packages/x86-64-v3-poky-linux/mpg123: PV changed from "1.33.4" to "1.33.5"
packages/x86-64-v3-poky-linux/mpg123/mpg123-dbg: PKGSIZE changed from 2545064 to 2562080 (+1%)
packages/x86-64-v3-poky-linux/mpg123/mpg123-dbg: PKGV changed from 1.33.4 [default] to 1.33.5 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-dbg: PV changed from "1.33.4" to "1.33.5"
packages/x86-64-v3-poky-linux/mpg123/mpg123-dev: PKGV changed from 1.33.4 [default] to 1.33.5 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-dev: PV changed from "1.33.4" to "1.33.5"
packages/x86-64-v3-poky-linux/mpg123/mpg123-doc: PKGV changed from 1.33.4 [default] to 1.33.5 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-doc: PV changed from "1.33.4" to "1.33.5"
packages/x86-64-v3-poky-linux/mpg123/mpg123-locale: PKGV changed from 1.33.4 [default] to 1.33.5 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-locale: PV changed from "1.33.4" to "1.33.5"
packages/x86-64-v3-poky-linux/mpg123/mpg123-src: PKGSIZE changed from 1916492 to 1918131 (+0%)
packages/x86-64-v3-poky-linux/mpg123/mpg123-src: FILELIST: directory renamed /usr/src/debug/mpg123/1.33.4/src -> /usr/src/debug/mpg123/1.33.5/src, directory renamed /usr/src/debug/mpg123/1.33.4/src/libout123/modules -> /usr/src/debug/mpg123/1.33.5/src/libout123/modules, directory renamed /usr/src/debug/mpg123/1.33.4/src/compat -> /usr/src/debug/mpg123/1.33.5/src/compat, directory renamed /usr/src/debug/mpg123/1.33.4/src/common -> /usr/src/debug/mpg123/1.33.5/src/common, directory renamed /usr/src/debug/mpg123/1.33.4/src/libmpg123 -> /usr/src/debug/mpg123/1.33.5/src/libmpg123, directory renamed /usr/src/debug/mpg123/1.33.4/src/libout123 -> /usr/src/debug/mpg123/1.33.5/src/libout123, directory renamed /usr/src/debug/mpg123/1.33.4/src/libsyn123 -> /usr/src/debug/mpg123/1.33.5/src/libsyn123, directory renamed /usr/src/debug/mpg123/1.33.4/src/include -> /usr/src/debug/mpg123/1.33.5/src/include
packages/x86-64-v3-poky-linux/mpg123/mpg123-src: PKGV changed from 1.33.4 [default] to 1.33.5 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-src: PV changed from "1.33.4" to "1.33.5"
packages/x86-64-v3-poky-linux/mpg123/mpg123-staticdev: PKGV changed from 1.33.4 [default] to 1.33.5 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-staticdev: PV changed from "1.33.4" to "1.33.5"
packages/x86-64-v3-poky-linux/mpg123/mpg123: PKGSIZE changed from 1018383 to 1022479 (+0%)
packages/x86-64-v3-poky-linux/mpg123/mpg123: PKGV changed from 1.33.4 [default] to 1.33.5 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123: PV changed from "1.33.4" to "1.33.5"

--===============5675038746495876487==--

