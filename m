Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05FCCAC5A3
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:43 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.89803.1756850190808987158
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=vWDXUQZ4;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=kafEBlB4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101990c6ea936-b40405c4-653a-495e-8123-a54eeb435126-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850203;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3WZbvwRWpPzPX2rmb53wG+Etn8EVPLPbtQbi/+rlaL4=;
	b=vWDXUQZ42ZQAtySzHiGOBohPyC9Olh4JK6wAeATu2CJOubt9MFXiMZkfogfpQgVj
	2IjcJIfIoFk0M7782g018jwFxwg9Dcd5poQsQtDVFUP0qIwg06HXleEwaCMR0xlpTPk
	2BisP8MW+s5AS0owfKscquFx/TbhAjWsKvuja05o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850203;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3WZbvwRWpPzPX2rmb53wG+Etn8EVPLPbtQbi/+rlaL4=;
	b=kafEBlB4Sb77B3Ch8LE3BWH3esqw1h3cGXGdZbpy1cHpwrc9KbtySyZH6c0VWxBX
	4XKxhdAFHsZeArecags6cluwQiNYhjc0UBmNtACeXqa/gZjdm0tBycH/Nqma3fPOgYX
	4MN2FYqMzgVntrEy6F6GtmI6lNZTQBfqr15kEqK4=
Content-Type: multipart/mixed; boundary="===============0420000944217092910=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] mpg123: upgrading to 1.33.2 SUCCEEDED
Message-ID: <010101990c6ea936-b40405c4-653a-495e-8123-a54eeb435126-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222821

--===============0420000944217092910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mpg123* to *1.33.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mpg123-upgrade-1.33.0-1.33.2.patch
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
From eee0fe1487605468aa1344bfc213a92f8f32f86e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 21:06:39 +0000
Subject: [PATCH] mpg123: upgrade 1.33.0 -> 1.33.2

---
 .../mpg123/{mpg123_1.33.0.bb => mpg123_1.33.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.33.0.bb => mpg123_1.33.2.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.33.0.bb b/meta/recipes-multimedia/mpg123/mpg123_1.33.2.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.33.0.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.33.2.bb
index 2905bf0abc..23bb400ce5 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.33.0.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.33.2.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "2290e3aede6f4d163e1a17452165af33caad4b5f0948f99429cfa2d8385faa9d"
+SRC_URI[sha256sum] = "2c54fabbfa696dce8f9b137c8ef7a429a061f8fe633cd7d0a511809855f2c219"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.47.1


--===============0420000944217092910==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mpg123-upgrade-1.33.0-1.33.2.patch"

RnJvbSBlZWUwZmUxNDg3NjA1NDY4YWExMzQ0YmZjMjEzYTkyZjhmMzJmODZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAyMTowNjozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1w
ZzEyMzogdXBncmFkZSAxLjMzLjAgLT4gMS4zMy4yCgotLS0KIC4uLi9tcGcxMjMve21wZzEyM18x
LjMzLjAuYmIgPT4gbXBnMTIzXzEuMzMuMi5iYn0gICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL21wZzEyMy97bXBnMTIzXzEuMzMuMC5iYiA9PiBtcGcxMjNfMS4zMy4y
LmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9t
cGcxMjNfMS4zMy4wLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvbXBnMTIzL21wZzEyM18x
LjMzLjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvbXBnMTIzL21wZzEyM18xLjMzLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL21wZzEyMy9tcGcxMjNfMS4zMy4yLmJiCmluZGV4IDI5MDViZjBhYmMuLjIzYmI0
MDBjZTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9tcGcxMjNf
MS4zMy4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9tcGcxMjNfMS4z
My4yLmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ0VOU0UgPSAiTEdQTC0yLjEtb25seSIKIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWU3YjljMTVmY2ZiOTg2YWJiNGNjNWU4
NDAwYTI0MTY5IgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3Lm1wZzEyMy5kZS9kb3dubG9hZC8k
e0JQfS50YXIuYnoyIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjIyOTBlM2FlZGU2ZjRkMTYzZTFh
MTc0NTIxNjVhZjMzY2FhZDRiNWYwOTQ4Zjk5NDI5Y2ZhMmQ4Mzg1ZmFhOWQiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiMmM1NGZhYmJmYTY5NmRjZThmOWIxMzdjOGVmN2E0MjlhMDYxZjhmZTYzM2Nk
N2QwYTUxMTgwOTg1NWYyYzIxOSIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAibXBnMTIzLSg/
UDxwdmVyPlxkKyhcLlxkKykrKVwudGFyIgogCi0tIAoyLjQ3LjEKCg==

--===============0420000944217092910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mpg123: SRC_URI changed from "https://www.mpg123.de/download/mpg123-1.33.0.tar.bz2" to "https://www.mpg123.de/download/mpg123-1.33.2.tar.bz2"
packages/x86-64-v3-poky-linux/mpg123: PKGV changed from 1.33.0 [default] to 1.33.2 [default]
packages/x86-64-v3-poky-linux/mpg123: PV changed from "1.33.0" to "1.33.2"
packages/x86-64-v3-poky-linux/mpg123/mpg123-dbg: PKGSIZE changed from 2385352 to 2387896 (+0%)
packages/x86-64-v3-poky-linux/mpg123/mpg123-dbg: FILELIST: removed "/usr/lib/.debug/libmpg123.so.0.49.3", added "/usr/lib/.debug/libmpg123.so.0.49.4"
packages/x86-64-v3-poky-linux/mpg123/mpg123-dbg: PKGV changed from 1.33.0 [default] to 1.33.2 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-dbg: PV changed from "1.33.0" to "1.33.2"
packages/x86-64-v3-poky-linux/mpg123/mpg123-dev: PKGSIZE changed from 196987 to 197209 (+0%)
packages/x86-64-v3-poky-linux/mpg123/mpg123-dev: PKGV changed from 1.33.0 [default] to 1.33.2 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-dev: PV changed from "1.33.0" to "1.33.2"
packages/x86-64-v3-poky-linux/mpg123/mpg123-doc: PKGV changed from 1.33.0 [default] to 1.33.2 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-doc: PV changed from "1.33.0" to "1.33.2"
packages/x86-64-v3-poky-linux/mpg123/mpg123-locale: PKGV changed from 1.33.0 [default] to 1.33.2 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-locale: PV changed from "1.33.0" to "1.33.2"
packages/x86-64-v3-poky-linux/mpg123/mpg123-src: PKGV changed from 1.33.0 [default] to 1.33.2 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-src: PV changed from "1.33.0" to "1.33.2"
packages/x86-64-v3-poky-linux/mpg123/mpg123-staticdev: PKGV changed from 1.33.0 [default] to 1.33.2 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123-staticdev: PV changed from "1.33.0" to "1.33.2"
packages/x86-64-v3-poky-linux/mpg123/mpg123: FILELIST: removed "/usr/lib/libmpg123.so.0.49.3", added "/usr/lib/libmpg123.so.0.49.4"
packages/x86-64-v3-poky-linux/mpg123/mpg123: PKGV changed from 1.33.0 [default] to 1.33.2 [default]
packages/x86-64-v3-poky-linux/mpg123/mpg123: PV changed from "1.33.0" to "1.33.2"
Changes to packages/x86-64-v3-poky-linux/mpg123 (sysroot):
  /usr/lib/libmpg123.so.0 changed symlink target from libmpg123.so.0.49.3 to libmpg123.so.0.49.4
  /usr/lib/libmpg123.so changed symlink target from libmpg123.so.0.49.3 to libmpg123.so.0.49.4
  /usr/lib/libmpg123.so.0.49.3 moved to /usr/lib/libmpg123.so.0.49.4

--===============0420000944217092910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/mpg123/mpg123: FILELIST: removed "/usr/lib/libmpg123.so.0.49.3", added "/usr/lib/libmpg123.so.0.49.4"
Changes to packages/x86-64-v3-poky-linux/mpg123 (sysroot):
  /usr/lib/libmpg123.so.0 changed symlink target from libmpg123.so.0.49.3 to libmpg123.so.0.49.4
  /usr/lib/libmpg123.so changed symlink target from libmpg123.so.0.49.3 to libmpg123.so.0.49.4
  /usr/lib/libmpg123.so.0.49.3 moved to /usr/lib/libmpg123.so.0.49.4

--===============0420000944217092910==--

